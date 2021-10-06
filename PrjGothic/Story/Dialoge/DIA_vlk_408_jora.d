
instance DIA_JORA_EXIT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 999;
	condition = dia_jora_exit_condition;
	information = dia_jora_exit_info;
	permanent = TRUE;
	description = "Мне нужно идти!";
};


func int dia_jora_exit_condition()
{
	return TRUE;
};

func void dia_jora_exit_info()
{
	if(((JORA_DIEB == LOG_FAILED) || (JORA_DIEB == LOG_SUCCESS)) && (JORA_GOLD == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Jora_EXIT_08_00");	//Эй! Как насчет моих денег?
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORA_SPERRE(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_sperre_condition;
	information = dia_jora_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_jora_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_jora_sperre_info()
{
	AI_Output(self,other,"DIA_Jora_Sperre_08_00");	//Ты каторжник из колонии. Я ничего не буду тебе продавать!
	AI_StopProcessInfos(self);
};


instance DIA_JORA_WAREZ(C_INFO)
{
	npc = vlk_408_jora;
	nr = 700;
	condition = dia_jora_warez_condition;
	information = dia_jora_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Покажи мне свои товары.";
};


func int dia_jora_warez_condition()
{
	return TRUE;
};

func void dia_jora_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Jora_WAREZ_15_00");	//Покажи мне свои товары.
};


instance DIA_JORA_GREET(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_greet_condition;
	information = dia_jora_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jora_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE))
	{
		return TRUE;
	};
};

func void dia_jora_greet_info()
{
	AI_Output(self,other,"DIA_Jora_GREET_08_00");	//Да пребудет с тобой Иннос, чужеземец. Если тебе что-то нужно для твоих странствий, ты обратился по адресу.
	AI_Output(self,other,"DIA_Jora_GREET_08_01");	//Но я предупреждаю тебя: если ты хочешь взять что-нибудь, не заплатив, я позову стражу!
	AI_Output(other,self,"DIA_Jora_GREET_15_02");	//Минутку. Я что, похож на вора?
	AI_Output(self,other,"DIA_Jora_GREET_08_03");	//(презрительно) Ха! Ты будешь не первым, кто что-нибудь спер у меня сегодня.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Джора торгует различным оружием на рыночной площади.");
};


instance DIA_JORA_BESTOHLEN(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_bestohlen_condition;
	information = dia_jora_bestohlen_info;
	permanent = FALSE;
	description = "Кто-то обокрал тебя?";
};


func int dia_jora_bestohlen_condition()
{
	return TRUE;
};

func void dia_jora_bestohlen_info()
{
	AI_Output(other,self,"DIA_Jora_Bestohlen_15_00");	//Кто-то обокрал тебя?
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_01");	//Я не могу доказать это. Этот парень был чертовски хитер. Представился как Ренгару - если это действительно его имя.
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_02");	//Он уже несколько дней ошивается на рыночной площади.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Bestohlen_08_03");	//А каждый вечер он зависает у пивной бочки вниз по улице. Готов поклясться, этот ублюдок пропивает МОИ деньги!
	};
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_04");	//Я отвернулся всего на мгновение, и мой кошелек пропал!
};

func void b_jora_goldforclue()
{
	AI_Output(self,other,"DIA_Jora_Add_08_04");	//Послушай - если ты вернешь золото, украденное этим Ренгару, я расскажу тебе кое-что.
};


instance DIA_JORA_HOLDEINGOLD(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_holdeingold_condition;
	information = dia_jora_holdeingold_info;
	permanent = FALSE;
	description = "Я мог бы вернуть тебе это золото.";
};


func int dia_jora_holdeingold_condition()
{
	if(Npc_KnowsInfo(other,dia_jora_bestohlen))
	{
		return TRUE;
	};
};

func void dia_jora_holdeingold_info()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_15_00");	//Я мог бы вернуть тебе это золото.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_01");	//(недоверчиво) Да? А зачем тебе это?
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"Я хочу получить часть золота в качестве вознаграждения!",dia_jora_holdeingold_willbelohnung);
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		Info_AddChoice(dia_jora_holdeingold,"Я ищу подходы к гильдии воров!",dia_jora_holdeingold_ghdg);
	};
	if((other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		Info_AddChoice(dia_jora_holdeingold,"Как сказать... ну, ты мог бы, например, помочь мне попасть в верхний квартал?",dia_jora_holdeingold_toov);
	};
};

func void dia_jora_holdeingold_toov()
{
	AI_Output(other,self,"DIA_Jora_Add_15_00");	//Как сказать... ну, ты мог бы, например, помочь мне попасть в верхний квартал?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_03");	//(смеется) Ты обратился не по адресу. Я нездешний, как и большинство торговцев на этой площади.
	AI_Output(self,other,"DIA_Jora_Add_08_01");	//Если ты хочешь попасть в верхний квартал, поговори с местными торговцами в нижней части города.
};

func void dia_jora_holdeingold_ghdg()
{
	AI_Output(other,self,"DIA_Jora_Add_15_02");	//Я ищу подходы к гильдии воров!
	AI_Output(self,other,"DIA_Jora_Add_08_03");	//Тут я мог бы помочь тебе.
	b_jora_goldforclue();
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"Я попробую.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"Сколько золота было в этом кошельке?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"Почему ты не позвал стражу?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_willbelohnung()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_WillBelohnung_15_00");	//Я хочу получить часть золота в качестве вознаграждения!
	AI_Output(self,other,"DIA_Jora_HolDeinGold_WillBelohnung_08_01");	//Сначала верни мне мой кошелек. А там уж поговорим о твоем вознаграждении!
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"Я попробую.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"Сколько золота было в этом кошельке?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"Почему ты не позвал стражу?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_wache()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_Wache_15_00");	//Почему ты не позвал стражу?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_01");	//Стража реагирует, только если вор пойман с поличным.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_02");	//А когда я заметил, что мой кошелек пропал, его и след простыл!
};

func void dia_jora_holdeingold_howmuch()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_HowMuch_15_00");	//Сколько золота было в этом кошельке?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_HowMuch_08_01");	//50 золотых - это солидная сумма по нынешним временам.
};

func void dia_jora_holdeingold_doit()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_00");	//Я посмотрю, что можно сделать.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_01");	//Будь осторожен! Если ты просто вырубишь этого ублюдка, на тебя самого набросится стража.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_02");	//Последнее время обстановка здесь значительно обострилась. С тех пор, как паладины прибыли в город, стража набрасывается на всех, кто вступает в драку.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_03");	//Так что придумай что-нибудь...
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_04");	//Попробую.
	JORA_DIEB = LOG_RUNNING;
	JORA_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_JORADIEB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORADIEB,LOG_RUNNING);
	Log_CreateTopic(TOPIC_JORA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORA,LOG_RUNNING);
	b_logentry(TOPIC_JORA,"Парень по имени Ренгару ограбил торговца Джору. Он весь день околачивается на рынке.");
	b_logentry(TOPIC_JORA,"Я должен вернуть украденное золото Джоры.");
	b_logentry(TOPIC_JORADIEB,"Ренгару ограбил торговца Джору. Если я поймаю его, мне за это полагается награда.");
	Info_ClearChoices(dia_jora_holdeingold);
};


instance DIA_JORA_WEGENDIEB(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_wegendieb_condition;
	information = dia_jora_wegendieb_info;
	permanent = TRUE;
	description = "Насчет вора...";
};


func int dia_jora_wegendieb_condition()
{
	if(JORA_DIEB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jora_wegendieb_info()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_15_00");	//Насчет вора...
	AI_Output(self,other,"DIA_Jora_WegenDieb_08_01");	//Да, как продвигается дело? Ты поймал его? И что более важно, ты забрал у него мое золото?
	Info_ClearChoices(dia_jora_wegendieb);
	if(Npc_IsDead(rengaru))
	{
		Info_AddChoice(dia_jora_wegendieb,"Ну, с ним произошел несчастный случай.",dia_jora_wegendieb_tot);
	}
	else if(RENGARU_INKNAST == TRUE)
	{
		Info_AddChoice(dia_jora_wegendieb,"Да, я поймал его.",dia_jora_wegendieb_imknast);
	}
	else if(Npc_KnowsInfo(other,dia_rengaru_hallodieb))
	{
		Info_AddChoice(dia_jora_wegendieb,"Он сбежал от меня.",dia_jora_wegendieb_entkommen);
	};
	Info_AddChoice(dia_jora_wegendieb,"Я все еще работаю над этим!",dia_jora_wegendieb_continue);
};

func void dia_jora_wegendieb_continue()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Continue_15_00");	//Я все еще работаю над этим!
	AI_Output(self,other,"DIA_Jora_WegenDieb_Continue_08_01");	//Не забудь принести мне это золото назад!
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_entkommen()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Entkommen_15_00");	//Он сбежал от меня.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Entkommen_08_01");	//А мое золото? Он унес его с собой?
	JORA_DIEB = LOG_FAILED;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_imknast()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_ImKnast_15_00");	//Да, я поймал его. Пусть немного посидит за решеткой, подумает...
	AI_Output(self,other,"DIA_Jora_WegenDieb_ImKnast_08_01");	//А что насчет моего золота?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_tot()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Tot_15_00");	//Ну, с ним произошел несчастный случай.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_01");	//Ну, хотя бы он теперь не сможет никого обокрасть! Правосудие Инноса свершилось!
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_02");	//Где мое золото?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};


instance DIA_JORA_BRINGGOLD(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_bringgold_condition;
	information = dia_jora_bringgold_info;
	permanent = TRUE;
	description = "Вот 50 золотых, что он украл у тебя.";
};


func int dia_jora_bringgold_condition()
{
	if(((JORA_DIEB == LOG_FAILED) || (JORA_DIEB == LOG_SUCCESS)) && (JORA_GOLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_jora_bringgold_info()
{
	AI_Output(other,self,"DIA_Jora_BringGold_15_00");	//Вот 50 золотых, что он украл у тебя.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_01");	//Хвала Инносу! Есть еще правосудие в этом городе.
		JORA_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_JORA_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_03");	//Эй, здесь не все 50 золотых! Ты что, тоже пытаешься меня обокрасть?
	};
};


var int jora_ghdghinweis;

instance DIA_JORA_GHDGINFO(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_ghdginfo_condition;
	information = dia_jora_ghdginfo_info;
	permanent = TRUE;
	description = "Что ты знаешь о гильдии воров?";
};


func int dia_jora_ghdginfo_condition()
{
	if((MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING) && Npc_KnowsInfo(other,dia_jora_bestohlen) && (JORA_GHDGHINWEIS == FALSE))
	{
		return TRUE;
	};
};

func void dia_jora_ghdginfo_info()
{
	AI_Output(other,self,"DIA_Jora_Add_15_05");	//Что ты знаешь о гильдии воров?
	if(JORA_GOLD != LOG_SUCCESS)
	{
		b_jora_goldforclue();
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_Add_08_06");	//Хорошо - я скажу - но ты ничего не слышал от меня, если что, понятно?
		AI_Output(self,other,"DIA_Jora_Add_08_07");	//В портовом кабаке постоянно ошиваются какие-то темные личности.
		AI_Output(self,other,"DIA_Jora_Add_08_08");	//Готов поклясться, что бармен что-то знает об этом...
		AI_Output(self,other,"DIA_Jora_Add_08_09");	//Если ты хочешь выследить этих воров, тебе стоит поговорить с НИМ.
		AI_Output(self,other,"DIA_Jora_Add_08_10");	//Ты можешь притвориться, что ищешь какую-нибудь темную работенку, например. Может, он купится на это.
		AI_Output(self,other,"DIA_Jora_Add_08_11");	//Но будь осторожен. С этими людьми лучше не шутить.
		JORA_GHDGHINWEIS = TRUE;
	};
};


instance DIA_JORA_BELOHNUNG(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_belohnung_condition;
	information = dia_jora_belohnung_info;
	permanent = FALSE;
	description = "Я хочу получить часть золота в качестве вознаграждения!";
};


func int dia_jora_belohnung_condition()
{
	if(JORA_GOLD == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jora_belohnung_info()
{
	AI_Output(other,self,"DIA_Jora_Belohnung_15_00");	//Я хочу получить часть золота в качестве вознаграждения!
	if(JORA_GHDGHINWEIS == TRUE)
	{
		AI_Output(self,other,"DIA_Jora_Add_08_12");	//Но я уже дал тебе ценный совет.
		AI_Output(self,other,"DIA_Jora_Add_08_13");	//Этого должно хватить в качестве вознаграждения.
	};
	AI_Output(self,other,"DIA_Jora_Add_08_14");	//А если тебе нужно золото, то выслеживай воров и получай награду за их голову у лорда Андрэ.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Belohnung_08_03");	//А теперь извини, меня ждут клиенты...
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORA_ALRIKSSCHWERT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_alriksschwert_condition;
	information = dia_jora_alriksschwert_info;
	permanent = FALSE;
	description = "Альрик говорит, что у тебя его меч...";
};


func int dia_jora_alriksschwert_condition()
{
	if(MIS_ALRIK_SWORD == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jora_alriksschwert_info()
{
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_00");	//Альрик говорит, что у тебя его меч...
	AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_01");	//Ты имеешь в виду этого оборванца, что продал мне свое оружие за несколько факелов и кусок мяса?
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_02");	//Да, это он.
	if(Npc_HasItems(self,itmw_alrikssword_mis) > 0)
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_03");	//Его меч все еще у меня.
		AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_04");	//Сколько ты хочешь за него?
		if(JORA_GOLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_05");	//Ну - для тебя...
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_06");	//А, ладно! Забирай его так. Ведь ты помог мне вернуть мое золото...
			b_giveinvitems(self,other,itmw_alrikssword_mis,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_07");	//Ну - только для тебя - 50 золотых монет.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_08");	//(раздраженно) У меня его больше нет! Черт его знает, кому я его продал!
	};
};


instance DIA_JORA_BUYALRIKSSCHWERT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_buyalriksschwert_condition;
	information = dia_jora_buyalriksschwert_info;
	permanent = TRUE;
	description = "Вот 50 золотых монет. Давай мне меч Альрика.";
};


func int dia_jora_buyalriksschwert_condition()
{
	if(Npc_KnowsInfo(other,dia_jora_alriksschwert) && (Npc_HasItems(self,itmw_alrikssword_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_jora_buyalriksschwert_info()
{
	AI_Output(other,self,"DIA_Jora_BUYAlriksSchwert_15_00");	//Вот 50 золотых монет. Давай мне меч Альрика.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_04");	//Вот, держи - (ухмыляется) это выгодная сделка.
		b_giveinvitems(self,other,itmw_alrikssword_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_05");	//У тебя недостаточно золота. Но не волнуйся - я попридержу пока этот меч. Заходи позже, если хочешь...
//		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_03");	//You can always do that - for 50 gold pieces it's yours.	
	};
};


instance DIA_JORA_PICKPOCKET(C_INFO)
{
	npc = vlk_408_jora;
	nr = 900;
	condition = dia_jora_pickpocket_condition;
	information = dia_jora_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_jora_pickpocket_condition()
{
	return c_beklauen(31,45);
};

func void dia_jora_pickpocket_info()
{
	Info_ClearChoices(dia_jora_pickpocket);
	Info_AddChoice(dia_jora_pickpocket,DIALOG_BACK,dia_jora_pickpocket_back);
	Info_AddChoice(dia_jora_pickpocket,DIALOG_PICKPOCKET,dia_jora_pickpocket_doit);
};

func void dia_jora_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jora_pickpocket);
};

func void dia_jora_pickpocket_back()
{
	Info_ClearChoices(dia_jora_pickpocket);
};

