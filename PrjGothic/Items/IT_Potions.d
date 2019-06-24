
const int VALUE_HPESSENZ = 25;
const int HP_ESSENZ = 50;
const int VALUE_HPEXTRAKT = 35;
const int HP_EXTRAKT = 70;
const int VALUE_HPELIXIER = 50;
const int HP_ELIXIER = 100;
const int VALUE_MANAESSENZ = 25;
const int MANA_ESSENZ = 50;
const int VALUE_MANAEXTRAKT = 40;
const int MANA_EXTRAKT = 75;
const int VALUE_MANAELIXIER = 60;
const int MANA_ELIXIER = 100;
const int VALUE_STRELIXIER = 800;
const int STR_ELIXIER = 5;
const int VALUE_DEXELIXIER = 800;
const int DEX_ELIXIER = 5;
const int VALUE_HPMAXELIXIER = 1500;
const int HPMAX_ELIXIER = 15;
const int VALUE_MANAMAXELIXIER = 1500;
const int MANAMAX_ELIXIER = 10;
const int VALUE_MEGADRINK = 1800;
const int STRORDEX_MEGADRINK = 15;
const int VALUE_SPEED = 200;
const int TIME_SPEED = 300000;

instance ITPO_MANA_01(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAESSENZ;
	visual = "ItPo_Mana_01.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_mana_01;
	scemename = "POTIONFAST";
	description = "Ёссенци€ маны";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAESSENZ;
};


func void useitpo_mana_01()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_ESSENZ);
};


instance ITPO_MANA_02(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAEXTRAKT;
	visual = "ItPo_Mana_02.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_mana_02;
	scemename = "POTIONFAST";
	description = "Ёкстракт маны";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_EXTRAKT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAEXTRAKT;
};


func void useitpo_mana_02()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_EXTRAKT);
};


instance ITPO_MANA_03(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAELIXIER;
	visual = "ItPo_Mana_03.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_mana_03;
	scemename = "POTIONFAST";
	description = "Ёликсир маны";
	text[1] = NAME_BONUS_MANA;
	count[1] = MANA_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAELIXIER;
};


func void useitpo_mana_03()
{
	Npc_ChangeAttribute(self,ATR_MANA,MANA_ELIXIER);
};


instance ITPO_HEALTH_01(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPESSENZ;
	visual = "ItPo_Health_01.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_health_01;
	scemename = "POTIONFAST";
	description = "Ћечебна€ эссенци€";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void useitpo_health_01()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
};


instance ITPO_HEALTH_02(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPEXTRAKT;
	visual = "ItPo_Health_02.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_health_02;
	scemename = "POTIONFAST";
	description = "Ћечебный экстракт";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_EXTRAKT;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPEXTRAKT;
};


func void useitpo_health_02()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_EXTRAKT);
};


instance ITPO_HEALTH_03(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPELIXIER;
	visual = "ItPo_Health_03.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_health_03;
	scemename = "POTIONFAST";
	description = "Ћечебный эликсир";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPELIXIER;
};


func void useitpo_health_03()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ELIXIER);
};


instance ITPO_PERM_STR(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_STRELIXIER;
	visual = "ItPo_Perm_STR.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_perm_str;
	scemename = "POTIONFAST";
	description = "Ёликсир силы";
	text[1] = NAME_BONUS_STR;
	count[1] = STR_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STRELIXIER;
};


func void useitpo_perm_str()
{
	b_raiseattribute(self,ATR_STRENGTH,STR_ELIXIER);
};


instance ITPO_PERM_DEX(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_DEXELIXIER;
	visual = "ItPo_Perm_DEX.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_perm_dex;
	scemename = "POTIONFAST";
	description = "Ёликсир ловкости";
	text[1] = NAME_BONUS_DEX;
	count[1] = DEX_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_DEXELIXIER;
};


func void useitpo_perm_dex()
{
	b_raiseattribute(self,ATR_DEXTERITY,DEX_ELIXIER);
};


instance ITPO_PERM_HEALTH(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPMAXELIXIER;
	visual = "ItPo_Perm_Health.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_perm_health;
	scemename = "POTIONFAST";
	description = "Ёликсир жизни";
	text[1] = NAME_BONUS_HPMAX;
	count[1] = HPMAX_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPMAXELIXIER;
};


func void useitpo_perm_health()
{
	b_raiseattribute(self,ATR_HITPOINTS_MAX,HPMAX_ELIXIER);
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HPMAX_ELIXIER);
};


instance ITPO_PERM_MANA(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MANAMAXELIXIER;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_perm_mana;
	scemename = "POTIONFAST";
	description = "Ёликсир духа";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = MANAMAX_ELIXIER;
	text[5] = NAME_VALUE;
	count[5] = VALUE_MANAMAXELIXIER;
};


func void useitpo_perm_mana()
{
	b_raiseattribute(self,ATR_MANA_MAX,MANAMAX_ELIXIER);
	Npc_ChangeAttribute(self,ATR_MANA,MANAMAX_ELIXIER);
};


instance ITPO_SPEED(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_SPEED;
	visual = "ItPo_Speed.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_speed;
	scemename = "POTIONFAST";
	description = "«елье ускорени€";
	text[1] = "¬ременно повышает скорость.";
	text[3] = NAME_DURATION;
	count[3] = TIME_SPEED / 60000;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_speed()
{
	Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",TIME_SPEED);
};


instance ITPO_MEGADRINK(C_ITEM)
{
	name = "Ёмбарла фиргасто";
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_MEGADRINK;
	visual = "ItPo_Perm_Mana.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_megadrink;
	scemename = "POTIONFAST";
	description = name;
	text[3] = "Ёффект неизвестен.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_megadrink()
{
	if(self.attribute[ATR_STRENGTH] < self.attribute[ATR_DEXTERITY])
	{
		b_raiseattribute(self,ATR_DEXTERITY,STRORDEX_MEGADRINK);
	}
	else
	{
		b_raiseattribute(self,ATR_STRENGTH,STRORDEX_MEGADRINK);
	};
	Npc_ChangeAttribute(self,ATR_MANA,-ATR_MANA);
	Snd_Play("DEM_Warn");
};

