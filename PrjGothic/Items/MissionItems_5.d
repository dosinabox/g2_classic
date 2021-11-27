
instance ITWR_XARDASLETTERTOOPENBOOK_MIS(C_ITEM)
{
	name = "������ ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_xardaslettertoopenbook;
	scemename = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_xardaslettertoopenbook()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"� �������, ��� ���� �� �������� � ������ �������� ������� ���������� ���.");
	Doc_PrintLines(ndocid,0,"� ��������.");
	Doc_PrintLines(ndocid,0,"���� ��� ������ ���, ��� � �����������,");
	Doc_PrintLines(ndocid,0,"�� ������ ������ ������ ������� ��������.");
	Doc_PrintLines(ndocid,0,"� �����, ��� �� ����� ��������, ���������� ��� ����������� ���� �����.");
	Doc_PrintLines(ndocid,0,"� ������ ��� ����������, ������");
	Doc_PrintLines(ndocid,0,"������ ��� ������ ���������� ��.");
	Doc_PrintLines(ndocid,0,"�� ������ ������� �� ����!");
	Doc_PrintLines(ndocid,0,"��� ����� ��������� ����� '����� ��������'. ������ �� ������ �� ����!");
	Doc_PrintLines(ndocid,0,"� ���� ������ ���� ����� ������ ����.");
	Doc_PrintLines(ndocid,0,"� �� ����� ������ ���� � ����� ��������� ������. ������ �� ������ ���������� �������� ���.");
	Doc_PrintLines(ndocid,0,"�� ��� ����������!");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                             �������.");
	Doc_Show(ndocid);
	if(MIS_XARDAS_SCCANOPENIRDORATHBOOK == FALSE)
	{
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"� ���� ������ ������� ������� ��� �����, ����������� ����� ������� ��������.");
	};
	MIS_XARDAS_SCCANOPENIRDORATHBOOK = TRUE;
};


instance ITKE_MONASTARYSECRETLIBRARY_MIS(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_02;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "�� ����� '������� ��������'";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ITWR_HALLSOFIRDORATH_MIS(C_ITEM)
{
	name = "������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_03_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	description = name;
	on_state[0] = use_hallsofirdorath;
};


func void use_hallsofirdorath()
{
	if(MIS_XARDAS_SCCANOPENIRDORATHBOOK == TRUE)
	{
		b_say(self,self,"$SCOPENSIRDORATHBOOK");
		Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		CreateInvItems(hero,itwr_hallsofirdorath_open_mis,1);
		CreateInvItems(hero,itke_monastarysecretlibrary_mis,1);
		CreateInvItems(hero,itwr_uselampidiot_mis,1);
		Print(PRINT_IRDORATHBOOKHIDDENKEY);
		b_giveplayerxp(XP_HALLSOFIRDORATHISOPEN);
		ITWR_HALLSOFIRDORATHISOPEN = TRUE;
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"� ���� ������� ����� ��������. � ��� ���������� ��������� ��������� � �������� ����. ��� �����, ��� ��� ����� ����� � � ������������ ��������.");
	}
	else
	{
		CreateInvItems(hero,itwr_hallsofirdorath_mis,1);
		Print(PRINT_IRDORATHBOOKDOESNTOPEN);
		Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
		Snd_Play("MFX_FEAR_CAST");
	};
};


instance ITWR_HALLSOFIRDORATH_OPEN_MIS(C_ITEM)
{
	name = "������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_03_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	on_state[0] = use_hallsofirdorath_open;
};


func void use_hallsofirdorath_open()
{
	var int ndocid;
	if(ITWR_SCREADSHALLSOFIRDORATH == FALSE)
	{
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"� ������ ����� ��������. � ��� ����������� ��������� ����������. ��� ������ ���� ���-�� �����, � �������� ���������.");
	};
	ITWR_SCREADSHALLSOFIRDORATH = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_MAGE_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_MAGE_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"... � � ������ ���� � ���������� ��������� ������, ����� �������� ��� ������ � ������ �������.");
	Doc_PrintLines(ndocid,0,"���� �� ��� ������ ����� �� �� ���� �������, ��� ������, ��������, ���������� �� ��.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,1,"");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"� ������, ��� ����� ������, ��� ��� ����� �����-�� ������������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"�� ������ ������, � ������ ���������� ���� �������� ��� ����������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"���� ���� ��������� ��������� �����.");
	Doc_Show(ndocid);
};


instance ITWR_XARDASSEAMAPBOOK_MIS(C_ITEM)
{
	name = "������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
	on_state[0] = use_xardasseamapbook_mis;
};


func void use_xardasseamapbook_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_BROWN_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_BROWN_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"... ������ � ����� ������, ��� ������, � ������� ���� ���� -- ������� ��������. ��� ��������� �� �������, �������� �� ������ ��������. ������� ������� � ���� ������ ������ �������� ...");
	Doc_PrintLines(ndocid,0,"");
	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(ndocid,0,"... ��� ��� �������, ���, ������, ��� ���� ���� �� �������� ��� ����-������. ��� ���������� �������� ����� ������, � � ���� ����� ������ ����������. ���� �� ��� ����� � ��� ����. ��� �������� ������ ���������, ��� ������ �� ����������� ��� ����������� ����� ...");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"... ���������� �������, ������, �� �� ��� �� ���������. � ����� ��� ������� � ��������� ��� ���� � ������ �������. ����� � ��� ����� ������� ������ �������. � ������ ���� ������������, ����������� ������������� ����. ���������� �� ����������� �� ��������� � ���������, ��� ��������� ������ ����� �� ...");
	};
	if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(ndocid,0,"... � �������� ���� �������� ���������� ���������! ����� ��������� ������, ��� ����������� ��� ������, ������� �� ������ ������������. ������ ��� ����� �����. ��� ������� ��������� ��������� ������ ����������, ������� � ������� �����, �� ������ ������. � �������, ��� ��������� ����� �������� �� ����� �����,");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLines(ndocid,1,"������� � ������� � ���� ��������� ���������� ��� ����.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"... ������ � ������. �� �� ����� ����������� ������. ��� ������ ������ �����������, ��� ���������� �����, �� ���������� � ���������� ����� ������ ��������� ����� � ���� ����. � ������ ����� ����������, ����� ��� ���� �����.");
	};
	if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(ndocid,0,"... � ����� �����, ����� �� ������ ����. ������, ������ � ���� ���� ���������������� ��� ��������. ��� ������ ����, ������, ���������� ��. ��������� ������, � ��� ���������� ��������� � ������ �����. ��� ����� ����� ��� ��� ���, �� �� �����, ������, ��� ������.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLines(ndocid,1,"� �� �� ���� ������, ����� ���� � ��������� �� ���, ��� ������ ����� ������ ���� � ���� ����.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"... � ������ �������� �������� � ����� � ���, ��� ������� ����������� ������ ������� ����������� ��������. ������, � ������� �� ����, ��� ��������� ����������� �����������. � ������� ������ � ���������, ���, �� ������ ������. ��� �����, ����� ����� �������� � ����� ������� - ����� ����, ���� ��������.");
	};
	Doc_Show(ndocid);
};


instance ITWR_USELAMPIDIOT_MIS(C_ITEM)
{
	name = "������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_uselampidiot_mis;
	scemename = "MAP";
	description = name;
	text[0] = "�� ����� '������� ��������'";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void useitwr_uselampidiot_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0," ");
	Doc_PrintLine(ndocid,0,"				");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"               ����� ����� ���� ");
	Doc_PrintLine(ndocid,0,"               ������ �������");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_SEAMAP_IRDORATH(C_ITEM)
{
	name = "������� ����� ������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Map_DI.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_seamap_irdorath;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_seamap_irdorath()
{
	var int ndocid;
	ndocid = Doc_CreateMap();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_NewWorld_Seamap.tga",1);
	Doc_Show(ndocid);
	if((MIS_SHIPISFREE == FALSE) && (KAPITEL < 6))
	{
		b_say(self,self,"$IRDORATHTHEREYOUARE");
	};
	if(MIS_SCKNOWSWAYTOIRDORATH == FALSE)
	{
		Log_CreateTopic(TOPIC_SHIP,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SHIP,LOG_RUNNING);
		b_logentry(TOPIC_SHIP,"������, � ������ ��������� �� ����� ��������� ���������� �������. �� ��� ����� ��� ����� �������, ������� � �������.");
		b_giveplayerxp(XP_SCKNOWSWAYTOIRDORATH);
	};
	MIS_SCKNOWSWAYTOIRDORATH = TRUE;
};


instance ITWR_FORGEDSHIPLETTER_MIS(C_ITEM)
{
	name = "����������� �������������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_forgedshipletter_mis;
	scemename = "MAP";
	description = name;
	text[3] = "������ � ������������� ����������";
	text[4] = "�� ������������ �������� ���������.";
};


func void useitwr_forgedshipletter_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     �������������� ����������");
	Doc_PrintLine(ndocid,0,"				");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"        ���� �������� �������� ������������");
	Doc_PrintLine(ndocid,0,"        ������ �������� �������������");
	Doc_PrintLine(ndocid,0,"        ����������� ������� ������� ����� ������");
	Doc_PrintLine(ndocid,0,"        � ������� ��������������� ������� �������.");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"            ����������� ������");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITKE_OC_MAINGATE_MIS(C_ITEM)
{
	name = "���� �� ����� ������� �����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_SHIP_LEVELCHANGE_MIS(C_ITEM)
{
	name = "���� �� ����������� �����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITPO_POTIONOFDEATH_01_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItPo_PotionOfDeath.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_potionofdeath;
	scemename = "POTIONFAST";
	description = "����� ������";
	text[3] = "������ ����������.";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_potionofdeath()
{
	if(hero.guild == GIL_KDF)
	{
		Wld_PlayEffect("spellFX_LIGHTSTAR_BLUE",hero,hero,0,0,0,FALSE);
		Snd_Play("SFX_HealObsession");
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA_MAX];
		Npc_ChangeAttribute(self,ATR_STRENGTH,5);
		Npc_ChangeAttribute(self,ATR_DEXTERITY,5);
		PrintScreen(PRINT_LEARNSTR5,-1,45,FONT_SCREEN,4);
		PrintScreen(PRINT_LEARNDEX5,-1,55,FONT_SCREEN,4);
		PrintScreen(PRINT_FULLYHEALED,-1,65,FONT_SCREEN,4);
		Mdl_ApplyOverlayMdsTimed(self,"HUMANS_SPRINT.MDS",TIME_SPEED);
	}
	else
	{
		AI_Wait(hero,3);
		AI_PlayAni(self,"S_FIRE_VICTIM");
		Wld_PlayEffect("VOB_MAGICBURN",hero,hero,0,0,0,FALSE);
		b_say(self,self,"$Dead");
		AI_StopFX(self,"VOB_MAGICBURN");
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		Npc_StopAni(self,"S_FIRE_VICTIM");
	};
};


instance ITPO_POTIONOFDEATH_02_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 10;
	visual = "ItPo_PotionOfDeath.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_potionofdeath;
	scemename = "POTIONFAST";
	description = "����� ������";
	text[1] = "��� ����� �������� ����� ���� ������� �������������.";
	text[2] = "����� ������ ��������� ���, ������ ���� ������.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAM_AMULETTOFDEATH_MIS(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItAm_AmulettOfDeath_Mis.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_amulettofdeath_mis;
	on_unequip = unequip_itam_amulettofdeath_mis;
	description = "������������ ���� ������";
	text[0] = "���� ������ �������� ��������� �� ���� ���� �����.";
	text[1] = NAME_PROT_EDGE;
	count[1] = 20;
	text[2] = NAME_PROT_POINT;
	count[2] = 20;
	text[3] = NAME_PROT_FIRE;
	count[3] = 20;
	text[4] = NAME_PROT_MAGIC;
	count[4] = 20;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itam_amulettofdeath_mis()
{
	self.protection[PROT_EDGE] += 20;
	self.protection[PROT_BLUNT] += 20;
	self.protection[PROT_POINT] += 20;
	self.protection[PROT_FIRE] += 20;
	self.protection[PROT_MAGIC] += 20;
	Wld_PlayEffect("spellFX_LIGHTSTAR_WHITE",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("MFX_FIRERAIN_INVEST");
};

func void unequip_itam_amulettofdeath_mis()
{
	self.protection[PROT_EDGE] -= 20;
	self.protection[PROT_BLUNT] -= 20;
	self.protection[PROT_POINT] -= 20;
	self.protection[PROT_FIRE] -= 20;
	self.protection[PROT_MAGIC] -= 20;
};


instance ITPO_HEALRANDOLPH_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_HPESSENZ;
	visual = "ItPo_HealRandolph.3ds";
	material = MAT_GLAS;
	on_state[0] = use_healrandolph;
	scemename = "POTIONFAST";
	description = "��������� �� ��������";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_healrandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
};

