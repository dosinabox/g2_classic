
instance DIA_LARIUS_EXIT(C_INFO)
{
	npc = vlk_400_larius;
	nr = 999;
	condition = dia_larius_exit_condition;
	information = dia_larius_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_larius_exit_condition()
{
	return TRUE;
};

func void dia_larius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARIUS_HELLO(C_INFO)
{
	npc = vlk_400_larius;
	nr = 1;
	condition = dia_larius_hello_condition;
	information = dia_larius_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_larius_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_larius_hello_info()
{
	AI_Output(self,other,"DIA_Larius_Hello_01_00");	//Что ты делаешь здесь? Если тебе что-то нужно, запишись на прием.
};


instance DIA_LARIUS_WHOAREYOU(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_whoareyou_condition;
	information = dia_larius_whoareyou_info;
	permanent = FALSE;
	description = "Кто ты?";
};


func int dia_larius_whoareyou_condition()
{
	return TRUE;
};

func void dia_larius_whoareyou_info()
{
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_01");	//Я Лариус, губернатор.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_02");	//Даже если я не кажусь тебе таковым в данный момент, я самый влиятельный человек в этом городе.
	AI_Output(other,self,"DIA_Larius_WhoAreYou_15_03");	//То есть ты всем здесь заправляешь?
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_04");	//Я... ну... в настоящий момент мои руки связаны.
	AI_Output(self,other,"DIA_Larius_WhoAreYou_01_05");	//Здесь командует этот лорд Хаген, по крайней мере, пока он в городе.
};


instance DIA_LARIUS_DISTURB(C_INFO)
{
	npc = vlk_400_larius;
	nr = 3;
	condition = dia_larius_disturb_condition;
	information = dia_larius_disturb_info;
	permanent = TRUE;
	description = "Я не хотел помешать.";
};


func int dia_larius_disturb_condition()
{
	return TRUE;
};

func void dia_larius_disturb_info()
{
	AI_Output(other,self,"DIA_Larius_Disturb_15_00");	//Я не хотел помешать.
	AI_Output(self,other,"DIA_Larius_Disturb_01_01");	//Но, тем не менее, помешал! Убирайся!
};


instance DIA_LARIUS_DIELAGE(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_dielage_condition;
	information = dia_larius_dielage_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_larius_dielage_condition()
{
	return TRUE;
};

func void dia_larius_dielage_info()
{
	AI_Output(other,self,"DIA_Larius_DieLage_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Larius_DieLage_01_01");	//Тебе до этого какое дело? Пока паладины здесь, лорд Хаген занимается всеми делами, касающимися жизни города.
};


instance DIA_LARIUS_RICHTERUEBERFALL(C_INFO)
{
	npc = vlk_400_larius;
	nr = 2;
	condition = dia_larius_richterueberfall_condition;
	information = dia_larius_richterueberfall_info;
	description = "Судья нанял бандитов, чтобы они убили тебя.";
};


func int dia_larius_richterueberfall_condition()
{
	if(SCKNOWSRICHTERKOMPROBRIEF == TRUE)
	{
		return TRUE;
	};
};

func void dia_larius_richterueberfall_info()
{
	AI_Output(other,self,"DIA_Larius_Richterueberfall_15_00");	//Судья нанял бандитов, чтобы они убили тебя. Я могу доказать это.
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_01");	//Не пори чепухи, или ты хочешь, чтобы я заковал тебя в кандалы?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_02");	//Даже сели ты воин Инноса...
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Larius_Richterueberfall_01_03");	//Даже если ты посвященный маг...
	};
	AI_Output(self,other,"DIA_Larius_Richterueberfall_01_04");	//Мое слово все еще имеет вес в этом городе. Не смей даже пытаться запятнать светлое имя нашего судьи!
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_LARIUS_PICKPOCKET(C_INFO)
{
	npc = vlk_400_larius;
	nr = 900;
	condition = dia_larius_pickpocket_condition;
	information = dia_larius_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_larius_pickpocket_condition()
{
	return c_beklauen(35,120);
};

func void dia_larius_pickpocket_info()
{
	Info_ClearChoices(dia_larius_pickpocket);
	Info_AddChoice(dia_larius_pickpocket,DIALOG_BACK,dia_larius_pickpocket_back);
	Info_AddChoice(dia_larius_pickpocket,DIALOG_PICKPOCKET,dia_larius_pickpocket_doit);
};

func void dia_larius_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_larius_pickpocket);
};

func void dia_larius_pickpocket_back()
{
	Info_ClearChoices(dia_larius_pickpocket);
};

