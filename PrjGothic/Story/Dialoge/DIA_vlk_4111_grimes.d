
instance DIA_GRIMES_EXIT(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 999;
	condition = dia_grimes_exit_condition;
	information = dia_grimes_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


var int grimes_first;

func int dia_grimes_exit_condition()
{
	return TRUE;
};

func void dia_grimes_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRIMES_HALLO(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_hallo_condition;
	information = dia_grimes_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_grimes_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_grimes_hallo_info()
{
	AI_Output(self,other,"DIA_Grimes_Hallo_05_00");	//Ты? Кто бы мог подумать, что мы опять свидимся!
	AI_Output(self,other,"DIA_Grimes_Hallo_05_01");	//Похоже, мы оба умеем выживать, но, как видишь, я застрял в этой шахте.
	if(GRIMES_FIRST == FALSE)
	{
		Wld_InsertNpc(snapper,"OW_PATH_148_A");
		Wld_InsertNpc(snapper,"OW_PATH_146");
		Wld_InsertNpc(snapper,"OW_PATH_147");
		Wld_InsertNpc(snapper,"OW_PATH_148");
		Wld_InsertNpc(snapper,"OW_PATH_264");
		GRIMES_FIRST = TRUE;
	};
};


instance DIA_GRIMES_ERZ(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_erz_condition;
	information = dia_grimes_erz_info;
	permanent = FALSE;
	description = "Сколько руды вам удалось добыть?";
};


func int dia_grimes_erz_condition()
{
	if((KAPITEL == 2) && (MIS_SCOUTMINE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_grimes_erz_info()
{
	AI_Output(other,self,"DIA_Grimes_Erz_15_00");	//Сколько руды вам удалось добыть?
	AI_Output(self,other,"DIA_Grimes_Erz_05_01");	//Несколько ящиков. Но их здесь уже нет.
	AI_Output(self,other,"DIA_Grimes_Erz_05_02");	//Паладин Маркос решил отправить руду в замок, так как нас все время атаковали орки.
};


instance DIA_GRIMES_WEG(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 3;
	condition = dia_grimes_weg_condition;
	information = dia_grimes_weg_info;
	permanent = FALSE;
	description = "Ты знаешь, в каком направлении пошел Маркос?";
};


func int dia_grimes_weg_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_erz) && (Npc_KnowsInfo(other,dia_marcos_garond) == FALSE))
	{
		return TRUE;
	};
};

func void dia_grimes_weg_info()
{
	AI_Output(other,self,"DIA_Grimes_Weg_15_00");	//Ты знаешь, в каком направлении пошел Маркос?
	AI_Output(self,other,"DIA_Grimes_Weg_05_01");	//Он не пошел прямой дорогой. Вместо этого он хотел пересечь реку там, где она замерзла.
	AI_Output(self,other,"DIA_Grimes_Weg_05_02");	//Он хотел пойти в обход и подойти к замку с запада.
};


instance DIA_GRIMES_GRIMES(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_grimes_condition;
	information = dia_grimes_grimes_info;
	permanent = FALSE;
	description = "Ты хочешь покинуть Долину?";
};


func int dia_grimes_grimes_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_grimes_grimes_info()
{
	AI_Output(other,self,"DIA_Grimes_Grimes_15_00");	//Ты хочешь покинуть Долину?
	AI_Output(self,other,"DIA_Grimes_Grimes_05_01");	//Нет, я лучше продолжу добывать руду.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_02");	//Я не позволю каким-то оркам остановить меня - я и не такое видал.
	AI_Output(self,other,"DIA_Grimes_Grimes_05_03");	//Как тогда, когда мы работали в старой шахте и неожиданно прорвалась вода...
	AI_Output(self,other,"DIA_Grimes_Grimes_05_04");	//Но это старая история.
};


instance DIA_GRIMES_PERM(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 2;
	condition = dia_grimes_perm_condition;
	information = dia_grimes_perm_info;
	permanent = TRUE;
	description = "Как твоя работа?";
};


func int dia_grimes_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_grimes_perm_info()
{
	AI_Output(other,self,"DIA_Grimes_PERM_15_00");	//Как твоя работа?
	AI_Output(self,other,"DIA_Grimes_PERM_05_01");	//Эта скала ужасно твердая - она как будто не хочет отдавать нам руду.
};


instance DIA_GRIMES_PICKPOCKET(C_INFO)
{
	npc = vlk_4111_grimes;
	nr = 900;
	condition = dia_grimes_pickpocket_condition;
	information = dia_grimes_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_grimes_pickpocket_condition()
{
	return c_beklauen(43,21);
};

func void dia_grimes_pickpocket_info()
{
	Info_ClearChoices(dia_grimes_pickpocket);
	Info_AddChoice(dia_grimes_pickpocket,DIALOG_BACK,dia_grimes_pickpocket_back);
	Info_AddChoice(dia_grimes_pickpocket,DIALOG_PICKPOCKET,dia_grimes_pickpocket_doit);
};

func void dia_grimes_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_grimes_pickpocket);
};

func void dia_grimes_pickpocket_back()
{
	Info_ClearChoices(dia_grimes_pickpocket);
};

