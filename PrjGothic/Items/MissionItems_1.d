
instance ITKE_XARDAS(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "���� �� �������,";
	text[3] = "�������������� ��������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITWR_CANTHARS_KOMPROBRIEF_MIS(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_canthars_komprobrief;
	scemename = "MAP";
	description = "������ ������� �������� ����";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_canthars_komprobrief()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     ��������� ��������������");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"        � ��� ��������� ��� ��������� ����,");
	Doc_PrintLine(ndocid,0,"        �������� ���� ��������,");
	Doc_PrintLine(ndocid,0,"        ��� ��� ������ ���������� ������,");
	Doc_PrintLine(ndocid,0,"        ���������� � ���� ������");
	Doc_PrintLine(ndocid,0,"        �����.");
	Doc_PrintLine(ndocid,0,"        ���� � ������ �� ������ �� ���� �������");
	Doc_PrintLine(ndocid,0,"        ������, ����, � ���� �������� ��������");
	Doc_PrintLine(ndocid,0,"        ���� ��������� � ����. �������, ");
	Doc_PrintLine(ndocid,0,"        �� �������� ���� �����!!!!!!!!!!!!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"            ����");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITMW_2H_ROD(C_ITEM)
{
	name = "��������� ��� ����";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_2HD_SWD;
	material = MAT_METAL;
	value = VALUE_SLD2HSCHWERT;
	damagetotal = 35;
	damagetype = DAM_EDGE;
	range = RANGE_SLD2HSCHWERT;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 30;
	visual = "ItMw_035_2h_sld_sword_02.3DS";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_TWOHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_CORAGONSSILBER(C_ITEM)
{
	name = "������� ��������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_SILVERCUP;
	visual = "ItMi_CoragonsSilber.3DS";
	material = MAT_METAL;
	description = name;
	text[3] = "";
	text[4] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITMI_THEKLASPAKET(C_ITEM)
{
	name = "����� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_Packet.3ds";
	scemename = "MAPSEALED";
	material = MAT_LEATHER;
	on_state[0] = use_theklaspacket;
	description = name;
};


func void use_theklaspacket()
{
	CreateInvItems(hero,itpl_mana_herb_01,3);
	CreateInvItems(hero,itpl_health_herb_02,1);
	CreateInvItems(hero,itpl_speed_herb_01,1);
	CreateInvItems(hero,itpl_blueplant,2);
	Print(PRINT_GOTPLANTS);
};


instance ITMI_MARIASGOLDPLATE(C_ITEM)
{
	name = "������� ������� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDPLATE;
	visual = "ItMi_MariasGoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "�� ���� ����� �������������";
	text[3] = "�����: ���� � �����.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRI_PROT_EDGE_01_VALENTINO(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING;
	value = VALUE_RI_PROTEDGE;
	visual = "ItRi_Prot_Edge_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_edge_01;
	on_unequip = unequip_itri_prot_edge_01;
	description = "������ �������� ����";
	text[0] = "��� ������ ����������� ���������.";
	text[2] = NAME_PROT_EDGE;
	count[2] = RI_PROTEDGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ITKE_DEXTER(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "���� �� �������,";
	text[3] = "�������������� ��������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITWR_KRAEUTERLISTE(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_kraeuterliste;
	scemename = "MAP";
	description = "������ ���� �����������";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_kraeuterliste()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"������������ �����");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�������� �����");
	Doc_PrintLine(ndocid,0,"�������� ��������");
	Doc_PrintLine(ndocid,0,"�������� ������");
	Doc_PrintLine(ndocid,0,"�������� �������");
	Doc_PrintLine(ndocid,0,"�������� �����");
	Doc_PrintLine(ndocid,0,"�������� ������");
	Doc_PrintLine(ndocid,0,"���������� �����");
	Doc_PrintLine(ndocid,0,"�������� ������");
	Doc_PrintLine(ndocid,0,"�������-�����");
	Doc_PrintLine(ndocid,0,"������� �����");
	Doc_PrintLine(ndocid,0,"������� ������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"����������: ����� �������� � ������� ������� ��� ����� ��� ����. ��� �������� ��������� ��� �����������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"� ���������, �����.");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_MANAREZEPT(C_ITEM)
{
	name = "������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_manarezept;
	scemename = "MAP";
	description = "������ ���������� ��������";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void use_manarezept()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"���������� �����");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"����� ������� ���������� �����, �������� �������� ����������:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�������� �������");
	Doc_PrintLine(ndocid,0,"�������� �����");
	Doc_PrintLine(ndocid,0,"�������� ������");
	Doc_PrintLines(ndocid,0,"����� ��� �����������");
	Doc_PrintLine(ndocid,0,"������� �����");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"������ ������");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_PASSIERSCHEIN(C_ITEM)
{
	name = "�������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepassierschein;
	scemename = "MAP";
	description = name;
	text[3] = "��� ������ �������� ���";
	text[4] = "������ ���� ���������� � �����.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usepassierschein()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOKHEADLINE);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"     �������");
	Doc_PrintLine(ndocid,0,"            �������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"        ���� �������� ���� �����");
	Doc_PrintLine(ndocid,0,"        ���������� ������� �� ����� �������");
	Doc_PrintLine(ndocid,0,"        �������� �� �������������� ������ �������.");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"            ������");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"            ����������� ����������");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITMI_HERBPAKET(C_ITEM)
{
	name = "��� �����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_HerbPaket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "�������, ������ ���,";
	text[3] = "�������� �������� ������.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_STORAGE(C_ITEM)
{
	name = "���� �� ������";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "���� �� ���������";
	text[3] = "������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};


const int HP_HERING = 20;

instance ITFO_SMELLYFISH(C_ITEM)
{
	name = "�������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = 20;
	visual = "ItFo_SmellyFish.3DS";
	material = MAT_LEATHER;
	scemename = "FOODHUGE";
	on_state[0] = use_smellyfish;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_HERING;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_smellyfish()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_HERING);
};


instance ITFO_HALVORFISH_MIS(C_ITEM)
{
	name = "�������� ����";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_halvorfish;
	description = name;
	text[2] = "���-�� � ���� ����� �� ���.";
	text[3] = "������, ��� ���� ������...";
};


func void use_halvorfish()
{
	CreateInvItems(hero,itwr_halvormessage,1);
	Print(PRINT_FISHLETTER);
};


instance ITWR_HALVORMESSAGE(C_ITEM)
{
	name = "������� �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usehalvormessage;
	scemename = "MAP";
	description = name;
	text[2] = "��� ������� ���� �������� � ����.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usehalvormessage()
{
	var int ndocid;
	KNOWS_HALVOR = TRUE;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"    �� �������������, �����!");
	Doc_PrintLines(ndocid,0,"    ��������� ���������� ��������������.");
	Doc_PrintLines(ndocid,0,"    �� �������������� ������,");
	Doc_PrintLines(ndocid,0,"    ���� � �� ��� ����� � ����!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"    ������");
	Doc_Show(ndocid);
};


instance ITMW_ALRIKSSWORD_MIS(C_ITEM)
{
	name = "��� �������";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_SWD;
	material = MAT_METAL;
	value = 50;
	damagetotal = 25;
	damagetype = DAM_EDGE;
	range = 70;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = 20;
	visual = "ItMw_025_1h_Sld_Sword_02.3DS";
	on_equip = equip_alrikssword;
	on_unequip = unequip_alrikssword;
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_STR_NEEDED;
	count[3] = cond_value[2];
	text[4] = NAME_ONEHANDED;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void equip_alrikssword()
{
	b_addfightskill(self,NPC_TALENT_1H,10);
};

func void unequip_alrikssword()
{
	b_addfightskill(self,NPC_TALENT_1H,-10);
};


instance ITWR_VATRASMESSAGE(C_ITEM)
{
	name = "������������ ��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usevatrasmessage;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "�������� �������";
	text[3] = "����� ����";
};


func void usevatrasmessage()
{
	var int ndocid;
	CreateInvItems(self,itwr_vatrasmessage_open,1);
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"������� �������,");
	Doc_PrintLines(ndocid,0,"� ������ ��� ����������� ����������� ������ ����.");
	Doc_PrintLines(ndocid,0,"��� ����, ������ ��������� ���. ����� �� ���� ���, ��� ������� ������� ��� ������?");
	Doc_PrintLines(ndocid,0,"� ���� ���������, �� � ����, ��� ���� �������� ������ �� ����������� � ���� ��������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�� �� ��������� ���� ������� ��� ������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"������");
	Doc_Show(ndocid);
};


instance ITWR_VATRASMESSAGE_OPEN(C_ITEM)
{
	name = "��������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usevatrasmessageopen;
	scemename = "MAP";
	description = name;
	text[2] = "�������� �������";
	text[3] = "����� ����";
	text[4] = "������ �������.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usevatrasmessageopen()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"������� �������,");
	Doc_PrintLines(ndocid,0,"� ������ ��� ����������� ����������� ������ ����.");
	Doc_PrintLines(ndocid,0,"��� ����, ������ ��������� ���. ����� �� ���� ���, ��� ������� ������� ��� ������?");
	Doc_PrintLines(ndocid,0,"� ���� ���������, �� � �������, ��� ���� �������� ������ �� ����������� � ���� ��������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�� �� ��������� ���� ������� ��� ������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"������");
	Doc_Show(ndocid);
};


instance ITKE_HOTEL(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "���� �� �������";
	text[3] = "�����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_THIEFGUILDKEY_MIS(C_ITEM)
{
	name = "������ ����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "���� ���� ������� ������� ������� �����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_THIEFGUILDKEY_HOTEL_MIS(C_ITEM)
{
	name = "������ ����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ������� �����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_INNOS_MIS(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ����� �";
	text[3] = "��������� ������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_KLOSTERSCHATZ(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ������������";
	text[3] = "������������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_KLOSTERSTORE(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ������������";
	text[3] = "��������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_KDFPLAYER(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ������������";
	text[3] = "�����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_KLOSTERBIBLIOTHEK(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� ������������";
	text[3] = "����������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITFO_SCHAFSWURST(C_ITEM)
{
	name = "������� �������";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_SAUSAGE;
	visual = "ItFo_Schafswurst.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	on_state[0] = use_schafswurst;
	description = name;
	text[1] = NAME_BONUS_HP;
	count[1] = HP_SAUSAGE;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void use_schafswurst()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_SAUSAGE);
};


instance ITPO_PERM_LITTLEMANA(C_ITEM)
{
	name = NAME_TRANK;
	mainflag = ITEM_KAT_POTIONS;
	flags = ITEM_MULTI;
	value = 150;
	visual = "ItMi_UltharsHolyWater.3ds";
	material = MAT_GLAS;
	on_state[0] = useitpo_littlemana;
	scemename = "POTIONFAST";
	description = "�������� ����";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = 3;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_littlemana()
{
	b_raiseattribute(self,ATR_MANA_MAX,3);
};


instance HOLY_HAMMER_MIS(C_ITEM)
{
	name = "��������� �����";
	mainflag = ITEM_KAT_NF;
	flags = ITEM_MISSION | ITEM_2HD_AXE;
	material = MAT_METAL;
	value = VALUE_HOLYHAMMER;
	owner = nov_608_garwig;
	damagetotal = DAMAGE_HOLYHAMMER;
	damagetype = DAM_BLUNT;
	range = RANGE_HOLYHAMMER;
	cond_atr[2] = ATR_STRENGTH;
	cond_value[2] = CONDITION_HOLYHAMMER;
	visual = "ItMw_030_2h_kdf_hammer_01.3DS";
	description = name;
	text[2] = "���� ����������";
	text[3] = "���������� � ���� ����������";
	text[4] = NAME_TWOHANDED;
	text[5] = "���� ����������";
};

instance ITKE_MAGICCHEST(C_ITEM)
{
	name = "������ ����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "������ �������� ����.";
	text[3] = "��������, ��� ����";
	text[4] = "�� �������� �����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITWR_PASSAGE_MIS(C_ITEM)
{
	name = "����������� ���� ���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepassage;
	scemename = "MAP";
	description = name;
	text[3] = "��� ������� ������ ������ ���";
	text[4] = "����������� � ������ �������.";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usepassage()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"���������������� ���� �����,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�� ��� ��������� �����, � ����� �������� �� ����������. �, �������� ��������������, � ��������� ��������� ����������:");
	Doc_PrintLines(ndocid,0,"�� ������� ���� ����� ������ ��������� ������ ����� ������� � �������.");
	Doc_PrintLines(ndocid,0,"������, �� ���������� ��� ���� ������ � ������� ������ � ����������� ������.");
	Doc_PrintLines(ndocid,0,"����� ����, � ����� �������� �� ���, ����� ��� ���� ��������� �������� �� ������� ���� - �� �����������, �����������, ����� �����, ��� �� ���������������.");
	Doc_PrintLines(ndocid,0,"� ����, ��� �� �������, �� ������� �� ����������� ����������� �� �������, ������ ���������� �����, ��� ��� ����, ��� � ��� ���� ��������� �����. ����� �� ��������� ������, � ���� ���� ���� �� �����.");
	Doc_PrintLines(ndocid,0,"� ������ ���: ������� ������� �� ���� �������� ��� ���������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"�������:   ������� ��");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_BANDITLETTER_MIS(C_ITEM)
{
	name = "���������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usebanditletter;
	scemename = "MAP";
	description = name;
	text[3] = "";
	text[4] = "";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void usebanditletter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"letters.TGA",0);
	Doc_SetMargins(ndocid,-1,50,50,50,50,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"������������ ����, ������������ � ���.");
	Doc_PrintLine(ndocid,0,"������ ��������, ��� ����� ������, ");
	Doc_PrintLine(ndocid,0," ���������� ������ ������.");
	Doc_PrintLine(ndocid,0,"�� ����� ��� �������� ��� -");
	Doc_PrintLine(ndocid,0,"    ��� ����� ������� ������.   ");
	Doc_PrintLine(ndocid,0,"�������������� �� ���.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"��������, �������, �������� �� ����,");
	Doc_PrintLine(ndocid,0,"    ������ � ��� �� �����.    ");
	Doc_PrintLine(ndocid,0,"� ���� ������� � ������� ���");
	Doc_PrintLine(ndocid,0,"    �������� ������� �����.");
	Doc_PrintLine(ndocid,0,"� ��� ��� �������� ����� ������,");
	Doc_PrintLine(ndocid,0,"    ��� ����� ����� ��������.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"��������� ��� ������ � ������ �����");
	Doc_PrintLine(ndocid,0,"    ����� �������� ��������������.");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"�.");
	Doc_PrintLine(ndocid,0,"		");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_POSTER_MIS(C_ITEM)
{
	name = "���������� � �������";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Poster_MIS.3DS";
	material = MAT_LEATHER;
	on_state[0] = useposter;
	scemename = "MAP";
	description = name;
	text[3] = "��� �����������!";
	text[4] = "";
	inv_rotz = 180;
	inv_rotx = 90;
	inv_roty = 180;
};


func void useposter()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,1);
	Doc_SetPage(ndocid,0,"Gesucht.TGA",0);
	Doc_Show(ndocid);
};


instance ITKE_BANDIT(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "���� ���� �����������";
	text[3] = "�������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITMI_BALTRAMPAKET(C_ITEM)
{
	name = "����� ���������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "������� ��� �";
	text[3] = "������� ������.";
};

instance ITRW_BOW_L_03_MIS(C_ITEM)
{
	name = "��������� ���";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_BOW | ITEM_MISSION;
	material = MAT_WOOD;
	value = VALUE_JAGDBOGEN;
	damagetotal = DAMAGE_JAGDBOGEN;
	damagetype = DAM_POINT;
	munition = itrw_arrow;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_JAGDBOGEN;
	visual = "ItRw_Bow_L_03.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[4] = "��������� ��� �������.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITRI_PROT_POINT_01_MIS(C_ITEM)
{
	name = NAME_RING;
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_RING | ITEM_MISSION;
	value = VALUE_RI_PROTPOINT;
	visual = "ItRi_Prot_Point_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itri_prot_point_01;
	on_unequip = unequip_itri_prot_point_01;
	description = "������ ���������� ����";
	text[0] = "��� ������ ����������� �����������.";
	text[2] = NAME_PROT_POINT;
	count[2] = RI_PROTPOINT;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};

instance ITMI_EDDASSTATUE(C_ITEM)
{
	name = "��������� ������";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = VALUE_INNOSSTATUE;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "�����, ��� ����������";
	text[3] = "���������� � ������� ����,";
	text[4] = "� ������ ���� �� ����.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_EVT_CRYPT_01(C_ITEM)
{
	name = "������ �������� ����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� ������� �� ������ �������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_EVT_CRYPT_02(C_ITEM)
{
	name = "������ �������� ����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� ������� �� ������ �������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_EVT_CRYPT_03(C_ITEM)
{
	name = "������ �������� ����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� ������� �� ������� �������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};


const int VALUE_ITAR_PAL_SKEL = 500;

instance ITAR_PAL_SKEL(C_ITEM)
{
	name = "������ ��������� �������";
	mainflag = ITEM_KAT_ARMOR;
	flags = 0;
	protection[PROT_EDGE] = 100;
	protection[PROT_BLUNT] = 100;
	protection[PROT_POINT] = 100;
	protection[PROT_FIRE] = 65;
	protection[PROT_MAGIC] = 100;
	value = value_itar_pal_skel;
	wear = WEAR_TORSO;
	visual = "ItAr_Pal_H.3ds";
	visual_change = "Armor_Pal_Skeleton.asc";
	visual_skin = 0;
	material = MAT_LEATHER;
	description = name;
	text[1] = NAME_PROT_EDGE;
	count[1] = protection[PROT_EDGE];
	text[2] = NAME_PROT_POINT;
	count[2] = protection[PROT_POINT];
	text[3] = NAME_PROT_FIRE;
	count[3] = protection[PROT_FIRE];
	text[4] = NAME_PROT_MAGIC;
	count[4] = protection[PROT_MAGIC];
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_VALENTINO(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� �������,";
	text[3] = "�������������� ���������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_BUERGER(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "�� ����� �� ������.";
	text[3] = "";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ITKE_RICHTER(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� �������,";
	text[3] = "�������������� �����.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ITKE_SALANDRIL(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��� ���� �� �������,";
	text[3] = "�������������� �������� ����������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITKE_PALADINTRUHE(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��������� �������� ������";
	text[3] = "�� ���� ���������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ITKE_THIEFTREASURE(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_04.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "��������� ������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 190;
};

instance ITKE_FINGERS(C_ITEM)
{
	name = "����";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_05.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "������ ���� �� �����";
	text[3] = "� �����������.";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITWR_SCHULDENBUCH(C_ITEM)
{
	name = "�������� �����";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_03.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "�������� ����� ������";
	text[5] = NAME_VALUE;
	count[5] = value;
	on_state[0] = useschuldbuch;
};


func void useschuldbuch()
{
	var int ndocid;
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_SetFont(ndocid,0,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"������ � �����");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�, ������ ������, ������� ��������, ������ ����������������� ������ 200 ������� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"             ������");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"�, �������, ���������� ��������, ������ ����������������� ������ 150 ������� �����.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"             �������");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"�, �����, ��������� ����� ��������, ������ ����������������� ������ 250 ������� �����.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"               �����");
	Doc_PrintLines(ndocid,1,"");
	Doc_Show(ndocid);
};


instance ITPL_SAGITTA_HERB_MIS(C_ITEM)
{
	name = "��������� ����";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STRENGTH_HERB_01;
	visual = "ItPl_Sagitta_Herb.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_ORLAN_HOTELZIMMER(C_ITEM)
{
	name = "���� �� �������";
	mainflag = ITEM_KAT_KEYS;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "� ������� '������� ������'.";
	text[3] = "";
	inv_rotz = -45;
	inv_rotx = -25;
	inv_roty = 0;
	inv_zbias = 145;
};

instance ITRW_DRAGOMIRSARMBRUST_MIS(C_ITEM)
{
	name = "������� ���������";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_LEICHTEARMBRUST;
	damagetotal = DAMAGE_LEICHTEARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_LEICHTEARMBRUST;
	visual = "ItRw_Crossbow_Mission_01.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

