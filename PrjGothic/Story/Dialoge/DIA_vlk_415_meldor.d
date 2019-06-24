
instance DIA_MELDOR_EXIT(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 999;
	condition = dia_meldor_exit_condition;
	information = dia_meldor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_meldor_exit_condition()
{
	return TRUE;
};

func void dia_meldor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MELDOR_HALLO(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 1;
	condition = dia_meldor_hallo_condition;
	information = dia_meldor_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_meldor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_meldor_hallo_info()
{
	AI_Output(self,other,"DIA_Meldor_Hallo_07_00");	//Что тебе нужно?
	AI_Output(other,self,"DIA_Meldor_Hallo_15_01");	//Я просто любуюсь окрестностями...
	AI_Output(self,other,"DIA_Meldor_Hallo_07_02");	//А куда именно ты направляешься?
};


instance DIA_MELDOR_INTERESSANTES(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 2;
	condition = dia_meldor_interessantes_condition;
	information = dia_meldor_interessantes_info;
	permanent = FALSE;
	description = "Что здесь интересного?";
};


func int dia_meldor_interessantes_condition()
{
	return TRUE;
};

func void dia_meldor_interessantes_info()
{
	AI_Output(other,self,"DIA_Meldor_Interessantes_15_00");	//Что здесь интересного?
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_01");	//Здесь есть бордель и кабак. Хозяина кабака зовут Кардиф. Если тебе нужна информация, я советую проговорить именно с ним.
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_02");	//Тебе, кстати, не нужны деньги?
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Кардиф, владелец кабака в гавани, приторговывает информацией.");
};


instance DIA_MELDOR_LEHMAR(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 3;
	condition = dia_meldor_lehmar_condition;
	information = dia_meldor_lehmar_info;
	permanent = FALSE;
	description = "А ты даешь их?";
};


func int dia_meldor_lehmar_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_interessantes))
	{
		return TRUE;
	};
};

func void dia_meldor_lehmar_info()
{
	AI_Output(other,self,"DIA_Meldor_Lehmar_15_00");	//А ты даешь их?
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_01");	//(скучая) Нет. Но прямо через улицу находится дом Лемара, ростовщика.
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_02");	//Я уверен, что он сможет одолжить тебе несколько золотых.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_MELDOR_ARBEITEST(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 4;
	condition = dia_meldor_arbeitest_condition;
	information = dia_meldor_arbeitest_info;
	permanent = FALSE;
	description = "Ты работаешь на Лемара?";
};


func int dia_meldor_arbeitest_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_lehmar))
	{
		return TRUE;
	};
};

func void dia_meldor_arbeitest_info()
{
	AI_Output(other,self,"DIA_Meldor_Arbeitest_15_00");	//Ты работаешь на Лемара?
	AI_Output(self,other,"DIA_Meldor_Arbeitest_07_01");	//Умный мальчик.
};


instance DIA_MELDOR_INSOV(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 5;
	condition = dia_meldor_insov_condition;
	information = dia_meldor_insov_info;
	permanent = FALSE;
	description = "Вообще-то я направлялся в верхний квартал...";
};


func int dia_meldor_insov_condition()
{
	return TRUE;
};

func void dia_meldor_insov_info()
{
	AI_Output(other,self,"DIA_Meldor_InsOV_15_00");	//Вообще-то я направлялся в верхний квартал...
	AI_Output(self,other,"DIA_Meldor_InsOV_07_01");	//(саркастично) Да, конечно. А я собирался сесть на корабль и нанести визит королю.
	AI_Output(self,other,"DIA_Meldor_InsOV_07_02");	//Людям вроде тебя и меня доступ в верхний квартал закрыт с тех пор, как в город прибыли паладины.
};


instance DIA_MELDOR_CITIZEN(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 6;
	condition = dia_meldor_citizen_condition;
	information = dia_meldor_citizen_info;
	permanent = FALSE;
	description = "Ты гражданин этого города?";
};


func int dia_meldor_citizen_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_insov))
	{
		return TRUE;
	};
};

func void dia_meldor_citizen_info()
{
	AI_Output(other,self,"DIA_Meldor_Citizen_15_00");	//Ты гражданин этого города?
	AI_Output(self,other,"DIA_Meldor_Citizen_07_01");	//Если ты имеешь в виду, живу ли я здесь, то да. Но меня все равно не пустят в верхний квартал.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_02");	//Туда могут попасть только сливки общества, ну, или торговцы и ремесленники из нижней части города.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_03");	//Жители портового квартала не имеют особого веса в Хоринисе. Сюда даже патрули ополчения почти никогда не заглядывают.
};


instance DIA_MELDOR_SMOKE(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 5;
	condition = dia_meldor_smoke_condition;
	information = dia_meldor_smoke_info;
	permanent = FALSE;
	description = "Ты не знаешь, где мне купить травки?";
};


func int dia_meldor_smoke_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_meldor_smoke_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Meldor_Smoke_15_00");	//Ты не знаешь, где мне купить травки?
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_01");	//(оценивающе) Нет, понятия не имею.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_02");	//На твоем месте, я бы попытал счастья в 'Красном Фонаре'.
	};
};


var int meldor_dgnews;

instance DIA_MELDOR_PERM(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 7;
	condition = dia_meldor_perm_condition;
	information = dia_meldor_perm_info;
	permanent = TRUE;
	description = "Ничего интересного не было?";
};


func int dia_meldor_perm_condition()
{
	return TRUE;
};

func void dia_meldor_perm_info()
{
	AI_Output(other,self,"DIA_Meldor_PERM_15_00");	//Ничего интересного не было последнее время?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_01");	//Недавно, городская стража перевернула вверх дном весть портовый квартал.
		AI_Output(self,other,"DIA_Meldor_PERM_07_02");	//Они искали украденное. Последнее время развелось уж больно много воров. Особенно в зажиточных кварталах.
		AI_Output(self,other,"DIA_Meldor_PERM_07_03");	//Они пытались во всем обвинить бедняков из портового квартала.
	}
	else if((ANDRE_DIEBESGILDE_AUFGERAEUMT == TRUE) && (MELDOR_DGNEWS == FALSE))
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_04");	//Я слышал, в канализации поймали банду воров. Все воры были убиты.
		MELDOR_DGNEWS = TRUE;
	}
	else if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_05");	//Говорят, что в Долине Рудников появились драконы. Интересно, когда паладины уйдут отсюда, чтобы сражаться с драконами.
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_06");	//Предположительно, все драконы мертвы. Кто-то вымел их железной метлой.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_07");	//Нет.
	};
};


instance DIA_MELDOR_VONLEHMAR(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 1;
	condition = dia_meldor_vonlehmar_condition;
	information = dia_meldor_vonlehmar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_meldor_vonlehmar_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0))
	{
		return TRUE;
	};
};

func void dia_meldor_vonlehmar_info()
{
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_00");	//Эй, подожди...
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_01");	//У меня есть для тебя сообщение от Лемара...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_MELDOR_PICKPOCKET(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 900;
	condition = dia_meldor_pickpocket_condition;
	information = dia_meldor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_meldor_pickpocket_condition()
{
	return c_beklauen(34,55);
};

func void dia_meldor_pickpocket_info()
{
	Info_ClearChoices(dia_meldor_pickpocket);
	Info_AddChoice(dia_meldor_pickpocket,DIALOG_BACK,dia_meldor_pickpocket_back);
	Info_AddChoice(dia_meldor_pickpocket,DIALOG_PICKPOCKET,dia_meldor_pickpocket_doit);
};

func void dia_meldor_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_meldor_pickpocket);
};

func void dia_meldor_pickpocket_back()
{
	Info_ClearChoices(dia_meldor_pickpocket);
};

