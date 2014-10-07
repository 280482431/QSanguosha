/********************************************************************
    Copyright (c) 2013-2014 - QSanguosha-Rara

    This file is part of QSanguosha-Hegemony.

    This game is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License as
    published by the Free Software Foundation; either version 3.0
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    General Public License for more details.

    See the LICENSE file for more details.

    QSanguosha-Rara
    *********************************************************************/

#include "server.h"
#include "nativesocket.h"
#include "clientstruct.h"
#include "engine.h"
#include "settings.h"
#include "lobbyplayer.h"
#include "json.h"
#include "miniscenarios.h"

#include <QApplication>

using namespace QSanProtocol;

QHash<CommandType, Server::LobbyFunction> Server::lobbyFunctions;
QHash<CommandType, Server::RoomFunction> Server::roomFunctions;

Server::Server(QObject *parent, Role role)
    : QObject(parent),  role(role), server(new NativeServerSocket), lobby(NULL)
{
    server->setParent(this);

    if (lobbyFunctions.isEmpty())
        initLobbyFunctions();

    if (roomFunctions.isEmpty())
        initRoomFunctions();

    ServerInfo.parse(Sanguosha->getSetupString());

    connect(server, SIGNAL(new_connection(ClientSocket *)), this, SLOT(processNewConnection(ClientSocket *)));
    connect(qApp, SIGNAL(aboutToQuit()), this, SLOT(deleteLater()));
}

void Server::broadcastSystemMessage(const QString &message)
{
    JsonArray body;
    body << ".";
    body << message;

    Packet packet(S_SRC_LOBBY | S_TYPE_NOTIFICATION | S_DEST_CLIENT | S_DEST_ROOM, S_COMMAND_SPEAK);
    packet.setMessageBody(body);
    broadcast(&packet);
}

void Server::broadcastNotification(CommandType command, const QVariant &data, int destination)
{
    Packet packet(S_SRC_LOBBY | S_TYPE_NOTIFICATION | destination, command);
    packet.setMessageBody(data);
    broadcast(&packet);
}

void Server::broadcast(const AbstractPacket *packet)
{
    PacketDescription destination = packet->getPacketDestination();
    if (destination & S_DEST_CLIENT) {
        foreach (LobbyPlayer *player, lobbyPlayers)
            player->unicast(packet->toJson());
    }

    if (destination & S_DEST_ROOM) {
        QMapIterator<ClientSocket *, QVariant> iter(remoteRooms);
        while (iter.hasNext()) {
            ClientSocket *socket = iter.key();
            socket->send(packet->toJson());
        }

        foreach(Room *room, rooms)
            room->broadcast(packet);
    }
}

void Server::cleanup() {
    ClientSocket *socket = qobject_cast<ClientSocket *>(sender());
    if (Config.ForbidSIMC)
        addresses.removeOne(socket->peerAddress());

    socket->deleteLater();
}

void Server::notifyClient(ClientSocket *socket, CommandType command, const QVariant &arg)
{
    Packet packet(S_SRC_LOBBY | S_TYPE_NOTIFICATION | S_DEST_CLIENT, command);
    packet.setMessageBody(arg);
    socket->send(packet.toJson());
}

void Server::processNewConnection(ClientSocket *socket)
{
    QString address = socket->peerAddress();
    if (Config.ForbidSIMC) {
        if (addresses.contains(address)) {
            addresses.append(address);
            socket->disconnectFromHost();
            emit serverMessage(tr("Forbid the connection of address %1").arg(address));
            return;
        } else {
            addresses.append(address);
        }
    }

    if (Config.value("BannedIP").toStringList().contains(address)){
        socket->disconnectFromHost();
        emit serverMessage(tr("Forbid the connection of address %1").arg(address));
        return;
    }

    connect(socket, SIGNAL(disconnected()), this, SLOT(cleanup()));
    notifyClient(socket, S_COMMAND_CHECK_VERSION, Sanguosha->getVersion());

    emit serverMessage(tr("%1 connected").arg(socket->peerName()));
    connect(socket, SIGNAL(message_got(QByteArray)), this, SLOT(processMessage(QByteArray)));
}

void Server::processMessage(const QByteArray &message)
{
    ClientSocket *socket = qobject_cast<ClientSocket *>(sender());
    if (socket == NULL) return;

    Packet packet;
    if (!packet.parse(message)) {
        emit serverMessage(tr("%1 Invalid message %2").arg(socket->peerName()).arg(QString::fromUtf8(message)));
        return;
    }

    switch (packet.getPacketSource()) {
    case S_SRC_CLIENT:
        processClientSignup(socket, packet);
        break;
    case S_SRC_ROOM:
        processRoomPacket(socket, packet);
        break;
    case S_SRC_LOBBY:
        if (socket == lobby) {
            processLobbyPacket(packet);
        }
        break;
    default:
        emit serverMessage(tr("%1 Packet %2 with an unknown source is discarded").arg(socket->peerName()).arg(QString::fromUtf8(message)));
    }
}

void Server::processClientSignup(ClientSocket *socket, const Packet &signup)
{
    socket->disconnect(this, SLOT(processMessage(QByteArray)));

    if (signup.getCommandType() != S_COMMAND_SIGNUP) {
        emit serverMessage(tr("%1 Invalid signup string: %2").arg(socket->peerName()).arg(signup.toString()));
        notifyClient(socket, S_COMMAND_WARN, "INVALID_FORMAT");
        socket->disconnectFromHost();
        return;
    }

    JsonArray body = signup.getMessageBody().value<JsonArray>();
    bool is_reconnection = body[0].toBool();
    QString screen_name = body[1].toString();
    QString avatar = body[2].toString();

    if (is_reconnection) {
        foreach (QString objname, name2objname.values(screen_name)) {
            ServerPlayer *player = players.value(objname);
            if (player && player->getState() == "offline" && !player->getRoom()->isFinished()) {
                notifyClient(socket, S_COMMAND_SETUP, Sanguosha->getSetupString());
                player->getRoom()->reconnect(player, socket);
                return;
            }
        }
    }

    if (role == RoomRole) {
        notifyClient(socket, S_COMMAND_SETUP, Sanguosha->getSetupString());

        if (current == NULL || current->isFull() || current->isFinished())
            createNewRoom();

        ServerPlayer *player = current->addSocket(socket);
        current->signup(player, screen_name, avatar, false);
        emit newPlayer(player);

        if (current->getPlayers().length() == 1 && current->getScenario() && current->getScenario()->objectName() == "jiange_defense") {
            for (int i = 0; i < 4; ++i)
                current->addRobotCommand(player, QVariant());
        }

    } else {
        notifyClient(socket, S_COMMAND_ENTER_LOBBY);

        LobbyPlayer *player = new LobbyPlayer(this);
        player->setSocket(socket);
        player->setScreenName(screen_name);
        player->setAvatar(avatar);
        lobbyPlayers << player;

        connect(player, SIGNAL(errorMessage(QString)), SIGNAL(serverMessage(QString)));
        connect(player, SIGNAL(disconnected()), SLOT(cleanupLobbyPlayer()));

        emit serverMessage(tr("%1 logged in as Player %2").arg(socket->peerName()).arg(screen_name));

        player->notify(S_COMMAND_ROOM_LIST, getRoomList());
    }
}
