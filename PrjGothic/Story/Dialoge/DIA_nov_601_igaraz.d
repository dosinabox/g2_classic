
instance DIA_IGARANZ_KAP1_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap1_exit_condition;
	information = dia_igaraz_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_HELLO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_hello_condition;
	information = dia_igaraz_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_igaraz_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_igaraz_hello_info()
{
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_00");	//Что я могу сделать для тебя, брат?
	}
	else
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_01");	//Что я могу сделать для тебя?
	};
};


instance DIA_IGARAZ_WURST(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_wurst_condition;
	information = dia_igaraz_wurst_info;
	permanent = FALSE;
	description = "Я занимаюсь распределением колбасы.";
};


func int dia_igaraz_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_igaraz_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Igaraz_Wurst_15_00");	//Я раздаю колбасу.
	AI_Output(self,other,"DIA_Igaraz_Wurst_13_01");	//Ты работаешь на Горакса, да? Хорошо, тогда давай сюда эту колбасу.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
};


instance DIA_IGARANZ_NOTWORK(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 3;
	condition = dia_igaraz_notwork_condition;
	information = dia_igaraz_notwork_info;
	permanent = FALSE;
	description = "Почему ты не работаешь?";
};


func int dia_igaraz_notwork_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_notwork_info()
{
	AI_Output(other,self,"DIA_Igaranz_NotWork_15_00");	//Почему ты не работаешь?
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_01");	//Мне позволено изучать учения Инноса. Я постигаю его мудрость.
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_02");	//Однажды он выберет меня - и тогда я пройду испытание магией и войду в Круг Огня.
};


instance DIA_IGARANZ_CHOOSEN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_choosen_condition;
	information = dia_igaraz_choosen_info;
	permanent = TRUE;
	description = "Кто такие Избранные?";
};


func int dia_igaraz_choosen_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_notwork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_choosen_info()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_15_00");	//Кто такие Избранные?
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_01");	//Это послушники, которым Иннос предписал пройти испытание магией.
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_02");	//Тот, кто проходит его, принимается в ряды Магов Огня.
	Info_ClearChoices(dia_igaranz_choosen);
	Info_AddChoice(dia_igaranz_choosen,DIALOG_BACK,dia_igaranz_choosen_back);
	Info_AddChoice(dia_igaranz_choosen,"Что такое Испытание Магией?",dia_igaranz_choosen_testofmagic);
	Info_AddChoice(dia_igaranz_choosen,"Как я могу стать Избранным?",dia_igaranz_choosen_howchoosen);
};

func void dia_igaranz_choosen_back()
{
	Info_ClearChoices(dia_igaranz_choosen);
};

func void dia_igaranz_choosen_testofmagic()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_TestOfMagic_15_00");	//Что такое Испытание Магией?
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01");	//Это испытание, которому Высший Совет подвергает всех избранных послушников.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02");	//Это задание, при выполнении которого проверяются вера и сообразительность послушника.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03");	//Все избранные послушники принимают в нем участие - но только один из них может успешно выполнить его.
};

func void dia_igaranz_choosen_howchoosen()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_HowChoosen_15_00");	//Как я могу стать Избранным?
	AI_Output(self,other,"DIA_Igaranz_Choosen_HowChoosen_13_01");	//Ты не можешь влиять на это. Иннос самолично выбирает своих послушников, а Высший Совет объявляет его волю.
};


instance DIA_IGARANZ_STUDYINNOS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_studyinnos_condition;
	information = dia_igaraz_studyinnos_info;
	permanent = FALSE;
	description = "Как я могу начать изучать писания?";
};


func int dia_igaraz_studyinnos_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_notwork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (PARLAN_ERLAUBNIS == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_studyinnos_info()
{
	AI_Output(other,self,"DIA_Igaranz_StudyInnos_15_00");	//Как я могу начать изучать писания?
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_01");	//Ты должен получить доступ в библиотеку.
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_02");	//Однако мастер Парлан даст тебе ключ, только когда ты выполнишь все его задания.
};


instance DIA_IGARAZ_IMTHEMAN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_imtheman_condition;
	information = dia_igaraz_imtheman_info;
	important = TRUE;
};


func int dia_igaraz_imtheman_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_imtheman_info()
{
	AI_Output(self,other,"DIA_Igaraz_IMTHEMAN_13_00");	//(гордо) Это свершилось. Иннос выбрал меня я приму участие в испытании магией.
};


instance DIA_IGARAZ_METOO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 19;
	condition = dia_igaraz_metoo_condition;
	information = dia_igaraz_metoo_info;
	permanent = FALSE;
	description = "Я тоже - я потребовал прохождения Испытания Огнем.";
};


var int dia_igaraz_metoo_noperm;

func int dia_igaraz_metoo_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_metoo_info()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_15_00");	//Я тоже - я потребовал прохождения Испытания Огнем.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_01");	//ЧТО ты потребовал? Ты либо любимчик Инноса, либо сумасшедший.
	AI_Output(other,self,"DIA_Igaraz_METOO_15_02");	//Мне уже удалось много безумных вещей, и, возможно, удастся и это тоже...
	AI_Output(self,other,"DIA_Igaraz_METOO_13_03");	//Иннос поддерживает меня - и я пройду это испытание!
	Info_ClearChoices(dia_igaraz_metoo);
	Info_AddChoice(dia_igaraz_metoo,DIALOG_BACK,dia_igaraz_metoo_back);
	Info_AddChoice(dia_igaraz_metoo,"Может, нам лучше действовать вместе...",dia_igaraz_metoo_help);
	Info_AddChoice(dia_igaraz_metoo,"И как, еще ничего не нашел?",dia_igaraz_metoo_tell);
	Info_AddChoice(dia_igaraz_metoo,"Ты не видел Агона или Ульфа?",dia_igaraz_metoo_agon);
};

func void dia_igaraz_metoo_back()
{
	Info_ClearChoices(dia_igaraz_metoo);
};

func void dia_igaraz_metoo_tell()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_TELL_15_00");	//И как, еще ничего не нашел?
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_01");	//Так как у тебя все равно никаких шансов, я, пожалуй, скажу тебе:
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_02");	//Даже не пытайся искать около ферм - ты там ничего не найдешь.
};

func void dia_igaraz_metoo_help()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_HELP_15_00");	//Может, нам лучше действовать вместе...
	AI_Output(self,other,"DIA_Igaraz_METOO_HELP_13_01");	//Забудь об этом. Я выполню это задание один. Ты мне будешь только обузой.
};

func void dia_igaraz_metoo_agon()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_AGON_15_00");	//Ты не видел Агона или Ульфа?
	AI_Output(self,other,"DIA_Igaraz_METOO_AGON_13_01");	//Мы разделились у таверны. Я пошел к фермам, а эти двое пошли вместе - но куда, я не знаю.
};


instance DIA_IGARAZ_ADD(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 23;
	condition = dia_igaraz_add_condition;
	information = dia_igaraz_add_info;
	permanent = FALSE;
	description = "Ты знаешь что-нибудь о 'живой скале'?";
};


func int dia_igaraz_add_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (MIS_GOLEM == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE) && (Npc_KnowsInfo(other,dia_igaraz_stein) == FALSE) && Npc_KnowsInfo(other,dia_igaraz_metoo))
	{
		return TRUE;
	};
};

func void dia_igaraz_add_info()
{
	AI_Output(other,self,"DIA_Igaraz_Add_15_00");	//Ты знаешь что-нибудь о 'живой скале'?
	AI_Output(self,other,"DIA_Igaraz_Add_13_01");	//(хихикает) Нет! Тебе дал задание Серпентес?
	AI_Output(other,self,"DIA_Igaraz_Add_15_02");	//Да, а что?
	AI_Output(self,other,"DIA_Igaraz_Add_13_03");	//Я, кажется, догадываюсь, что он имел в виду...
	AI_Output(self,other,"DIA_Igaraz_Add_13_04");	//Ты будешь не первым, кто провалил это испытание...
	AI_Output(other,self,"DIA_Igaraz_Add_15_05");	//Где мне найти эту живую скалу?
	AI_Output(self,other,"DIA_Igaraz_Add_13_06");	//Просто иди по этой тропинке. Спустя некоторое время ты увидишь реку.
	AI_Output(self,other,"DIA_Igaraz_Add_13_07");	//Продолжай идти по тропинке в горы. Она должна быть где-то там.
	AI_Output(self,other,"DIA_Igaraz_Add_13_08");	//Если ты дойдешь до моста - значит, ты зашел слишком далеко.
	AI_Output(self,other,"DIA_Igaraz_Add_13_09");	//(смеется) ЕСЛИ тебе вообще удастся уйти далеко...
	AI_Output(self,other,"DIA_Igaraz_Add_13_10");	//Это все что я могу сказать тебе... (с сарказмом) Это ведь все же должно быть твое ИСПЫТАНИЕ!
};


instance DIA_IGARAZ_PRUEFUNG(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 22;
	condition = dia_igaraz_pruefung_condition;
	information = dia_igaraz_pruefung_info;
	description = "Выяснил что-нибудь новое?";
};


func int dia_igaraz_pruefung_condition()
{
	if((other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) < 1) && Npc_KnowsInfo(other,dia_igaraz_metoo))
	{
		return TRUE;
	};
};

func void dia_igaraz_pruefung_info()
{
	AI_Output(other,self,"DIA_Igaraz_Pruefung_15_00");	//Выяснил что-нибудь новое?
	AI_Output(self,other,"DIA_Igaraz_Pruefung_13_01");	//Пока нет, но я продолжаю поиски.
	AI_StopProcessInfos(self);
	if(IGARAZ_WAIT == FALSE)
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"CONTESTWAIT");
		IGARAZ_WAIT = TRUE;
	};
};


instance DIA_IGARAZ_STEIN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 1;
	condition = dia_igaraz_stein_condition;
	information = dia_igaraz_stein_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_igaraz_stein_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_66") <= 3500) && (other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) >= 1))
	{
		return TRUE;
	};
};

func void dia_igaraz_stein_info()
{
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_00");	//Эй, подожди. Нам нужно поговорить...
	AI_Output(other,self,"DIA_Igaraz_Seufz_15_01");	//Я так не думаю...
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_02");	//Я ждал этого испытания много лет. Иннос поддерживает меня и я ДОЛЖЕН пройти его.
	if(Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_03");	//Где-то я уже это слышал.
	}
	else
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_04");	//Ты не первый, кто говорит это.
	};
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_05");	//Хватит болтать. Мне нужно то, что ты нашел. А тебе пришло время умереть!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_IGARANZ_KAP2_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap2_exit_condition;
	information = dia_igaraz_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_KAP3_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap3_exit_condition;
	information = dia_igaraz_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_TALKABOUTBABO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_talkaboutbabo_condition;
	information = dia_igaraz_talkaboutbabo_info;
	permanent = FALSE;
	description = "Нам нужно поговорить о Бабо.";
};


func int dia_igaraz_talkaboutbabo_condition()
{
	if(MIS_BABOSDOCS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_igaraz_talkaboutbabo_info()
{
	AI_Output(other,self,"DIA_Igaranz_TalkAboutBabo_15_00");	//Нам нужно поговорить о Бабо.
	AI_Output(self,other,"DIA_Igaranz_TalkAboutBabo_13_01");	//(сдержанно) Да, в чем дело?
};


instance DIA_IGARANZ_BABOSBELONGINGS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosbelongings_condition;
	information = dia_igaraz_babosbelongings_info;
	permanent = FALSE;
	description = "У тебя есть кое-что принадлежащее Бабо.";
};


func int dia_igaraz_babosbelongings_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_talkaboutbabo))
	{
		return TRUE;
	};
};

func void dia_igaraz_babosbelongings_info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_00");	//У тебя есть кое-что принадлежащее Бабо.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_01");	//И что бы это могло быть?
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_02");	//Несколько листков бумаги. Бабо хотел бы получить их назад.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_03");	//(насмешливо) Да? Надо же! Могу представить. Вынужден огорчить, я предпочел бы оставить их у себя. Похоже, тут налицо противоречие интересов.
};


instance DIA_IGARANZ_WHEREDOCS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_wheredocs_condition;
	information = dia_igaraz_wheredocs_info;
	permanent = FALSE;
	description = "Где эти бумаги?";
};


func int dia_igaraz_wheredocs_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_wheredocs_info()
{
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_00");	//Где эти бумаги?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_01");	//(лукаво) Ну, конечно же, я не держу их при себе. Боюсь, ничем не могу помочь.
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_02");	//Где они?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_03");	//Я запер их в сундуке. А ключ от него тебе никогда не получить.
};


instance DIA_IGARANZ_BABOSJOB(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosjob_condition;
	information = dia_igaraz_babosjob_info;
	permanent = FALSE;
	description = "Что Бабо должен делать для тебя?";
};


func int dia_igaraz_babosjob_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_babosjob_info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_00");	//Что Бабо должен делать для тебя?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_01");	//Если бы я знал, что этот слизняк наложит в штаны из-за нескольких кустов болотной травы, я бы давно позаботился, чтобы кто-нибудь другой занял его место в монастырском саду.
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_02");	//Он должен выращивать болотную траву?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_03");	//Конечно. Так как она больше не поступает из-за Барьера, цена на травку в городе выросла втрое.
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_04");	//Мы могли бы хорошо заработать на этом. Но Бабо отказывается сотрудничать.
};


instance DIA_IGARANZ_PRICE(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_price_condition;
	information = dia_igaraz_price_info;
	permanent = FALSE;
	description = "Сколько ты хочешь за эти бумаги?";
};


func int dia_igaraz_price_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_price_info()
{
	AI_Output(other,self,"DIA_Igaranz_Price_15_00");	//Сколько ты хочешь за эти бумаги?
	AI_Output(self,other,"DIA_Igaranz_Price_13_01");	//(смеется) Ха, вообще-то говоря, они практически бесценны. Очень редко можно встретить что-нибудь подобное.
	AI_Output(self,other,"DIA_Igaranz_Price_13_02");	//Но у меня нет желания рисковать своим будущим из-за нескольких золотых.
	AI_Output(self,other,"DIA_Igaranz_Price_13_03");	//300 монет, и ты можешь делать с этими бумагами все, что захочешь.
};


instance DIA_IGARANZ_BUYIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_buyit_condition;
	information = dia_igaraz_buyit_info;
	permanent = FALSE;
	description = "Я хочу купить эти бумаги.";
};


func int dia_igaraz_buyit_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_price) && (Npc_HasItems(other,itmi_gold) >= 300))
	{
		return TRUE;
	};
};

func void dia_igaraz_buyit_info()
{
	AI_Output(other,self,"DIA_Igaranz_BuyIt_15_00");	//Я хочу купить эти бумаги.
	AI_Output(self,other,"DIA_Igaranz_BuyIt_13_01");	//Послушай, я сейчас не могу отлучиться. Я дам тебе ключ от моего сундука. В нем все равно больше ничего нет.
	b_giveinvitems(other,self,itmi_gold,300);
	b_giveinvitems(self,other,itke_igarazchest_mis,1);
};


instance DIA_IGARAZ_PICKPOCKET(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 900;
	condition = dia_igaraz_pickpocket_condition;
	information = dia_igaraz_pickpocket_info;
	permanent = TRUE;
	description = "(украсть этот ключ будет легко)";
};


func int dia_igaraz_pickpocket_condition()
{
	if((MIS_BABOSDOCS == LOG_RUNNING) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_igarazchest_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_igaraz_pickpocket_info()
{
	Info_ClearChoices(dia_igaraz_pickpocket);
	Info_AddChoice(dia_igaraz_pickpocket,DIALOG_BACK,dia_igaraz_pickpocket_back);
	Info_AddChoice(dia_igaraz_pickpocket,DIALOG_PICKPOCKET,dia_igaraz_pickpocket_doit);
};

func void dia_igaraz_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itke_igarazchest_mis,1);
		b_givethiefxp();
		Info_ClearChoices(dia_igaraz_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_igaraz_pickpocket_back()
{
	Info_ClearChoices(dia_igaraz_pickpocket);
};


instance DIA_IGARANZ_KAP4_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap4_exit_condition;
	information = dia_igaraz_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_KAP5_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap5_exit_condition;
	information = dia_igaraz_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_PERM(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_perm_condition;
	information = dia_igaraz_perm_info;
	permanent = FALSE;
	description = "У тебя есть что-нибудь интересное для меня?";
};


func int dia_igaraz_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF) && (MIS_BABOSDOCS != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_igaraz_perm_info()
{
	AI_Output(other,self,"DIA_Igaranz_Perm_15_00");	//У тебя есть что-нибудь интересное для меня?
	AI_Output(self,other,"DIA_Igaranz_Perm_13_01");	//Хмм... нет.
	AI_StopProcessInfos(self);
};

