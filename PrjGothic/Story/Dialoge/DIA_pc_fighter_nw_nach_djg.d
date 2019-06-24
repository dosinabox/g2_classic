
instance DIA_GORNNW_NACH_DJG_KAP5_EXIT(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 999;
	condition = dia_gornnw_nach_djg_kap5_exit_condition;
	information = dia_gornnw_nach_djg_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornnw_nach_djg_kap5_exit_condition()
{
	return TRUE;
};

func void dia_gornnw_nach_djg_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNNW_NACH_DJG_ALLDRAGONSDEAD(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 59;
	condition = dia_gornnw_nach_djg_alldragonsdead_condition;
	information = dia_gornnw_nach_djg_alldragonsdead_info;
	permanent = TRUE;
	description = "Ты спокоен?";
};


func int dia_gornnw_nach_djg_alldragonsdead_condition()
{
	if(GORN_ISONBOARD != LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_00");	//Ты спокоен?
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_01");	//Конечно, а почему нет? Драконы ведь мертвы, разве не так?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_AllDragonsDead_15_02");	//Все немного сложнее.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_AllDragonsDead_12_03");	//(смеется) Ладно. Все как всегда. Дай мне знать, если тебе понадобится мой топор.
};


instance DIA_GORNNW_NACH_DJG_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 55;
	condition = dia_gornnw_nach_djg_knowwhereenemy_condition;
	information = dia_gornnw_nach_djg_knowwhereenemy_info;
	permanent = TRUE;
	description = "Мне нужны ты и твой топор.";
};


func int dia_gornnw_nach_djg_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (GORN_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_00");	//Мне нужны ты и твой топор.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_01");	//Хорошо. Я не удивлен. Что я могу сделать для тебя?
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_02");	//Ты поплывешь со мной на другой остров? Нужно кое-кому надрать задницу.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_03");	//(смеется) Конечно. Всегда готов. Просто скажи, что нужно делать.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Горн был готов на все, когда я рассказал ему об острове. Если мне понадобится его топор, я могу взять его с собой.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_15_04");	//Сейчас моя команда почти укомплектована, но я думаю, что тебе тоже могло бы найтись место на борту.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_05");	//Если тебе придется вышвырнуть кого-нибудь из своей команды ради меня - выбери самого слабого.
		AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_12_06");	//В наше суровое время, нельзя разбрасываться людьми, способными крепко держать оружие в руках.
	}
	else
	{
		Info_ClearChoices(dia_gornnw_nach_djg_knowwhereenemy);
		Info_AddChoice(dia_gornnw_nach_djg_knowwhereenemy,"Я дам тебе знать, когда придет время.",dia_gornnw_nach_djg_knowwhereenemy_no);
		Info_AddChoice(dia_gornnw_nach_djg_knowwhereenemy,"Добро пожаловать на борт. Встретимся в гавани.",dia_gornnw_nach_djg_knowwhereenemy_yes);
	};
};

func void dia_gornnw_nach_djg_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_15_00");	//Добро пожаловать на борт. Встретимся в гавани.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_Yes_12_01");	//Корабль? Ха! Могу сказать одно. С тобой никогда не бывает скучно. До скорой встречи.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	GORN_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_gornnw_nach_djg_knowwhereenemy);
};

func void dia_gornnw_nach_djg_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_15_00");	//Я дам тебе знать, когда придет время.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_KnowWhereEnemy_No_12_01");	//Хорошо.
	GORN_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_gornnw_nach_djg_knowwhereenemy);
};


instance DIA_GORNNW_NACH_DJG_LEAVEMYSHIP(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 55;
	condition = dia_gornnw_nach_djg_leavemyship_condition;
	information = dia_gornnw_nach_djg_leavemyship_info;
	permanent = TRUE;
	description = "Возможно, тебе лучше остаться здесь.";
};


func int dia_gornnw_nach_djg_leavemyship_condition()
{
	if((GORN_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_leavemyship_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_LeaveMyShip_15_00");	//Возможно, тебе лучше остаться здесь.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_LeaveMyShip_12_01");	//Ты хочешь, чтобы я отпустил тебя одного? Ммм. Мне нелегко это сделать, но это твоя война. Найди меня, если решишь, что я все же тебе нужен.
	GORN_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GORNNW_NACH_DJG_STILLNEEDYOU(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 55;
	condition = dia_gornnw_nach_djg_stillneedyou_condition;
	information = dia_gornnw_nach_djg_stillneedyou_info;
	permanent = TRUE;
	description = "Возвращайся. ТЫ нужен мне.";
};


func int dia_gornnw_nach_djg_stillneedyou_condition()
{
	if(((GORN_ISONBOARD == LOG_OBSOLETE) || (GORN_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_gornnw_nach_djg_stillneedyou_info()
{
	AI_Output(other,self,"DIA_GornNW_nach_DJG_StillNeedYou_15_00");	//Возвращайся. ТЫ нужен мне.
	AI_Output(self,other,"DIA_GornNW_nach_DJG_StillNeedYou_12_01");	//Наконец-то. А я уж думал, ты оставишь гнить меня здесь, пока будешь развлекаться там. До скорой встречи.
	self.flags = NPC_FLAG_IMMORTAL;
	GORN_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_FIGHTER_NACH_DJG_PICKPOCKET(C_INFO)
{
	npc = pc_fighter_nw_nach_djg;
	nr = 900;
	condition = dia_fighter_nach_djg_pickpocket_condition;
	information = dia_fighter_nach_djg_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_fighter_nach_djg_pickpocket_condition()
{
	return c_beklauen(10,25);
};

func void dia_fighter_nach_djg_pickpocket_info()
{
	Info_ClearChoices(dia_fighter_nach_djg_pickpocket);
	Info_AddChoice(dia_fighter_nach_djg_pickpocket,DIALOG_BACK,dia_fighter_nach_djg_pickpocket_back);
	Info_AddChoice(dia_fighter_nach_djg_pickpocket,DIALOG_PICKPOCKET,dia_fighter_nach_djg_pickpocket_doit);
};

func void dia_fighter_nach_djg_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fighter_nach_djg_pickpocket);
};

func void dia_fighter_nach_djg_pickpocket_back()
{
	Info_ClearChoices(dia_fighter_nach_djg_pickpocket);
};

