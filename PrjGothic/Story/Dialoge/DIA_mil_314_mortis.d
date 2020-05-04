
instance DIA_MORTIS_EXIT(C_INFO)
{
	npc = mil_314_mortis;
	nr = 999;
	condition = dia_mortis_exit_condition;
	information = dia_mortis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mortis_exit_condition()
{
	return TRUE;
};

func void dia_mortis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MORTIS_HALLO(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_hallo_condition;
	information = dia_mortis_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mortis_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && ((Npc_KnowsInfo(other,dia_peck_found_peck) == FALSE) && (KAPITEL < 3)))
	{
		return TRUE;
	};
};

func void dia_mortis_hallo_info()
{
	AI_Output(self,other,"DIA_Mortis_Hallo_13_00");	//Что тебе нужно? Пека здесь нет. А без него ты ничего не получишь. Заходи позже.
};


instance DIA_MORTIS_WAFFE(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_waffe_condition;
	information = dia_mortis_waffe_info;
	permanent = FALSE;
	description = "А где Пек?";
};


func int dia_mortis_waffe_condition()
{
	if((MIS_ANDRE_PECK == LOG_RUNNING) && ((Npc_KnowsInfo(other,dia_peck_found_peck) == FALSE) && (KAPITEL < 3)))
	{
		return TRUE;
	};
};

func void dia_mortis_waffe_info()
{
	AI_Output(other,self,"DIA_Mortis_Waffe_15_00");	//А где Пек?
	AI_Output(self,other,"DIA_Mortis_Waffe_13_01");	//Ты только что вступил в наши ряды? Ну, тогда добро пожаловать.
	AI_Output(self,other,"DIA_Mortis_Waffe_13_02");	//Пек ушел в город уже давно. Готов поспорить, что он обхаживает Ваню в Красном Фонаре.
};


instance DIA_MORTIS_PAKET(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_paket_condition;
	information = dia_mortis_paket_info;
	permanent = FALSE;
	description = "Ты что-нибудь знаешь о тюке травки?";
};


func int dia_mortis_paket_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_mortis_paket_info()
{
	AI_Output(other,self,"DIA_Mortis_Paket_15_00");	//Ты что-нибудь знаешь о тюке травки?
	AI_Output(self,other,"DIA_Mortis_Paket_13_01");	//Хм... последний раз, когда я был в портовом кабаке, я слышал, как Кардиф говорил об этом с каким-то парнем.
	AI_Output(other,self,"DIA_Mortis_Paket_15_02");	//Что это за парень?
	AI_Output(self,other,"DIA_Mortis_Paket_13_03");	//Понятия не имею. Но он сказал, что нашел отличное место для хранения травы - а затем они долго ржали как пьяные орки.
	b_logentry(TOPIC_WAREHOUSE,"Мортис слышал, как трактирщик Кардиф и кто-то еще разговаривали о тюке в портовой таверне. Они обсуждали, где лучше хранить его.");
};


instance DIA_MORTIS_REDLIGHT(C_INFO)
{
	npc = mil_314_mortis;
	nr = 2;
	condition = dia_mortis_redlight_condition;
	information = dia_mortis_redlight_info;
	permanent = FALSE;
	description = "Ты хорошо знаешь портовый квартал?";
};


func int dia_mortis_redlight_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_mortis_redlight_info()
{
	AI_Output(other,self,"DIA_Mortis_Redlight_15_00");	//Ты хорошо знаешь портовый квартал? Я хочу найти того, кто продает болотную траву.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_01");	//Ну-у... Народ там не особенно разговорчивый, и они уж точно ничего не скажут городскому стражнику.
	AI_Output(self,other,"DIA_Mortis_Redlight_13_02");	//Если ты хочешь разузнать что-либо там, тебе лучше... нет, ты ДОЛЖЕН снять свои доспехи.
	AI_Output(other,self,"DIA_Mortis_Redlight_15_03");	//Хорошо, а что дальше?
	AI_Output(self,other,"DIA_Mortis_Redlight_13_04");	//Кабак и бордель - вероятно, самые лучшие места для поисков. Если тебе вообще удастся что-либо узнать, то ты узнаешь это там.
	b_logentry(TOPIC_REDLIGHT,"Мортис полагает, что если я хочу купить болотную траву в портовом квартале, мне лучше снять все доспехи. Лучше всего попытать счасться в таверне или борделе.");
};


instance DIA_MORTIS_CANTEACH(C_INFO)
{
	npc = mil_314_mortis;
	nr = 5;
	condition = dia_mortis_canteach_condition;
	information = dia_mortis_canteach_info;
	permanent = TRUE;
	description = "Я хочу стать сильнее.";
};


func int dia_mortis_canteach_condition()
{
	if(MORTIS_TEACHSTR == FALSE)
	{
		return TRUE;
	};
};

func void dia_mortis_canteach_info()
{
	AI_Output(other,self,"DIA_Mortis_CanTeach_15_00");	//Я хочу стать сильнее.
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_01");	//Понятно. Если у тебя достаточно опыта, я могу потренировать тебя.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Ополченец Мортис может помочь мне повысить мою силу.");
		MORTIS_TEACHSTR = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mortis_CanTeach_13_02");	//Конечно, хочешь. Но пока ты не станешь одним из нас или паладином, я не буду помогать тебе.
	};
};


instance DIA_MORTIS_TEACH(C_INFO)
{
	npc = mil_314_mortis;
	nr = 100;
	condition = dia_mortis_teach_condition;
	information = dia_mortis_teach_info;
	permanent = TRUE;
	description = "Я хочу стать сильнее.";
};


var int dia_mortis_teach_permanent;

func int dia_mortis_teach_condition()
{
	if((MORTIS_TEACHSTR == TRUE) && (DIA_MORTIS_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_mortis_teach_info()
{
	AI_Output(other,self,"DIA_Mortis_Teach_15_00");	//Я хочу стать сильнее.
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};

func void dia_mortis_teach_back()
{
	if(other.attribute[ATR_STRENGTH] >= 60)
	{
		AI_Output(self,other,"DIA_Mortis_Teach_13_00");	//Ты и так достаточно силен. Если же ты стремишься к большему, найди себе другого учителя.
		DIA_MORTIS_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_mortis_teach);
};

func void dia_mortis_teach_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,60);
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};

func void dia_mortis_teach_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,60);
	Info_ClearChoices(dia_mortis_teach);
	Info_AddChoice(dia_mortis_teach,DIALOG_BACK,dia_mortis_teach_back);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_mortis_teach_1);
	Info_AddChoice(dia_mortis_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_mortis_teach_5);
};


instance DIA_MORTIS_PICKPOCKET(C_INFO)
{
	npc = mil_314_mortis;
	nr = 900;
	condition = dia_mortis_pickpocket_condition;
	information = dia_mortis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_mortis_pickpocket_condition()
{
	return c_beklauen(38,60);
};

func void dia_mortis_pickpocket_info()
{
	Info_ClearChoices(dia_mortis_pickpocket);
	Info_AddChoice(dia_mortis_pickpocket,DIALOG_BACK,dia_mortis_pickpocket_back);
	Info_AddChoice(dia_mortis_pickpocket,DIALOG_PICKPOCKET,dia_mortis_pickpocket_doit);
};

func void dia_mortis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mortis_pickpocket);
};

func void dia_mortis_pickpocket_back()
{
	Info_ClearChoices(dia_mortis_pickpocket);
};

