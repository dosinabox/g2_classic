
instance DIA_KATI_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_exit_condition;
	information = dia_kati_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_kati_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_SLDNOCHDA(C_INFO)
{
	npc = bau_941_kati;
	nr = 4;
	condition = dia_kati_sldnochda_condition;
	information = dia_kati_sldnochda_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_kati_sldnochda_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_kati_sldnochda_info()
{
	var int hilfe;
	if(hilfe == FALSE)
	{
		AI_Output(self,other,"DIA_Kati_SLDNOCHDA_16_00");	//Эти головорезы угрожают моему мужу! Мы простые граждане Хориниса, преданные королю, а эти наемники хотят ограбить нас!
		hilfe = TRUE;
	};
	AI_Output(self,other,"DIA_Kati_SLDNOCHDA_16_01");	//Ну не стой же здесь. Сделай что-нибудь! Помоги нам!
	AKILS_SLDSTILLTHERE = TRUE;
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Фермеру Акилу угрожают наемники.");
	AI_StopProcessInfos(self);
};


instance DIA_KATI_HALLO(C_INFO)
{
	npc = bau_941_kati;
	nr = 5;
	condition = dia_kati_hallo_condition;
	information = dia_kati_hallo_info;
	permanent = FALSE;
	description = "Все в порядке?";
};


func int dia_kati_hallo_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_kati_hallo_info()
{
	AI_Output(other,self,"DIA_Kati_HALLO_15_00");	//С тобой все в порядке?
	if(Npc_IsDead(akil))
	{
		AI_Output(self,other,"DIA_Kati_HALLO_16_01");	//(рыдает) Мой любимый муж мертв! Ох, Иннос, за что ты меня так наказываешь?!
		Npc_ExchangeRoutine(self,"Start");
		b_startotherroutine(randolph,"Start");
		b_giveplayerxp(XP_AKIL_TOT);
	}
	else
	{
		AI_Output(self,other,"DIA_Kati_HALLO_16_02");	//Да, я в порядке, спасибо.
	};
};


instance DIA_KATI_ESSEN(C_INFO)
{
	npc = bau_941_kati;
	nr = 12;
	condition = dia_kati_essen_condition;
	information = dia_kati_essen_info;
	permanent = FALSE;
	description = "Акил говорит, что ты можешь накормить меня.";
};


func int dia_kati_essen_condition()
{
	if((KATI_MAHLZEIT == TRUE) && (Npc_IsDead(akil) == FALSE))
	{
		return TRUE;
	};
};

func void dia_kati_essen_info()
{
	AI_Output(other,self,"DIA_Kati_ESSEN_15_00");	//Акил говорит, что ты можешь накормить меня.
	AI_Output(self,other,"DIA_Kati_ESSEN_16_01");	//С тех пор как рухнул Барьер, для нас настали тяжелые времена. Жить здесь стало небезопасно.
	AI_Output(self,other,"DIA_Kati_ESSEN_16_02");	//Вот, держи ломоть хлеба, немного молока и бутылку воды. Извини, но это все, чем мы можем поделиться.
	b_giveinvitems(self,other,itfo_bread,1);
	b_giveinvitems(self,other,itfo_water,1);
	b_giveinvitems(self,other,itfomutton,1);
};


instance DIA_KATI_BALTRAM(C_INFO)
{
	npc = bau_941_kati;
	nr = 4;
	condition = dia_kati_baltram_condition;
	information = dia_kati_baltram_info;
	permanent = FALSE;
	description = "Меня прислал Бальтрам ...";
};


func int dia_kati_baltram_condition()
{
	if(Npc_IsDead(akil) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING) && (LIEFERUNG_GEHOLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_kati_baltram_info()
{
	AI_Output(other,self,"DIA_Kati_Baltram_15_00");	//Меня прислал Бальтрам. Я должен забрать посылку для него.
	AI_Output(self,other,"DIA_Kati_Baltram_16_01");	//Да, конечно. Вот, я уже упаковала ее.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
};


instance DIA_KATI_BAUERNAUFSTAND(C_INFO)
{
	npc = bau_941_kati;
	nr = 6;
	condition = dia_kati_bauernaufstand_condition;
	information = dia_kati_bauernaufstand_info;
	permanent = FALSE;
	description = "Почему вы не противостоите тирании Онара?";
};


func int dia_kati_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_kati_hallo))
	{
		return TRUE;
	};
};

func void dia_kati_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Kati_BAUERNAUFSTAND_15_00");	//Почему вы не противостоите тирании Онара?
	AI_Output(self,other,"DIA_Kati_BAUERNAUFSTAND_16_01");	//Для фермеров, живущих у города, это имеет смысл. Им лучше быть на стороне ополчения, чем полагаться на наемников Онара.
	AI_Output(self,other,"DIA_Kati_BAUERNAUFSTAND_16_02");	//С другой стороны, есть Бенгар и Секоб, которые скорее откажутся от своих ферм, чем будут работать на короля.
};


instance DIA_KATI_ANDEREHOEFE(C_INFO)
{
	npc = bau_941_kati;
	nr = 7;
	condition = dia_kati_anderehoefe_condition;
	information = dia_kati_anderehoefe_info;
	permanent = FALSE;
	description = "Где находятся фермы Бенгара и Секоба?";
};


func int dia_kati_anderehoefe_condition()
{
	if(Npc_KnowsInfo(other,dia_kati_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_kati_anderehoefe_info()
{
	AI_Output(other,self,"DIA_Kati_ANDEREHOEFE_15_00");	//Где находятся фермы Бенгара и Секоба?
	AI_Output(self,other,"DIA_Kati_ANDEREHOEFE_16_01");	//Неподалеку от фермы лендлорда. Иди на восток отсюда, и ты найдешь их.
};


instance DIA_KATI_HIERWEG(C_INFO)
{
	npc = bau_941_kati;
	nr = 9;
	condition = dia_kati_hierweg_condition;
	information = dia_kati_hierweg_info;
	permanent = FALSE;
	description = "А вы не думали о том, чтобы уехать отсюда?";
};


func int dia_kati_hierweg_condition()
{
	if(Npc_KnowsInfo(other,dia_kati_bauernaufstand))
	{
		return TRUE;
	};
};

func void dia_kati_hierweg_info()
{
	AI_Output(other,self,"DIA_Kati_HIERWEG_15_00");	//А вы не думали о том, чтобы уехать отсюда?
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_01");	//Не так-то просто уехать из этой части страны. Вся эта земля окружена стеной высоких, непроходимых гор.
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_02");	//Выбраться отсюда можно только лежит через Долину Рудников  или через гавань города.
	AI_Output(self,other,"DIA_Kati_HIERWEG_16_03");	//Так как мы не можем позволить себе купить место на корабле, а Долина Рудников - это место, откуда не возвращаются, мы вынуждены оставаться здесь.
};


instance DIA_KATI_PASS(C_INFO)
{
	npc = bau_941_kati;
	nr = 10;
	condition = dia_kati_pass_condition;
	information = dia_kati_pass_info;
	permanent = FALSE;
	description = "Что ты знаешь о Проходе?";
};


func int dia_kati_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_kati_hierweg))
	{
		return TRUE;
	};
};

func void dia_kati_pass_info()
{
	AI_Output(other,self,"DIA_Kati_PASS_15_00");	//Что ты знаешь о Проходе?
	AI_Output(self,other,"DIA_Kati_PASS_16_01");	//Сама я там никогда не была. Но я знаю, что он где-то неподалеку от фермы Бенгара на высокогорных пастбищах.
};


instance DIA_KATI_PERMKAP1(C_INFO)
{
	npc = bau_941_kati;
	nr = 11;
	condition = dia_kati_permkap1_condition;
	information = dia_kati_permkap1_info;
	permanent = TRUE;
	description = "Береги своего мужа.";
};


func int dia_kati_permkap1_condition()
{
	if(!c_npcisdown(akil) && Npc_KnowsInfo(other,dia_kati_hallo) && Npc_KnowsInfo(other,dia_kati_bauernaufstand) && Npc_KnowsInfo(other,dia_kati_anderehoefe) && Npc_KnowsInfo(other,dia_kati_hierweg) && Npc_KnowsInfo(other,dia_kati_pass) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_kati_permkap1_info()
{
	AI_Output(other,self,"DIA_Kati_PERMKAP1_15_00");	//Береги своего мужа.
	AI_Output(self,other,"DIA_Kati_PERMKAP1_16_01");	//Я стараюсь изо всех сил.
	AI_StopProcessInfos(self);
};


instance DIA_KATI_KAP3_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_kap3_exit_condition;
	information = dia_kati_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_kati_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_PERM(C_INFO)
{
	npc = bau_941_kati;
	nr = 3;
	condition = dia_kati_perm_condition;
	information = dia_kati_perm_info;
	permanent = TRUE;
	description = "С тобой все в порядке?";
};


func int dia_kati_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_kati_hallo))
	{
		return TRUE;
	};
};

func void dia_kati_perm_info()
{
	AI_Output(other,self,"DIA_Kati_PERM_15_00");	//С тобой все в порядке?
	AI_Output(self,other,"DIA_Kati_PERM_16_01");	//Мы справимся. Вот только не знаю, сколько еще нам придется терпеть этих дьяволов в черном.
	AI_Output(self,other,"DIA_Kati_PERM_16_02");	//Я так долго не вынесу. Они шныряют вокруг дома и везде суют свой нос.
};


instance DIA_KATI_KAP4_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_kap4_exit_condition;
	information = dia_kati_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_kati_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_KAP5_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_kap5_exit_condition;
	information = dia_kati_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_kati_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_KAP6_EXIT(C_INFO)
{
	npc = bau_941_kati;
	nr = 999;
	condition = dia_kati_kap6_exit_condition;
	information = dia_kati_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kati_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_kati_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KATI_PICKPOCKET(C_INFO)
{
	npc = bau_941_kati;
	nr = 900;
	condition = dia_kati_pickpocket_condition;
	information = dia_kati_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20_FEMALE;
};


func int dia_kati_pickpocket_condition()
{
	return c_beklauen(13,15);
};

func void dia_kati_pickpocket_info()
{
	Info_ClearChoices(dia_kati_pickpocket);
	Info_AddChoice(dia_kati_pickpocket,DIALOG_BACK,dia_kati_pickpocket_back);
	Info_AddChoice(dia_kati_pickpocket,DIALOG_PICKPOCKET,dia_kati_pickpocket_doit);
};

func void dia_kati_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kati_pickpocket);
};

func void dia_kati_pickpocket_back()
{
	Info_ClearChoices(dia_kati_pickpocket);
};

