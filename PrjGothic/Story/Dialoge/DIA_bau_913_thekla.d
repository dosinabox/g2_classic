
instance DIA_THEKLA_EXIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 999;
	condition = dia_thekla_exit_condition;
	information = dia_thekla_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_thekla_exit_condition()
{
	return TRUE;
};

func void dia_thekla_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THEKLA_HALLO(C_INFO)
{
	npc = bau_913_thekla;
	nr = 1;
	condition = dia_thekla_hallo_condition;
	information = dia_thekla_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_hallo_condition()
{
	return TRUE;
};

func void dia_thekla_hallo_info()
{
	AI_Output(self,other,"DIA_Thekla_HALLO_17_00");	//Что ты делаешь здесь, на моей кухне?
};


instance DIA_THEKLA_LECKER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 2;
	condition = dia_thekla_lecker_condition;
	information = dia_thekla_lecker_info;
	permanent = FALSE;
	description = "Как у тебя здесь вкусно пахнет!";
};


func int dia_thekla_lecker_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_lecker_info()
{
	AI_Output(other,self,"DIA_Thekla_Lecker_15_00");	//Как у тебя здесь вкусно пахнет!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_01");	//Не подлизывайся! Я знаю таких, как ты, как облупленных! Вон их сколько вокруг бродит!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_02");	//Сначала вы пытаетесь подхалимничать, а затем, когда от вас что-то нужно, то никого не найдешь!
};


var int thekla_gavestew;

instance DIA_THEKLA_HUNGER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 3;
	condition = dia_thekla_hunger_condition;
	information = dia_thekla_hunger_info;
	permanent = FALSE;
	description = "Я голоден!";
};


func int dia_thekla_hunger_condition()
{
	if(THEKLA_GAVESTEW == FALSE)
	{
		return TRUE;
	};
};

func void dia_thekla_hunger_info()
{
	AI_Output(other,self,"DIA_Thekla_Hunger_15_00");	//Я голоден!
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_01");	//Я не кормлю бродяг. Я кормлю только тех, кто работает.
		AI_Output(self,other,"DIA_Thekla_Hunger_17_02");	//(презрительно) И этот сброд, наемников, конечно.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_03");	//Вот твоя еда.
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_04");	//Мы не обслуживаем здесь ополчение.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_05");	//Как я могу отказать служителю Инноса?
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	};
};


instance DIA_THEKLA_ARBEIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_arbeit_condition;
	information = dia_thekla_arbeit_info;
	permanent = FALSE;
	description = "Я ищу работу.";
};


func int dia_thekla_arbeit_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_arbeit_info()
{
	AI_Output(other,self,"DIA_Thekla_Arbeit_15_00");	//Я ищу работу...
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_01");	//Ты хочешь работать здесь, на ферме?
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_02");	//Этот вопрос может решить только Онар. Эта ферма его, как и вся долина.
};


instance DIA_THEKLA_WANNAJOIN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 5;
	condition = dia_thekla_wannajoin_condition;
	information = dia_thekla_wannajoin_info;
	permanent = FALSE;
	description = "Вообще-то я планировал присоединиться к наемникам...";
};


func int dia_thekla_wannajoin_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_thekla_arbeit))
	{
		return TRUE;
	};
};

func void dia_thekla_wannajoin_info()
{
	AI_Output(other,self,"DIA_Thekla_WannaJoin_15_00");	//Вообще-то я планировал присоединиться к наемникам...
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_01");	//Так ты тоже преступник из колонии?
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_02");	//Я могла бы догадаться! Оставь меня в покое! Здесь вашего брата уже и так хватает!
};


instance DIA_THEKLA_SCHLAFEN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 6;
	condition = dia_thekla_schlafen_condition;
	information = dia_thekla_schlafen_info;
	permanent = FALSE;
	description = "Где тут можно поспать?";
};


func int dia_thekla_schlafen_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_schlafen_info()
{
	AI_Output(other,self,"DIA_Thekla_Schlafen_15_00");	//Где тут можно поспать?
	AI_Output(self,other,"DIA_Thekla_Schlafen_17_01");	//Даже не думай спать в моей кухне. Найди себе место в сарае.
};


instance DIA_THEKLA_PROBLEM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_problem_condition;
	information = dia_thekla_problem_info;
	permanent = FALSE;
	description = "Почему ты не любишь наемников?";
};


func int dia_thekla_problem_condition()
{
	if((KAPITEL <= 3) && Npc_KnowsInfo(other,dia_thekla_wannajoin))
	{
		return TRUE;
	};
};

func void dia_thekla_problem_info()
{
	AI_Output(other,self,"DIA_Thekla_Problem_15_00");	//Почему ты не любишь наемников?
	AI_Output(self,other,"DIA_Thekla_Problem_17_01");	//Ах, эти кретины действуют мне на нервы! Особенно Сильвио и его жирный приятель Булко.
	AI_Output(self,other,"DIA_Thekla_Problem_17_02");	//Эти двое сидят вон там, в углу, целыми днями напролет и отравляют мне жизнь.
	AI_Output(self,other,"DIA_Thekla_Problem_17_03");	//То суп им слишком горячий, то мясо слишком жесткое, ну и все тому подобное...
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Thekla_Problem_15_04");	//А почему ты ничего не делаешь с этим?
		AI_Output(self,other,"DIA_Thekla_Problem_17_05");	//А что я могу сделать, мистер Остряк-Самоучка? Врезать им своей скалкой? Да, с фермерами это проходит, но ведь эти ублюдки недолго думая ответят мечом!
	};
};


instance DIA_THEKLA_MANIEREN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_manieren_condition;
	information = dia_thekla_manieren_info;
	permanent = FALSE;
	description = "Хочешь, я научу этих двоих хорошим манерам?";
};


func int dia_thekla_manieren_condition()
{
	if(Npc_KnowsInfo(other,dia_thekla_problem) && (sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_thekla_manieren_info()
{
	AI_Output(other,self,"DIA_Thekla_Manieren_15_00");	//Хочешь, я научу этих двоих хорошим манерам?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_01");	//Тебе лучше не связываться с ними. Как я знаю, у Сильвио магические доспехи. Его нельзя победить.
	AI_Output(other,self,"DIA_Thekla_Manieren_15_02");	//А что насчет Булко?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_03");	//Этот парень силен как бык. Пока он легко справлялся со всеми, кто пытался выступить против него или Сильвио.
};


instance DIA_THEKLA_AFTERFIGHT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_afterfight_condition;
	information = dia_thekla_afterfight_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_afterfight_condition()
{
	if((sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || ((bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (KAPITEL <= 3)))
	{
		return TRUE;
	};
};

func void dia_thekla_afterfight_info()
{
	if(bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_00");	//Ты действительно смог выбить дурь из этого Булко.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_01");	//Должно быть, ты очень устал, пока молотил эту жирную свинью.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_02");	//Ну что, получил по полной программе?
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_03");	//Я же тебя предупреждала! Теперь ты понимаешь, что я имела в виду?
		AI_Output(other,self,"DIA_Thekla_AfterFight_15_04");	//Я рад, что доставил этим тебе удовольствие.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_05");	//Не расстраивайся так. Ты далеко не первый, кто пострадал от этой сволочи.
	};
	AI_Output(self,other,"DIA_Thekla_AfterFight_17_06");	//Вот, поешь немного. Это восстановит твои силы.
	b_giveinvitems(self,other,itfo_xpstew,1);
	THEKLA_GAVESTEW = TRUE;
};


instance DIA_THEKLA_SAGITTAPAKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_sagittapaket_condition;
	information = dia_thekla_sagittapaket_info;
	permanent = TRUE;
	description = "Вот пакет от Сагитты.";
};


func int dia_thekla_sagittapaket_condition()
{
	if(Npc_HasItems(other,itmi_theklaspaket) && (MIS_THEKLA_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_thekla_sagittapaket_info()
{
	b_giveinvitems(other,self,itmi_theklaspaket,1);
	AI_Output(other,self,"DIA_Thekla_SagittaPaket_15_00");	//Вот пакет от Сагитты.
	AI_Output(self,other,"DIA_Thekla_SagittaPaket_17_01");	//Огромное спасибо. От тебя есть хоть какая-то польза в отличие от других.
	MIS_THEKLA_PAKET = LOG_SUCCESS;
	b_giveplayerxp(XP_THEKLASPAKET);
};


var int thekla_mehreintopfkap1;
var int thekla_mehreintopfkap3;
var int thekla_mehreintopfkap5;

instance DIA_THEKLA_PERM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_perm_condition;
	information = dia_thekla_perm_info;
	permanent = TRUE;
	description = "Ты мне не дашь еще своей похлебки?";
};


func int dia_thekla_perm_condition()
{
	if(THEKLA_GAVESTEW == TRUE)
	{
		return TRUE;
	};
};

func void dia_thekla_perm_info()
{
	AI_Output(other,self,"DIA_Thekla_PERM_15_00");	//Ты мне не дашь еще своей похлебки?
	if(MIS_THEKLA_PAKET == FALSE)
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_01");	//Она закончилась.
		AI_Output(other,self,"DIA_Thekla_PERM_15_02");	//Не осталось даже маленькой миски?
		AI_Output(self,other,"DIA_Thekla_PERM_17_03");	//Нет.
		AI_Output(other,self,"DIA_Thekla_PERM_15_04");	//А могу облизать горшок, а?
		AI_Output(self,other,"DIA_Thekla_PERM_17_05");	//Прекрати!
		AI_Output(self,other,"DIA_Thekla_PERM_17_06");	//Если тебе так понравилась моя похлебка, тебе придется сделать кое-что, чтобы получить ее.
		AI_Output(other,self,"DIA_Thekla_PERM_15_07");	//Что?
		AI_Output(self,other,"DIA_Thekla_PERM_17_08");	//Сходи к Сагитте, знахарке, что живет за фермой Секоба, и принеси мне от нее пакет с травой.
		AI_Output(self,other,"DIA_Thekla_PERM_17_09");	//Если ты принесешь мне эти травы, я сварю похлебку для тебя.
		MIS_THEKLA_PAKET = LOG_RUNNING;
		Log_CreateTopic(TOPIC_THEKLAEINTOPF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_THEKLAEINTOPF,LOG_RUNNING);
		b_logentry(TOPIC_THEKLAEINTOPF,"Если я принесу Текле травы от знахарки Сагитты, она сварит еще одну похлебку для меня. Сагитта живет за фермой Секоба.");
	}
	else if(MIS_THEKLA_PAKET == LOG_SUCCESS)
	{
		if(KAPITEL <= 2)
		{
			if(THEKLA_MEHREINTOPFKAP1 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_10");	//Хорошо. Я сжалюсь над тобой. Вот, держи. Не могу смотреть, как ты умираешь от голода у меня на глазах.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP1 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_11");	//Эй, эй, эй! Не будь таким жадным! Я дам тебе знать, если у меня найдется еще работа для тебя.
				AI_Output(self,other,"DIA_Thekla_PERM_17_12");	//И ТОГДА ты получишь еще этой похлебки, понятно?
			};
		};
		if((KAPITEL == 3) || (KAPITEL == 4))
		{
			if((THEKLA_MEHREINTOPFKAP3 == FALSE) && (MIS_RESCUEBENNET == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_13");	//Я слышала, ты помог Беннету выбраться из тюрьмы. Отличная работа, парень.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP3 = TRUE;
			}
			else if(MIS_RESCUEBENNET != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_14");	//Эти ублюдки из ополчения бросили Беннета за решетку.
				AI_Output(self,other,"DIA_Thekla_PERM_17_15");	//Окажи мне услугу, вызволи его оттуда, хорошо? А тем временем я сварю для тебя очень вкусную похлебку.
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_16");	//У меня ничего не осталось. Заходи позже.
			};
		};
		if(KAPITEL >= 5)
		{
			if(THEKLA_MEHREINTOPFKAP5 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_17");	//Ты что, всегда такой голодный? А что ты делал все это время?
				AI_Output(other,self,"DIA_Thekla_PERM_15_18");	//Я прикончил нескольких драконов.
				AI_Output(self,other,"DIA_Thekla_PERM_17_19");	//Ох! Тогда тебе действительно не повредит миска хорошей похлебки.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP5 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_20");	//Все! Похлебка вся закончилась.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_21");	//Нет трав, нет похлебки - понятно?
	};
};


instance DIA_THEKLA_PICKPOCKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_pickpocket_condition;
	information = dia_thekla_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_thekla_pickpocket_condition()
{
	return c_beklauen(53,60);
};

func void dia_thekla_pickpocket_info()
{
	Info_ClearChoices(dia_thekla_pickpocket);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_BACK,dia_thekla_pickpocket_back);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_PICKPOCKET,dia_thekla_pickpocket_doit);
};

func void dia_thekla_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thekla_pickpocket);
};

func void dia_thekla_pickpocket_back()
{
	Info_ClearChoices(dia_thekla_pickpocket);
};

