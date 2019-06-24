
instance DIA_MIL_309_STADTWACHE_EXIT(C_INFO)
{
	npc = mil_309_stadtwache;
	nr = 999;
	condition = dia_mil_309_stadtwache_exit_condition;
	information = dia_mil_309_stadtwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_309_stadtwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_309_stadtwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_309_STADTWACHE_HALLO(C_INFO)
{
	npc = mil_309_stadtwache;
	nr = 2;
	condition = dia_mil_309_stadtwache_hallo_condition;
	information = dia_mil_309_stadtwache_hallo_info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int dia_mil_309_stadtwache_hallo_condition()
{
	return TRUE;
};

func void dia_mil_309_stadtwache_hallo_info()
{
	AI_Output(other,self,"DIA_Mil_309_Stadtwache_Hallo_15_00");	//В чем дело?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_01");	//Все в порядке. Но мы должны быть настороже.
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIL_309_NEWS < 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_02");	//Послушай. Мы не можем пропустить тебя в город.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_03");	//Но я дам тебе совет, и совершенно бесплатно.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_04");	//Держись подальше от этого леса впереди - там бродят полчища ужасных монстров.
		MIL_309_NEWS = 1;
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIL_309_NEWS == 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_05");	//Возвращайся туда, откуда выполз, подонок!
	};
	if((stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIL_309_NEWS < 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_06");	//Послушай, ты имеешь право находиться в городе. Но это не означает, что ты можешь делать здесь все, что тебе заблагорассудится.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_07");	//Если ты не придерживаешься общепринятых правил, ты потеряешь свои права здесь!
		MIL_309_NEWS = 2;
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIL_309_NEWS == 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_08");	//Давай - проходи!
	};
	AI_StopProcessInfos(self);
};

