
instance DIA_MILTENOW_EXIT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 999;
	condition = dia_miltenow_exit_condition;
	information = dia_miltenow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltenow_exit_condition()
{
	return TRUE;
};

func void dia_miltenow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENOW_HELLO(C_INFO)
{
	npc = pc_mage_ow;
	nr = TRUE;
	condition = dia_miltenow_hello_condition;
	information = dia_miltenow_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltenow_hello_condition()
{
	return TRUE;
};

func void dia_miltenow_hello_info()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_03_00");	//Посмотрите, кто вернулся! Наш герой из-за Барьера!
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Рад видеть тебя, Милтен.",dia_miltenow_hello_yes);
	Info_AddChoice(dia_miltenow_hello,"Я знаю тебя?",dia_miltenow_hello_no);
};

func void b_milten_gorndiegolester()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_02");	//Ты помнишь Горна, Диего и Лестера?
};

func void dia_miltenow_hello_yes()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_YES_15_00");	//Рад видеть тебя, Милтен. Ты все еще здесь или здесь опять?
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_01");	//Опять. После того как Барьер рухнул, я вступил в монастырь Магов Огня.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_02");	//Но когда стало ясно, что паладины хотят отправиться сюда, мой опыт и знание этих мест оказались весьма полезными.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_03");	//Поэтому было решено доверить мне эту священную миссию обеспечения магической поддержки экспедиции.
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Конечно же, я помню парней.",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"Эти имена ни о чем мне не говорят.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_no()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_NO_15_00");	//Я должен знать их?
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_01");	//Ты через многое прошел, да?
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"Как здесь обстоят дела?",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"Эти имена ни о чем мне не говорят.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_friends()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_00");	//Конечно же, я помню парней.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_01");	//Ну, Горн и Диего не ушли далеко. Их подобрали паладины здесь, в долине.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_02");	//Лестер исчез, впрочем - и я понятия не имею, где он сейчас ошивается.
	if(Npc_KnowsInfo(other,dia_lester_hello))
	{
		AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03");	//Я встретил Лестера - он теперь с Ксардасом.
		AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_04");	//Ну, хоть какие-то хорошие новости.
	};
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_05");	//Ну, а у меня нет ничего хорошего.
	KNOWS_DIEGO = TRUE;
	Info_ClearChoices(dia_miltenow_hello);
};

func void dia_miltenow_hello_forget()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Forget_15_00");	//Эти имена ни о чем мне не говорят.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_01");	//Ты многое забыл, да? Что ж, оставим прошлое в покое и посвятим себя делам нынешних дней.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_02");	//Хотя у меня и нет приятных новостей.
	Info_ClearChoices(dia_miltenow_hello);
};


instance DIA_MILTENOW_BERICHT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 3;
	condition = dia_miltenow_bericht_condition;
	information = dia_miltenow_bericht_info;
	permanent = FALSE;
	description = "Как здесь обстоят дела?";
};


func int dia_miltenow_bericht_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_hello))
	{
		return TRUE;
	};
};

func void dia_miltenow_bericht_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Bericht_15_00");	//Как здесь обстоят дела?
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_01");	//Паладины пришли сюда, чтобы добывать магическую руду.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_02");	//Но из-за всех этих нападений драконов и орков я сомневаюсь, что паладины уйдут отсюда с рудой.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_03");	//Нет, клянусь Инносом - я чувствую присутствие чего-то темного... какого-то зла, оно разрастается здесь. Что-то, темное поднимается от этой долины.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_04");	//Мы заплатили высокую цену за уничтожение Спящего. Разрушение Барьера погубило и это место.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_05");	//Мы можем считать себя счастливчиками, если нам удастся пережить все это.
};


instance DIA_MILTENOW_ERZ(C_INFO)
{
	npc = pc_mage_ow;
	nr = 4;
	condition = dia_miltenow_erz_condition;
	information = dia_miltenow_erz_info;
	permanent = FALSE;
	description = "Сколько руды удалось добыть?";
};


func int dia_miltenow_erz_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_bericht))
	{
		return TRUE;
	};
};

func void dia_miltenow_erz_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Erz_15_00");	//Сколько руды удалось добыть?
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_01");	//Сколько руды?.. Ни одного ящика! У нас уже давно нет вестей от старателей.
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_02");	//Я не удивлюсь, если они все давно мертвы. А нас атакуют драконы и осаждают орки!
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_03");	//Эта экспедиция обернулась полным провалом.
};


instance DIA_MILTENOW_WO(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_wo_condition;
	information = dia_miltenow_wo_info;
	permanent = FALSE;
	description = "А где сейчас Горн и Диего?";
};


func int dia_miltenow_wo_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_hello) && (KNOWS_DIEGO == TRUE))
	{
		return TRUE;
	};
};

func void dia_miltenow_wo_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Wo_Forget_15_00");	//А где сейчас Горн и Диего?
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_01");	//Ну, Горн сидит здесь, в темнице, за то, что сопротивлялся аресту.
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_02");	//Диего прикрепили к отряду старателей. Спроси паладина Парсиваля, он отправлял этот отряд.
	KNOWSABOUTGORN = TRUE;
	SEARCHFORDIEGO = LOG_RUNNING;
};


instance DIA_MILTENOW_GORN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_gorn_condition;
	information = dia_miltenow_gorn_info;
	permanent = FALSE;
	description = "Пойдем, освободим Горна!";
};


func int dia_miltenow_gorn_condition()
{
	if((KNOWSABOUTGORN == TRUE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_gorn_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_00");	//Пойдем, освободим Горна!
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_01");	//Ну... проблема заключается в том, что Горн - осужденный заключенный.
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_02");	//Но если нам повезет, Гаронд согласится на сделку и мы сможем купить Горну свободу.
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_03");	//Да, может быть...
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_04");	//Держи меня в курсе.
	Log_CreateTopic(TOPIC_RESCUEGORN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEGORN,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEGORN,"Командующий Гаронд посадил Горна в тюрьму. Возможно, с ним можно договориться и нам удастся вытащить беднягу.");
};


instance DIA_MILTENOW_PREIS(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_preis_condition;
	information = dia_miltenow_preis_info;
	permanent = FALSE;
	description = "Гаронд хочет 1000 золотых монет за Горна.";
};


func int dia_miltenow_preis_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_preis_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Preis_15_00");	//Гаронд хочет 1000 золотых монет за Горна.
	AI_Output(self,other,"DIA_MiltenOW_Preis_03_01");	//Немаленькая сумма. Я могу пожертвовать 250 монет.
	b_giveinvitems(self,other,itmi_gold,250);
	b_logentry(TOPIC_RESCUEGORN,"Милтен дал мне 250 золота, чтобы я заплатил за освобождение Горна.");
};


instance DIA_MILTENOW_MEHR(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_mehr_condition;
	information = dia_miltenow_mehr_info;
	permanent = FALSE;
	description = "Мне нужно больше золота, чтобы купить свободу Горна.";
};


func int dia_miltenow_mehr_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2) && (Npc_HasItems(other,itmi_gold) < 1000) && Npc_KnowsInfo(other,dia_miltenow_preis))
	{
		return TRUE;
	};
};

func void dia_miltenow_mehr_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mehr_15_00");	//Мне нужно больше золота, чтобы купить свободу Горна.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_01");	//Добыть еще золота... Хм, Диего мог бы помочь, но его здесь нет.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_02");	//Может, Горн припрятал где-нибудь золото для себя. Нужно выяснить это.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_03");	//Я напишу ему записку - вот, попробуй передать ее в темницу.
	b_giveinvitems(self,other,itwr_letterforgorn_mis,1);
	b_logentry(TOPIC_RESCUEGORN,"Милтен дал мне записку для Горна. Если я смогу пробраться в тюрьму, возможно, Горн сможет сообщить, не припрятал ли он где-нибудь немного золота.");
};


instance DIA_MILTENOW_EQUIPMENT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_equipment_condition;
	information = dia_miltenow_equipment_info;
	permanent = FALSE;
	description = "Ты можешь обеспечить меня снаряжением?";
};


func int dia_miltenow_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_equipment) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_miltenow_equipment_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Equipmentt_15_00");	//Ты можешь обеспечить меня снаряжением? Гаронд попросил меня отправиться в шахты.
	AI_Output(self,other,"DIA_MiltenOW_Equipment_03_01");	//И где я, по-твоему, возьму его? Единственное, что я могу тебе дать, - это ценный рунный камень.
	b_giveinvitems(self,other,itmi_runeblank,1);
};


instance DIA_MILTENOW_VERSTECK(C_INFO)
{
	npc = pc_mage_ow;
	nr = 1;
	condition = dia_miltenow_versteck_condition;
	information = dia_miltenow_versteck_info;
	permanent = FALSE;
	important = FALSE;
	description = "Я получил ответ от Горна...";
};


func int dia_miltenow_versteck_condition()
{
	if((GORNSTREASURE == TRUE) && (Npc_HasItems(other,itmi_gornstreasure_mis) <= 0) && (GORNS_BEUTEL == FALSE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_versteck_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_00");	//Я получил ответ от Горна. Он говорит, что его золото находится у южных ворот.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_01");	//(с горечью) Бывших южных ворот, ты хочешь сказать. Дракон превратил их в развалины.
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_02");	//Как мне добраться туда?
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_03");	//Это неподалеку от тарана орков. Южные ворота были справа от него.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_04");	//Это будет непросто - так что постарайся сделать все побыстрее и не привлекая внимания врага.
	b_logentry(TOPIC_RESCUEGORN,"Бывшие южные ворота находятся справа от тарана орков. Золото Горна спрятано где-то там.");
};


instance DIA_MILTENOW_FREI(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_frei_condition;
	information = dia_miltenow_frei_info;
	permanent = FALSE;
	description = "Я освободил Горна.";
};


func int dia_miltenow_frei_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_frei_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Frei_15_00");	//Я освободил Горна.
	AI_Output(self,other,"DIA_MiltenOW_Frei_03_01");	//Хорошо. Теперь мы можем подумать о том, что делать дальше.
};


instance DIA_MILTENOW_LEHREN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 9;
	condition = dia_miltenow_lehren_condition;
	information = dia_miltenow_lehren_info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int dia_miltenow_lehren_condition()
{
	if((other.guild == GIL_KDF) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_lehren_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Lehren_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_01");	//Я могу обучить тебя магии из второго круга, или я могу помочь повысить твою магическую энергию.
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_02");	//Если ты готов повысить свою энергию, я могу обучить тебя.
};


instance DIA_MILTENOW_TEACHCIRCLE2(C_INFO)
{
	npc = pc_mage_ow;
	nr = 91;
	condition = dia_miltenow_teachcircle2_condition;
	information = dia_miltenow_teachcircle2_info;
	permanent = TRUE;
	description = "Обучи меня второму кругу магии!";
};


func int dia_miltenow_teachcircle2_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_teachcircle2_info()
{
	AI_Output(other,self,"DIA_Milten_Add_15_00");	//Обучи меня второму кругу магии!
	AI_Output(self,other,"DIA_Milten_Add_03_01");	//Это обычно привилегия учителей нашего ордена.
	AI_Output(self,other,"DIA_Milten_Add_03_02");	//Но я думаю, что в твоем случае мы можем сделать исключение...
	if(b_teachmagiccircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Milten_Add_03_03");	//Я не уверен, что помню все эти официальные и торжественные слова...
		AI_Output(self,other,"DIA_Milten_Add_03_04");	//Войди во второй круг. Э-э... он покажет тебе направление, но твои дела формируют путь..
		AI_Output(self,other,"DIA_Milten_Add_03_05");	//Я думаю, ты понимаешь, о чем все это...
	};
};


instance DIA_MILTENOW_TEACH(C_INFO)
{
	npc = pc_mage_ow;
	nr = 90;
	condition = dia_miltenow_teach_condition;
	information = dia_miltenow_teach_info;
	permanent = TRUE;
	description = "Я хочу изучить новые заклинания.";
};


func int dia_miltenow_teach_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_teach_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Teach_15_00");	//Я хочу изучить новые заклинания.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(dia_miltenow_teach);
		Info_AddChoice(dia_miltenow_teach,DIALOG_BACK,dia_miltenow_teach_back);
		if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_miltenow_teach_windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_miltenow_teach_feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_miltenow_teach_eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenOW_Teach_03_01");	//Ты все еще не достиг второго круга магии. Я ничему не могу научить тебя.
	};
};

func void dia_miltenow_teach_back()
{
	Info_ClearChoices(dia_miltenow_teach);
};

func void dia_miltenow_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_miltenow_teach_feuerball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_miltenow_teach_eispfeil()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};


instance DIA_MILTENOW_MANA(C_INFO)
{
	npc = pc_mage_ow;
	nr = 100;
	condition = dia_miltenow_mana_condition;
	information = dia_miltenow_mana_info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};


func int dia_miltenow_mana_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (other.attribute[ATR_MANA_MAX] < 100) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_mana_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mana_15_00");	//Я хочу повысить мои магические способности
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};

func void dia_miltenow_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 100)
	{
		AI_Output(self,other,"DIA_MiltenOW_Mana_03_00");	//Твоя магическая энергия велика. Слишком велика, чтобы я мог увеличить ее.
	};
	Info_ClearChoices(dia_miltenow_mana);
};

func void dia_miltenow_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,100);
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};

func void dia_miltenow_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,100);
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};


instance DIA_MILTENOW_PERM(C_INFO)
{
	npc = pc_mage_ow;
	nr = 101;
	condition = dia_miltenow_perm_condition;
	information = dia_miltenow_perm_info;
	permanent = TRUE;
	description = "А какие у тебя здесь обязанности?";
};


func int dia_miltenow_perm_condition()
{
	if((KAPITEL == 2) && (Npc_KnowsInfo(other,dia_miltenow_frei) == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltenow_perm_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Perm_15_00");	//А какие у тебя здесь обязанности?
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_01");	//Изначально, я должен был проверять магическую руду. Но она здесь редко попадала мне в руки.
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_02");	//И теперь я сосредоточился на изучении алхимии.
};


instance DIA_MILTENOW_PLAN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 101;
	condition = dia_miltenow_plan_condition;
	information = dia_miltenow_plan_info;
	permanent = TRUE;
	description = "Что ты планируешь делать дальше?";
};


func int dia_miltenow_plan_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_miltenow_frei))
	{
		return TRUE;
	};
};

func void dia_miltenow_plan_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_00");	//Что ты планируешь делать дальше?
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_01");	//Я вернусь. Подожду еще немного, и теперь, когда Горн свободен, я могу отправиться в путь вместе с ним.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_02");	//Крайне важно, чтобы Пирокар узнал о ситуации здесь.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_03");	//Ну, если ты так считаешь.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_04");	//Я надеюсь, что лорд Хаген поймет, какая угроза исходит от этой долины. Не хочется думать, что произойдет, если орки пройдут через Проход.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_05");	//Ну, тогда удачного путешествия.
};


instance DIA_MILTENOW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_ow;
	nr = 888;
	condition = dia_miltenow_pickpocket_condition;
	information = dia_miltenow_pickpocket_info;
	permanent = TRUE;
	description = "(украсть его зелье будет сложно)";
};


func int dia_miltenow_pickpocket_condition()
{
	if((self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (other.attribute[ATR_DEXTERITY] >= (80 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_miltenow_pickpocket_info()
{
	Info_ClearChoices(dia_miltenow_pickpocket);
	Info_AddChoice(dia_miltenow_pickpocket,DIALOG_BACK,dia_miltenow_pickpocket_back);
	Info_AddChoice(dia_miltenow_pickpocket,DIALOG_PICKPOCKET,dia_miltenow_pickpocket_doit);
};

func void dia_miltenow_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self,itpo_perm_mana,1);
		b_giveinvitems(self,other,itpo_perm_mana,1);
		b_givethiefxp();
		Info_ClearChoices(dia_miltenow_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_miltenow_pickpocket_back()
{
	Info_ClearChoices(dia_miltenow_pickpocket);
};

