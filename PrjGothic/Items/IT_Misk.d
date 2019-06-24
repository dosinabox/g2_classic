
const int VALUE_SWORDBLADE = 10;
const int VALUE_SWORDBLADEHOT = 10;
const int VALUE_SWORDRAWHOT = 10;
const int VALUE_SWORDRAW = 10;
const int VALUE_BRUSH = 3;
const int VALUE_FLASK = 3;
const int VALUE_STOMPER = 3;
const int VALUE_PAN = 20;
const int VALUE_SAW = 20;
const int VALUE_BROOM = 10;
const int VALUE_RAKE = 10;
const int VALUE_HAMMER = 10;
const int VALUE_SCOOP = 3;
const int VALUE_NUGGET = 200;
const int VALUE_JOINT = 30;
const int VALUE_ALARMHORN = 10;
const int VALUE_LUTE = 10;
const int VALUE_GOLD = 1;
const int VALUE_RUNEBLANK = 100;
const int VALUE_SULFUR = 20;
const int VALUE_QUARTZ = 20;
const int VALUE_PITCH = 10;
const int VALUE_ROCKCRYSTAL = 30;
const int VALUE_AQUAMARINE = 100;
const int VALUE_HOLYWATER = 20;
const int VALUE_COAL = 15;
const int VALUE_DARKPEARL = 1000;
const int VALUE_ITMI_APFELTABAK = 10;
const int VALUE_ITMI_PILZTABAK = 10;
const int VALUE_ITMI_SUMPFTABAK = 10;
const int VALUE_ITMI_DOPPELTABAK = 10;
const int VALUE_ITMI_HONIGTABAK = 10;
const int VALUE_SILVERRING = 120;
const int VALUE_SILVERNECKLACE = 200;
const int VALUE_SILVERCANDLEHOLDER = 50;
const int VALUE_SILVERPLATE = 100;
const int VALUE_SILVERCUP = 100;
const int VALUE_SILVERCHALICE = 250;
const int VALUE_GOLDPLATE = 200;
const int VALUE_GOLDRING = 250;
const int VALUE_GOLDNECKLACE = 300;
const int VALUE_GOLDCANDLEHOLDER = 120;
const int VALUE_GOLDCUP = 350;
const int VALUE_BLOODCUP = 200;
const int VALUE_GOLDCHALICE = 500;
const int VALUE_GOLDCHEST = 750;
const int VALUE_JEWELERYCHEST = 1000;
const int VALUE_INNOSSTATUE = 100;
const int VALUE_SEXTANT = 1500;

instance ITMI_STOMPER(C_ITEM)
{
	name = "Давилка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_STOMPER;
	visual = "ItMi_Stomper.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_RUNEBLANK(C_ITEM)
{
	name = "Руна";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RUNEBLANK;
	visual = "ItMi_RuneBlank.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_PLIERS(C_ITEM)
{
	name = "Щипцы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RUNEBLANK;
	visual = "ItMi_Pliers.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_FLASK(C_ITEM)
{
	name = "Мензурка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_FLASK;
	visual = "ItMi_Flask.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_HAMMER(C_ITEM)
{
	name = "Молот";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_HAMMER;
	visual = "ItMi_Hammer.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SCOOP(C_ITEM)
{
	name = "Ложка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SCOOP;
	visual = "ItMi_Scoop.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_PAN(C_ITEM)
{
	name = "Сковорода";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_PAN;
	visual = "ItMi_Pan.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_PANFULL(C_ITEM)
{
	name = "Сковорода";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_PAN;
	visual = "ItMi_PanFull.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SAW(C_ITEM)
{
	name = "Пила";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SAW;
	visual = "ItMi_Saw.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMISWORDRAW(C_ITEM)
{
	name = "Сырая сталь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SWORDRAW;
	visual = "ItMiSwordraw.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMISWORDRAWHOT(C_ITEM)
{
	name = "Раскаленная сталь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SWORDRAWHOT;
	visual = "ItMiSwordrawhot.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMISWORDBLADEHOT(C_ITEM)
{
	name = "Раскаленный клинок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SWORDBLADEHOT;
	visual = "ItMiSwordbladehot.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMISWORDBLADE(C_ITEM)
{
	name = "Клинок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SWORDBLADE;
	visual = "ItMiSwordblade.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_RAKE(C_ITEM)
{
	name = "Тяпка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_RAKE;
	visual = "ItMi_Rake.3DS";
	material = MAT_WOOD;
	scemename = "RAKE";
	on_state[0] = use_rake;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_rake()
{
};


instance ITMI_BROOM(C_ITEM)
{
	name = "Метла";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BROOM;
	visual = "ItMi_Broom.3DS";
	material = MAT_WOOD;
	scemename = "BROOM";
	on_state[0] = use_broom;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_broom()
{
	if(Npc_IsPlayer(self) && (Wld_GetPlayerPortalGuild() == GIL_NOV) && (MIS_PARLANFEGEN == LOG_RUNNING))
	{
		b_say(self,self,"$NOSWEEPING");
		Print(PRINT_NOSWEEPING);
	};
};


instance ITMI_LUTE(C_ITEM)
{
	name = "Лютня";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_LUTE;
	visual = "ItMi_Lute.3DS";
	material = MAT_WOOD;
	scemename = "LUTE";
	on_state[0] = use_lute;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_lute()
{
};


instance ITMI_BRUSH(C_ITEM)
{
	name = "Щетка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_BRUSH;
	visual = "ItMi_Brush.3ds";
	material = MAT_WOOD;
	scemename = "BRUSH";
	on_state[0] = use_brush;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_brush()
{
};


instance ITMI_JOINT(C_ITEM)
{
	name = "Косяк из болотной травы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_JOINT;
	visual = "ItMi_Joint_US.3ds";
	material = MAT_LEATHER;
	scemename = "JOINT";
	on_state[0] = use_joint;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};


func void use_joint()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
	};
};


instance ITMI_PACKET(C_ITEM)
{
	name = "Пакет";
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 0;
	visual = "ItMi_Packet.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usepacket()
{
};


instance ITMI_POCKET(C_ITEM)
{
	name = "Кожаный кошелек";
	mainflag = ITEM_KAT_NONE | ITEM_MULTI;
	flags = 0;
	value = 10;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = usepocket;
	description = name;
	text[2] = "Небольшой мешочек,";
	text[3] = "не очень тяжелый.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usepocket()
{
	CreateInvItems(hero,itmi_gold,10);
	Print(PRINT_FOUNDGOLD10);
	Snd_Play("Geldbeutel");
};


instance ITMI_NUGGET(C_ITEM)
{
	name = "Кусок руды";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_NUGGET;
	visual = "ItMi_Nugget.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_GOLD(C_ITEM)
{
	name = "Золото";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLD;
	visual = "ItMi_Gold.3DS";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_OLDCOIN(C_ITEM)
{
	name = "Старая монета";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_OldCoin.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_GOLDCANDLEHOLDER(C_ITEM)
{
	name = "Золотой подсвечник";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDCANDLEHOLDER;
	visual = "ItMi_GoldCandleHolder.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GOLDNECKLACE(C_ITEM)
{
	name = "Золотое ожерелье";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_AMULET;
	value = VALUE_GOLDNECKLACE;
	visual = "ItMi_GoldNecklace.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

instance ITMI_SILVERRING(C_ITEM)
{
	name = "Серебряное кольцо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_RING;
	value = VALUE_SILVERRING;
	visual = "ItMi_SilverRing.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ITMI_SILVERCUP(C_ITEM)
{
	name = "Серебряный кубок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SILVERCUP;
	visual = "ItMi_SilverCup.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SILVERPLATE(C_ITEM)
{
	name = "Серебряная тарелка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SILVERPLATE;
	visual = "ItMi_SilverPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GOLDPLATE(C_ITEM)
{
	name = "Золотая тарелка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDPLATE;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GOLDCUP(C_ITEM)
{
	name = "Золотой кубок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDCUP;
	visual = "ItMi_GoldCup.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_BLOODCUP_MIS(C_ITEM)
{
	name = "Кровавый кубок";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_BLOODCUP;
	visual = "ItMi_GoldCup.3DS";
	material = MAT_METAL;
	description = "Кровавый кубок";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GOLDRING(C_ITEM)
{
	name = "Золотое кольцо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_RING;
	value = VALUE_GOLDRING;
	visual = "ItMi_GoldRing.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ITMI_SILVERCHALICE(C_ITEM)
{
	name = "Серебряная чаша";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SILVERCHALICE;
	visual = "ItMi_SilverChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_JEWELERYCHEST(C_ITEM)
{
	name = "Шкатулка с драгоценностями";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_JEWELERYCHEST;
	visual = "ItMi_JeweleryChest.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GOLDCHALICE(C_ITEM)
{
	name = "Золотая чаша";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDCHALICE;
	visual = "ItMi_GoldChalice.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_GOLDCHEST(C_ITEM)
{
	name = "Шкатулка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDCHEST;
	visual = "ItMi_GoldChest.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_INNOSSTATUE(C_ITEM)
{
	name = "Статуя Инноса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_INNOSSTATUE;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SEXTANT(C_ITEM)
{
	name = "Секстант";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SEXTANT;
	visual = "ItMi_Sextant.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SILVERCANDLEHOLDER(C_ITEM)
{
	name = "Серебряный подсвечник";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SILVERCANDLEHOLDER;
	visual = "ItMi_SilverCandleHolder.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SILVERNECKLACE(C_ITEM)
{
	name = "Серебряное ожерелье";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_AMULET;
	value = VALUE_SILVERNECKLACE;
	visual = "ItMi_SilverNecklace.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SULFUR(C_ITEM)
{
	name = "Сера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SULFUR;
	visual = "ItMi_Sulfur.3DS";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC2_STANDARD;
};

instance ITMI_QUARTZ(C_ITEM)
{
	name = "Ледяной кварц";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_QUARTZ;
	visual = "ItMi_Quartz.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
};

instance ITMI_PITCH(C_ITEM)
{
	name = "Смола";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_PITCH;
	visual = "ItMi_Pitch.3DS";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_ROCKCRYSTAL(C_ITEM)
{
	name = "Горный хрусталь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_ROCKCRYSTAL;
	visual = "ItMi_Rockcrystal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_AQUAMARINE(C_ITEM)
{
	name = "Аквамарин";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_AQUAMARINE;
	visual = "ItMi_Aquamarine.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_HOLYWATER(C_ITEM)
{
	name = "Святая вода";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_HOLYWATER;
	visual = "ItMi_HolyWater.3ds";
	material = MAT_GLAS;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_COAL(C_ITEM)
{
	name = "Уголь";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_COAL;
	visual = "ItMi_Coal.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_DARKPEARL(C_ITEM)
{
	name = "Черный жемчуг";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_DARKPEARL;
	visual = "ItMi_DarkPearl.3ds";
	material = MAT_STONE;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_MISC_STANDARD;
};

instance ITMI_APFELTABAK(C_ITEM)
{
	name = "Яблочный табак";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = value_itmi_apfeltabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Кисет с яблочным табаком.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_PILZTABAK(C_ITEM)
{
	name = "Грибной табак";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = value_itmi_pilztabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Темный яблочно-грибной табак";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_DOPPELTABAK(C_ITEM)
{
	name = "Двойное яблоко";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = value_itmi_doppeltabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "На вкус похоже на яблоко...";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_HONIGTABAK(C_ITEM)
{
	name = "Медовый табак";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = value_itmi_honigtabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Сладкий яблочный табак";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_SUMPFTABAK(C_ITEM)
{
	name = "Травяной табак";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = value_itmi_sumpftabak;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Смесь из болотной травы";
	text[5] = NAME_VALUE;
	count[5] = value;
};

