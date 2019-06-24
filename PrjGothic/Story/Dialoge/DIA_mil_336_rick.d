
instance DIA_RICK_EXIT(C_INFO)
{
	npc = mil_336_rick;
	nr = 999;
	condition = dia_rick_exit_condition;
	information = dia_rick_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rick_exit_condition()
{
	return TRUE;
};

func void dia_rick_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RICK_HALLO(C_INFO)
{
	npc = mil_336_rick;
	nr = 1;
	condition = dia_rick_hallo_condition;
	information = dia_rick_hallo_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_rick_hallo_condition()
{
	return TRUE;
};

func void dia_rick_hallo_info()
{
	AI_Output(other,self,"DIA_Rick_HALLO_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Rick_HALLO_10_01");	//Если тебе хочется поговорить, говори с Румболдом. Я здесь просто на случай, если кто-нибудь вздумает бунтовать.
	AI_StopProcessInfos(self);
};


instance DIA_RICK_PICKPOCKET(C_INFO)
{
	npc = mil_336_rick;
	nr = 900;
	condition = dia_rick_pickpocket_condition;
	information = dia_rick_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rick_pickpocket_condition()
{
	return c_beklauen(10,45);
};

func void dia_rick_pickpocket_info()
{
	Info_ClearChoices(dia_rick_pickpocket);
	Info_AddChoice(dia_rick_pickpocket,DIALOG_BACK,dia_rick_pickpocket_back);
	Info_AddChoice(dia_rick_pickpocket,DIALOG_PICKPOCKET,dia_rick_pickpocket_doit);
};

func void dia_rick_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rick_pickpocket);
};

func void dia_rick_pickpocket_back()
{
	Info_ClearChoices(dia_rick_pickpocket);
};

