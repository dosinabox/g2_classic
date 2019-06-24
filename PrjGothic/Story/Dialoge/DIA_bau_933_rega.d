
instance DIA_REGA_EXIT(C_INFO)
{
	npc = bau_933_rega;
	nr = 999;
	condition = dia_rega_exit_condition;
	information = dia_rega_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rega_exit_condition()
{
	return TRUE;
};

func void dia_rega_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_REGA_HALLO(C_INFO)
{
	npc = bau_933_rega;
	nr = 3;
	condition = dia_rega_hallo_condition;
	information = dia_rega_hallo_info;
	description = "Как дела?";
};


func int dia_rega_hallo_condition()
{
	return TRUE;
};

func void dia_rega_hallo_info()
{
	AI_Output(other,self,"DIA_Rega_HALLO_15_00");	//Как дела?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_01");	//Ты из города, да?
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_02");	//Ты один из наемников Онара, да?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_03");	//Ты маг, да?
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_04");	//Ты нездешний, да?
	};
	AI_Output(self,other,"DIA_Rega_HALLO_17_05");	//На твоем месте, я бы убиралась отсюда побыстрее.
	AI_Output(other,self,"DIA_Rega_HALLO_15_06");	//Почему?
	AI_Output(self,other,"DIA_Rega_HALLO_17_07");	//Это место и раньше-то не было раем, но хотя бы мы жили в мире и спокойствии, пока работали на Секоба.
	AI_Output(self,other,"DIA_Rega_HALLO_17_08");	//Но последнее время жить здесь стало просто невыносимо.
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Rega_HALLO_17_09");	//Бандиты повсюду, полевые хищники уничтожают наш урожай, а лендлорд совсем озверел.
	};
};


instance DIA_REGA_ONAR(C_INFO)
{
	npc = bau_933_rega;
	nr = 4;
	condition = dia_rega_onar_condition;
	information = dia_rega_onar_info;
	description = "Ты боишься лендлорда?";
};


func int dia_rega_onar_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_rega_onar_info()
{
	AI_Output(other,self,"DIA_Rega_ONAR_15_00");	//Ты боишься лендлорда?
	AI_Output(self,other,"DIA_Rega_ONAR_17_01");	//Конечно. Если лендлорду кто-то не понравится, он посылает своих наемников, и больше этого человека никто не видит.
	AI_Output(self,other,"DIA_Rega_ONAR_17_02");	//Так что мы предпочитаем помалкивать.
};


instance DIA_REGA_SLD(C_INFO)
{
	npc = bau_933_rega;
	nr = 5;
	condition = dia_rega_sld_condition;
	information = dia_rega_sld_info;
	description = "Разве наемники не должны уничтожать полевых хищников?";
};


func int dia_rega_sld_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_rega_sld_info()
{
	AI_Output(other,self,"DIA_Rega_SLD_15_00");	//Разве наемники не должны уничтожать полевых хищников?
	AI_Output(self,other,"DIA_Rega_SLD_17_01");	//Я не знаю, за что им там платят, но уж точно не за то, чтобы они помогали простым людям.
	AI_Output(self,other,"DIA_Rega_SLD_17_02");	//А проблему с полевыми хищниками мелким фермерам, арендующим у него землю, приходится решать самим.
};


instance DIA_REGA_BANDITEN(C_INFO)
{
	npc = bau_933_rega;
	nr = 6;
	condition = dia_rega_banditen_condition;
	information = dia_rega_banditen_info;
	description = "Как вы защищаетесь от бандитов?";
};


func int dia_rega_banditen_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo))
	{
		return TRUE;
	};
};

func void dia_rega_banditen_info()
{
	AI_Output(other,self,"DIA_Rega_BANDITEN_15_00");	//Как вы защищаетесь от бандитов?
	AI_Output(self,other,"DIA_Rega_BANDITEN_17_01");	//Мы не защищаемся. Мы бежим. А что еще нам остается?
};


instance DIA_REGA_BRONKO(C_INFO)
{
	npc = bau_933_rega;
	nr = 7;
	condition = dia_rega_bronko_condition;
	information = dia_rega_bronko_info;
	description = "(спросить о Бронко)";
};


func int dia_rega_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_bronko_hallo) && (MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_rega_bronko_info()
{
	AI_Output(other,self,"DIA_Rega_BRONKO_15_00");	//А кто этот противный тип вон там?
	AI_Output(self,other,"DIA_Rega_BRONKO_17_01");	//Не пойми меня неправильно, но мне не нужны проблемы. Спроси кого-нибудь еще.
	AI_StopProcessInfos(self);
};


instance DIA_REGA_PERMKAP1(C_INFO)
{
	npc = bau_933_rega;
	nr = 7;
	condition = dia_rega_permkap1_condition;
	information = dia_rega_permkap1_info;
	permanent = TRUE;
	description = "Выше нос.";
};


func int dia_rega_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rega_hallo))
	{
		return TRUE;
	};
};

func void dia_rega_permkap1_info()
{
	AI_Output(other,self,"DIA_Rega_PERMKAP1_15_00");	//Выше нос.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_01");	//Тебе легко говорить. Ты ведь живешь в городе.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_02");	//Если бы вы, наемники, не доставляли нам столько проблем, жизнь здесь была бы не такой уж плохой.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_03");	//Магов вокруг становится все меньше и меньше. Надеюсь, ты не последний из них. Вы нужны нам - и сейчас как никогда.
	}
	else
	{
		AI_Output(self,other,"DIA_Rega_PERMKAP1_17_04");	//Это не так-то легко, работая на этого душегуба Секоба.
	};
	AI_StopProcessInfos(self);
};


instance DIA_REGA_PICKPOCKET(C_INFO)
{
	npc = bau_933_rega;
	nr = 900;
	condition = dia_rega_pickpocket_condition;
	information = dia_rega_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_rega_pickpocket_condition()
{
	return c_beklauen(25,40);
};

func void dia_rega_pickpocket_info()
{
	Info_ClearChoices(dia_rega_pickpocket);
	Info_AddChoice(dia_rega_pickpocket,DIALOG_BACK,dia_rega_pickpocket_back);
	Info_AddChoice(dia_rega_pickpocket,DIALOG_PICKPOCKET,dia_rega_pickpocket_doit);
};

func void dia_rega_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rega_pickpocket);
};

func void dia_rega_pickpocket_back()
{
	Info_ClearChoices(dia_rega_pickpocket);
};

