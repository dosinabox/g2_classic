
instance ITWR_XARDASLETTERTOOPENBOOK_MIS(C_ITEM)
{
	name = "Письмо Ксардаса";
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
	Doc_PrintLines(ndocid,0,"Я полагал, что один из драконов в Долине рудников являлся источником Зла.");
	Doc_PrintLines(ndocid,0,"Я ошибался.");
	Doc_PrintLines(ndocid,0,"Если все прошло так, как я предполагаю,");
	Doc_PrintLines(ndocid,0,"ты сейчас должен искать Чертоги Ирдората.");
	Doc_PrintLines(ndocid,0,"В книге, что ты отдал Пирокару, содержатся все необходимые тебе ключи.");
	Doc_PrintLines(ndocid,0,"Я должен был догадаться, почему");
	Doc_PrintLines(ndocid,0,"Ищущие так хотели заполучить ее.");
	Doc_PrintLines(ndocid,0,"Ты должен вернуть ее себе!");
	Doc_PrintLines(ndocid,0,"Эту книгу открывают слова 'ХАРАК БЕНДАРДО'. Никому не говори об этом!");
	Doc_PrintLines(ndocid,0,"А меня сейчас ждут более важные дела.");
	Doc_PrintLines(ndocid,0,"Я не смогу помочь тебе в твоей последней задаче. Только ты можешь уничтожить источник Зла.");
	Doc_PrintLines(ndocid,0,"Мы еще встретимся!");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLines(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"                             Ксардас.");
	Doc_Show(ndocid);
	if(MIS_XARDAS_SCCANOPENIRDORATHBOOK == FALSE)
	{
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"В этом письме Ксардас сообщил мне слова, открывающие книгу ЧЕРТОГИ ИРДОРАТА.");
	};
	MIS_XARDAS_SCCANOPENIRDORATHBOOK = TRUE;
};


instance ITKE_MONASTARYSECRETLIBRARY_MIS(C_ITEM)
{
	name = "Ключ";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_02;
	visual = "ItKe_Key_02.3ds";
	material = MAT_METAL;
	description = name;
	text[0] = "из книги 'Чертоги Ирдората'";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITWR_HALLSOFIRDORATH_MIS(C_ITEM)
{
	name = "Чертоги Ирдората";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
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
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Я смог открыть книгу Ксардаса. В ней находилось секретное сообщение и странный ключ. Кто знает, что еще смогу найти я в монастырских подвалах.");
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
	name = "Чертоги Ирдората";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_05.3ds";
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
		b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Я прочел книгу Ксардаса. В ней упоминается секретная библиотека. Она должна быть где-то здесь, в подвалах монастыря.");
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
	Doc_PrintLines(ndocid,0,"... и я закрыл вход в библиотеку секретной дверью, чтобы защитить мои записи о храмах Белиара.");
	Doc_PrintLines(ndocid,0,"Если бы мои братья знали бы об этих записях, эти идиоты, вероятно, уничтожили бы их.");
	Doc_SetMargins(ndocid,-1,30,20,275,20,1);
	Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
	Doc_PrintLine(ndocid,1,"");
	Doc_SetFont(ndocid,1,FONT_BOOK);
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"А теперь, они знают только, что эти храмы когда-то существовали.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"На всякий случай, я заклял нескольких слуг охранять эту библиотеку.");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLine(ndocid,1,"");
	Doc_PrintLines(ndocid,1,"Этот ключ открывает последнюю дверь.");
	Doc_Show(ndocid);
};


instance ITWR_XARDASSEAMAPBOOK_MIS(C_ITEM)
{
	name = "Пыльная книга";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 0;
	visual = "ItWr_Book_02_01.3ds";
	material = MAT_LEATHER;
	scemename = "MAP";
	description = name;
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
	Doc_PrintLines(ndocid,0,"... Теперь я почти уверен, что здание, о котором идет речь -- Чертоги Ирдората. Они находятся на острове, недалеко от гавани Хориниса. Интерес Белиара к этим шахтам вполне очевиден ...");
	Doc_PrintLines(ndocid,0,"");
	if(hero.guild == GIL_PAL)
	{
		Doc_PrintLines(ndocid,0,"... Чем они сильнее, тем, похоже, для него выше их ценность как слуг-нежити. Эти обращенные паладины очень сильны, и с ними очень тяжело справиться. Один из них попал в мои руки. Мне остается только надеяться, что другие не почувствуют его присутствие здесь ...");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"... Обращенный паладин, похоже, ни на что не реагирует. Я запер его доспехи и остальные его вещи в задней комнате. Дверь в нее можно открыть только изнутри. Я создал руну телепортации, позволяющую переместиться туда. Инструкции по пользованию ей находятся в альманахе, где Избранный сможет найти их ...");
	};
	if(hero.guild == GIL_KDF)
	{
		Doc_PrintLines(ndocid,0,"... В значении этих знамений невозможно ошибиться! Когда Избранный придет, ему понадобится вся помощь, которую мы сможем предоставить. Белиар уже очень силен. Мне удалось раздобыть несколько ценных артефактов, которые я схороню здесь, на всякий случай. Я полагаю, что избранный будет выходцем из наших рядов,");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLines(ndocid,1,"поэтому я записал в этом альманахе инструкции для него.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"... Теперь я уверен. Мы не можем противиться судьбе. Как только Белиар почувствует, что достаточно силен, он поднимется и попытается взять бразды правления миром в свои руки. Я должен найти Избранного, иначе нам всем конец.");
	};
	if(hero.guild == GIL_DJG)
	{
		Doc_PrintLines(ndocid,0,"... И будет война, война за судьбу мира. Похоже, только я один могу интерпретировать эти знамения. Все вокруг меня, похоже, игнорируют их. Избранный придет, и его пришествие возвестит о начале войны. Эта война стара как сам мир, но ее конец, похоже, уже близок.");
		Doc_SetMargins(ndocid,-1,30,20,275,20,1);
		Doc_SetFont(ndocid,1,FONT_BOOKHEADLINE);
		Doc_SetFont(ndocid,1,FONT_BOOK);
		Doc_PrintLines(ndocid,1,"Я же не буду сидеть, сложа руки и наблюдать за тем, как другие берут судьбу мира в свои руки.");
		Doc_PrintLine(ndocid,1,"");
		Doc_PrintLines(ndocid,1,"... Я изучал античные письмена и нашел в них, как создать легендарное оружие древних Повелителей Драконов. Однако, я понятия не имею, как раздобыть необходимые ингредиенты. Я записал рецепт в альманахе, так, на всякий случай. Кто знает, какие ужасы принесет с собой будущее - может быть, даже драконов.");
	};
	Doc_Show(ndocid);
};


instance ITWR_USELAMPIDIOT_MIS(C_ITEM)
{
	name = "Помятая записка";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_01.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_uselampidiot_mis;
	scemename = "MAP";
	description = name;
	text[0] = "из книги 'Чертоги Ирдората'";
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
	Doc_PrintLine(ndocid,0,"               Лампа несет свет ");
	Doc_PrintLine(ndocid,0,"               нижним уровням");
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
	name = "Морская карта острова Ирдорат";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Map_01.3DS";
	material = MAT_LEATHER;
	scemename = "MAP";
	on_state[0] = use_seamap_irdorath;
	description = name;
	text[0] = "";
	text[1] = "";
	text[5] = NAME_VALUE;
	count[5] = value;
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
		b_logentry(TOPIC_SHIP,"Похоже, я должен добраться до этого странного вражеского острова. Но для этого мне нужен корабль, команда и капитан.");
		b_giveplayerxp(XP_SCKNOWSWAYTOIRDORATH);
	};
	MIS_SCKNOWSWAYTOIRDORATH = TRUE;
};


instance ITWR_FORGEDSHIPLETTER_MIS(C_ITEM)
{
	name = "Корабельное свидетельство";
	mainflag = ITEM_KAT_DOCS;
	flags = ITEM_MISSION;
	value = 50;
	visual = "ItWr_Scroll_02.3DS";
	material = MAT_LEATHER;
	on_state[0] = useitwr_forgedshipletter_mis;
	scemename = "MAP";
	description = name;
	text[3] = "Письмо о подтверждении полномочий";
	text[4] = "на распоряжение кораблем паладинов.";
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
	Doc_PrintLine(ndocid,0,"     Предоставление полномочий");
	Doc_PrintLine(ndocid,0,"				");
	Doc_PrintLine(ndocid,0,"");
	Doc_PrintLine(ndocid,0,"");
	Doc_SetFont(ndocid,0,FONT_BOOK);
	Doc_PrintLine(ndocid,0,"        Этот документ наделяет предъявителя");
	Doc_PrintLine(ndocid,0,"        правом свободно распоряжаться");
	Doc_PrintLine(ndocid,0,"        королевской военной галерой Лорда Хагена");
	Doc_PrintLine(ndocid,0,"        в течение неограниченного периода времени.");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"            Королевская печать");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_PrintLine(ndocid,0,"		");
	Doc_SetMargins(ndocid,-1,200,50,50,50,1);
	Doc_Show(ndocid);
};


instance ITKE_OC_MAINGATE_MIS(C_ITEM)
{
	name = "Ключ от башни главных ворот";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_01;
	visual = "ItKe_Key_01.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITKE_SHIP_LEVELCHANGE_MIS(C_ITEM)
{
	name = "Ключ от капитанской каюты";
	mainflag = ITEM_KAT_NONE;
	flags = ITEM_MISSION;
	value = VALUE_KEY_03;
	visual = "ItKe_Key_03.3ds";
	material = MAT_METAL;
	description = name;
	text[5] = NAME_VALUE;
	count[5] = value;
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
	description = "Слезы Инноса";
	text[3] = "Эффект неизвестен.";
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
	description = "Слезы Инноса";
	text[1] = "Это зелье наделяет магов Огня особыми способностями.";
	text[2] = "Любой другой принявший его, найдет свою смерть.";
	text[5] = NAME_VALUE;
	count[5] = value;
};

instance ITAM_AMULETTOFDEATH_MIS(C_ITEM)
{
	name = "Божественная аура Инноса";
	mainflag = ITEM_KAT_MAGIC;
	flags = ITEM_AMULET;
	value = 1000;
	visual = "ItAm_Prot_Fire_01.3ds";
	visual_skin = 0;
	material = MAT_METAL;
	on_equip = equip_itam_amulettofdeath_mis;
	on_unequip = unequip_itam_amulettofdeath_mis;
	description = "Божественная аура Инноса";
	text[2] = "Этот амулет защищает владельца";
	text[3] = "от всех форм урона.";
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
	description = "Лекарство от привыкания";
	text[1] = NAME_BONUS_HP;
	count[1] = HP_ESSENZ;
	text[5] = NAME_VALUE;
	count[5] = VALUE_HPESSENZ;
};


func void use_healrandolph()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,HP_ESSENZ);
};

