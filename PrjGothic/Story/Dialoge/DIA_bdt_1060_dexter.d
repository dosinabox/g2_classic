
instance DIA_DEXTER_EXIT(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 999;
	condition = dia_dexter_exit_condition;
	information = dia_dexter_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dexter_exit_condition()
{
	return TRUE;
};

func void dia_dexter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_HALLO(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 1;
	condition = dia_dexter_hallo_condition;
	information = dia_dexter_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_hallo_condition()
{
	if(KNOWS_DEXTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_dexter_hallo_info()
{
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//Посмотрите, кто пришел. Великий освободитель. Что ж, герой, что ты делаешь здесь?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//Я хочу получить ответы на несколько вопросов.
	AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//КТО-ТО распространяет листки бумаги с моим изображением. КОЕ-КТО сказал мне, что это ты.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//Кто-то слишком много болтает.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_04");	//Но это правда. Я раздал своим парням эти объявления о розыске. У меня не было другого выбора.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_05");	//Когда я пытался выбраться из Долины Рудников, солдаты обнаружили меня и устроили мне ловушку.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_06");	//Я уже думал, что мне конец, но неожиданно эта... фигура появилась во тьме.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_07");	//На нем была черная ряса с капюшоном, нависавшим над его лицом. И он заговорил голосом, лишь отдаленно напоминающим человеческий.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_08");	//Он предложил мне свою помощь. Он вывел меня из долины и предложил тысячу золотых за твою голову.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_09");	//Эй, а что мне было делать? Если бы я отказался, он убил бы меня!
	b_logentry(TOPIC_BANDITS,"Декстер раздавал бумаги с обещанием награды за мою голову. Ему приказали сделать это люди в черных рясах.");
	MIS_STECKBRIEFE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_DEXTER_GLAUBE(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_glaube_condition;
	information = dia_dexter_glaube_info;
	permanent = FALSE;
	description = "Я не верю ни одному твоему слову.";
};


func int dia_dexter_glaube_condition()
{
	if((Npc_KnowsInfo(other,dia_dexter_wo) == FALSE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_dexter_glaube_info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//Я не верю ни одному твоему слову.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//Послушай, это все правда. Клянусь могилой своей матери!
};


instance DIA_DEXTER_WO(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 3;
	condition = dia_dexter_wo_condition;
	information = dia_dexter_wo_info;
	permanent = FALSE;
	description = "Где мне найти этого человека?";
};


func int dia_dexter_wo_condition()
{
	if((Npc_KnowsInfo(other,dia_dexter_glaube) == FALSE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_dexter_wo_info()
{
	AI_Output(other,self,"DIA_Dexter_Wo_15_00");	//Где мне найти этого человека?
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_01");	//Я думаю, он где-то в Долине Рудников.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_02");	//Этот парень здесь! И он не один. Их тут много. Они повсюду! И они ищут тебя.
	};
};


instance DIA_DEXTER_VOR(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_vor_condition;
	information = dia_dexter_vor_info;
	permanent = FALSE;
	description = "И что ты собираешься делать сейчас? Убить меня?";
};


func int dia_dexter_vor_condition()
{
	if(Npc_KnowsInfo(other,dia_dexter_glaube) || Npc_KnowsInfo(other,dia_dexter_wo))
	{
		return TRUE;
	};
};

func void dia_dexter_vor_info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//И что ты собираешься делать сейчас? Убить меня?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//Да. Но ты освободил нас всех. Вот почему я даю тебе еще один шанс. Сваливай - исчезни, сделайся невидимым. Уходи и больше не попадайся мне на пути.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//Если я увижу тебя еще раз, то без колебаний убью! Я предупредил тебя.
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_KILL(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_kill_condition;
	information = dia_dexter_kill_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_kill_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_KnowsInfo(other,dia_dexter_vor) || (KNOWS_DEXTER == FALSE)))
	{
		return TRUE;
	};
};

func void dia_dexter_kill_info()
{
	if(KNOWS_DEXTER == TRUE)
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_00");	//Я предупредил тебя. Если я не убью тебя, они убьют меня. Так что ты не оставляешь мне выбора.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//Ох, тебе не стоило показываться здесь. Ты оказался не в то время и не в том месте.
	};
	MIS_STECKBRIEFE = LOG_OBSOLETE;
	b_checklog();
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};


instance DIA_DEXTER_PICKPOCKET(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 900;
	condition = dia_dexter_pickpocket_condition;
	information = dia_dexter_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_dexter_pickpocket_condition()
{
	return c_beklauen(96,370);
};

func void dia_dexter_pickpocket_info()
{
	Info_ClearChoices(dia_dexter_pickpocket);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_BACK,dia_dexter_pickpocket_back);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_PICKPOCKET,dia_dexter_pickpocket_doit);
};

func void dia_dexter_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dexter_pickpocket);
};

func void dia_dexter_pickpocket_back()
{
	Info_ClearChoices(dia_dexter_pickpocket);
};

