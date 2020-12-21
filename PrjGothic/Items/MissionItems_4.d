
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
	on_equip = equip_itam_mana_01;
	on_unequip = unequip_itam_mana_01;
	description = "������ �����";
	text[0] = "���� ������ ����������� ������.";
	text[2] = NAME_BONUS_MANAMAX;
	count[2] = AM_MANA;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

instance ITMW_1H_FERROSSWORD_MIS(C_ITEM)
{
	name = "��� ������";
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
	name = NAME_Beutel;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 300;
	visual = "ItMi_Pocket_Mis.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = usekerolothsgeldbeutel;
	description = name;
	text[0] = PRINT_POCKET_MIS;
	text[1] = "� ������ '�������'.";
	text[2] = PRINT_POCKET_300;
	text[5] = NAME_Value;
	count[5] = value;
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
	name = "������� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItMi_Pocket_Empty.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "���� ������� ����.";
	inv_zbias = 190;
};

instance ITRW_SENGRATHSARMBRUST_MIS(C_ITEM)
{
	name = "������� ��������";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_MILARMBRUST;
	damagetotal = DAMAGE_MILARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_MILARMBRUST;
	visual = "ItRw_Crossbow_Mission_02.mms";
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
	name = "���� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_LURKERSKIN;
	visual = "ItAt_LurkerSkin.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "�� ���������� ������� ������ - '������'.";
	text[1] = "";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAT_DRAGONEGG_MIS(C_ITEM)
{
	name = "�������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_DRAGONEGG;
	visual = "ItAt_DragonEgg.3ds";
	material = MAT_LEATHER;
	description = name;
	text[0] = "��� ���� ������, � �������";
	text[1] = "��������� ����������� ����.";
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRI_ORCELITERING(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_MISSION | ITEM_RING | ITEM_MULTI;
	value = VALUE_ORCELITERING;
	visual = "ItRi_OrcEliteRing.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_orcelitering;
	on_unequip = unequip_orcelitering;
	description = "������ ������������� �����";
	text[0] = "��� ������ ������ �������";
	text[1] = "������� ��������.";
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
	description = "����� �� ������� ���������� ����";
	text[3] = "������ ����������.";
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
	name = "������� ����� �����";
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
		b_logentry(TOPIC_ORCELITE,"� ����� �������� ����� � ���������� �����. ��� ������ �� �������������� ������� ����� �����.");
		use_map_newworld_orcelite_mis_onetime = TRUE;
	};
};


instance ITWR_MAP_CAVES_MIS(C_ITEM)
{
	name = "������ ��������";
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

