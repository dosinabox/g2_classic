
instance DIA_VANJA_EXIT(C_INFO)
{
	npc = vlk_491_vanja;
	nr = 999;
	condition = dia_vanja_exit_condition;
	information = dia_vanja_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vanja_exit_condition()
{
	return TRUE;
};

func void dia_vanja_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VANJA_PICKPOCKET(C_INFO)
{
	npc = vlk_491_vanja;
	nr = 900;
	condition = dia_vanja_pickpocket_condition;
	information = dia_vanja_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20_FEMALE;
};


func int dia_vanja_pickpocket_condition()
{
	return c_beklauen(20,10);
};

func void dia_vanja_pickpocket_info()
{
	Info_ClearChoices(dia_vanja_pickpocket);
	Info_AddChoice(dia_vanja_pickpocket,DIALOG_BACK,dia_vanja_pickpocket_back);
	Info_AddChoice(dia_vanja_pickpocket,DIALOG_PICKPOCKET,dia_vanja_pickpocket_doit);
};

func void dia_vanja_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_vanja_pickpocket);
};

func void dia_vanja_pickpocket_back()
{
	Info_ClearChoices(dia_vanja_pickpocket);
};


instance DIA_VANJA_STANDARD(C_INFO)
{
	npc = vlk_491_vanja;
	condition = dia_vanja_standard_condition;
	information = dia_vanja_standard_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_vanja_standard_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_ANDRE_REDLIGHT != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_vanja_standard_info()
{
	AI_Output(self,other,"DIA_Vanja_STANDARD_17_00");	//Я занята.
	AI_StopProcessInfos(self);
};


instance DIA_VANJA_DOPE(C_INFO)
{
	npc = vlk_491_vanja;
	nr = 3;
	condition = dia_vanja_dope_condition;
	information = dia_vanja_dope_info;
	permanent = FALSE;
	description = "Где здесь можно купить травки?";
};


func int dia_vanja_dope_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KNOWS_BORKA_DEALER == FALSE))
	{
		return TRUE;
	};
};

func void dia_vanja_dope_info()
{
	AI_Output(other,self,"DIA_Vanja_DOPE_15_00");	//Где здесь можно купить травки?
	AI_Output(self,other,"DIA_Vanja_DOPE_17_01");	//Понятия не имею. Лучше не связывайся с этой дрянью.
	AI_Output(self,other,"DIA_Vanja_DOPE_17_02");	//К тому же, если ты будешь продолжать расспрашивать о ней, у тебя могут быть большие проблемы...
};

