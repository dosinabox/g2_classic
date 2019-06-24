
instance DIA_DYRIAN_EXIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 999;
	condition = dia_dyrian_exit_condition;
	information = dia_dyrian_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dyrian_exit_condition()
{
	return TRUE;
};

func void dia_dyrian_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_HELLO(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_hello_condition;
	information = dia_dyrian_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_hello_info()
{
	AI_Output(self,other,"DIA_Dyrian_Hello_13_00");	//(печально) Что тебе нужно?
};


instance DIA_DYRIAN_WURST(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_wurst_condition;
	information = dia_dyrian_wurst_info;
	permanent = FALSE;
	description = "Я занимаюсь распределением колбасы.";
};


func int dia_dyrian_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_dyrian_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Dyrian_Wurst_15_00");	//Я занимаюсь распределением колбасы.
	AI_Output(self,other,"DIA_Dyrian_Wurst_13_01");	//Спасибо. Надеюсь, это не последняя колбаса, что я получу здесь.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
};


instance DIA_DYRIAN_JOB(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_job_condition;
	information = dia_dyrian_job_info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int dia_dyrian_job_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_hello) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_job_info()
{
	AI_Output(other,self,"DIA_Dyrian_Job_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Dyrian_Job_13_01");	//Я грешен. Я нарушил правила поведения в монастыре.
	AI_Output(self,other,"DIA_Dyrian_Job_13_02");	//Теперь я жду решения Высшего Совета. Не знаю, оставят ли меня в монастыре.
};


instance DIA_DYRIAN_WHATDONE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_whatdone_condition;
	information = dia_dyrian_whatdone_info;
	permanent = FALSE;
	description = "Расскажи мне, что произошло.";
};


func int dia_dyrian_whatdone_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_whatdone_info()
{
	AI_Output(other,self,"DIA_Dyrian_WhatDone_15_00");	//Расскажи мне, что произошло.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_01");	//Я взял книгу в комнате одного из магов, когда подметал там, чтобы почитать ее на досуге.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_02");	//Мастер Хиглас, конечно же, сразу заметил пропажу и спросил меня об этой книге.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_03");	//Из страха быть наказанным, я солгал. А затем он застал меня в моей келье, когда я читал эту книгу.
	AI_Output(self,other,"DIA_Dyrian_WhatDone_13_04");	//Он очень разозлился и сообщил об этом Высшему Совету. Теперь они решают, могу ли я остаться в монастыре.
};


instance DIA_DYRIAN_CANHELP(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_canhelp_condition;
	information = dia_dyrian_canhelp_info;
	permanent = TRUE;
	description = "Я могу тебе чем-нибудь помочь?";
};


func int dia_dyrian_canhelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_job) && (MIS_RUNE == FALSE) && (MIS_SCHNITZELJAGD == FALSE) && (MIS_GOLEM == FALSE))
	{
		return TRUE;
	};
};

func void dia_dyrian_canhelp_info()
{
	AI_Output(other,self,"DIA_Dyrian_CanHelp_15_00");	//Я могу тебе чем-нибудь помочь?
	AI_Output(self,other,"DIA_Dyrian_CanHelp_13_01");	//Нет, моя судьба зависит теперь только от милости Инноса и магов.
};


instance DIA_DYRIAN_SCROLL(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 1;
	condition = dia_dyrian_scroll_condition;
	information = dia_dyrian_scroll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_scroll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) || (MIS_RUNE == LOG_RUNNING) || (MIS_GOLEM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dyrian_scroll_info()
{
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_00");	//Эй, ты действительно потребовал Испытания Огнем?
	AI_Output(other,self,"DIA_Dyrian_Scroll_15_01");	//Да. И я намерен пройти его.
	AI_Output(self,other,"DIA_Dyrian_Scroll_13_02");	//Хорошо - возможно, я могу помочь тебе в этом. Я могу дать тебе свиток с очень сильным заклинанием. Заклинанием СОН. Ну, как?
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"Нет, мне не нужна твоя помощь.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"Что ты хочешь за это?",dia_dyrian_scroll_how);
	Info_AddChoice(dia_dyrian_scroll,"И что мне делать с ним?",dia_dyrian_scroll_what);
};

func void dia_dyrian_scroll_what()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_00");	//И что мне делать с ним?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_01");	//При помощи этого заклинания ты можешь погружать людей в магический сон на короткое время. Но только если их воля слабее твоей.
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_02");	//Это моет быть очень полезным, если кто-то стоит у тебя на пути...
	AI_Output(other,self,"DIA_Dyrian_Scroll_What_15_03");	//А как я узнаю, чья воля сильнее?
	AI_Output(self,other,"DIA_Dyrian_Scroll_What_13_04");	//Не стоит даже и пытаться испытывать это заклинание на магах. Но большинство послушников погрузить в сон тебе удастся.
};

func void dia_dyrian_scroll_no()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_No_15_00");	//Нет, мне не нужна твоя помощь.
	AI_Output(self,other,"DIA_Dyrian_Scroll_No_13_01");	//Ты можешь обратиться ко мне в любое время, если передумаешь.
	Info_ClearChoices(dia_dyrian_scroll);
};

func void dia_dyrian_scroll_how()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_How_15_00");	//Что ты хочешь за него?
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_01");	//У каждого вновь посвященного мага есть право на одно желание.
	AI_Output(self,other,"DIA_Dyrian_Scroll_How_13_02");	//И если ты действительно пройдешь Испытание Огнем, ты можешь пожелать, чтобы я остался в монастыре.
	Info_ClearChoices(dia_dyrian_scroll);
	Info_AddChoice(dia_dyrian_scroll,"Нет, мне не нужна твоя помощь.",dia_dyrian_scroll_no);
	Info_AddChoice(dia_dyrian_scroll,"Хорошо, давай мне этот свиток.",dia_dyrian_scroll_yes);
};

func void dia_dyrian_scroll_yes()
{
	AI_Output(other,self,"DIA_Dyrian_Scroll_Yes_15_00");	//Хорошо, давай мне этот свиток.
	AI_Output(self,other,"DIA_Dyrian_Scroll_Yes_13_01");	//Удачи тебе в этом испытании. Да поможет тебе Иннос.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_DYRIANDRIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DYRIANDRIN,LOG_RUNNING);
	b_logentry(TOPIC_DYRIANDRIN,"Дуриан дал мне свиток с заклинанием Сон. Взамен, он хочет, чтобы если я стану магом, я замолвил за него словечко и он остался в монастыре.");
	Info_ClearChoices(dia_dyrian_scroll);
};


instance DIA_DYRIAN_DOCH(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 4;
	condition = dia_dyrian_doch_condition;
	information = dia_dyrian_doch_info;
	permanent = TRUE;
	description = "Я передумал. Давай мне это заклинание сна.";
};


func int dia_dyrian_doch_condition()
{
	if(Npc_KnowsInfo(hero,dia_dyrian_scroll) && (MIS_HELPDYRIAN != LOG_RUNNING) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_dyrian_doch_info()
{
	AI_Output(other,self,"DIA_Dyrian_Doch_15_00");	//Я передумал. Давай мне это заклинание сна.
	AI_Output(self,other,"DIA_Dyrian_Doch_13_01");	//Хорошо, если ты пройдешь испытание, то замолвишь за меня словечко, и меня оставят в монастыре.
	b_giveinvitems(self,other,itsc_sleep,1);
	MIS_HELPDYRIAN = LOG_RUNNING;
};


instance DIA_DYRIAN_HELLOAGAIN(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 2;
	condition = dia_dyrian_helloagain_condition;
	information = dia_dyrian_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dyrian_helloagain_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild == GIL_KDF) && (MIS_HELPDYRIAN == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_dyrian_helloagain_info()
{
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_00");	//(радостно) Спасибо! Ты спас меня!
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_01");	//(испуганно) Ох - прошу простить меня, Мастер. Я не хотел показаться невежливым.
	AI_Output(self,other,"DIA_Dyrian_HelloAgain_13_02");	//(с уважением) Я благодарю тебя за то, что мне позволено остаться в монастыре. Моя жизнь теперь переменится...
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};

func void b_dyrian_playerhowisit()
{
	AI_Output(other,self,"DIA_Dyrian_HowIsIt_15_00");	//Как дела?
};


instance DIA_DYRIAN_HOWISIT(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_howisit_condition;
	information = dia_dyrian_howisit_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_dyrian_howisit_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_helloagain))
	{
		return TRUE;
	};
};

func void dia_dyrian_howisit_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_01");	//Хорошо. Мне очень нравится моя работа, Мастер.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_OTHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_other_condition;
	information = dia_dyrian_other_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_dyrian_other_condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_dyrian_other_info()
{
	b_dyrian_playerhowisit();
	AI_Output(self,other,"DIA_Dyrian_HowIsIt_13_02");	//Я благодарен Инносу за то, что могу жить в монастыре.
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_KNEIPE(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_kneipe_condition;
	information = dia_dyrian_kneipe_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_dyrian_kneipe_condition()
{
	if((MIS_HELPDYRIAN == LOG_FAILED) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_dyrian_kneipe_info()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_01");	//Ты еще спрашиваешь? Я так надеялся на тебя, а ты бросил меня в беде.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_13_02");	//Теперь мне ничего не остается, кроме как заливать свое горе вином. И в этом виноват ты!
	Info_ClearChoices(dia_dyrian_kneipe);
	Info_AddChoice(dia_dyrian_kneipe,"Вот, держи 5 золотых.",dia_dyrian_kneipe_gold);
	Info_AddChoice(dia_dyrian_kneipe,"Я могу все объяснить.",dia_dyrian_kneipe_canexplain);
	Info_AddChoice(dia_dyrian_kneipe,"Следи за своими словами.",dia_dyrian_kneipe_shutup);
};

func void dia_dyrian_kneipe_gold()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_Gold_15_00");	//Вот, держи 5 золотых.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_01");	//(нервно) 5 золотых? Ты даешь мне 5 золотых в качестве компенсации за то, что лишил меня смысла моей жизни?
	AI_Output(self,other,"DIA_Dyrian_Kneipe_Gold_13_02");	//Я возьму все твое золото!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,0);
};

func void dia_dyrian_kneipe_canexplain()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_CanExplain_15_00");	//Я могу все объяснить.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_01");	//Мне не нужны твои объяснения.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_CanExplain_13_02");	//Ты лжешь каждый раз, когда открываешь свой поганый рот. А теперь оставь меня.
	AI_StopProcessInfos(self);
};

func void dia_dyrian_kneipe_shutup()
{
	AI_Output(other,self,"DIA_Dyrian_Kneipe_ShutUp_15_00");	//Следи за своими словами.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_01");	//Да, давай, угрожай мне! Это все равно тебе не поможет.
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_02");	//Я всем расскажу, какой ты вероломный ублюдок! Вот только прикончу эту бутылку...
	AI_Output(self,other,"DIA_Dyrian_Kneipe_ShutUp_13_03");	//А теперь убирайся с глаз моих, ты мне противен!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_NACHHER(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 3;
	condition = dia_dyrian_nachher_condition;
	information = dia_dyrian_nachher_info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int dia_dyrian_nachher_condition()
{
	if(Npc_KnowsInfo(other,dia_dyrian_kneipe))
	{
		return TRUE;
	};
};

func void dia_dyrian_nachher_info()
{
	AI_Output(other,self,"DIA_Dyrian_nachher_15_00");	//Что с тобой?
	AI_Output(self,other,"DIA_Dyrian_nachher_13_01");	//Ах, оставь меня в покое! Я даже знать тебя не хочу!
	AI_StopProcessInfos(self);
};


instance DIA_DYRIAN_PICKPOCKET(C_INFO)
{
	npc = nov_604_dyrian;
	nr = 900;
	condition = dia_dyrian_pickpocket_condition;
	information = dia_dyrian_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_dyrian_pickpocket_condition()
{
	return c_beklauen(10,15);
};

func void dia_dyrian_pickpocket_info()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_BACK,dia_dyrian_pickpocket_back);
	Info_AddChoice(dia_dyrian_pickpocket,DIALOG_PICKPOCKET,dia_dyrian_pickpocket_doit);
};

func void dia_dyrian_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dyrian_pickpocket);
};

func void dia_dyrian_pickpocket_back()
{
	Info_ClearChoices(dia_dyrian_pickpocket);
};

