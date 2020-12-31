
instance DIA_KARDIF_EXIT(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 999;
	condition = dia_kardif_exit_condition;
	information = dia_kardif_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kardif_exit_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARDIF_PICKPOCKET(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 900;
	condition = dia_kardif_pickpocket_condition;
	information = dia_kardif_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_kardif_pickpocket_condition()
{
	return c_beklauen(55,85);
};

func void dia_kardif_pickpocket_info()
{
	Info_ClearChoices(dia_kardif_pickpocket);
	Info_AddChoice(dia_kardif_pickpocket,DIALOG_BACK,dia_kardif_pickpocket_back);
	Info_AddChoice(dia_kardif_pickpocket,DIALOG_PICKPOCKET,dia_kardif_pickpocket_doit);
};

func void dia_kardif_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kardif_pickpocket);
};

func void dia_kardif_pickpocket_back()
{
	Info_ClearChoices(dia_kardif_pickpocket);
};


instance DIA_KARDIF_HI(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_hi_condition;
	information = dia_kardif_hi_info;
	permanent = FALSE;
	description = "Как дела?";
};


func int dia_kardif_hi_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_hi_info()
{
	AI_Output(other,self,"DIA_Kardif_Hi_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Kardif_Hi_14_01");	//Если ты хочешь что-нибудь выпить, заказывай.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Кардиф торгует напитками в таверне в гавани.");
};


instance DIA_KARDIF_HALLO(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_hallo_condition;
	information = dia_kardif_hallo_info;
	permanent = FALSE;
	description = "Готов побиться об заклад, ты многое здесь слышишь...";
};


func int dia_kardif_hallo_condition()
{
	if(Npc_KnowsInfo(other,dia_kardif_hi) && (KARDIF_DEAL == 0))
	{
		return TRUE;
	};
};

func void dia_kardif_hallo_info()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_15_00");	//Готов побиться об заклад, ты многое здесь слышишь...
	AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//А тебе какое до этого дело?
	AI_Output(other,self,"DIA_Kardif_Hallo_15_02");	//Мои уши всегда открыты для новостей.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_03");	//А кошелек у тебя тоже открыт?
	AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Каждая информация, которую я сообщу тебе, будет стоить 10 золотых монет.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Кардиф, владелец таверны в гавани, приторговывает информацией.");
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Я не готов платить за информацию больше 5 монет.",dia_kardif_hallo_angebot);
	Info_AddChoice(dia_kardif_hallo,"Забудь об этом - я найду нужную мне информацию в другом месте.",dia_kardif_hallo_hart);
	Info_AddChoice(dia_kardif_hallo,"Хорошо, договорились.",dia_kardif_hallo_zehn);
};

func void dia_kardif_hallo_zehn()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Zehn_15_00");	//Хорошо, договорились.
	AI_Output(self,other,"DIA_Kardif_Hallo_Zehn_14_01");	//Ты заключил выгодную сделку (усмехается). Я всегда к твоим услугам.
	KARDIF_DEAL = 10;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_angebot()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Angebot_15_00");	//Я не готов платить за информацию больше 5 монет.
	AI_Output(self,other,"DIA_Kardif_Hallo_Angebot_14_01");	//Что, 5 золотых монет? Ты хочешь разорить меня? (делает задумчивый вид) - Давай сойдемся на 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Нет, так не пойдет. Давай лучше 6!",dia_kardif_hallo_keindeal);
	Info_AddChoice(dia_kardif_hallo,"Договорились, 7 золотых монет - неплохая цена.",dia_kardif_hallo_sieben);
};

func void dia_kardif_hallo_hart()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Hart_15_00");	//Забудь об этом - я найду нужную мне информацию в другом месте.
	AI_Output(self,other,"DIA_Kardif_Hallo_Hart_14_01");	//Хорошо, хорошо... я согласен и на 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"Договорились, 7 золотых монет - неплохая цена.",dia_kardif_hallo_sieben);
	Info_AddChoice(dia_kardif_hallo,"Нет, мне не так уж сильно нужна твоя информация.",dia_kardif_hallo_ablehnen);
};

func void dia_kardif_hallo_sieben()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Sieben_15_00");	//Договорились, 7 золотых монет - неплохая цена.
	AI_Output(self,other,"DIA_Kardif_Hallo_Sieben_14_01");	//(усмехается) Мудрое решение. Ну, если тебе нужно будет что-то узнать, обращайся ко мне.
	KARDIF_DEAL = 7;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_ablehnen()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Ablehnen_15_00");	//Нет, мне не так уж сильно нужна твоя информация.
	AI_Output(self,other,"DIA_Kardif_Hallo_Ablehnen_14_01");	//Эй, подожди... (вздыхает) - хорошо, 5 золотых монет. Но это моя последняя цена!
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"И почему нельзя было сразу сказать об этом?",dia_kardif_hallo_fuenf);
};

func void dia_kardif_hallo_fuenf()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Fuenf_15_00");	//И почему нельзя было сразу сказать об этом?
	AI_Output(self,other,"DIA_Kardif_Hallo_Fuenf_14_01");	//Ох, я просто сейчас не в лучшей форме. Но, как бы то ни было - сделка есть сделка.
	KARDIF_DEAL = 5;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_keindeal()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_KeinDeal_15_00");	//Нет, так не пойдет. Давай лучше 6!
	AI_Output(self,other,"DIA_Kardif_Hallo_KeinDeal_14_01");	//Ты отъявленный негодяй, скажу я тебе. Ну, если ты так настаиваешь, информация тебе обойдется в 6 золотых монет.
	KARDIF_DEAL = 6;
	Info_ClearChoices(dia_kardif_hallo);
};


instance DIA_KARDIF_TRADE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_trade_condition;
	information = dia_kardif_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Дай мне что-нибудь выпить.";
};


func int dia_kardif_trade_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Kardif_TRADE_15_00");	//Дай мне что-нибудь выпить.
};


instance DIA_KARDIF_TRADEINFO(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_tradeinfo_condition;
	information = dia_kardif_tradeinfo_info;
	permanent = TRUE;
	description = "Мне нужна информация.";
};


func int dia_kardif_tradeinfo_condition()
{
	if((KARDIF_ONEQUESTION == FALSE) && (KARDIF_DEAL > 0))
	{
		return TRUE;
	};
};

func void dia_kardif_tradeinfo_info()
{
	AI_Output(other,self,"DIA_Kardif_TradeInfo_15_00");	//Мне нужна информация.
	KARDIF_ONEQUESTION = TRUE;
};

func void b_saykardifzuweniggold()
{
	AI_Output(self,other,"B_SayKardifZuwenigGold_14_00");	//Возвращайся, когда у тебя будет достаточно золота.
};


instance DIA_KARDIF_BUERGER(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_buerger_condition;
	information = dia_kardif_buerger_info;
	permanent = TRUE;
	description = "Кто считается влиятельными людьми в этом городе?";
};


var int dia_kardif_buerger_permanent;

func int dia_kardif_buerger_condition()
{
	if((DIA_KARDIF_BUERGER_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_buerger_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Buerger_15_00");	//Кто считается влиятельными людьми в этом городе?
		AI_Output(self,other,"DIA_Kardif_Buerger_14_01");	//Здесь, в порту, ты никого из них не найдешь. Единственный влиятельный человек здесь - это Лемар.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_02");	//Этот ростовщик не очень популярен, но у него есть золото, и другие влиятельные горожане должны ему деньги.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_03");	//Торговцы и мастера тоже очень влиятельные люди - и даже слишком, если тебе интересно мое мнение.
		DIA_KARDIF_BUERGER_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_LEHMAR(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_lehmar_condition;
	information = dia_kardif_lehmar_info;
	permanent = TRUE;
	description = "Кто должен Лемару?";
};


var int dia_kardif_lehmar_permanent;

func int dia_kardif_lehmar_condition()
{
	if((DIA_KARDIF_LEHMAR_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_BUERGER_PERMANENT == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_lehmar_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Add_15_00");	//Кто должен Лемару?
		AI_Output(self,other,"DIA_Kardif_Add_14_01");	//(смеется) Если ты хочешь узнать это, тебе стоит заглянуть в его гроссбух.
		AI_Output(self,other,"DIA_Kardif_Add_14_02");	//Только это будет очень непросто сделать незаметно.
		AI_Output(self,other,"DIA_Kardif_Add_14_03");	//Насколько мне известно, он всегда носит его с собой...
		DIA_KARDIF_LEHMAR_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_ARBEIT(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_arbeit_condition;
	information = dia_kardif_arbeit_info;
	permanent = TRUE;
	description = "Где я могу найти работу?";
};


var int dia_kardif_arbeit_permanent;

func int dia_kardif_arbeit_condition()
{
	if((DIA_KARDIF_ARBEIT_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_arbeit_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Arbeit_15_00");	//Где я могу найти работу?
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_01");	//Ты вряд ли найдешь работу здесь, в порту. Тебе нужно обратиться к мастерам в нижней части города.
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_02");	//Но если у тебя есть приличный меч, ты можешь вызвать Альрика на поединок. Ты найдешь его за складом, он сражается за золото.
		DIA_KARDIF_ARBEIT_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_LERNEN(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_lernen_condition;
	information = dia_kardif_lernen_info;
	permanent = TRUE;
	description = "А у кого здесь можно поучиться чему-нибудь?";
};


var int dia_kardif_lernen_permanent;

func int dia_kardif_lernen_condition()
{
	if((DIA_KARDIF_LERNEN_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_lernen_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Lernen_15_00");	//А у кого здесь можно поучиться чему-нибудь?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_01");	//Здесь, в портовом квартале есть несколько знающих людей.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_02");	//Карл, кузнец, - крепкий парень. Ручаюсь, он сможет помочь тебе стать сильнее.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_03");	//Альрик опытен в боевых искусствах. А Ларес - мошенник, каких свет не видывал. Он тоже заходит иногда в порт.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_04");	//А если ты настолько выжил из ума, чтобы пойти к старому Игнацу - он знает толк в алхем... алхим... зельях.
		AI_Output(other,self,"DIA_Kardif_Lernen_15_05");	//И где мне найти всех этих людей?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_06");	//(стонет) Боже, король успеет выиграть войну против орков, прежде чем я тебе объясню все это.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_07");	//Просто осмотрись в портовом квартале, ты обязательно найдешь их. А если ты хочешь лучше ориентироваться здесь, зайди к Ибрагиму и купи у него карту.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_08");	//Его совсем легко найти. Он живет в соседнем доме направо от моего трактира. (бормочет) Я должен был взять в два раза больше за эту информацию.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"Карл, кузнец в портовом квартале, может сделать меня сильнее.");
		b_logentry(TOPIC_CITYTEACHER,"Ларес может помочь мне повысить мою ловкость.");
		b_logentry(TOPIC_CITYTEACHER,"Альрик может обучить меня искусству владения одноручным оружием. Он ошивается за складом в портовом квартале.");
		b_logentry(TOPIC_CITYTEACHER,"Игнац может показать мне рецепты приготовления зелий. Он живет в портовом квартале.");
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Ибрагим рисует карты и продает их в гавани.");
		DIA_KARDIF_LERNEN_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DIEBESWERK(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_diebeswerk_condition;
	information = dia_kardif_diebeswerk_info;
	permanent = TRUE;
	description = "А нет ли здесь какой-нибудь 'особой' работы ...?";
};


var int dia_kardif_diebeswerk_permanent;

func int dia_kardif_diebeswerk_condition()
{
	if((DIA_KARDIF_DIEBESWERK_PERMANENT == FALSE) && (DIA_KARDIF_ARBEIT_PERMANENT == TRUE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_diebeswerk_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk_15_00");	//А нет ли здесь какой-нибудь 'особой' работы, мне бы хотелось побыстрее заработать денег?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_01");	//Чего-нибудь особого, говоришь? Хмм...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_02");	//...попробуй поговорить с Нагуром. Возможно, он сможет помочь тебе.
		DIA_KARDIF_DIEBESWERK_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DIEBESWERK2(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_diebeswerk2_condition;
	information = dia_kardif_diebeswerk2_info;
	permanent = TRUE;
	description = "Есть что-нибудь 'особенное' для меня?";
};


var int dia_kardif_diebeswerk2_permanent;

func int dia_kardif_diebeswerk2_condition()
{
	if((DIA_KARDIF_DIEBESWERK2_PERMANENT == FALSE) && (DIA_KARDIF_DIEBESWERK_PERMANENT == TRUE) && (DIA_KARDIF_ARBEIT_PERMANENT == TRUE) && (KARDIF_ONEQUESTION == TRUE) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_kardif_diebeswerk2_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//Есть что-нибудь 'особенное' для меня?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_01");	//Да, есть кое-что - но это заинтересует тебя, только если ты блещешь разносторонними талантами.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_02");	//Выкладывай, что там у тебя?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_03");	//Ну, у Зуриса, торговца зельями на рынке, сейчас гостит Дарон, Маг Огня.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//И?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_05");	//При нем есть новый сундучок, сделанный специально для него Торбеном плотником.
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_06");	//Говорят, что этот Дарон носит с собой несметные сокровища. Но ты ничего не слышал от меня, понятно?
		DIA_KARDIF_DIEBESWERK2_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_ZURUECK(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_zurueck_condition;
	information = dia_kardif_zurueck_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int dia_kardif_zurueck_condition()
{
	if(KARDIF_ONEQUESTION == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_zurueck_info()
{
	KARDIF_ONEQUESTION = FALSE;
	Info_ClearChoices(dia_kardif_zurueck);
};


instance DIA_KARDIF_DOPE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_dope_condition;
	information = dia_kardif_dope_info;
	permanent = TRUE;
	description = "Где мне здесь купить травки?";
};


var int dia_kardif_dope_perm;

func int dia_kardif_dope_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_DOPE_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_dope_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Kardif_DOPE_15_01");	//Где мне здесь купить травки?
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_00");	//Только не здесь - я не имею дела с подобными вещами.
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_02");	//Только не здесь.
		AI_Output(other,self,"DIA_Kardif_DOPE_15_03");	//Ладно, тогда где?
		AI_Output(self,other,"DIA_Kardif_DOPE_14_04");	//Я бы на твоем месте поговорил с Мелдором - он дымит тут днями напролет.
		DIA_KARDIF_DOPE_PERM = TRUE;
	};
};


instance DIA_KARDIF_PAKET(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 3;
	condition = dia_kardif_paket_condition;
	information = dia_kardif_paket_info;
	permanent = TRUE;
	description = "Ты что-нибудь слышал о тюке болотной травы?";
};


var int dia_kardif_paket_perm;

func int dia_kardif_paket_condition()
{
	if((MIS_ANDRE_WAREHOUSE == LOG_RUNNING) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_PAKET_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_paket_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Paket_15_00");	//Ты что-нибудь слышал о тюке болотной травы?
		AI_Output(self,other,"DIA_Kardif_Paket_14_01");	//Тот, кто владеет этим тюком - богатый человек. И, возможно, весьма расслабленный также!
		AI_Output(other,self,"DIA_Kardif_Paket_15_02");	//Не пытайся провести меня. Ты что-то знаешь. Давай, выкладывай!
		AI_Output(self,other,"DIA_Kardif_Paket_14_03");	//Хорошо, хорошо - этот парень недавно заходил в мой трактир. Он из наемников.
		AI_Output(self,other,"DIA_Kardif_Paket_14_04");	//Он сказал, что продал тюк болотной травы в гавани, но, конечно же, он был обкуренный в хлам. Это все, что я знаю.
		DIA_KARDIF_PAKET_PERM = TRUE;
		b_logentry(TOPIC_WAREHOUSE,"Кардиф говорил с наемником. У этого парня есть тюк болотной травы, который он хотел продать.");
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_SENDATTILA(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_sendattila_condition;
	information = dia_kardif_sendattila_info;
	important = TRUE;
};


func int dia_kardif_sendattila_condition()
{
	if((MIS_THIEFGUILD_SUCKED == TRUE) || ((DIEBESGILDE_OKAY >= 3) && Npc_IsInState(self,zs_talk)))
	{
		return TRUE;
	};
};

func void dia_kardif_sendattila_info()
{
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_00");	//Эй, ты, иди сюда. У меня кое-что есть для тебя.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01");	//Один парень очень хочет поговорить с тобой.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_02");	//Так как он не нашел тебя здесь, он попросил меня передать тебе записку.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_03");	//Он хочет встретиться с тобой. За рыбной лавкой Халвора.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_04");	//Эта информация бесплатна - но это исключение! Цена на все остальное осталась прежней.
	AI_Output(other,self,"DIA_Kardif_SENDATTILA_15_05");	//Как выглядел этот парень?
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_06");	//Я мог бы сказать тебе - но тебе придется заплатить за это, мой друг. (усмехается)
	if(KARDIF_DEAL == 0)
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//Каждая информация, которую я сообщу тебе, будет стоить 10 золотых монет.
		KARDIF_DEAL = 10;
	};
	Wld_InsertNpc(vlk_494_attila,"NW_CITY_ENTRANCE_01");
};


instance DIA_KARDIF_KERL(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_kerl_condition;
	information = dia_kardif_kerl_info;
	permanent = TRUE;
	description = "Как выглядел этот парень?";
};


var int dia_kardif_kerl_permanent;

func int dia_kardif_kerl_condition()
{
	if(Npc_KnowsInfo(other,dia_kardif_sendattila) && (attila.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_KERL_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_kerl_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Kerl_15_00");	//Как выглядел этот парень?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_01");	//Ну, он довольно высокий, темнокожий и сильный - но он не носит униформы. Какой-то он... зловещий.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_02");	//А его лицо?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_03");	//Его лицо? Когда он глядел на меня, я был рад, что он пришел не за мной.
		AI_Output(self,other,"DIA_Kardif_Kerl_14_04");	//В его глазах было что-то пугающее - ну, как бы то ни было, я думаю, ты должен пойти, повидаться с ним. Это должно быть интересно.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_05");	//Да... весь вопрос в том, для кого...
		DIA_KARDIF_KERL_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DEFEATEDATTILA(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_defeatedattila_condition;
	information = dia_kardif_defeatedattila_info;
	permanent = FALSE;
	description = "Этот ублюдок пытался убить меня!";
};


func int dia_kardif_defeatedattila_condition()
{
	if(Npc_KnowsInfo(other,dia_attila_hallo))
	{
		return TRUE;
	};
};

func void dia_kardif_defeatedattila_info()
{
	AI_Output(other,self,"DIA_Kardif_DEFEATEDATTILA_15_00");	//Этот ублюдок пытался убить меня!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_01");	//Эй, откуда мне было знать? Я просто передал информацию.
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_02");	//Если кто-то решил насолить тебе, я думаю, у него были веские причины.
	b_giveplayerxp(XP_KARDIF_BLAME4ATTILA);
	b_killnpc(attila);
	Npc_RemoveInvItem(attila,itmi_oldcoin);
};


instance DIA_KARDIF_ZEICHEN(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_zeichen_condition;
	information = dia_kardif_zeichen_info;
	permanent = FALSE;
	description = "(показать сигнал воров)";
};


func int dia_kardif_zeichen_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_00");	//Ах, ты имеешь дела с бандой. Хорошо. В таком случае, у меня кое-что есть для тебя.
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_01");	//(вкрадчиво) Если тебе понадобятся отмычки, намекни. Я припас несколько на всякий случай. Просто попроси меня налить тебе выпивки.
	CreateInvItems(self,itke_lockpick,20);
};


instance DIA_KARDIF_CREW(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 51;
	condition = dia_kardif_crew_condition;
	information = dia_kardif_crew_info;
	permanent = FALSE;
	description = "Мне все еще нужны матросы.";
};


func int dia_kardif_crew_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_crew_info()
{
	AI_Output(other,self,"DIA_Kardif_Crew_15_00");	//Мне все еще нужны матросы.
	AI_Output(self,other,"DIA_Kardif_Crew_14_01");	//Настали плохие времена, дружище. Ты не найдешь матросов во всем Хоринисе. Большинство из них давно покинули город.
	AI_Output(self,other,"DIA_Kardif_Crew_14_02");	//Но с хорошим капитаном будет нетрудно набрать несколько смышленных парней, и довольно быстро сделать из них неплохую команду.
	AI_Output(other,self,"DIA_Kardif_Crew_15_03");	//Где я могу найти капитана?
	AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//Ты обращаешься не по адресу. Я простой трактирщик.
	if(Npc_IsDead(jack) == FALSE)
	{
		if(SCGOTCAPTAIN == FALSE)
		{
			Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
			b_logentry(TOPIC_CAPTAIN,"Кардиф отправил меня к старому Джеку. Возможно, он сможет помочь мне");
		};
		AI_Output(self,other,"DIA_Kardif_Crew_14_05");	//Иди, поговори со Старым Джеком. Он ошивается в этом порту, сколько я себя помню. В том, что касается морского дела, это тот человек, что тебе нужен.
	};
};

