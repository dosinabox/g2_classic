
instance DIA_JOE_EXIT(C_INFO)
{
	npc = vlk_448_joe;
	nr = 999;
	condition = dia_joe_exit_condition;
	information = dia_joe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_joe_exit_condition()
{
	return TRUE;
};

func void dia_joe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JOE_PICKPOCKET(C_INFO)
{
	npc = vlk_448_joe;
	nr = 900;
	condition = dia_joe_pickpocket_condition;
	information = dia_joe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_joe_pickpocket_condition()
{
	return c_beklauen(25,25);
};

func void dia_joe_pickpocket_info()
{
	Info_ClearChoices(dia_joe_pickpocket);
	Info_AddChoice(dia_joe_pickpocket,DIALOG_BACK,dia_joe_pickpocket_back);
	Info_AddChoice(dia_joe_pickpocket,DIALOG_PICKPOCKET,dia_joe_pickpocket_doit);
};

func void dia_joe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_joe_pickpocket);
};

func void dia_joe_pickpocket_back()
{
	Info_ClearChoices(dia_joe_pickpocket);
};


instance DIA_JOE_HALLO(C_INFO)
{
	npc = vlk_448_joe;
	nr = 2;
	condition = dia_joe_hallo_condition;
	information = dia_joe_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_joe_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_joe_hallo_info()
{
	AI_Output(self,other,"DIA_Joe_Hallo_10_00");	//Эй, спасибо, парень. Действительно, огромное спасибо. Я уж думал, мне никогда не выбраться отсюда...
	b_giveplayerxp(XP_AMBIENT * 4);
	AI_Output(other,self,"DIA_Joe_Hallo_15_01");	//Что ты делаешь ЗДЕСЬ?
	AI_Output(self,other,"DIA_Joe_Hallo_10_02");	//Я оказался взаперти. Дверь была открыта, и я хотел просто пошарить там - но как только я зашел внутрь, пришел стражник и запер эту чертову дверь.
	AI_Output(self,other,"DIA_Joe_Hallo_10_03");	//Я попал в дурацкое положение - и был бы очень благодарен, если бы все это осталось между нами.
	AI_Output(other,self,"DIA_Joe_Hallo_15_04");	//Понимаю. Да уж, тут действительно нечем гордиться.
	AI_Output(self,other,"DIA_Joe_Hallo_10_05");	//Я сейчас был бы не прочь что-нибудь выпить.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_JOE_PERM(C_INFO)
{
	npc = vlk_448_joe;
	nr = 2;
	condition = dia_joe_perm_condition;
	information = dia_joe_perm_info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int dia_joe_perm_condition()
{
	if(Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500)
	{
		return TRUE;
	};
};

func void dia_joe_perm_info()
{
	AI_Output(other,self,"DIA_Joe_Perm_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Joe_Perm_10_01");	//Спасибо, что освободил меня.
	AI_StopProcessInfos(self);
};


instance DIA_JOE_SIGN(C_INFO)
{
	npc = vlk_448_joe;
	nr = 2;
	condition = dia_joe_sign_condition;
	information = dia_joe_sign_info;
	permanent = FALSE;
	description = "(показать сигнал воров)";
};


func int dia_joe_sign_condition()
{
	if((Npc_GetDistToWP(self,"NW_CITY_HABOUR_TAVERN01_08") <= 500) && (KNOWS_SECRETSIGN == TRUE))
	{
		return TRUE;
	};
};

func void dia_joe_sign_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Joe_Sign_10_00");	//Эй, привет - у нас есть общие друзья. И я хотел бы выразить свою благодарность за спасение.
	AI_Output(self,other,"DIA_Joe_Sign_10_01");	//Вот, возьми эти отмычки - я уверен, они пригодятся тебе.
	b_giveinvitems(self,other,itke_lockpick,5);
	AI_StopProcessInfos(self);
};

