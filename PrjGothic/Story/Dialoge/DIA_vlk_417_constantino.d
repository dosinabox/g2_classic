
instance DIA_CONSTANTINO_EXIT(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 999;
	condition = dia_constantino_exit_condition;
	information = dia_constantino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_constantino_exit_condition()
{
	return TRUE;
};

func void dia_constantino_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CONSTANTINO_PICKPOCKET(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 900;
	condition = dia_constantino_pickpocket_condition;
	information = dia_constantino_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_constantino_pickpocket_condition()
{
	return c_beklauen(59,90);
};

func void dia_constantino_pickpocket_info()
{
	Info_ClearChoices(dia_constantino_pickpocket);
	Info_AddChoice(dia_constantino_pickpocket,DIALOG_BACK,dia_constantino_pickpocket_back);
	Info_AddChoice(dia_constantino_pickpocket,DIALOG_PICKPOCKET,dia_constantino_pickpocket_doit);
};

func void dia_constantino_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_constantino_pickpocket);
};

func void dia_constantino_pickpocket_back()
{
	Info_ClearChoices(dia_constantino_pickpocket);
};


instance DIA_CONSTANTINO_HALLO(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_hallo_condition;
	information = dia_constantino_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_constantino_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_constantino_hallo_info()
{
	AI_Output(self,other,"DIA_Constantino_Hallo_10_00");	//Что тебе нужно? Бесплатного здесь ничего нет, и продавать тебе я тоже ничего не собираюсь.
};


instance DIA_CONSTANTINO_ABOUTLEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_aboutlehrling_condition;
	information = dia_constantino_aboutlehrling_info;
	permanent = FALSE;
	description = "Я хочу поступить в ученики.";
};


func int dia_constantino_aboutlehrling_condition()
{
	return TRUE;
};

func void dia_constantino_aboutlehrling_info()
{
	AI_Output(other,self,"DIA_Constantino_AboutLehrling_15_00");	//Я хочу поступить в ученики.
	AI_Output(self,other,"DIA_Constantino_AboutLehrling_10_01");	//Правда? И чьим учеником ты хочешь стать?
};


instance DIA_CONSTANTINO_HEILUNG(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 5;
	condition = dia_constantino_heilung_condition;
	information = dia_constantino_heilung_info;
	permanent = FALSE;
	description = "Мне нужно лечение.";
};


func int dia_constantino_heilung_condition()
{
	return TRUE;
};

func void dia_constantino_heilung_info()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_15_00");	//Мне нужно лечение.
	AI_Output(self,other,"DIA_Constantino_Heilung_10_01");	//(коротко) Зачем, ты ранен?
	Info_ClearChoices(dia_constantino_heilung);
	Info_AddChoice(dia_constantino_heilung,"В общем-то, нет.",dia_constantino_heilung_nein);
	Info_AddChoice(dia_constantino_heilung,"Да.",dia_constantino_heilung_ja);
};

func void dia_constantino_heilung_ja()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Ja_15_00");	//Да.
	if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_01");	//Тогда иди к Ватрасу, он подлечит тебя. И перестань капать кровью на мой пол!
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_02");	//У тебя всего лишь пустяковая царапина, а у меня есть дела поважнее, чем болтать с тобой.
	};
	AI_StopProcessInfos(self);
};

func void dia_constantino_heilung_nein()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Nein_15_00");	//В общем-то, нет.
	AI_Output(self,other,"DIA_Constantino_Heilung_Nein_10_01");	//Тогда проваливай, а то тебе действительно понадобится медицинская помощь.
	AI_StopProcessInfos(self);
};


instance DIA_CONSTANTINO_TRADE(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 700;
	condition = dia_constantino_trade_condition;
	information = dia_constantino_trade_info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};


func int dia_constantino_trade_condition()
{
	return TRUE;
};

func void dia_constantino_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Constantino_Trade_15_00");	//Покажи мне свои товары.
	if(CONSTANTINO_LOGPATCH1 == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Константино продает алхимические товары.");
		CONSTANTINO_LOGPATCH1 = TRUE;
	};
};


instance DIA_CONSTANTINO_BEIDIR(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_beidir_condition;
	information = dia_constantino_beidir_info;
	permanent = FALSE;
	description = "Я хочу стать твоим учеником.";
};


func int dia_constantino_beidir_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aboutlehrling) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_beidir_info()
{
	AI_Output(other,self,"DIA_Constantino_BeiDir_15_00");	//Я хочу стать твоим учеником.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_01");	//МОИМ? Нет! Я уже как-то имел сомнительное удовольствие взять ученика. С меня достаточно.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_02");	//Я потратил несколько лет на его обучение, а потом этот идиот взял и отравился.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_03");	//Иди лучше попросись в ученики к другому мастеру!
};


instance DIA_CONSTANTINO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_zustimmung_condition;
	information = dia_constantino_zustimmung_info;
	permanent = TRUE;
	description = "Я хочу стать учеником одного из других мастеров.";
};


func int dia_constantino_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aboutlehrling) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_zustimmung_info()
{
	AI_Output(other,self,"DIA_Constantino_ZUSTIMMUNG_15_00");	//Я хочу стать учеником одного из других мастеров.
	AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_01");	//Ты пришел получить мое одобрение?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_02");	//Хм - что касается моего мнения, ты можешь стать учеником любого мастера.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_03");	//Ты его не получишь! То, что я слышал о тебе, говорит не в твою пользу.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_04");	//Я не проголосую за то, чтобы преступник вроде тебя занял уважаемое положение в этом городе.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_05");	//Пока ты не уладишь этот вопрос с командующим городской стражей, мой ответ будет - нет!
	};
	if(CONSTANTINO_LOGPATCH2 == FALSE)
	{
		Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
		b_logentry(TOPIC_LEHRLING,"Константино даст мне свое одобрение, если я не обвиняюсь ни в одном преступлении в городе.");
		CONSTANTINO_LOGPATCH2 = TRUE;
	};
};


instance DIA_CONSTANTINO_BRINGHERBS(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_bringherbs_condition;
	information = dia_constantino_bringherbs_info;
	permanent = FALSE;
	description = "Что мне нужно сделать, чтобы стать ТВОИМ учеником?";
};


func int dia_constantino_bringherbs_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_beidir) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_bringherbs_info()
{
	AI_Output(other,self,"DIA_Constantino_BringHerbs_15_00");	//Что мне нужно сделать, чтобы стать ТВОИМ учеником?
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_01");	//(вздыхает) Я не вынесу, если ЕЩЕ ОДИН дилетант окажется на моей совести.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_02");	//В алхимии используется множество трав. В различных комбинациях они дают самые различные эффекты.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_03");	//Вероятно, о половине этих трав ты даже не слышал.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_04");	//(вздыхает) Вот - это список самых важных растений.
	b_giveinvitems(self,other,itwr_kraeuterliste,1);
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_05");	//Принеси мне одно растение каждого вида, и, возможно, я переменю свое мнение насчет ученика.
	MIS_CONSTANTINO_BRINGHERBS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CONSTANTINOPLANTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CONSTANTINOPLANTS,LOG_RUNNING);
	b_logentry(TOPIC_CONSTANTINOPLANTS,"Константино хочет получить по одному экземпляру каждого растения, иначе он не примет меня в ученики.");
};


instance DIA_CONSTANTINO_HERBSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_herbsrunning_condition;
	information = dia_constantino_herbsrunning_info;
	permanent = TRUE;
	description = "Насчет растений...";
};


func int dia_constantino_herbsrunning_condition()
{
	if(MIS_CONSTANTINO_BRINGHERBS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_constantino_herbsrunning_info()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_15_00");	//Насчет растений...
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_10_01");	//Если ты не можешь выполнить это задание самостоятельно, из тебя не получится хорошего алхимика!
	Info_ClearChoices(dia_constantino_herbsrunning);
	Info_AddChoice(dia_constantino_herbsrunning,"Понимаю.",dia_constantino_herbsrunning_running);
	if((Npc_HasItems(other,itpl_mana_herb_01) > 0) && (Npc_HasItems(other,itpl_mana_herb_02) > 0) && (Npc_HasItems(other,itpl_mana_herb_03) > 0) && (Npc_HasItems(other,itpl_health_herb_01) > 0) && (Npc_HasItems(other,itpl_health_herb_02) > 0) && (Npc_HasItems(other,itpl_health_herb_03) > 0) && (Npc_HasItems(other,itpl_dex_herb_01) > 0) && (Npc_HasItems(other,itpl_strength_herb_01) > 0) && (Npc_HasItems(other,itpl_speed_herb_01) > 0) && (Npc_HasItems(other,itpl_temp_herb) > 0) && (Npc_HasItems(other,itpl_perm_herb) > 0))
	{
		Info_AddChoice(dia_constantino_herbsrunning,"Я принес все растения, что ты просил!",dia_constantino_herbsrunning_success);
	};
};

func void dia_constantino_herbsrunning_success()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Success_15_00");	//Я принес все растения, что ты просил!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_01");	//Что? Ты пытаешься обмануть меня, да?
	b_giveinvitems(other,self,itpl_mana_herb_01,1);
	b_giveinvitems(other,self,itpl_mana_herb_02,1);
	b_giveinvitems(other,self,itpl_mana_herb_03,1);
	b_giveinvitems(other,self,itpl_health_herb_01,1);
	b_giveinvitems(other,self,itpl_health_herb_02,1);
	b_giveinvitems(other,self,itpl_health_herb_03,1);
	b_giveinvitems(other,self,itpl_dex_herb_01,1);
	b_giveinvitems(other,self,itpl_strength_herb_01,1);
	b_giveinvitems(other,self,itpl_speed_herb_01,1);
	b_giveinvitems(other,self,itpl_temp_herb,1);
	b_giveinvitems(other,self,itpl_perm_herb,1);
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_02");	//Клянусь Аданосом! Они все здесь, у меня перед глазами!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_03");	//Кто знает, может, когда-нибудь из тебя действительно получится приличный алхимик.
	MIS_CONSTANTINO_BRINGHERBS = LOG_SUCCESS;
	b_giveplayerxp(XP_CONSTANTINO_HERBS);
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Константино примет меня в ученики, если другие мастера будут не против.");
	Info_ClearChoices(dia_constantino_herbsrunning);
};

func void dia_constantino_herbsrunning_running()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Running_15_00");	//Понимаю.
	Info_ClearChoices(dia_constantino_herbsrunning);
};


var int constantino_startguild;

instance DIA_CONSTANTINO_LEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_lehrling_condition;
	information = dia_constantino_lehrling_info;
	permanent = TRUE;
	description = "Могу я теперь стать твоим учеником?";
};


func int dia_constantino_lehrling_condition()
{
	if((MIS_CONSTANTINO_BRINGHERBS == LOG_SUCCESS) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Constantino_LEHRLING_15_00");	//Могу я теперь стать твоим учеником?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_01");	//Что касается моего мнения - да.
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_02");	//Гараду важно только, чтобы ты был способен защищать город в случае нападения орков.
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_03");	//И, похоже, ты смог убедить его в этом.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_04");	//Но он считает, что ты трус.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_05");	//Но Гарад утверждает, что никогда тебя не видел.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_06");	//Боспер очень неохотно отзывался о твоих способностях.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_07");	//Я полагаю, что он хотел бы взять тебя в ученики сам.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_08");	//Но все же, в конце концов, он согласился.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_09");	//Отказывать кому-либо в одобрении по этой причине, определенно, недостойно настоящего мастера!
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_10");	//Но если все другие мастера согласятся, тебе не понадобится его голос.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_11");	//И Боспер пока тебя не видел.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_12");	//Торбен - очень религиозный человек.
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_13");	//Он дал тебе свое благословение. Это хороший знак.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_14");	//Он даст свое одобрение только с благословения богов.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_15");	//Торбен не знает, кто ты такой.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_16");	//Что касается Маттео - он расхваливает тебя на каждом углу.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_17");	//Маттео говорит, что ты что-то должен ему. Если ты хочешь получить его голос, тебе лучше решить с ним эту мелкую проблему.
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_18");	//Маттео говорит, что еще не разговаривал с тобой по этому поводу.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_19");	//Маттео говорит, что никогда не видел тебя в своей лавке.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_20");	//Это означает, что ты получил одобрение всех мастеров!
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_21");	//Теперь у тебя есть одобрение четырех мастеров. Этого достаточно, чтобы быть принятым в ученики.
			};
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_22");	//Ты готов приступить к обучению у меня?
			Info_ClearChoices(dia_constantino_lehrling);
			Info_AddChoice(dia_constantino_lehrling,"Мне нужно сначала подумать.",dia_constantino_lehrling_later);
			Info_AddChoice(dia_constantino_lehrling,"Да, мастер.",dia_constantino_lehrling_yes);
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_23");	//Чтобы стать учеником в нижней части города, тебе нужно получить одобрение, по крайней мере, четырех мастеров.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_24");	//Это означает, что ты должен поговорить со всеми, кто еще не отдал за тебя свой голос.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_25");	//(сердито) Ни за что! До меня дошли слухи, что ты обвиняешься в преступлении здесь, в Хоринисе!
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_26");	//Я не возьму тебя в ученики, пока ты не уладишь этот вопрос с командующим городской стражи.
	};
};

func void dia_constantino_lehrling_yes()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Yes_15_00");	//Да, мастер.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_01");	//(вздыхает) Хорошо! Надеюсь, я не пожалею об этом решении.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_02");	//С этого момента, ты можешь считать себя моим учеником.
	PLAYER_ISAPPRENTICE = APP_CONSTANTINO;
	ApprenticeGoldCounter = 0;
	CONSTANTINO_STARTGUILD = other.guild;
	CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("alchemist",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_BONUS,"Константино принял меня в ученики. Теперь я смогу попасть в верхний квартал.");
	Info_ClearChoices(dia_constantino_lehrling);
};

func void dia_constantino_lehrling_later()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Later_15_00");	//Мне нужно сначала подумать.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Later_10_01");	//Хорошо! Если ты не сможешь отдать этому делу свое сердце, тебе лучше выбрать другую профессию.
	Info_ClearChoices(dia_constantino_lehrling);
};


var int constantino_milkommentar;
var int constantino_innoskommentar;

instance DIA_CONSTANTINO_ALSLEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_alslehrling_condition;
	information = dia_constantino_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_constantino_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_CONSTANTINO) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_constantino_alslehrling_info()
{
	if(b_getgreatestpetzcrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_00");	//(сердито) Я отказываюсь обучать тебя, пока ты обвиняешься в преступлении в городе.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_01");	//Или к лорду Андрэ и уладь этот вопрос с ним.
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_MIL) && (CONSTANTINO_STARTGUILD != GIL_MIL) && (CONSTANTINO_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_02");	//Так ты поступил в ополчение? Я уже слышал об этом.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_03");	//Ты так торопился стать учеником, а затем вот так просто взял и поступил в ополчение? Но я не стану делать тебе скидку на это.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_04");	//Я ожидаю, что ты будешь строго придерживаться нашего соглашения, и будешь регулярно приносить мне растения и грибы.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_05");	//Если это слишком тяжело для тебя - работать на двух работах одновременно, тебе просто придется меньше спать!
		CONSTANTINO_MILKOMMENTAR = TRUE;
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL)) && (CONSTANTINO_STARTGUILD != GIL_NOV) && (CONSTANTINO_STARTGUILD != GIL_KDF) && (CONSTANTINO_STARTGUILD != GIL_PAL) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_06");	//Я вижу, ты поступил в услужение к Инносу. Я полагаю, это значит, что с этого времени ты не сможешь уделять много внимания сбору трав для старика.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_07");	//Но все же, я сочту за большую честь поддерживать тебя на твоем пути.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_08");	//И если, несмотря на твои новые обязанности, ты найдешь время заниматься алхимией, ты всегда можешь рассчитывать на теплый прием здесь.
		CONSTANTINO_INNOSKOMMENTAR = TRUE;
	}
	else if((CONSTANTINO_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_09");	//Где ты пропадал?
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_10");	//Я ожидаю от моего ученика большего усердия. Это никуда не годится, что ты появляешься здесь раз в месяц!
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_11");	//Ты хотя бы принес мне грибы?
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_12");	//Опять ты...
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_CONSTANTINO_AUFGABEN(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_aufgaben_condition;
	information = dia_constantino_aufgaben_info;
	permanent = FALSE;
	description = "Каковы мои задачи?";
};


func int dia_constantino_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
	{
		return TRUE;
	};
};

func void dia_constantino_aufgaben_info()
{
	AI_Output(other,self,"DIA_Constantino_Aufgaben_15_00");	//Каковы мои задачи?
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_01");	//Я понимаю, что не могу ожидать от молодого человека, что он будет проводить дни напролет вместе со мной в этой каморке.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_02");	//Время от времени ты должен приносить растения, которые мне необходимы. Взамен, я буду обучать тебя искусству алхимии.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_03");	//Ты можешь покупать у меня пробирки. Но большинство ингредиентов, впрочем, тебе придется добывать самому.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_04");	//И я ожидаю, что ты будешь вести себя как добропорядочный гражданин этого города.
};


instance DIA_CONSTANTINO_MUSHROOMS(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushrooms_condition;
	information = dia_constantino_mushrooms_info;
	permanent = FALSE;
	description = "Какие растения я должен приносить?";
};


func int dia_constantino_mushrooms_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aufgaben))
	{
		return TRUE;
	};
};

func void dia_constantino_mushrooms_info()
{
	AI_Output(other,self,"DIA_Constantino_Mushrooms_15_00");	//Какие растения я должен приносить?
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_01");	//Я буду покупать все, что ты принесешь мне - и буду платить за травы обычную цену.
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_02");	//Но что касается грибов, для них у меня особая цена.
	MIS_CONSTANTINO_MUSHROOMS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"Я могу продавать грибы Константино по очень хорошей цене.");
};


instance DIA_CONSTANTINO_MUSHROOMSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushroomsrunning_condition;
	information = dia_constantino_mushroomsrunning_info;
	permanent = TRUE;
	description = "Тебе нужны были грибы...";
};


func int dia_constantino_mushroomsrunning_condition()
{
	if(MIS_CONSTANTINO_MUSHROOMS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_constantino_mushroomsrunning_info()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_15_00");	//Тебе нужны были грибы...
	Info_ClearChoices(dia_constantino_mushroomsrunning);
	Info_AddChoice(dia_constantino_mushroomsrunning,"Я собираюсь принести тебе их...",dia_constantino_mushroomsrunning_later);
	if(PLAYER_KNOWSDUNKELPILZBONUS == FALSE)
	{
		Info_AddChoice(dia_constantino_mushroomsrunning,"Почему эти грибы так важны?",dia_constantino_mushroomsrunning_why);
	};
	if((Npc_HasItems(other,itpl_mushroom_01) > 0) || (Npc_HasItems(other,itpl_mushroom_02) > 0))
	{
		Info_AddChoice(dia_constantino_mushroomsrunning,"Я принес несколько ...",dia_constantino_mushroomsrunning_sell);
	};
};

func void dia_constantino_mushroomsrunning_sell()
{
	var int Mushroom1_Count;
	var int Mushroom2_Count;
	var int dunkelpilz_dabei;
	dunkelpilz_dabei = FALSE;
	if(Npc_HasItems(other,itpl_mushroom_01))
	{
		Mushroom1_Count = Npc_HasItems(other,itpl_mushroom_01);
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_00");	//Я принес несколько черных грибов...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_01");	//Ах! Это лучшие грибы! Отлично! Вот твое золото!
		dunkelpilz_dabei = TRUE;
		CONSTANTINO_DUNKELPILZCOUNTER += Mushroom1_Count;
		ApprenticeGoldCounter += Mushroom1_Count * VALUE_MUSHROOM_01;
		b_giveinvitems(self,other,itmi_gold,Mushroom1_Count * VALUE_MUSHROOM_01);
		b_giveinvitems(other,self,itpl_mushroom_01,Mushroom1_Count);
	};
	if(Npc_HasItems(other,itpl_mushroom_02) > 0)
	{
		Mushroom2_Count = Npc_HasItems(other,itpl_mushroom_02);
		if(dunkelpilz_dabei == TRUE)
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_02");	//А вот еще другие...
		}
		else
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_03");	//У меня здесь несколько грибов!
		};
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_04");	//Эти не так хороши, как черные грибы, но я все равно возьму их.
		Constantino_BigMushroomsCounter += Mushroom2_Count;
		ApprenticeGoldCounter += Mushroom2_Count * VALUE_MUSHROOM_02;
		b_giveinvitems(self,other,itmi_gold,Mushroom2_Count * VALUE_MUSHROOM_02);
		b_giveinvitems(other,self,itpl_mushroom_02,Mushroom2_Count);
	};
	Info_ClearChoices(dia_constantino_mushroomsrunning);
};

func void dia_constantino_mushroomsrunning_why()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_00");	//Почему эти грибы так важны?
	if(CONSTANTINO_DUNKELPILZCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_01");	//Даже несмотря на то, что ты мой ученик, я не могу сказать тебе все.
	}
	else if(CONSTANTINO_DUNKELPILZCOUNTER >= 50)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_02");	//Хорошо - я все же скажу тебе. Но ты должен сохранить это в тайне.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_03");	//Черные грибы полны магической энергии. И каждый раз, когда ты съедаешь такой гриб, немного этой энергии аккумулируется твоим телом.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_04");	//А когда ты съешь достаточное количество этих грибов, твоя магическая энергия возрастет...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_05");	//Если бы я сказал тебе это ранее, ты бы слопал все эти грибы сам, разве нет?
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_06");	//(вздыхает) Ох!
		PLAYER_KNOWSDUNKELPILZBONUS = TRUE;
		Info_ClearChoices(dia_constantino_mushroomsrunning);
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_07");	//Ты уже спрашивал меня об этом. (озорно) Кто знает, может быть однажды я действительно скажу тебе...
	};
};

func void dia_constantino_mushroomsrunning_later()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Later_15_00");	//Я собираюсь принести тебе их...
	AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Later_10_01");	//Отлично! Принеси мне все, что только найдешь...
	Info_ClearChoices(dia_constantino_mushroomsrunning);
};


instance DIA_CONSTANTINO_ALCHEMY(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_alchemy_condition;
	information = dia_constantino_alchemy_info;
	permanent = FALSE;
	description = "Обучи меня искусству алхимии!";
};


func int dia_constantino_alchemy_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
	{
		return TRUE;
	};
};

func void dia_constantino_alchemy_info()
{
	AI_Output(other,self,"DIA_Constantino_Alchemy_15_00");	//Обучи меня искусству алхимии!
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//Хорошо. Сначала основы.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//Все зелья делаются из растений - они обладают различной силой.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//Но растения пускают всю свою силу в рост - а алхимия занимается изменением этой силы и направлением ее в нужное русло.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//Чтобы приготовить зелье на алхимическом столе, тебе понадобится лабораторная пробирка.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//Ты должен знать правильную формулу и иметь соответствующие ингредиенты.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//Я могу научить тебя многим таким формулам.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//Готовить зелья, восстанавливающие твою потерянную силу, и даже зелья, которые воздействуют на твою силу перманентно.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//Но нельзя выучить все сразу.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Константино может обучить меня искусству алхимии.");
};


instance DIA_CONSTANTINO_NEWRECIPES(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_newrecipes_condition;
	information = dia_constantino_newrecipes_info;
	permanent = FALSE;
	description = "Я хочу узнать новые рецепты зелий.";
};


func int dia_constantino_newrecipes_condition()
{
	if((PLAYER_ISAPPRENTICE != APP_CONSTANTINO) && (PLAYER_ISAPPRENTICE > APP_NONE) && (Npc_GetTalentSkill(other,NPC_TALENT_ALCHEMY) > 0))
	{
		return TRUE;
	};
};

func void dia_constantino_newrecipes_info()
{
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_00");	//Я хочу узнать новые рецепты зелий.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_01");	//У тебя есть какой-нибудь опыт в алхимии?
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_02");	//Да, есть.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_03");	//И ты все еще жив... это неплохой знак.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_04");	//Я думаю, что могу показать тебе несколько рецептов. Но это зависит, конечно же, от того, что ты хочешь узнать.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Константино может обучить меня искусству алхимии.");
};


instance DIA_CONSTANTINO_TEACH(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_teach_condition;
	information = dia_constantino_teach_info;
	permanent = TRUE;
	description = "Каким рецептам ты можешь обучить меня?";
};


func int dia_constantino_teach_condition()
{
	if(CONSTANTINO_TEACHALCHEMY == TRUE)
	{
		return TRUE;
	};
};

func void dia_constantino_teach_info()
{
	AI_Output(other,self,"DIA_Constantino_TEACH_15_00");	//Каким рецептам ты можешь обучить меня?
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == TRUE))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_01");	//Извини. Я больше ничему не могу научить тебя.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_02");	//Есть несколько - выбирай.
		Info_ClearChoices(dia_constantino_teach);
		Info_AddChoice(dia_constantino_teach,DIALOG_BACK,dia_constantino_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Лечебная эссенция",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_health01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Лечебный экстракт",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_health02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Лечебный эликсир",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_health03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Эликсир жизни",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_permhealth);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Эссенция маны",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_mana01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Экстракт маны",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_mana02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == FALSE) && ((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE)))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("Эликсир силы",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_permstr);
	};
};

func void dia_constantino_teach_back()
{
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health01()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health01_10_00");	//Ингредиенты для лечебной эссенции - лечебные травы и луговой горец.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_00");	//Чтобы приготовить лечебный экстракт, тебе понадобятся лечебные растения и луговой горец.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_01");	//Кипятить этот экстракт нужно очень осторожно.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health03()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_03))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_00");	//Для создания лечебного эликсира требуется чуть больше опыта.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_01");	//Тебе понадобятся лечебные корни и луговой горец. При кипячении этого зелья нужно быть особенно внимательным.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permhealth()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_00");	//Эликсир жизни! Редкое варево. Но не из-за сложности приготовления - это зелье не так уж сложно сделать.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_01");	//Но в нем используются редкие ингредиенты. Тебе понадобятся лечебные корни и царский щавель.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana01()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_00");	//Эссенция маны - самое простое из магических зелий.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_01");	//Возьми огненную крапиву и луговой горец и вскипяти их на медленном огне.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_00");	//Так как ты уже умеешь готовить эссенцию маны, если немного потренируешься, то сможешь готовить также и экстракт.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_01");	//Единственно, нужно уделить особое внимание процессу выпаривания этого зелья. В качестве ингредиентов для него используются огненная трава и луговой горец.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permstr()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_STR))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_00");	//Эликсир силы! Превосходное зелье. Для него тебе понадобятся редкий драконий корень и царский щавель.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_01");	//При кипячении этого зелья следи, чтобы пузырьки не стали слишком большими, иначе тебя будет ждать неприятный сюрприз!
	};
	Info_ClearChoices(dia_constantino_teach);
};

