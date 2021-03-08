
instance DIA_MATTEO_EXIT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 999;
	condition = dia_matteo_exit_condition;
	information = dia_matteo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_matteo_exit_condition()
{
	return TRUE;
};

func void dia_matteo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MATTEO_PICKPOCKET(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 900;
	condition = dia_matteo_pickpocket_condition;
	information = dia_matteo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_matteo_pickpocket_condition()
{
	return c_beklauen(80,150);
};

func void dia_matteo_pickpocket_info()
{
	Info_ClearChoices(dia_matteo_pickpocket);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_BACK,dia_matteo_pickpocket_back);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_PICKPOCKET,dia_matteo_pickpocket_doit);
};

func void dia_matteo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_matteo_pickpocket);
};

func void dia_matteo_pickpocket_back()
{
	Info_ClearChoices(dia_matteo_pickpocket);
};


instance DIA_MATTEO_HALLO(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_hallo_condition;
	information = dia_matteo_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_matteo_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_matteo_hallo_info()
{
	AI_Output(self,other,"DIA_Matteo_Hallo_09_00");	//Чем могу помочь?
};


instance DIA_MATTEO_SELLWHAT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_sellwhat_condition;
	information = dia_matteo_sellwhat_info;
	permanent = FALSE;
	description = "Что ты продаешь?";
};


func int dia_matteo_sellwhat_condition()
{
	return TRUE;
};

func void dia_matteo_sellwhat_info()
{
	AI_Output(other,self,"DIA_Matteo_SellWhat_15_00");	//Что ты продаешь?
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_01");	//Я могу предложить все, что может понадобиться в твоих странствиях. Оружие, факелы, провизию... даже доспехи.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_02");	//У меня есть очень хороший экземпляр на складе.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_03");	//Двойные усиленные доспехи из кожи снеппера - совсем новые. Тебе это интересно?
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Лавка Маттео находится у южных ворот города. Он продает снаряжение, оружие и другие товары.");
		KNOWS_MATTEO = TRUE;
	};
};


instance DIA_MATTEO_TRADE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 800;
	condition = dia_matteo_trade_condition;
	information = dia_matteo_trade_info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};


func int dia_matteo_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};


var int matteo_tradenewspermanent;

func void dia_matteo_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Matteo_TRADE_15_00");	//Покажи мне свои товары.
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS) && (MATTEO_TRADENEWSPERMANENT == FALSE))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_01");	//С тех пор, как наемники прикончили Лотара, инспекции паладинов стали значительно боле строгими.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_02");	//Я надеюсь, все успокоится, когда этого убийцу повесят.
		MATTEO_TRADENEWSPERMANENT = 1;
	};
	if((KAPITEL == 5) && (MATTEO_TRADENEWSPERMANENT < 2))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_03");	//Похоже, паладины действительно серьезно настроены на этот раз. Они даже сократили охрану на своем корабле.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_04");	//Это хорошо, что ты опять пополняешь свои запасы, кто знает, будет ли еще существовать этот город на следующей неделе.
		MATTEO_TRADENEWSPERMANENT = 2;
	};
};


var int matteo_leatherbought;

instance DIA_MATTEO_LEATHER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 850;
	condition = dia_matteo_leather_condition;
	information = dia_matteo_leather_info;
	permanent = TRUE;
	description = "Купить кожаные доспехи. Защита: оружие 25, стрелы 20. (250 золота)";
};


func int dia_matteo_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat) && (MATTEO_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_leather_info()
{
	AI_Output(other,self,"DIA_Matteo_LEATHER_15_00");	//Хорошо, давай мне эти доспехи.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_01");	//Они тебе понравятся. (ухмыляется)
		b_giveinvitems(self,other,itar_leather_l,1);
		MATTEO_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_02");	//Эти доспехи стоят недешево - но они, определенно, стоят своих денег. Так что возвращайся, когда у тебя будет достаточно золота.
	};
};


instance DIA_MATTEO_PALADINE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_paladine_condition;
	information = dia_matteo_paladine_info;
	permanent = FALSE;
	description = "Что ты знаешь о паладинах?";
};


func int dia_matteo_paladine_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_matteo_paladine_info()
{
	AI_Output(other,self,"DIA_Matteo_Paladine_15_00");	//Что ты знаешь о паладинах?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_01");	//С тех пор, как эти ублюдки прибыли в город, у меня от них одни проблемы.
	AI_Output(self,other,"DIA_Matteo_Paladine_09_02");	//Последний раз, когда я шел в верхний квартал, стражники преградили мне дорогу и начали выяснять, что мне там нужно!
	AI_Output(other,self,"DIA_Matteo_Paladine_15_03");	//И?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_04");	//Конечно же, они пропустили меня!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_05");	//Да у меня уже была лавка в этом городе, когда эти напыщенные болваны еще пешком под стол ходили!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_06");	//А вчера эти ублюдки пришли и конфисковали половину моих товаров!
};


instance DIA_MATTEO_CONFISCATED(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_confiscated_condition;
	information = dia_matteo_confiscated_info;
	permanent = FALSE;
	description = "Паладины забрали твои товары?";
};


func int dia_matteo_confiscated_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine))
	{
		return TRUE;
	};
};

func void dia_matteo_confiscated_info()
{
	AI_Output(other,self,"DIA_Matteo_Confiscated_15_00");	//Паладины забрали твои товары?
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_01");	//Все, что у меня хранилось на заднем дворе.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_02");	//Они просто поставили стражника перед входом во двор.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_03");	//Мне еще повезло, что они не забрали все. Хотя бы доспехи оставили.
};


instance DIA_MATTEO_HELPMETOOV(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmetoov_condition;
	information = dia_matteo_helpmetoov_info;
	permanent = FALSE;
	description = "Ты можешь помочь мне попасть в верхний квартал?";
};


func int dia_matteo_helpmetoov_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmetoov_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_00");	//Ты можешь помочь мне попасть в верхний квартал?
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_01");	//(ошеломленно) Что? А что тебе нужно ТАМ?
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_02");	//У меня важное сообщение...
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_03");	//Так-так... А ты пытался пойти мимо стражников?
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_04");	//(горький смех) Ох, забудь об этом!
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_05");	//(смеется) Это так ТИПИЧНО для этих нищих!
	}
	else
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_06");	//Я не понимаю, зачем мне даже пытаться.
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_07");	//Возможно, ты прав.
	};
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_08");	//Я не знаю НАСКОЛЬКО важное у тебя сообщение - это меня не касается.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_09");	//Но даже если ты скажешь им, что корабль, набитый орками, пришвартовался в гавани, они не пустят тебя.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_10");	//Потому что у них есть ПРИКАЗ.
};

func void b_matteo_preis()
{
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_01");	//Похоже, это очень важно для тебя.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_02");	//(лукаво) Вопрос в том: НАСКОЛЬКО это важно для тебя?
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_03");	//На что ты намекаешь?
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_04");	//Я могу помочь тебе - я ведь, все же, один из самых влиятельных людей здесь.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_05");	//Но это тебе обойдется в некоторую сумму.
};


instance DIA_MATTEO_HELPMENOW(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmenow_condition;
	information = dia_matteo_helpmenow_info;
	permanent = FALSE;
	description = "Так ты можешь помочь мне попасть в верхний квартал?";
};


func int dia_matteo_helpmenow_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmetoov) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmenow_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_00");	//Так ты можешь помочь мне попасть в верхний квартал?
	b_matteo_preis();
};


instance DIA_MATTEO_LEHRLINGLATER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_lehrlinglater_condition;
	information = dia_matteo_lehrlinglater_info;
	permanent = FALSE;
	description = "Помоги мне стать учеником одного из мастеров.";
};


func int dia_matteo_lehrlinglater_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_lehrlinglater_info()
{
	AI_Output(other,self,"DIA_Matteo_LehrlingLater_15_00");	//Помоги мне стать учеником одного из мастеров.
	b_matteo_preis();
};


instance DIA_MATTEO_PRICEOFHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_priceofhelp_condition;
	information = dia_matteo_priceofhelp_info;
	permanent = FALSE;
	description = "Что ты хочешь за свои услуги?";
};


func int dia_matteo_priceofhelp_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmenow) || Npc_KnowsInfo(other,dia_matteo_lehrlinglater))
	{
		return TRUE;
	};
};

func void dia_matteo_priceofhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_15_00");	//Что ты хочешь за свои услуги?
	AI_Output(self,other,"DIA_Matteo_PriceOfHelp_09_01");	//100 золотых монет.
	Info_ClearChoices(dia_matteo_priceofhelp);
	Info_AddChoice(dia_matteo_priceofhelp,"Это все чертовски...",dia_matteo_priceofhelp_wow);
	Info_AddChoice(dia_matteo_priceofhelp,"Ах ты, шельмец!",dia_matteo_priceofhelp_cutthroat);
};

func void b_matteo_regdichab()
{
	AI_Output(self,other,"B_Matteo_RegDichAb_09_00");	//Воспринимай это проще! Это не ТВОЕ золото я имею в виду.
	AI_Output(other,self,"B_Matteo_RegDichAb_15_01");	//А чье?
	AI_Output(self,other,"B_Matteo_RegDichAb_09_02");	//В принципе, это МОЕ золото.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_03");	//Гритта, племянница плотника, уже давно не отдает мне долг.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_04");	//Но эта маленькая вертихвостка постоянно дефилирует в новых платьях - это означает, что деньги у нее есть.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_05");	//Я хочу, чтобы ты выбил из нее этот долг. Но мастер Торбен - плотник - тоже очень влиятельный человек.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_06");	//Принеси мне эти деньги, и я помогу тебе.
	MIS_MATTEO_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MATTEO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MATTEO,LOG_RUNNING);
	b_logentry(TOPIC_MATTEO,"Племянница плотника Торбена Гритта должна Маттео 100 золотых монет. Если я верну их ему, он поможет мне попасть в верхний квартал.");
};

func void dia_matteo_priceofhelp_cutthroat()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Cutthroat_15_00");	//Ах ты, шельмец!
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};

func void dia_matteo_priceofhelp_wow()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Wow_15_00");	//Это все чертовски...
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};


instance DIA_MATTEO_WOGRITTA(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_wogritta_condition;
	information = dia_matteo_wogritta_info;
	permanent = FALSE;
	description = "Где мне найти эту Гритту?";
};


func int dia_matteo_wogritta_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (gritta.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_wogritta_info()
{
	AI_Output(other,self,"DIA_Matteo_WoGritta_15_00");	//Где мне найти эту Гритту?
	AI_Output(self,other,"DIA_Matteo_WoGritta_09_01");	//Как я уже говорил - она племянница плотника - его дом находится ниже по улице, справа от кузницы.
};


instance DIA_MATTEO_GOLDRUNNING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 500;
	condition = dia_matteo_goldrunning_condition;
	information = dia_matteo_goldrunning_info;
	permanent = TRUE;
	description = "Вот твои 100 золотых!";
};


func int dia_matteo_goldrunning_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (Npc_KnowsInfo(other,dia_gritta_wantsmoney) || Npc_IsDead(gritta)))
	{
		return TRUE;
	};
};

func void dia_matteo_goldrunning_info()
{
	AI_Output(other,self,"DIA_Matteo_GoldRunning_15_00");	//Вот твои 100 золотых!
	if(Npc_IsDead(gritta))
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_01");	//На этом золоте кровь Гритты! Я не говорил, что нужно убивать ее!
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_02");	//Я не хочу иметь никакого отношения к этому делу. Ты можешь забыть о нашей сделке! Не хочу даже вспоминать об этом!
		MIS_MATTEO_GOLD = LOG_FAILED;
		b_checklog();
		AI_StopProcessInfos(self);
		return;
	};
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(Npc_HasItems(gritta,itmi_gold) < 100)
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_03");	//И? Были какие-нибудь проблемы?
			AI_Output(other,self,"DIA_Matteo_GoldRunning_15_04");	//Ничего такого, о чем стоило бы говорить.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_05");	//Хорошо! Ты выполнил свою часть сделки.
		}
		else
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_06");	//Ты хочешь заплатить за нее? Хм - я бы предпочел, чтобы ты выколотил эти деньги из нее!
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_07");	//Но все же - 100 золотых есть 100 золотых.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_08");	//Ты выполнил свою часть сделки.
		};
		MIS_MATTEO_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_MATTEO_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_09");	//У тебя проблемы со счетом? Я не вижу 100 золотых монет.
	};
};


instance DIA_MATTEO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_zustimmung_condition;
	information = dia_matteo_zustimmung_info;
	permanent = TRUE;
	description = "Помоги мне стать учеником одного из мастеров!";
};


var int dia_matteo_zustimmung_perm;

func int dia_matteo_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && ((MIS_MATTEO_GOLD == LOG_RUNNING) || (MIS_MATTEO_GOLD == LOG_SUCCESS)) && (PLAYER_ISAPPRENTICE == APP_NONE) && (DIA_MATTEO_ZUSTIMMUNG_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_zustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_Zustimmung_15_00");	//Помоги мне стать учеником одного из мастеров!
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_01");	//Не волнуйся, я выполню свои обещания.
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_02");	//Другие мастера услышат от меня о тебе только хорошее.
		b_giveplayerxp(XP_ZUSTIMMUNG);
		b_logentry(TOPIC_LEHRLING,"Маттео даст мне свое одобрение, если я захочу стать учеником другого мастера.");
		DIA_MATTEO_ZUSTIMMUNG_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_03");	//Всему своя очередь. Сначала выполни свою часть сделки и принеси мне золото!
	};
};


instance DIA_MATTEO_HOWCANYOUHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_howcanyouhelp_condition;
	information = dia_matteo_howcanyouhelp_info;
	permanent = FALSE;
	description = "Как ИМЕННО ты собираешься помочь мне?";
};


func int dia_matteo_howcanyouhelp_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmenow) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_howcanyouhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_HowCanYouHelp_15_00");	//Как ИМЕННО ты собираешься помочь мне?
	AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_01");	//Это просто. Я использую свое влияние, чтобы убедить других здешних мастеров взять тебя в ученики.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_02");	//Став учеником, ты автоматически станешь и гражданином города и сможешь попасть в верхний квартал. Помимо этого, ты сможешь что-нибудь заработать.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Маттео может помочь мне стать учеником одного из мастеровых.");
};


instance DIA_MATTEO_WOALSLEHRLING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_woalslehrling_condition;
	information = dia_matteo_woalslehrling_info;
	permanent = FALSE;
	description = "А к кому я могу поступить в ученики?";
};


func int dia_matteo_woalslehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_woalslehrling_info()
{
	AI_Output(other,self,"DIA_Matteo_WoAlsLehrling_15_00");	//А к кому я могу поступить в ученики?
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_01");	//К любому мастеру на этой улице.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_02");	//Это может быть кузнец Гарад, мастер-лучник Боспер, плотник Торбен или алхимик Константино.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_03");	//Один из них обязательно возьмет тебя.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_04");	//Но важно, чтобы с этим были согласны другие мастера. Таков обычай Хориниса.
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Я могу стать учеником мастера-лучника Боспера, кузнеца Гарада, плотника Торбена или алхимика Константино.");
	b_logentry(TOPIC_LEHRLING,"Прежде чем я стану учеником, я должен получить одобрение других мастеров.");
};


instance DIA_MATTEO_WIEZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 5;
	condition = dia_matteo_wiezustimmung_condition;
	information = dia_matteo_wiezustimmung_info;
	permanent = FALSE;
	description = "Как мне получить одобрение других мастеров?";
};


func int dia_matteo_wiezustimmung_condition()
{
	if((Npc_KnowsInfo(other,dia_matteo_woalslehrling) || Npc_KnowsInfo(other,dia_matteo_warumnichtbeidir)) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_wiezustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_WieZustimmung_15_00");	//Как мне получить одобрение других мастеров?
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_01");	//Ты просто должен убедить их. Иди и поговори с ними.
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_02");	//Но если хотя бы двое из них будут против тебя, тебе не поступить в ученики! Так что постарайся понравиться им!
	b_logentry(TOPIC_LEHRLING,"Я смогу получить одобрение мастеров, только если я проявлю себя с лучшей стороны перед ними.");
};


instance DIA_MATTEO_WARUMNICHTBEIDIR(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_warumnichtbeidir_condition;
	information = dia_matteo_warumnichtbeidir_info;
	permanent = FALSE;
	description = "А почему ТЫ не возьмешь меня в ученики?";
};


func int dia_matteo_warumnichtbeidir_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_warumnichtbeidir_info()
{
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_15_00");	//А почему ТЫ не возьмешь меня в ученики?
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_01");	//Я бы взял - но другие мастера не согласятся.
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_02");	//Я только недавно взял еще одного ученика.
};


instance DIA_MATTEO_OTHERWAY(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_otherway_condition;
	information = dia_matteo_otherway_info;
	permanent = FALSE;
	description = "А есть другой способ попасть в верхний квартал?";
};


func int dia_matteo_otherway_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_otherway_info()
{
	AI_Output(other,self,"DIA_Matteo_OtherWay_15_00");	//А есть другой способ попасть в верхний квартал?
	AI_Output(self,other,"DIA_Matteo_OtherWay_09_01");	//Возможно... если я что-нибудь придумаю, я дам тебе знать.
};


instance DIA_MATTEO_MINENANTEIL(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_minenanteil_condition;
	information = dia_matteo_minenanteil_info;
	description = "У тебя среди других товаров есть и акции горнодобывающей компании.";
};


func int dia_matteo_minenanteil_condition()
{
	if((other.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};

func void dia_matteo_minenanteil_info()
{
	AI_Output(other,self,"DIA_Matteo_Minenanteil_15_00");	//Я вижу, у тебя среди других товаров есть и акции горнодобывающей компании. Кто продал их тебе?
	AI_Output(self,other,"DIA_Matteo_Minenanteil_09_01");	//(нервно) Акции? Ох. И откуда они взялись? Понятия не имею, где я взял их. Клянусь, ваша честь.
	b_giveplayerxp(XP_AMBIENT);
};

