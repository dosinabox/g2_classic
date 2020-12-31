
instance DIA_RUGA_EXIT(C_INFO)
{
	npc = mil_317_ruga;
	nr = 999;
	condition = dia_ruga_exit_condition;
	information = dia_ruga_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ruga_exit_condition()
{
	return TRUE;
};

func void dia_ruga_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUGA_PICKPOCKET(C_INFO)
{
	npc = mil_317_ruga;
	nr = 900;
	condition = dia_ruga_pickpocket_condition;
	information = dia_ruga_pickpocket_info;
	permanent = TRUE;
	description = "(украсть этот ключ будет легко)";
};


func int dia_ruga_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_03) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_ruga_pickpocket_info()
{
	Info_ClearChoices(dia_ruga_pickpocket);
	Info_AddChoice(dia_ruga_pickpocket,DIALOG_BACK,dia_ruga_pickpocket_back);
	Info_AddChoice(dia_ruga_pickpocket,DIALOG_PICKPOCKET,dia_ruga_pickpocket_doit);
};

func void dia_ruga_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itke_city_tower_03,1);
		b_givethiefxp();
		Info_ClearChoices(dia_ruga_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_ruga_pickpocket_back()
{
	Info_ClearChoices(dia_ruga_pickpocket);
};


instance DIA_RUGA_HALLO(C_INFO)
{
	npc = mil_317_ruga;
	nr = 2;
	condition = dia_ruga_hallo_condition;
	information = dia_ruga_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ruga_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ruga_hallo_info()
{
	AI_Output(other,self,"DIA_Ruga_Hallo_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Ruga_Hallo_11_01");	//Я обучаю парней стрельбе из арбалета и помогаю им стать более ловкими.
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Руга, городской гвардеец, может помочь мне повысить мою ловкость и научить меня пользоваться арбалетом. Но для этого я должен служить королю.");
};


instance DIA_RUGA_TRAIN(C_INFO)
{
	npc = mil_317_ruga;
	nr = 5;
	condition = dia_ruga_train_condition;
	information = dia_ruga_train_info;
	permanent = TRUE;
	description = "Ты не мог бы потренировать меня?";
};


func int dia_ruga_train_condition()
{
	if((RUGA_TEACHCROSSBOW == FALSE) && (other.hitchance[NPC_TALENT_CROSSBOW] < 60))
	{
		return TRUE;
	};
};

func void dia_ruga_train_info()
{
	AI_Output(other,self,"DIA_Ruga_Train_15_00");	//Ты можешь потренировать меня?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Ruga_Train_11_01");	//Конечно. Если у тебя достаточно опыта, я готов помочь тебе.
		AI_Output(self,other,"DIA_Ruga_Train_11_02");	//Но нужно понимать, что ловкость и стрельба неотделимы друг от друга, как арбалет и стрела. Одно...
		AI_Output(other,self,"DIA_Ruga_Train_15_03");	//... ничего не стоит без другого. Я понял.
		RUGA_TEACHCROSSBOW = TRUE;
		RUGA_TEACHDEX = TRUE;
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Ruga_Train_11_04");	//Убирайся с глаз моих, (презрительно) наемник.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Ruga_Train_11_05");	//Нет. Я тренирую только людей, состоящих на службе у короля. Больше никого.
		AI_Output(self,other,"DIA_Ruga_Train_11_06");	//Но нам всегда нужны хорошие люди. Так что, если хочешь поступить в ополчение, поговори с лордом Андрэ.
	};
};


instance DIA_RUGA_TEACH(C_INFO)
{
	npc = mil_317_ruga;
	nr = 100;
	condition = dia_ruga_teach_condition;
	information = dia_ruga_teach_info;
	permanent = TRUE;
	description = "Покажи мне, как стрелять из арбалета.";
};


var int dia_ruga_teach_permanent;

func int dia_ruga_teach_condition()
{
	if((RUGA_TEACHCROSSBOW == TRUE) && (DIA_RUGA_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ruga_teach_info()
{
	AI_Output(other,self,"DIA_Ruga_Teach_15_00");	//Покажи мне, как стрелять из арбалета.
	Info_ClearChoices(dia_ruga_teach);
	Info_AddChoice(dia_ruga_teach,DIALOG_BACK,dia_ruga_teach_back);
	Info_AddChoice(dia_ruga_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_ruga_teach_1h_1);
	Info_AddChoice(dia_ruga_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_ruga_teach_1h_5);
};

func void dia_ruga_teach_back()
{
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 60)
	{
		AI_Output(self,other,"DIA_Ruga_Teach_11_00");	//Мне больше нечему учить тебя. Тебе лучше поискать другого учителя.
		DIA_RUGA_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_ruga_teach);
};

func void dia_ruga_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,60);
	Info_ClearChoices(dia_ruga_teach);
	Info_AddChoice(dia_ruga_teach,DIALOG_BACK,dia_ruga_teach_back);
	Info_AddChoice(dia_ruga_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_ruga_teach_1h_1);
	Info_AddChoice(dia_ruga_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_ruga_teach_1h_5);
};

func void dia_ruga_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,60);
	Info_ClearChoices(dia_ruga_teach);
	Info_AddChoice(dia_ruga_teach,DIALOG_BACK,dia_ruga_teach_back);
	Info_AddChoice(dia_ruga_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_ruga_teach_1h_1);
	Info_AddChoice(dia_ruga_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_ruga_teach_1h_5);
};


instance DIA_RUGA_TEACHDEX(C_INFO)
{
	npc = mil_317_ruga;
	nr = 101;
	condition = dia_ruga_teachdex_condition;
	information = dia_ruga_teachdex_info;
	permanent = TRUE;
	description = "Я хочу стать более ловким.";
};


var int dia_ruga_teachdex_permanent;

func int dia_ruga_teachdex_condition()
{
	if((RUGA_TEACHDEX == TRUE) && (DIA_RUGA_TEACHDEX_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ruga_teachdex_info()
{
	AI_Output(other,self,"DIA_Ruga_TEACHDEX_15_00");	//Я хочу стать более ловким.
	Info_ClearChoices(dia_ruga_teachdex);
	Info_AddChoice(dia_ruga_teachdex,DIALOG_BACK,dia_ruga_teachdex_back);
	Info_AddChoice(dia_ruga_teachdex,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ruga_teachdex_1);
	Info_AddChoice(dia_ruga_teachdex,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ruga_teachdex_5);
};

func void dia_ruga_teachdex_back()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		AI_Output(self,other,"DIA_Ruga_TEACHDEX_11_00");	//Это все, чему я мог обучить тебя. Если ты хочешь стать еще более ловким, тебе лучше поискать другого учителя.
		DIA_RUGA_TEACHDEX_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_ruga_teachdex);
};

func void dia_ruga_teachdex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,60);
	Info_ClearChoices(dia_ruga_teachdex);
	Info_AddChoice(dia_ruga_teachdex,DIALOG_BACK,dia_ruga_teachdex_back);
	Info_AddChoice(dia_ruga_teachdex,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ruga_teachdex_1);
	Info_AddChoice(dia_ruga_teachdex,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ruga_teachdex_5);
};

func void dia_ruga_teachdex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,60);
	Info_ClearChoices(dia_ruga_teachdex);
	Info_AddChoice(dia_ruga_teachdex,DIALOG_BACK,dia_ruga_teachdex_back);
	Info_AddChoice(dia_ruga_teachdex,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ruga_teachdex_1);
	Info_AddChoice(dia_ruga_teachdex,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ruga_teachdex_5);
};

