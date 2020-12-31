
const int VALUE_WEED = 0;
const int VALUE_BEET = 3;
const int HP_BEET = 2;
const int VALUE_SWAMPHERB = 10;
const int VALUE_MANA_HERB_01 = 10;
const int MANA_MANA_HERB_01 = 10;
const int VALUE_MANA_HERB_02 = 20;
const int MANA_MANA_HERB_02 = 15;
const int VALUE_MANA_HERB_03 = 40;
const int MANA_MANA_HERB_03 = 20;
const int VALUE_HEALTH_HERB_01 = 20;
const int HP_HEALTH_HERB_01 = 10;
const int VALUE_HEALTH_HERB_02 = 40;
const int HP_HEALTH_HERB_02 = 20;
const int VALUE_HEALTH_HERB_03 = 60;
const int HP_HEALTH_HERB_03 = 30;
const int VALUE_DEX_HERB_01 = 250;
const int VALUE_STRENGTH_HERB_01 = 500;
const int VALUE_SPEED_HERB_01 = 100;
const int SPEED_BOOST = 15000;
const int VALUE_MUSHROOM_01 = 10;
const int HP_MUSHROOM_01 = 5;
const int VALUE_MUSHROOM_02 = 30;
const int HP_MUSHROOM_02 = 15;
const int VALUE_FORESTBERRY = 10;
const int HP_FORESTBERRY = 5;
const int VALUE_BLUEPLANT = 10;
const int HP_BLUEPLANT = 5;
const int MANA_BLUEPLANT = 5;
const int VALUE_PLANEBERRY = 10;
const int HP_PLANEBERRY = 5;
const int VALUE_TEMP_HERB = 100;
const int HP_TEMP_HERB = 5;
const int VALUE_PERM_HERB = 500;
const int HP_PERM_HERB = 5;

instance ITPL_WEED(C_ITEM)
{
	name = "Сорняки";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_WEED;
	visual = "ItPl_Weed.3ds";
	material = MAT_LEATHER;
	scemename = "FOOD";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITPL_BEET(C_ITEM)
{
	name = "Репа";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BEET;
	visual = "ItPl_Beet.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_beet;
	scemename = "FOOD";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_beet()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BEET);
};


instance ITPL_SWAMPHERB(C_ITEM)
{
	name = "Болотная трава";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SWAMPHERB;
	visual = "ItPl_SwampHerb.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_swampherb;
	scemename = "FOOD";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_swampherb()
{
	if(Npc_IsPlayer(self))
	{
		Wld_PlayEffect("SLOW_TIME",self,self,0,0,0,FALSE);
	};
};


instance ITPL_MANA_HERB_01(C_ITEM)
{
	name = "Огненная крапива";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MANA_HERB_01;
	visual = "ItPl_Mana_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_mana_herb_01;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_MANA_HERB_01;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_mana_herb_01()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_MANA_HERB_01);
};


instance ITPL_MANA_HERB_02(C_ITEM)
{
	name = "Огненная трава";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MANA_HERB_02;
	visual = "ItPl_Mana_Herb_02.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_mana_herb_02;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_MANA_HERB_02;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_mana_herb_02()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_MANA_HERB_02);
};


instance ITPL_MANA_HERB_03(C_ITEM)
{
	name = "Огненный корень";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MANA_HERB_03;
	visual = "ItPl_Mana_Herb_03.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_mana_herb_03;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_MANA_HERB_03;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_mana_herb_03()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_MANA_HERB_03);
};


instance ITPL_HEALTH_HERB_01(C_ITEM)
{
	name = "Лечебная трава";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HEALTH_HERB_01;
	visual = "ItPl_Health_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_health_herb_01;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_HEALTH_HERB_01;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_health_herb_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HEALTH_HERB_01);
};


instance ITPL_HEALTH_HERB_02(C_ITEM)
{
	name = "Лечебное растение";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HEALTH_HERB_02;
	visual = "ItPl_Health_Herb_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_health_herb_02;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_HEALTH_HERB_02;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_health_herb_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HEALTH_HERB_02);
};


instance ITPL_HEALTH_HERB_03(C_ITEM)
{
	name = "Лечебный корень";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_HEALTH_HERB_03;
	visual = "ItPl_Health_Herb_03.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_health_herb_03;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_HEALTH_HERB_03;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_health_herb_03()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HEALTH_HERB_03);
};


instance ITPL_DEX_HERB_01(C_ITEM)
{
	name = "Гоблинская ягода";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_DEX_HERB_01;
	visual = "ItPl_Dex_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_dex_herb_01;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_DEX;
	count[1] = 1;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_dex_herb_01()
{
	TotalDexEaten += 1;
	b_raiseattribute(self,ATR_DEXTERITY,1);
};


instance ITPL_STRENGTH_HERB_01(C_ITEM)
{
	name = "Драконий корень";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STRENGTH_HERB_01;
	visual = "ItPl_Strength_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_strength_herb_01;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_STR;
	count[1] = 1;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_strength_herb_01()
{
	TotalStrEaten += 1;
	b_raiseattribute(self,ATR_STRENGTH,1);
};


instance ITPL_SPEED_HERB_01(C_ITEM)
{
	name = "Снеппер-трава";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SPEED_HERB_01;
	visual = "ItPl_Speed_Herb_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_speed_herb_01;
	scemename = "FOOD";
	text[3] = NAME_SEC_DURATION;
	count[3] = SPEED_BOOST / 1000;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_speed_herb_01()
{
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",SPEED_BOOST);
};


instance ITPL_MUSHROOM_01(C_ITEM)
{
	name = "Черный гриб";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MUSHROOM_01;
	visual = "ItPl_Mushroom_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_mushroom_01;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_MUSHROOM_01;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_mushroom_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MUSHROOM_01);
	if(Npc_IsPlayer(self))
	{
		DUNKELPILZ_BONUS = DUNKELPILZ_BONUS + 1;
		if(DUNKELPILZ_BONUS == 50)
		{
			b_raiseattribute(self,ATR_MANA_MAX,10);
			Snd_Play("LEVELUP");
		};
	};
};


instance ITPL_MUSHROOM_02(C_ITEM)
{
	name = "Пища рудокопа";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_MUSHROOM_02;
	visual = "ItPl_Mushroom_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_mushroom_02;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_MUSHROOM_02;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_mushroom_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_MUSHROOM_02);
};


instance ITPL_BLUEPLANT(C_ITEM)
{
	name = "Синяя бузина";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_BLUEPLANT;
	visual = "ItPl_Blueplant.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_blueplant;
	scemename = "FOOD";
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_BLUEPLANT;
	text[2] = NAME_BONUS_MANA;
	count[2] = MANA_BLUEPLANT;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_blueplant()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_BLUEPLANT);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_BLUEPLANT);
};


instance ITPL_FORESTBERRY(C_ITEM)
{
	name = "Лесная ягода";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_FORESTBERRY;
	visual = "ItPl_Forestberry.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_forestberry;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_FORESTBERRY;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_forestberry()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_FORESTBERRY);
};


instance ITPL_PLANEBERRY(C_ITEM)
{
	name = "Луговая ягода";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_PLANEBERRY;
	visual = "ItPl_Planeberry.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_planeberry;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_PLANEBERRY;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_planeberry()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_PLANEBERRY);
};


instance ITPL_TEMP_HERB(C_ITEM)
{
	name = "Луговой горец";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_TEMP_HERB;
	visual = "ItPl_Temp_Herb.3ds";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_temp_herb;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_TEMP_HERB;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_temp_herb()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_TEMP_HERB);
};


instance ITPL_PERM_HERB(C_ITEM)
{
	name = "Царский щавель";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_PERM_HERB;
	visual = "ItPl_Perm_Herb.3ds";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_perm_herb;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_PERM_HERB;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_perm_herb()
{
	TotalPermEaten += 1;
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_PERM_HERB);
};

