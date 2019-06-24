
instance DIA_BIFF_NW_EXIT(C_INFO)
{
	npc = djg_713_biff_nw;
	nr = 999;
	condition = dia_biff_nw_exit_condition;
	information = dia_biff_nw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_biff_nw_exit_condition()
{
	return TRUE;
};

func void dia_biff_nw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_NW_HAFEN(C_INFO)
{
	npc = djg_713_biff_nw;
	nr = 5;
	condition = dia_biff_nw_hafen_condition;
	information = dia_biff_nw_hafen_info;
	permanent = TRUE;
	description = "Хорошо. Осталось не долго.";
};


func int dia_biff_nw_hafen_condition()
{
	return TRUE;
};

func void dia_biff_nw_hafen_info()
{
	AI_Output(other,self,"DIA_Biff_NW_HAfen_15_00");	//Хорошо. Осталось не долго.
	AI_Output(self,other,"DIA_Biff_NW_HAfen_07_01");	//Я не могу ждать.
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_NW_PICKPOCKET(C_INFO)
{
	npc = djg_713_biff_nw;
	nr = 900;
	condition = dia_biff_nw_pickpocket_condition;
	information = dia_biff_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_biff_nw_pickpocket_condition()
{
	return c_beklauen(92,250);
};

func void dia_biff_nw_pickpocket_info()
{
	Info_ClearChoices(dia_biff_nw_pickpocket);
	Info_AddChoice(dia_biff_nw_pickpocket,DIALOG_BACK,dia_biff_nw_pickpocket_back);
	Info_AddChoice(dia_biff_nw_pickpocket,DIALOG_PICKPOCKET,dia_biff_nw_pickpocket_doit);
};

func void dia_biff_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_biff_nw_pickpocket);
};

func void dia_biff_nw_pickpocket_back()
{
	Info_ClearChoices(dia_biff_nw_pickpocket);
};

