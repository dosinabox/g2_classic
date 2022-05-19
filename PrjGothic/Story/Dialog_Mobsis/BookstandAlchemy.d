
var int alchemy_1_permanent;
var int alchemy_2_permanent;
var int alchemy_3_permanent;

func void use_bookstandalchemy1_s1()
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
		Doc_PrintLine(ndocid,0,"����� ���������� ����");
		Doc_PrintLine(ndocid,0,"� �����������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ����");
		Doc_PrintLine(ndocid,0,"2 �������� �������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ����");
		Doc_PrintLine(ndocid,0,"2 �������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ����");
		Doc_PrintLine(ndocid,0,"2 �������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"��� ������ �� ������������ ����� ���������� ��������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"����� ������� ����� �������� ����� ��� �����, ����������� ���������� ����, ��������� ������ ���������� � ��������:");
		Doc_PrintLine(ndocid,1,"������� �����");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"����� ������� �����, ����������� ������������ ����������� �� ���� ��� ���, ���������� ������������ ��������:");
		Doc_PrintLines(ndocid,1,"������� ������");
		Doc_Show(ndocid);
		if(ALCHEMY_1_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ALCHEMY_1_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandalchemy2_s1()
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
		Doc_PrintLine(ndocid,0,"�������� �����");
		Doc_PrintLine(ndocid,0,"� �����������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ��������");
		Doc_PrintLine(ndocid,0,"2 �������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� ��������");
		Doc_PrintLine(ndocid,0,"2 �������� ��������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�������� �������");
		Doc_PrintLine(ndocid,0,"2 �������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"��� ������ �� ������������ ����� ���������� ��������.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"����� ������� ����� �������� ����� ��� �����, ����������� ���������� ����, ��������� ������ ���������� � ��������:");
		Doc_PrintLine(ndocid,1,"������� �����");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"����� ������� �����, ������� ������������ �������� �� ���� ��� ���, ���������� ������������ ��������:");
		Doc_PrintLines(ndocid,1,"������� ������");
		Doc_Show(ndocid);
		if(ALCHEMY_2_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ALCHEMY_2_PERMANENT = TRUE;
		};
	};
};

func void use_bookstandalchemy3_s1()
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
		Doc_PrintLines(ndocid,0,"����� ������������� �������� � �����������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ��������");
		Doc_PrintLine(ndocid,0,"1 ���������� �����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������� ����");
		Doc_PrintLine(ndocid,0,"1 �������� ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"������� �����");
		Doc_PrintLine(ndocid,0,"1 �������� ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"������� ����");
		Doc_PrintLine(ndocid,0,"1 �������� ������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,1,"���������� ���� �������� - ������ ������������ ���������. ��� ������� �������� �����.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"� �����, ����� �������, ��� ������ � ����, ��� �����, ��� ���������� � �������� ��� �������� ������ ����� ���� ���������� �����, ����� ����������� ������� ��� �����. ��� ��� ������� �������� ������.");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����� ��������");
		Doc_PrintLines(ndocid,0,"1 �������-����� - ��� ����� ����� ��������� �� ������� ������, � ������� �����.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"������ ��� ����� ����������� �����, �������� ������, ��� ��� ���� �� ����� ������� ������. ������� �������� � ������� �������� ��� ������������� ���� ������.");
		Doc_Show(ndocid);
		if(ALCHEMY_3_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			ALCHEMY_3_PERMANENT = TRUE;
		};
	};
};

