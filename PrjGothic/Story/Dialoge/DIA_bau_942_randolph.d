
instance DIA_RANDOLPH_EXIT(C_INFO)
{
	npc = bau_942_randolph;
	nr = 999;
	condition = dia_randolph_exit_condition;
	information = dia_randolph_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_randolph_exit_condition()
{
	return TRUE;
};

func void dia_randolph_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_SCHWERELUFT(C_INFO)
{
	npc = bau_942_randolph;
	nr = 4;
	condition = dia_randolph_schwereluft_condition;
	information = dia_randolph_schwereluft_info;
	permanent = FALSE;
	description = "Все в порядке?";
};


func int dia_randolph_schwereluft_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_schwereluft_info()
{
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_01");	//Хммм... Как только кто-нибудь здесь скажет неверное слово, начнется танец смерти... так что будь осторожнее - или резни не миновать.
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_02");	//Ты будешь участвовать в схватке?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_03");	//Я не останусь в стороне, когда начнется драка. Но я также не собираюсь провоцировать ее.
	AKILS_SLDSTILLTHERE = TRUE;
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Фермеру Акилу угрожают наемники.");
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_HALLO(C_INFO)
{
	npc = bau_942_randolph;
	nr = 4;
	condition = dia_randolph_hallo_condition;
	information = dia_randolph_hallo_info;
	permanent = FALSE;
	description = "Все в порядке?";
};


func int dia_randolph_hallo_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_hallo_info()
{
	AI_Output(other,self,"DIA_Randolph_HALLO_15_00");	//Все в порядке?
	if(Npc_IsDead(akil) && Npc_IsDead(kati))
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_01");	//Теперь, когда Кати и Акил отправились в царство Инноса, я буду управлять этой фермой.
		Npc_ExchangeRoutine(self,"START");
		AI_ContinueRoutine(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_02");	//Да, я в порядке. Этот Альварес становился все наглее и наглее с каждым днем. Хорошо, что все кончилось.
	};
	AI_Output(self,other,"DIA_Randolph_HALLO_06_03");	//От чего я не отказался бы сейчас - так это от стаканчика хорошего вина в таверне.
};


instance DIA_RANDOLPH_BALTRAM(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_baltram_condition;
	information = dia_randolph_baltram_info;
	permanent = FALSE;
	description = "Меня прислал Бальтрам. Я должен забрать пакет для него.";
};


func int dia_randolph_baltram_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING) && Npc_IsDead(akil) && Npc_IsDead(kati) && (LIEFERUNG_GEHOLT == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_baltram_info()
{
	AI_Output(other,self,"DIA_Randolph_Baltram_15_00");	//Меня прислал Бальтрам. Я должен забрать пакет для него.
	AI_Output(self,other,"DIA_Randolph_Baltram_06_01");	//Хорошо. Я уже все приготовил. Вот твой пакет.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
};


instance DIA_RANDOLPH_GESCHICHTE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_geschichte_condition;
	information = dia_randolph_geschichte_info;
	permanent = FALSE;
	description = "Ты ведь нездешний, да?";
};


func int dia_randolph_geschichte_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_geschichte_info()
{
	AI_Output(other,self,"DIA_Randolph_Geschichte_15_00");	//Ты ведь нездешний, да?
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_01");	//Я пришел с южных островов. Когда-то ходили глашатаи и объявляли, что на Хоринисе нужны люди, чтобы добывать магическую руду.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_02");	//Но когда я приехал сюда, они возвели этот огромный барьер. И мне расхотелось идти туда. Поэтому я начал работать в порту.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_03");	//Затем сюда перестали заплывать корабли, и я пошел работать на Акила. У меня была работа и похуже, сейчас еще ничего.
};


instance DIA_RANDOLPH_TAVERNE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_taverne_condition;
	information = dia_randolph_taverne_info;
	description = "Ты бываешь в таверне?";
};


func int dia_randolph_taverne_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_taverne_info()
{
	AI_Output(other,self,"DIA_Randolph_TAVERNE_15_00");	//Ты бываешь в таверне?
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_01");	//Бывал.
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_02");	//Но больше я не могу позволить себе ходить туда.
};


instance DIA_RANDOLPH_WASISTINTAVERNE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 6;
	condition = dia_randolph_wasistintaverne_condition;
	information = dia_randolph_wasistintaverne_info;
	description = "А что там происходит, в таверне?";
};


func int dia_randolph_wasistintaverne_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_taverne) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_wasistintaverne_info()
{
	AI_Output(other,self,"DIA_Randolph_WASISTINTAVERNE_15_00");	//А что там происходит, в таверне?
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_01");	//Там проводят азартные игры.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_02");	//Двое состязаются друг с другом. Тот, кто может выпить больше пива - побеждает.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_03");	//В последнее время я только проигрывал, и теперь у меня совсем не осталось денег.
	Log_CreateTopic(TOPIC_WETTSAUFEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WETTSAUFEN,LOG_RUNNING);
	b_logentry(TOPIC_WETTSAUFEN,"В таверне можно заключить пари.");
};


instance DIA_RANDOLPH_GEGENWEN(C_INFO)
{
	npc = bau_942_randolph;
	nr = 7;
	condition = dia_randolph_gegenwen_condition;
	information = dia_randolph_gegenwen_info;
	description = "С кем ты соревновался?";
};


func int dia_randolph_gegenwen_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_wasistintaverne) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_gegenwen_info()
{
	AI_Output(other,self,"DIA_Randolph_GEGENWEN_15_00");	//С кем ты соревновался?
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_01");	//С Рухаром, этим старым бездельником. Он всегда побеждал меня.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_02");	//Но у меня есть подозрение, что эта грязная свинья все время подмешивала в мое пиво джин.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_03");	//Я думаю, он держит джин в своем чертовом сундуке. Вот подлец!
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_04");	//Кто-нибудь должен подменить джин в его сундуке на воду. Тогда он может подливать ее в мое пиво сколько хочет.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_05");	//Если бы только у меня были деньги, чтобы сразиться с ним еще раз.
	b_logentry(TOPIC_WETTSAUFEN,"Рендольф рассказал мне о Рухаре и состязании 'кто кого перепьет'. У Рендольфа недостаточно денег, чтобы заключить пари с Рухаром еще раз.");
	b_logentry(TOPIC_WETTSAUFEN,"Рендольф подозревает Рухара в жульничестве в состязании 'кто кого перепьет'. Рендольф хотел бы подменить бутылку джина в сундуке Рухара на бутылку с водой.");
};


instance DIA_RANDOLPH_WASBRAUCHSTDU(C_INFO)
{
	npc = bau_942_randolph;
	nr = 8;
	condition = dia_randolph_wasbrauchstdu_condition;
	information = dia_randolph_wasbrauchstdu_info;
	description = "Сколько денег тебе нужно для этого состязания?";
};


func int dia_randolph_wasbrauchstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_gegenwen) && (MIS_RUKHAR_WETTKAMPF == LOG_RUNNING) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_wasbrauchstdu_info()
{
	AI_Output(other,self,"DIA_Randolph_WASBRAUCHSTDU_15_00");	//Сколько денег тебе нужно для этого состязания?
	AI_Output(self,other,"DIA_Randolph_WASBRAUCHSTDU_06_01");	//10 золотых.
};


instance DIA_RANDOLPH_ICHGEBEDIRGELD(C_INFO)
{
	npc = bau_942_randolph;
	nr = 9;
	condition = dia_randolph_ichgebedirgeld_condition;
	information = dia_randolph_ichgebedirgeld_info;
	permanent = TRUE;
	description = "Я дам тебе деньги, чтобы ты сразился с Рухаром.";
};


var int dia_randolph_ichgebedirgeld_noperm;

func int dia_randolph_ichgebedirgeld_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_wasbrauchstdu) && (DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_ichgebedirgeld_info()
{
	AI_Output(other,self,"DIA_Randolph_ICHGEBEDIRGELD_15_00");	//Я дам тебе деньги, чтобы ты сразился с Рухаром.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_01");	//(восторженно) Правда? Огромное спасибо. Я скоро верну их тебе.
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_02");	//Если я смогу победить, я даже верну тебе их с процентами. Еще увидимся.
		b_logentry(TOPIC_WETTSAUFEN,"Пари заключено. Я должен наблюдать за ним.");
		b_giveplayerxp(XP_RANDOLPH_WETTKAMPFSTART);
		DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM = TRUE;
		b_npcclearobsessionbydmt(self);
		MIS_RUKHAR_WETTKAMPF_DAY = Wld_GetDay();
		Npc_ExchangeRoutine(self,"Wettkampf");
		b_startotherroutine(orlan,"Wettkampf");
		b_startotherroutine(rukhar,"Wettkampf");
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_03");	//Да ладно. У тебя даже этого-то нет.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_WETTKAMPFZUENDE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 10;
	condition = dia_randolph_wettkampfzuende_condition;
	information = dia_randolph_wettkampfzuende_info;
	permanent = TRUE;
	description = "Похмелье?";
};


func int dia_randolph_wettkampfzuende_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (KAPITEL < 4))
	{
		return TRUE;
	};
};


var int dia_randolph_wettkampfzuende_onetime;

func void dia_randolph_wettkampfzuende_info()
{
	AI_Output(other,self,"DIA_Randolph_WETTKAMPFZUENDE_15_00");	//Похмелье?
	if(RUKHAR_WON_WETTKAMPF == TRUE)
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_01");	//Да уж, врагу такого не пожелаешь. И я не могу избавиться от него. Я больше капли в рот не возьму, клянусь!
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_02");	//Твои деньги пропали. Извини.
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_03");	//Нет. Я чувствую себя отлично, правда.
		if(DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_04");	//Все, наконец, получилось. Спасибо еще раз за деньги. Вот, получи их назад.
			CreateInvItems(self,itmi_gold,20);
			b_giveinvitems(self,other,itmi_gold,12);
			DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME = TRUE;
		};
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_05");	//Похоже, Рухар не скоро еще оправится после этого.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_PERM(C_INFO)
{
	npc = bau_942_randolph;
	nr = 30;
	condition = dia_randolph_perm_condition;
	information = dia_randolph_perm_info;
	permanent = TRUE;
	description = "Ты в порядке?";
};


func int dia_randolph_perm_condition()
{
	if((KAPITEL >= 4) && (NPCOBSESSEDBYDMT_RANDOLPH == FALSE))
	{
		return TRUE;
	};
};


var int dia_randolph_perm_gotmoney;

func void dia_randolph_perm_info()
{
	if(hero.guild == GIL_KDF)
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_PERM_15_00");	//Ты в порядке?
		if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) && (MIS_HEALRANDOLPH != LOG_SUCCESS))
		{
			if((DIA_SAGITTA_HEALRANDOLPH_GOTONE == FALSE) && (DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == TRUE) && (DIA_RANDOLPH_PERM_GOTMONEY == FALSE))
			{
				AI_Output(other,self,"DIA_Randolph_PERM_15_01");	//Ты послал меня, не дав денег, и не предупредил, что это лекарство такое дорогое?!
				AI_Output(other,self,"DIA_Randolph_PERM_15_02");	//Сагитта хочет 300 золотых за него.
				AI_Output(self,other,"DIA_Randolph_PERM_06_03");	//Я могу дать тебе только 150 золотых. Пожалуйста. Ты должен помочь мне. Пожалуйста.
				CreateInvItems(self,itmi_gold,150);
				b_giveinvitems(self,other,itmi_gold,150);
				DIA_RANDOLPH_PERM_GOTMONEY = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Randolph_PERM_06_04");	//Мне плохо. Каждый раз, когда я перестаю пить, это похмелье убивает меня. Мне очень нужна помощь.
				AI_Output(self,other,"DIA_Randolph_PERM_06_05");	//Но есть лекарство, которое может помочь.
				AI_Output(self,other,"DIA_Randolph_PERM_06_06");	//Сагитта, ведьма-целительница, уже готовила его для меня. Но я не думаю, что теперь смогу добраться до нее сам. Там повсюду орки.
			};
			Log_CreateTopic(TOPIC_HEALRANDOLPH,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HEALRANDOLPH,LOG_RUNNING);
			b_logentry(TOPIC_HEALRANDOLPH,"Рендольф, похоже, решил бросить пить и послал меня к Саггите за лекарством от похмельного синдрома.");
			MIS_HEALRANDOLPH = LOG_RUNNING;
		}
		else
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_07");	//Я все еще чувствую слабость в ногах, но мне уже стало лучше.
		};
	};
};


instance DIA_RANDOLPH_HEILUNG(C_INFO)
{
	npc = bau_942_randolph;
	nr = 55;
	condition = dia_randolph_heilung_condition;
	information = dia_randolph_heilung_info;
	permanent = TRUE;
	description = "Спиртное ударило тебе в голову, ха?";
};


func int dia_randolph_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_RANDOLPH == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_randolph_heilung_info()
{
	AI_Output(other,self,"DIA_Randolph_Heilung_15_00");	//Спиртное ударило тебе в голову, ха?
	AI_Output(self,other,"DIA_Randolph_Heilung_06_01");	//Я больше капли в рот не возьму. Только ни в этой жизни. Ты можешь мне поверить, парень.
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_SAGITTAHEAL(C_INFO)
{
	npc = bau_942_randolph;
	nr = 56;
	condition = dia_randolph_sagittaheal_condition;
	information = dia_randolph_sagittaheal_info;
	description = "Держи. Это облегчит твое похмелье.";
};


func int dia_randolph_sagittaheal_condition()
{
	if((MIS_HEALRANDOLPH == LOG_RUNNING) && Npc_HasItems(other,itpo_healrandolph_mis))
	{
		return TRUE;
	};
};

func void dia_randolph_sagittaheal_info()
{
	AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_00");	//Держи. Это облегчит твое похмелье.
	b_giveinvitems(other,self,itpo_healrandolph_mis,1);
	if(Npc_IsInState(self,zs_pick_fp))
	{
		b_useitem(self,itpo_healrandolph_mis);
	};
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_01");	//Ох! Спасибо, друг. Теперь я смогу хотя бы поспать.
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_02");	//Чем я могу отплатить тебе за это?
	if(DIA_RANDOLPH_PERM_GOTMONEY == FALSE)
	{
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_03");	//Я думаю, эти несколько монет могут только помочь мне спасти лицо. Но боюсь, это все, что у меня есть.
		CreateInvItems(self,itmi_gold,150);
		b_giveinvitems(self,other,itmi_gold,150);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_04");	//Я заплатил за тебя кучу денег. Твои жалкие несколько монет никак не могут компенсировать мои затраты.
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_05");	//Ну, в таком случае мне повезло, что я встретил такого великодушного паладина, тебе так не кажется?
	};
	MIS_HEALRANDOLPH = LOG_SUCCESS;
	b_giveplayerxp(XP_HEALRANDOLPH);
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_PICKPOCKET(C_INFO)
{
	npc = bau_942_randolph;
	nr = 900;
	condition = dia_randolph_pickpocket_condition;
	information = dia_randolph_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_randolph_pickpocket_condition()
{
	return c_beklauen(58,2);
};

func void dia_randolph_pickpocket_info()
{
	Info_ClearChoices(dia_randolph_pickpocket);
	Info_AddChoice(dia_randolph_pickpocket,DIALOG_BACK,dia_randolph_pickpocket_back);
	Info_AddChoice(dia_randolph_pickpocket,DIALOG_PICKPOCKET,dia_randolph_pickpocket_doit);
};

func void dia_randolph_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_randolph_pickpocket);
};

func void dia_randolph_pickpocket_back()
{
	Info_ClearChoices(dia_randolph_pickpocket);
};

