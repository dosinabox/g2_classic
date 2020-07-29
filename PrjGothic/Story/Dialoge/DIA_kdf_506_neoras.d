
instance DIA_NEORAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap1_exit_condition;
	information = dia_neoras_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_neoras_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_HALLO(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 2;
	condition = dia_neoras_hallo_condition;
	information = dia_neoras_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_neoras_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_neoras_hallo_info()
{
	AI_Output(self,other,"DIA_Neoras_Hallo_01_00");	//Что... что-то случилось? Зачем ты беспокоишь меня? Разве ты не видишь - я провожу очень сложный эксперимент?
	AI_Output(other,self,"DIA_Neoras_Hallo_15_01");	//Я не хотел побеспокоить тебя.
	AI_Output(self,other,"DIA_Neoras_Hallo_01_02");	//Ты уже побеспокоил. (вздыхает) Ладно, говори, чего ты хочешь?
};


instance DIA_NEORAS_ARBEIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 5;
	condition = dia_neoras_arbeit_condition;
	information = dia_neoras_arbeit_info;
	permanent = FALSE;
	description = "У тебя есть работа для меня?";
};


func int dia_neoras_arbeit_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_neoras_arbeit_info()
{
	AI_Output(other,self,"DIA_Neoras_Arbeit_15_00");	//У тебя есть работа для меня?
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_01");	//Да, мне нужны травы для моих экспериментов. Мы сами выращиваем их, но у нас совсем закончилась огненная крапива.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_02");	//Семи цветков будет достаточно. Принеси мне их - ох, да, еще - я потерял рецепт магических зелий.
	AI_Output(self,other,"DIA_Neoras_Arbeit_01_03");	//Если ты найдешь его, я буду очень благодарен.
	MIS_NEORASPFLANZEN = LOG_RUNNING;
	MIS_NEORASREZEPT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_NEORASPFLANZEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEORASPFLANZEN,LOG_RUNNING);
	b_logentry(TOPIC_NEORASPFLANZEN,"Я должен принести семь кустов огненной крапивы мастеру Неорасу, алхимику.");
	Log_CreateTopic(TOPIC_NEORASREZEPT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NEORASREZEPT,LOG_RUNNING);
	b_logentry(TOPIC_NEORASREZEPT,"Мастеру Неорасу не хватает рецепта для приготовления зелий маны.");
	if(Npc_KnowsInfo(other,dia_opolos_beibringen))
	{
		b_logentry(TOPIC_NEORASREZEPT,"Это, должно быть, рецепт, на который так хочет взглянуть Ополос.");
	};
};


instance DIA_NEORAS_REZEPT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 6;
	condition = dia_neoras_rezept_condition;
	information = dia_neoras_rezept_info;
	permanent = TRUE;
	description = "Насчет рецепта...";
};


func int dia_neoras_rezept_condition()
{
	if(MIS_NEORASREZEPT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_neoras_rezept_info()
{
	AI_Output(other,self,"DIA_Neoras_Rezept_15_00");	//Насчет рецепта...
	if(b_giveinvitems(other,self,itwr_manarezept,1))
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_01");	//Я нашел его.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_02");	//Хорошо. Я боялся, что он потерян для меня навсегда.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_03");	//Вот, возьми в знак моей благодарности это магическое зелье.
		MIS_NEORASREZEPT = LOG_SUCCESS;
		b_giveplayerxp(XP_NEORASREZEPT);
		b_giveinvitems(self,other,itpo_mana_02,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Neoras_Rezept_15_04");	//Я еще не нашел его.
		AI_Output(self,other,"DIA_Neoras_Rezept_01_05");	//Ну, я все же надеюсь, что тебе удастся его найти.
	};
};


instance DIA_NEORAS_FLIEDER(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 7;
	condition = dia_neoras_flieder_condition;
	information = dia_neoras_flieder_info;
	permanent = TRUE;
	description = "Я принес тебе огненную крапиву.";
};


func int dia_neoras_flieder_condition()
{
	if(MIS_NEORASPFLANZEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_neoras_flieder_info()
{
	AI_Output(other,self,"DIA_Neoras_Flieder_15_00");	//Я принес тебе огненную крапиву.
	if(b_giveinvitems(other,self,itpl_mana_herb_01,7))
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_01");	//Превосходно, теперь я могу работать. Возьми этот свиток с заклинанием 'Кулак Ветра', надеюсь, он тебе пригодится.
		MIS_NEORASPFLANZEN = LOG_SUCCESS;
		b_giveplayerxp(XP_NEORASPFLANZEN);
		b_giveinvitems(self,other,itsc_windfist,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_Flieder_01_02");	//Ох, действительно? Но ты принес недостаточно. Мне нужно СЕМЬ экземпляров.
	};
};


instance DIA_NEORAS_TEACH(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 10;
	condition = dia_neoras_teach_condition;
	information = dia_neoras_teach_info;
	permanent = TRUE;
	description = "Могу я чему-нибудь научиться у тебя?";
};


func int dia_neoras_teach_condition()
{
	return TRUE;
};

func void dia_neoras_teach_info()
{
	AI_Output(other,self,"DIA_Neoras_TEACH_15_00");	//Могу я чему-нибудь научиться у тебя?
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_01");	//Я могу обучить тебя секретам алхимии.
		Info_ClearChoices(dia_neoras_teach);
		Info_AddChoice(dia_neoras_teach,DIALOG_BACK,dia_neoras_teach_back);
		if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Лечебная эссенция",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_neoras_teach_health_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Лечебный экстракт",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_neoras_teach_health_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Лечебный эликсир",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_neoras_teach_health_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Эликсир жизни",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_neoras_teach_perm_health);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Эссенция маны",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_neoras_teach_mana_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Экстракт маны",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_neoras_teach_mana_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Эликсир маны",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_neoras_teach_mana_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
		{
			Info_AddChoice(dia_neoras_teach,b_buildlearnstring("Эликсир духа",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_neoras_teach_perm_mana);
		};
	}
	else if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_02");	//Я не обучаю новичков. Если, однажды, ты будешь принят в Круг Огня,
		AI_Output(self,other,"DIA_Neoras_TEACH_01_03");	//тогда я покажу тебе, как создавать сильные зелья.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_TEACH_01_04");	//Я передаю свои знания только членам нашей церкви.
	};
};

func void dia_neoras_teach_back()
{
	Info_ClearChoices(dia_neoras_teach);
};

func void dia_neoras_teach_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
};

func void dia_neoras_teach_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
};

func void dia_neoras_teach_health_03()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_03);
};

func void dia_neoras_teach_perm_health()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH);
};

func void dia_neoras_teach_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
};

func void dia_neoras_teach_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
};

func void dia_neoras_teach_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
};

func void dia_neoras_teach_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
};


instance DIA_NEORAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap2_exit_condition;
	information = dia_neoras_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_neoras_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap3_exit_condition;
	information = dia_neoras_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_neoras_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_BREWPOTION(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 39;
	condition = dia_neoras_brewpotion_condition;
	information = dia_neoras_brewpotion_info;
	permanent = TRUE;
	description = "Не мог бы ты сварить мне зелье?";
};


func int dia_neoras_brewpotion_condition()
{
	if(NEORASBREWSFORYOU == FALSE)
	{
		return TRUE;
	};
};

func void dia_neoras_brewpotion_info()
{
	AI_Output(other,self,"DIA_Neoras_BrewPotion_15_00");	//Не мог бы ты сварить мне зелье?
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_01");	//Для новичка ты слишком нетерпелив. Иди, занимайся своими обязанностями.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_02");	//Ты можешь купить все, что тебе нужно, у Горакса.
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_03");	//Ты сомневаешься в моих способностях? Я могу сварить любое зелье.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_04");	//Отлично.
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_05");	//Не так быстро, сначала ты должен принести мне необходимые ингредиенты и внести скромную плату за мои труды, а также за материалы.
		AI_Output(other,self,"DIA_Neoras_BrewPotion_15_06");	//Сколько ты просишь?
		AI_Output(self,other,"DIA_Neoras_BrewPotion_01_07");	//За само приготовление я беру 10 золотых монет.
		NEORASBREWSFORYOU = TRUE;
	};
};


instance DIA_NEORAS_BREWFORME(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 39;
	condition = dia_neoras_brewforme_condition;
	information = dia_neoras_brewforme_info;
	permanent = TRUE;
	description = "Свари мне...";
};


func int dia_neoras_brewforme_condition()
{
	if(NEORASBREWSFORYOU == TRUE)
	{
		return TRUE;
	};
};

func void dia_neoras_brewforme_info()
{
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"зелье ускорения.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"экстракт маны.",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"лечебный экстракт.",dia_neoras_brewforme_health);
};

func void dia_neoras_brewforme_back()
{
	Info_ClearChoices(dia_neoras_brewforme);
};

func void dia_neoras_brewforme_speed()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_00");	//Свари мне зелье скорости.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_01");	//Хорошо, у тебя есть необходимые ингредиенты и золото?
	if((Npc_HasItems(other,itpl_speed_herb_01) >= 1) && (Npc_HasItems(other,itpl_temp_herb) >= 1) && (Npc_HasItems(other,itmi_gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Speed_15_02");	//Да, вот, держи.
		b_giveinvitems(other,self,itpl_speed_herb_01,1);
		b_giveinvitems(other,self,itpl_temp_herb,1);
		b_giveinvitems(other,self,itmi_gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_03");	//Хорошо, спасибо. Сейчас я дам тебе зелье, тебе не придется ждать долго.
		b_giveinvitems(self,other,itpo_speed,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Speed_01_04");	//У тебя нет необходимых ингредиентов. Возвращайся, когда соберешь их.
	};
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"Свари мне зелье великой скорости.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Свари мне эликсир маны.",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Свари мне лечебный эликсир.",dia_neoras_brewforme_health);
};

func void dia_neoras_brewforme_mana()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_00");	//Свари мне эликсир маны.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_01");	//Хорошо, у тебя есть необходимые ингредиенты и золото?
	if((Npc_HasItems(other,itpl_mana_herb_02) >= 2) && (Npc_HasItems(other,itpl_temp_herb) >= 1) && (Npc_HasItems(other,itmi_gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Mana_15_02");	//Да, вот, держи.
		b_giveinvitems(other,self,itpl_mana_herb_02,2);
		b_giveinvitems(other,self,itpl_temp_herb,1);
		b_giveinvitems(other,self,itmi_gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_03");	//Хорошо. Сейчас я дам тебе зелье, тебе не придется ждать долго.
		b_giveinvitems(self,other,itpo_mana_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Mana_01_04");	//У тебя нет необходимых ингредиентов. Возвращайся, когда соберешь их.
	};
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"Свари мне зелье скорости.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Свари мне эликсир маны.",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Свари мне лечебный эликсир.",dia_neoras_brewforme_health);
};

func void dia_neoras_brewforme_health()
{
	AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_00");	//Свари мне лечебный эликсир.
	AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_01");	//Хорошо, у тебя есть необходимые ингредиенты и золото?
	if((Npc_HasItems(other,itpl_health_herb_02) >= 2) && (Npc_HasItems(other,itpl_temp_herb) >= 1) && (Npc_HasItems(other,itmi_gold) >= 10))
	{
		AI_Output(other,self,"DIA_Neoras_BrewForMe_Health_15_02");	//Да, вот, держи.
		b_giveinvitems(other,self,itpl_health_herb_02,2);
		b_giveinvitems(other,self,itpl_temp_herb,1);
		b_giveinvitems(other,self,itmi_gold,10);
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_03");	//Хорошо. Сейчас я дам тебе зелье, тебе не придется ждать долго.
		b_giveinvitems(self,other,itpo_health_02,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Neoras_BrewForMe_Health_01_04");	//У тебя нет необходимых ингредиентов. Возвращайся, когда соберешь их.
	};
	Info_ClearChoices(dia_neoras_brewforme);
	Info_AddChoice(dia_neoras_brewforme,DIALOG_BACK,dia_neoras_brewforme_back);
	Info_AddChoice(dia_neoras_brewforme,"Свари мне зелье скорости.",dia_neoras_brewforme_speed);
	Info_AddChoice(dia_neoras_brewforme,"Свари мне эликсир маны.",dia_neoras_brewforme_mana);
	Info_AddChoice(dia_neoras_brewforme,"Свари мне лечебный эликсир.",dia_neoras_brewforme_health);
};


instance DIA_NEORAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap4_exit_condition;
	information = dia_neoras_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_neoras_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_DRACHENEIER(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 40;
	condition = dia_neoras_dracheneier_condition;
	information = dia_neoras_dracheneier_info;
	permanent = TRUE;
	description = "Ты так усердно работаешь, что даже вспотел.";
};


func int dia_neoras_dracheneier_condition()
{
	if((KAPITEL >= 4) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_NEORAS_DRAGONEGG == 0))
	{
		return TRUE;
	};
};

func void dia_neoras_dracheneier_info()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_15_00");	//Ты так усердно работаешь, что даже вспотел.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_01_01");	//Да, я полностью истощен. Уже несколько дней я пытаюсь приготовить это чертово зелье. И ничего не получается.
	Info_ClearChoices(dia_neoras_dracheneier);
	Info_AddChoice(dia_neoras_dracheneier,"Это не мои проблемы.",dia_neoras_dracheneier_no);
	Info_AddChoice(dia_neoras_dracheneier,"А что это должно быть за зелье?",dia_neoras_dracheneier_trank);
	Info_AddChoice(dia_neoras_dracheneier,"В чем проблема?",dia_neoras_dracheneier_ei);
};

func void dia_neoras_dracheneier_ei()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_15_00");	//А в чем проблема?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_01");	//В рецепте говорится что-то о яйце дракона. Конечно же, у меня его нет.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_02");	//Поэтому я пытался заменить этот ингредиент. Однако пока все тщетно.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_01_03");	//Если однажды, в какой-нибудь пещере, ты наткнешься на одну из таких штук, пожалуйста, не забудь обо мне.
	Info_AddChoice(dia_neoras_dracheneier,"А что ты используешь вместо драконьего яйца?",dia_neoras_dracheneier_ei_statt);
	Info_AddChoice(dia_neoras_dracheneier,"Я попробую.",dia_neoras_dracheneier_ei_jep);
};

func void dia_neoras_dracheneier_ei_jep()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_00");	//Я попробую что-рибудь сделать.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_jep_01_01");	//Эй. Я просто пошутил. Я не верю, что тебе действительно удастся найти яйцо дракона.
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_jep_15_02");	//Давай лучше подождем.
	Info_ClearChoices(dia_neoras_dracheneier);
	Log_CreateTopic(TOPIC_DRACHENEIERNEORAS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNEORAS,LOG_RUNNING);
	b_logentry(TOPIC_DRACHENEIERNEORAS,"Неорасу для экспериментов нужно драконье яйцо. Он думает, что, возможно я смогу найти его в какой-нибудь пещере.");
	MIS_NEORAS_DRAGONEGG = LOG_RUNNING;
};

func void dia_neoras_dracheneier_ei_statt()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_ei_statt_15_00");	//А что ты используешь вместо драконьего яйца?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_ei_statt_01_01");	//Поверь мне, тебе лучше не знать.
};

func void dia_neoras_dracheneier_trank()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_trank_15_00");	//А что это должно быть за зелье?
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_01");	//Я купил этот рецепт у странствующего торговца. В нем говорится о довольно странных, но очень интересных вещах.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_trank_01_02");	//Я не уверен, делает ли это зелье вообще что-нибудь, но жажда знаний заставляет меня продолжать этот эксперимент.
};

func void dia_neoras_dracheneier_no()
{
	AI_Output(other,self,"DIA_Neoras_DRACHENEIER_no_15_00");	//Меня эта проблема не касается.
	AI_Output(self,other,"DIA_Neoras_DRACHENEIER_no_01_01");	//Тогда, пожалуйста, не беспокой меня больше.
	Info_ClearChoices(dia_neoras_dracheneier);
};


instance DIA_NEORAS_FOUNDDRAGONEGG(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 3;
	condition = dia_neoras_founddragonegg_condition;
	information = dia_neoras_founddragonegg_info;
	description = "Вот, я нашел для тебя яйцо дракона.";
};


func int dia_neoras_founddragonegg_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis) && (MIS_NEORAS_DRAGONEGG == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int neoras_dragoneggdrink_day;

func void dia_neoras_founddragonegg_info()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_00");	//Вот, я нашел для тебя яйцо дракона.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_01");	//Ты издеваешься надо мной.
	b_giveinvitems(other,self,itat_dragonegg_mis,1);
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_02");	//Оно настоящее! Я даже не думал, что это возможно. Где ты нашел его?
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_15_03");	//Тебе этого лучше не знать.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_01_04");	//Превосходно. Что ты хочешь за него?
	MIS_NEORAS_DRAGONEGG = LOG_SUCCESS;
	b_giveplayerxp(XP_NEORAS_DRAGONEGG);
	Info_ClearChoices(dia_neoras_founddragonegg);
	Info_AddChoice(dia_neoras_founddragonegg,"Даже не знаю.",dia_neoras_founddragonegg_irgendwas);
	Info_AddChoice(dia_neoras_founddragonegg,"Как насчет нескольких лечебных зелий?",dia_neoras_founddragonegg_heil);
	Info_AddChoice(dia_neoras_founddragonegg,"Дай мне немного этого зелья, когда оно будет готово.",dia_neoras_founddragonegg_trank);
};


var int neoras_scwantsdragoneggdrink;

func void dia_neoras_founddragonegg_trank()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_trank_15_00");	//Дай мне немного этого зелья, когда оно будет готово.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_01");	//Хорошо. Но, как я уже сказал, я понятия не имею, как оно действует.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_trank_01_02");	//Зайди попозже, когда я закончу его.
	NEORAS_DRAGONEGGDRINK_DAY = Wld_GetDay();
	NEORAS_SCWANTSDRAGONEGGDRINK = TRUE;
	Info_ClearChoices(dia_neoras_founddragonegg);
};

func void dia_neoras_founddragonegg_heil()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_heil_15_00");	//Как насчет нескольких лечебных зелий?
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_heil_01_01");	//Хороший выбор. Вот, держи. Надеюсь, они тебе пригодятся.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	Info_ClearChoices(dia_neoras_founddragonegg);
};

func void dia_neoras_founddragonegg_irgendwas()
{
	AI_Output(other,self,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00");	//Даже не знаю.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01");	//Ммм. Хорошо. Тогда возьми это магическое кольцо. Я уверен, оно поможет тебе в сражении с твоими врагами.
	AI_Output(self,other,"DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02");	//Оно защитит тебя от атак магических созданий.
	CreateInvItems(self,itri_prot_mage_02,1);
	b_giveinvitems(self,other,itri_prot_mage_02,1);
	Info_ClearChoices(dia_neoras_founddragonegg);
};


instance DIA_NEORAS_DRAGONEGGDRINK(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 3;
	condition = dia_neoras_dragoneggdrink_condition;
	information = dia_neoras_dragoneggdrink_info;
	description = "Я пришел получить это загадочное зелье из яйца дракона.";
};


func int dia_neoras_dragoneggdrink_condition()
{
	if((NEORAS_DRAGONEGGDRINK_DAY <= (Wld_GetDay() - 2)) && (NEORAS_SCWANTSDRAGONEGGDRINK == TRUE))
	{
		return TRUE;
	};
};

func void dia_neoras_dragoneggdrink_info()
{
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_00");	//Я пришел получить это загадочное зелье из яйца дракона.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_01");	//Да. Я только что закончил его. Я еще не испытывал его и не несу никакой ответственности за его действие. Ты слышишь?
	AI_Output(other,self,"DIA_Neoras_DRAGONEGGDRINK_15_02");	//Давай его сюда.
	AI_Output(self,other,"DIA_Neoras_DRAGONEGGDRINK_01_03");	//Хорошо. Надеюсь, это пойло не заставит твою голову взорваться.
	CreateInvItems(self,itpo_dragoneggdrinkneoras_mis,1);
	b_giveinvitems(self,other,itpo_dragoneggdrinkneoras_mis,1);
};


instance DIA_NEORAS_USEDDRAGONEGGDRINK(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 3;
	condition = dia_neoras_useddragoneggdrink_condition;
	information = dia_neoras_useddragoneggdrink_info;
	description = "Я попробовал твое зелье из яйца дракона. Отличная штука!";
};


func int dia_neoras_useddragoneggdrink_condition()
{
	if(NEORAS_SCUSEDDRAGONEGGDRINK == TRUE)
	{
		return TRUE;
	};
};

func void dia_neoras_useddragoneggdrink_info()
{
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_00");	//Я попробовал твое зелье из яйца дракона. Отличная штука!
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_01");	//Ммм. Очень интересно. Я должен продолжить свои исследования.
	AI_Output(other,self,"DIA_Neoras_USEDDRAGONEGGDRINK_15_02");	//Ты не мог бы сделать мне еще?
	AI_Output(self,other,"DIA_Neoras_USEDDRAGONEGGDRINK_01_03");	//Будет лучше, если мы повторим это через несколько недель. Иначе, боюсь, у тебя могут вырасти рога.
};


instance DIA_NEORAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 999;
	condition = dia_neoras_kap5_exit_condition;
	information = dia_neoras_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_neoras_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_neoras_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_PICKPOCKET(C_INFO)
{
	npc = kdf_506_neoras;
	nr = 900;
	condition = dia_neoras_pickpocket_condition;
	information = dia_neoras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_neoras_pickpocket_condition()
{
	return c_beklauen(72,140);
};

func void dia_neoras_pickpocket_info()
{
	Info_ClearChoices(dia_neoras_pickpocket);
	Info_AddChoice(dia_neoras_pickpocket,DIALOG_BACK,dia_neoras_pickpocket_back);
	Info_AddChoice(dia_neoras_pickpocket,DIALOG_PICKPOCKET,dia_neoras_pickpocket_doit);
};

func void dia_neoras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_neoras_pickpocket);
};

func void dia_neoras_pickpocket_back()
{
	Info_ClearChoices(dia_neoras_pickpocket);
};

