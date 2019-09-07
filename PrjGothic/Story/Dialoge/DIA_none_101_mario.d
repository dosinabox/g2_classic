
instance DIA_NONE_101_MARIO_EXIT(C_INFO)
{
	npc = none_101_mario;
	nr = 999;
	condition = dia_none_101_mario_exit_condition;
	information = dia_none_101_mario_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_none_101_mario_exit_condition()
{
	return TRUE;
};

func void dia_none_101_mario_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NONE_101_MARIO_JOB(C_INFO)
{
	npc = none_101_mario;
	nr = 4;
	condition = dia_none_101_mario_job_condition;
	information = dia_none_101_mario_job_info;
	permanent = TRUE;
	description = "Что ты делаешь здесь?";
};


func int dia_none_101_mario_job_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE) && (Npc_KnowsInfo(other,dia_none_101_mario_youneedme) == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_job_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Job_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_01");	//Надеюсь, скоро придет какой-нибудь корабль, и я наймусь на него.
	AI_Output(self,other,"DIA_None_101_Mario_Job_07_02");	//Это шатание без дела уже действует мне на нервы.
};


instance DIA_NONE_101_MARIO_YOUNEEDME(C_INFO)
{
	npc = none_101_mario;
	nr = 4;
	condition = dia_none_101_mario_youneedme_condition;
	information = dia_none_101_mario_youneedme_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_none_101_mario_youneedme_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_youneedme_info()
{
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_00");	//Я слышал, что ты набираешь команду на свой корабль?
	AI_Output(other,self,"DIA_None_101_Mario_YouNeedMe_15_01");	//И?
	AI_Output(self,other,"DIA_None_101_Mario_YouNeedMe_07_02");	//Я готов!
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Марио бывший моряк, заговорил со мной в портовой таверне. Он хочет плыть на корабле.");
};


instance DIA_NONE_101_MARIO_WHYNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 5;
	condition = dia_none_101_mario_whyneedyou_condition;
	information = dia_none_101_mario_whyneedyou_info;
	permanent = FALSE;
	description = "Почему я должен брать тебя?";
};


func int dia_none_101_mario_whyneedyou_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_whyneedyou_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyNeedYou_15_00");	//Почему я должен брать тебя?
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_01");	//Это просто. Потому что я нужен тебе.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_02");	//Я... я был лейтенантом в королевском флоте.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_03");	//Я служил моряком на 'Короле Робаре' и 'Гордости Миртаны'.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_04");	//В битве у восточного архипелага я собственноручно отправил пару десятков орков назад в царство Белиара.
	AI_Output(self,other,"DIA_None_101_Mario_WhyNeedYou_07_05");	//К сожалению, нас осталось слишком мало, когда наш флагман затонул и нам пришлось отступить.
};


instance DIA_NONE_101_MARIO_WHYHERE(C_INFO)
{
	npc = none_101_mario;
	nr = 7;
	condition = dia_none_101_mario_whyhere_condition;
	information = dia_none_101_mario_whyhere_info;
	permanent = FALSE;
	description = "А что ты делаешь здесь?";
};


func int dia_none_101_mario_whyhere_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_whyneedyou) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_whyhere_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_WhyHere_15_00");	//А что ты делаешь здесь?
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_01");	//Флоту пришлось бежать, и мы лишились жалования.
	AI_Output(self,other,"DIA_None_101_Mario_WhyHere_07_02");	//После моего списания на берег я застрял в этой дыре, и вот теперь ищу новое судно.
};


instance DIA_NONE_101_MARIO_ABILITIES(C_INFO)
{
	npc = none_101_mario;
	nr = 8;
	condition = dia_none_101_mario_abilities_condition;
	information = dia_none_101_mario_abilities_info;
	permanent = FALSE;
	description = "Что ты можешь делать?";
};


func int dia_none_101_mario_abilities_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_whyneedyou) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_abilities_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_Abilities_15_00");	//Что ты можешь делать?
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_01");	//Я обучен абордажу и ближнему бою, к тому же я метко стреляю из корабельной пушки.
	AI_Output(self,other,"DIA_None_101_Mario_Abilities_07_02");	//Я уверен, что я смогу обучить тебя чему-нибудь во время путешествия.
	b_logentry(TOPIC_CREW,"Марио, похоже, собаку съел в том, что касается морских боев. Возможно, он сможет научить меня кое-чему.");
};


instance DIA_NONE_101_MARIO_YOURPRICE(C_INFO)
{
	npc = none_101_mario;
	nr = 9;
	condition = dia_none_101_mario_yourprice_condition;
	information = dia_none_101_mario_yourprice_info;
	permanent = FALSE;
	description = "Что ты за это хочешь?";
};


func int dia_none_101_mario_yourprice_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_yourprice_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_YourPrice_15_00");	//Что ты за это хочешь?
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_01");	//Что я хочу? Да я буду рад просто убраться отсюда.
	AI_Output(self,other,"DIA_None_101_Mario_YourPrice_07_02");	//Я помогу тебе, а ты поможешь мне выбраться из этой дыры.
};


instance DIA_NONE_101_MARIO_COULDBEDANGEROUS(C_INFO)
{
	npc = none_101_mario;
	nr = 10;
	condition = dia_none_101_mario_couldbedangerous_condition;
	information = dia_none_101_mario_couldbedangerous_info;
	permanent = FALSE;
	description = "Путешествие может быть опасным.";
};


func int dia_none_101_mario_couldbedangerous_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_yourprice) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_couldbedangerous_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_CouldBeDangerous_15_00");	//Путешествие может быть опасным.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_01");	//Я привык к опасности. Когда ты вдали от дома, каждый день для тебя полон опасностей.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_02");	//Любой шторм может стать для тебя последним, а монстры с глубин могут проглотить твой корабль целиком.
	AI_Output(self,other,"DIA_None_101_Mario_CouldBeDangerous_07_03");	//Не говоря уже о галерах орков. Поверь мне, я ничего не боюсь. Матрос, который боится, обречен на гибель.
};


instance DIA_NONE_101_MARIO_DONTNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 13;
	condition = dia_none_101_mario_dontneedyou_condition;
	information = dia_none_101_mario_dontneedyou_info;
	permanent = FALSE;
	description = "Ты не нужен мне.";
};


func int dia_none_101_mario_dontneedyou_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_dontneedyou_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_DontNeedYou_15_00");	//Ты не нужен мне.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_01");	//Я лучший матрос, которого можно найти здесь.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_02");	//Мне кажется, ты не очень-то разбираешься в навигации.
	AI_Output(self,other,"DIA_None_101_Mario_DontNeedYou_07_03");	//Так что дважды подумай, прежде чем доверяться кому-нибудь.
};


instance DIA_NONE_101_MARIO_NEEDGOODMEN(C_INFO)
{
	npc = none_101_mario;
	nr = 2;
	condition = dia_none_101_mario_needgoodmen_condition;
	information = dia_none_101_mario_needgoodmen_info;
	permanent = FALSE;
	description = "Я всегда найду место для хороших людей.";
};


func int dia_none_101_mario_needgoodmen_condition()
{
	if(Npc_KnowsInfo(other,dia_none_101_mario_youneedme) && (MARIO_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_none_101_mario_needgoodmen_info()
{
	AI_Output(other,self,"DIA_None_101_Mario_NeedGoodMen_15_00");	//Я всегда найду место для хороших людей.
	AI_Output(self,other,"DIA_None_101_Mario_NeedGoodMen_07_01");	//Конечно, увидимся на корабле.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	MARIO_ISONBOARD = LOG_SUCCESS;
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


instance DIA_MARIO_LEAVEMYSHIP(C_INFO)
{
	npc = none_101_mario;
	nr = 11;
	condition = dia_mario_leavemyship_condition;
	information = dia_mario_leavemyship_info;
	permanent = TRUE;
	description = "Я все-таки не могу взять тебя с собой!";
};


func int dia_mario_leavemyship_condition()
{
	if((MARIO_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_mario_leavemyship_info()
{
	AI_Output(other,self,"DIA_Mario_LeaveMyShip_15_00");	//Я понял, что ты мне не нужен!
	AI_Output(self,other,"DIA_Mario_LeaveMyShip_07_01");	//Как скажешь. Ты знаешь, где искать меня!
	MARIO_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MARIO_STILLNEEDYOU(C_INFO)
{
	npc = none_101_mario;
	nr = 11;
	condition = dia_mario_stillneedyou_condition;
	information = dia_mario_stillneedyou_info;
	permanent = TRUE;
	description = "Ты мне все-таки нужен!";
};


func int dia_mario_stillneedyou_condition()
{
	if(((MARIO_ISONBOARD == LOG_OBSOLETE) || (MARIO_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_mario_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Mario_StillNeedYou_15_00");	//Ты мне все-таки нужен!
	if(MARIO_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_01");	//Я знал! Увидимся на корабле!
		MARIO_ISONBOARD = LOG_SUCCESS;
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
	}
	else
	{
		AI_Output(self,other,"DIA_Mario_StillNeedYou_07_02");	//Ты не смеешь так обращаться со мной. Плевать я на тебя хотел!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};


instance DIA_MARIO_PICKPOCKET(C_INFO)
{
	npc = none_101_mario;
	nr = 900;
	condition = dia_mario_pickpocket_condition;
	information = dia_mario_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_mario_pickpocket_condition()
{
	return c_beklauen(71,220);
};

func void dia_mario_pickpocket_info()
{
	Info_ClearChoices(dia_mario_pickpocket);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_BACK,dia_mario_pickpocket_back);
	Info_AddChoice(dia_mario_pickpocket,DIALOG_PICKPOCKET,dia_mario_pickpocket_doit);
};

func void dia_mario_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mario_pickpocket);
};

func void dia_mario_pickpocket_back()
{
	Info_ClearChoices(dia_mario_pickpocket);
};

