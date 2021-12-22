
instance ITMI_INNOSEYE_MIS(C_ITEM)
{
	name = "���� ������";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = equip_innoseye;
	on_unequip = unequip_innoseye;
	text[0] = "� ����� ���������� �������.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_innoseye()
{
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Standup(self);
	Snd_Play("SFX_INNOSEYE");
	self.protection[PROT_EDGE] += AM_TPROTEDGE;
	self.protection[PROT_BLUNT] += AM_TPROTEDGE;
	self.protection[PROT_POINT] += AM_TPROTPOINT;
	self.protection[PROT_FIRE] += AM_TPROTFIRE;
	self.protection[PROT_MAGIC] += AM_TPROTMAGE;
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};

func void unequip_innoseye()
{
	self.protection[PROT_EDGE] -= AM_TPROTEDGE;
	self.protection[PROT_BLUNT] -= AM_TPROTEDGE;
	self.protection[PROT_POINT] -= AM_TPROTPOINT;
	self.protection[PROT_FIRE] -= AM_TPROTFIRE;
	self.protection[PROT_MAGIC] -= AM_TPROTMAGE;
};


instance ITMI_INNOSEYE_DISCHARGED_MIS(C_ITEM)
{
	name = "���� ������";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_Discharged_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = equip_itmi_innoseye_discharged_mis;
	text[0] = "���� ����� � �� �����.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itmi_innoseye_discharged_mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ITMI_INNOSEYE_BROKEN_MIS(C_ITEM)
{
	name = "���� ������";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_Broken_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = equip_itmi_innoseye_broken_mis;
	text[0] = TEXT_INNOSEYE_SETTING;
	text[1] = TEXT_INNOSEYE_GEM;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itmi_innoseye_broken_mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ITWR_PERMISSIONTOWEARINNOSEYE_MIS(C_ITEM)
{
	name = "������ ��� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_permissiontowearinnoseye;
	scemename = "MAP";
	description = name;
	text[0] = "� ������������� ����������.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_permissiontowearinnoseye()
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
	Doc_PrintLines(ndocid,0,"������������ ����� ��������� �������� ����� ����� � ��������� ���� ���������.");
	Doc_PrintLines(ndocid,0,"��� ���������, ���������� �������� ������ ������ ������ ����������� ����������.");
	Doc_PrintLines(ndocid,0,"������������� ������� ������� �������������� ���������� ���� ���� ������� � �������� ���������� ����� ������� � ������������� ������, � ����� �������� ������� � ���������� ������ ������ �� 2 ���� �� ����.");
	Doc_PrintLines(ndocid,0,"P.S. � ������ ���������������� ���������� ���� ��������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�� ������ ����� ������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"        ���� �����");
	Doc_Show(ndocid);
};


instance ITWR_XARDASBOOKFORPYROKAR_MIS(C_ITEM)
{
	name = "������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_03_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	on_state[0] = use_xardasbookforpyrokar;
};


func void use_xardasbookforpyrokar()
{
	Print(PRINT_IRDORATHBOOKDOESNTOPEN);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ITKE_CHEST_SEKOB_XARDASBOOK_MIS(C_ITEM)
{
	name = "���� ��������";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "�� ������� �� ����� ������.";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITWR_CORNELIUSTAGEBUCH_MIS(C_ITEM)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[0] = "������� ����������.";
	on_state[0] = usecorneliustagebuch;
};


func void usecorneliustagebuch()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"���� ������ ����� ���������� � ��� �� ����, ��� �������� ������ ����������� ���� ������ �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"���-�� ������� ��������� �� ���� ������� �����. ��� ����� ����� ���� �� ���� ������ � ������ ���������, � ������� ����� ������� ������ ��������� �����. � �� �����-�� ���������, ���� �������� �� ��, ���, ��� �������, ��� - ���� ���. ��� ���� �����-���� �������� ����. �� ����� ��� ��������� � ������������� � ����.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"�� ��������� ��� 20000 ������� �� ��, ����� ���� �� ��������� ��� �������. �� ������, ��� � �����, ��� �� ���� � ����, ����� ��� ����������.");
	Doc_PrintLines(ndocid,1,"������� ��, � ����������. ��� �������� ��� ����� �� ����������� ������ ������. ���� �� �� ���, � ���� ��� ���� �� ������. � ��� ������ �������� ��� �������� ��������� ��������.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"��� ��������� -- ���� �� ��������� ��� ���������. �������� ��� ����� ����� ������.");
	Doc_Show(ndocid);
	if(CORNELIUS_ISLIAR == FALSE)
	{
		b_logentry(TOPIC_RESCUEBENNET,"���� ������� - ��������������, ����������� ��� ������������� ������������ �������.");
		CORNELIUS_ISLIAR = TRUE;
	};
};


instance ITWR_DEMENTOROBSESSIONBOOK_MIS(C_ITEM)
{
	name = "�������� ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_03_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	on_state[0] = use_dementorobsessionbook;
};


func void use_dementorobsessionbook()
{
	var int ndocid;
	Wld_PlayEffect("spellFX_Fear",hero,hero,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
	SC_OBSESSIONCOUNTER = 100;
	b_scisobsessed(hero);
	if(hero.guild == GIL_KDF)
	{
		ndocid = Doc_Create();
		Doc_SetPages(ndocid,2);
		Doc_SetPage(ndocid,0,"BOOK_MAGE_L.tga",0);
		Doc_SetPage(ndocid,1,"BOOK_MAGE_R.tga",0);
		Doc_SetMargins(ndocid,0,275,20,30,20,1);
		Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
		Doc_PrintLine(ndocid,0,"");
		Doc_SetFont(ndocid,0,FONT_BOOK);
		Doc_PrintLines(ndocid,0,"edef Kon dirandorix");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"in Sparady bell ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"el utoy");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"Kho ray xaondron");
		Doc_PrintLines(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLines(ndocid,0,"em piratoram endro");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLine(ndocid,1,"");
		if(KAPITEL >= 3)
		{
			Doc_PrintLine(ndocid,1,"           ����");
			Doc_PrintLine(ndocid,1,"��������");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"        �����");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"������");
		};
		if(KAPITEL >= 4)
		{
			Doc_PrintLine(ndocid,1,"    ������");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"        ��������");
			Doc_PrintLine(ndocid,1,"");
		};
		if(KAPITEL >= 5)
		{
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"�����");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"            ������");
			Doc_PrintLine(ndocid,1,"");
		};
		Doc_Show(ndocid);
	};
};


instance ITWR_PYROKARSOBSESSIONLIST(C_ITEM)
{
	name = "���������� ������ ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_pyrokarsobsessionlist;
	scemename = "MAP";
	description = name;
};


func void use_pyrokarsobsessionlist()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"���������");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	if(KAPITEL >= 3)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"��������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������");
	};
	if(KAPITEL >= 4)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"��������");
	};
	if(KAPITEL >= 5)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"�����");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"������");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
	};
	Doc_Show(ndocid);
};


instance ITPO_HEALHILDA_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_HPESSENZ;
	visual = "ItPo_HealHilda.3ds";
	material = MAT_GLAS;
	on_state[0] = use_healhilda;
	scemename = "POTIONFAST";
	description = "��������� �� ������ ���������";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_healhilda()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
};


instance ITMW_MALETHSGEHSTOCK_MIS(C_ITEM)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_AXE;
	material = MAT_WOOD;
	value = 15;
	damagetotal = 10;
	damagetype = DAM_BLUNT;
	range = RANGE_VLKMACE;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_VLKMACE;
	visual = "Itmw_008_1h_pole_02.3ds";
	description = name;
	text[0] = "�� ������ �������� ����� '�.'";
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_MALETHSBANDITGOLD(C_ITEM)
{
	name = NAME_BAG;
	mainflag = ITEM_KAT_NONE;
	flags = 0;
	value = 300;
	visual = "ItMi_Bag.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_malethsbanditgold;
	description = name;
	text[0] = "���� ����� ������� ����� ��������!";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_malethsbanditgold()
{
	CreateInvItems(hero,itmi_gold,300);
	Print(PRINT_MALETHBANDITSGOLD);
	Snd_Play("Geldbeutel");
};


instance ITMI_MOLERATLUBRIC_MIS(C_ITEM)
{
	name = "��� ����������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_PITCH;
	visual = "ItMi_Moleratlubric.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_BABOSLETTER_MIS(C_ITEM)
{
	name = "������ ����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babosletter;
	scemename = "MAP";
	description = "������ ����";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_babosletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"������� ����,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"��, ���������, ��������� ��������, ��� �� ������ �������� ���� ��� ������. �� ������� ��� ���� ���������� ������� ������� � ��������� ��� �������� ��� �������. �� ������ ���� ����� ���������� � �������� ���� ������� � �������� ����������� ����, ����� �� ������ ������ � ��� �� ����� ������ ����� � ���������.");
	Doc_PrintLines(ndocid,0,"�����. ��������, ���� ���������� ��� �������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"���� � �����");
	Doc_Show(ndocid);
};


instance ITWR_BABOSPINUP_MIS(C_ITEM)
{
	name = "����������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_BabosPinUp_MIS.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babospinup;
	scemename = "MAP";
	description = "����������� ����� �������";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_babospinup()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Map_Pinup.TGA",0);
	Doc_Show(ndocid);
};


instance ITWR_BABOSDOCS_MIS(C_ITEM)
{
	name = "������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babosdocs;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "��������� ����������,";
	text[3] = "���������� ������.";
};


func void use_babosdocs()
{
	BABOSDOCSOPEN = TRUE;
	AI_PrintScreen("�������� ������ � �������",-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
	CreateInvItems(self,itwr_babosletter_mis,1);
	CreateInvItems(self,itwr_babospinup_mis,1);
};


instance ITKE_IGARAZCHEST_MIS(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� �������,";
	text[3] = "�������������� �������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITWR_ASTRONOMY_MIS(C_ITEM)
{
	name = "������������ ���� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 400;
	visual = "ItWr_Book_02_02.3ds";
	material = MAT_LEATHER;
	on_state[0] = use_astronomy;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


var int astronomy_once;

func void use_astronomy()
{
	var int ndocid;
	if(ASTRONOMY_ONCE == FALSE)
	{
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 2;
		Print(PRINT_READASTRONOMY);
		ASTRONOMY_ONCE = TRUE;
	};
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Mage_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Mage_R.tga",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"... �� ����� ���� ���� ������������ � ������� �����, ����� ��������� �������� �������.");
	Doc_PrintLines(ndocid,0,"��������������� ���� ���� � ������������� ����� ����� �������� ������� ������ ���. ����������� ������� ����� ����������� ���������� ������ - ����� ������, ��� ������� ����� ������� �������� ����������� ���������� � ��� ���.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"��� ����� ��������� ���������� �����, �������� ��� �� ������� ���� ������� ������, ����� ����� ����� ������ ���� ��� ������. ��� ������� ��� ����� ������ � ���������� ������ ����, � ��������� ���������� � ������ ��� ��� �������� �� ����� ���.");
	Doc_PrintLines(ndocid,1,"���� ����� ������ �����-���� ��������� �����, �� �� ������� ��� �����, ��� ��� �� ����� ���������� ������ ��� ������ ����� ���.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"");
	Doc_Show(ndocid);
};


var int sc_obsessiontimes;

instance ITPO_HEALOBSESSION_MIS(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_HPESSENZ;
	visual = "ItPo_HealObsession.3ds";
	material = MAT_GLAS;
	on_state[0] = use_healobsession;
	scemename = "POTIONFAST";
	description = "��������� �� �����������";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_healobsession()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
	SC_OBSESSIONTIMES = SC_OBSESSIONTIMES + 1;
	b_clearscobsession(self);
	Wld_PlayEffect("spellFX_LIGHTSTAR_VIOLET",hero,hero,0,0,0,FALSE);
	Snd_Play("SFX_HealObsession");
};


instance ITSE_GOLEMCHEST_MIS(C_ITEM)
{
	name = NAME_Beutel;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_Pocket.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_golemchest;
	description = name;
	text[0] = "";
	text[1] = "";
	text[2] = "���� ������� ����� �����.";
	text[3] = "�������, ������ ����������� ���-�� ���.";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_golemchest()
{
	CreateInvItems(hero,itmi_gold,50);
	Print(PRINT_FOUNDGOLD50);
	Print(PRINT_FOUNDRING);
	CreateInvItems(hero,itri_prot_total_02,1);
	Snd_Play("Geldbeutel");
};


instance ITWR_SHATTEREDGOLEM_MIS(C_ITEM)
{
	name = "����� ������ �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 150;
	visual = "ItWr_Map_NW_02.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_shatteredgolem_mis;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_shatteredgolem_mis()
{
	var int document;
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_ShatteredGolem.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


instance ITWR_DIEGOSLETTER_MIS(C_ITEM)
{
	name = "������ �� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_diegosletter_mis;
	scemename = "MAP";
	description = "������ ����� ����������";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_diegosletter_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"���������, ");
	Doc_PrintLines(ndocid,0,"������, ���� ������ ����� ����.");
	Doc_PrintLines(ndocid,0,"� �������� � ����� � ��� ����. � ����� � ����� ����, � ������� ���� ��� �������. �� ������ ���� ������, ��� ��� �� �������, ���� ��� ����� �� ������� ������ ������.");
	Doc_PrintLines(ndocid,0,"�������, ��� ����� �� ������� ���� �� ������, �� � �� �����, ��� � ���� ���������. ��� �, �� ��������.");
	Doc_PrintLines(ndocid,0,"� ������ �� ���, ��� ����������� ��� �� �����.");
	Doc_PrintLines(ndocid,0,"���� ������������ ���� �������� � ����� - ��� ������� ���� �������� � �������� ���� ������ ���. ����� �� ����� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�����");
	Doc_Show(ndocid);
};


instance ITSE_DIEGOSTREASURE_MIS(C_ITEM)
{
	name = NAME_Beutel;
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = DiegosTreasure;
	visual = "ItMi_Pocket_Mis.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_diegostreasure;
	description = name;
	text[0] = PRINT_POCKET_MIS;
	text[1] = "� ������ '�����'.";
	text[2] = "������ ����� ���� ������!";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_diegostreasure()
{
	CreateInvItems(self,itmi_gold,DIEGOSTREASURE);
	Print(PRINT_DIEGOSTREASURE);
	Snd_Play("Geldbeutel");
	OPENEDDIEGOSBAG = TRUE;
};


instance ITMI_ULTHARSHOLYWATER_MIS(C_ITEM)
{
	name = "������ ���� �������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_HOLYWATER;
	visual = "ItMi_UltharsHolyWater.3ds";
	material = MAT_WOOD;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};


var int itwr_minenanteil_mis_onetime;

instance ITWR_MINENANTEIL_MIS(C_ITEM)
{
	name = "����� ������� ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_HPELIXIER;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_minenanteil_mis;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_minenanteil_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"����� �������");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�������� ������������ ������������� � �������������, ������������ ����� ��������� ������ ����� �� ���������� ������ ����� � ����������� ������.");
	Doc_PrintLines(ndocid,0,"������������� ������ ������ ������ ���� ���������� ������������� � ���� ������.");
	Doc_PrintLines(ndocid,0,"�������� ������ � ��������������� �������, ������ ���������� 16 ����� � �������������� ��������� � 3 ���� �� ���������.");
	Doc_PrintLines(ndocid,0,"����������� ���������� ����� ����� �� ��������� ������ � ������ ������������ �����.");
	Doc_PrintLines(ndocid,0,"���� ��������� �� � ��������� ������� �����, ��� ����� �� ����� ������������ � �����������.");
	Doc_PrintLine(ndocid,0,"         �������");
	Doc_PrintLine(ndocid,0,"      ����������� ����������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                ���������");
	Doc_Show(ndocid);
	SC_KNOWSPROSPEKTORSALANDRIL = TRUE;
	if(ITWR_MINENANTEIL_MIS_ONETIME == FALSE)
	{
		b_logentry(TOPIC_MINENANTEILE,"�����, ���������� ����� ����� ���������, ����� ���������. ��������, � ����� ����� ��� � ������� ����� ��������, ���� �� ��� �� ����� ��������� �� ����������.");
		if(Npc_IsDead(salandril))
		{
			b_logentry(TOPIC_MINENANTEILE,"��������� �����. ��� ����� �������� ��� ����������.");
		};
		ITWR_MINENANTEIL_MIS_ONETIME = TRUE;
	};
};


instance ITAM_PROT_BLACKEYE_MIS(C_ITEM)
{
	name = NAME_AMULETT;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = VALUE_AM_HPMANA;
	visual = "ItAm_Prot_BlackEye_Mis.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "������ ������ ���";
	text[2] = "������ �� ������.";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

instance ITMI_KARRASBLESSEDSTONE_MIS(C_ITEM)
{
	name = "������ �� �������������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_KarrasBlessedStone.3ds";
	visual_skin = 0;
	material = MAT_STONE;
	description = name;
	inv_zbias = 190;
};

instance ITWR_RICHTERKOMPROBRIEF_MIS(C_ITEM)
{
	name = "��������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_richterkomprobrief;
	scemename = "MAP";
	description = name;
};


func void use_richterkomprobrief()
{
	var int ndocid;
	SCKNOWSRICHTERKOMPROBRIEF = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"���������, ��, ��������� ����� ���. ������� ��� ������, ��� ��� �������� �������� ������ ������� ������������� � ���������� ��� ����.");
	Doc_PrintLines(ndocid,0,"��� ������ ���� ������� ������ �����. ������ ���������� ��������������.");
	Doc_PrintLines(ndocid,0,"���� �� �� ������� ������ �� ��� �������� ������, ����� ����� ������� ������. � ������ ���, ��� �� ��������� ��� ������� ������� �� �������� �������.");
	Doc_PrintLines(ndocid,0,"�� �� ��������� � ���� ��������, ��� ��������� ������� ����, � ������ �������� �� �������.");
	Doc_PrintLines(ndocid,0,"������: ���� �� ��������� ���������� ��� ����, � �� ��������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"          ������� ����� � ");
	Doc_PrintLine(ndocid,0,"          ����������� ���������");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_MORGAHARDTIP(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_morgahardtip;
	scemename = "MAP";
	description = name;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_morgahardtip()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"� �����. �������, �� ���������� �����, ����� ��� ������� ����������.");
	Doc_PrintLines(ndocid,0,"�� ����������, �����. � ������� ������, � ������� ����� ������.");
	Doc_PrintLines(ndocid,0,"��� ����� ������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                           �.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_MAP_SHRINE_MIS(C_ITEM)
{
	name = "����� ��������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 200;
	visual = "ItWr_Map_NW_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_map_newworld_shrine_mis;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_map_newworld_shrine_mis()
{
	var int document;
	document = Doc_CreateMap();
	Doc_SetPages(document,1);
	Doc_SetPage(document,0,"Map_NewWorld_Shrine.tga",TRUE);
	Doc_SetLevel(document,"NewWorld\NewWorld.zen");
	Doc_SetLevelCoords(document,-28000,50500,95500,-42500);
	Doc_Show(document);
};


instance ITWR_VINOSKELLERGEISTER_MIS(C_ITEM)
{
	name = "��� ����";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = use_vinoskellergeister_mis;
};


func void use_vinoskellergeister_mis()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"BOOK_RED_L.tga",0);
	Doc_SetPage(ndocid,1,"BOOK_RED_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"���� ���������");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"... � ��� ������ ������������, �� ���� ����, ��� ��� �������� ��� ��-�� ������� �� ������� ������, ��������� ��� �������� ...");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"... ��� ����� ��������� ��������� � ���, ��� ����� ����� � ���� ����� ������ ...");
	Doc_PrintLines(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"... ���� ��� ������. �� ��� ��� �� �� �� ���� �� �����, ��� ����� ���������, ���� ���� �������� �� ����� ���������� ��������������. �� �����������, ��� ����� ������ ���������, ���� ��� ������ ���� �����. ��� ����� ���� �������� ���� �� ������ ...");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"... ��� ����� ���������������. ��� ����� �������� ��� �������, ���� ��� �� ���������� �������, � ������� � ����� ������, ����� ���� ������, ��� ����� ���� ������ �� ������������ ...");
	Doc_Show(ndocid);
};

