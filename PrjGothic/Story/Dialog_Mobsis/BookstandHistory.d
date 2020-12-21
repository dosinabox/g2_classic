
var int history_1_permanent;
var int history_2_permanent;
var int history_3_permanent;

func void use_bookstandhistory1_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"���� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"������ ������ - ��� ������� ���������, �� ������� ����, ����� ���� �������� ������. ���������� ���������� ����� ������ ��� ��������.");
		Doc_PrintLines(ndocid,0,"����� ����� ������� ����� �� ���������� ��� ������ ������, ���������� ������, � ����� ������� ����������� �������������� �����.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"�������, ������ ������� ����� ����� ������������ ������������. ���� �� ������� �������� ���, �� ���� ������� ������������ ��������� ����������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"");
		Doc_Show(ndocid);
		if(HISTORY_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			HISTORY_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandhistory2_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"�������� ����� ������� ��������� �� ������� � ��������� ����������� �������.");
		Doc_PrintLines(ndocid,0,"���� ������ ��������, ������ �����, ����� ������� ��������. � ��� ����� ������ �����, ����� ��� ��� ���� ������� ���������� �������� � ������� ������� ��� ���� ���������� �����������.");
		Doc_PrintLines(ndocid,0,"����� �������, ��� ������ ����� �������� ��������, ��� ���������� ������� ��� ������ �������� ���������� ����.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"���������� �� �������� ��������� ��������� ����, ��� ��������� �� ����������� ����� ���������� ������� � ����, � ����� �������� ����.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"��� ������ ��������� ����� ������� ����� ����������� ���������, ������� ����� � ������ ���������� ����� ������ ��������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"� ������ ������� ��������� ������� ��������� ������, ������������� ������ ����. ��� �������� ��� ������������ � ������� ����� � �������, � ����� ������ �������� ����.");
		Doc_Show(ndocid);
		if(HISTORY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			HISTORY_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandhistory3_s1()
{
	var C_NPC her;
	var int ndocid;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"Book_RED_L.tga",0);
		Doc_SetPage(ndocid,1,"Book_RED_R.tga",0);
		Doc_SetFont(ndocid,-1,FONT_BOOK);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_PrintLine(ndocid,0,"����� �� �������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"����� ���� ����� ������, ���������� ������ ������� ����������� ���� - ���� ��� ���������, ����� ��� ����� ���������.");
		Doc_PrintLines(ndocid,0,"����� ������������ ������ ���������� �������� ���������.");
		Doc_PrintLines(ndocid,0,"���������� ��������� �������� �� ������, � ����� ����������� � ��� ������ �������.");
		Doc_PrintLines(ndocid,0,"��������� ����� �������� ���������. ����� ���� ��� ������� ������ ����� ��������� ��������� �������� - ����.");
		Doc_PrintLines(ndocid,0," ");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"���� ���-���� ������ ������� ��� ����� ���, ���������� ������ �������� �� �����. ����� �������� �������� ������, �������� ������ ��������� ������� �����.");
		Doc_PrintLines(ndocid,1,"�� ���� ������ �������� ��������� ������, ����������� ������������ �����. �� ��� ������� �������� ��� ���� �������������, � � �� ����������� ������ ��������� ��������� � �������������� �������.");
		Doc_PrintLines(ndocid,1,"���, ��� ���� ������� ������������ ��� ��� ���������� ��������, ������ �������� �� ���� �������.");
		Doc_Show(ndocid);
		if(HISTORY_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			HISTORY_3_PERMANENT = TRUE;
		};
	};
};

