
instance DIA_HAKON_EXIT(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 999;
	condition = dia_hakon_exit_condition;
	information = dia_hakon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hakon_exit_condition()
{
	return TRUE;
};

func void dia_hakon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_SPERRE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_sperre_condition;
	information = dia_hakon_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hakon_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hakon_sperre_info()
{
	AI_Output(self,other,"DIA_Hakon_Sperre_12_00");	//Проваливай, каторжник! Кантар рассказал мне, какой ты грязный ублюдок!
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_HALLO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_hallo_condition;
	information = dia_hakon_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_hakon_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hakon_hallo_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_00");	//Я Хакон, торговец оружием.
	AI_Output(self,other,"DIA_Hakon_Add_12_01");	//В наши дни каждый должен носить оружие. Особенно, когда выходишь за городские стены.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Хакон торгует оружием на рыночной площади.");
};


instance DIA_HAKON_TRADE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 99;
	condition = dia_hakon_trade_condition;
	information = dia_hakon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int dia_hakon_trade_condition()
{
	return TRUE;
};

func void dia_hakon_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Hakon_Trade_15_00");	//Покажи мне свои товары.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_01");	//Для меня большая честь, что представитель святой церкви проявил интерес к моим товарам.
	};
};


instance DIA_HAKON_OUTOFTOWN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_outoftown_condition;
	information = dia_hakon_outoftown_info;
	permanent = FALSE;
	description = "Расскажи мне подробнее о местности вокруг города.";
};


func int dia_hakon_outoftown_condition()
{
	return TRUE;
};

func void dia_hakon_outoftown_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_02");	//Расскажи мне подробнее о местности вокруг города.
	AI_Output(self,other,"DIA_Hakon_Add_12_03");	//Сейчас там стало очень опасно
	AI_Output(self,other,"DIA_Hakon_Add_12_04");	//Из-за бандитов, с одной стороны, и из-за нашествия диких зверей с другой.
	AI_Output(self,other,"DIA_Hakon_Add_12_05");	//Даже зверям, похоже, нечего есть в эти смутные времена.
	AI_Output(self,other,"DIA_Hakon_Add_12_06");	//Они стали подходить совсем близко к городу, чего раньше не было.
};


instance DIA_HAKON_PALADINE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_paladine_condition;
	information = dia_hakon_paladine_info;
	permanent = FALSE;
	description = "Ты знаешь что-нибудь о паладинах?";
};


func int dia_hakon_paladine_condition()
{
	return TRUE;
};

func void dia_hakon_paladine_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_07");	//Ты знаешь что-нибудь о паладинах?
	AI_Output(self,other,"DIA_Hakon_Add_12_08");	//Да! Они разорили меня!
	AI_Output(self,other,"DIA_Hakon_Add_12_09");	//Теперь все, что можно купить в этом городе - это короткий меч, и то в лучшем случае.
	AI_Output(self,other,"DIA_Hakon_Add_12_10");	//Они забрали себе все, что длиннее фута с половиной.
	AI_Output(self,other,"DIA_Hakon_Add_12_11");	//(с сарказмом) А взамен, теперь я могу бесплатно жить в отеле - ха!
};


instance DIA_HAKON_WOWAFFEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_wowaffen_condition;
	information = dia_hakon_wowaffen_info;
	permanent = FALSE;
	description = "Где ты берешь оружие?";
};


func int dia_hakon_wowaffen_condition()
{
	if(Npc_KnowsInfo(other,dia_hakon_paladine))
	{
		return TRUE;
	};
};

func void dia_hakon_wowaffen_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_12");	//Где ты берешь оружие?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_13");	//Нигде! Раньше моим поставщиком был Гарад.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_14");	//Раньше моим поставщиком был кузнец Гарад.
	};
	AI_Output(self,other,"DIA_Hakon_Add_12_15");	//А теперь все, что он делает, забирают паладины.
	AI_Output(self,other,"DIA_Hakon_Add_12_16");	//Он работает на этих парней днем и ночью как безумный, без какой-либо оплаты. Он думает, что это его долг.
	AI_Output(self,other,"DIA_Hakon_Add_12_17");	//Все, что я могу предложить тебе сейчас - это остатки ...
};


instance DIA_HAKON_HARADBANDITS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_haradbandits_condition;
	information = dia_hakon_haradbandits_info;
	permanent = FALSE;
	description = "Гарад рассказал мне о нападении бандитов...";
};


func int dia_hakon_haradbandits_condition()
{
	if(HARAD_HAKONMISSION == TRUE)
	{
		return TRUE;
	};
};

func void dia_hakon_haradbandits_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_18");	//Гарад рассказал мне о нападении бандитов...
	AI_Output(self,other,"DIA_Hakon_Add_12_19");	//Ох? И?
	AI_Output(other,self,"DIA_Hakon_Add_15_20");	//Он проголосует за меня при поступлении в ученики, если я уничтожу этих бандитов.
	AI_Output(self,other,"DIA_Hakon_Add_12_21");	//(смеется) Старый добрый Гарад. Возможно, он так хочет сказать мне 'извини', за то, что не может сейчас делать оружие для меня.
};


instance DIA_HAKON_BANDITEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_banditen_condition;
	information = dia_hakon_banditen_info;
	permanent = FALSE;
	description = "Что ты знаешь об этих бандитах?";
};


func int dia_hakon_banditen_condition()
{
	if(Npc_KnowsInfo(hero,dia_hakon_haradbandits) || Npc_KnowsInfo(hero,dia_hakon_outoftown))
	{
		return TRUE;
	};
};

func void dia_hakon_banditen_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_15_00");	//Что ты знаешь об этих бандитах?
	AI_Output(self,other,"DIA_Hakon_Banditen_12_01");	//Что я знаю о них? Они ограбили меня на пути в город!
	AI_Output(self,other,"DIA_Hakon_Banditen_12_02");	//И не только меня. Они давно уже здесь разбойничают.
	AI_Output(self,other,"DIA_Hakon_Banditen_12_03");	//Ополчение пыталось выследить их, но безуспешно.
	MIS_HAKONBANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HAKONBANDITEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HAKONBANDITEN,LOG_RUNNING);
	b_logentry(TOPIC_HAKONBANDITEN,"Хакон, торговец оружием, был ограблен бандитами неподалеку от города.");
};


instance DIA_HAKON_WIEVIEL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_wieviel_condition;
	information = dia_hakon_wieviel_info;
	permanent = FALSE;
	description = "Я разберусь с этим...";
};


func int dia_hakon_wieviel_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wieviel_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_Ehre_15_00");	//Я разберусь с этим...
	AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_01");	//Что, ТЫ хочешь расправиться с бандитами? В одиночку? Ты, наверное хороший боец?
	AI_Output(other,self,"DIA_Hakon_Banditen_Kohle_15_00");	//Сколько ты готов дать за это?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_25");	//(лукаво) Ты ведь хочешь быть на хорошем счету у Гарада, да?
		AI_Output(self,other,"DIA_Hakon_Add_12_26");	//Я не думаю, что должен платить тебе за это ...
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Banditen_Ehre_12_01");	//Но это опасное дело.
		AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_02");	//Ладно, мне это тоже нужно. Я заплачу тебе 100 золотых, если ты уничтожишь этих бандитов.
		MIS_HAKONBANDITSPAY = TRUE;
	};
	Info_ClearChoices(dia_hakon_banditen);
};


instance DIA_HAKON_MILIZ(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_miliz_condition;
	information = dia_hakon_miliz_info;
	permanent = FALSE;
	description = "Ты не знаешь, кто в ополчении занимался их поиском?";
};


func int dia_hakon_miliz_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_miliz_info()
{
	AI_Output(other,self,"DIA_Hakon_Miliz_15_00");	//Ты не знаешь, кто в ополчении занимался их поиском?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_01");	//Парень по имени Пабло. Он, и еще несколько парней ходили на поиски этих бандитов. Но они не нашли их.
	AI_Output(other,self,"DIA_Hakon_Miliz_15_02");	//Ты знаешь, где мне найти Пабло?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_03");	//Он патрулирует город. Ты найдешь его либо на рыночной площади, либо в нижней части города.
	b_logentry(TOPIC_HAKONBANDITEN,"Пабло, городской стражник, занимался бесплодными поисками бандитов.");
};


instance DIA_HAKON_WO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_wo_condition;
	information = dia_hakon_wo_info;
	permanent = FALSE;
	description = "Где они напали на тебя?";
};


func int dia_hakon_wo_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wo_info()
{
	AI_Output(other,self,"DIA_Hakon_Wo_15_00");	//Где они напали на тебя?
	AI_Output(self,other,"DIA_Hakon_Wo_12_01");	//Около фермы Акила. Выйдешь из вот этих городских ворот и иди по дороге направо.
	AI_Output(self,other,"DIA_Hakon_Wo_12_02");	//Вскоре ты увидишь каменную лестницу. Эти ублюдки пришли оттуда. Ручаюсь, у них там логово где-то в лесу.
};


instance DIA_HAKON_SUCCESS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_success_condition;
	information = dia_hakon_success_info;
	permanent = FALSE;
	description = "Я расправился с бандитами.";
};


func int dia_hakon_success_condition()
{
	if((MIS_HAKONBANDITS == LOG_RUNNING) && Npc_IsDead(bandit_1) && Npc_IsDead(bandit_2) && Npc_IsDead(bandit_3))
	{
		return TRUE;
	};
};

func void dia_hakon_success_info()
{
	AI_Output(other,self,"DIA_Hakon_Success_15_00");	//Я расправился с бандитами.
	AI_Output(self,other,"DIA_Hakon_Add_12_27");	//Правда? Кто-нибудь может подтвердить это. У тебя есть доказательства?
	AI_Output(other,self,"DIA_Hakon_Add_15_28");	//(вздыхает) Мне что, вернуться назад и отрезать им головы?
	AI_Output(self,other,"DIA_Hakon_Add_12_29");	//(поспешно) Нет - я не думаю, что это необходимо. Я верю тебе.
	AI_Output(self,other,"DIA_Hakon_Success_12_01");	//Ты оказал очень большую услугу всем торговцам в городе.
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_30");	//Гарад будет доволен - я надеюсь.
	};
	if(MIS_HAKONBANDITSPAY == TRUE)
	{
		AI_Output(self,other,"DIA_Hakon_Success_12_02");	//Вот деньги, как я и обещал.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	MIS_HAKONBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_HAKON_BANDITS);
};


instance DIA_HAKON_MINENANTEIL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_minenanteil_condition;
	information = dia_hakon_minenanteil_info;
	permanent = FALSE;
	description = "Где ты взял эти акции, что ты продаешь здесь?";
};


func int dia_hakon_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_hakon_minenanteil_info()
{
	AI_Output(other,self,"DIA_Hakon_Minenanteil_15_00");	//Где ты взял эти акции, что ты продаешь здесь?
	AI_Output(self,other,"DIA_Hakon_Minenanteil_12_01");	//Извини, но я не могу сказать тебе этого. Это слишком опасно для меня.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_HAKON_PICKPOCKET(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 900;
	condition = dia_hakon_pickpocket_condition;
	information = dia_hakon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_hakon_pickpocket_condition()
{
	return c_beklauen(45,65);
};

func void dia_hakon_pickpocket_info()
{
	Info_ClearChoices(dia_hakon_pickpocket);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_BACK,dia_hakon_pickpocket_back);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_PICKPOCKET,dia_hakon_pickpocket_doit);
};

func void dia_hakon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hakon_pickpocket);
};

func void dia_hakon_pickpocket_back()
{
	Info_ClearChoices(dia_hakon_pickpocket);
};


instance DIA_HAKON_KAPITEL2(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_kapitel2_condition;
	information = dia_hakon_kapitel2_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hakon_kapitel2_condition()
{
	if((KAPITEL >= 2) && (CANTHAR_SPERRE == FALSE) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_hakon_kapitel2_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_22");	//Опять ты!
	AI_Output(self,other,"DIA_Hakon_Add_12_23");	//Гарад, наконец, закончил эту свою чертову работу для паладинов.
	AI_Output(self,other,"DIA_Hakon_Add_12_24");	//Это означает, что я теперь могу предложить новое оружие. Тебе это интересно?
};

