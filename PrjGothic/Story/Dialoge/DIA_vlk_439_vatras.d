
var int vatras_schickeleuteweg;

instance DIA_VATRAS_EXIT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 999;
	condition = dia_vatras_exit_condition;
	information = dia_vatras_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vatras_exit_condition()
{
	return TRUE;
};

func void dia_vatras_exit_info()
{
	AI_StopProcessInfos(self);
	if(VATRAS_SCHICKELEUTEWEG == TRUE)
	{
		b_startotherroutine(vlk_455_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_454_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_428_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_450_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_426_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_421_valentino,"VATRASAWAY");
		VATRAS_SCHICKELEUTEWEG = FALSE;
	};
};


instance DIA_VATRAS_PICKPOCKET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 900;
	condition = dia_vatras_pickpocket_condition;
	information = dia_vatras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_vatras_pickpocket_condition()
{
	return c_beklauen(91,250);
};

func void dia_vatras_pickpocket_info()
{
	Info_ClearChoices(dia_vatras_pickpocket);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_BACK,dia_vatras_pickpocket_back);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_PICKPOCKET,dia_vatras_pickpocket_doit);
};

func void dia_vatras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_vatras_pickpocket);
};

func void dia_vatras_pickpocket_back()
{
	Info_ClearChoices(dia_vatras_pickpocket);
};


instance DIA_VATRAS_GREET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_greet_condition;
	information = dia_vatras_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vatras_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_greet_info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//Да пребудет с тобой Аданос.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//Кто ты?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//Я Ватрас, слуга Аданоса, стража равновесия божественного и земного.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//Что я могу сделать для тебя?
};


instance DIA_VATRAS_INFLUENCE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_influence_condition;
	information = dia_vatras_influence_info;
	permanent = FALSE;
	description = "Я прошу твоего благословения.";
};


func int dia_vatras_influence_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (PLAYER_ISAPPRENTICE == APP_NONE) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_vatras_influence_info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//Я прошу твоего благословения.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//Почему я должен дать тебе мое благословение, чужеземец?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//Я хочу стать учеником одного из мастеров в нижней части города.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_03");	//Я могу дать тебе благословение, чужеземец, но я ничего не знаю о тебе. Расскажи мне о себе.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//Что ты хочешь знать?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//Ну, ты можешь рассказать мне, откуда ты пришел и зачем ты пришел в этот город.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//У меня важное сообщение для главы паладинов.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//Что за сообщение?
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Пришли драконы ...",dia_vatras_influence_first_truth);
	Info_AddChoice(dia_vatras_influence,"Скоро произойдут ужасные вещи!",dia_vatras_influence_first_lie);
};

func void dia_vatras_influence_first_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//Пока мы разговариваем, собирается огромная армия, ведомая драконами. Эта армия намеревается завоевать нашу страну.
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//Если это действительно правда, баланс на земле будет нарушен. Кто сказал тебе это?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//(задумчиво) Драконы? Ты говоришь о существах, которые до последнего времени упоминались только в легендах. Откуда ты знаешь это?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Ох, я где-то слышал об этом...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_vatras_influence,"Мне сказал об этом маг Ксардас ...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = TRUE;
};

func void dia_vatras_influence_first_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//Скоро произойдут ужасные вещи!
	if(VATRAS_FIRST == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//(сердито) Ага. И кто сказал тебе это?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//Ужасные вещи, хм... откуда ты знаешь это?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Ох, я где-то слышал об этом...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_vatras_influence,"Мне сказал об этом маг Ксардас ...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = 2;
};

func void dia_vatras_influence_second_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//Мне сказал об этом маг Ксардас. Он послал меня предупредить паладинов.
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//Я знаю этого человека как мудрого и могущественного мастера магии. А ты откуда пришел?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//Некромант... Так он жив... (задумчиво) И он послал тебя? А кто же ты тогда такой?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Я искатель приключений с юга ...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_vatras_influence,"Я бывший заключенный ...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = TRUE;
};

func void dia_vatras_influence_second_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//Ох, я где-то слышал об этом...
	if(VATRAS_SECOND == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//(раздраженно) Ты хотя бы помнишь, откуда ты пришел?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//Ага. И поэтому ты поделал весь этот долгий путь. Кто ты такой вообще?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Я искатель приключений с юга...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_vatras_influence,"Я бывший заключенный ...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = 2;
};

func void dia_vatras_influence_third_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//Я бывший заключенный колонии Хориниса.
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Так ты дашь мне свое благословение?",dia_vatras_influence_repeat);
	VATRAS_THIRD = TRUE;
};

func void dia_vatras_influence_third_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//Я искатель приключений с юга...
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"Так ты дашь мне свое благословение?",dia_vatras_influence_repeat);
	VATRAS_THIRD = 2;
};

func void dia_vatras_influence_repeat()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_REPEAT_15_00");	//Так ты дашь мне свое благословение?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//Хорошо, давай подытожим:
	if(VATRAS_THIRD == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//Ты бывший заключенный...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//Ты искатель приключений с юга...
	};
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//...которому сказал некромант Ксардас...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//...который слышал слухи...
	};
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//...о том, что пришли драконы, чтобы завоевать страну.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//...что скоро произойдут ужасные вещи.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//И ты пришел, чтобы сообщить это паладинам...
	if((VATRAS_FIRST == TRUE) && (VATRAS_SECOND == TRUE) && (VATRAS_THIRD == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//Это все звучит довольно фантастически, но я не думаю, что ты солгал мне.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//Поэтому я вынужден предположить, что твои мотивы благородны.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//Ступай с благословением Аданоса, сын мой!
		Snd_Play("LEVELUP");
		b_giveplayerxp(XP_VATRASTRUTH);
		VATRAS_SEGEN = TRUE;
		b_logentry(TOPIC_THORBEN,"Маг воды Ватрас благословил меня.");
	}
	else if(VATRAS_CHANCE == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//Мне кажется, что ты не все говоришь мне.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//Если ты опасаешься, что я расскажу кому-нибудь о том, что ты поведаешь мне, то позволь мне уверить тебя.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//Я поклялся хранить все секреты, которые доверяют мне, как свои собственные.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//А что насчет людей, стоящих здесь?
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//Они понимают только половину того, что я ПРОПОВЕДУЮ им. Так что не беспокойся.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//Начнем с начала. Что это за сообщение?
		VATRAS_CHANCE = TRUE;
		Info_ClearChoices(dia_vatras_influence);
		Info_AddChoice(dia_vatras_influence,"Пришли драконы ...",dia_vatras_influence_first_truth);
		Info_AddChoice(dia_vatras_influence,"Скоро произойдут ужасные вещи!",dia_vatras_influence_first_lie);
	}
	else if(VATRAS_CHANCE == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_13");	//Я дал тебе два шанса сказать мне правду, но ты, по-видимому, не хочешь этого. Я не дам тебе моего благословения.
	};
};


instance DIA_VATRAS_WOKDF(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 3;
	condition = dia_vatras_wokdf_condition;
	information = dia_vatras_wokdf_info;
	permanent = FALSE;
	description = "Где мне найти жреца Инноса?";
};


func int dia_vatras_wokdf_condition()
{
	if((VATRAS_SEGEN == TRUE) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_vatras_wokdf_info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//Где мне найти жреца Инноса?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//Попробуй поискать его на рыночной площади. Ты найдешь там представителя монастыря.
};


instance DIA_VATRAS_SPENDE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 3;
	condition = dia_vatras_spende_condition;
	information = dia_vatras_spende_info;
	permanent = TRUE;
	description = "Я хочу сделать пожертвование Аданосу!";
};


func int dia_vatras_spende_condition()
{
	return TRUE;
};

func void dia_vatras_spende_info()
{
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//Я хочу сделать пожертвование Аданосу!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//Пожертвование церкви Аданоса снимет часть грехов, которые ты мог совершить, сын мой.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//Сколько ты можешь пожертвовать?
	Info_ClearChoices(dia_vatras_spende);
	Info_AddChoice(dia_vatras_spende,"Мне сейчас нечем поделиться...",dia_vatras_spende_back);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_vatras_spende,"У меня есть 50 золотых монет...",dia_vatras_spende_50);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_vatras_spende,"У меня есть 100 золотых монет...",dia_vatras_spende_100);
	};
};

func void dia_vatras_spende_back()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//Мне сейчас нечем поделиться...
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//Это не проблема, ты можешь выразить свои добрые намерения позже, сын мой.
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//У меня есть 50 золотых монет...
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//Я благодарю тебя от имени Аданоса, сын мой. Твое золото будет роздано нуждающимся.
	b_giveinvitems(other,self,itmi_gold,50);
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//У меня есть 100 золотых монет...
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//Я благословляю тебя от имени Аданоса за этот великодушный дар!
	Snd_Play("LEVELUP");
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//Да будет путь, по которому ты идешь, благословлен Аданосом!
	b_giveinvitems(other,self,itmi_gold,100);
	VATRAS_SEGEN = TRUE;
	Info_ClearChoices(dia_vatras_spende);
	if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
	{
		b_logentry(TOPIC_THORBEN,"Маг воды Ватрас благословил меня.");
	};
};


instance DIA_VATRAS_CANTEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_vatras_canteach_condition;
	information = dia_vatras_canteach_info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь из области магии?";
};


func int dia_vatras_canteach_condition()
{
	return TRUE;
};

func void dia_vatras_canteach_info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//Ты можешь научить меня чему-нибудь из области магии?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//Только Избранным Инноса и Избранным Аданоса позволено пользоваться магией рун.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//Но обычные смертные также могут пользоваться магией при помощи свитков.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//Я могу показать тебе, как направлять и усиливать свои магические способности.
	VATRAS_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Маг воды Ватрас может помочь мне повысить мои магические способности.");
};


instance DIA_VATRAS_TEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 100;
	condition = dia_vatras_teach_condition;
	information = dia_vatras_teach_info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};


func int dia_vatras_teach_condition()
{
	if(VATRAS_TEACHMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_teach_info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//Я хочу повысить мои магические способности.
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 50)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//Твоя магическая энергия стала слишком велика, чтобы я мог еще повысить ее.
	};
	Info_ClearChoices(dia_vatras_teach);
};

func void dia_vatras_teach_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,50);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,50);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};


instance DIA_VATRAS_GODS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 98;
	condition = dia_vatras_gods_condition;
	information = dia_vatras_gods_info;
	permanent = TRUE;
	description = "Расскажи мне о богах.";
};


func int dia_vatras_gods_condition()
{
	return TRUE;
};

func void dia_vatras_gods_info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//Расскажи мне о богах.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//Что именно ты хочешь знать?
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Расскажи мне об Инносе.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Расскажи мне об Аданосе.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Расскажи мне о Белиаре.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_back()
{
	Info_ClearChoices(dia_vatras_gods);
};

func void dia_vatras_gods_innos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//Расскажи мне об Инносе.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//Хорошо. (проповедует) Иннос - первый и величайший из богов. Он создал солнце и мир.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//Он повелевает светом и огнем - его даром человечеству. Он суть закон и правосудие.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//Его жрецы - маги Огня, а паладины - его воины.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Расскажи мне об Инносе.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Расскажи мне об Аданосе.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Расскажи мне о Белиаре.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_adanos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//Расскажи мне об Аданосе.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//Аданос - бог центра. Он - весы правосудия, страж равновесия между Инносом и Белиаром.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//Он повелевает силой изменения. Его дар - вода во всех океанах, реках и озерах.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//Его жрецы - маги Воды. Я тоже слуга и жрец Аданоса.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Расскажи мне об Инносе.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Расскажи мне об Аданосе.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Расскажи мне о Белиаре.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_beliar()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//Расскажи мне о Белиаре.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//Белиар - это темный бог смерти, разрушения и всего неестественного.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//Он ведет вечную битву с Инносом, но Аданос стоит на страже баланса между этими двумя.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//Только немногие люди следуют зову Белиара, однако он дарует огромную силу своим слугам.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"Расскажи мне об Инносе.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"Расскажи мне об Аданосе.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"Расскажи мне о Белиаре.",dia_vatras_gods_beliar);
};


instance DIA_VATRAS_HEAL(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 99;
	condition = dia_vatras_heal_condition;
	information = dia_vatras_heal_info;
	permanent = TRUE;
	description = "Ты можешь вылечить меня?";
};


func int dia_vatras_heal_condition()
{
	return TRUE;
};

func void dia_vatras_heal_info()
{
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//Ты можешь вылечить меня?
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//(благочестиво) Аданос, благослови это тело. Освободи его от ран и вдохни в него силу новой жизни.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//Сейчас ты не нуждаешься в магии исцеления.
	};
};

func void b_sayvatrasgo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//Хорошо. Так иди же к мастеру Исгароту.
};


instance DIA_VATRAS_MISSION(C_INFO)
{
	npc = vlk_439_vatras;
	condition = dia_vatras_mission_condition;
	information = dia_vatras_mission_info;
	important = TRUE;
};


func int dia_vatras_mission_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_vatras_mission_info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//У меня есть сообщение для мастера Исгарота. Он охраняет часовню перед монастырем.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//Если ты выполнишь это задание для меня, ты можешь выбрать вознаграждение.
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Найди себе другого мальчика на побегушках, старик!",dia_vatras_mission_no);
	Info_AddChoice(dia_vatras_mission,"Я сделаю это.",dia_vatras_mission_yes);
};

func void dia_vatras_mission_yes()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//Я сделаю это.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//Хорошо, тогда доставь это сообщение и выбери один из этих свитков с заклинаниями.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//А когда ты доставишь сообщение, я вознагражу тебя соответствующим образом.
	b_giveinvitems(self,hero,itwr_vatrasmessage,1);
	MIS_VATRAS_MESSAGE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOTSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOTSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_BOTSCHAFT,"Ватрас дал мне записку для мастера Исгарота. Он находится в часовне неподалеку от монастыря.");
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"Я возьму заклинание света.",dia_vatras_mission_light);
	Info_AddChoice(dia_vatras_mission,"Я выбираю лечебное заклинание.",dia_vatras_mission_heal);
	Info_AddChoice(dia_vatras_mission,"Дай мне Ледяную стрелу.",dia_vatras_mission_ice);
};

func void dia_vatras_mission_no()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_NO_15_00");	//Найди себе другого мальчика на побегушках, старик!
	MIS_VATRAS_MESSAGE = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_heal()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//Я выбираю лечебное заклинание.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_lightheal,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_ice()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//Дай мне Ледяную стрелу.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_icebolt,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_light()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//Я возьму заклинание света.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_light,1);
	Info_ClearChoices(dia_vatras_mission);
};


instance DIA_VATRAS_MESSAGE_SUCCESS(C_INFO)
{
	npc = vlk_439_vatras;
	condition = dia_vatras_message_success_condition;
	information = dia_vatras_message_success_info;
	description = "Я доставил твое сообщение.";
};


func int dia_vatras_message_success_condition()
{
	if((MIS_VATRAS_MESSAGE == LOG_RUNNING) && (VATRAS_RETURN == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_message_success_info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//Я доставил твое сообщение.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//Прими мою благодарность. И свою награду.
	MIS_VATRAS_MESSAGE = LOG_SUCCESS;
	b_giveplayerxp(XP_VATRAS_MESSAGE);
	Info_ClearChoices(dia_vatras_message_success);
	Info_AddChoice(dia_vatras_message_success,"1 царский щавель",dia_vatras_message_success_plant);
	Info_AddChoice(dia_vatras_message_success,"Кольцо ловкости",dia_vatras_message_success_ring);
	Info_AddChoice(dia_vatras_message_success,"1 кусок руды",dia_vatras_message_success_ore);
};

func void dia_vatras_message_success_plant()
{
	b_giveinvitems(self,hero,itpl_perm_herb,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ring()
{
	b_giveinvitems(self,hero,itri_dex_01,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ore()
{
	b_giveinvitems(self,hero,itmi_nugget,1);
	Info_ClearChoices(dia_vatras_message_success);
};


const int KURZ = 0;
const int LANG = 1;
var int vatras_einmallangweg;

func void b_vatras_geheweg(var int dauer)
{
	if(VATRAS_EINMALLANGWEG == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,zs_preach_vatras))
	{
		b_stoplookat(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//Послушайте меня люди! Я нужен в другом месте.
		if(dauer == KURZ)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//Это не займет много времени. А когда я вернусь, я расскажу вам окончание этой истории.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//Я не знаю, вернусь ли я. Если же вы хотите знать окончание, прочтите эту историю в писаниях.
			VATRAS_EINMALLANGWEG = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//Да пребудет с вами Аданос!
		b_turntonpc(self,other);
	};
	VATRAS_SCHICKELEUTEWEG = TRUE;
};


instance DIA_VATRAS_INNOSEYEKAPUTT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 32;
	condition = dia_vatras_innoseyekaputt_condition;
	information = dia_vatras_innoseyekaputt_info;
	description = "Глаз Инноса поврежден.";
};


func int dia_vatras_innoseyekaputt_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_vatras_innoseyekaputt_info()
{
	if(MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//Меня прислал Пирокар.
	}
	else if(MIS_XARDAS_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//Меня прислал Ксардас.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//Глаз Инноса поврежден.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//Я знаю. Я уже узнал об этом от одного очень огорченного послушника.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//Ищущие использовали Круг Солнца магов Огня, чтобы уничтожить Глаз.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//Я бы назвал это вынужденным шагом врага.
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Info_AddChoice(dia_vatras_innoseyekaputt,"В этом городе новости распространяются быстро.",dia_vatras_innoseyekaputt_schnellenachrichten);
	if((hero.guild == GIL_KDF) && (MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING))
	{
		Info_AddChoice(dia_vatras_innoseyekaputt,"Почему Пирокар послал меня именно к тебе?",dia_vatras_innoseyekaputt_warumdu);
	};
	Info_AddChoice(dia_vatras_innoseyekaputt,"Что теперь будет с Глазом?",dia_vatras_innoseyekaputt_auge);
};

func void dia_vatras_innoseyekaputt_auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//Что теперь будет с Глазом?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//Мы должны восстановить его. Но это, боюсь, будет непростой задачей.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//Оправа разбита на две части. Искусный кузнец должен быть способен починить ее.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//Но проблема не в этом. Меня больше волнует драгоценный камень.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//Он тускл и безжизнен. Враг, похоже, хорошо знал, как ослабить его.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Где мне найти кузнеца, способного починить оправу?",dia_vatras_innoseyekaputt_auge_schmied);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Как можно восстановить силу камня?",dia_vatras_innoseyekaputt_auge_stein);
};

func void dia_vatras_innoseyekaputt_auge_stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//Как можно восстановить силу камня?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//Я вижу только один способ. Союз трех правящих божеств должен дать желаемый эффект.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//Хорошо подготовленный ритуал обращения в месте уничтожения камня вернет ему его огонь.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//Однако проблема состоит в том, что ты должен привести в это место земных представителей каждого их этих троих богов.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//Кроме того, для этого ритуала необходимо много болотной травы. Я думаю, необходимо не менее 3-х растений.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Кто может быть этими тремя земными представителями богов?",dia_vatras_innoseyekaputt_auge_stein_wer);
	Info_AddChoice(dia_vatras_innoseyekaputt,"Где мне найти болотную траву?",dia_vatras_innoseyekaputt_auge_stein_kraut);
};

func void dia_vatras_innoseyekaputt_auge_stein_kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//Где мне найти болотную траву?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//Я слышал о старой шаманке Сагитте, живущей в лесу. Предположительно, она продает такие травы.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//Но также ты можешь попытать счастья в местной гавани.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//Кто может быть этими тремя земными представителями богов?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//Я буду представлять бога Аданоса лично.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//Пирокар, высший маг Огня, был бы подходящей кандидатурой на представителя бога Инноса.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//Но для Белиара, мне не приходит в голову подходящий кандидат. Это должен быть кто-то, кто владеет черной магией.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Черной магией? А что насчет Ксардаса?",dia_vatras_innoseyekaputt_auge_stein_wer_xardas);
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//Черной магией? А что насчет Ксардаса?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//Точно. Это может сработать.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//Но я задаю себе вопрос - как ты приведешь нас троих в одно место.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//Представляю выражение лица Пирокара, когда он услышит, что должен работать рука об руку с Ксардасом.
	Info_AddChoice(dia_vatras_innoseyekaputt,"Я должен идти.",dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter);
};

func void dia_vatras_innoseyekaputt_auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//Где мне найти кузнеца, способного починить оправу Глаза?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//Поспрашивай вокруг о том, кто может ремонтировать драгоценности.
};

func void dia_vatras_innoseyekaputt_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//Почему Пирокар послал меня именно к тебе?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//Я подозревал, что рано или поздно что-то подобное должно было случиться.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//Пирокар всегда считал себя таким неуязвимым и непревзойденным, что это почти граничило с беспечностью.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//Так, его меры предосторожности по защите Глаза были тоже беспечными.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//Я просто думаю, что он подсознательно полагается на способности, которые Аданос даровал мне.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//Невыносимо думать, что могло бы произойти, если бы я сейчас был недоступен.
};

func void dia_vatras_innoseyekaputt_schnellenachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//В этом городе новости распространяются быстро.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//Это конечно хорошо, но враг тоже не будет спать.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//Я должен идти.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//Я тоже должен отправляться в путь, чтобы подготовить церемонию в Круге Солнца.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//Пошли Ксардаса и Пирокара туда. И не забудь принести болотную траву. Я полагаюсь на тебя.
	b_logentry(TOPIC_INNOSEYE,"Ватрас хочет провести ритуал в Круге Солнца, чтобы восстановить Глаз. Я должен убедить Ксардаса и Пирокара принять в нем участие. Также, я должен найти кузнеца, который может починить поврежденную оправу амулета.");
	MIS_RITUALINNOSEYEREPAIR = LOG_RUNNING;
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	b_vatras_geheweg(KURZ);
	dmt_1201.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1202.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1203.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1204.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1205.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1206.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1207.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1208.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1209.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1210.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1211.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_startotherroutine(dmt_1201,"AfterRitual");
	b_startotherroutine(dmt_1202,"AfterRitual");
	b_startotherroutine(dmt_1203,"AfterRitual");
	b_startotherroutine(dmt_1204,"AfterRitual");
	b_startotherroutine(dmt_1205,"AfterRitual");
	b_startotherroutine(dmt_1206,"AfterRitual");
	b_startotherroutine(dmt_1207,"AfterRitual");
	b_startotherroutine(dmt_1208,"AfterRitual");
	b_startotherroutine(dmt_1209,"AfterRitual");
	b_startotherroutine(dmt_1210,"AfterRitual");
	b_startotherroutine(dmt_1211,"AfterRitual");
};


instance DIA_VATRAS_RITUALINNOSEYEREPAIR(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_ritualinnoseyerepair_condition;
	information = dia_vatras_ritualinnoseyerepair_info;
	permanent = TRUE;
	description = "Как обстоят дела с Глазом Инноса?";
};


func int dia_vatras_ritualinnoseyerepair_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_vatras_ritualinnoseyerepair_info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//Как обстоят дела с Глазом Инноса?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//Помни: только ритуал обращения в Круге Солнца вместе с Ксардасом и Пирокаром восстановит Глаз.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//И не забудь принести Глаз с отремонтированной оправой.
};


instance DIA_VATRAS_BEGINN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 31;
	condition = dia_vatras_beginn_condition;
	information = dia_vatras_beginn_info;
	description = "Я сделал все, как ты сказал мне.";
};


func int dia_vatras_beginn_condition()
{
	if((KAPITEL == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_vatras_beginn_info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//Я сделал все, как ты сказал мне. Вот починенный Глаз.
	b_giveplayerxp(XP_RITUALINNOSEYERUNS);
	b_giveinvitems(other,self,itmi_innoseye_broken_mis,1);
	Npc_RemoveInvItem(self,itmi_innoseye_broken_mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//Да, теперь все готово для проведения ритуала.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//Что насчет болотной травы?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//Ах, да. Ты принес 3 стебля болотной травы?
	if(b_giveinvitems(other,self,itpl_swampherb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//Гм. Да. Вот 3 растения.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//Превосходно.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//Нет, боже мой, нет!
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//Хорошо. Тогда нам придется обойтись без нее.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//Ты хорошо поработал, но теперь отойди в сторону, чтобы мы могли начать церемонию. Да объединятся наши души!
	Info_ClearChoices(dia_vatras_beginn);
	Info_AddChoice(dia_vatras_beginn,DIALOG_ENDE,dia_vatras_beginn_los);
};

func void dia_vatras_beginn_los()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	b_startotherroutine(xardas,"RITUALINNOSEYE");
	b_startotherroutine(pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RITUALINNOSEYERUNS = LOG_RUNNING;
};


instance DIA_VATRAS_AUGEGEHEILT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_augegeheilt_condition;
	information = dia_vatras_augegeheilt_info;
	important = TRUE;
};


func int dia_vatras_augegeheilt_condition()
{
	if((KAPITEL == 3) && (RITUALINNOSEYERUNS == LOG_RUNNING) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_augegeheilt_info()
{
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//Мы закончили. Нам удалось разрушить план врага и восстановить Глаз.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//Пусть Пирокар объяснит тебе, как пользоваться его силой.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//Надеюсь, я еще увижу тебя, когда ты выполнишь свою миссию. Прощай.
	b_logentry(TOPIC_INNOSEYE,"Глаз был восстановлен. Пирокар отдает его мне, и начинается охота на драконов.");
	AI_StopProcessInfos(self);
	RITUALINNOSEYERUNS = LOG_SUCCESS;
	MIS_RITUALINNOSEYEREPAIR = LOG_SUCCESS;
	b_startotherroutine(pyrokar,"RitualInnosEyeRepair");
	b_startotherroutine(xardas,"RitualInnosEyeRepair");
	b_startotherroutine(vlk_455_buerger,"START");
	b_startotherroutine(vlk_454_buerger,"START");
	b_startotherroutine(vlk_428_buergerin,"START");
	b_startotherroutine(vlk_450_buerger,"START");
	b_startotherroutine(vlk_426_buergerin,"START");
	b_startotherroutine(vlk_421_valentino,"START");
};


instance DIA_VATRAS_PERMKAP3(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_permkap3_condition;
	information = dia_vatras_permkap3_info;
	description = "Спасибо, что помог восстановить Глаз Инноса.";
};


func int dia_vatras_permkap3_condition()
{
	if(MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_vatras_permkap3_info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//Спасибо, что помог восстановить Глаз Инноса.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//Оставь пустые слова благодарности. Самое тяжелое еще ждет тебя впереди.
	if(MIS_READYFORCHAPTER4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//Поговори с Пирокаром, он объяснит все, что тебе нужно знать.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//Надеюсь, увидеть тебя опять целым и невредимым, сын мой.
};


instance DIA_VATRAS_HILDAKRANK(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 34;
	condition = dia_vatras_hildakrank_condition;
	information = dia_vatras_hildakrank_info;
	description = "Жена Лобарта, Хильда, больна.";
};


func int dia_vatras_hildakrank_condition()
{
	if((MIS_HEALHILDA == LOG_RUNNING) && Npc_KnowsInfo(other,dia_vatras_greet))
	{
		return TRUE;
	};
};

func void dia_vatras_hildakrank_info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//Жена Лобарта, Хильда, больна.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//Что? Опять? Эта добрая женщина должна больше заботиться о себе.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//Еще одна тяжелая зима, и ее с нами больше не будет. Хорошо, я дам ей лекарство, которое облегчит лихорадку.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//Ох, знаешь, раз все равно ты здесь, ты мог бы занести ей его.
	CreateInvItems(self,itpo_healhilda_mis,1);
	b_giveinvitems(self,other,itpo_healhilda_mis,1);
};


instance DIA_VATRAS_OBSESSION(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 35;
	condition = dia_vatras_obsession_condition;
	information = dia_vatras_obsession_info;
	description = "Я ощущаю внутреннюю тревогу.";
};


func int dia_vatras_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (SC_OBSESSIONTIMES < 1))
	{
		return TRUE;
	};
};

func void dia_vatras_obsession_info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//Я ощущаю внутреннюю тревогу.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//Да, и выглядишь ты бледно. Ты слишком долго подвергался воздействию черного взгляда Ищущих.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//Все, что я могу - это вылечить твое тело, но только монастырь может очистить твою душу. Поговори с Пирокаром. Он поможет тебе.
};


instance DIA_VATRAS_ALLDRAGONSDEAD(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 59;
	condition = dia_vatras_alldragonsdead_condition;
	information = dia_vatras_alldragonsdead_info;
	description = "Драконы больше не будут сеять хаос.";
};


func int dia_vatras_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_vatras_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//Драконы больше не будут сеять хаос.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//Я знал, что ты вернешься в добром здравии. Однако самое суровое испытание еще ждет тебя впереди.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//Я знаю.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//Тогда найди себе снаряжение получше и приходи ко мне, если тебе нужна помощь. И всегда носи с собой Глаз Инноса, слышишь? Аданос благословляет тебя.
};


instance DIA_VATRAS_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_knowwhereenemy_condition;
	information = dia_vatras_knowwhereenemy_info;
	permanent = TRUE;
	description = "Я знаю, где находится наш враг.";
};


func int dia_vatras_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (VATRAS_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//Я знаю, где находится наш враг.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//Тогда не будем терять времени и найдем его в его логове, пока он сам не пришел к нам.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//Ты хочешь сопровождать меня?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//Я много думал об этом. Да, я никогда не был так уверен в своем выборе, мой друг.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"Как это ни странно, Ватрас предложил мне сопровождать меня в моем путешествии. Человек, обладающий его навыками и опытом может оказаться очень полезным для меня.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//В моем списке и так уже слишком много народа. Боюсь, там не найдется места для тебя.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//Так освободи место. Я тебе понадоблюсь.
	}
	else
	{
		Info_ClearChoices(dia_vatras_knowwhereenemy);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Мне нужно еще подумать об этом.",dia_vatras_knowwhereenemy_no);
		Info_AddChoice(dia_vatras_knowwhereenemy,"Я сочту за честь, что ты будешь на моей стороне.",dia_vatras_knowwhereenemy_yes);
	};
};

func void dia_vatras_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//Я сочту за честь, что ты будешь на моей стороне. Встретимся в гавани.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//Только не трать время понапрасну. Помни, друг мой, враг не дремлет.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	b_vatras_geheweg(LANG);
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};

func void dia_vatras_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//Мне нужно еще подумать об этом.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//Как знаешь. Возвращайся ко мне, если передумаешь.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};


instance DIA_VATRAS_LEAVEMYSHIP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_leavemyship_condition;
	information = dia_vatras_leavemyship_info;
	permanent = TRUE;
	description = "Тебе лучше остаться здесь. Ты нужен городу.";
};


func int dia_vatras_leavemyship_condition()
{
	if((VATRAS_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_leavemyship_info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//Тебе лучше остаться здесь. Ты нужен городу.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//Возможно, ты прав. И все же я готов сопровождать тебя, если ты этого захочешь. Ты знаешь это.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_VATRAS_STILLNEEDYOU(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_stillneedyou_condition;
	information = dia_vatras_stillneedyou_info;
	permanent = TRUE;
	description = "Поплывем вместе на вражеский остров.";
};


func int dia_vatras_stillneedyou_condition()
{
	if(((VATRAS_ISONBOARD == LOG_OBSOLETE) || (VATRAS_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_vatras_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//Поплывем вместе на вражеский остров.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//Мудрое решение. Надеюсь, ты больше его не переменишь.
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_vatras_geheweg(LANG);
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

