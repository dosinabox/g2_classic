
instance DIA_HODGES_KAP1_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap1_exit_condition;
	information = dia_hodges_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_hodges_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_HALLO(C_INFO)
{
	npc = bau_908_hodges;
	nr = 1;
	condition = dia_hodges_hallo_condition;
	information = dia_hodges_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hodges_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_hallo_info()
{
	AI_Output(other,self,"DIA_Hodges_HALLO_15_00");	//Привет, я новичок здесь.
	AI_Output(self,other,"DIA_Hodges_HALLO_03_01");	//Не пойми меня неправильно, но сейчас у меня нет настроения разговаривать - я абсолютно измотан.
	AI_Output(other,self,"DIA_Hodges_HALLO_15_02");	//Ты ужасно занят, да?
	AI_Output(self,other,"DIA_Hodges_HALLO_03_03");	//Даже не говори. Беннет делает столько оружия, что едва успеваю полировать его.
};


instance DIA_HODGES_TELLABOUTFARM(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_tellaboutfarm_condition;
	information = dia_hodges_tellaboutfarm_info;
	permanent = FALSE;
	description = "Что ты можешь рассказать мне об этой ферме?";
};


func int dia_hodges_tellaboutfarm_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_tellaboutfarm_info()
{
	AI_Output(other,self,"DIA_Hodges_TellAboutFarm_15_00");	//Что ты можешь рассказать мне об этой ферме?
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_01");	//Это ферма Онара.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_02");	//Это большое здание - его дом. Он освободил одно крыло для наемников.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_03");	//А нам, фермерам, пришлось переселиться в сарай.
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_04");	//(торопливо) Но я совсем не против, хорошо ведь, что есть люди, способные защитить ферму.
	if(Npc_GetDistToWP(self,"NW_BIGFARM_SMITH_SHARP") < 500)
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_05");	//Вот это здание - кухня.
	}
	else
	{
		AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_06");	//Перед кухней находится кузница.
	};
	AI_Output(self,other,"DIA_Hodges_TellAboutFarm_03_07");	//Возможно, тебе повезет и Текла приготовит тебе что-нибудь поесть.
};


instance DIA_HODGES_ABOUTSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_aboutsld_condition;
	information = dia_hodges_aboutsld_info;
	permanent = FALSE;
	description = "А что насчет наемников?";
};


func int dia_hodges_aboutsld_condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_hodges_aboutsld_info()
{
	AI_Output(other,self,"DIA_Hodges_AboutSld_15_00");	//А что насчет наемников?
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_01");	//Онар нанял их, чтобы они не пускали сюда ополчение.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_02");	//Но также они охраняют ферму, наших овец и самих фермеров.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_03");	//Так что даже не думай украсть что-нибудь или пошарить в чужом сундуке.
	AI_Output(self,other,"DIA_Hodges_AboutSld_03_04");	//Они только и ждут шанса, чтобы задать тебе трепку.
};


instance DIA_HODGES_TRADE(C_INFO)
{
	npc = bau_908_hodges;
	nr = 2;
	condition = dia_hodges_trade_condition;
	information = dia_hodges_trade_info;
	permanent = TRUE;
	description = "Могу я купить оружие у тебя?";
	trade = TRUE;
};


func int dia_hodges_trade_condition()
{
	return TRUE;
};

func void dia_hodges_trade_info()
{
	AI_Output(other,self,"DIA_Hodges_TRADE_15_00");	//Могу я купить оружие у тебя?
	AI_Output(self,other,"DIA_Hodges_TRADE_03_01");	//У меня мало что есть. Мы относим почти все мечи и топоры в дом Онара.
	Npc_RemoveInvItems(self,itmiswordblade,Npc_HasItems(self,itmiswordblade));
};


instance DIA_HODGES_KAP2_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap2_exit_condition;
	information = dia_hodges_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_hodges_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP3_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap3_exit_condition;
	information = dia_hodges_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hodges_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_DONTWORK(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_dontwork_condition;
	information = dia_hodges_dontwork_info;
	permanent = FALSE;
	description = "Почему ты не работаешь?";
};


func int dia_hodges_dontwork_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_dontwork_info()
{
	AI_Output(other,self,"DIA_Hodges_DontWork_15_00");	//Почему ты не работаешь?
	AI_Output(self,other,"DIA_Hodges_DontWork_03_01");	//Ты еще ничего не слышал? Паладины арестовали Беннета.
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"Кузнец Беннет арестован паладинами в городе.");
};


instance DIA_HODGES_WHATHAPPENED(C_INFO)
{
	npc = bau_908_hodges;
	nr = 31;
	condition = dia_hodges_whathappened_condition;
	information = dia_hodges_whathappened_info;
	permanent = FALSE;
	description = "Что произошло?";
};


func int dia_hodges_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_whathappened_info()
{
	AI_Output(other,self,"DIA_Hodges_WhatHappened_15_00");	//Что случилось?
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_01");	//Ну, мы были в городе за покупками, когда неожиданно услышали крик. Кто-то кричал: 'Вот они, держите их!'
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_02");	//Ох, как я испугался! Я бросился бежать. Я бежал так, как будто за мной гнались демоны.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_03");	//Беннет бежал за мной. Я не знаю, что произошло, но когда я выбрался из города, его со мной уже не было.
	AI_Output(self,other,"DIA_Hodges_WhatHappened_03_04");	//Должно быть, он отстал где-то в городе.
};


instance DIA_HODGES_BENNETSCRIME(C_INFO)
{
	npc = bau_908_hodges;
	nr = 32;
	condition = dia_hodges_bennetscrime_condition;
	information = dia_hodges_bennetscrime_info;
	permanent = FALSE;
	description = "Так почему Беннета арестовали?";
};


func int dia_hodges_bennetscrime_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetscrime_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_00");	//Так почему Беннета арестовали?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_01");	//Убийство! Беннета подозревают в убийстве паладина. Какая чушь. Я был с ним все это время.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_02");	//Так почему ты не пойдешь в город и не расскажешь, как все было?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_03");	//Они посадят меня в камеру как его сообщника. Нееет, этого нельзя делать, учитывая ситуацию.
	AI_Output(other,self,"DIA_Hodges_BennetsCrime_15_04");	//Ситуацию?
	AI_Output(self,other,"DIA_Hodges_BennetsCrime_03_05");	//Понимаешь, Онар и его отношения с городом... Это все может плохо кончиться.
	b_logentry(TOPIC_RESCUEBENNET,"Говорят, что Беннет убил паладина. Его ученик Ходжес утверждает, что Беннет невиновен, но он не осмеливается входить в город.");
};


instance DIA_HODGES_BENNETANDSLD(C_INFO)
{
	npc = bau_908_hodges;
	nr = 33;
	condition = dia_hodges_bennetandsld_condition;
	information = dia_hodges_bennetandsld_info;
	permanent = FALSE;
	description = "А как отреагировали наемники на ферме?";
};


func int dia_hodges_bennetandsld_condition()
{
	if(Npc_KnowsInfo(other,dia_hodges_dontwork) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_hodges_bennetandsld_info()
{
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_00");	//А как отреагировали наемники на ферме?
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_01");	//Естественно, я не знаю, что они планируют, но многие из них просто в ярости.
	AI_Output(other,self,"DIA_Hodges_BennetAndSLD_15_02");	//Это понятно.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_03");	//Если бы у них было право решать, они бы атаковали город уже сегодня, чтобы освободить Беннета.
	AI_Output(self,other,"DIA_Hodges_BennetAndSLD_03_04");	//Поговори с Ли, может быть, ты чем-нибудь сможешь помочь.
};


instance DIA_HODGES_KAP4_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap4_exit_condition;
	information = dia_hodges_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hodges_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_KAP5_EXIT(C_INFO)
{
	npc = bau_908_hodges;
	nr = 999;
	condition = dia_hodges_kap5_exit_condition;
	information = dia_hodges_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hodges_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hodges_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HODGES_PICKPOCKET(C_INFO)
{
	npc = bau_908_hodges;
	nr = 900;
	condition = dia_hodges_pickpocket_condition;
	information = dia_hodges_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_hodges_pickpocket_condition()
{
	return c_beklauen(15,10);
};

func void dia_hodges_pickpocket_info()
{
	Info_ClearChoices(dia_hodges_pickpocket);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_BACK,dia_hodges_pickpocket_back);
	Info_AddChoice(dia_hodges_pickpocket,DIALOG_PICKPOCKET,dia_hodges_pickpocket_doit);
};

func void dia_hodges_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hodges_pickpocket);
};

func void dia_hodges_pickpocket_back()
{
	Info_ClearChoices(dia_hodges_pickpocket);
};

