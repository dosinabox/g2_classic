
instance DIA_PARCIVAL_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_exit_condition;
	information = dia_parcival_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_parcival_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_SCHURFER(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_schurfer_condition;
	information = dia_parcival_schurfer_info;
	permanent = FALSE;
	description = "Что ты можешь рассказать мне о старателях?";
};


func int dia_parcival_schurfer_condition()
{
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parcival_schurfer_info()
{
	AI_Output(other,self,"DIA_Parcival_Schurfer_15_00");	//Что ты можешь рассказать мне о старателях?
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_01");	//Я отправлял все три отряда.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_02");	//Их возглавили Маркос, Фаджет и Сильвестро.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_03");	//Группа Маркоса пошла по направлению к старой шахте - ее ведет старый рудокоп Гримс.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_04");	//Другие две группы вышли вместе.
	AI_Output(self,other,"DIA_Parcival_Schurfer_13_05");	//Джерган, один из наших разведчиков, доложил, что они разбили лагерь неподалеку от большой башни.
	b_logentry(TOPIC_SCOUTMINE,"Отряды старателей возглавляли паладины. Маркос, Фаджет и Сильвестро.");
	b_logentry(TOPIC_SCOUTMINE,"Группа Маркоса пошла по направлению к старой шахте. Их разведчиком был рудокоп Гримс.");
	b_logentry(TOPIC_SCOUTMINE,"Другие две группы вышли вместе. Они разбили лагерь неподалеку от большой башни.");
};


instance DIA_PARCIVAL_DIEGO(C_INFO)
{
	npc = pal_252_parcival;
	nr = 9;
	condition = dia_parcival_diego_condition;
	information = dia_parcival_diego_info;
	permanent = FALSE;
	description = "А с какой группой старателей пошел Диего?";
};


func int dia_parcival_diego_condition()
{
	if((SEARCHFORDIEGO == LOG_RUNNING) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_parcival_diego_info()
{
	AI_Output(other,self,"DIA_Parcival_Diego_15_00");	//А с какой группой старателей пошел Диего?
	AI_Output(self,other,"DIA_Parcival_Diego_13_01");	//Этот каторжник - Диего? Он с группой паладина Сильвестро.
	b_logentry(TOPIC_SCOUTMINE,"Диего пошел со старателями, возглавляемыми паладином Сильвестро.");
};


instance DIA_PARCIVAL_WEG(C_INFO)
{
	npc = pal_252_parcival;
	nr = 8;
	condition = dia_parcival_weg_condition;
	information = dia_parcival_weg_info;
	permanent = FALSE;
	description = "Ты знаешь, как добраться до этих шахт?";
};


func int dia_parcival_weg_condition()
{
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_parcival_weg_info()
{
	AI_Output(other,self,"DIA_Parcival_Weg_15_00");	//Ты знаешь, как добраться до этих шахт?
	AI_Output(self,other,"DIA_Parcival_Weg_13_01");	//Через долину вообще нет безопасного пути. Но мне все же кажется, что будет лучше избегать прямой дороги.
	AI_Output(self,other,"DIA_Parcival_Weg_13_02");	//Держись подальше от орков и лесов - и да хранит тебя Иннос.
	b_logentry(TOPIC_SCOUTMINE,"Похоже, прямой путь к старателям может оказаться не лучшим выбором. Мне лучше обходить стороной леса и лагеря орков.");
};


instance DIA_PARCIVAL_DRAGON(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_dragon_condition;
	information = dia_parcival_dragon_info;
	description = "Как ситуация?";
};


func int dia_parcival_dragon_condition()
{
	return TRUE;
};

func void dia_parcival_dragon_info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGON_15_00");	//Как обстановка?
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_01");	//Мы окружены орками. Похоже, они здесь надолго.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_02");	//Но значительно больше меня тревожат нападения драконов. Они уже уничтожили весь внешний круг.
	AI_Output(self,other,"DIA_Parcival_DRAGON_13_03");	//Еще одно нападение драконов, и мы понесем большие потери.
};


instance DIA_PARCIVAL_DRAGONS(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_dragons_condition;
	information = dia_parcival_dragons_info;
	description = "Сколько всего драконов?";
};


func int dia_parcival_dragons_condition()
{
	if(Npc_KnowsInfo(hero,dia_parcival_dragon) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_parcival_dragons_info()
{
	AI_Output(other,self,"DIA_Parcival_DRAGONS_15_00");	//Сколько всего драконов?
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_01");	//Мы не знаем, сколько их всего, но больше одного, это точно.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_02");	//Но и это еще не все. Вся Долина Рудников кишит дьявольскими созданиями, поддерживающими драконов.
	AI_Output(self,other,"DIA_Parcival_DRAGONS_13_03");	//Не стоит обманывать себя - без подкрепления извне наши шансы выбраться отсюда живыми ничтожны.
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_BRAVE(C_INFO)
{
	npc = pal_252_parcival;
	nr = 8;
	condition = dia_parcival_brave_condition;
	information = dia_parcival_brave_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_parcival_brave_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(hero,dia_parcival_dragons) && (KAPITEL < 3) && (PARCIVAL_BRAVE_LABERCOUNT <= 6))
	{
		return TRUE;
	};
};


var int parcival_brave_labercount;

func void dia_parcival_brave_info()
{
	var int randy;
	if(PARCIVAL_BRAVE_LABERCOUNT < 6)
	{
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_00");	//Пока все спокойно. Но все может быстро перемениться.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_01");	//Мы будем держаться, сколько сможем.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_Parcival_BRAVE_13_02");	//Иннос поможет нам. Его свет озаряет наши сердца!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_BRAVE_13_03");	//Эй! Тебе что, нечего больше делать, как болтать со мной? Проваливай!
		b_giveplayerxp(XP_AMBIENT);
	};
	PARCIVAL_BRAVE_LABERCOUNT = PARCIVAL_BRAVE_LABERCOUNT + 1;
};


instance DIA_PARCIVAL_KAP3_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap3_exit_condition;
	information = dia_parcival_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_parcival_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_ALLESKLAR(C_INFO)
{
	npc = pal_252_parcival;
	nr = 31;
	condition = dia_parcival_allesklar_condition;
	information = dia_parcival_allesklar_info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int dia_parcival_allesklar_condition()
{
	if((KAPITEL == 3) && (DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER < 3) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};


var int dia_parcival_allesklar_nervcounter;

func void dia_parcival_allesklar_info()
{
	AI_Output(other,self,"DIA_Parcival_ALLESKLAR_15_00");	//Все в порядке?
	if(DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_01");	//Пока да!
	}
	else if(DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER == 1)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_02");	//Да, черт тебя побери.
	}
	else if(PARCIVAL_BRAVE_LABERCOUNT > 6)
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_03");	//(смеется) Ах. Теперь я понимаю, что ты задумал. Нет, дружок. Не на этот раз.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_ALLESKLAR_13_04");	//Не отвлекай меня.
	};
	DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER = DIA_PARCIVAL_ALLESKLAR_NERVCOUNTER + 1;
};


instance DIA_PARCIVAL_KAP4_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap4_exit_condition;
	information = dia_parcival_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_parcival_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_ANYNEWS(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_anynews_condition;
	information = dia_parcival_anynews_info;
	description = "Ничего важного не произошло?";
};


func int dia_parcival_anynews_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_anynews_info()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_15_00");	//Ничего важного не произошло?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_01");	//Ты один из этих отбросов общества, что называют себя охотниками на драконов?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_02");	//Вообще-то, я полагал, что у тебя хватит ума не связываться с этими недоумками.
	}
	else
	{
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_03");	//Я обеспокоен. Очень сильно обеспокоен.
		AI_Output(other,self,"DIA_Parcival_AnyNews_15_04");	//Чем?
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_05");	//Недавно здесь появились эти люди. Они называют себя охотниками на драконов.
		AI_Output(self,other,"DIA_Parcival_AnyNews_13_06");	//С моей точки зрения все они бездельники и преступники.
	};
	AI_Output(self,other,"DIA_Parcival_AnyNews_13_07");	//Если бы это было в моей власти, я бы выгнал их всех из замка. Пусть орки позаботятся о них.
	Info_ClearChoices(dia_parcival_anynews);
	Info_AddChoice(dia_parcival_anynews,"Но в отличие от лорда Хагена, они все же здесь.",dia_parcival_anynews_lordhagen);
	Info_AddChoice(dia_parcival_anynews,"Ты должен дать им шанс.",dia_parcival_anynews_chance);
	Info_AddChoice(dia_parcival_anynews,"Тебе не кажется, что ты преувеличиваешь?",dia_parcival_anynews_overact);
};

func void dia_parcival_anynews_lordhagen()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_LordHagen_15_00");	//Но в отличие от лорда Хагена, они все же здесь.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_01");	//(горько смеется) Да, к сожалению, они все, что у нас есть.
	AI_Output(self,other,"DIA_Parcival_AnyNews_LordHagen_13_02");	//Воистину Иннос подвергает нас суровому испытанию.
	Info_ClearChoices(dia_parcival_anynews);
};

func void dia_parcival_anynews_chance()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Chance_15_00");	//Ты должен дать им шанс.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_01");	//И они его получат. К сожалению.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_02");	//Гаронд убежден, что они могут помочь нам.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Chance_13_03");	//Но я глаз с них не спущу. У нас и так хватает проблем с орками. И дополнительные неприятности нам совсем ни к чему.
	Info_ClearChoices(dia_parcival_anynews);
};

func void dia_parcival_anynews_overact()
{
	AI_Output(other,self,"DIA_Parcival_AnyNews_Overact_15_00");	//Тебе не кажется, что ты преувеличиваешь?
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_01");	//Абсолютно нет. В нашей ситуации нам нужны люди, являющие собой пример героизма.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_02");	//Воины, которые пробудят огонь Инноса в сердцах наших бойцов.
	AI_Output(self,other,"DIA_Parcival_AnyNews_Overact_13_03");	//А вместо этого эти проходимцы разлагают боевой дух моих солдат.
};


instance DIA_PARCIVAL_JAN(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_jan_condition;
	information = dia_parcival_jan_info;
	permanent = FALSE;
	description = "Мне нужно поговорить с тобой о Яне.";
};


func int dia_parcival_jan_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_RUNNING) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_jan_info()
{
	AI_Output(other,self,"DIA_Parcival_Jan_15_00");	//Мне нужно поговорить с тобой о Яне.
	AI_Output(self,other,"DIA_Parcival_Jan_13_01");	//Яне? Кто это?
	AI_Output(other,self,"DIA_Parcival_Jan_15_02");	//Охотник на драконов. Он кузнец.
	AI_Output(self,other,"DIA_Parcival_Jan_13_03");	//Ох, да. Я помню. Что насчет него?
	AI_Output(other,self,"DIA_Parcival_Jan_15_04");	//Он хочет работать в кузнице.
	AI_Output(self,other,"DIA_Parcival_Jan_13_05");	//Это даже не обсуждается. Он не наш человек и я не доверяю ему.
};


instance DIA_PARCIVAL_THINKAGAIN(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_thinkagain_condition;
	information = dia_parcival_thinkagain_info;
	permanent = TRUE;
	description = "Ты не мог бы пересмотреть свое мнение насчет Яна?";
};


func int dia_parcival_thinkagain_condition()
{
	if(Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_JANBECOMESSMITH == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_parcival_thinkagain_info()
{
	AI_Output(other,self,"DIA_Parcival_ThinkAgain_15_00");	//Ты не мог бы пересмотреть свое мнение насчет Яна?
	AI_Output(self,other,"DIA_Parcival_ThinkAgain_13_01");	//Нет, мое решение окончательно.
};


instance DIA_PARCIVAL_TALKEDGAROND(C_INFO)
{
	npc = pal_252_parcival;
	nr = 2;
	condition = dia_parcival_talkedgarond_condition;
	information = dia_parcival_talkedgarond_info;
	description = "Гаронд хочет, чтобы Ян работал в кузнице.";
};


func int dia_parcival_talkedgarond_condition()
{
	if(Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_parcival_dragon))
	{
		return TRUE;
	};
};

func void dia_parcival_talkedgarond_info()
{
	AI_Output(other,self,"DIA_Parcival_TalkedGarond_15_00");	//Гаронд хочет, чтобы Ян работал в кузнице.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_01");	//Ммм. Если это действительно так, то я не имею ничего против этого.
	AI_Output(self,other,"DIA_Parcival_TalkedGarond_13_02");	//Хотя я и считаю ошибкой доверять этому Яну.
};


instance DIA_PARCIVAL_PERMKAP4(C_INFO)
{
	npc = pal_252_parcival;
	nr = 43;
	condition = dia_parcival_permkap4_condition;
	information = dia_parcival_permkap4_info;
	permanent = TRUE;
	description = "А кроме этого?";
};


func int dia_parcival_permkap4_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_parcival_anynews))
	{
		return TRUE;
	};
};

func void dia_parcival_permkap4_info()
{
	AI_Output(other,self,"DIA_Parcival_PERMKAP4_15_00");	//А кроме этого?
	AI_Output(self,other,"DIA_Parcival_PERMKAP4_13_01");	//Ах, оставь меня в покое!
};


instance DIA_PARCIVAL_KAP5_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap5_exit_condition;
	information = dia_parcival_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_parcival_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_VERRAETER(C_INFO)
{
	npc = pal_252_parcival;
	condition = dia_parcival_verraeter_condition;
	information = dia_parcival_verraeter_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_parcival_verraeter_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (MIS_OCGATEOPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_parcival_verraeter_info()
{
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_00");	//Предатель! Я точно знаю, что это ТЫ открыл ворота.
	AI_Output(self,other,"DIA_Parcival_VERRAETER_13_01");	//Ты заплатишь за это.
	Npc_SetRefuseTalk(self,30);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_PARCIVAL_KAP6_EXIT(C_INFO)
{
	npc = pal_252_parcival;
	nr = 999;
	condition = dia_parcival_kap6_exit_condition;
	information = dia_parcival_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parcival_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_parcival_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARCIVAL_PICKPOCKET(C_INFO)
{
	npc = pal_252_parcival;
	nr = 900;
	condition = dia_parcival_pickpocket_condition;
	information = dia_parcival_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_parcival_pickpocket_condition()
{
	return c_beklauen(84,460);
};

func void dia_parcival_pickpocket_info()
{
	Info_ClearChoices(dia_parcival_pickpocket);
	Info_AddChoice(dia_parcival_pickpocket,DIALOG_BACK,dia_parcival_pickpocket_back);
	Info_AddChoice(dia_parcival_pickpocket,DIALOG_PICKPOCKET,dia_parcival_pickpocket_doit);
};

func void dia_parcival_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_parcival_pickpocket);
};

func void dia_parcival_pickpocket_back()
{
	Info_ClearChoices(dia_parcival_pickpocket);
};

