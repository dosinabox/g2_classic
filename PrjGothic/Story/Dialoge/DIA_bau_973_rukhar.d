
instance DIA_RUKHAR_EXIT(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 999;
	condition = dia_rukhar_exit_condition;
	information = dia_rukhar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rukhar_exit_condition()
{
	return TRUE;
};

func void dia_rukhar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_HALLO(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 4;
	condition = dia_rukhar_hallo_condition;
	information = dia_rukhar_hallo_info;
	description = "Как здесь пиво?";
};


func int dia_rukhar_hallo_condition()
{
	return TRUE;
};

func void dia_rukhar_hallo_info()
{
	AI_Output(other,self,"DIA_Rukhar_HALLO_15_00");	//Как здесь пиво?
	AI_Output(self,other,"DIA_Rukhar_HALLO_12_01");	//Не самое лучшее, но в наше время не приходится особенно привередничать.
};


instance DIA_RUKHAR_WASMACHSTDU(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 5;
	condition = dia_rukhar_wasmachstdu_condition;
	information = dia_rukhar_wasmachstdu_info;
	description = "Что ты делаешь здесь?";
};


func int dia_rukhar_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_hallo))
	{
		return TRUE;
	};
};

func void dia_rukhar_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Rukhar_WASMACHSTDU_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_01");	//Еще несколько недель назад вкалывал как раб на ферме Онара.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_02");	//Но однажды я понял, что больше так не выдержу и сбежал оттуда.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_03");	//Теперь я сам себе хозяин. Все, что принадлежит мне, находится в этом сундуке. И больше мне ничего не нужно.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_04");	//Не хочешь посостязаться со мной?
	Log_CreateTopic(TOPIC_WETTSAUFEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WETTSAUFEN,LOG_RUNNING);
	b_logentry(TOPIC_WETTSAUFEN,"В таверне можно заключить пари.");
};


instance DIA_RUKHAR_WETTKAMPF(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_wettkampf_condition;
	information = dia_rukhar_wettkampf_info;
	description = "А что это за состязание?";
};


func int dia_rukhar_wettkampf_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rukhar_wettkampf_info()
{
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_00");	//А что это за состязание?
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_01");	//Я называю это 'ПЕЙ ДО ДНА'.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_02");	//Правила очень просты.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_03");	//Мы по очереди заказываем по кружке этого превосходного пива, которое предлагает этот старый чудак.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_04");	//Каждую кружку нужно осушить до дна, так, чтобы стол остался сухим, если ее перевернуть вверх дном.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_05");	//Выигрывает тот, кто дольше сможет держаться на ногах. Проигравший оплачивает пиво и ставку. Ну? Как тебе это?
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_06");	//Может быть позже, когда я не буду так торопиться.
};


instance DIA_RUKHAR_HOLERANDOLPH(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_holerandolph_condition;
	information = dia_rukhar_holerandolph_info;
	description = "Могу я поставить на кого-нибудь еще?";
};


func int dia_rukhar_holerandolph_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wettkampf))
	{
		return TRUE;
	};
};

func void dia_rukhar_holerandolph_info()
{
	AI_Output(other,self,"DIA_Rukhar_HOLERANDOLPH_15_00");	//Могу я поставить на кого-нибудь еще?
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_01");	//Конечно. Если ты найдешь кого-нибудь, у кого хватит смелости померяться со мной силами, я приму твою ставку.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_02");	//Все кладут одинаковые ставки в горшок. Победитель забирает все. Размер ставки зависит только от размера твоего кошелька.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_03");	//Приведи мне кого-нибудь, кто осмелится померяться со мной силами, и я приму твою ставку.
	b_logentry(TOPIC_WETTSAUFEN,"Рухар называет эту игру ПЕЙ ДО ДНА. Нет, спасибо, мне это не интересно. Я найду кого-нибудь еще для него. Пусть дурачит других, но не меня.");
};


instance DIA_RUKHAR_RANDOLPHWILL(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_randolphwill_condition;
	information = dia_rukhar_randolphwill_info;
	permanent = TRUE;
	description = "Я нашел человека, который хочет сразиться с тобой.";
};


var int dia_rukhar_randolphwill_noperm;

func int dia_rukhar_randolphwill_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_gegenwen) && Npc_KnowsInfo(other,dia_rukhar_holerandolph) && (DIA_RUKHAR_RANDOLPHWILL_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_rukhar_randolphwill_info()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_00");	//Я нашел человека, который хочет сразиться с тобой.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_01");	//Кто это?
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_02");	//Рендольф.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_03");	//Хо хо. Рендольф хвастун? Хорошо. Почему бы и нет.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_04");	//Пришли этого слизняка ко мне, и сделай ставку.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_05");	//Ты можешь выставить его еще раз не раньше чем через 2 дня. Кто знает? Может, тебе повезет, и он успеет протрезветь.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_06");	//Какова твоя ставка?
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"Ноль.",dia_rukhar_randolphwill_nix);
	Info_AddChoice(dia_rukhar_randolphwill,"100.",dia_rukhar_randolphwill_100);
	Info_AddChoice(dia_rukhar_randolphwill,"50.",dia_rukhar_randolphwill_50);
	Info_AddChoice(dia_rukhar_randolphwill,"20.",dia_rukhar_randolphwill_20);
	Info_AddChoice(dia_rukhar_randolphwill,"10 золотых.",dia_rukhar_randolphwill_10);
};

func void dia_rukhar_randolphwill_annehmen()
{
	Info_ClearChoices(dia_rukhar_randolphwill);
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_annehmen_12_00");	//Я возьму твою ставку и подержу ее у себя, пока состязание не будет окончено, хорошо?
	DIA_RUKHAR_RANDOLPHWILL_NOPERM = TRUE;
};

func void dia_rukhar_randolphwill_mehr()
{
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"Ноль.",dia_rukhar_randolphwill_nix);
	Info_AddChoice(dia_rukhar_randolphwill,"100.",dia_rukhar_randolphwill_100);
	Info_AddChoice(dia_rukhar_randolphwill,"50.",dia_rukhar_randolphwill_50);
	Info_AddChoice(dia_rukhar_randolphwill,"20.",dia_rukhar_randolphwill_20);
	Info_AddChoice(dia_rukhar_randolphwill,"10 золотых.",dia_rukhar_randolphwill_10);
};

func void dia_rukhar_randolphwill_nix()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_nix_15_00");	//Ноль.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_nix_12_01");	//Тогда нам лучше забыть о состязании.
	AI_StopProcessInfos(self);
};

func void dia_rukhar_randolphwill_10()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_10_15_00");	//10 золотых.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_10_12_01");	//Да ладно, ты, должно быть, шутишь. Еще несколько золотых не разорят тебя.
	RUKHAR_EINSATZ = 10;
	RUKHAR_GEWINN = 20;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(выбрать другую ставку)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(принять ставку)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_20()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_20_15_00");	//20.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_20_12_01");	//Если ты хочешь сделать ставку, то делай уж это по-человечески.
	RUKHAR_EINSATZ = 20;
	RUKHAR_GEWINN = 40;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(выбрать другую ставку)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(принять ставку)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_50()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_50_15_00");	//50.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_50_12_01");	//Не робей. Смелее.
	RUKHAR_EINSATZ = 50;
	RUKHAR_GEWINN = 100;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(выбрать другую ставку)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(принять ставку)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_100()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_100_15_00");	//100.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_100_12_01");	//Вот это мне уже нравится.
	RUKHAR_EINSATZ = 100;
	RUKHAR_GEWINN = 200;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(выбрать другую ставку)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(принять ставку)",dia_rukhar_randolphwill_annehmen);
};


instance DIA_RUKHAR_ICHSEHEDICH(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_ichsehedich_condition;
	information = dia_rukhar_ichsehedich_info;
	permanent = TRUE;
	description = "Вот моя ставка.";
};


var int dia_rukhar_ichsehedich_noperm;

func int dia_rukhar_ichsehedich_condition()
{
	if((DIA_RUKHAR_ICHSEHEDICH_NOPERM == FALSE) && (DIA_RUKHAR_RANDOLPHWILL_NOPERM == TRUE) && (RUKHAR_EINSATZ != 0))
	{
		return TRUE;
	};
};

func void dia_rukhar_ichsehedich_info()
{
	AI_Output(other,self,"DIA_Rukhar_ICHSEHEDICH_15_00");	//Вот моя ставка.
	if(b_giveinvitems(other,self,itmi_gold,RUKHAR_EINSATZ))
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_01");	//Хорошо. Но только не тяни, приведи Рендольфа побыстрее, слышишь?
		DIA_RUKHAR_ICHSEHEDICH_NOPERM = TRUE;
		MIS_RUKHAR_WETTKAMPF = LOG_RUNNING;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_02");	//Очень смешно. Возвращайся, когда у тебя будут деньги.
	};
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_GELDZURUECK(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_geldzurueck_condition;
	information = dia_rukhar_geldzurueck_info;
	permanent = TRUE;
	description = "Я хочу получить свои деньги назад.";
};


func int dia_rukhar_geldzurueck_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (RUKHAR_WON_WETTKAMPF == TRUE))
	{
		return TRUE;
	};
};

func void dia_rukhar_geldzurueck_info()
{
	AI_Output(other,self,"DIA_Rukhar_GELDZURUECK_15_00");	//Я хочу получить свои деньги назад.
	AI_Output(self,other,"DIA_Rukhar_GELDZURUECK_12_01");	//Игровой долг - это долг чести, приятель. Тебе следовало подумать об этом раньше.
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_HAENSELN(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_haenseln_condition;
	information = dia_rukhar_haenseln_info;
	permanent = TRUE;
	description = "Похоже, ты откусил больше, чем можешь проглотить.";
};


func int dia_rukhar_haenseln_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (RUKHAR_WON_WETTKAMPF == FALSE))
	{
		return TRUE;
	};
};


var int dia_rukhar_haenseln_nureimalgeld;

func void dia_rukhar_haenseln_info()
{
	AI_Output(other,self,"DIA_Rukhar_HAENSELN_15_00");	//Похоже, ты откусил больше, чем можешь проглотить.
	if(DIA_RUKHAR_HAENSELN_NUREIMALGELD == FALSE)
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_01");	//Вот твои деньги, и больше я ни слова не скажу.
		b_giveplayerxp(XP_RUKHAR_LOST);
		IntToFloat(RUKHAR_GEWINN);
		CreateInvItems(self,itmi_gold,RUKHAR_GEWINN);
		b_giveinvitems(self,other,itmi_gold,RUKHAR_GEWINN);
		DIA_RUKHAR_HAENSELN_NUREIMALGELD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_02");	//Я еще поквитаюсь с тобой.
	};
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_PERM(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 7;
	condition = dia_rukhar_perm_condition;
	information = dia_rukhar_perm_info;
	permanent = TRUE;
	description = "Ничего интересного не произошло?";
};


func int dia_rukhar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rukhar_perm_info()
{
	AI_Output(other,self,"DIA_Rukhar_Perm_15_00");	//Ничего интересного не произошло?
	AI_Output(self,other,"DIA_Rukhar_Perm_12_01");	//Ничего такого, о чем бы я зал. Никто ничего мне не рассказывает.
};


instance DIA_RUKHAR_PICKPOCKET(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 900;
	condition = dia_rukhar_pickpocket_condition;
	information = dia_rukhar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_rukhar_pickpocket_condition()
{
	return c_beklauen(26,30);
};

func void dia_rukhar_pickpocket_info()
{
	Info_ClearChoices(dia_rukhar_pickpocket);
	Info_AddChoice(dia_rukhar_pickpocket,DIALOG_BACK,dia_rukhar_pickpocket_back);
	Info_AddChoice(dia_rukhar_pickpocket,DIALOG_PICKPOCKET,dia_rukhar_pickpocket_doit);
};

func void dia_rukhar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rukhar_pickpocket);
};

func void dia_rukhar_pickpocket_back()
{
	Info_ClearChoices(dia_rukhar_pickpocket);
};

