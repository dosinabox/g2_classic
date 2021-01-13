
instance DIA_THORBEN_EXIT(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 999;
	condition = dia_thorben_exit_condition;
	information = dia_thorben_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_thorben_exit_condition()
{
	return TRUE;
};

func void dia_thorben_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_PICKPOCKET(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 900;
	condition = dia_thorben_pickpocket_condition;
	information = dia_thorben_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_thorben_pickpocket_condition()
{
	return c_beklauen(30,28);
};

func void dia_thorben_pickpocket_info()
{
	Info_ClearChoices(dia_thorben_pickpocket);
	Info_AddChoice(dia_thorben_pickpocket,DIALOG_BACK,dia_thorben_pickpocket_back);
	Info_AddChoice(dia_thorben_pickpocket,DIALOG_PICKPOCKET,dia_thorben_pickpocket_doit);
};

func void dia_thorben_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thorben_pickpocket);
};

func void dia_thorben_pickpocket_back()
{
	Info_ClearChoices(dia_thorben_pickpocket);
};


instance DIA_THORBEN_ANGEPISST(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 1;
	condition = dia_thorben_angepisst_condition;
	information = dia_thorben_angepisst_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_thorben_angepisst_condition()
{
	if(Npc_IsDead(gritta) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_thorben_angepisst_info()
{
	AI_Output(self,other,"DIA_Thorben_angepisst_06_00");	//Ты убил мою Гритту. Я никогда не прощу тебя. Прочь с глаз моих, убийца!
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_HALLO(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_hallo_condition;
	information = dia_thorben_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thorben_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_thorben_hallo_info()
{
	AI_Output(self,other,"DIA_Thorben_Hallo_06_00");	//Ах! Новое лицо. Ты ведь не из Хориниса, да?
	AI_Output(self,other,"DIA_Thorben_Hallo_06_01");	//Сейчас не лучшее время для путешествий. Бандиты повсюду, работы нет, а теперь еще и фермеры восстали.
	AI_Output(self,other,"DIA_Thorben_Hallo_06_02");	//Каким ветром тебя сюда занесло?
};


instance DIA_THORBEN_ARBEIT(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_arbeit_condition;
	information = dia_thorben_arbeit_info;
	permanent = FALSE;
	description = "Я ищу работу.";
};


func int dia_thorben_arbeit_condition()
{
	return TRUE;
};

func void dia_thorben_arbeit_info()
{
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_00");	//Я ищу работу.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_01");	//Ты что-нибудь знаешь о плотницком деле?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_02");	//Единственное, что я могу получить из дерева, - это огонь.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_03");	//А что насчет замков?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_04");	//Нуууу...
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_05");	//Извини, но я не могу взять тебя, если ты ничего не понимаешь в моем ремесле.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_06");	//И у меня нет денег, чтобы платить ученику.
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"Торбен не примет меня в ученики.");
};


instance DIA_THORBEN_OTHERMASTERS(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_othermasters_condition;
	information = dia_thorben_othermasters_info;
	permanent = FALSE;
	description = "А что если я поступлю в ученики к одному из других здешних мастеров?";
};


func int dia_thorben_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_thorben_othermasters_info()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_15_00");	//А что если я поступлю в ученики к одному из других здешних мастеров?
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_01");	//Хорошо, я дам свое одобрение.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_02");	//Но тебе нужно сначала получить благословение богов.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_03");	//Скажи, ты верующий человек?
	Info_ClearChoices(dia_thorben_othermasters);
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		Info_AddChoice(dia_thorben_othermasters,"Ну, если ты это имеешь в виду, я регулярно молюсь...",dia_thorben_othermasters_naja);
	};
	Info_AddChoice(dia_thorben_othermasters,"Да. Я образцовый верующий, мастер Торбен.",dia_thorben_othermasters_devoutly);
};

func void b_thorben_getblessings()
{
	AI_Output(self,other,"B_Thorben_GetBlessings_06_00");	//Тогда иди к Ватрасу, жрецу Аданоса, пусть он даст тебе благословение.
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other,"B_Thorben_GetBlessings_06_01");	//Он также подскажет тебе, где найти жреца Инноса. Ты должен получить и его благословение.
	};
	AI_Output(self,other,"B_Thorben_GetBlessings_06_02");	//А когда ты получишь благословение богов, Я проголосую за тебя.
	MIS_THORBEN_GETBLESSINGS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_THORBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_THORBEN,LOG_RUNNING);
	b_logentry(TOPIC_THORBEN,"Торбен даст мне свое одобрение, если жрец Аданоса и жрец Инноса дадут мне свое благословение.");
};

func void dia_thorben_othermasters_devoutly()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Devoutly_15_00");	//Да. Я образцовый верующий, мастер Торбен.
	b_thorben_getblessings();
	Info_ClearChoices(dia_thorben_othermasters);
};

func void dia_thorben_othermasters_naja()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Naja_15_00");	//Ну, если ты это имеешь в виду, я регулярно молюсь...
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_01");	//Понимаю!
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_02");	//Человек, который занимается ремеслом без благословения богов, никогда не получит моего одобрения.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_03");	//Проси богов о прощении твоих прегрешений.
	b_thorben_getblessings();
	Info_ClearChoices(dia_thorben_othermasters);
};


instance DIA_THORBEN_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 1;
	condition = dia_thorben_zustimmung_condition;
	information = dia_thorben_zustimmung_info;
	permanent = TRUE;
	description = "Как насчет одобрения, мастер?";
};


func int dia_thorben_zustimmung_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && (MIS_THORBEN_GETBLESSINGS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_thorben_zustimmung_info()
{
	AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_00");	//Как насчет одобрения, мастер?
	AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_01");	//Ватрас дал тебе благословение?
	if(VATRAS_SEGEN == TRUE)
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_02");	//Да.
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_03");	//А благословение жреца Инноса ты получил?
		if((DARON_SEGEN == TRUE) || (ISGAROTH_SEGEN == TRUE) || (other.guild == GIL_KDF))
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_04");	//Да, получил.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_05");	//Тогда ты получишь и мое благословение. Не важно, какому пути ты решил следовать, гордись своим ремеслом, мой мальчик!
			MIS_THORBEN_GETBLESSINGS = LOG_SUCCESS;
			b_giveplayerxp(XP_ZUSTIMMUNG);
			Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
			b_logentry(TOPIC_LEHRLING,"Торбен даст мне свое одобрение, если я захочу стать учеником.");
		}
		else
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_06");	//Нет. Еще нет...
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_07");	//Ты знаешь мои условия. Ты можешь заниматься ремеслом только с благословения богов.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_08");	//Еще нет...
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_09");	//Тогда я не понимаю, зачем ты опять пришел ко мне. Ты знаешь мои условия.
	};
};


instance DIA_THORBEN_LOCKSMITH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_locksmith_condition;
	information = dia_thorben_locksmith_info;
	permanent = FALSE;
	description = "Так ты разбираешься в замках?";
};


func int dia_thorben_locksmith_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit))
	{
		return TRUE;
	};
};

func void dia_thorben_locksmith_info()
{
	AI_Output(other,self,"DIA_Thorben_Locksmith_15_00");	//Так ты разбираешься в замках?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_01");	//Какой смысл в хорошем сундуке без хорошего замка?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_02");	//Я делаю свои собственные замки. Так, по крайней мере, я могу быть уверен, что не делаю сундуки, которые ни от чего не защищают.
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_03");	//Плохо сделанный замок легко сломать. А в Хоринисе очень много воров. Особенно в последнее время!
};


instance DIA_THORBEN_SCHULDENBUCH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_schuldenbuch_condition;
	information = dia_thorben_schuldenbuch_info;
	permanent = FALSE;
	description = "У меня есть гроссбух Лемара...";
};


func int dia_thorben_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_thorben_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_00");	//У меня есть гроссбух Лемара...
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_01");	//(подозрительно) Где ты взял его?
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_02");	//Тебя должно интересовать не где я взял его, а то, что в нем записано твое имя.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_03");	//Дай его сюда!
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_04");	//А что ты готов дать за него?
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_05");	//У меня нет денег. Но ты можешь рассчитывать на мою сердечную благодарность.
	b_giveplayerxp(XP_SCHULDENBUCH);
};


instance DIA_THORBEN_PLEASETEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_pleaseteach_condition;
	information = dia_thorben_pleaseteach_info;
	permanent = TRUE;
	description = "Ты можешь научить меня вскрывать замки отмычками?";
};


func int dia_thorben_pleaseteach_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_locksmith) && (THORBEN_TEACHPLAYER == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void dia_thorben_pleaseteach_info()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_00");	//Ты можешь научить меня вскрывать замки отмычками?
	if(Npc_HasItems(self,itwr_schuldenbuch) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_01");	//Если бы не ты, я бы платил Лемару до конца своих дней.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//Я обучу тебя тому, что ты хочешь знать.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else if(THORBEN_GOTGOLD == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_03");	//Ты принес мне 100 золотых монет. Это широкий жест с твоей стороны.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_04");	//Мне очень стыдно, но я вынужден попросить у тебя еще.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_05");	//Если я не отдам долг Лемару в ближайшее время, он натравит на меня своих головорезов.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_06");	//Дай мне еще 100 золотых, и я обучу тебя.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"Сколько ты возьмешь?",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"Отлично. Вот 100 золотых.",dia_thorben_pleaseteach_pay100);
	}
	else if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_07");	//Ты заплатил долг Гритты Маттео. Похоже, ты хороший человек. Я обучу тебя тому, что ты хочешь знать.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_08");	//Однако я не могу сделать это бесплатно. У целая куча долгов, и мне нужны деньги.
		AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_09");	//Сколько ты возьмешь?
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_10");	//200 золотых монет.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"Может быть, позже...",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"Отлично. Вот 200 золотых.",dia_thorben_pleaseteach_pay200);
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_11");	//Хмм... я не знаю, можно ли тебе доверять.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_12");	//Боюсь, ты можешь оказаться одним из этих бездельников, которые приходят в город, только чтобы обчистить сундуки честных людей.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_13");	//Я ничему не буду учить тебя, пока не буду уверен, что ты честный человек.
	};
};

func void dia_thorben_pleaseteach_pay200()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay200_15_00");	//Отлично. Вот 200 золотых.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_01");	//Эти деньги очень помогут мне. Мы приступим, как только ты будешь готов.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_02");	//У тебя нет 200 монет. А мне нужна вся сумма.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_pay100()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay100_15_00");	//Отлично. Вот 100 золотых.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_01");	//В таком случае, мы можем начать, когда ты будешь готов.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_02");	//Эй, у тебя же нет 100 монет.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_later()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Later_15_00");	//Может быть, позже...
	Info_ClearChoices(dia_thorben_pleaseteach);
};


instance DIA_THORBEN_TEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_teach_condition;
	information = dia_thorben_teach_info;
	permanent = TRUE;
	description = b_buildlearnstring("Научи меня вскрывать замки!",b_getlearncosttalent(other,NPC_TALENT_PICKLOCK));
};


func int dia_thorben_teach_condition()
{
	if((THORBEN_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void dia_thorben_teach_info()
{
	AI_Output(other,self,"DIA_Thorben_Teach_15_00");	//Научи меня вскрывать замки!
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Thorben_Teach_06_01");	//Все, что тебе нужно - это отмычка. Если ты будешь осторожно поворачивать ее влево и вправо в замке, ты сможешь вскрыть его.
		AI_Output(self,other,"DIA_Thorben_Teach_06_02");	//Но если ты будешь вращать отмычку слишком сильно или слишком быстро в неправильном направлении, она сломается.
		AI_Output(self,other,"DIA_Thorben_Teach_06_03");	//Чем более опытным ты будешь становиться, тем меньше отмычек тебе понадобится. Вот, пожалуй, и все, что тебе нужно знать.
	};
};


instance DIA_THORBEN_TRADE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 3;
	condition = dia_thorben_trade_condition;
	information = dia_thorben_trade_info;
	permanent = TRUE;
	description = "Ты можешь продать мне отмычки?";
	trade = TRUE;
};


func int dia_thorben_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_locksmith))
	{
		return TRUE;
	};
};

func void dia_thorben_trade_info()
{
	AI_Output(other,self,"DIA_Thorben_TRADE_15_00");	//Ты можешь продать мне отмычки?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_01");	//Если еще остались...
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_02");	//Хорошо. Но они ничем не помогут тебе, пока ты не научишься пользоваться ими.
	};
	if((Npc_HasItems(self,itke_lockpick) == 0) && (KAPITEL > DIETRICHGEBEN))
	{
		CreateInvItems(self,itke_lockpick,5);
		DIETRICHGEBEN = DIETRICHGEBEN + 1;
	};
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"Плотник Торбен продает отмычки.");
};


instance DIA_THORBEN_PALADINE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_thorben_paladine_condition;
	information = dia_thorben_paladine_info;
	permanent = FALSE;
	description = "Что ты знаешь о паладинах?";
};


func int dia_thorben_paladine_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_thorben_paladine_info()
{
	AI_Output(other,self,"DIA_Thorben_Paladine_15_00");	//Что ты знаешь о паладинах?
	AI_Output(self,other,"DIA_Thorben_Paladine_06_01");	//Немногое. Они прибыли на корабле с материка две недели назад.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_02");	//С тех пор, они заперлись в верхнем квартале города.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_03");	//Никто толком не знает, зачем они прибыли.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_04");	//Многие опасаются нападения орков.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_05");	//А я думаю, что они здесь, чтобы подавить восстание фермеров.
};


instance DIA_THORBEN_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_thorben_bauernaufstand_condition;
	information = dia_thorben_bauernaufstand_info;
	permanent = FALSE;
	description = "Ты знаешь что-нибудь о восстании фермеров?";
};


func int dia_thorben_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_paladine) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_thorben_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Thorben_Bauernaufstand_15_00");	//Ты знаешь что-нибудь о восстании фермеров?
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_01");	//Ходят слухи, что лендлорд Онар нанял наемников, чтобы стряхнуть со своей шеи королевские войска.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_02");	//Он, вероятно, устал отдавать весь свой урожай паладинам и ополчению.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_03");	//Ну а в городе после этого стали расти цены на продовольствие.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_04");	//Ферма Онара находится далеко на восток отсюда. Мы не знаем, были там сражения или нет.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_05");	//Если ты хочешь узнать больше, поспрашивай торговцев на рыночной площади. Они лучше знают обстановку на острове, чем я.
};


instance DIA_THORBEN_GRITTA(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_thorben_gritta_condition;
	information = dia_thorben_gritta_info;
	permanent = FALSE;
	description = "Я насчет Гритты...";
};


func int dia_thorben_gritta_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && !Npc_IsDead(gritta))
	{
		return TRUE;
	};
};

func void dia_thorben_gritta_info()
{
	AI_Output(other,self,"DIA_Thorben_Gritta_15_00");	//Я насчет Гритты...
	AI_Output(self,other,"DIA_Thorben_Gritta_06_01");	//Моей племянницы? Какое тебе дело до нее? Это насчет долга, да?
	AI_Output(other,self,"DIA_Thorben_Gritta_15_02");	//Она должна 100 золотых торговцу Маттео.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_03");	//Скажи мне, что это не так! С тех пор, как она живет со мной, от нее одни проблемы!
	AI_Output(self,other,"DIA_Thorben_Gritta_06_04");	//Она задолжала почти всем торговцам города.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_05");	//Мне пришлось занять 200 золотых у ростовщика Лемара, чтобы расплатиться с ее долгами! И вот теперь опять!
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output(self,other,"DIA_Thorben_Gritta_06_06");	//Гритта должна быть в доме.
	};
	AI_Output(self,other,"DIA_Thorben_Gritta_06_07");	//Иди, поговори с ней. Но я скажу тебе честно: у нее нет ни ОДНОЙ золотой монеты.
	if(Npc_HasItems(gritta,itmi_gold) >= 100)
	{
		AI_Output(other,self,"DIA_Thorben_Gritta_15_08");	//Посмотрим...
	};
};


instance DIA_THORBEN_GRITTAHATTEGOLD(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_thorben_grittahattegold_condition;
	information = dia_thorben_grittahattegold_info;
	permanent = FALSE;
	description = "У твоей племянницы было 100 золотых монет.";
};


func int dia_thorben_grittahattegold_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_gritta) && (Npc_HasItems(gritta,itmi_gold) < 100) && !Npc_IsDead(gritta))
	{
		return TRUE;
	};
};

func void dia_thorben_grittahattegold_info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_15_00");	//У твоей племянницы было 100 золотых монет.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_01");	//ЧТО? Ах она змея - это было МОЕ золото! Она взяла его из моего сундука.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_02");	//Отдай его мне! Я должен сначала заплатить Лемару. Маттео может подождать!
	Info_ClearChoices(dia_thorben_grittahattegold);
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Я уже отдал золото Маттео!",dia_thorben_grittahattegold_matteohates);
	}
	else
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Нет. Маттео получит свои деньги назад.",dia_thorben_grittahattegold_matteosollhaben);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"Вот твое золото.",dia_thorben_grittahattegold_hereitis);
	};
};

func void b_thorben_deletepetzcrimegritta()
{
	if(GRITTA_GOLDGIVEN == FALSE)
	{
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_00");	//И, насколько я знаю эту гадюку, я уверен, что она побежит прямо к стражникам и обвинит тебя тоже!
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_01");	//Я должен уладить этот вопрос.
		b_deletepetzcrime(gritta);
	};
};

func void dia_thorben_grittahattegold_matteohates()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00");	//Я уже отдал золото Маттео!
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01");	//Черт! Ну, ладно, долг есть долг. По крайней мере, ты не присвоил это золото. Думаю, мне нужно поблагодарить тебя за это.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_matteosollhaben()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00");	//Нет. Маттео получит свои деньги назад.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01");	//Ты просто убиваешь меня. Лемар не отличается великодушием, когда дело доходит до долгов.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02");	//Но, по крайней мере, ты расплатишься с долгами моей племянницы. Думаю, мне нужно поблагодарить тебя за это.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_hereitis()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00");	//Вот твое золото.
	b_giveinvitems(other,self,itmi_gold,100);
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01");	//Спасибо! Теперь, у меня есть хотя бы часть денег, которые я должен Лемару.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02");	//Не могу поверить, что у нее хватило наглости взять мое золото!
	b_thorben_deletepetzcrimegritta();
	THORBEN_GOTGOLD = TRUE;
	Info_ClearChoices(dia_thorben_grittahattegold);
};

