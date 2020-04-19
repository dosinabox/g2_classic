
instance ITMI_INNOSEYE_MIS(C_ITEM)
{
	name = "Глаз Инноса";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = equip_innoseye;
	on_unequip = unequip_innoseye;
	text[0] = "В Глазу пульсирует энергия.";
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
	name = "Глаз Инноса";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET | ITEM_MISSION;
	value = 0;
	visual = "ItMi_InnosEye_Discharged_MIS.3DS";
	material = MAT_STONE;
	description = name;
	on_equip = equip_itmi_innoseye_discharged_mis;
	text[0] = "Глаз потух и не сияет.";
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};


func void equip_itmi_innoseye_discharged_mis()
{
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("MFX_FEAR_CAST");
};


instance ITMI_INNOSEYE_BROKEN_MIS(C_ITEM)
{
	name = "Глаз Инноса";
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
	name = "Письмо о подтверждении полномочий";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_permissiontowearinnoseye;
	scemename = "MAP";
	description = "Письмо о подтверждении полномочий для Пирокара";
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
	Doc_PrintLines(ndocid,0,"Предъявителю этого документа даровано право входа в священные залы монастыря.");
	Doc_PrintLines(ndocid,0,"Его пожелания, касательно владения Глазом Инноса должны выполняться немедленно.");
	Doc_PrintLines(ndocid,0,"Вышеуказанное следует считать действительным вследствие силы моей позиции в качестве властителя этого острова и представителя короля, а также учитывая договор о разделении церкви Инноса во 2 году от Огня.");
	Doc_PrintLines(ndocid,0,"P.S. Я ожидаю неукоснительного выполнения моих указаний.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Да хранит Иннос короля.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"        Лорд Хаген");
	Doc_Show(ndocid);
};


instance ITWR_XARDASBOOKFORPYROKAR_MIS(C_ITEM)
{
	name = "Чертоги Ирдората";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
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
	name = "Ключ Ксардаса";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "от сундука на ферма Секоба.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_CORNELIUSTAGEBUCH_MIS(C_ITEM)
{
	name = "Дневник";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = "Дневник";
	text[0] = "Дневник Корнелиуса.";
	on_state[0] = usecorneliustagebuch;
};


func void usecorneliustagebuch()
{
	var int ndocid;
	CORNELIUS_ISLIAR = TRUE;
	b_logentry(TOPIC_RESCUEBENNET,"Этот дневник - доказательство, необходимое для подтверждения невиновности Беннета.");
	ndocid = Doc_Create();
	Doc_SetPages(ndocid,2);
	Doc_SetPage(ndocid,0,"Book_Brown_L.tga",0);
	Doc_SetPage(ndocid,1,"Book_Brown_R.tga",0);
	Doc_SetFont(ndocid,-1,FONT_BOOK);
	Doc_SetMargins(ndocid,0,275,20,30,20,1);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Если Лариус будет продолжать в том же духе, мне придется начать подыскивать себе другое место.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Что-то странно произошло со мной прошлой ночью. Мне нанес визит один из этих парней в черных капюшонах, о которых ходит столько слухов последнее время. Я не очень-то испугался, даже несмотря на то, что, как говорят, они - само зло. Эти люди прямо-таки источают силу. Но голос был спокойным и располагающим к себе.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Он предложил мне 20,000 золота за то, чтобы один из наемников был осужден. Он сказал, что я пойму, что он имел в виду, когда это произойдет.");
	Doc_PrintLines(ndocid,1,"Конечно же, я согласился. Эти наемники все равно не заслуживают лучшей участи. Если бы не они, у меня все было бы хорошо. И это золото позволит мне спокойно встретить старость.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Это произошло -- один из наемников был арестован. Сдержать мое слово будет просто.");
	Doc_Show(ndocid);
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};


instance ITWR_DEMENTOROBSESSIONBOOK_MIS(C_ITEM)
{
	name = "Альманах одержимых";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MULTI | ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
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
			Doc_PrintLine(ndocid,1,"           ВИНО");
			Doc_PrintLine(ndocid,1,"ФЕРНАНДО");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"        МАЛАК");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"БРОМОР");
		};
		if(KAPITEL >= 4)
		{
			Doc_PrintLine(ndocid,1,"    ЭНГРОМ");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"        РЕНДОЛЬФ");
			Doc_PrintLine(ndocid,1,"");
		};
		if(KAPITEL >= 5)
		{
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"СЕКОБ");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"");
			Doc_PrintLine(ndocid,1,"            БРУТУС");
			Doc_PrintLine(ndocid,1,"");
		};
		Doc_Show(ndocid);
	};
};


instance ITWR_PYROKARSOBSESSIONLIST(C_ITEM)
{
	name = "Магическое письмо Пирокара";
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
	Doc_PrintLine(ndocid,0,"Одержимые");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	if(KAPITEL >= 3)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"ФЕРНАНДО");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"ВИНО");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"МАЛАК");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"БРОМОР");
	};
	if(KAPITEL >= 4)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"ЭНГРОМ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"РЕНДОЛЬФ");
	};
	if(KAPITEL >= 5)
	{
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"СЕКОБ");
		Doc_PrintLine(ndocid,0,"");
		Doc_PrintLine(ndocid,0,"БРУТУС");
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
	description = "Лекарство от черной лихорадки";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void use_healhilda()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
};


instance ITMW_MALETHSGEHSTOCK_MIS(C_ITEM)
{
	name = "Походный посох";
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
	text[0] = "На древке вырезана буква 'М.'";
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
	text[0] = "Этот мешок доверху набит монетами!";
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
	name = "Жир крысокрота";
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
	name = "Письмо Бабо";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babosletter;
	scemename = "MAP";
	description = "Письмо Бабо";
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
	Doc_PrintLine(ndocid,0,"Дорогой Бабо,");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Ты, наверняка, задаешься вопросом, как мы смогли написать тебе это письмо. Мы отнесли все наши сбережения мастеру Марласу и попросили его написать эти строчки. Мы желаем тебе всего наилучшего и посылаем тебе картину в качестве прощального дара, чтобы ты всегда помнил о нас во время долгих ночей в монастыре.");
	Doc_PrintLines(ndocid,0,"Удачи. Надеемся, тебе понравится эта картина.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Фехт и Бонка");
	Doc_Show(ndocid);
};


instance ITWR_BABOSPINUP_MIS(C_ITEM)
{
	name = "Изображение женщины";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_BabosPinUp_MIS.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babospinup;
	scemename = "MAP";
	description = "Изображение нагой женщины";
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
	name = "Связка бумаг";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_babosdocs;
	scemename = "MAPSEALED";
	description = name;
	text[2] = "Несколько документов,";
	text[3] = "скрученных вместе.";
};


func void use_babosdocs()
{
	BABOSDOCSOPEN = TRUE;
	CreateInvItems(self,itwr_babosletter_mis,1);
	CreateInvItems(self,itwr_babospinup_mis,1);
};


instance ITKE_IGARAZCHEST_MIS(C_ITEM)
{
	name = "Ключ от сундука";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[2] = "Это ключ от сундука,";
	text[3] = "принадлежащего Игарацу.";
};

instance ITWR_ASTRONOMY_MIS(C_ITEM)
{
	name = "Божественная сила звезд";
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
	Doc_PrintLines(ndocid,0,"... но когда сила быка объединяется с началом воина, нужно опасаться грядущих событий.");
	Doc_PrintLines(ndocid,0,"Высвободившаяся сила быка и настойчивость воина могут нарушить древний баланс сил. Космическая граница между измерениями становится слабой - столь слабой, что теневые твари Белиара получают возможность проникнуть в наш мир.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Что может произойти вследствие этого, известно нам из истории войн древних времен, когда связь между мирами была еще сильна. Эти отродья зла несли смерть и разрушения нашему миру, и благодаря Избранному и Инносу мир был избавлен от этого зла.");
	Doc_PrintLines(ndocid,1,"Если такая угроза когда-либо возникнет опять, то да поможет нам Иннос, ибо мир не видел Избранного Инноса уже многие сотни лет.");
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
	description = "Лекарство от одержимости";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
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
	text[2] = "Этот кошелек полон монет.";
	text[3] = "Кажется, внутри позванивает что-то еще.";
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
	name = "Очень старая карта";
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
	name = "Письмо от Диего";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = use_diegosletter_mis;
	scemename = "MAP";
	description = "Письмо Диего Гербрандту";
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
	Doc_PrintLine(ndocid,0,"Гербрандт, ");
	Doc_PrintLines(ndocid,0,"Знаешь, тебе стоило убить меня.");
	Doc_PrintLines(ndocid,0,"Я вернулся в город и ищу тебя. И когда я найду тебя, я покрошу тебя как капусту. Ты хорошо меня знаешь, так что не надейся, меня так легко не обвести вокруг пальца.");
	Doc_PrintLines(ndocid,0,"Полагаю, что когда ты засунул меня за Барьер, ты и не думал, что я могу вернуться. Что ж, ты ошибался.");
	Doc_PrintLines(ndocid,0,"Я пришел за тем, что принадлежит мне по праву.");
	Doc_PrintLines(ndocid,0,"Твой единственный шанс остаться в живых - это уносить ноги поскорее и оставить свой бизнес мне. Тогда мы будим квиты.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"Диего");
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
	text[1] = "с именем 'Диего'.";
	text[2] = "Внутри целая куча золота!";
	text[5] = NAME_Value;
	count[5] = value;
};


func void use_diegostreasure()
{
	OPENEDDIEGOSBAG = TRUE;
	CreateInvItems(self,itmi_gold,DIEGOSTREASURE);
	Print(PRINT_DIEGOSTREASURE);
	Snd_Play("Geldbeutel");
};


instance ITMI_ULTHARSHOLYWATER_MIS(C_ITEM)
{
	name = "Святая вода Ультара";
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
	name = "Акция рудника Хориниса";
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
	Doc_PrintLine(ndocid,0,"Акция рудника");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"Согласно королевскому свидетельству о собственности, предъявителю этого документа дается право на проведение горных работ в королевских землях.");
	Doc_PrintLines(ndocid,0,"Вышеуказанные горные работы должны быть ограничены пространством в один римлот.");
	Doc_PrintLines(ndocid,0,"Согласно закону о горнодобывающих работах, римлот составляет 16 шагов в горизонтальном измерении и 3 шага по вертикали.");
	Doc_PrintLines(ndocid,0,"Королевский проспектор имеет право на свободный доступ к местам производства работ.");
	Doc_PrintLines(ndocid,0,"Если арендатор не в состоянии платить ренту, все права на землю возвращаются к королевству.");
	Doc_PrintLine(ndocid,0,"         Подпись");
	Doc_PrintLine(ndocid,0,"      Королевский проспектор");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                Саландрил");
	Doc_Show(ndocid);
	SC_KNOWSPROSPEKTORSALANDRIL = TRUE;
	if(ITWR_MINENANTEIL_MIS_ONETIME == FALSE)
	{
		b_logentry(TOPIC_MINENANTEILE,"Парня, продавшего акции шахты торговцам, зовут Саландрил. Вероятно, я смогу найти его в верхней части Хориниса, если он еще не начал прятаться от правосудия.");
		if(Npc_IsDead(salandril))
		{
			b_logentry(TOPIC_MINENANTEILE,"Саландрил мертв. Мне нужно сообщить это Серпентесу.");
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
	visual = "ItMi_GoldNecklace.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	description = "Амулет вызова душ";
	text[2] = "Защита от сглаза.";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = INVCAM_ENTF_AMULETTE_STANDARD;
};

instance ITMI_KARRASBLESSEDSTONE_MIS(C_ITEM)
{
	name = "Камень из благословенной земли";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION | ITEM_MULTI;
	value = 0;
	visual = "ItMi_KarrasBlessedStone.3ds";
	visual_skin = 0;
	material = MAT_STONE;
	description = name;
	text[2] = "";
	text[3] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
	inv_zbias = 190;
};

instance ITWR_RICHTERKOMPROBRIEF_MIS(C_ITEM)
{
	name = "Поручение судьи";
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
	Doc_PrintLines(ndocid,0,"Моргахард, ты, никчемный сукин сын. Выполни мой приказ, или мне придется заняться своими прямыми обязанностями и арестовать вас всех.");
	Doc_PrintLines(ndocid,0,"Все должно быть сделано завтра ночью. Лариус становится подозрительным.");
	Doc_PrintLines(ndocid,0,"Если мы не вытянем деньги из его карманов сейчас, может стать слишком поздно. Я устрою так, что ты встретишь его сегодня вечером на рыночной площади.");
	Doc_PrintLines(ndocid,0,"Но не привлекай к себе внимания, или ополченцы скрутят тебя, и глазом моргнуть не успеешь.");
	Doc_PrintLines(ndocid,0,"Кстати: если он ненароком скончается при этом, я не огорчусь.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"          Главный судья и ");
	Doc_PrintLine(ndocid,0,"          королевский секретарь");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_MORGAHARDTIP(C_ITEM)
{
	name = "Письмо";
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
	Doc_PrintLines(ndocid,0,"Я ухожу. Надеюсь, мы встретимся опять, когда все немного успокоится.");
	Doc_PrintLines(ndocid,0,"Не волнуйтесь, парни. В крайнем случае, я попрошу Онара помочь.");
	Doc_PrintLines(ndocid,0,"Все будет хорошо.");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                           М.");
	Doc_PrintLine(ndocid,0,"");
	Doc_Show(ndocid);
};


instance ITWR_MAP_SHRINE_MIS(C_ITEM)
{
	name = "Карта священных алтарей";
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
	name = "Дух вина";
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
	Doc_PrintLines(ndocid,0,"Сила винограда");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"... Я уже многое перепробовал, но этот плод, что был привезен мне из-за границы на прошлой неделе, превзошел все ожидания ...");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"... сок этого винограда несравним с тем, что можно найти в этой части страны ...");
	Doc_PrintLines(ndocid,0,"");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"... пока все хорошо. Но мне все же не по себе от мысли, что может произойти, если меня застанут за моими секретными экспериментами. Не представляю, что будет делать ополчение, если они найдут меня здесь. Они могут даже засунуть меня за Барьер ...");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"... Они стали подозрительными. Мне лучше оставить это занятие, пока все не успокоится немного, я вернусь к своей работе, когда буду уверен, что никто мной больше не интересуется ...");
	Doc_Show(ndocid);
};

