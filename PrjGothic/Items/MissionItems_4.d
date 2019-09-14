
const int VALUE_DRAGONEGG = 200;
const int VALUE_ORCELITERING = 130;

instance ITAM_MANA_ANGAR_MIS(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = VALUE_AM_MANA;
	visual = "ItAm_Mana_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_mana_angar;
	on_unequip = unequip_itam_mana_angar;
	description = "Магический амулет Ангара";
	text[2] = NAME_BONUS_MANA;
	count[2] = 10;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_mana_angar()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + AM_MANA;
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + AM_MANA;
};

func void unequip_itam_mana_angar()
{
	self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - AM_MANA;
	if(self.attribute[ATR_MANA] > AM_MANA)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - AM_MANA;
	}
	else
	{
		self.attribute[ATR_MANA] = 0;
	};
};


instance ITMW_1H_FERROSSWORD_MIS(C_ITEM)
{
	name = "Меч Фероса";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_SWD | ITEM_MISSION;
	material = MAT_METAL;
	value = VALUE_SPECIAL_1H_2;
	damagetotal = DAMAGE_SPECIAL_1H_2;
	damagetype = DAM_EDGE;
	range = RANGE_SPECIAL_1H_2;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_SPECIAL_1H_2;
	visual = "ItMw_060_1h_Sword_smith_04.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_KEROLOTHSGELDBEUTEL_MIS(C_ITEM)
{
	name = "Кожаный кошелек Керолота";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = usekerolothsgeldbeutel;
	description = name;
};


func void usekerolothsgeldbeutel()
{
	CreateInvItems(self,itmi_gold,300);
	CreateInvItems(self,itmi_kerolothsgeldbeutelleer_mis,1);
	Print(PRINT_KEROLOTHSGELDBEUTEL);
	Snd_Play("Geldbeutel");
};


instance ITMI_KEROLOTHSGELDBEUTELLEER_MIS(C_ITEM)
{
	name = "Кожаный кошелек Керолота";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket.3ds";
	material = MAT_LEATHER;
	description = name;
};

instance ITRW_SENGRATHSARMBRUST_MIS(C_ITEM)
{
	name = "Арбалет Сенграта";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_MILARMBRUST;
	damagetotal = DAMAGE_MILARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_MILARMBRUST;
	visual = "ItRw_Mil_Crossbow.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_TALBINSLURKERSKIN(C_ITEM)
{
	name = "Шкура луркера";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_LURKERSKIN;
	visual = "ItAt_LurkerSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "На внутренней стороне клеймо - 'Талбин'.";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_DRAGONEGG_MIS(C_ITEM)
{
	name = "Драконье яйцо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_DRAGONEGG;
	visual = "ItAt_DragonEgg.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "Это яйцо теплое, и изнутри";
	text[1] = "доносится скребущийся звук.";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRI_ORCELITERING(C_ITEM)
{
	name = "Кольцо предводителей орков";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION | ITEM_RING | ITEM_MULTI;
	value = VALUE_ORCELITERING;
	visual = "ItRi_OrcEliteRing.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_orcelitering;
	on_unequip = unequip_orcelitering;
	description = name;
	text[0] = "Это грубое кольцо кажется";
	text[1] = "странно холодным.";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_orcelitering()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,-20);
	Print(PRINT_ORCELITERINGEQUIP);
};

func void unequip_orcelitering()
{
	Npc_ChangeAttribute(self,ATR_STRENGTH,20);
};


var int neoras_scuseddragoneggdrink;

instance ITPO_DRAGONEGGDRINKNEORAS_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = VALUE_HPELIXIER;
	visual = "ItPo_MegaDrink.3ds";
	material = MAT_GLAS;
	on_state[0] = use_dragoneggdrinkneoras;
	scemename = "POTIONFAST";
	description = "Зелье из секрета драконьего яйца";
	text[3] = "Эффект неизвестен.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_dragoneggdrinkneoras()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ELIXIER);
	b_raiseattribute(self,ATR_STRENGTH,5);
	Snd_Play("DEM_Warn");
	NEORAS_SCUSEDDRAGONEGGDRINK = TRUE;
};


instance ITWR_MAP_ORCELITE_MIS(C_ITEM)
{
	name = "Военная карта орков";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 350;
	visual = "ItWr_Map_NW_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_orcelite_mis;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


var int use_map_newworld_orcelite_mis_onetime;

func void use_map_newworld_orcelite_mis()
{
	var int document;
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Orcelite.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
	if((use_map_newworld_orcelite_mis_onetime == FALSE) && (MIS_KILLORKOBERST != 0))
	{
		b_logentry(TOPIC_ORCELITE,"Я нашел странную карту у полковника орков. Она похожа на стратегическую военную карту орков.");
		use_map_newworld_orcelite_mis_onetime = TRUE;
	};
};


instance ITWR_MAP_CAVES_MIS(C_ITEM)
{
	name = "Пещеры Хориниса";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_NW_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_caves_mis;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_map_newworld_caves_mis()
{
	var int document;
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Caves.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};

