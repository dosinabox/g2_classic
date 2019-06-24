
instance DIA_ENGROM_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_exit_condition;
	information = dia_engrom_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_engrom_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_HALLO(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 5;
	condition = dia_engrom_hallo_condition;
	information = dia_engrom_hallo_info;
	description = "Как дела?";
};


func int dia_engrom_hallo_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_engrom_hallo_info()
{
	AI_Output(other,self,"DIA_Engrom_HALLO_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Engrom_HALLO_12_01");	//Паршиво!
	AI_Output(other,self,"DIA_Engrom_HALLO_15_02");	//Ммм!
	AI_Output(self,other,"DIA_Engrom_HALLO_12_03");	//А что еще я могу сказать? Изо дня в день я вижу только эту чертову реку.
	AI_Output(self,other,"DIA_Engrom_HALLO_12_04");	//Орки шныряют на левом берегу, бандиты - на правом, и каждый день я ем только мясо луркеров. Я уже не могу выносить все это!
};


instance DIA_ENGROM_WHATABOUTLEAVING(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 6;
	condition = dia_engrom_whataboutleaving_condition;
	information = dia_engrom_whataboutleaving_info;
	description = "А ты не думал о том, чтобы выбраться отсюда?";
};


func int dia_engrom_whataboutleaving_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_hallo) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_engrom_whataboutleaving_info()
{
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_00");	//А ты не думал о том, чтобы выбраться отсюда?
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_01");	//Да, конечно. С этим нет никаких проблем.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_02");	//Сначала мне нужно прорубить себе дорогу через орды орков, поприветствовать всех остальных монстров, которых там тоже немало, а затем прошмыгнуть через Проход!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_03");	//Что может быть легче!
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_04");	//Я же пришел сюда.
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_05");	//Ты хочешь сказать мне, что ты только что прошел через Проход?
	AI_Output(other,self,"DIA_Engrom_WhatAboutLeaving_15_06");	//Ну, в общем да!
	AI_Output(self,other,"DIA_Engrom_WhatAboutLeaving_12_07");	//Значит, тебе повезло. Пока вокруг творится такой бардак, я с места не сдвинусь.
};


instance DIA_ENGROM_JAGD(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 6;
	condition = dia_engrom_jagd_condition;
	information = dia_engrom_jagd_info;
	permanent = TRUE;
	description = "Как охота?";
};


func int dia_engrom_jagd_condition()
{
	if(Npc_KnowsInfo(other,dia_engrom_hallo) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_engrom_jagd_info()
{
	b_wasmachtjagd();
	AI_Output(self,other,"DIA_Engrom_Jagd_12_01");	//Охота - моя единственная отрада. Но мне бы хотелось хоть иногда видеть нормальную цель, а не этих отвратительных луркеров.
};


instance DIA_ENGROM_KAP3_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap3_exit_condition;
	information = dia_engrom_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_engrom_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_KAP4_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap4_exit_condition;
	information = dia_engrom_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_engrom_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_B_NPCOBSESSEDBYDMT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 32;
	condition = dia_engrom_b_npcobsessedbydmt_condition;
	information = dia_engrom_b_npcobsessedbydmt_info;
	description = "Все в порядке?";
};


func int dia_engrom_b_npcobsessedbydmt_condition()
{
	if((NPCOBSESSEDBYDMT_ENGROM == FALSE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_engrom_b_npcobsessedbydmt_info()
{
	MIS_TABIN_LOOKFORENGROM = LOG_SUCCESS;
	b_npcobsessedbydmt(self);
};


instance DIA_ENGROM_BESSEN(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 55;
	condition = dia_engrom_bessen_condition;
	information = dia_engrom_bessen_info;
	permanent = TRUE;
	description = "Ты одержим Злом.";
};


func int dia_engrom_bessen_condition()
{
	if((NPCOBSESSEDBYDMT_ENGROM == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_engrom_bessen_info()
{
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_00");	//Ты одержим Злом.
	AI_Output(other,self,"DIA_Engrom_BESSEN_15_01");	//Давай, я помогу тебе.
	AI_Output(self,other,"DIA_Engrom_BESSEN_12_02");	//(вопит) Не трогай меня!
	b_npcclearobsessionbydmt(self);
	Npc_SetTarget(self,other);
	self.aivar[AIV_INVINCIBLE] = FALSE;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	AI_StartState(self,zs_flee,0,"");
};


instance DIA_ENGROM_KAP5_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap5_exit_condition;
	information = dia_engrom_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_engrom_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_KAP6_EXIT(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 999;
	condition = dia_engrom_kap6_exit_condition;
	information = dia_engrom_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_engrom_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_engrom_kap6_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_ENGROM_PICKPOCKET(C_INFO)
{
	npc = vlk_4131_engrom;
	nr = 900;
	condition = dia_engrom_pickpocket_condition;
	information = dia_engrom_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_engrom_pickpocket_condition()
{
	return c_beklauen(10,5);
};

func void dia_engrom_pickpocket_info()
{
	Info_ClearChoices(dia_engrom_pickpocket);
	Info_AddChoice(dia_engrom_pickpocket,DIALOG_BACK,dia_engrom_pickpocket_back);
	Info_AddChoice(dia_engrom_pickpocket,DIALOG_PICKPOCKET,dia_engrom_pickpocket_doit);
};

func void dia_engrom_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_engrom_pickpocket);
};

func void dia_engrom_pickpocket_back()
{
	Info_ClearChoices(dia_engrom_pickpocket);
};

