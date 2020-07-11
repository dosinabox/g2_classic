
var int animals_1_permanent;
var int animals_2_permanent;
var int animals_3_permanent;

func void use_bookstandanimals1_s1()
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
		Doc_PrintLine(ndocid,0,"����� � ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"� ������� ����� ��� ��������� ����� �������� ������, ������������� ����� � ��������� �������� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"������� ������� ����� ��� � ������� ������ � ��� �������� ��.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� �����");
		Doc_PrintLines(ndocid,0,"���� - ������ ������ ������ � ��������. ���� �� ������, ��� ������ �� � ����� ������, �� ������, ���������, ����������, �������� ���� � ������� ����� ������� ������� ������.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"������ ����");
		Doc_PrintLines(ndocid,1,"����������� � ������� �������� ������ �������, � ��� ������ ����� ���� - ����, ������ � ����������, ��������.");
		Doc_PrintLines(ndocid,1,"����� ������� �������� ����� ����� ������� ����� � �������� ���� � ��������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"������� ������");
		Doc_PrintLines(ndocid,1,"��� ��������� ��������� �� ���� ����� ������, ���������, �������� � ����������.");
		Doc_Show(ndocid);
		if(ANIMALS_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ANIMALS_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandanimals2_s1()
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
		Doc_PrintLine(ndocid,0,"����� � ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"� ������� ����� ��� ��������� ����� �������� ������, ������������� ����� � ��������� �������� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ����");
		Doc_PrintLines(ndocid,0,"����� ����������� ���� �������� ��������, ���������� �������� ����� ��������.");
		Doc_PrintLines(ndocid,0,"� ��� ����� �������� ������ � ����.");
		Doc_PrintLines(ndocid,0,"��� ���� ������ ������������ �������� ���������� ��� ��������� �������.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"������� ������� � �������� ������� ��� ������ ��������. ��������� ���������");
		Doc_PrintLines(ndocid,1,"�������� �������, ��� ��� ��� �������� ������, ���������� ���������� ����.");
		Doc_PrintLines(ndocid,1,"������, �� ������� ������������ ���������, ��� ��� ������������ �������� ���������� ���������� ������������� � ���.");
		Doc_PrintLines(ndocid,1,"������� ��������� ����� ������ ���������. �� ��� ����� ������������� �������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1," ");
		Doc_Show(ndocid);
		if(ANIMALS_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ANIMALS_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandanimals3_s1()
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
		Doc_PrintLine(ndocid,0,"����� � ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"� ������� ����� ��� ��������� ����� �������� ������, ������������� ����� � ��������� �������� ��������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ����");
		Doc_PrintLines(ndocid,0,"���� ����� - ����, ���������� �����, ������� ����� ����� ������ � �������� ���������� ����� �� ���� �����.");
		Doc_PrintLines(ndocid,0,"������ ��, ��� �������� ������� �� ����, ����� ��������� �� ���� �������� � �������� �� ������ �����.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"��������");
		Doc_PrintLines(ndocid,1,"�������� - ��� ������� �����, �������������� ��������� � ������� ��� �������� ����.");
		Doc_PrintLines(ndocid,1,"���� �������� �������� ����� ����, � ������� ��� �� ������������ ������ ��������� ��� �����, ���� ������ �� �� �������� �� ���������� �� �����.");
		Doc_PrintLines(ndocid,1,"��� ��������� ��������� ������ ���������� �������. �� ����� ���������� ���, �������");
		Doc_PrintLines(ndocid,1,"������ ����� ��������� �������� ���.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_Show(ndocid);
		if(ANIMALS_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ANIMALS_3_PERMANENT = TRUE;
		};
	};
};

