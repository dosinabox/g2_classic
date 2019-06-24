
instance DIA_WOLF_DI_EXIT(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 999;
	condition = dia_wolf_di_exit_condition;
	information = dia_wolf_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_wolf_di_exit_condition()
{
	return TRUE;
};

func void dia_wolf_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_DI_HALLO(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 4;
	condition = dia_wolf_di_hallo_condition;
	information = dia_wolf_di_hallo_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_wolf_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};


var int dia_wolf_di_hallo_onetime;

func void dia_wolf_di_hallo_info()
{
	AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_00");	//Как дела?
	if((BENNET_ISONBOARD == LOG_SUCCESS) && (Npc_IsDead(bennet_di) == FALSE))
	{
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_01");	//Тебе ОЧЕНЬ нужно было брать с собой Беннета?
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_02");	//В чем проблема?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_03");	//А, ничего. Все в порядке. Делай, что считаешь нужным.
	}
	else if(DIA_WOLF_DI_HALLO_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_04");	//Эта кузница не в самом лучшем состоянии, но я думаю, у меня что-нибудь получится.
		b_giveplayerxp(XP_AMBIENT);
		DIA_WOLF_DI_HALLO_ONETIME = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SmithDI");
	}
	else
	{
		AI_Output(other,self,"DIA_Wolf_DI_HALLO_15_05");	//Ты можешь изготовить для меня доспехи?
		AI_Output(self,other,"DIA_Wolf_DI_HALLO_08_06");	//Извини, приятель. Но не с этими инструментами. Придется подождать, пока мы не прибудем на материк.
	};
};


instance DIA_WOLF_DI_TRAINING(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 10;
	condition = dia_wolf_di_training_condition;
	information = dia_wolf_di_training_info;
	permanent = TRUE;
	description = "Обучи меня стрельбе.";
};


func int dia_wolf_di_training_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_wolf_di_training_info()
{
	AI_Output(other,self,"DIA_Wolf_DI_Training_15_00");	//Обучи меня стрельбе.
	AI_Output(self,other,"DIA_Wolf_DI_Training_08_01");	//Из чего?
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_bow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_1_08_00");	//В отличие от арбалета, лук очень громоздкий и требует много места. Не забывай об этом в бою.
	};
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_bow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_BOW_5_08_00");	//Тетива при стрельбе должна свободно скользить по пальцам. Скрюченный палец испортит траекторию стрелы.
	};
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_crossbow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_1_08_00");	//Постарайся, чтобы при выстреле из арбалета у тебя не дрогнула рука. Вот почему спусковой крючок нужно нажимать очень нежно.
	};
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_crossbow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
		AI_Output(self,other,"DIA_Wolf_DI_Training_CROSSBOW_5_08_00");	//Опытный стрелок всегда учитывает направление ветра и никогда не стреляет против него.
	};
	Info_ClearChoices(dia_wolf_di_training);
	Info_AddChoice(dia_wolf_di_training,DIALOG_BACK,dia_wolf_di_training_back);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_wolf_di_training_bow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_wolf_di_training_bow_5);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_wolf_di_training_crossbow_1);
	Info_AddChoice(dia_wolf_di_training,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_wolf_di_training_crossbow_5);
};

func void dia_wolf_di_training_back()
{
	Info_ClearChoices(dia_wolf_di_training);
};


instance DIA_WOLF_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 2;
	condition = dia_wolf_di_undeaddragondead_condition;
	information = dia_wolf_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int dia_wolf_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_wolf_di_undeaddragondead_onetime;

func void dia_wolf_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_01");	//Конечно. А у тебя? Нелегко тебе пришлось, да?
	if(DIA_WOLF_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_Wolf_DI_UndeadDragonDead_15_02");	//Куда ты теперь?
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_03");	//Куда угодно, только не назад. Я по горло сыт Хоринисом.
		AI_Output(self,other,"DIA_Wolf_DI_UndeadDragonDead_08_04");	//Мне все равно, куда плыть. Лишь бы подальше отсюда.
		DIA_WOLF_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_WOLF_DI_PICKPOCKET(C_INFO)
{
	npc = sld_811_wolf_di;
	nr = 900;
	condition = dia_wolf_di_pickpocket_condition;
	information = dia_wolf_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_wolf_di_pickpocket_condition()
{
	return c_beklauen(32,45);
};

func void dia_wolf_di_pickpocket_info()
{
	Info_ClearChoices(dia_wolf_di_pickpocket);
	Info_AddChoice(dia_wolf_di_pickpocket,DIALOG_BACK,dia_wolf_di_pickpocket_back);
	Info_AddChoice(dia_wolf_di_pickpocket,DIALOG_PICKPOCKET,dia_wolf_di_pickpocket_doit);
};

func void dia_wolf_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_wolf_di_pickpocket);
};

func void dia_wolf_di_pickpocket_back()
{
	Info_ClearChoices(dia_wolf_di_pickpocket);
};

