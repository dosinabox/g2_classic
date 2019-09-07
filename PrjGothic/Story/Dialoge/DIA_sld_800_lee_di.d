
instance DIA_LEE_DI_EXIT(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 999;
	condition = dia_lee_di_exit_condition;
	information = dia_lee_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_di_exit_condition()
{
	return TRUE;
};

func void dia_lee_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_DI_HALLO(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 2;
	condition = dia_lee_di_hallo_condition;
	information = dia_lee_di_hallo_info;
	description = "Что ты будешь делать?";
};


func int dia_lee_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_di_hallo_info()
{
	AI_Output(other,self,"DIA_Lee_DI_Hallo_15_00");	//Что ты будешь делать?
	AI_Output(self,other,"DIA_Lee_DI_Hallo_04_01");	//Кто-то должен охранять корабль. Я останусь здесь и позабочусь, чтобы он был на месте, когда ты вернешься.
};


instance DIA_LEE_DI_PERM6(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 2;
	condition = dia_lee_di_perm6_condition;
	information = dia_lee_di_perm6_info;
	permanent = TRUE;
	description = "Как мой корабль?";
};


func int dia_lee_di_perm6_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_di_hallo) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_di_perm6_info()
{
	AI_Output(other,self,"DIA_Lee_DI_PERM6_15_00");	//Как мой корабль?
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_DI_PERM6_04_01");	//Не волнуйся. Я держу все под контролем.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_DI_PERM6_04_02");	//Все отлично. Эти жалкие орки могут возвращаться, когда хотят. Я опять устрою им взбучку.
	};
	AI_StopProcessInfos(self);
};


instance DIA_LEE_DI_TEACH(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 10;
	condition = dia_lee_di_teach_condition;
	information = dia_lee_di_teach_info;
	permanent = TRUE;
	description = "Я хочу потренироваться.";
};


func int dia_lee_di_teach_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_di_teach_info()
{
	AI_Output(other,self,"DIA_Lee_DI_Teach_15_00");	//Я хочу потренироваться.
	AI_Output(self,other,"DIA_Lee_DI_Teach_04_01");	//Что именно ты хочешь улучшить?
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_1h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_1_04_00");	//Твоя защита ужасна, но мы что-нибудь сделаем с этим.
	};
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_1h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_1H_5_04_00");	//Твои кисти слишком напряжены. Ты должен держать оружие свободнее.
	};
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_2h_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100))
	{
		AI_Output(self,other,"DIA_DIA_Lee_DI_Teach_2H_1_04_00");	//Всегда помни: боковой удар должен идти от бедра, а не от запястья.
	};
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_2h_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_2H_5_04_00");	//Сильнейший удар бесполезен, если он приходится в никуда. Так что старайся точно рассчитывать удары.
	};
	Info_ClearChoices(dia_lee_di_teach);
	Info_AddChoice(dia_lee_di_teach,DIALOG_BACK,dia_lee_di_teach_back);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_lee_di_teach_2h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_lee_di_teach_2h_5);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_lee_di_teach_1h_1);
	Info_AddChoice(dia_lee_di_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_lee_di_teach_1h_5);
};

func void dia_lee_di_teach_back()
{
	Info_ClearChoices(dia_lee_di_teach);
};


instance DIA_LEE_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 2;
	condition = dia_lee_di_undeaddragondead_condition;
	information = dia_lee_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Мы можем отчаливать.";
};


func int dia_lee_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_lee_di_undeaddragondead_onetime;

func void dia_lee_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_00");	//Мы можем отчаливать. Враг мертв.
	AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_01");	//Очень хорошо. Тогда скажи капитану, чтобы поднимал якорь.
	if((DIA_LEE_DI_UNDEADDRAGONDEAD_ONETIME == FALSE) && (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_02");	//Ты ведь доставишь меня на материк, да?
		AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_03");	//Да. Хоринис проживет и без тебя.
		AI_Output(self,other,"DIA_Lee_Add_04_26");	//Значит, я, наконец, смогу нанести королю так долго откладываемый визит вежливости.
		AI_Output(self,other,"DIA_Lee_Add_04_27");	//Я столько ждал этого...
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_05");	//Как ты думаешь? Разве терпение не должно быть вознаграждено?
		AI_Output(other,self,"DIA_Lee_DI_UndeadDragonDead_15_06");	//Терпение и убийственные доводы.
		AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_07");	//(смеется) Да. Без хорошего отряда ничего не получится. Для меня было большой честью биться с тобой бок о бок.
		DIA_LEE_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Lee_DI_UndeadDragonDead_04_08");	//Может быть, когда-нибудь наши пути пересекутся вновь...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_LEE_DI_PICKPOCKET(C_INFO)
{
	npc = sld_800_lee_di;
	nr = 900;
	condition = dia_lee_di_pickpocket_condition;
	information = dia_lee_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_lee_di_pickpocket_condition()
{
	return c_beklauen(110,570);
};

func void dia_lee_di_pickpocket_info()
{
	Info_ClearChoices(dia_lee_di_pickpocket);
	Info_AddChoice(dia_lee_di_pickpocket,DIALOG_BACK,dia_lee_di_pickpocket_back);
	Info_AddChoice(dia_lee_di_pickpocket,DIALOG_PICKPOCKET,dia_lee_di_pickpocket_doit);
};

func void dia_lee_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lee_di_pickpocket);
};

func void dia_lee_di_pickpocket_back()
{
	Info_ClearChoices(dia_lee_di_pickpocket);
};

