
instance DIA_SALANDRIL_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_exit_condition;
	information = dia_salandril_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_salandril_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_PICKPOCKET(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 900;
	condition = dia_salandril_pickpocket_condition;
	information = dia_salandril_pickpocket_info;
	permanent = TRUE;
	description = "(украсть этот ключ будет легко)";
};


func int dia_salandril_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_salandril_pickpocket_info()
{
	Info_ClearChoices(dia_salandril_pickpocket);
	Info_AddChoice(dia_salandril_pickpocket,DIALOG_BACK,dia_salandril_pickpocket_back);
	Info_AddChoice(dia_salandril_pickpocket,DIALOG_PICKPOCKET,dia_salandril_pickpocket_doit);
};

func void dia_salandril_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		CreateInvItems(self,itke_salandril,1);
		b_giveinvitems(self,other,itke_salandril,1);
		b_givethiefxp();
		Info_ClearChoices(dia_salandril_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_salandril_pickpocket_back()
{
	Info_ClearChoices(dia_salandril_pickpocket);
};


instance DIA_SALANDRIL_HALLO(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_hallo_condition;
	information = dia_salandril_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_salandril_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_salandril_hallo_info()
{
	AI_Output(self,other,"DIA_Salandril_PERM_13_00");	//Добро пожаловать, путник. Ищешь хорошее зелье?
	AI_Output(self,other,"DIA_Salandril_PERM_13_01");	//У меня большой выбор и умеренные цены. Мои зелья лучше, чем та отрава, что продает Зурис.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Саландрил торгует зельями. Его лавка находится в верхнем квартале.");
};


instance DIA_SALANDRIL_TRANK(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_trank_condition;
	information = dia_salandril_trank_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_salandril_trank_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_OLDWORLD == LOG_SUCCESS) && (Npc_KnowsInfo(other,dia_salandril_kloster) == FALSE))
	{
		return TRUE;
	};
};

func void dia_salandril_trank_info()
{
	AI_Output(self,other,"DIA_Salandril_Trank_13_00");	//Я слышал, ты был с паладинами в Долине Рудников. Я восхищен.
	AI_Output(self,other,"DIA_Salandril_Trank_13_01");	//Тебе стоит задержаться и взглянуть на мои товары. Вот, например, сейчас у меня есть совершенно особенное зелье. Только для тебя.
	CreateInvItems(self,itpo_perm_dex,1);
};


instance DIA_SALANDRIL_TRADE(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 9;
	condition = dia_salandril_trade_condition;
	information = dia_salandril_trade_info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};


func int dia_salandril_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_salandril_kloster) == FALSE)
	{
		return TRUE;
	};
};

func void dia_salandril_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Salandril_Trade_15_00");	//Покажи мне свои товары.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_01");	//С удовольствием, преподобный брат.
		if(MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING)
		{
			SC_KNOWSPROSPEKTORSALANDRIL = TRUE;
		};
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Salandril_Trade_13_02");	//С удовольствием, о, благородный воин.
	};
};


instance DIA_SALANDRIL_KAP3_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_kap3_exit_condition;
	information = dia_salandril_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_salandril_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_KLOSTER(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_kloster_condition;
	information = dia_salandril_kloster_info;
	description = "Ты должен отправиться в монастырь, чтобы предстать перед судом.";
};


func int dia_salandril_kloster_condition()
{
	if((SC_KNOWSPROSPEKTORSALANDRIL == TRUE) || (MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_salandril_kloster_info()
{
	AI_Output(other,self,"DIA_Salandril_KLOSTER_15_00");	//Ты должен отправиться в монастырь, чтобы предстать перед судом.
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_01");	//Что? У тебя крыша поехала? Черта с два! У этих жалких магов нет никаких доказательств против меня.
	if((hero.guild == GIL_KDF) && (SC_KNOWSPROSPEKTORSALANDRIL == TRUE))
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_02");	//А как насчет этих фальшивых акций, которыми ты наводнил всю страну? На них твоя подпись. Ты виновен.
	}
	else
	{
		AI_Output(other,self,"DIA_Salandril_KLOSTER_15_03");	//У меня есть приказ, и я выполню его. Так что, либо ты пойдешь сам, либо мне придется заставить тебя.
	};
	AI_Output(self,other,"DIA_Salandril_KLOSTER_13_04");	//Что? Да я протащу тебя через весь город за шиворот, как паршивого щенка, и вышвырну за ворота.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_SALANDRIL_GEHINSKLOSTER(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_gehinskloster_condition;
	information = dia_salandril_gehinskloster_info;
	description = "Так ты пойдешь в монастырь, или тебя еще раз проучить?..";
};


func int dia_salandril_gehinskloster_condition()
{
	if(((SC_KNOWSPROSPEKTORSALANDRIL == TRUE) || (MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_RUNNING)) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && Npc_KnowsInfo(other,dia_salandril_kloster))
	{
		return TRUE;
	};
};

func void dia_salandril_gehinskloster_info()
{
	AI_Output(other,self,"DIA_Salandril_GehinsKloster_15_00");	//Так ты пойдешь в монастырь, или тебя еще раз проучить?..
	AI_Output(self,other,"DIA_Salandril_GehinsKloster_13_01");	//Ты еще пожалеешь об этом. Да, черт тебя побери, я пойду в этот монастырь, но тебе это просто так с рук не сойдет.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"KlosterUrteil");
	MIS_SERPENTES_BRINGSALANDRIL_SLD = LOG_SUCCESS;
};


instance DIA_SALANDRIL_VERSCHWINDE(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 2;
	condition = dia_salandril_verschwinde_condition;
	information = dia_salandril_verschwinde_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_salandril_verschwinde_condition()
{
	if((MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_salandril_verschwinde_info()
{
	b_verschwinde_stimme13();
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_KAP4_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_kap4_exit_condition;
	information = dia_salandril_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_salandril_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_KAP5_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_kap5_exit_condition;
	information = dia_salandril_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_salandril_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SALANDRIL_KAP6_EXIT(C_INFO)
{
	npc = vlk_422_salandril;
	nr = 999;
	condition = dia_salandril_kap6_exit_condition;
	information = dia_salandril_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_salandril_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_salandril_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

