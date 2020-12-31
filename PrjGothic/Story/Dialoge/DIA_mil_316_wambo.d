
instance DIA_WAMBO_EXIT(C_INFO)
{
	npc = mil_316_wambo;
	nr = 999;
	condition = dia_wambo_exit_condition;
	information = dia_wambo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wambo_exit_condition()
{
	return TRUE;
};

func void dia_wambo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WAMBO_PICKPOCKET(C_INFO)
{
	npc = mil_316_wambo;
	nr = 900;
	condition = dia_wambo_pickpocket_condition;
	information = dia_wambo_pickpocket_info;
	permanent = TRUE;
	description = "(воровать этот ключ рискованно)";
};


func int dia_wambo_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_04) >= 1) && (other.attribute[ATR_DEXTERITY] >= 40))
	{
		return TRUE;
	};
};

func void dia_wambo_pickpocket_info()
{
	Info_ClearChoices(dia_wambo_pickpocket);
	Info_AddChoice(dia_wambo_pickpocket,DIALOG_BACK,dia_wambo_pickpocket_back);
	Info_AddChoice(dia_wambo_pickpocket,DIALOG_PICKPOCKET,dia_wambo_pickpocket_doit);
};

func void dia_wambo_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 50)
	{
		b_giveinvitems(self,other,itke_city_tower_04,1);
		b_givethiefxp();
		Info_ClearChoices(dia_wambo_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_wambo_pickpocket_back()
{
	Info_ClearChoices(dia_wambo_pickpocket);
};


instance DIA_WAMBO_JOB(C_INFO)
{
	npc = mil_316_wambo;
	nr = 5;
	condition = dia_wambo_job_condition;
	information = dia_wambo_job_info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int dia_wambo_job_condition()
{
	return TRUE;
};

func void dia_wambo_job_info()
{
	AI_Output(other,self,"DIA_Wambo_Job_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Wambo_Job_03_01");	//Я слежу за тем, чтобы никто не входил в дома.
	AI_Output(self,other,"DIA_Wambo_Job_03_02");	//Лорд Хаген лично отдал этот приказ. И даже не думай нарушить его!
};


instance DIA_WAMBO_SITUATION(C_INFO)
{
	npc = mil_316_wambo;
	nr = 10;
	condition = dia_wambo_situation_condition;
	information = dia_wambo_situation_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_wambo_situation_condition()
{
	if(Npc_KnowsInfo(other,dia_wambo_job))
	{
		return TRUE;
	};
};

func void dia_wambo_situation_info()
{
	AI_Output(other,self,"DIA_Wambo_Situation_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Wambo_Situation_03_01");	//Сейчас все спокойно.
};


instance DIA_WAMBO_RAMIREZ(C_INFO)
{
	npc = mil_316_wambo;
	nr = 5;
	condition = dia_wambo_ramirez_condition;
	information = dia_wambo_ramirez_info;
	permanent = FALSE;
	description = "Я пришел от нашего общего друга, Рамиреза.";
};


func int dia_wambo_ramirez_condition()
{
	if(Npc_KnowsInfo(other,dia_ramirez_viertel))
	{
		return TRUE;
	};
};

func void dia_wambo_ramirez_info()
{
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_00");	//Я пришел от нашего общего друга, Рамиреза.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_01");	//Ох? Этот Рамирез тот еще подлец. И он мне не друг. Да, ладно. Ты принес мне что-нибудь?
	AI_Output(other,self,"DIA_Wambo_Ramirez_15_02");	//Это зависит от того, что ты хочешь.
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_03");	//(тихо) Хорошо, поступим так: ты платишь мне 250 золотых монет. И меня не будет здесь всю ночь.
	AI_Output(self,other,"DIA_Wambo_Ramirez_03_04");	//И, если ты уж такой подозрительный, давай договоримся так: если я появлюсь здесь, то нашу сделку можно будет считать расторгнутой.
};


instance DIA_WAMBO_DEAL(C_INFO)
{
	npc = mil_316_wambo;
	nr = 5;
	condition = dia_wambo_deal_condition;
	information = dia_wambo_deal_info;
	permanent = TRUE;
	description = "(заплатить 250 золота)";
};


var int dia_wambo_deal_permanent;

func int dia_wambo_deal_condition()
{
	if(Npc_KnowsInfo(other,dia_wambo_ramirez) && (DIA_WAMBO_DEAL_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_wambo_deal_info()
{
	AI_Output(other,self,"DIA_Wambo_Deal_15_00");	//У меня есть деньги...
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Wambo_Deal_03_01");	//Хорошо, тогда я исчезаю на всю ночь.
		AI_Output(self,other,"DIA_Wambo_Deal_03_02");	//И помни: если у тебя возникнут проблемы, я не знаю тебя.
		DIA_WAMBO_DEAL_PERMANENT = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"DRINK");
	}
	else
	{
		AI_Output(other,self,"DIA_Wambo_Deal_15_03");	//...но с собой их не захватил.
		AI_Output(self,other,"DIA_Wambo_Deal_03_04");	//Я не выношу, когда кто-нибудь пытается одурачить меня. Так что давай сюда золото.
		AI_StopProcessInfos(self);
	};
};

