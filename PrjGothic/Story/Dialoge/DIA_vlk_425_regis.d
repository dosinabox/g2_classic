
instance DIA_REGIS_EXIT(C_INFO)
{
	npc = vlk_425_regis;
	nr = 999;
	condition = dia_regis_exit_condition;
	information = dia_regis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_regis_exit_condition()
{
	return TRUE;
};

func void dia_regis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_REGIS_PICKPOCKET(C_INFO)
{
	npc = vlk_425_regis;
	nr = 900;
	condition = dia_regis_pickpocket_condition;
	information = dia_regis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_regis_pickpocket_condition()
{
	return c_beklauen(40,35);
};

func void dia_regis_pickpocket_info()
{
	Info_ClearChoices(dia_regis_pickpocket);
	Info_AddChoice(dia_regis_pickpocket,DIALOG_BACK,dia_regis_pickpocket_back);
	Info_AddChoice(dia_regis_pickpocket,DIALOG_PICKPOCKET,dia_regis_pickpocket_doit);
};

func void dia_regis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_regis_pickpocket);
};

func void dia_regis_pickpocket_back()
{
	Info_ClearChoices(dia_regis_pickpocket);
};


instance DIA_REGIS_HALLO(C_INFO)
{
	npc = vlk_425_regis;
	nr = 1;
	condition = dia_regis_hallo_condition;
	information = dia_regis_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_regis_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_regis_hallo_info()
{
	AI_Output(self,other,"DIA_Regis_Hallo_13_00");	//Эй, ты недавно в этом городе, да?
	AI_Output(other,self,"DIA_Regis_Hallo_15_01");	//Да, а ты?
	AI_Output(self,other,"DIA_Regis_Hallo_13_02");	//Я приплыл с материка и вот теперь болтаюсь здесь без дела. У меня почти закончились деньги, поэтому, похоже, мне ничего другого не остается, кроме как поступить в ополчение.
	AI_Output(self,other,"DIA_Regis_Hallo_13_03");	//Но я не хочу делать этого. Я не хочу, чтобы меня убили орки, когда я буду сражаться за короля.
};


instance DIA_REGIS_MILIZ(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_miliz_condition;
	information = dia_regis_miliz_info;
	permanent = FALSE;
	description = "Что ты можешь рассказать об ополчении?";
};


func int dia_regis_miliz_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_hallo))
	{
		return TRUE;
	};
};

func void dia_regis_miliz_info()
{
	AI_Output(other,self,"DIA_Regis_MILIZ_15_00");	//Что ты можешь рассказать об ополчении?
	AI_Output(self,other,"DIA_Regis_Add_13_01");	//Ими теперь командует один из паладинов. Некий лорд Андрэ.
	AI_Output(self,other,"DIA_Regis_Add_13_02");	//Он пытается мобилизовать половину города на случай нападения орков.
	AI_Output(self,other,"DIA_Regis_Add_13_03");	//Но чтобы вступить в ополчение, нужно быть гражданином этого города.
	AI_Output(self,other,"DIA_Regis_Add_13_04");	//Насколько мне известно, если ты не являешься гражданином города, тебя все равно будут тренировать, но официально не зачислят.
};


instance DIA_REGIS_ANDRE(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_andre_condition;
	information = dia_regis_andre_info;
	permanent = FALSE;
	description = "Что еще ты можешь рассказать о лорде Андрэ?";
};


func int dia_regis_andre_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_miliz))
	{
		return TRUE;
	};
};

func void dia_regis_andre_info()
{
	AI_Output(other,self,"DIA_Regis_ANDRE_15_00");	//Что еще ты можешь рассказать о лорде Андрэ?
	AI_Output(self,other,"DIA_Regis_Add_13_05");	//Он также занял должность судьи.
	AI_Output(self,other,"DIA_Regis_Add_13_06");	//Если ты нарушил закон в городе, тебе придется держать ответ перед ним.
	AI_Output(self,other,"DIA_Regis_Add_13_07");	//Я как-то подрался с одним горожанином.
	AI_Output(self,other,"DIA_Regis_Add_13_08");	//Он побежал жаловаться к лорду Андрэ.
	AI_Output(self,other,"DIA_Regis_Add_13_09");	//И этот пустяк обошелся мне в 50 золотых монет.
	AI_Output(self,other,"DIA_Regis_Add_13_10");	//Хорошо еще, что это случилось ночью, а то были бы другие свидетели.
	AI_Output(self,other,"DIA_Regis_Add_13_11");	//Чем больше людей жалуется на тебя, тем выше штраф.
};


instance DIA_REGIS_VALENTINO(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_valentino_condition;
	information = dia_regis_valentino_info;
	permanent = FALSE;
	description = "С кем ты дрался?";
};


func int dia_regis_valentino_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_andre))
	{
		return TRUE;
	};
};

func void dia_regis_valentino_info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_12");	//С кем ты дрался?
	AI_Output(self,other,"DIA_Regis_Add_13_13");	//С парнем по имени Валентино. Он часто ошивается в таверне около храма.
	AI_Output(self,other,"DIA_Regis_Add_13_14");	//Обычно я довольно мирный. Но ЭТОТ урод просто вывел меня из себя...
};


instance DIA_REGIS_VALDEFEAT(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_valdefeat_condition;
	information = dia_regis_valdefeat_info;
	permanent = FALSE;
	description = "Я встретил этого Валентино...";
};


func int dia_regis_valdefeat_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_valentino) && (valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_regis_valdefeat_info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_15");	//Я встретил этого Валентино...
	AI_Output(self,other,"DIA_Regis_Add_13_16");	//И?
	AI_Output(other,self,"DIA_Regis_Add_15_17");	//Я задал ему хорошую взбучку...
	AI_Output(self,other,"DIA_Regis_Add_13_18");	//(смеется) Он заслужил это...
	if(!Npc_IsDead(valentino))
	{
		AI_Output(self,other,"DIA_Regis_Add_13_19");	//Вот - я нашел это кольцо в его кармане, когда наша стычка закончилась.
		b_giveinvitems(self,other,itri_prot_edge_01_valentino,1);
		REGIS_RING = TRUE;
		AI_Output(self,other,"DIA_Regis_Add_13_20");	//(ухмыляется) Ты можешь передать его следующему, кто надает ему тумаков...
	};
};


var int regis_bogendieb;

instance DIA_REGIS_PERM(C_INFO)
{
	npc = vlk_425_regis;
	nr = 200;
	condition = dia_regis_perm_condition;
	information = dia_regis_perm_info;
	permanent = TRUE;
	description = "Слышал что-нибудь интересное?";
};


func int dia_regis_perm_condition()
{
	return TRUE;
};

func void dia_regis_perm_info()
{
	AI_Output(other,self,"DIA_Regis_PERM_15_00");	//Слышал что-нибудь интересное?
	if((REGIS_BOGENDIEB == FALSE) && (MIS_BOSPER_BOGEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_01");	//Можно сказать и так.
		AI_Output(self,other,"DIA_Regis_PERM_13_02");	//Говорят, Боспер, мастер-лучник, был ограблен. Причем самым наглым образом!
		AI_Output(self,other,"DIA_Regis_PERM_13_03");	//Вор вломился в его лавку средь бела дня и схватил лук.
		AI_Output(self,other,"DIA_Regis_PERM_13_04");	//"Боспер побежал за ним, вопя ""Держи вора!"" Но вор оказался очень проворным."
		MIS_BOSPER_BOGEN = LOG_RUNNING;
		REGIS_BOGENDIEB = TRUE;
	}
	else if((MIS_BOSPER_BOGEN == LOG_SUCCESS) && (REGIS_BOGENDIEB != 2))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_05");	//А потом какой-то честный человек нашел этот лук и вернул Босперу.
		AI_Output(self,other,"DIA_Regis_PERM_13_06");	//Это странно - в наше время обычно никому нет дела до других, но этот парень сам зашел к нему и вернул лук.
		REGIS_BOGENDIEB = 2;
	}
	else if(KAPITEL != 3)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_07");	//Пока все тихо. Но я думаю, что когда придут орки, мы это заметим...
	}
	else if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_08");	//Выяснилось, что этот наемник невиновен, и им пришлось отпустить его.
		AI_Output(self,other,"DIA_Regis_PERM_13_09");	//Лорд Хаген, должно быть, вне себя от ярости.
	}
	else
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_10");	//Весь город только и говорит об этом. Ты помнишь Лотара, паладина?
		AI_Output(other,self,"DIA_Regis_PERM_15_11");	//Может быть.
		AI_Output(self,other,"DIA_Regis_PERM_13_12");	//Так вот, он мертв. Убит прямо на улице. В этом подозревают наемников, конечно же.
	};
};


instance DIA_REGIS_CREW(C_INFO)
{
	npc = vlk_425_regis;
	nr = 51;
	condition = dia_regis_crew_condition;
	information = dia_regis_crew_info;
	permanent = FALSE;
	description = "Я пытаюсь собрать команду для морской прогулки.";
};


func int dia_regis_crew_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_regis_crew_info()
{
	AI_Output(other,self,"DIA_Regis_Crew_15_00");	//Я пытаюсь собрать команду для морской прогулки.
	AI_Output(self,other,"DIA_Regis_Crew_13_01");	//Ничем не могу помочь. Тебе лучше поспрашивать в порту, ну или может в кабаке.
	AI_Output(self,other,"DIA_Regis_Crew_13_02");	//Если здесь еще остались моряки, то, скорее всего, ты найдешь их там.
};

