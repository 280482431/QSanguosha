-- translation for WisdomPackage

local t = {
	["wisdom"] = "智包",
	["designer:wisdoms"] = "太阳神三国杀创意小组",

	["#wisxuyou"] = "恃才傲物",
	["wisxuyou"] = "智许攸",
	["illustrator:wisxuyou"] = "三国志大战",
	["juao"] = "倨傲",
	[":juao"] = "出牌阶段，你可以选择两张手牌背面向上移出游戏，指定一名角色，被指定的角色到下个回合开始阶段时，跳过摸牌阶段，得到你所移出游戏的两张牌。每阶段限一次",
	["hautain"] = "倨傲牌",
	["#JuaoObtain"] = "%from 得到了 %to 发动【%arg】移出游戏的两张牌",
	["tanlan"] = "贪婪",
	[":tanlan"] = "每当你受到一次伤害，可与伤害来源进行拼点：若你赢，你获得两张拼点牌",
	["shicai"] = "恃才",
	[":shicai"] = "<b>锁定技</b>，当你拼点成功时，摸一张牌",

	["#wisjiangwei"] = "天水麒麟",
	["wisjiangwei"] = "智姜维",
	["illustrator:wisjiangwei"] = "巴萨小马",
	["yicai"] = "异才",
	[":yicai"] = "每当你使用一张非延时类锦囊时(在它结算之前)，可立即对攻击范围内的角色使用一张【杀】",
	["beifa"] = "北伐",
	[":beifa"] = "<b>锁定技</b>，当你失去最后一张手牌时，视为对攻击范围内的一名角色使用了一张【杀】\
★北伐发动时，姜维必须一次做出决定：选择一名攻击范围内的角色（若攻击范围内没有角色，视为选择了自己），然后视为对该角色使用一张【杀】",

	["#wisjiangwan"] = "武侯后继",
	["wisjiangwan"] = "智蒋琬",
	["illustrator:wisjiangwan"] = "Zero",
	["houyuan"] = "后援",
	[":houyuan"] = "出牌阶段，你可以弃置两张手牌，指定一名其他角色摸两张牌，每阶段限一次",
	["chouliang"] = "筹粮",
	[":chouliang"] = "回合结束阶段开始时，若你手牌少于三张，你可以从牌堆顶亮出X张牌（X为4减当前手牌数），拿走其中的基本牌，把其余的牌置入弃牌堆",

	["#wissunce"] = "江东小霸王",
	["wissunce"] = "智孙策",
	["illustrator:wissunce"] = "永恒之轮",
	["bawang"] = "霸王",
	[":bawang"] = "当你使用的【杀】被【闪】响应时，你可以和对方拼点：若你赢，可以选择最多两个目标角色，视为对其分别使用了一张【杀】",
	["@bawang"] = "你可以指定1~2个看上去不爽的家伙为目标",
	["weidai"] = "危殆",
	[":weidai"] = "<b>主公技</b>，当你需要使用一张【酒】时，所有吴势力角色按行动顺序依次选择是否打出一张黑桃2~9的手牌，视为你使用了一张【酒】，直到有一名角色或没有任何角色决定如此做时为止",
--	["analeptic:accept"] = "打出一张黑桃2~9手牌响应【危殆】",
--	["analeptic:ignore"] = "我是打酱油的~",
	["@weidai"] = "你正徘徊在生死边缘，是否发动【危殆】？",
	["@weidai-analeptic"] = "%src 现在需要【酒】<br/>你只要打出一张 黑桃２~９的手牌<br/>就能为 %src 提供一张【酒】",

	["#wiszhangzhao"] = "东吴重臣",
	["wiszhangzhao"] = "智张昭",
	["illustrator:wiszhangzhao"] = "三国志大战",
	["longluo"] = "笼络",
	[":longluo"] = "回合结束阶段开始时，你可以选择一名其他角色摸取与你弃牌阶段弃牌数量相同的牌",
	["fuzuo"] = "辅佐",
	[":fuzuo"] = "当有角色拼点时，你可以打出一张点数小于8的手牌，让其中一名角色的拼点牌加上这张牌点数的二分之一（向下取整）",
	["fuzuo:cancel"] = "不发动",
	["$Fuzuo"] = "%from 打出了 %card 作为拼点干预牌，干预目标是 %to （拼点干预牌不影响原拼点牌）",
	["$Fuzuo_from"] = "%from 的拼点牌是 %card",
	["$Fuzuo_to"] = "%to 的拼点牌是 %card. 等待 %from 选择拼点干预目标",
	["@fuzuo_card"] = "请打出一张点数小于8的手牌来干预拼点",
	["jincui"] = "尽瘁",
	[":jincui"] = "当你死亡时，可令一名角色摸取或者弃置三张牌",
	["jincui:draw"] = "摸三张牌",
	["jincui:throw"] = "弃置三张牌",

	["#wishuaxiong"] = "心高命薄",
	["wishuaxiong"] = "智华雄",
	["illustrator:wishuaxiong"] = "三国志大战",
	["badao"] = "霸刀",
	[":badao"] = "当你成为黑色的【杀】目标时，你可以对你攻击范围内的一名其他角色使用一张【杀】",
	["wenjiu"] = "温酒",
	[":wenjiu"] = "<b>锁定技</b>，你使用黑色的【杀】造成的伤害+1，你无法闪避红色的【杀】",
	["#Wenjiu1"] = "%to 受到【温酒】技能的影响，%from 对其使用的红色杀不可闪避",
	["#Wenjiu2"] = "%from 的【温酒】技能被触发，伤害从 %arg 点上升至 %arg2 点",

	["#wistianfeng"] = "甘冒虎口",
	["wistianfeng"] = "智田丰",
	["illustrator:wistianfeng"] = "小矮米",
	["shipo"] = "识破",
	[":shipo"] = "任意角色判定阶段判定前，你可以弃置两张牌，获得该角色判定区里的所有牌",
	["gushou"] = "固守",
	[":gushou"] = "回合外，当你使用或打出一张基本牌时，可以摸一张牌",
	["yuwen"] = "狱刎",
	[":yuwen"] = "<b>锁定技</b>，当你死亡时，凶手视为自己",
	["#YuwenEffect"] = "%from 的锁定技【%arg】被触发，死亡视为自杀",

	["#wisshuijing"] = "水镜先生",
	["wisshuijing"] = "智司马徽",
	["illustrator:wisshuijing"] = "小仓",
	["shouye"] = "授业",
	[":shouye"] = "出牌阶段，你可以弃置一张红色手牌，指定最多两名其他角色各摸一张牌",
	["@shouye"] = "授业",
	["jiehuo"] = "解惑",
	[":jiehuo"] = "<b>觉醒技</b>，当你发动“授业”目标累计超过6个时，须减去一点体力上限，将技能“授业”改为每阶段限一次，并获得技能“师恩”（其他角色使用非延时锦囊时，可以让你摸一张牌）",
	["#JiehuoWake"] = "%from 的觉醒技【%arg】触发，以后你每阶段只能发动一次【%arg2】",
	["shien"] = "师恩",
	[":shien"] = "其他角色使用非延时锦囊时，可以让你摸一张牌",
	["forbid_shien"] = "水镜秘书",
	["forbid_shien:yes"] = "永久关闭【师恩】发动提示（不可逆操作）",
	["forbid_shien:no"] = "不关闭【师恩】发动提示",

-- effects
	["cv:wisxuyou"] = "庞小鸡",
	["$juao1"] = "用吾之计，敌克轻取~",
	["$juao2"] = "阿瞒，卿不得我，不得冀州也。", -- 对曹操
	["$tanlan1"] = "汝等小计，何足道哉", -- 发动拼点
	["$tanlan2"] = "匹夫尔敢如此", -- 拼点失败;拼点成功触发恃才
	["$shicai1"] = "真是不自量力！",
	["$shicai2"] = "莽夫，无可救药啊。", -- 贪婪触发
	["~wisxuyou"] = "汝等果然是无可救药~啊~",

	["cv:wisjiangwei"] = "Jr. Wakaran",
	["$yicai1"] = "系从尚父出，术奉武侯来。",
	["$yicai2"] = "天水麒麟儿，异才敌千军。",
	["$beifa1"] = "北伐兴蜀汉，继志越祁山",
	["$beifa2"]= "哀侯悲愤填心胸，九伐中原亦无悔。",
	["~wisjiangwei"] = "终究还是回天乏术吗？",

	["cv:wisjiangwan"] = "喵小林",
	["$houyuan"] = "汝等力战，吾定当稳固后方。",
	["$chouliang"] = "息民筹粮，伺机反攻。",
	["~wisjiangwan"] = "蜀中疲敝，无力辅政矣",

	["cv:wissunce"] = "裤衩",
	["$bawang1"] = "匹夫，可敢与我一较高下？", -- 提出拼点
	["$bawang2"] = "虎踞鹰扬，霸王之武。", -- 胜利
	["$bawang3"] = "来日再战，吾必胜汝。", -- 失败
	["$weidai1"] = "吾之将士，借我一臂之力！", -- 回合内发动
	["$weidai2"] = "我江东子弟何在？", -- 濒死时发动
	["~wissunce"] = "百战之躯，竟遭暗算……",

	["cv:wiszhangzhao"] = "喵小林",
	["$longluo1"] = "吾当助汝，共筑功勋。",
	["$longluo2"] = "江东多才俊，吾助主揽之。", -- 对孙权+孙策
	["$fuzuo1"] = "尽诚匡弼，成君之业。",
	["$fuzuo2"] = "此言，望吾主慎之重之。", -- 对孙权+孙策
	["$jincui1"] = "从吾之谏，功业可成。", -- 摸牌
	["$jincui2"] = "此人贼心昭著，当趋逐之。", -- 弃牌
	["~wiszhangzhao"] = "尽力辅佐，吾主为何……",

	["cv:wishuaxiong"] = "极光星逝",
	["$badao"] = "三合之内，吾必斩汝！",
	["$wenjiu1"] = "有末将在，何需温侯出马？", -- 触发黑色杀
	["$wenjiu2"] = "好快……", -- 触发红色杀（凄惨点）
	["~wishuaxiong"] = "来将何人……啊……",

	["cv:wistianfeng"] = "喵小林",
	["$gushou1"] = "外结英雄，内修农战。", -- 失去闪 桃 酒
	["$gushou2"] = "奇兵迭出，扰敌疲兵。", -- 失去杀
	["$shipo1"] = "此中有诈，吾当出计破之。",
	["$shipo2"] = "休要蒙蔽我主！", -- 对主公袁绍
	["$yuwen"] = "吾当自死，不劳明公动手。",
	["~wistianfeng"] = "不识其主，虽死何惜。",

	["cv:wisshuijing"] = "喵小林",
	["$shouye1"] = "授汝等之策，自可平定天下。", -- 用红桃
	["$shouye2"] = "为天下太平，还望汝等尽力。", -- 用方片
	["$jiehuo"] = "桃李满天下，吾可归隐矣。",
	["$shien1"] = "吾师教诲，终身不忘。",
	["$shien2"] = "龙凤之才，全赖吾师。", -- 龙凤发动师恩
	["~wisshuijing"] = "儒生俗士，终究难平天下吗？",
}

local generals = {"wisxuyou", "wisjiangwei", "wisjiangwan", "wissunce", "wiszhangzhao", "wishuaxiong", "wistianfeng", "wisshuijing"}

for _, general in ipairs(generals) do
	t["designer:" .. general] = t["designer:wisdoms"]
end

return t
