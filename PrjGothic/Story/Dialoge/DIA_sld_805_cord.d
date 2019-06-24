
instance DIA_CORD_EXIT(C_INFO)
{
	npc = sld_805_cord;
	nr = 999;
	condition = dia_cord_exit_condition;
	information = dia_cord_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cord_exit_condition()
{
	return TRUE;
};

func void dia_cord_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORD_HALLO(C_INFO)
{
	npc = sld_805_cord;
	nr = 1;
	condition = dia_cord_hallo_condition;
	information = dia_cord_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cord_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_cord_hallo_info()
{
	AI_Output(self,other,"DIA_Cord_Hallo_14_00");	//Если у тебя проблемы с волками или полевыми хищниками, поговори с одним из наемников помоложе.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Cord_Hallo_14_01");	//А ко мне ты можешь обратиться, когда появятся паладины.
		AI_Output(other,self,"DIA_Cord_Hallo_15_02");	//Что?
		AI_Output(self,other,"DIA_Cord_Hallo_14_03");	//Когда вы, крестьяне, обращаетесь ко мне, вы всегда просите убить ни в чем не повинных зверей.
		AI_Output(other,self,"DIA_Cord_Hallo_15_04");	//Я не крестьянин.
		AI_Output(self,other,"DIA_Cord_Hallo_14_05");	//Ох? И чего же тогда ты хочешь?
	};
};


var int cord_schonmalgefragt;

instance DIA_CORD_WANNAJOIN(C_INFO)
{
	npc = sld_805_cord;
	nr = 5;
	condition = dia_cord_wannajoin_condition;
	information = dia_cord_wannajoin_info;
	permanent = TRUE;
	description = "Я хочу стать наемником!";
};


func int dia_cord_wannajoin_condition()
{
	if((CORD_APPROVED == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void b_cord_bebetter()
{
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_14");	//Пока ты едва умеешь обращаться с оружием, и тебе здесь не место!
};

func void dia_cord_wannajoin_info()
{
	AI_Output(other,self,"DIA_Cord_WannaJoin_15_00");	//Я хочу стать наемником!
	if(CORD_SCHONMALGEFRAGT == FALSE)
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_01");	//Ты больше похож на того, кто был рожден работать на поле, парень.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_02");	//Ты умеешь обращаться с оружием?
		CORD_SCHONMALGEFRAGT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_03");	//Ты повысил свои навыки?
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_04");	//Итак, как насчет одноручного оружия?
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_05");	//Я не так уж плох в этом.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_06");	//Что-о-ожж...
	};
	AI_Output(self,other,"DIA_Cord_WannaJoin_14_07");	//А что насчет двуручного оружия?
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_08");	//Я умею обращаться с ним.
	}
	else
	{
		AI_Output(other,self,"DIA_Cord_WannaJoin_15_09");	//И скоро я стану еще лучше!
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) || (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_10");	//Ну, по крайней мере, ты не зеленый новичок. Хорошо. Я проголосую за тебя.
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_11");	//Если тебе еще что-то нужно знать, ты можешь спросить у меня.
		CORD_APPROVED = TRUE;
		b_giveplayerxp(XP_CORD_APPROVED);
		b_logentry(TOPIC_SLDRESPEKT,"Голос Корда у меня в кармане.");
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"Корд может обучить меня владению одноручным и двуручным оружием.");
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_12");	//Другими словами: ты зеленый новичок!
		AI_Output(self,other,"DIA_Cord_WannaJoin_14_13");	//Мы наемники, должны быть уверены, что можем всецело положиться на наших товарищей. От этого зависит наша жизнь.
		b_cord_bebetter();
		Log_CreateTopic(TOPIC_CORDPROVE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CORDPROVE,LOG_RUNNING);
		b_logentry(TOPIC_CORDPROVE,"Корд отдаст свой голос за меня, когда я научусь сражаться лучше.");
	};
};


instance DIA_CORD_EXPLAINSKILLS(C_INFO)
{
	npc = sld_805_cord;
	nr = 1;
	condition = dia_cord_explainskills_condition;
	information = dia_cord_explainskills_info;
	permanent = FALSE;
	description = "Что я должен изучить сначала, обращение с одноручным или двуручным оружием?";
};


func int dia_cord_explainskills_condition()
{
	if(CORD_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_cord_explainskills_info()
{
	AI_Output(other,self,"DIA_Cord_ExplainSkills_15_00");	//Что я должен изучить сначала, обращение с одноручным или двуручным оружием?
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_01");	//Эти два вида оружия весьма похожи друг на друга.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_02");	//Когда ты достигаешь следующего уровня в одном из них, ты автоматически повышаешь и уровень владения другим.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_03");	//Если, например, ты хорошо владеешь одноручным мечом, но все еще новичок в том, что касается двуручного...
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_04");	//...навык владения двуручным оружием также повысится, когда ты будешь тренировать одноручное.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_05");	//Если ты тренируешься только с одним типом оружия, ты найдешь процесс обучения более изматывающим.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_06");	//Если же ты всегда тренируешь оба вида оружия, ты достигнешь того же результата, затратив меньше усилий.
	AI_Output(self,other,"DIA_Cord_ExplainSkills_14_07");	//И еще, результат все равно будет один и тем же - так что тебе выбирать.
};


instance DIA_CORD_EXPLAINWEAPONS(C_INFO)
{
	npc = sld_805_cord;
	nr = 2;
	condition = dia_cord_explainweapons_condition;
	information = dia_cord_explainweapons_info;
	permanent = FALSE;
	description = "Каковы преимущества одноручного и двуручного оружия?";
};


func int dia_cord_explainweapons_condition()
{
	if(CORD_APPROVED == TRUE)
	{
		return TRUE;
	};
};

func void dia_cord_explainweapons_info()
{
	AI_Output(other,self,"DIA_Cord_ExplainWeapons_15_00");	//Каковы преимущества одноручного и двуручного оружия?
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_01");	//Хороший вопрос. Я вижу, что ты размышлял над этим вопросом.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_02");	//Одноручное оружие быстрее, но оно наносит меньший урон врагам.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_03");	//Двуручное оружие наносит больший урон, но им не получится размахивать так же быстро, как одноручным.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_04");	//Также, чтобы владеть двуручным мечом, тебе понадобится больше сил. Это означает необходимость дополнительных тренировок.
	AI_Output(self,other,"DIA_Cord_ExplainWeapons_14_05");	//Чтобы стать настоящим профессионалом, придется затратить много усилий.
};


var int cord_merke_1h;
var int cord_merke_2h;

instance DIA_CORD_TEACH(C_INFO)
{
	npc = sld_805_cord;
	nr = 3;
	condition = dia_cord_teach_condition;
	information = dia_cord_teach_info;
	permanent = TRUE;
	description = "Научи меня сражаться!";
};


func int dia_cord_teach_condition()
{
	return TRUE;
};

func void b_cord_zeitverschwendung()
{
	AI_Output(self,other,"DIA_Cord_Teach_14_03");	//Я не хочу тратить свое время на новичков.
};

func void dia_cord_teach_info()
{
	AI_Output(other,self,"DIA_Cord_Teach_15_00");	//Научи меня сражаться!
	if((CORD_APPROVED == TRUE) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		if((Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0) && (Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0))
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_01");	//Я могу обучить тебя владению любым оружием - с чего начнем?
			CORD_APPROVED = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_02");	//Я могу обучить тебя владению одноручным мечом. Но ты пока недостаточно хорош, чтобы использовать двуручный меч.
			b_cord_zeitverschwendung();
			CORD_APPROVED = TRUE;
		}
		else if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
		{
			AI_Output(self,other,"DIA_Cord_Teach_14_04");	//Что касается одноручного оружия, то здесь ты зеленый новичок! Хотя в обращении с двуручным ты не так уж и плох.
			AI_Output(self,other,"DIA_Cord_Teach_14_05");	//Если ты захочешь потренироваться с одноручным оружием, тебе придется найти другого учителя.
			CORD_APPROVED = TRUE;
		}
		else
		{
			b_cord_zeitverschwendung();
			b_cord_bebetter();
		};
		if(CORD_APPROVED == TRUE)
		{
			Info_ClearChoices(dia_cord_teach);
			Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
			if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
			{
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_cord_teach_2h_1);
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_cord_teach_2h_5);
			};
			if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
			{
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_cord_teach_1h_1);
				Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_cord_teach_1h_5);
			};
			CORD_MERKE_1H = other.hitchance[NPC_TALENT_1H];
			CORD_MERKE_2H = other.hitchance[NPC_TALENT_2H];
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Cord_Teach_14_06");	//Я тренирую только наемников и достойных кандидатов!
	};
};

func void dia_cord_teach_back()
{
	if((CORD_MERKE_1H < other.hitchance[NPC_TALENT_1H]) || (CORD_MERKE_2H < other.hitchance[NPC_TALENT_2H]))
	{
		AI_Output(self,other,"DIA_Cord_Teach_BACK_14_00");	//Ты стал значительно лучше - так держать!
	};
	Info_ClearChoices(dia_cord_teach);
};

func void dia_cord_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_cord_teach_1h_5);
	};
};

func void dia_cord_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,90);
	Info_ClearChoices(dia_cord_teach);
	Info_AddChoice(dia_cord_teach,DIALOG_BACK,dia_cord_teach_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_2H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_cord_teach_2h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_cord_teach_2h_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) > 0)
	{
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_cord_teach_1h_1);
		Info_AddChoice(dia_cord_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_cord_teach_1h_5);
	};
};


instance DIA_CORD_PICKPOCKET(C_INFO)
{
	npc = sld_805_cord;
	nr = 900;
	condition = dia_cord_pickpocket_condition;
	information = dia_cord_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_cord_pickpocket_condition()
{
	return c_beklauen(65,75);
};

func void dia_cord_pickpocket_info()
{
	Info_ClearChoices(dia_cord_pickpocket);
	Info_AddChoice(dia_cord_pickpocket,DIALOG_BACK,dia_cord_pickpocket_back);
	Info_AddChoice(dia_cord_pickpocket,DIALOG_PICKPOCKET,dia_cord_pickpocket_doit);
};

func void dia_cord_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cord_pickpocket);
};

func void dia_cord_pickpocket_back()
{
	Info_ClearChoices(dia_cord_pickpocket);
};

