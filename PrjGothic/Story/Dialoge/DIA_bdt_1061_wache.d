
instance DIA_1061_WACHE_EXIT(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 999;
	condition = dia_1061_wache_exit_condition;
	information = dia_1061_wache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_1061_wache_exit_condition()
{
	return TRUE;
};

func void dia_1061_wache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_1061_WACHE_HALLO(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 1;
	condition = dia_1061_wache_hallo_condition;
	information = dia_1061_wache_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_1061_wache_hallo_condition()
{
	return TRUE;
};

func void dia_1061_wache_hallo_info()
{
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_00");	//Стой! Тебе сюда нельзя.
	AI_Output(other,self,"DIA_1061_Wache_Hallo_15_01");	//Я хочу поговорить с вашим главарем.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_02");	//(иронично) Ох, понимаю, ты хочешь поговорить с моим боссом. Что ж, тогда КОНЕЧНО ЖЕ, я позволю тебе пройти.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_01_03");	//(смертельно серьезно) Но только если ты назовешь его имя. А если нет, мне придется убить тебя! Хорошо?
	Info_ClearChoices(dia_1061_wache_hallo);
	Info_AddChoice(dia_1061_wache_hallo,"Ли.",dia_1061_wache_hallo_lee);
	if(BDT13_DEXTER_VERRATEN == TRUE)
	{
		Info_AddChoice(dia_1061_wache_hallo,"Декстер.",dia_1061_wache_hallo_dexter);
	};
	Info_AddChoice(dia_1061_wache_hallo,"Диего.",dia_1061_wache_hallo_diego);
	Info_AddChoice(dia_1061_wache_hallo,"Понятия не имею.",dia_1061_wache_hallo_ahnung);
};

func void dia_1061_wache_hallo_lee()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Lee_15_00");	//Ли.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Lee_01_01");	//Ну, что тут сказать? Ты только что подписал себе приговор, парень!
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};

func void dia_1061_wache_hallo_dexter()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Dexter_15_00");	//Декстер.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_01");	//Ну... похоже, ты действительно знаешь нашего босса. Хорошо, я позволю тебе пройти. Но предупреждаю тебя.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_02");	//Если ты подойдешь к кому-нибудь слишком близко, ты не выйдешь оттуда живым!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Dexter_01_03");	//Так что вдохни поглубже и держи свой меч в ножнах. Ты найдешь Декстера в доме.
	KNOWS_DEXTER = TRUE;
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
};

func void dia_1061_wache_hallo_diego()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Diego_15_00");	//Диего.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_01");	//Правильно!
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_02");	//Нет, это была шутка. Ты понятия не имеешь, кто наш босс.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Diego_01_03");	//Так что не вижу причин оставлять тебя в живых.
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};

func void dia_1061_wache_hallo_ahnung()
{
	AI_Output(other,self,"DIA_1061_Wache_Hallo_Ahnung_15_00");	//Понятия не имею.
	AI_Output(self,other,"DIA_1061_Wache_Hallo_Ahnung_01_01");	//Тогда ты умрешь в неведении.
	Info_ClearChoices(dia_1061_wache_hallo);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};


instance DIA_1061_WACHE_PERM(C_INFO)
{
	npc = bdt_1061_wache;
	nr = 2;
	condition = dia_1061_wache_perm_condition;
	information = dia_1061_wache_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_1061_wache_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_1061_wache_perm_info()
{
	AI_Output(self,other,"DIA_1061_Wache_Perm_01_00");	//Помни: держи себя в руках, и, может быть, ты уйдешь отсюда живым.
	AI_StopProcessInfos(self);
};

