
instance DIA_HILDA_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_exit_condition;
	information = dia_hilda_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_hilda_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_HALLO(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_hallo_condition;
	information = dia_hilda_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hilda_hallo_condition()
{
	if((MIS_LOBART_RUEBEN != LOG_SUCCESS) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_hallo_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_00");	//Эй, тебя сюда звали? Немедленно убирайся из моего дома. Здесь не подают милостыню.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_01");	//Да, что еще?
	};
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_WASZUESSEN(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_waszuessen_condition;
	information = dia_hilda_waszuessen_info;
	permanent = TRUE;
	description = "Ты дашь мне что-нибудь поесть?";
};


func int dia_hilda_waszuessen_condition()
{
	if((Npc_KnowsInfo(other,dia_hilda_hallo) || (MIS_LOBART_RUEBEN == LOG_SUCCESS)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_waszuessen_info()
{
	var int rueben_tagnull;
	if(hero.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Hilda_WasZuEssen_15_00");	//Ты дашь мне что-нибудь поесть?
		if(MIS_LOBART_RUEBEN == LOG_SUCCESS)
		{
			if(!Npc_KnowsInfo(other,dia_hilda_pfannetoolate))
			{
				if(HILDA_STEW_DAY != Wld_GetDay())
				{
					b_giveinvitems(self,other,itfo_stew,1);
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_01");	//Вот, возьми. Ты хороший парень.
					HILDA_STEW_DAY = Wld_GetDay();
				}
				else if((Wld_GetDay() == 0) && (rueben_tagnull == FALSE))
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_02");	//За добавкой можешь зайти завтра.
					b_giveinvitems(self,other,itfo_stew,1);
					HILDA_STEW_DAY = Wld_GetDay();
					rueben_tagnull = TRUE;
					Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
					b_logentry(TOPIC_BONUS,"Я могу получать тарелку тушеной репы у Хильды каждый день.");
				}
				else
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_03");	//Ты сегодня уже получил свою порцию! Заходи попозже.
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_04");	//Мы не собираемся кормить здесь всяких лодырей. Убирайся!
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_05");	//Я кормлю только тех, кто работает здесь!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_06");	//Я уверена, у тебя достаточно денег, чтобы купить себе еды в городе.
	};
};


instance DIA_HILDA_BRINGBEET(C_INFO)
{
	npc = bau_951_hilda;
	nr = 1;
	condition = dia_hilda_bringbeet_condition;
	information = dia_hilda_bringbeet_info;
	permanent = TRUE;
	description = "Я принес тебе репу...";
};


func int dia_hilda_bringbeet_condition()
{
	if((MIS_LOBART_RUEBENTOHILDA == LOG_RUNNING) && (Npc_HasItems(other,itpl_beet) >= 1) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_bringbeet_info()
{
	AI_Output(other,self,"DIA_Hilda_BringBeet_15_00");	//Я принес тебе репу...
	if(Npc_HasItems(other,itpl_beet) >= 20)
	{
		b_giveinvitems(other,self,itpl_beet,Npc_HasItems(other,itpl_beet));
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_01");	//Отлично! (смеется) Этого должно хватить, чтобы накормить наших работников до отвала!
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_02");	//Раз уж ты все равно здесь... Я видела, как мимо прошел странствующий торговец. Это было несколько минут назад.
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_03");	//Я думаю, он где-нибудь остановился по пути в город. Сходи к нему. Может у него найдется сковородка для меня.
		MIS_LOBART_RUEBENTOHILDA = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_04");	//Что?! Это все?
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_05");	//Этого недостаточно.
		};
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_06");	//Иди в поле и собери еще. Мои люди голодны!
		AI_StopProcessInfos(self);
	};
};


instance DIA_HILDA_EINKAUFEN(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_einkaufen_condition;
	information = dia_hilda_einkaufen_info;
	permanent = FALSE;
	description = "Дай мне золота, и я схожу к этому торговцу для тебя...";
};


func int dia_hilda_einkaufen_condition()
{
	if((MIS_LOBART_RUEBENTOHILDA == LOG_SUCCESS) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_einkaufen_info()
{
	AI_Output(other,self,"DIA_Hilda_Einkaufen_15_00");	//Дай мне золота, и я схожу к этому торговцу для тебя...
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Einkaufen_17_01");	//А тебе можно доверять? Только попробуй потратить эти деньги на выпивку, слышишь?!
	};
	b_giveinvitems(self,other,itmi_gold,20);
	MIS_HILDA_PFANNEKAUFEN = LOG_RUNNING;
	MIS_HILDA_PFANNEKAUFEN_DAY = b_getdayplus();
	Log_CreateTopic(TOPIC_HILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HILDA,LOG_RUNNING);
	b_logentry(TOPIC_HILDA,"Хильда, жена фермера Лобарта, чтобы я купил для нее у странствующего торговца сковороду.");
};


instance DIA_HILDA_PFANNEGEHOLT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_pfannegeholt_condition;
	information = dia_hilda_pfannegeholt_info;
	permanent = FALSE;
	description = "Вот твоя сковородка.";
};


func int dia_hilda_pfannegeholt_condition()
{
	if((MIS_HILDA_PFANNEKAUFEN == LOG_RUNNING) && (Npc_HasItems(other,itmi_pan) > 0) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_pfannegeholt_info()
{
	AI_Output(other,self,"DIA_Hilda_PfanneGeholt_15_00");	//Вот твоя сковородка.
	b_giveinvitems(other,self,itmi_pan,1);
	AI_Output(self,other,"DIA_Hilda_PfanneGeholt_17_01");	//Отлично. Посмотрим, хорошая ли она...
	MIS_HILDA_PFANNEKAUFEN = LOG_SUCCESS;
	b_giveplayerxp(XP_HILDAHOLPFANNE);
};


instance DIA_HILDA_PFANNETOOLATE(C_INFO)
{
	npc = bau_951_hilda;
	nr = 1;
	condition = dia_hilda_pfannetoolate_condition;
	information = dia_hilda_pfannetoolate_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hilda_pfannetoolate_condition()
{
	if((MIS_HILDA_PFANNEKAUFEN == LOG_RUNNING) && (MIS_HILDA_PFANNEKAUFEN_DAY <= (Wld_GetDay() - 1)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_pfannetoolate_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_00");	//У тебя еще хватает наглости появляться здесь? Что ты сделал с моими деньгами, ты, бездельник?!
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_01");	//Где ты шлялся все это время? И где мои деньги, что я дала тебе на сковороду?
	};
	if(Npc_HasItems(other,itmi_pan) > 0)
	{
		AI_Output(other,self,"DIA_Hilda_PfanneTooLate_15_02");	//Извини, я немного подзадержался. Вот твоя сковородка!
		b_giveinvitems(other,self,itmi_pan,1);
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_03");	//Ах-х, давай же ее сюда! Ну и нахал же ты - просто невероятно!
		MIS_HILDA_PFANNEKAUFEN = LOG_SUCCESS;
		b_giveplayerxp(XP_HILDAHOLPFANNE / 2);
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(other,itmi_gold) >= 20)
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_04");	//Ах! Они все еще у тебя! Давай их назад. Живее!
			b_giveinvitems(other,self,itmi_gold,20);
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_05");	//Ну и нахал же ты - просто невероятно!
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_06");	//У тебя нет денег?! Я дала тебе 20 золотых!
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_07");	//Прочь с глаз моих, грязный вор!
			b_memorizeplayercrime(self,other,CRIME_THEFT);
		};
		MIS_HILDA_PFANNEKAUFEN = LOG_FAILED;
		b_checklog();
		AI_StopProcessInfos(self);
	};
};


instance DIA_HILDA_KAP3_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap3_exit_condition;
	information = dia_hilda_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hilda_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_KRANK(C_INFO)
{
	npc = bau_951_hilda;
	nr = 30;
	condition = dia_hilda_krank_condition;
	information = dia_hilda_krank_info;
	permanent = TRUE;
	description = "Как ты себя чувствуешь?";
};


func int dia_hilda_krank_condition()
{
	if((KAPITEL >= 3) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_HEALHILDA != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_hilda_krank_ontime;

func void dia_hilda_krank_info()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_15_00");	//Как ты себя чувствуешь?
	AI_Output(self,other,"DIA_Hilda_KRANK_17_01");	//Отвратительно. У меня опять эта ужасная лихорадка.
	AI_Output(self,other,"DIA_Hilda_KRANK_17_02");	//Мне бы нужно сходить к городскому лекарю, но я слишком слаба для этого.
	if(DIA_HILDA_KRANK_ONTIME == FALSE)
	{
		Info_ClearChoices(dia_hilda_krank);
		Info_AddChoice(dia_hilda_krank,"Поправляйся. А мне нужно идти.",dia_hilda_krank_besserung);
		Info_AddChoice(dia_hilda_krank,"Могу я чем-нибудь помочь?",dia_hilda_krank_helfen);
		DIA_HILDA_KRANK_ONTIME = TRUE;
	};
	MIS_HEALHILDA = LOG_RUNNING;
};

func void dia_hilda_krank_besserung()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_besserung_15_00");	//Поправляйся. А мне нужно идти.
	AI_Output(self,other,"DIA_Hilda_KRANK_besserung_17_01");	//Остается надеяться, что вскоре мне станет лучше.
	AI_StopProcessInfos(self);
};

func void dia_hilda_krank_helfen()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_helfen_15_00");	//Могу я чем-нибудь помочь?
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_01");	//Было бы великолепно, если бы ты мог сходить к Ватрасу и принести мне лекарство от него.
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_02");	//Он знает, что мне нужно! Самой мне не дойти.
	Log_CreateTopic(TOPIC_HEALHILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HEALHILDA,LOG_RUNNING);
	b_logentry(TOPIC_HEALHILDA,"Жена Лобарта Хильда больна, но у Ватраса есть лекарство, которое может вылечить ее.");
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_HEILUNGBRINGEN(C_INFO)
{
	npc = bau_951_hilda;
	nr = 31;
	condition = dia_hilda_heilungbringen_condition;
	information = dia_hilda_heilungbringen_info;
	description = "Я принес тебе лекарство.";
};


func int dia_hilda_heilungbringen_condition()
{
	if(Npc_HasItems(other,itpo_healhilda_mis))
	{
		return TRUE;
	};
};

func void dia_hilda_heilungbringen_info()
{
	AI_Output(other,self,"DIA_Hilda_HEILUNGBRINGEN_15_00");	//Я принес тебе лекарство.
	b_giveinvitems(other,self,itpo_healhilda_mis,1);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_01");	//Ох. Если бы только таких людей, как ты, было побольше. Огромное спасибо.
	b_useitem(self,itpo_healhilda_mis);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_02");	//Надеюсь, этих нескольких монет будет достаточно.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	MIS_HEALHILDA = LOG_SUCCESS;
	b_giveplayerxp(XP_HEALHILDA);
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_DISTURB(C_INFO)
{
	npc = bau_951_hilda;
	nr = 32;
	condition = dia_hilda_disturb_condition;
	information = dia_hilda_disturb_info;
	permanent = TRUE;
	description = "Как ты?";
};


func int dia_hilda_disturb_condition()
{
	if((MIS_HEALHILDA == LOG_SUCCESS) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (KAPITEL > 3)))
	{
		return TRUE;
	};
};

func void dia_hilda_disturb_info()
{
	if(MIS_HEALHILDA == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Hilda_DISTURB_15_00");	//Как твое здоровье?
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_01");	//Уже лучше, спасибо тебе.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_02");	//Все еще плохо.
	};
};


instance DIA_HILDA_KAP4_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap4_exit_condition;
	information = dia_hilda_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hilda_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_KAP5_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap5_exit_condition;
	information = dia_hilda_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hilda_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_KAP6_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap6_exit_condition;
	information = dia_hilda_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_hilda_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_PICKPOCKET(C_INFO)
{
	npc = bau_951_hilda;
	nr = 900;
	condition = dia_hilda_pickpocket_condition;
	information = dia_hilda_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_hilda_pickpocket_condition()
{
	return c_beklauen(26,35);
};

func void dia_hilda_pickpocket_info()
{
	Info_ClearChoices(dia_hilda_pickpocket);
	Info_AddChoice(dia_hilda_pickpocket,DIALOG_BACK,dia_hilda_pickpocket_back);
	Info_AddChoice(dia_hilda_pickpocket,DIALOG_PICKPOCKET,dia_hilda_pickpocket_doit);
};

func void dia_hilda_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hilda_pickpocket);
};

func void dia_hilda_pickpocket_back()
{
	Info_ClearChoices(dia_hilda_pickpocket);
};

