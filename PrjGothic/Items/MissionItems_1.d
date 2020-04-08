
instance ITKE_XARDAS(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ключ от сундука,";
	text[3] = "принадлежащего Ксардасу.";
};

instance ITWR_CANTHARS_KOMPROBRIEF_MIS(C_ITEM)
{
	name = "Письмо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_canthars_komprobrief;
	scemename = "MAP";
	description = "Письмо Кантара торговке Саре";
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
	Doc_PrintLine(ndocid,0,"     Последнее предупреждение");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"        Я уже несколько раз напоминал тебе,");
	Doc_PrintLine(ndocid,0,"        стараясь быть вежливым,");
	Doc_PrintLine(ndocid,0,"        что мне срочно необходимо оружие,");
	Doc_PrintLine(ndocid,0,"        заказанное у тебя неделю");
	Doc_PrintLine(ndocid,0,"        назад.");
	Doc_PrintLine(ndocid,0,"        Если я вскоре не получу от тебя никаких");
	Doc_PrintLine(ndocid,0,"        вестей, Сара, я буду вынужден изменить");
	Doc_PrintLine(ndocid,0,"        свое отношение к тебе. Надеюсь, ");
	Doc_PrintLine(ndocid,0,"        мы понимаем друг друга!!!!!!!!!!!!");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"            Онар");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITMW_2H_ROD(C_ITEM)
{
	name = "Двуручный меч Рода";
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
	name = "Серебро Корагона";
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
	name = "Пакет Теклы";
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
	name = "Тяжелое золотое блюдо";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI;
	value = VALUE_GOLDPLATE;
	visual = "ItMi_MariasGoldPlate.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "На этом блюде выгравированы";
	text[3] = "имена: Онар и Мария.";
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
	on_equip = equip_valentinosring;
	on_unequip = unequip_valentinosring;
	description = "Кольцо железной кожи";
	text[0] = "Это кольцо принадлежит Валентино.";
	text[2] = NAME_PROT_EDGE;
	count[2] = RI_PROTEDGE;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_valentinosring()
{
	self.protection[PROT_EDGE] += RI_PROTEDGE;
	self.protection[PROT_BLUNT] += RI_PROTEDGE;
};

func void unequip_valentinosring()
{
	self.protection[PROT_EDGE] -= RI_PROTEDGE;
	self.protection[PROT_BLUNT] -= RI_PROTEDGE;
};


instance ITKE_DEXTER(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ключ от сундука,";
	text[3] = "принадлежащего Декстеру.";
};

instance ITWR_KRAEUTERLISTE(C_ITEM)
{
	name = "Список";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_kraeuterliste;
	scemename = "MAP";
	description = "Список трав Константино";
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
	Doc_PrintLine(ndocid,0,"Алхимические травы");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Лечебная трава");
	Doc_PrintLine(ndocid,0,"Лечебное растение");
	Doc_PrintLine(ndocid,0,"Лечебный корень");
	Doc_PrintLine(ndocid,0,"Огненная крапива");
	Doc_PrintLine(ndocid,0,"Огненная трава");
	Doc_PrintLine(ndocid,0,"Огненный корень");
	Doc_PrintLine(ndocid,0,"Гоблинские ягоды");
	Doc_PrintLine(ndocid,0,"Драконий корень");
	Doc_PrintLine(ndocid,0,"Снеппер-трава");
	Doc_PrintLine(ndocid,0,"Луговой горец");
	Doc_PrintLine(ndocid,0,"Царский щавель");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Примечание: Пусть кандидат в ученики соберет эти травы для тебя. Это позволит проверить его способности. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"С уважением, Зурис.");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_MANAREZEPT(C_ITEM)
{
	name = "Рецепт";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 20;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_manarezept;
	scemename = "MAP";
	description = "Рецепт магической эссенции";
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
	Doc_PrintLine(ndocid,0,"Магические зелья");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Чтобы сварить магическое зелье, опытному алхимику необходимы:");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Огненная крапива");
	Doc_PrintLine(ndocid,0,"Огненная трава");
	Doc_PrintLine(ndocid,0,"Огненный корень");
	Doc_PrintLines(ndocid,0,"Также ему понадобится");
	Doc_PrintLine(ndocid,0,"Луговой горец");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Мастер Неорас");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_PASSIERSCHEIN(C_ITEM)
{
	name = "Пропуск";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepassierschein;
	scemename = "MAP";
	description = name;
	text[3] = "Эти бумаги позволят мне";
	text[4] = "пройти мимо стражников у ворот.";
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
	Doc_PrintLine(ndocid,0,"     Пропуск");
	Doc_PrintLine(ndocid,0,"            Хоринис");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"        Этот документ дает право");
	Doc_PrintLine(ndocid,0,"        свободного прохода по всему нижнему");
	Doc_PrintLine(ndocid,0,"        Хоринису на неограниченный период времени.");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"            Лариус");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"            королевский губернатор");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITMI_HERBPAKET(C_ITEM)
{
	name = "Тюк травы";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_HerbPaket.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Тяжелый, липкий тюк,";
	text[3] = "пахнущий болотной травой.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_STORAGE(C_ITEM)
{
	name = "Ключ от склада";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ключ от портового";
	text[3] = "склада.";
};


const int HP_HERING = 20;

instance ITFO_SMELLYFISH(C_ITEM)
{
	name = "Селедка";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_FISH;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
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
	name = "Странная рыба";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItFo_Fish.3DS";
	material = MAT_LEATHER;
	scemename = "MAPSEALED";
	on_state[0] = use_halvorfish;
	description = "Странно выглядящая рыба.";
	text[2] = "Что-то с этой рыбой не так.";
	text[3] = "Похоже, она была зашита ...";
};


func void use_halvorfish()
{
	CreateInvItems(hero,itwr_halvormessage,1);
	Print(PRINT_FISHLETTER);
};


instance ITWR_HALVORMESSAGE(C_ITEM)
{
	name = "Вонючая записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usehalvormessage;
	scemename = "MAP";
	description = name;
	text[2] = "Эта записка была спрятана в рыбе.";
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
	Doc_PrintLine(ndocid,0,"    Не высовывайтесь, парни!");
	Doc_PrintLine(ndocid,0,"    Ополчения становится подозрительным.");
	Doc_PrintLine(ndocid,0,"    Не предпринимайте ничего,");
	Doc_PrintLine(ndocid,0,"пока я не дам знать о себе!");
	Doc_PrintLine(ndocid,0,"    Халвор");
	Doc_Show(ndocid);
};


instance ITMW_ALRIKSSWORD_MIS(C_ITEM)
{
	name = "Меч Альрика";
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
	name = "Запечатанное послание";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = usevatrasmessage;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Послание Ватраса";
	text[3] = "магам огня";
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
	Doc_PrintLine(ndocid,0,"Дорогой Исгарот,");
	Doc_PrintLines(ndocid,0,"Я ощущаю все нарастающее присутствие другой силы.");
	Doc_PrintLines(ndocid,0,"Это сила, доселе неведомая нам. Может ли быть так, что вассалы Белиара уже близко?");
	Doc_PrintLines(ndocid,0,"Я могу ошибаться, но я верю, что отцу Пирокару стоило бы разобраться с этим вопросом. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Да не останутся наши молитвы без ответа.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Ватрас");
	Doc_Show(ndocid);
};


instance ITWR_VATRASMESSAGE_OPEN(C_ITEM)
{
	name = "Послание";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usevatrasmessageopen;
	scemename = "MAP";
	description = name;
	text[2] = "Послание Ватраса";
	text[3] = "магам огня";
	text[4] = "Печать сломана.";
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
	Doc_PrintLine(ndocid,0,"Дорогой Исгарот,");
	Doc_PrintLines(ndocid,0,"Я ощущаю все нарастающее присутствие другой силы.");
	Doc_PrintLines(ndocid,0,"Это сила, доселе неведомая нам. Может ли быть так, что вассалы Белиара уже близко?");
	Doc_PrintLines(ndocid,0,"Я могу ошибаться, но я полагаю, что отцу Пирокару стоило бы разобраться с этим вопросом. ");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Да не останутся наши молитвы без ответа.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Ватрас");
	Doc_Show(ndocid);
};


instance ITKE_HOTEL(C_ITEM)
{
	name = "Ключ от комнаты";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ключ от комнаты";
	text[3] = "отеля.";
};

instance ITKE_THIEFGUILDKEY_MIS(C_ITEM)
{
	name = "Ржавый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Этот ключ изъеден соленой морской водой.";
};

instance ITKE_THIEFGUILDKEY_HOTEL_MIS(C_ITEM)
{
	name = "Ржавый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ от погреба отеля.";
};

instance ITKE_INNOS_MIS(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ от портала в";
	text[3] = "монастыре Инноса.";
};

instance ITKE_KLOSTERSCHATZ(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ от монастырской";
	text[3] = "сокровищницы.";
};

instance ITKE_KLOSTERSTORE(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ от монастырской";
	text[3] = "кладовой.";
};

instance ITKE_KDFPLAYER(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ от монастырской";
	text[3] = "кельи.";
};

instance ITKE_KLOSTERBIBLIOTHEK(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ от монастырской";
	text[3] = "библиотеки.";
};

instance ITFO_SCHAFSWURST(C_ITEM)
{
	name = "Баранья колбаса";
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
	count[5] = VALUE_SAUSAGE;
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
	description = "Эссенция духа";
	text[1] = NAME_BONUS_MANAMAX;
	count[1] = 3;
	text[5] = NAME_VALUE;
	count[5] = value;
};


func void useitpo_littlemana()
{
	b_raiseattribute(self,ATR_MANA_MAX,3);
	Npc_ChangeAttribute(self,ATR_MANA,3);
};


instance HOLY_HAMMER_MIS(C_ITEM)
{
	name = "Священный молот";
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
	text[2] = "Урон неизвестен";
	text[3] = "Требование к силе неизвестно";
	text[4] = NAME_TWOHANDED;
	text[5] = "Цена неизвестна";
};

instance ITKE_MAGICCHEST(C_ITEM)
{
	name = "Старый ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Старый железный ключ.";
	text[3] = "Возможно, это ключ";
	text[4] = "от висячего замка.";
};

instance ITWR_PASSAGE_MIS(C_ITEM)
{
	name = "Предложение мира паладинам";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = usepassage;
	scemename = "MAP";
	description = name;
	text[3] = "Эта записка должна помочь мне";
	text[4] = "встретиться с лордом Хагеном.";
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
	Doc_PrintLine(ndocid,0,"Глубокоуважаемый лорд Хаген,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Мы оба прекрасно знаем, в какой ситуации вы находитесь. И, учитывая обстоятельства, я предлагаю следующее соглашение:");
	Doc_PrintLines(ndocid,0,"Вы даруете моим людям полное отпущение грехов перед Инносом и королем.");
	Doc_PrintLines(ndocid,0,"Взамен, мы предлагаем вам свою помощь в обороне города и прилегающих земель.");
	Doc_PrintLines(ndocid,0,"Кроме того, я лично прослежу за тем, чтобы мои люди держались подальше от местных ферм - за исключением, естественно, фермы Онара, где мы расквартированы.");
	Doc_PrintLines(ndocid,0,"Я знаю, что на корабле, на котором вы собираетесь отправиться на материк, вполне достаточно места, как для меня, так и для моих избранных людей. Когда вы поднимете паруса, я хочу тоже быть на борту.");
	Doc_PrintLines(ndocid,0,"Я умоляю вас: примите решение со всей присущей вам мудростью.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Подпись:   Генерал Ли");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_BANDITLETTER_MIS(C_ITEM)
{
	name = "Сообщение";
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
	Doc_PrintLine(ndocid,0,"Задерживайте всех, спустившихся с гор.");
	Doc_PrintLine(ndocid,0,"Вполне вероятно, что через проход, ");
	Doc_PrintLine(ndocid,0," попытается пройти старик.");
	Doc_PrintLine(ndocid,0,"Не дайте ему обмануть вас -");
	Doc_PrintLine(ndocid,0,"    это очень опасный колдун.   ");
	Doc_PrintLine(ndocid,0,"Присматривайте за ним.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Возможно, человек, которого мы ищем,");
	Doc_PrintLine(ndocid,0,"    выйдет с ним на связь.    ");
	Doc_PrintLine(ndocid,0,"С этим письмом я посылаю вам");
	Doc_PrintLine(ndocid,0,"    тридцать золотых монет.");
	Doc_PrintLine(ndocid,0,"Я дам еще тридцать монет любому,");
	Doc_PrintLine(ndocid,0,"    кто убьет этого человека.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Принесите его голову к старой шахте");
	Doc_PrintLine(ndocid,0,"    около поместья землевладельца.");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"Д.");
	Doc_PrintLine(ndocid,0,"		");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITWR_POSTER_MIS(C_ITEM)
{
	name = "Объявление о розыске";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Poster_MIS.3DS";
	material = MAT_LEATHER;
	on_state[0] = useposter;
	scemename = "MAP";
	description = name;
	text[3] = "Мое изображение!";
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
	name = "Ключ от сундука";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Этот ключ принадлежал";
	text[3] = "бандиту.";
};

instance ITMI_BALTRAMPAKET(C_ITEM)
{
	name = "Товар Бальтрама";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = 200;
	visual = "ItMi_Packet.3ds";
	material = MAT_LEATHER;
	description = name;
	text[2] = "Тяжелый тюк с";
	text[3] = "ценными вещами.";
};

instance ITRW_BOW_L_03_MIS(C_ITEM)
{
	name = "Охотничий лук";
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
	text[4] = "Охотничий лук Боспера.";
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
	on_equip = equip_itri_prot_point_01_mis;
	on_unequip = unequip_itri_prot_point_01_mis;
	description = "Кольцо деревянной кожи";
	text[0] = "Это кольцо принадлежит Константино.";
	text[2] = NAME_PROT_POINT;
	count[2] = RI_PROTPOINT;
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_RING_STANDARD;
	inv_rotz = INVCAM_Z_RING_STANDARD;
	inv_rotx = INVCAM_X_RING_STANDARD;
};


func void equip_itri_prot_point_01_mis()
{
	self.protection[PROT_POINT] += RI_PROTPOINT;
};

func void unequip_itri_prot_point_01_mis()
{
	self.protection[PROT_POINT] -= RI_PROTPOINT;
};


instance ITMI_EDDASSTATUE(C_ITEM)
{
	name = "Статуя Инноса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 50;
	visual = "ItMi_InnosStatue.3DS";
	material = MAT_METAL;
	description = name;
	text[2] = "Иннос, бог правосудия";
	text[3] = "благослови и сохрани меня,";
	text[4] = "и защити меня от боли.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_EVT_CRYPT_01(C_ITEM)
{
	name = "Старый латунный ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ скелета в комнате 1";
};

instance ITKE_EVT_CRYPT_02(C_ITEM)
{
	name = "Старый латунный ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ скелета в комнате 2";
};

instance ITKE_EVT_CRYPT_03(C_ITEM)
{
	name = "Старый латунный ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ скелета в комнате 3";
};


const int VALUE_ITAR_PAL_SKEL = 500;

instance ITAR_PAL_SKEL(C_ITEM)
{
	name = "Старые рыцарские доспехи";
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
	name = "Ключ от сундука";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ от сундука,";
	text[3] = "принадлежащего Валентино.";
};

instance ITKE_BUERGER(C_ITEM)
{
	name = "Ключ от сундука";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Он лежал на камине.";
	text[3] = "";
};

instance ITKE_RICHTER(C_ITEM)
{
	name = "Ключ от сундука";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ от сундука,";
	text[3] = "принадлежащего судье.";
};

instance ITKE_SALANDRIL(C_ITEM)
{
	name = "Ключ от сундука";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ от сундука,";
	text[3] = "принадлежащего алхимику Саландрилу.";
};

instance ITKE_PALADINTRUHE(C_ITEM)
{
	name = "Ключ от сундука";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Маленький латунный ключик";
	text[3] = "от дома паладинов.";
};

instance ITKE_THIEFTREASURE(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Маленький ключик.";
};

instance ITKE_FINGERS(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Ржавый ключ от двери";
	text[3] = "в канализации.";
};

instance ITWR_SCHULDENBUCH(C_ITEM)
{
	name = "Долговая книга";
	mainflag = ITEM_KAT_DOCS;
	flags = 0;
	value = 100;
	visual = "ItWr_Book_02_05.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Долговая книга Лемара";
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
	Doc_PrintLines(ndocid,0,"Сделки и долги");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Я, мастер Торбен, плотник Хориниса, должен глубокоуважаемому Лемару 200 золотых монет.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"             Торбен");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Я, Корагон, трактирщик Хориниса, должен глубокоуважаемому Лемару 150 золотых монет.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"             Корагон");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Я, Ханна, владелица отеля Хориниса, должна глубокоуважаемому Лемару 250 золотых монет.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"               Ханна");
	Doc_PrintLines(ndocid,1,"");
	Doc_Show(ndocid);
};


instance ITPL_SAGITTA_HERB_MIS(C_ITEM)
{
	name = "Солнечное алоэ";
	mainflag = ITEM_KAT_FOOD;
	flags = ITEM_MULTI;
	value = VALUE_STRENGTH_HERB_01;
	visual = "ItPl_Sagitta_Herb.3DS";
	material = MAT_LEATHER;
	scemename = "FOOD";
	description = name;
	text[5] = NAME_VALUE;
	count[5] = VALUE_STRENGTH_HERB_01;
};

instance ITKE_ORLAN_HOTELZIMMER(C_ITEM)
{
	name = "Ключ от комнаты";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "в таверне 'Мертвая Гарпия'.";
	text[3] = "";
};

instance ITRW_DRAGOMIRSARMBRUST_MIS(C_ITEM)
{
	name = "Арбалет Драгомира";
	mainflag = ITEM_KAT_FF;
	flags = ITEM_CROSSBOW;
	material = MAT_WOOD;
	value = VALUE_LEICHTEARMBRUST;
	damagetotal = DAMAGE_LEICHTEARMBRUST;
	damagetype = DAM_POINT;
	munition = itrw_bolt;
	cond_atr[2] = ATR_DEXTERITY;
	cond_value[2] = CONDITION_LEICHTEARMBRUST;
	visual = "ItRw_Crossbow_L_02.mms";
	description = name;
	text[2] = NAME_DAMAGE;
	count[2] = damagetotal;
	text[3] = NAME_DEX_NEEDED;
	count[3] = cond_value[2];
	text[5] = NAME_VALUE;
	count[5] = value;
};

