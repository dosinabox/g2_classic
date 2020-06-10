
instance DIA_TILL_EXIT(C_INFO)
{
	npc = bau_931_till;
	nr = 999;
	condition = dia_till_exit_condition;
	information = dia_till_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_till_exit_condition()
{
	return TRUE;
};

func void dia_till_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TILL_HALLO(C_INFO)
{
	npc = bau_931_till;
	nr = 3;
	condition = dia_till_hallo_condition;
	information = dia_till_hallo_info;
	description = "Привет.";
};


func int dia_till_hallo_condition()
{
	if(KAPITEL < 5)
	{
		return TRUE;
	};
};

func void dia_till_hallo_info()
{
	AI_Output(other,self,"DIA_Till_HALLO_15_00");	//Привет.
	AI_Output(self,other,"DIA_Till_HALLO_03_01");	//Я не разговариваю с рабочими. Сколько тебе это повторять?
	b_startotherroutine(till,"Start");
	Info_ClearChoices(dia_till_hallo);
	if(KAPITEL < 5)
	{
		Info_AddChoice(dia_till_hallo,"Я не рабочий.",dia_till_hallo_keinervoneuch);
		if(Npc_IsDead(sekob) == FALSE)
		{
			Info_AddChoice(dia_till_hallo,"Ты командуешь здесь?",dia_till_hallo_selber);
		};
	};
};

func void dia_till_hallo_selber()
{
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_00");	//Ты командуешь здесь?
	AI_Output(self,other,"DIA_Till_HALLO_selber_03_01");	//Э-э. Нет, я всего лишь сын Секоба. Но когда старика больше не будет с нами, все земля, что ты видишь вокруг, перейдет ко мне.
	AI_Output(other,self,"DIA_Till_HALLO_selber_15_02");	//Потрясающе!
	Info_ClearChoices(dia_till_hallo);
};

func void dia_till_hallo_keinervoneuch()
{
	AI_Output(other,self,"DIA_Till_HALLO_keinervoneuch_15_00");	//Я не рабочий.
	AI_Output(self,other,"DIA_Till_HALLO_keinervoneuch_03_01");	//А чего тебе тогда надо? У нас ничего нет. Так что лучше уходи.
	Info_ClearChoices(dia_till_hallo);
};


instance DIA_TILL_FELDARBEITER(C_INFO)
{
	npc = bau_931_till;
	nr = 4;
	condition = dia_till_feldarbeiter_condition;
	information = dia_till_feldarbeiter_info;
	description = "Вы так всегда обращаетесь со своими работниками?";
};


func int dia_till_feldarbeiter_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_feldarbeiter_info()
{
	AI_Output(other,self,"DIA_Till_FELDARBEITER_15_00");	//Вы так всегда обращаетесь со своими работниками?
	AI_Output(self,other,"DIA_Till_FELDARBEITER_03_01");	//Конечно - иначе нельзя. Если не поддерживать дисциплину, никто не будет - это известное правило.
};


instance DIA_TILL_SEKOB(C_INFO)
{
	npc = bau_931_till;
	nr = 9;
	condition = dia_till_sekob_condition;
	information = dia_till_sekob_info;
	description = "Мне нужно поговорить с твоим отцом.";
};


func int dia_till_sekob_condition()
{
	if(Npc_KnowsInfo(other,dia_till_feldarbeiter) && (Npc_KnowsInfo(other,dia_sekob_hallo) == FALSE) && (KAPITEL < 3) && (Npc_IsDead(sekob) == FALSE))
	{
		return TRUE;
	};
};

func void dia_till_sekob_info()
{
	AI_Output(other,self,"DIA_Till_SEKOB_15_00");	//Мне нужно поговорить с твоим отцом.
	AI_Output(self,other,"DIA_Till_SEKOB_03_01");	//У него нет на это времени. Я его представитель. Чем я могу помочь тебе?
	AI_Output(other,self,"DIA_Till_SEKOB_15_02");	//Поможешь, если отведешь к своему отцу.
	AI_Output(self,other,"DIA_Till_SEKOB_03_03");	//Ты считаешь себя крепким парнем и хорошим бойцом, да?
	AI_Output(other,self,"DIA_Till_SEKOB_15_04");	//Лучшим.
	AI_Output(self,other,"DIA_Till_SEKOB_03_05");	//Возможно, тогда стоит позвать его.
	AI_Output(other,self,"DIA_Till_SEKOB_15_06");	//Не беспокойся, мальчик. Я найду его сам.
	AI_Output(self,other,"DIA_Till_SEKOB_03_07");	//Как скажешь.
	AI_StopProcessInfos(self);
};


instance DIA_TILL_WASMACHSTDU(C_INFO)
{
	npc = bau_931_till;
	nr = 10;
	condition = dia_till_wasmachstdu_condition;
	information = dia_till_wasmachstdu_info;
	description = "Чем ты занимаешься?";
};


func int dia_till_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) && (hero.guild != GIL_MIL) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_00");	//А что ты делаешь, когда не играешь в хозяина этой фермы?
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_01");	//Стою на страже.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_02");	//Грязные ополченцы из города все чаще забредают на наши земли и воруют все, что плохо лежит.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_03");	//Эти ублюдки были здесь только на прошлой неделе, они украли наших овец.
	AI_Output(self,other,"DIA_Till_WASMACHSTDU_03_04");	//Если бы я добрался до одного из них, ему бы не поздоровилось.
	AI_Output(other,self,"DIA_Till_WASMACHSTDU_15_05");	//Конечно!
};


instance DIA_TILL_WARUMNICHTSLD(C_INFO)
{
	npc = bau_931_till;
	nr = 11;
	condition = dia_till_warumnichtsld_condition;
	information = dia_till_warumnichtsld_info;
	description = "А разве наемники не помогают вам защищаться от ополчения?";
};


func int dia_till_warumnichtsld_condition()
{
	if(Npc_KnowsInfo(other,dia_till_wasmachstdu) && (hero.guild != GIL_MIL) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_warumnichtsld_info()
{
	AI_Output(other,self,"DIA_Till_WARUMNICHTSLD_15_00");	//А разве наемники не помогают вам защищаться от ополчения?
	AI_Output(self,other,"DIA_Till_WARUMNICHTSLD_03_01");	//Да пока наемники почешутся, я уже успеваю прогнать всех воров.
};


instance DIA_TILL_BRONKO(C_INFO)
{
	npc = bau_931_till;
	nr = 5;
	condition = dia_till_bronko_condition;
	information = dia_till_bronko_info;
	description = "(спросить о Бронко)";
};


func int dia_till_bronko_condition()
{
	if(Npc_KnowsInfo(other,dia_till_feldarbeiter) && Npc_KnowsInfo(other,dia_bronko_hallo) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronko_info()
{
	AI_Output(other,self,"DIA_Till_BRONKO_15_00");	//Это ваш работник требует плату со всех проходящих мимо, утверждая, что ОН тут фермер!
	AI_Output(self,other,"DIA_Till_BRONKO_03_01");	//(робко) Эээ. Да. Я знаю. Это Бронко. Он делает то, что хочет.
	AI_Output(self,other,"DIA_Till_BRONKO_03_02");	//Я уже столько раз задавал ему трепку, чтобы он взялся за ум и начал работать, но все без толку...
	AI_Output(other,self,"DIA_Till_BRONKO_15_03");	//Да?
	AI_Output(self,other,"DIA_Till_BRONKO_03_04");	//Он все равно не хочет работать.
	if(Npc_IsDead(sekob) == FALSE)
	{
		AI_Output(self,other,"DIA_Till_BRONKO_03_05");	//Моему отцу очень не нравится, что мне все еще не удалось убедить его вернуться к работе.
	};
};


instance DIA_TILL_BRONKOZURARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 6;
	condition = dia_till_bronkozurarbeit_condition;
	information = dia_till_bronkozurarbeit_info;
	permanent = TRUE;
	description = "Возможно, я смогу помочь тебе.";
};


var int dia_till_bronkozurarbeit_noperm;

func int dia_till_bronkozurarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_till_bronko) && (DIA_TILL_BRONKOZURARBEIT_NOPERM == FALSE) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronkozurarbeit_info()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_15_00");	//Может быть, я смогу поммочь.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_03_01");	//Что ты хочешь сказать этим? Хорошо, послушай, если ты сможешь заставить Бронко работать, я заплачу тебе, скажем, 10 золотых монет. Что скажешь?
	TILL_ANGEBOT = 10;
	Info_ClearChoices(dia_till_bronkozurarbeit);
	Info_AddChoice(dia_till_bronkozurarbeit,"Нет проблем. Но мне нужно больше денег.",dia_till_bronkozurarbeit_mehr);
	Info_AddChoice(dia_till_bronkozurarbeit,"Хорошо. Я посмотрю, что можно сделать.",dia_till_bronkozurarbeit_ok);
	Info_AddChoice(dia_till_bronkozurarbeit,"Я подумаю над этим.",dia_till_bronkozurarbeit_nochnicht);
};

func void dia_till_bronkozurarbeit_nochnicht()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_nochnicht_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_nochnicht_03_01");	//Как хочешь.
	Info_ClearChoices(dia_till_bronkozurarbeit);
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_ok()
{
	AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_ok_15_00");	//Хорошо. Я посмотрю, что можно сделать.
	AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_ok_03_01");	//Но поторопись с этим.
	DIA_TILL_BRONKOZURARBEIT_NOPERM = TRUE;
	MIS_SEKOB_BRONKO_EINGESCHUECHTERT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BRONKOEINGESCHUECHTERT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRONKOEINGESCHUECHTERT,LOG_RUNNING);
	b_logentry(TOPIC_BRONKOEINGESCHUECHTERT,"Тилл не может заставить Бронко работать. Тилл хочет, чтобы это попробовал сделать я.");
	AI_StopProcessInfos(self);
};

func void dia_till_bronkozurarbeit_mehr()
{
	if(TILL_ICHMACHSNUREINMAL == TRUE)
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_00");	//Я хочу больше.
	}
	else
	{
		AI_Output(other,self,"DIA_Till_BRONKOZURARBEIT_mehr_15_01");	//Нет проблем. Но мне нужно больше денег.
		TILL_ICHMACHSNUREINMAL = TRUE;
	};
	if(TILL_ANGEBOT == 10)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_02");	//Хорошо. 20 золотых монет.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Я хочу больше.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"Хорошо. Я посмотрю, что можно сделать.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 20;
	}
	else if(TILL_ANGEBOT == 20)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_03");	//30?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Я хочу больше.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"Хорошо. Я посмотрю, что можно сделать.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 30;
	}
	else if(TILL_ANGEBOT == 30)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_04");	//Может быть... 50?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Я хочу больше.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"Хорошо. Я посмотрю, что можно сделать.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 50;
	}
	else if(TILL_ANGEBOT == 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_05");	//Хорошо. 70?
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Я хочу больше.",dia_till_bronkozurarbeit_mehr);
		Info_AddChoice(dia_till_bronkozurarbeit,"Хорошо. Я посмотрю, что можно сделать.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 70;
	}
	else if(TILL_ANGEBOT == 70)
	{
		AI_Output(self,other,"DIA_Till_BRONKOZURARBEIT_mehr_03_06");	//Хорошо, хорошо! Я дам тебе 100 золотых монет. Но это все, что у меня есть.
		Info_ClearChoices(dia_till_bronkozurarbeit);
		Info_AddChoice(dia_till_bronkozurarbeit,"Хорошо. Я посмотрю, что можно сделать.",dia_till_bronkozurarbeit_ok);
		TILL_ANGEBOT = 100;
	};
};


instance DIA_TILL_BRONKOWIEDERANARBEIT(C_INFO)
{
	npc = bau_931_till;
	nr = 7;
	condition = dia_till_bronkowiederanarbeit_condition;
	information = dia_till_bronkowiederanarbeit_info;
	description = "Бронко вернулся к работе.";
};


func int dia_till_bronkowiederanarbeit_condition()
{
	if((MIS_SEKOB_BRONKO_EINGESCHUECHTERT == LOG_SUCCESS) && (DIA_TILL_BRONKOZURARBEIT_NOPERM == TRUE) && (KAPITEL < 5))
	{
		return TRUE;
	};
};

func void dia_till_bronkowiederanarbeit_info()
{
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_00");	//Бронко вернулся к работе.
	AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_01");	//Правда? Это превосходно.
	AI_Output(other,self,"DIA_Till_BRONKOWIEDERANARBEIT_15_02");	//Да. И тепрь я хочу получить мои деньги.
	IntToFloat(TILL_ANGEBOT);
	if(TILL_ANGEBOT <= 50)
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_03");	//(колеблясь) Мммм. Хорошо. Сделка есть сделка, правда?
		CreateInvItems(self,itmi_gold,TILL_ANGEBOT);
		b_giveinvitems(self,other,itmi_gold,TILL_ANGEBOT);
	}
	else
	{
		AI_Output(self,other,"DIA_Till_BRONKOWIEDERANARBEIT_03_04");	//К сожалению, у меня нет такой суммы. Но я очень благодарен тебе за помощь.
		TILL_HATSEINGELDBEHALTEN = TRUE;
	};
	b_giveplayerxp(XP_BRONKOGEHTANDIEARBEIT);
	AI_StopProcessInfos(self);
};


instance DIA_TILL_PERMKAP1(C_INFO)
{
	npc = bau_931_till;
	nr = 99;
	condition = dia_till_permkap1_condition;
	information = dia_till_permkap1_info;
	permanent = TRUE;
	description = "(подразнить Тилла)";
};


func int dia_till_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_till_hallo) || (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_till_permkap1_info()
{
	if(KAPITEL == 5)
	{
		if((MIS_BRINGROSIBACKTOSEKOB != LOG_SUCCESS) && (ROSI_FLEEFROMSEKOB_KAP5 == TRUE))
		{
			AI_Output(other,self,"DIA_Till_PERMKAP1_15_00");	//А до дома-то далеко, а? Папочка не сможет помочь тебе здесь.
			AI_Output(self,other,"DIA_Till_PERMKAP1_03_01");	//Когда-нибудь я набью тебе морду.
		};
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_02");	//Ты, трус, радуйся, если я оставлю тебя в живых.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_03");	//Тогда оставь меня в покое.
		AI_StopProcessInfos(self);
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_04");	//Может, тебе стоит питаться получше, чтобы ты вырос большим и сильным.
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_05");	//Когда-нибудь я поквитаюсь с тобой.
		AI_StopProcessInfos(self);
	}
	else if(TILL_HATSEINGELDBEHALTEN == TRUE)
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_06");	//Ах ты жалкий маленький...
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_07");	//Уходи.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Till_PERMKAP1_15_08");	//Тебе сегодня никто еще не бил в морду?
		AI_Output(self,other,"DIA_Till_PERMKAP1_03_09");	//Оставь меня в покое, ты, идиот!
	};
};


instance DIA_TILL_PICKPOCKET(C_INFO)
{
	npc = bau_931_till;
	nr = 900;
	condition = dia_till_pickpocket_condition;
	information = dia_till_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_till_pickpocket_condition()
{
	return c_beklauen(36,40);
};

func void dia_till_pickpocket_info()
{
	Info_ClearChoices(dia_till_pickpocket);
	Info_AddChoice(dia_till_pickpocket,DIALOG_BACK,dia_till_pickpocket_back);
	Info_AddChoice(dia_till_pickpocket,DIALOG_PICKPOCKET,dia_till_pickpocket_doit);
};

func void dia_till_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_till_pickpocket);
};

func void dia_till_pickpocket_back()
{
	Info_ClearChoices(dia_till_pickpocket);
};

