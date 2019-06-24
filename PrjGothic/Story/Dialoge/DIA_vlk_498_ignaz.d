
instance DIA_IGNAZ_EXIT(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 999;
	condition = dia_ignaz_exit_condition;
	information = dia_ignaz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ignaz_exit_condition()
{
	return TRUE;
};

func void dia_ignaz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_PICKPOCKET(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 900;
	condition = dia_ignaz_pickpocket_condition;
	information = dia_ignaz_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_ignaz_pickpocket_condition()
{
	return c_beklauen(38,50);
};

func void dia_ignaz_pickpocket_info()
{
	Info_ClearChoices(dia_ignaz_pickpocket);
	Info_AddChoice(dia_ignaz_pickpocket,DIALOG_BACK,dia_ignaz_pickpocket_back);
	Info_AddChoice(dia_ignaz_pickpocket,DIALOG_PICKPOCKET,dia_ignaz_pickpocket_doit);
};

func void dia_ignaz_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ignaz_pickpocket);
};

func void dia_ignaz_pickpocket_back()
{
	Info_ClearChoices(dia_ignaz_pickpocket);
};


instance DIA_IGNAZ_HALLO(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_hallo_condition;
	information = dia_ignaz_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ignaz_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ignaz_hallo_info()
{
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_00");	//Ах - ты заглянул как раз вовремя. Мне нужен ассистент для магического эксперимента.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_01");	//Я уверен, что тебе не терпится оказать мне услугу во имя науки.
	AI_Output(other,self,"DIA_Ignaz_Hallo_15_02");	//Полегче, друг мой. Сначала скажи, в чем он заключается.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_03");	//Я разработал новое заклинание. Заклинание Забвения.
	AI_Output(self,other,"DIA_Ignaz_Hallo_14_04");	//Я уже придумал, как можно использовать его, но у меня нет времени на проведение одного последнего теста.
};


instance DIA_IGNAZ_TRAENKE(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 3;
	condition = dia_ignaz_traenke_condition;
	information = dia_ignaz_traenke_info;
	permanent = FALSE;
	description = "И что я получу за то, что помогу тебе?";
};


func int dia_ignaz_traenke_condition()
{
	if(MIS_IGNAZ_CHARM != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ignaz_traenke_info()
{
	AI_Output(other,self,"DIA_Ignaz_Traenke_15_00");	//И что я получу за то, что помогу тебе?
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_01");	//Я мог бы обучить тебя искусству приготовления зелий.
	AI_Output(self,other,"DIA_Ignaz_Traenke_14_02");	//Я знаю рецепты лечебной эссенции и эссенции маны, а также зелья ускорения.
};


instance DIA_IGNAZ_EXPERIMENT(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 4;
	condition = dia_ignaz_experiment_condition;
	information = dia_ignaz_experiment_info;
	permanent = FALSE;
	description = "Расскажи мне подробнее об этом эксперименте и самом заклинании.";
};


func int dia_ignaz_experiment_condition()
{
	return TRUE;
};

func void dia_ignaz_experiment_info()
{
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_00");	//Расскажи мне подробнее об этом эксперименте и самом заклинании.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_01");	//Это заклинание позволяет заставить кого-нибудь забыть некоторые события.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_02");	//Пока, я выяснил только, что оно работает, когда объект этого заклинания находится в ярости - например, если он только что был сбит с ног или ограблен.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_03");	//И даже несмотря на то, что эта неприятность произошла с ним только что, он все забудет.
	AI_Output(other,self,"DIA_Ignaz_Experiment_15_04");	//То есть, я должен сбить кого-нибудь с ног и наложить на него это заклинание?
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_05");	//Да, ты все правильно понимаешь. Но чтобы разозлить кого-нибудь, достаточно просто атаковать - вовсе нет необходимости сбивать его с ног.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_06");	//Только ты должен проделать все это без свидетелей - если неподалеку будут находиться другие люди, у тебя обязательно возникнут проблемы с Лордом Андрэ.
	AI_Output(self,other,"DIA_Ignaz_Experiment_14_07");	//Также не имеет смысла налагать это заклинание на того, кто атакует тебя. Выжди подходящий момент.
};


instance DIA_IGNAZ_TEILNEHMEN(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 5;
	condition = dia_ignaz_teilnehmen_condition;
	information = dia_ignaz_teilnehmen_info;
	permanent = FALSE;
	description = "Хорошо, я испытаю это заклинание.";
};


func int dia_ignaz_teilnehmen_condition()
{
	if(Npc_KnowsInfo(other,dia_ignaz_experiment))
	{
		return TRUE;
	};
};

func void dia_ignaz_teilnehmen_info()
{
	AI_Output(other,self,"DIA_Ignaz_teilnehmen_15_00");	//Хорошо, я испытаю это заклинание.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_01");	//Тогда возьми этот свиток и найди подходящего подопытного кролика.
	AI_Output(self,other,"DIA_Ignaz_teilnehmen_14_02");	//А когда закончишь, возвращайся и расскажи мне как все прошло.
	b_giveinvitems(self,other,itsc_charm,1);
	MIS_IGNAZ_CHARM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_IGNAZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_IGNAZ,LOG_RUNNING);
	b_logentry(TOPIC_IGNAZ,"Я должен испытать новое заклинание Игнаца. Это заклинание называется Забвение. Иногда кто-нибудь выходит из себя в результате драки или по другой причине и больше не хочет говорить со мной. Это идеальный момент для использования этого заклинания.");
	b_logentry(TOPIC_IGNAZ,"Это идеальная возможность испытать заклинание. Подопытный также забудет доложить о произошедшем властям. Я не думаю, что кто-либо в портовом квартале сильно обидится, если я вырублю его.");
	AI_StopProcessInfos(self);
};


instance DIA_IGNAZ_RUNNING(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_running_condition;
	information = dia_ignaz_running_info;
	permanent = FALSE;
	description = "Насчет эксперимента...";
};


func int dia_ignaz_running_condition()
{
	if((MIS_IGNAZ_CHARM == LOG_RUNNING) && (CHARM_TEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_ignaz_running_info()
{
	AI_Output(other,self,"DIA_Ignaz_Running_15_00");	//Насчет эксперимента...
	AI_Output(self,other,"DIA_Ignaz_Running_14_01");	//У тебя получилось, да? Или ты просто попусту истратил мой свиток?
	AI_Output(self,other,"DIA_Ignaz_Running_14_02");	//Если тебе нужны еще свитки с этим заклинанием, ты можешь купить их у меня.
};


instance DIA_IGNAZ_DANACH(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 6;
	condition = dia_ignaz_danach_condition;
	information = dia_ignaz_danach_info;
	permanent = FALSE;
	description = "Я использовал свиток.";
};


func int dia_ignaz_danach_condition()
{
	if((CHARM_TEST == TRUE) && (MIS_IGNAZ_CHARM == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_ignaz_danach_info()
{
	AI_Output(other,self,"DIA_Ignaz_Danach_15_00");	//Я использовал свиток.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_01");	//Отлично, отлично. У тебя все получилось?
	AI_Output(other,self,"DIA_Ignaz_Danach_15_02");	//Да, заклинание сработало.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_03");	//Превосходно. Может, с точки зрения науки это и не очень большое достижение, но для меня оно очень много значит!
	AI_Output(self,other,"DIA_Ignaz_Danach_14_04");	//Теперь я могу уделить тебе время и обучить тебя искусству алхимии.
	AI_Output(self,other,"DIA_Ignaz_Danach_14_05");	//Я также могу продать тебе что-нибудь полезное, если ты, конечно, хочешь этого.
	IGNAZ_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Игнац может показать мне рецепты приготовления зелий. Он живет в портовом квартале.");
	MIS_IGNAZ_CHARM = LOG_SUCCESS;
	b_giveplayerxp(XP_MIS_IGNAZ_CHARM);
	CreateInvItems(self,itsc_charm,3);
};


instance DIA_IGNAZ_TRADE(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 6;
	condition = dia_ignaz_trade_condition;
	information = dia_ignaz_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int dia_ignaz_trade_condition()
{
	if((MIS_IGNAZ_CHARM == LOG_SUCCESS) || Npc_KnowsInfo(other,dia_ignaz_running))
	{
		return TRUE;
	};
};

func void dia_ignaz_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Ignaz_Trade_15_00");	//Покажи мне свои товары.
};


instance DIA_IGNAZ_TEACH(C_INFO)
{
	npc = vlk_498_ignaz;
	nr = 2;
	condition = dia_ignaz_teach_condition;
	information = dia_ignaz_teach_info;
	permanent = TRUE;
	description = "Обучи меня искусству алхимии.";
};


var int dia_ignaz_teach_permanent;

func int dia_ignaz_teach_condition()
{
	if((DIA_IGNAZ_TEACH_PERMANENT == FALSE) && (IGNAZ_TEACHALCHEMY == TRUE))
	{
		return TRUE;
	};
};

func void dia_ignaz_teach_info()
{
	var int talente;
	talente = 0;
	AI_Output(other,self,"DIA_Ignaz_Teach_15_00");	//Обучи меня искусству алхимии.
	if((PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE) || (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE))
	{
		Info_ClearChoices(dia_ignaz_teach);
		Info_AddChoice(dia_ignaz_teach,DIALOG_BACK,dia_ignaz_teach_back);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE) && ((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE)))
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Зелье ускорения",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_ignaz_teach_speed);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Эссенция маны",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_ignaz_teach_mana);
		talente = talente + 1;
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_ignaz_teach,b_buildlearnstring("Лечебная эссенция",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_ignaz_teach_health);
		talente = talente + 1;
	};
	if(talente > 0)
	{
		if(ALCHEMY_EXPLAIN != TRUE)
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_01");	//Чтобы приготовить зелье на алхимическом столе, тебе понадобится лабораторная пробирка.
			AI_Output(self,other,"DIA_Ignaz_Teach_14_02");	//Также тебе понадобятся различные растения и другие ингредиенты.
			ALCHEMY_EXPLAIN = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Ignaz_Teach_14_04");	//Что ты хочешь узнать?
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ignaz_Teach_14_05");	//Ты уже знаешь все, чему я мог обучить тебя.
		DIA_IGNAZ_TEACH_PERMANENT = TRUE;
	};
};

func void dia_ignaz_teach_health()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_speed()
{
	b_teachplayertalentalchemy(self,other,POTION_SPEED);
	Info_ClearChoices(dia_ignaz_teach);
};

func void dia_ignaz_teach_back()
{
	Info_ClearChoices(dia_ignaz_teach);
};

