
instance ITSE_XARDASNOTFALLBEUTEL_MIS(C_ITEM)
{
	name = NAME_BAG;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_Bag.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_xardasnotfallbeutel;
	description = name;
	text[0] = "����� �������� �����.";
	text[1] = "������, ��� � ��� ���������";
	text[2] = "������� ������� � ��������.";
};


func void use_xardasnotfallbeutel()
{
	var string concattext;
	CreateInvItems(hero,itwr_xardasermahnungfueridioten_mis,1);
	CreateInvItems(hero,itmi_innoseye_discharged_mis,1);
	concattext = ConcatStrings("2",PRINT_ITEMSERHALTEN);
	concatText = ConcatStrings(concatText," (������ � ���� ������)");
	Print(concattext);
};


instance ITWR_XARDASERMAHNUNGFUERIDIOTEN_MIS(C_ITEM)
{
	name = "������ � ���������������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_xardasermahnungfueridioten;
	scemename = "MAP";
	description = name;
};


func void use_xardasermahnungfueridioten()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"��� ���� �������, �� ����� ����������� ����. ��� �� ��� ������� �� ������� � �� ����� ���� ������?");
	Doc_PrintLines(ndocid,0,"��� �������� ������ ���������, ��� ����� ���������� ���� �������. � ��������� ������, ���� ������� �� ������� �������� ��� �� ��� � ��� �������� ����� ������� ���� �� ���� �������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                      �������");
	Doc_Show(ndocid);
};


instance ITWR_KRYPTA_GARON(C_ITEM)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_krypta_garon;
	scemename = "MAP";
	description = name;
	text[3] = "���������� ���������� �����.";
};


func void use_krypta_garon()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"��� ����� ������. � ������ ������� �������� ������� �� ���� �����.");
	Doc_PrintLines(ndocid,0,"�������, ��� ����������, ��� � ��� �����. �� ���-����� ���� ��� ��� �������� � ������ ������ �����.");
	Doc_PrintLines(ndocid,0,"������ ������� �� �������. ��������� ������� ������� ���������, ������ �� ���� �������� �� ���� ���������.");
	Doc_PrintLines(ndocid,0,"������ � ��� ������ �� ��� ��������������. � �� ���� ������, ��� ����� ������������ ��� ������ ��� ����� ����� ����.");
	Doc_PrintLines(ndocid,0,"� ����� ��� ������ � ���� ������. �� � �� ������, ������� �� ��� �������� � ����� �������. �������, � ���� ��� ������ � �������, ��� ���-������ ������ ��.");
	Doc_PrintLines(ndocid,0,"������. ������� ���� �������� ���������� �� ��������� ���. ������ ����� �� ���������.");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"�� ������ ����� ���� ����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                                 ����");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITKE_ORKKNASTDI_MIS(C_ITEM)
{
	name = "���� ���������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_EVT_UNDEAD_01(C_ITEM)
{
	name = "���� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = name;
};

instance ITKE_EVT_UNDEAD_02(C_ITEM)
{
	name = "���� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_LASTDOORTOUNDEADDRGDI_MIS(C_ITEM)
{
	name = "���� �� ������� ������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_LASTDOORTOUNDEADDRGDI_MIS(C_ITEM)
{
	name = "������ ������� ����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_itwr_lastdoortoundeaddrgdi_mis;
	scemename = "MAP";
	description = name;
};


func void use_itwr_lastdoortoundeaddrgdi_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"����� ");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"���� �����");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"���� ���� �������� ���� ����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
	b_logentry(TOPIC_HALLENVONIRDORATH,"������ ������� ���� �������� ����� ����� ���� �����. ��� ������ �� �����-�� ���������� �������, �� ��� ���� ��� ������������ - � ��� ����� ���� ����?");
};


instance ITKE_CHESTMASTERDEMENTOR_MIS(C_ITEM)
{
	name = "���� �� ������� ������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_REZEPT_MEGADRINK_MIS(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_rezeptfuermegatrank;
	scemename = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_rezeptfuermegatrank()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"� ������ � ����� ������� ���������. �����, ������, �������� �� ������ ��� ����������.");
	Doc_PrintLines(ndocid,0,"��� ��������, �������� ������, ��� � ������ ���������� ���� ��� ������� � �����. ���� �� ������ �� �� ����� �� ����� ����� ��� ����� ��� ������, � �� ���������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"������� ��������:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"10 ��������� ���, ���� �������� � ������� ������ ��������� � ������� ����.");
	Doc_PrintLines(ndocid,0,"��� ����� ����� ������� �� �������, ��������� ���������, � ���������� ����� �����������.");
	Doc_PrintLines(ndocid,0,"������������ ������� ����� ������������ � �������������. �� �������� �������� ��������� ��������� � ����� ������������ �������� �� ����.");
	Doc_Show(ndocid);
	PLAYER_TALENT_ALCHEMY[POTION_MEGADRINK] = TRUE;
};


instance ITWR_DIARY_BLACKNOVICE_MIS(C_ITEM)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_03_04.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[0] = "������� ���������� ������� ����.";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_diary_blacknovice;
};


func void use_diary_blacknovice()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"� ��� ���������� ��� ��� 36 ����. � ������� �����������, ��� ���� ������ ��������. �� � ������ ���, ��� ��� �������. � ����������� �� ��� ������� �� ����������.");
	Doc_PrintLines(ndocid,0,"������� �������� ��� ������� �������. � ��� �� ������ �����. ���� ��� � ������ ����� ���� � ��� �� ����, ����� ������ �������� ������ ����� ������.");
	Doc_PrintLines(ndocid,0,"��� ����, ��� � �� ����� ����������.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"� ������ � ������� ��� ��� ������-�����. � �� ���� ���������, ����� ����� �������. ���������, �������� �� ��� ������ ���, ����� � ����� ����� �� ���.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"����� � ������� �������. �� �������� ������� � ���� ������� � �������� ��� �� ����, ��� ���� ������ ��� ������������� � �������� ����� � ���������� �������. ���� ��� ������ ������! ������ � ��������� ������� � ���� ���� ...");
	Doc_Show(ndocid);
	b_logentry(TOPIC_HALLENVONIRDORATH,"� �������� ������� ����-���������� ����������� ������ � ��������, �������, ���������� �������������� � ����� ���� ���. � ������ ��������� ���, ������� �� ������ �������, ��� ����������, � ��� ���.");
};


instance ITWR_ZUGBRUECKE_MIS(C_ITEM)
{
	name = "������ ������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_zugbruecke;
	scemename = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_zugbruecke()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"   ��������� ��������������!");
	Doc_SetMargins(ndocid,-1,50,50,70,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"���� �� ����������, ������� �� �������� ���� � ������ ������� ��� ���. ���� ��� ���������� ��� ������ - �� ��� ������������ ������ � ���.");
	Doc_PrintLines(ndocid,0,"� ��������� �������� ���� �������� �� ��� ���, ���� � �������� �����. � ���� � ������, ��� ���-�� �������� ������ ������������� ��� ������ ���� � ������, � ����� ������� ����� ������ �� ��������� ������!");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                      �����");
	Doc_Show(ndocid);
};


instance ITMI_POWEREYE(C_ITEM)
{
	name = "���� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItMi_StoneOfKnowlegde_MIS.3ds";
	material = MAT_METAL;
	description = name;
};

