
func void bookstand_milten_03_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"������.");
		Doc_PrintLines(ndocid,0,"��������� ���� ������ ����� ������� ������� ������������ ������ �������.");
		Doc_PrintLines(ndocid,0,"����� ����� �� ��������� �����, ������� ���-��� ���������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"��������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"�� ������, ��� � ��������� ����� ������� ���� ����� ������. ��, �������, ��� �� ���� ������� ��������. � ����� ��� ������ ����� �� ������������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"��������");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"����� ����� �� ������ �������� ��� ������, � ��� �������, � ����, ��� �� ���������. �� ������ ������������ ����� ����, ���� ��� �� ������� ������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"��������");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"��������, ��� ������� �������� ����������. ���������� ������ � ���, ��� ����������, ���� ����� ...");
		Doc_Show(ndocid);
	};
};

func void bookstand_milten_02_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"� �������� ���� ���������� ����� ������� ����������. ��� �� ��� ��������, ��� ������� � �������� ������������ ����� � ������?");
		Doc_PrintLines(ndocid,0,"��, �� ���� �������, ��� � ��� �����������. �� ����� ����, ��� ����� ������� �������� ������.");
		Doc_PrintLines(ndocid,0,"���� ���������� �� ������� ���������� �������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"��������� ���� �����. ��� ����� � ����� ����� - �� ��������, ���� �� ������.");
		Doc_PrintLines(ndocid,1,"�� �����, ��� ��� ���������� ������ ������.");
		Doc_PrintLines(ndocid,1,"��, � � ��������� ��������� ����� ��� ����� ������������ �������� �������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"������");
		Doc_Show(ndocid);
	};
};

func void bookstand_milten_01_s1()
{
	var C_NPC her;
	var int document;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		document = Doc_CreateMap();
		Doc_SetPages(document,1);
		Doc_SetPage(document,0,"Map_OldWorld.tga",TRUE);
		Doc_SetLevel(document,"OldWorld\OldWorld.zen");
		Doc_SetLevelCoords(document,-78500,47500,54000,-53000);
		Doc_Show(document);
	};
};

func void bookstand_engor_01_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_Red_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_Red_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"�� ����� ���-��� - ������ ���������. ������ �����������:");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"3 ����� ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"8 ������ ������ �������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"4 ����� � ��������� ���������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"5 ������ (�������) ���� � ����");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"2 ����� � �������");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"3 ����� � �������������");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"16 ������ � ������� (���� ��� ����� ���)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 ���� � ������� ��������");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"4 ����� � �������� �������");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"56 ����� � �����");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"1 ���� � ���-�� ������ (��� �� ��� �� ����, ��� ������)");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"�����");
		Doc_Show(ndocid);
	};
};

