
instance DIA_CANTHAR_PICKPOCKET(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 900;
	condition = dia_canthar_pickpocket_condition;
	information = dia_canthar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_canthar_pickpocket_condition()
{
	return c_beklauen(20,25);
};

func void dia_canthar_pickpocket_info()
{
	Info_ClearChoices(dia_canthar_pickpocket);
	Info_AddChoice(dia_canthar_pickpocket,DIALOG_BACK,dia_canthar_pickpocket_back);
	Info_AddChoice(dia_canthar_pickpocket,DIALOG_PICKPOCKET,dia_canthar_pickpocket_doit);
};

func void dia_canthar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_canthar_pickpocket);
};

func void dia_canthar_pickpocket_back()
{
	Info_ClearChoices(dia_canthar_pickpocket);
};


instance DIA_CANTHAR_EXIT(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 999;
	condition = dia_canthar_exit_condition;
	information = dia_canthar_exit_info;
	permanent = TRUE;
	description = "Мне нужно идти!";
};


func int dia_canthar_exit_condition()
{
	return TRUE;
};

func void dia_canthar_exit_info()
{
	AI_Output(other,self,"DIA_Canthar_EXIT_15_00");	//Мне нужно идти!
	AI_Output(self,other,"DIA_Canthar_EXIT_09_01");	//Как знаешь.
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_PERSONALCRIMES(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_personalcrimes_condition;
	information = dia_canthar_personalcrimes_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_canthar_personalcrimes_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void dia_canthar_personalcrimes_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_00");	//Это было очень глупо с твоей стороны атаковать меня.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_01");	//(насмешливо) Ты думал, что так просто сможешь справиться со мной?
	};
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_02");	//Либо ты сейчас извинишься, либо я позабочусь, чтобы ты горько пожалел о том, что сделал!
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_15_03");	//А что именно ты имел в виду?
	b_say_gold(self,other,100);
	Info_ClearChoices(dia_canthar_personalcrimes);
	Info_AddChoice(dia_canthar_personalcrimes,"У меня нет столько!",dia_canthar_personalcrimes_notenough);
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_canthar_personalcrimes,"Вот твое золото - давай забудем об этом!",dia_canthar_personalcrimes_pay);
	};
};

func void dia_canthar_personalcrimes_pay()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_Pay_15_00");	//Вот твое золото - давай забудем об этом!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_Pay_09_01");	//Очень разумно с твоей стороны!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_canthar_personalcrimes_notenough()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00");	//У меня нет столько!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01");	//Тогда зачем ты попусту тратишь мое время?
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_HALLO(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_hallo_condition;
	information = dia_canthar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_canthar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_hallo_info()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_00");	//Посмотрите, кто у нас здесь!
		AI_Output(self,other,"DIA_Canthar_Hallo_09_01");	//Ты ведь идешь в город - я не прав?
		AI_Output(other,self,"DIA_Canthar_Hallo_15_02");	//Может быть.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_03");	//Хм! (фыркает) ты похож на беглеца! Все беглецы направляются в город.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_04");	//Возможно, ты даже беглый каторжник из колонии.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_05");	//(торопливо) Меня не волнует, откуда ты пришел. Но мне кажется, у меня есть интересное предложение для тебя...
		CANTHAR_GOTME = TRUE;
	}
	else if(Hlp_IsItem(itm,itar_bau_l) || Hlp_IsItem(itm,itar_bau_m))
	{
		AI_Output(self,other,"DIA_Canthar_HelloArmor_09_06");	//Как идет работа, крестьянин?
		Info_ClearChoices(dia_canthar_hallo);
		Info_AddChoice(dia_canthar_hallo,"Я похож на фермера?",dia_canthar_hallo_nobauer);
		Info_AddChoice(dia_canthar_hallo,"Мне не на что жаловаться.",dia_canthar_hallo_bauer);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_07");	//Что я могу сделать для тебя?
	};
};

func void dia_canthar_hallo_bauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_Bauer_15_00");	//Мне не на что жаловаться.
	AI_Output(self,other,"DIA_Canthar_Hallo_Bauer_09_01");	//Могу я что-нибудь сделать для тебя?
	Info_ClearChoices(dia_canthar_hallo);
};

func void dia_canthar_hallo_nobauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_NoBauer_15_00");	//Я похож на фермера?
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_01");	//Ты выглядишь как фермер. Но говоришь совсем не так, как они!
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_02");	//(в раздумьях) Если я ни в чем не ошибаюсь, у меня есть интересное предложение для тебя...
	CANTHAR_GOTME = TRUE;
	Info_ClearChoices(dia_canthar_hallo);
};


instance DIA_CANTHAR_WHATOFFER(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_whatoffer_condition;
	information = dia_canthar_whatoffer_info;
	permanent = FALSE;
	description = "Что ты можешь предложить мне?";
};


func int dia_canthar_whatoffer_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_hallo))
	{
		return TRUE;
	};
};

func void dia_canthar_whatoffer_info()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_15_00");	//Что ты можешь предложить мне?
	if(CANTHAR_GOTME == TRUE)
	{
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_01");	//Судя по тому, как ты выглядишь, стража никогда не пустит тебя в город.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_02");	//"(иронично) Если ты будешь говорить так же ""убедительно"" со стражей у ворот, как говоришь со мной, они никогда не пустят тебя в город."
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_03");	//Я могу помочь тебе попасть в город.
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_04");	//У меня есть вот этот клочок бумаги. С королевской печатью и подписью губернатора. Пропуск.
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_05");	//С этим пропуском в кармане ты сможешь спокойно войти в город, и страже придется пропустить тебя.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_06");	//Тебе это интересно?
		Info_ClearChoices(dia_canthar_whatoffer);
		Info_AddChoice(dia_canthar_whatoffer,"Нет! Оставь эту бумагу себе!",dia_canthar_whatoffer_no);
		Info_AddChoice(dia_canthar_whatoffer,"Что ты хочешь за этот пропуск?",dia_canthar_whatoffer_price);
		Info_AddChoice(dia_canthar_whatoffer,"А как ТЫ попадешь в город?",dia_canthar_whatoffer_howyouin);
		Info_AddChoice(dia_canthar_whatoffer,"Это похоже на подвох...",dia_canthar_whatoffer_strings);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_07");	//Я бродячий торговец. Я торгую всем.
	};
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Кантар торгует различным оружием.");
};

func void dia_canthar_whatoffer_strings()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Strings_15_00");	//Это похоже на подвох...
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Strings_09_01");	//Нет! Никакого подвоха. Ты просто окажешь мне услугу.
};

func void dia_canthar_whatoffer_howyouin()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");	//А как ТЫ попадешь в город?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_HowYouIn_09_01");	//Стража знает меня. Я просто скажу им, что потерял мой пропуск.
};

func void dia_canthar_whatoffer_price()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_00");	//Что ты хочешь за этот пропуск?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_01");	//(удовлетворенно) Я ЗНАЛ, что не ошибся в тебе!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_02");	//Послушай. Ты получишь от меня пропуск. Прямо сейчас!
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_03");	//Просто так?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_04");	//Да. НО: если я встречу тебя в городе, ты будешь должен оказать мне услугу.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_05");	//Ну что, договорились?
	Info_AddChoice(dia_canthar_whatoffer,"Конечно. Давай сюда эту бумагу.",dia_canthar_whatoffer_ok);
};

func void dia_canthar_whatoffer_ok()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Ok_15_00");	//Конечно. Давай сюда эту бумагу.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_01");	//Держи. Но обращайся с ней аккуратно, она очень ценная.
	CreateInvItems(self,itwr_passierschein,1);
	b_giveinvitems(self,other,itwr_passierschein,1);
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_02");	//И еще одно: даже и не думай нарушить свое слово!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_03");	//Я торговец и имею очень большое влияние в городе - просто так это тебе с рук не сойдет, уж поверь мне!
	CANTHAR_GEFALLEN = TRUE;
	Info_ClearChoices(dia_canthar_whatoffer);
	Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
	b_logentry(TOPIC_CITY,"Я получил пропуск у торговца Кантара, который позволит мне попасть в город. Взамен, я должен оказать ему услугу в следующий раз, когда увижу его в городе.");
};

func void dia_canthar_whatoffer_no()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_No_15_00");	//Нет! Оставь эту бумагу себе!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_01");	//Хм. Похоже, я недооценил тебя, а?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_02");	//Ладно. Тебе нужно что-нибудь еще? Может тебе показать мои товары?
	Info_ClearChoices(dia_canthar_whatoffer);
};


instance DIA_CANTHAR_TRADE(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 888;
	condition = dia_canthar_trade_condition;
	information = dia_canthar_trade_info;
	permanent = TRUE;
	description = "Покажи мне свои товары!";
	trade = TRUE;
};


func int dia_canthar_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_whatoffer))
	{
		return TRUE;
	};
};

func void dia_canthar_trade_info()
{
	AI_Output(other,self,"DIA_Canthar_TRADE_15_00");	//Покажи мне свои товары!
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Canthar_TRADE_09_01");	//Выбирай.
};


instance DIA_CANTHAR_PAYPRICEINCITY(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_paypriceincity_condition;
	information = dia_canthar_paypriceincity_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_canthar_paypriceincity_condition()
{
	if((CANTHAR_INSTADT == TRUE) && (Npc_IsDead(sarah) == FALSE) && (CANTHAR_GOTME == TRUE))
	{
		return TRUE;
	};
};

func void dia_canthar_paypriceincity_info()
{
	if(CANTHAR_GEFALLEN == TRUE)
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_00");	//За тобой должок. И пришло время вернуть его.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_01");	//Эй, ты, у меня есть предложение для тебя.
	};
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_02");	//Что ты хочешь?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_03");	//Я хочу вернуть мой старый прилавок на рыночной площади. Сара увела его у меня.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_04");	//И я хочу, чтобы она вернула мне этот прилавок назад.
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_05");	//А моя роль в этом какая?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_06");	//Я дам тебе письмо, которое ты должен подложить в ее карман.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_07");	//Затем ты пойдешь к Андрэ и скажешь ему, что Сара продает оружие Онару.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_08");	//Ее посадят в тюрьму, ты получишь награду, а я свой прилавок.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_09");	//У тебя есть два дня на выполнение этого.
	if(CANTHAR_GEFALLEN == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_10");	//А что мне с этого будет?
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_11");	//Когда я верну себе прилавок, ты получишь оружие от меня - очень хорошее оружие.
	};
	Info_ClearChoices(dia_canthar_paypriceincity);
	Info_AddChoice(dia_canthar_paypriceincity,"Нет, я не буду участвовать в этом.",dia_canthar_paypriceincity_nein);
	Info_AddChoice(dia_canthar_paypriceincity,"Хорошо, я сделаю это.",dia_canthar_paypriceincity_ok);
	Info_AddChoice(dia_canthar_paypriceincity,"А что будет, если я откажусь?",dia_canthar_paypriceincity_if);
};

func void dia_canthar_paypriceincity_if()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_if_15_00");	//А что будет, если я откажусь?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_01");	//Это будет очень глупо с твоей стороны. Понимаешь, я знаю, что ты беглый каторжник.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_02");	//Если об этом прознают остальные, это нанесет значительный урон твоей репутации в городе...
};

func void dia_canthar_paypriceincity_nein()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Nein_15_00");	//Нет, я не буду участвовать в этом.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Nein_09_01");	//Это было неверное решение, мой мальчик. Но мы еще поговорим.
	MIS_CANTHARS_KOMPROBRIEF = LOG_OBSOLETE;
	b_checklog();
	Info_ClearChoices(dia_canthar_paypriceincity);
};

func void dia_canthar_paypriceincity_ok()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_00");	//Хорошо, похоже, у меня нет выбора.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_01");	//Ты сообразительный парень. Вот, держи письмо.
	CreateInvItems(self,itwr_canthars_komprobrief_mis,1);
	b_giveinvitems(self,other,itwr_canthars_komprobrief_mis,1);
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_02");	//А как я подложу ей это письмо?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_03");	//Пусть она покажет тебе свои товары - а пока она будет делать это, ты подложишь ей письмо.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_04");	//И помни, я очень влиятельный человек, так что не пытайся провести меня.
	MIS_CANTHARS_KOMPROBRIEF = LOG_RUNNING;
	MIS_CANTHARS_KOMPROBRIEF_DAY = Wld_GetDay();
	Log_CreateTopic(TOPIC_CANTHAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CANTHAR,LOG_RUNNING);
	if(CANTHAR_GEFALLEN == TRUE)
	{
		b_logentry(TOPIC_CANTHAR,"Кантар хочет, чтобы я оказал ему услугу, как обещал.");
	}
	else
	{
		b_logentry(TOPIC_CANTHAR,"Кантар пообещал дать мне оружие, взамен на оказанную ему услугу.");
	};
	b_logentry(TOPIC_CANTHAR,"Я должен подложить письмо торговке Саре, которое даст повод подозревать ее в том, что она продает оружие Онару. Затем я должен пойти к лорду Андре и настучать на нее.");
	Info_ClearChoices(dia_canthar_paypriceincity);
};


instance DIA_CANTHAR_SARAHERLEDIGT(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_saraherledigt_condition;
	information = dia_canthar_saraherledigt_info;
	permanent = TRUE;
	description = "Насчет Сары...";
};


func int dia_canthar_saraherledigt_condition()
{
	if(MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_canthar_saraherledigt_info()
{
	if(Npc_IsDead(sarah) == FALSE)
	{
		if(MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() + 2))
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_00");	//У тебя нет работы для меня?
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_01");	//Сначала подложи письмо Саре, а затем сходи к Андрэ и обвини ее.
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_02");	//Сделай же это. И не пытайся обмануть меня, ты пожалеешь об этом.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_03");	//Ты попусту тратишь свое драгоценное время. За дело!
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Canthar_SARAHERLEDIGT_15_04");	//Сара мертва.
		AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_05");	//Правда? Превосходно. Значит, ты выполнил свою часть нашей маленькой сделки.
		MIS_CANTHARS_KOMPROBRIEF = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
		Npc_ExchangeRoutine(self,"MARKTSTAND");
	};
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_SUCCESS(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_success_condition;
	information = dia_canthar_success_info;
	permanent = FALSE;
	description = "Насчет Сары...";
};


func int dia_canthar_success_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_SUCCESS) && (Npc_IsDead(sarah) == FALSE))
	{
		return TRUE;
	};
};

func void dia_canthar_success_info()
{
	AI_Output(self,other,"DIA_Canthar_Success_09_00");	//Отлично. Сара отправилась туда, где ей самое место.
	AI_Output(self,other,"DIA_Canthar_Success_09_01");	//Я забрал ее товары, так что, если тебе нужно оружие, заходи ко мне.
	if(KAPITEL == 1)
	{
		CreateInvItems(self,itmw_shortsword3,1);
		CreateInvItems(self,itmw_shortsword4,1);
		CreateInvItems(self,itmw_shortsword5,1);
		CreateInvItems(self,itmw_kriegshammer1,1);
		CreateInvItems(self,itmw_1h_vlk_sword,1);
		CreateInvItems(self,itmw_1h_nov_mace,1);
	};
	if(KAPITEL == 2)
	{
		CreateInvItems(self,itmw_stabkeule,1);
		CreateInvItems(self,itmw_steinbrecher,1);
		CreateInvItems(self,itmw_schwert2,1);
		CreateInvItems(self,itmw_bartaxt,1);
	};
	if(CANTHAR_GEFALLEN == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_Success_15_02");	//Ты собирался дать мне оружие.
		AI_Output(self,other,"DIA_Canthar_Success_09_03");	//Правильно. Вот, это оружие - произведение оружейного искусства.
		b_giveinvitems(self,other,itmw_schiffsaxt,1);
	};
	b_giveplayerxp(XP_CANTHARS_KOMPROBRIEF);
};


instance DIA_CANTHAR_AGAIN(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_again_condition;
	information = dia_canthar_again_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_canthar_again_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_again_info()
{
	AI_Output(self,other,"DIA_Canthar_Again_09_00");	//Ох, опять ты.
	if(MIS_CANTHARS_KOMPROBRIEF == LOG_FAILED)
	{
		AI_Output(other,self,"DIA_Canthar_Again_15_01");	//Почему ты не в тюрьме?
		AI_Output(self,other,"DIA_Canthar_Again_09_02");	//Меня отпустили. Как я уже говорил тебе - я очень влиятельный человек в этом городе.
	}
	else if(MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_03");	//Кстати, я разделался с Сарой сам. Ты можешь забыть об этом деле с письмом.
	}
	else if(MIS_CANTHARS_KOMPROBRIEF == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_04");	//Разве я не предупреждал тебя? Было бы лучше, если бы ты делал то, что я говорю.
	};
	AI_Output(self,other,"DIA_Canthar_Again_09_05");	//Теперь все торговцы узнали, что ты беглый каторжник.
	AI_Output(self,other,"DIA_Canthar_Again_09_06");	//Какая жалость - теперь ты не сможешь купить на рыночной площади даже куска хлеба.
	AI_Output(self,other,"DIA_Canthar_Again_09_07");	//Я могу, конечно же, уладить эту проблему для тебя, это будет стоить, скажем...
	b_say_gold(self,other,CANTHAR_GOLD);
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_PAY(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_pay_condition;
	information = dia_canthar_pay_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_canthar_pay_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_again) && (CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_pay_info()
{
	AI_Output(self,other,"DIA_Canthar_Pay_09_00");	//Ты готов заплатить?
	Info_ClearChoices(dia_canthar_pay);
	if(Npc_HasItems(other,itmi_gold) >= CANTHAR_GOLD)
	{
		Info_AddChoice(dia_canthar_pay,"Хорошо, я заплачу, ты не оставляешь мне выбора.",dia_canthar_pay_ja);
	};
	Info_AddChoice(dia_canthar_pay,"У меня нет с собой столько денег...",dia_canthar_pay_nein);
	Info_AddChoice(dia_canthar_pay,"Сколько там нужно?",dia_canthar_pay_wieviel);
};

func void dia_canthar_pay_ja()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Ja_15_00");	//Хорошо, я заплачу, ты не оставляешь мне выбора.
	b_giveinvitems(other,self,itmi_gold,CANTHAR_GOLD);
	AI_Output(self,other,"DIA_Canthar_Pay_Ja_09_01");	//(ухмыляется) Хорошо. А теперь я позабочусь, чтобы твоя репутация среди торговцев выросла опять.
	CANTHAR_SPERRE = FALSE;
	CANTHAR_PAY = TRUE;
	Info_ClearChoices(dia_canthar_pay);
};

func void dia_canthar_pay_nein()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Nein_15_00");	//У меня нет с собой столько денег...
	AI_Output(self,other,"DIA_Canthar_Pay_Nein_09_01");	//Тогда добудь их.
	Info_ClearChoices(dia_canthar_pay);
	AI_StopProcessInfos(self);
};

func void dia_canthar_pay_wieviel()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Wieviel_15_00");	//Сколько там нужно?
	b_say_gold(self,other,CANTHAR_GOLD);
};


instance DIA_CANTHAR_CANTHARANGEPISST(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_cantharangepisst_condition;
	information = dia_canthar_cantharangepisst_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_canthar_cantharangepisst_condition()
{
	if((CANTHAR_AUSGELIEFERT == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_cantharangepisst_info()
{
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_00");	//Я предупреждал тебя, но ты не слушал. Мы обсудим этот вопрос позже.
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_01");	//А теперь проваливай, я хочу отдохнуть.
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_MINENANTEIL(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 3;
	condition = dia_canthar_minenanteil_condition;
	information = dia_canthar_minenanteil_info;
	description = "Ты продаешь поддельные акции!";
};


func int dia_canthar_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_canthar_whatoffer))
	{
		return TRUE;
	};
};

func void dia_canthar_minenanteil_info()
{
	AI_Output(other,self,"DIA_Canthar_Minenanteil_15_00");	//Ты продаешь поддельные акции!
	AI_Output(self,other,"DIA_Canthar_Minenanteil_09_01");	//Да? И что?! Если не я, так другой.
	b_giveplayerxp(XP_AMBIENT);
};

