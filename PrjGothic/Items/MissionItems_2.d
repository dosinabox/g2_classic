
instance ITMI_STONEOFKNOWLEGDE_MIS(C_ITEM)
{
	name = "������ ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 0;
	visual = "ItMi_StoneOfKnowlegde_MIS.3DS";
	material = MAT_STONE;
	description = name;
};

instance ITWR_PALADINLETTER_MIS(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepaladinletter;
	scemename = "MAP";
	description = "������ ����� ������";
};


func void usepaladinletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"���� �����!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"���������� � ������ �������� ����������� ��������. �� ������� �������� ������. ��, ���� ������� ������, ������� � �����, ���������� ������.");
	Doc_PrintLines(ndocid,0,"�� ������������ ������������ ��������� ��������. ��� ���������� ����� ������ �����. �������, � ������� ������ �� ������ ������������ �� �������� ������������. ���� �������� ������ �� �� ������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�� ������� ��� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"������");
	Doc_Show(ndocid);
};


instance ITWR_LETTERFORGORN_MIS(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useletterforgorn;
	scemename = "MAP";
	description = "��������� ������� �����";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void useletterforgorn()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"����!");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLines(ndocid,0,"������ ���������� ���������� ���� - �� 1000 �������.");
	Doc_PrintLines(ndocid,0,"��� ��� ���� � ���� ���� ���-�� ������������ ���������, ����� ����� ������� �� ����.");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"������ ");
	Doc_Show(ndocid);
};


instance ITKE_PRISONKEY_MIS(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_KEYS;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� �������";
	text[3] = "� �����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_OC_STORE(C_ITEM)
{
	name = "���� �� ��������";
	mainflag = ITEM_KAT_KEYS;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ��������";
	text[3] = "� �����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_ERZBARONFLUR(C_ITEM)
{
	name = "���� �� �����";
	mainflag = ITEM_KAT_KEYS;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "�� ������ �����.";
	text[3] = "�� ��� ������������� ��� �����";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_ERZBARONRAUM(C_ITEM)
{
	name = "���� �� �����";
	mainflag = ITEM_KAT_KEYS;
	flags = 0;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "�� ������ �����.";
	text[3] = "�� ��� ������������� ��� �����";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITMI_GORNSTREASURE_MIS(C_ITEM)
{
	name = NAME_BEUTEL;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 250;
	visual = "ItMi_Pocket_Mis.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = usegornstreasure;
	description = name;
	text[0] = PRINT_POCKET_MIS;
	text[1] = "� ������ '����'.";
	text[2] = PRINT_POCKET_300;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void usegornstreasure()
{
	CreateInvItems(self,itmi_gold,250);
	Print(PRINT_GOLDERHALTEN);
	Snd_Play("Geldbeutel");
	GORNS_BEUTEL = TRUE;
};


instance ITWR_SILVESTRO_MIS(C_ITEM)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_silvestro;
	scemename = "MAP";
	description = "������� ����������";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void useitwr_silvestro()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"�� ������������ �������� ����������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"��� ���� ��� ���� ���� ��������. ������� �� ���������� ��������� ����� ����� � ���������� ������ � �����.");
	Doc_PrintLines(ndocid,0,"� ���� ��������� ������������, ������� � ����������� �������� ����.");
	Doc_PrintLines(ndocid,0,"����� ������������ �� ���, ��� ������ ������������� �����. � �������� �������� ���. �� ��������� ������� � ���������� ����� - �� � �� ������� ��� ����� ������.");
	Doc_PrintLines(ndocid,0,"��� ���� ����� ��������� �� ��� �� �� �� �����, ������� � ��������� � ����� ���� �������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�� ����������� ������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"����������");
	Doc_Show(ndocid);
};


instance ITAT_CLAWLEADER(C_ITEM)
{
	name = "�����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 100;
	visual = "ItAt_ClawLeader.3DS";
	material = MAT_LEATHER;
	description = name;
	text[0] = "����� ������ ���� ���������.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITSE_OLAV(C_ITEM)
{
	name = NAME_BEUTEL;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = 25;
	visual = "ItMi_Pocket_Mis.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = useolav;
	description = name;
	text[0] = PRINT_POCKET_MIS;
	text[1] = "� ������ '����'.";
	text[2] = PRINT_POCKET_25;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useolav()
{
	CreateInvItems(hero,itmi_gold,25);
	Print(PRINT_FOUNDGOLD25);
	Snd_Play("Geldbeutel");
};


instance ITMI_GOLDPLATE_MIS(C_ITEM)
{
	name = "������� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDPLATE;
	visual = "ItMi_GoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_PASS_MIS(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = "��������� ������";
	text[1] = "��������� ������ �������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ITKE_BROMOR(C_ITEM)
{
	name = "���� �������";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "���� �� �������";
	text[2] = "��������� �������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_RUNE_MIS(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[1] = "������, � �������� ��������";
	text[2] = "���� ����, ��������� ��� ������.";
	text[3] = "� ��� ����� ������ ������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITWR_BLOODY_MIS(C_ITEM)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usebloodmis;
	scemename = "MAP";
	description = "�� �������� ���";
};


func void usebloodmis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"���� �������� ��� �������� ����������� ��, � �� ���� ������� � ������� ��� �� ������� ��� � ����.");
	Doc_PrintLines(ndocid,0,"���� ������ �� �� ������� ���������� ���������� ���� � ��� ���������.");
	Doc_PrintLines(ndocid,0,"���� ���������� ��������� ��������� ������ ����� �� ������� �� ���������.");
	Doc_PrintLines(ndocid,0,"������� ���� ���������. ����� ����������� ����� ������ �����.");
	Doc_PrintLines(ndocid,0,"������������ ��� ������� ��� �������� ��������� ����������.");
	Doc_PrintLines(ndocid,0,"������, �� �������� ������������ �������� ���������� ��������������� � ����� ��������� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�������");
	Doc_Show(ndocid);
	if(KNOWS_BLOODFLY == FALSE)
	{
		KNOWS_BLOODFLY = TRUE;
		Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
		b_logentry(TOPIC_BONUS,"������ � ����, ��� ���������� �������, ����� ������ �������� ��� �� ���� �������� ����.");
		b_giveplayerxp(XP_AMBIENT);
	};
};


instance ITWR_PFANDBRIEF_MIS(C_ITEM)
{
	name = "���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepfandbrief;
	scemename = "MAP";
	description = name;
};


func void usepfandbrief()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"� �������� �������� ��������� �����");
	Doc_PrintLine(ndocid,0,"����������� �����, ��������� ��������");
	Doc_PrintLine(ndocid,0,"����� ����� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�����: ����������������� ������� �����");
	Doc_PrintLines(ndocid,0,"�� ��������� �������� ������");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"�������");
	Doc_PrintLine(ndocid,0,"������, ��������");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"�����, ���������");
	Doc_Show(ndocid);
};


instance ITWR_MAP_OLDWORLD_OREMINES_MIS(C_ITEM)
{
	name = "����� �������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 50;
	visual = "ItWr_Map_OW.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_oldworld_oremines;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_map_oldworld_oremines()
{
	var int document;
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_OldWorld_Oremines.tga",TRUE);
	Doc_SetLevel(document,"OldWorld\OldWorld.zen");
	Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
	Doc_Show(document);
};


instance ITWR_MANOWAR(C_ITEM)
{
	name = "����� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usemanowar;
	scemename = "MAP";
	description = name;
};


func void usemanowar()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"���� ��������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�� �������� ��� ��������.");
	Doc_PrintLines(ndocid,0,"����� ������ �� ���� � ����� ��������.");
	Doc_PrintLines(ndocid,0,"� ���� ������, ��� ���������� ���������� ����");
	Doc_PrintLines(ndocid,0,"� ���� ������ ����� ��� �����.");
	Doc_PrintLines(ndocid,0,"��� ��� ������ ������ ���.");
	Doc_PrintLines(ndocid,0,"��� ��� ������ � ���� �� �����.");
	Doc_PrintLines(ndocid,0,"�����, ��� ������������ ���,");
	Doc_PrintLines(ndocid,0,"����� �� ��� ����,");
	Doc_PrintLines(ndocid,0,"���� � ���� ������.");
	Doc_Show(ndocid);
};


instance ITWR_KDWLETTER(C_ITEM)
{
	name = "���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usekdwletter;
	scemename = "MAP";
	description = name;
};


func void usekdwletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�� �������� ������. ������, ����� ������ ���, �� ���������� �� ������ ������ ����������. ��������, ��� �� ������ ������ �� �������, ������� �� �������� ������� ������ ���. ������ ������� ������, ���� �������� ��� ��� ����.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�� �������� � ���� ������.");
	Doc_PrintLine(ndocid,0,"�������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_GILBERTLETTER(C_ITEM)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usegilbertletter;
	scemename = "MAP";
	description = name;
};


func void usegilbertletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"� ���� ������. � ����� ��������� �����. � ���� ����� ����� - ������, �������, ���.");
	Doc_PrintLines(ndocid,0,"���� �� ���-�� ����� ������ ���� ������. ���� ��� ������� ��� ������ � ��� ��� ������� ������. ������ ����� ������������ �����.");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"��������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};

instance ITRI_HP_01_TENGRON(C_Item)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_HP;
	visual = "ItRi_Hp_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_hp_01;
	on_unequip = unequip_itri_hp_01;
	description = "������ �����";
	text[0] = "��� ������ ����������� ��������.";
	text[2] = NAME_BONUS_HPMAX;
	count[2] = RI_HP;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

