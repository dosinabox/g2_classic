
instance DIA_GIRION_DI_XIT(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 999;
	condition = dia_girion_di_exit_condition;
	information = dia_girion_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_girion_di_exit_condition()
{
	return TRUE;
};

func void dia_girion_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_DI_HALLO(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 2;
	condition = dia_girion_di_hallo_condition;
	information = dia_girion_di_hallo_info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int dia_girion_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_girion_di_hallo_info()
{
	AI_Output(other,self,"DIA_Girion_DI_Hallo_15_00");	//Все в порядке?
	if(ORKSTURMDI == TRUE)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_01");	//У орков хватило мужества, чтобы атаковать меня.
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_02");	//Но им стоило лучше подумать, прежде чем нападать на паладина из королевской стражи.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_03");	//Думаю, да. Долго ты еще будешь возиться на этом утесе?
	}
	else
	{
		AI_Output(self,other,"DIA_Girion_DI_Hallo_08_04");	//Не считай меня за идиота. Делай то, что нужно сделать, и побыстрее возвращай корабль мне.
	};
};


instance DIA_GIRION_DI_TEACH(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 5;
	condition = dia_girion_di_teach_condition;
	information = dia_girion_di_teach_info;
	permanent = TRUE;
	description = "Обучи меня, тогда мы сможем убраться отсюда быстрее!";
};


func int dia_girion_di_teach_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_girion_di_teach_info()
{
	AI_Output(other,self,"DIA_Girion_DI_Teach_15_00");	//Обучи меня, тогда мы сможем быстрее убраться с этого острова.
	AI_Output(self,other,"DIA_Girion_DI_Teach_08_01");	//Похоже, у меня нет другого выбора.
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_crossbow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_1_08_00");	//При стрельбе никогда не опирайся локтями. Это сделает твою хватку слишком жесткой, и ты неизбежно собьешь прицел.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_crossbow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_CROSSBOW_5_08_00");	//Всегда расслабляй свою левую руку перед выстрелом. Это позволит тебе более точно прицелиться.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_1h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_1_08_00");	//Твой клинок должен рассекать воздух как тростник на ветру.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_1h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_1H_5_08_00");	//Силу нужно применять расчетливо. Если ты слепо будешь бросаться на противника, это не приведет тебя к успеху.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_2h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_DIA_Girion_DI_Teach_2H_1_08_00");	//Не сжимай рукоятку слишком сильно, и твой удар точно поразит цель.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_2h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Girion_DI_Teach_2H_5_08_00");	//Не забывай о парировании. Но лучшая оборона - это уклонение от удара врага.
	};
	Info_ClearChoices(dia_girion_di_teach);
	Info_AddChoice(dia_girion_di_teach,DIALOG_BACK,dia_girion_di_teach_back);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_girion_di_teach_crossbow_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_girion_di_teach_crossbow_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_girion_di_teach_2h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_girion_di_teach_2h_5);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_girion_di_teach_1h_1);
	Info_AddChoice(dia_girion_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_girion_di_teach_1h_5);
};

func void dia_girion_di_teach_back()
{
	Info_ClearChoices(dia_girion_di_teach);
};


instance DIA_GIRION_DI_ORCELITERING(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 99;
	condition = dia_girion_di_orcelitering_condition;
	information = dia_girion_di_orcelitering_info;
	permanent = TRUE;
	description = "У меня есть кольцо предводителей орков.";
};


func int dia_girion_di_orcelitering_condition()
{
	if(Npc_HasItems(other,itri_orcelitering))
	{
		return TRUE;
	};
};


var int dia_girion_di_orcelitering_onetime;

func void dia_girion_di_orcelitering_info()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_15_00");	//У меня есть кольцо предводителей орков.
	if(DIA_GIRION_DI_ORCELITERING_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_01");	//Я думаю, лорд Хаген сможет что-нибудь предпринять.
		DIA_GIRION_DI_ORCELITERING_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_08_02");	//Дай его мне. Я покажу его лорду Хагену.
	Info_ClearChoices(dia_girion_di_orcelitering);
	Info_AddChoice(dia_girion_di_orcelitering,"Я лучше оставлю его себе.",dia_girion_di_orcelitering_behalten);
	Info_AddChoice(dia_girion_di_orcelitering,"Вот, возьми.",dia_girion_di_orcelitering_geben);
};

func void dia_girion_di_orcelitering_geben()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_geben_15_00");	//Вот, возьми.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_geben_08_01");	//Спасибо. Все равно я не думаю, что оно может тебе пригодиться.
	Info_ClearChoices(dia_girion_di_orcelitering);
	b_giveinvitems(other,self,itri_orcelitering,1);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_girion_di_orcelitering_behalten()
{
	AI_Output(other,self,"DIA_Girion_DI_OrcEliteRing_behalten_15_00");	//Я лучше оставлю его себе.
	AI_Output(self,other,"DIA_Girion_DI_OrcEliteRing_behalten_08_01");	//Как знаешь. Все равно оно вряд ли тебе пригодится.
	Info_ClearChoices(dia_girion_di_orcelitering);
};


instance DIA_GIRION_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 2;
	condition = dia_girion_di_undeaddragondead_condition;
	information = dia_girion_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Мы готовы к отплытию.";
};


func int dia_girion_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_girion_di_undeaddragondead_onetime;

func void dia_girion_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_00");	//Мы готовы к отплытию.
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_01");	//Это хорошо. А то я уже начал думать, что сгнием здесь на этом утесе.
	if(DIA_GIRION_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_02");	//Теперь немедленно верни корабль мне.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_03");	//Мы еще не в Хоринисе. И, если честно, я не так уж жажду возвращаться назад, на Хоринис.
		AI_Output(other,self,"DIA_Girion_DI_UndeadDragonDead_15_04");	//Я и так провел там слишком много времени.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_05");	//Я так и думал. Но сейчас не место и не время поднимать этот вопрос. Лучше мы обсудим это в открытом море.
		AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_06");	//Ладно. Я, тем не менее, рад видеть тебя на борту в полном здравии.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_07");	//Ты настоящий воин Инноса. У меня нет сомнений на этот счет. Я рад, что ты на нашей стороне.
		}
		else
		{
			AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_08");	//Даже хотя ты и мошенник, последнее время ты вел себя как настоящий праведник.
		};
		DIA_GIRION_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Girion_DI_UndeadDragonDead_08_09");	//Хорошо. Теперь иди к капитану. Пусть он поднимает якорь.
	AI_StopProcessInfos(self);
};


instance DIA_GIRION_DI_PICKPOCKET(C_INFO)
{
	npc = pal_207_girion_di;
	nr = 900;
	condition = dia_girion_di_pickpocket_condition;
	information = dia_girion_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_girion_di_pickpocket_condition()
{
	return c_beklauen(71,260);
};

func void dia_girion_di_pickpocket_info()
{
	Info_ClearChoices(dia_girion_di_pickpocket);
	Info_AddChoice(dia_girion_di_pickpocket,DIALOG_BACK,dia_girion_di_pickpocket_back);
	Info_AddChoice(dia_girion_di_pickpocket,DIALOG_PICKPOCKET,dia_girion_di_pickpocket_doit);
};

func void dia_girion_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_girion_di_pickpocket);
};

func void dia_girion_di_pickpocket_back()
{
	Info_ClearChoices(dia_girion_di_pickpocket);
};

