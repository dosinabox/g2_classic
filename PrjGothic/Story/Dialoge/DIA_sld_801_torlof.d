
instance DIA_TORLOF_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_exit_condition;
	information = dia_torlof_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_torlof_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_HALLO(C_INFO)
{
	npc = sld_801_torlof;
	nr = 1;
	condition = dia_torlof_hallo_condition;
	information = dia_torlof_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_hallo_info()
{
	AI_Output(self,other,"DIA_Torlof_Hallo_01_00");	//(раздраженно) Чего тебе нужно от меня?
};


instance DIA_TORLOF_WANNAJOIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 2;
	condition = dia_torlof_wannajoin_condition;
	information = dia_torlof_wannajoin_info;
	permanent = FALSE;
	description = "Я хочу присоединиться к наемникам!";
};


func int dia_torlof_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_torlof_wannajoin_info()
{
	AI_Output(other,self,"DIA_Torlof_WannaJoin_15_00");	//Я хочу присоединиться к наемникам!
	AI_Output(self,other,"DIA_Torlof_WannaJoin_01_01");	//Ох? И с чего ты взял, что я поддержу тебя в этом начинании?
};


var int torlof_go;

instance DIA_TORLOF_PROBE(C_INFO)
{
	npc = sld_801_torlof;
	nr = 3;
	condition = dia_torlof_probe_condition;
	information = dia_torlof_probe_info;
	permanent = TRUE;
	description = "Испытай меня!";
};


func int dia_torlof_probe_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_wannajoin) && (hero.guild == GIL_NONE) && (TORLOF_GO == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_probe_info()
{
	AI_Output(other,self,"DIA_Torlof_Probe_15_00");	//Испытай меня!
	AI_Output(self,other,"DIA_Torlof_Probe_01_01");	//Тебя послал ко мне Ли?
	if(Npc_KnowsInfo(other,dia_lee_othersld))
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_02");	//Он сказал, ты поможешь мне.
		AI_Output(self,other,"DIA_Torlof_Probe_01_03");	//(вздыхает) Хорошо. Тогда слушай. Прежде чем присоединиться к нам, ты должен сделать две вещи.
		AI_Output(self,other,"DIA_Torlof_Probe_01_04");	//Во-первых, ты должен доказать, что способен решать задачи, которые входят в обязанности наемников. Я должен испытать тебя.
		AI_Output(self,other,"DIA_Torlof_Probe_01_05");	//И второе: ты должен заслужить уважение других наемников.
		TORLOF_GO = TRUE;
		Npc_ExchangeRoutine(self,"Start");
		Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
		b_logentry(TOPIC_BECOMESLD,"Чтобы быть принятым в ряды наемников, я должен пройти испытание Торлофа и заслужить уважение остальных наемников.");
	}
	else
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_06");	//Нет.
		AI_Output(self,other,"DIA_Torlof_Probe_01_07");	//Тогда с чего бы это я должен выслушивать твой бред?
		AI_StopProcessInfos(self);
	};
};


instance DIA_TORLOF_RESPEKT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 4;
	condition = dia_torlof_respekt_condition;
	information = dia_torlof_respekt_info;
	permanent = FALSE;
	description = "Как мне заслужить уважение других наемников? ";
};


func int dia_torlof_respekt_condition()
{
	if((TORLOF_GO == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_respekt_info()
{
	AI_Output(other,self,"DIA_Torlof_Respekt_15_00");	//Как мне заслужить уважение других наемников?
	AI_Output(self,other,"DIA_Torlof_Respekt_01_01");	//Для большинства будет достаточно, если ты выполнишь свои задания и пройдешь мое испытание.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_02");	//Но чтобы убедить остальных, тебе придется поискать другой подход.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_03");	//Некоторые попытаются извлечь выгоду из твоего положения, а другим может не понравиться твое лицо.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_04");	//Ты должен попытаться уговорить как можно больше наших парней - но если ничего не помогает, ты всегда можешь прибегнуть к дуэли.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_05");	//Если ты победишь, ты завоюешь уважение большинства из них. Но только смотри, не убей случайно кого-нибудь. Тогда у тебя будут очень большие проблемы.
	Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
	b_logentry(TOPIC_SLDRESPEKT,"Если я хочу, чтобы наемники уважали меня, я должен пройти испытание, приготовленное мне Торлофом. Также их можно убедить, победив в дуэли.");
};


instance DIA_TORLOF_DUELLREGELN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 5;
	condition = dia_torlof_duellregeln_condition;
	information = dia_torlof_duellregeln_info;
	permanent = FALSE;
	description = "Что за правила дуэлей?";
};


func int dia_torlof_duellregeln_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_respekt) || Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		return TRUE;
	};
};

func void dia_torlof_duellregeln_info()
{
	AI_Output(other,self,"DIA_Torlof_Duellregeln_15_00");	//Каковы правила дуэли?
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_01");	//Это довольно просто. Оба дуэлянта должны иметь возможность обнажить оружие до нанесения первого удара.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_02");	//Нельзя просто так взять и напасть на кого-нибудь без предупреждения.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_03");	//Обязательно должен иметь место устный вызов. Оскорбление, например, или еще какая-нибудь причина для сражения.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_04");	//Никто из наблюдателей не имеет права вмешиваться в дуэль. Если только один из дуэлянтов не будет убит.
	b_logentry(TOPIC_SLDRESPEKT,"Правила дуэли: Дуэль должна начаться с вызова, тогда в нее никто не имеет права вмешаться. Противника в дуэли нельзя убивать.");
};


instance DIA_TORLOF_DEINESTIMME(C_INFO)
{
	npc = sld_801_torlof;
	nr = 6;
	condition = dia_torlof_deinestimme_condition;
	information = dia_torlof_deinestimme_info;
	permanent = FALSE;
	description = "А как насчет тебя? Ты проголосуешь за меня?";
};


func int dia_torlof_deinestimme_condition()
{
	if((TORLOF_GO == TRUE) && (other.guild == GIL_NONE) && (MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_torlof_deinestimme_info()
{
	AI_Output(other,self,"DIA_Torlof_DeineStimme_15_00");	//А как насчет тебя? Ты проголосуешь за меня?
	AI_Output(self,other,"DIA_Torlof_DeineStimme_01_01");	//Если ты сможешь доказать, что можешь выполнять обязанности наемника, то да.
};


var int points_sld;

instance DIA_TORLOF_RUF(C_INFO)
{
	npc = sld_801_torlof;
	nr = 7;
	condition = dia_torlof_ruf_condition;
	information = dia_torlof_ruf_info;
	permanent = TRUE;
	description = "Как моя репутация среди наемников?";
};


func int dia_torlof_ruf_condition()
{
	if((TORLOF_GO == TRUE) && (TORLOF_GENUGSTIMMEN == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_ruf_info()
{
	AI_Output(other,self,"DIA_Torlof_RUF_15_00");	//Как моя репутация среди наемников?
	AI_Output(self,other,"DIA_Torlof_RUF_01_01");	//Так, посмотрим...
	POINTS_SLD = 0;
	if(Npc_IsDead(sld_wolf))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(sld_wolf.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_02");	//Вольф говорит, что ничего не имеет против тебя.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(Npc_IsDead(jarvis))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(MIS_JARVIS_SLDKO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_03");	//Джарвис полагает, что ты на правильной стороне.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(jarvis.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_04");	//Джарвис все еще не уверен, что ты на правильной стороне.
		AI_Output(self,other,"DIA_Torlof_RUF_01_05");	//Он не хочет, чтобы под дудку Сильвио плясало еще больше людей. Если тебе это интересно, в этом я с ним согласен.
	};
	if(Npc_IsDead(cord))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(CORD_APPROVED == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_06");	//Корд полагает, что ты достаточно хорош, чтобы присоединиться к нам.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cord.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_07");	//По мнению Корда, тебе нужно сначала научиться лучше владеть оружием.
	};
	if(Npc_IsDead(cipher))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if((MIS_CIPHER_PAKET == LOG_SUCCESS) || (MIS_CIPHER_BRINGWEED == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_08");	//Сифер говорит, что ему абсолютно ясно, что ты достоин присоединиться к нам. Похоже, что-то сделало его безгранично счастливым.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cipher.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_09");	//Сифер говорит, что за тобой должок, и что ты знаешь, о чем идет речь.
	};
	if(Npc_IsDead(rod))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(rod,itmw_2h_rod) == 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_10");	//Род просто хочет получить свой меч назад.
	}
	else if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (ROD_WETTEGEWONNEN == TRUE))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_11");	//Похоже, тебе удалось убедить Рода, что ты достаточно силен.
		if(rod.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			POINTS_SLD = POINTS_SLD + 1;
		};
	}
	else if(rod.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_12");	//Род считает тебя слабаком.
	};
	if(Npc_IsDead(sentenza))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(sentenza,itmi_gold) >= 50)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_13");	//Сентенза проголосует за тебя. Он говорит, что ты весьма рассудительный человек.
		POINTS_SLD = POINTS_SLD + 1;
		TORLOF_SENTENZACOUNTED = TRUE;
	}
	else if(sentenza.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_14");	//Сентенза не проголосует за тебя. Он говорит, что ты должен ему 50 золотых монет.
	};
	if(Npc_IsDead(raoul))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(raoul.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_15");	//Рауль против тебя. Мне кажется, он на дух тебя не выносит.
	};
	if(Npc_IsDead(bullco))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(bullco.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_16");	//О Сильвио и Булко даже говорить нечего. Эти два кретина всегда против всех и вся.
	};
	if(Npc_IsDead(buster))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(BUSTER_DUELL == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_17");	//Бастер говорит, что с тобой все в порядке.
		if(buster.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_18");	//Хотя ты и проиграл ему.
		};
	}
	else if(buster.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_19");	//Бастер говорит, что ты струсил, когда он вызвал тебя.
		AI_Output(self,other,"DIA_Torlof_RUF_01_20");	//Это не очень хорошо. Возможно, тебе стоит вернуться на аванпост и вызвать его.
	};
	if(Npc_IsDead(dar))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_21");	//Дар говорит, что ты трепач. Но к его голосу здесь не особенно прислушиваются.
	};
	if(POINTS_SLD > 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_22");	//Остальные наемники ничего не сказали.
	};
	if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_23");	//Большинство из них просто ждут, пройдешь ли ты испытание.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_24");	//Ты убедил большинство из них, пройдя испытание.
		if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_25");	//Хотя многие считают, что заставить фермера заплатить ренту было слишком легко, чтобы считать это испытанием.
			POINTS_SLD = POINTS_SLD + 3;
		}
		else
		{
			POINTS_SLD = POINTS_SLD + 5;
		};
		AI_Output(self,other,"DIA_Torlof_RUF_01_26");	//В любом случае, ты можешь рассчитывать на мой голос.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(SLD_DUELLE_GEWONNEN >= 3)
	{
		POINTS_SLD = POINTS_SLD + 1;
		if(POINTS_SLD >= 9)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_27");	//И ты победил в нескольких честных дуэлях.
			AI_Output(self,other,"DIA_Torlof_RUF_01_28");	//Многие наемники уважают это.
		}
		else
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_29");	//Как бы то ни было, ты уже победил в нескольких честных дуэлях.
		};
	};
	if(POINTS_SLD >= 9)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_30");	//Большинство наемников за тебя, и мы считаем, что ты можешь присоединиться к нам в любое время.
		AI_Output(self,other,"DIA_Torlof_RUF_01_31");	//Иди, поговори с Ли. Он объяснит тебе детали.
		TORLOF_GENUGSTIMMEN = TRUE;
		b_logentry(TOPIC_BECOMESLD,"Я заслужил уважение наемников. Теперь, я должен переговорить с Ли.");
	}
	else if(POINTS_SLD >= 7)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_32");	//Это довольно много, но пока еще не достаточно.
		AI_Output(self,other,"DIA_Torlof_RUF_01_33");	//Тебе нужно еще сразиться с несколькими парнями.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_34");	//Тебе еще далеко до всеобщего одобрения, парень. Если ты хочешь, чтобы мы приняли тебя в свои ряды, тебе нужно хорошо потрудиться.
	};
};


instance DIA_TORLOF_AUFGABEN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 8;
	condition = dia_torlof_aufgaben_condition;
	information = dia_torlof_aufgaben_info;
	permanent = FALSE;
	description = "А каковы обязанности наемника?";
};


func int dia_torlof_aufgaben_condition()
{
	if((TORLOF_GO == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_aufgaben_info()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_15_00");	//А каковы обязанности наемника?
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_01");	//Онар нанял нас по двум причинам: он хочет, чтобы мы сбросили с его шеи ополчение, и он хочет, чтобы мы поддерживали порядок на его фермах.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_02");	//Это включает сбор ренты, когда фермеры отказываются платить.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_03");	//Итак, что ты выбираешь?
	Info_ClearChoices(dia_torlof_aufgaben);
	Info_AddChoice(dia_torlof_aufgaben,"Я соберу ренту!",dia_torlof_aufgaben_pacht);
	Info_AddChoice(dia_torlof_aufgaben,"Я разберусь с ополчением, можешь забыть об этой проблеме!",dia_torlof_aufgaben_miliz);
};

func void b_torlof_holpachtvonsekob()
{
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_00");	//Хорошо. Слушай. Фермер Секоб не платит ренту Онару уже несколько недель.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_01");	//Онар хочет, чтобы тот выложил 50 золотых монет. Есть вопросы?
	AI_Output(other,self,"B_Torlof_HolPachtvonSekob_15_02");	//Где ферма Секоба?
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_03");	//На севере этой долины. Если смотреть отсюда, она будет справа от большого перекрестка.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_04");	//Если у тебя будут проблемы, фермеры на полях помогут тебе нейти дорогу.
	MIS_TORLOF_HOLPACHTVONSEKOB = LOG_RUNNING;
	sekob.flags = 0;
	CreateInvItems(sekob,itmi_gold,50);
	Log_CreateTopic(TOPIC_TORLOFPACHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFPACHT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFPACHT,"Торлоф попросил меня собрать ренту с фермера Секоба. Он должен заплатить 50 золотых монет.");
};

func void b_torlof_bengarmilizklatschen()
{
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_00");	//Фермер Бенгар недавно жаловался, что ополчение из города действует ему на нервы.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_01");	//Они давят на этого фермера - возможно, пытаются заставить его порвать отношения с Онаром.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_02");	//Я хочу, чтобы ты отправился на его ферму и дал понять этим ополченцам, что там им делать нечего! Есть вопросы?
	AI_Output(other,self,"B_Torlof_BengarMilizKlatschen_15_03");	//Как мне найти ферму Бенгара?
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_04");	//На юго-западе этой долины есть большая лестница, ведущая на плато в горах. На нем и находится ферма Бенгара.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_05");	//Если ты заблудишься, поспрашивай фермеров на полях, они покажут тебе дорогу.
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_RUNNING;
	bengar.flags = 0;
	Wld_InsertNpc(mil_335_rumbold,"FARM3");
	Wld_InsertNpc(mil_336_rick,"FARM3");
	b_initnpcglobals();
	Log_CreateTopic(TOPIC_TORLOFMILIZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFMILIZ,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFMILIZ,"Торлоф попросил изгнать ополчение с фермы Бенгара. Она находится на плоскогорье.");
};

func void dia_torlof_aufgaben_pacht()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Pacht_15_00");	//Я соберу ренту!
	b_torlof_holpachtvonsekob();
	TORLOF_PROBE = PROBE_SEKOB;
	Info_ClearChoices(dia_torlof_aufgaben);
};

func void dia_torlof_aufgaben_miliz()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Miliz_15_00");	//Я разберусь с ополчением, можешь забыть об этой проблеме!
	b_torlof_bengarmilizklatschen();
	TORLOF_PROBE = PROBE_BENGAR;
	Info_ClearChoices(dia_torlof_aufgaben);
};


var int torlof_theothermission_day;

func void b_torlof_theothermissionday()
{
	if(TORLOF_THEOTHERMISSION_DAY < (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_00");	//Ты потратил на это слишком много времени. Онар будет недоволен.
		TORLOF_THEOTHERMISSION_TOOLATE = TRUE;
		if(ENTEROW_KAPITEL2 == TRUE)
		{
			AI_Output(self,other,"DIA_Torlof_Add_01_00");	//И ему все равно, погибнут паладины в Долине Рудников или нет...
		};
	}
	else
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_01");	//Отлично! Когда у меня будет что-нибудь новенькое, я дам тебе знать.
	};
};


instance DIA_TORLOF_SEKOBSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 9;
	condition = dia_torlof_sekobsuccess_condition;
	information = dia_torlof_sekobsuccess_info;
	permanent = TRUE;
	description = "Я собрал ренту Секоба.";
};


func int dia_torlof_sekobsuccess_condition()
{
	if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_RUNNING)
	{
		if((sekob.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || Npc_IsDead(sekob))
		{
			return TRUE;
		};
	};
};

func void dia_torlof_sekobsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_00");	//Я собрал ренту Секоба.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_01");	//И? Он заплатил добровольно?
		if(Npc_IsDead(sekob))
		{
			AI_Output(other,self,"DIA_Torlof_SekobTot_15_00");	//Ну, с ним произошел несчастный случай...
		}
		else
		{
			AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_02");	//Мне пришлось убедить его.
		};
		if(TORLOF_PROBE == PROBE_SEKOB)
		{
			AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_03");	//Отлично! Ты прошел испытание. Это убедит большинство наемников, что ты достойный кандидат.
		}
		else
		{
			b_torlof_theothermissionday();
		};
		MIS_TORLOF_HOLPACHTVONSEKOB = LOG_SUCCESS;
		b_giveplayerxp(XP_TORLOF_SEKOBSKOHLEBEKOMMEN);
		b_logentry(TOPIC_BECOMESLD,"Я выполнил задачу, которую дал мне Торлоф.");
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_04");	//И? Ты что, промотал все деньги? Ты должен принести их мне! И побыстрее!
	};
};


instance DIA_TORLOF_BENGARSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 10;
	condition = dia_torlof_bengarsuccess_condition;
	information = dia_torlof_bengarsuccess_info;
	permanent = FALSE;
	description = "Я решил проблемы Бенгара с ополчением.";
};


func int dia_torlof_bengarsuccess_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_IsDead(rumbold) && Npc_IsDead(rick))
	{
		return TRUE;
	};
};

func void dia_torlof_bengarsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_00");	//Я решил проблемы Бенгара с ополчением.
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_01");	//Ты позаботился, чтобы они не появились у него на пороге завтра утром?
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_02");	//Чтобы сделать это, им придется очень хорошо постараться...
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_03");	//Отлично!
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_04");	//Ты прошел испытание. Ты смог разобраться с ополчением, этого достаточно, чтобы заслужить уважение большинства.
	}
	else
	{
		b_torlof_theothermissionday();
	};
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_SUCCESS;
	b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
	b_logentry(TOPIC_BECOMESLD,"Я выполнил задачу, которую дал мне Торлоф.");
};


instance DIA_TORLOF_WELCOME(C_INFO)
{
	npc = sld_801_torlof;
	nr = 11;
	condition = dia_torlof_welcome_condition;
	information = dia_torlof_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_welcome_condition()
{
	if((other.guild == GIL_SLD) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_welcome_info()
{
	AI_Output(self,other,"DIA_Torlof_Welcome_01_00");	//Добро пожаловать в ряды наемников, парень!
	AI_Output(other,self,"DIA_Torlof_Welcome_15_01");	//Спасибо!
	AI_Output(self,other,"DIA_Torlof_Welcome_01_02");	//Как только у меня будет работа для тебя, я дам тебе знать.
};


var int torlof_knowsdragons;

func void b_torlof_dragons()
{
	AI_Output(self,other,"DIA_Torlof_Add_01_01");	//Где ты был?
	AI_Output(other,self,"DIA_Torlof_Add_15_02");	//Я был в Долине Рудников! Там драконы! И паладинам приходится несладко!
	AI_Output(self,other,"DIA_Torlof_Add_01_03");	//Да? Похоже, во всех этих историях действительно есть доля правды!
	AI_Output(self,other,"DIA_Torlof_Add_01_04");	//Ли это будет интересно...
	TORLOF_KNOWSDRAGONS = TRUE;
};


instance DIA_TORLOF_THEOTHERMISSION(C_INFO)
{
	npc = sld_801_torlof;
	nr = 11;
	condition = dia_torlof_theothermission_condition;
	information = dia_torlof_theothermission_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_theothermission_condition()
{
	if((other.guild == GIL_SLD) && (KAPITEL >= 2))
	{
		return TRUE;
	};
};

func void dia_torlof_theothermission_info()
{
	if((TORLOF_KNOWSDRAGONS == FALSE) && (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE))
	{
		b_torlof_dragons();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_00");	//Хорошо, что ты здесь. У меня есть для тебя работа...
	AI_Output(other,self,"DIA_Torlof_TheOtherMission_15_01");	//Что такое?
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		b_torlof_holpachtvonsekob();
	}
	else
	{
		b_torlof_bengarmilizklatschen();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_02");	//И ты должен покончить с этим до завтрашнего утра!
	TORLOF_THEOTHERMISSION_DAY = Wld_GetDay();
};


instance DIA_TORLOF_DRAGONS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 12;
	condition = dia_torlof_dragons_condition;
	information = dia_torlof_dragons_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_dragons_condition()
{
	if((ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE) && (KAPITEL <= 3) && (other.guild == GIL_SLD) && (TORLOF_KNOWSDRAGONS == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_dragons_info()
{
	b_torlof_dragons();
};


instance DIA_TORLOF_WHATCANYOUTEACH(C_INFO)
{
	npc = sld_801_torlof;
	nr = 140;
	condition = dia_torlof_whatcanyouteach_condition;
	information = dia_torlof_whatcanyouteach_info;
	permanent = FALSE;
	description = "Ты можешь помочь мне улучшить мои способности?";
};


func int dia_torlof_whatcanyouteach_condition()
{
	return TRUE;
};

func void dia_torlof_whatcanyouteach_info()
{
	AI_Output(other,self,"DIA_Torlof_WhatCanYouTeach_15_00");	//Ты можешь помочь мне улучшить мои способности?
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_01");	//Я мог бы показать тебе, как лучше использовать силу в ближнем бою.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_02");	//Многие бойцы проигрывают из-за того, что не умеют правильно применять свою силу.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_03");	//То же самое касается ловкости и дальнобойного оружия.
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"Торлоф может повысить мою ловкость и силу.");
};


var int torlof_merke_str;
var int torlof_merke_dex;

instance DIA_TORLOF_TEACH(C_INFO)
{
	npc = sld_801_torlof;
	nr = 150;
	condition = dia_torlof_teach_condition;
	information = dia_torlof_teach_info;
	permanent = TRUE;
	description = "Я хочу улучшить свои способности!";
};


func int dia_torlof_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_whatcanyouteach))
	{
		return TRUE;
	};
};

func void dia_torlof_teach_info()
{
	AI_Output(other,self,"DIA_Torlof_Teach_15_00");	//Я хочу улучшить свои способности!
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE))
	{
		TORLOF_MERKE_STR = other.attribute[ATR_STRENGTH];
		TORLOF_MERKE_DEX = other.attribute[ATR_DEXTERITY];
		Info_ClearChoices(dia_torlof_teach);
		Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_Teach_01_01");	//Я сказал, что я МОГ БЫ помочь тебе, но это не значит, что я БУДУ помогать.
		AI_Output(self,other,"DIA_Torlof_Teach_01_02");	//Пока ты не станешь одним из нас, тебе лучше поискать другого учителя!
	};
};

func void dia_torlof_teach_back()
{
	if((TORLOF_MERKE_STR < other.attribute[ATR_STRENGTH]) || (TORLOF_MERKE_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other,"DIA_Torlof_Teach_Back_01_00");	//Хорошо! Теперь ты можешь более эффективно использовать свои способности!
	};
	Info_ClearChoices(dia_torlof_teach);
};

func void dia_torlof_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,90);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,90);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,90);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,90);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};


instance DIA_TORLOF_KAP3_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap3_exit_condition;
	information = dia_torlof_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_torlof_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_DEMENTOREN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 30;
	condition = dia_torlof_dementoren_condition;
	information = dia_torlof_dementoren_info;
	description = "У тебя есть какая-нибудь работа для меня?";
};


func int dia_torlof_dementoren_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_torlof_dementoren_info()
{
	AI_Output(other,self,"DIA_Torlof_DEMENTOREN_15_00");	//У тебя есть какая-нибудь работа для меня?
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_01");	//Ты видел этих парней, одетых в черные рясы, которые ошиваются здесь? Меня от них в дрожь бросает, если честно.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_02");	//Когда я ходил по морю, я видел много странных вещей, но эти парни по-настоящему испугали меня.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_03");	//Они пришли со стороны лагеря бандитов, который находится в горах, в южной части этой долины.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_04");	//Возможно, тебе стоит сходить туда и разобраться с этими парнями!
	Wld_InsertNpc(castleminedmt,"FP_STAND_DEMENTOR_KDF_12");
	Log_CreateTopic(TOPIC_TORLOF_DMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOF_DMT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOF_DMT,"В южной части долины, в горах, в бандитском лагере, похоже, появились эти люди в черных рясах. От них у Торлофа изжога. Я должен решить эту проблему для него.");
	MIS_TORLOF_DMT = LOG_RUNNING;
};


instance DIA_TORLOF_DMTSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 30;
	condition = dia_torlof_dmtsuccess_condition;
	information = dia_torlof_dmtsuccess_info;
	description = "Люди с гор в черных рясах больше не будут беспокоить нас.";
};


func int dia_torlof_dmtsuccess_condition()
{
	if((MIS_TORLOF_DMT == LOG_RUNNING) && Npc_IsDead(castleminedmt))
	{
		return TRUE;
	};
};

func void dia_torlof_dmtsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_DmtSuccess_15_00");	//Люди с гор в черных рясах больше не будут беспокоить нас.
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_01");	//Ты смог разобраться с ними? Отлично!
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_02");	//Я сразу не доверял этим парням. За версту было видно, что от них будут одни неприятности...
	MIS_TORLOF_DMT = LOG_SUCCESS;
	b_giveplayerxp(XP_TORLOF_DMT);
};


instance DIA_TORLOF_KAP4_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap4_exit_condition;
	information = dia_torlof_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_torlof_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_WOISTSYLVIO(C_INFO)
{
	npc = sld_801_torlof;
	nr = 40;
	condition = dia_torlof_woistsylvio_condition;
	information = dia_torlof_woistsylvio_info;
	description = "Что, часть наемников ушла отсюда?";
};


func int dia_torlof_woistsylvio_condition()
{
	if((MIS_READYFORCHAPTER4 == TRUE) || (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_torlof_woistsylvio_info()
{
	AI_Output(other,self,"DIA_Torlof_WOISTSYLVIO_15_00");	//Что, часть наемников ушла отсюда?
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_01");	//Сильвио забрал нескольких парней и ушел через проход.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_02");	//Поговаривают, что там появились драконы. Когда он это услышал, его было не остановить.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_03");	//Кто знает? Сокровища драконов наверняка можно очень дорого продать.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_04");	//Но меня это не касается. Я моряк. Я принадлежу морю, и мне нет дела до душного логова дракона.
};


instance DIA_TORLOF_KAP5_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap5_exit_condition;
	information = dia_torlof_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_torlof_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_BEMYCAPTAIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 51;
	condition = dia_torlof_bemycaptain_condition;
	information = dia_torlof_bemycaptain_info;
	description = "Ты моряк?";
};


func int dia_torlof_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_00");	//Ты моряк?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_01");	//Ты что, только узнал об этом? Да, черт побери, я моряк. А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_02");	//Я мог бы найти применение твоим талантам. Мне нужно добраться до острова.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_03");	//(смеется) До острова? Да у тебя даже нет корабля, не говоря уже о команде.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_04");	//Нет, мой мальчик. Если ты хочешь воспользоваться моими услугами в качестве капитана и учителя силы, ты должен сначала доказать мне, что ты понимаешь, о чем говоришь.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_05");	//Кроме того, у меня хватает и других проблем. Паладины не ушли из города, как я ожидал.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_06");	//Должно произойти что-то очень серьезное, чтобы они убрались оттуда.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_07");	//Направляйся в замок в Долине Рудников. Укради у стражника ключ от главных ворот и открой их. А орки позаботятся об остальном!
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Прежде чем Торлоф согласится занять пост капитана, я должен заставить паладинов покинуть город. Он говорит, что нужно устроить инцидент в замке в Долине рудников. Он хочет, чтобы я украл ключ от главных ворот у стражника и впустил орков в замок. Он надеется, что это заставит паладинов покинуть город, чтобы помочь своим товарищам.");
};


instance DIA_TORLOF_BEMYCAPTAIN2(C_INFO)
{
	npc = sld_801_torlof;
	nr = 52;
	condition = dia_torlof_bemycaptain2_condition;
	information = dia_torlof_bemycaptain2_info;
	description = "Ворота замка в Долине Рудников открыты...";
};


func int dia_torlof_bemycaptain2_condition()
{
	if((MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_torlof_bemycaptain))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain2_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_00");	//Ворота замка в Долине Рудников открыты, и их заклинило. Теперь ничто не сдерживает орков, и они берут этот замок приступом.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_01");	//Паладины в замке несут тяжелые потери.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_02");	//И, я думаю, не пройдет много времени, когда паладины из города выступят в Долину Рудников, чтобы выручить парней, осажденных в замке.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN2_01_03");	//Это хорошие новости. Теперь ничто не мешает мне покинуть это богом проклятое место.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_TORLOF_BEMYCAPTAIN3(C_INFO)
{
	npc = sld_801_torlof;
	nr = 53;
	condition = dia_torlof_bemycaptain3_condition;
	information = dia_torlof_bemycaptain3_info;
	permanent = TRUE;
	description = "Теперь ты поможешь мне добраться до острова?";
};


var int torlof_paidtobecaptain;

func int dia_torlof_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_bemycaptain2) && (TORLOF_PAIDTOBECAPTAIN == FALSE) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_15_00");	//Теперь ты поможешь мне добраться до острова?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_01");	//Ох, да. Ты хотел добраться до острова. Ммм. Вот мои условия.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_02");	//Ты заплатишь мне 2500 золотом, и я готов стать капитаном твоего корабля.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_03");	//А также я готов повышать твою силу и ловкость, когда ты только этого захочешь.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	Info_AddChoice(dia_torlof_bemycaptain3,"Это чертовски большая сумма.",dia_torlof_bemycaptain3_zuviel);
	Info_AddChoice(dia_torlof_bemycaptain3,"Хорошо. Вот твое золото.",dia_torlof_bemycaptain3_ok);
};

func void dia_torlof_bemycaptain3_zuviel()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00");	//Это чертовски большая сумма.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01");	//Да. Помощь профессионала стоит дорого. Но у тебя нет другого выбора. Тебе не найти другого капитана для своего корабля.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02");	//Так что плати денежки и не создавай проблем.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	b_logentry(TOPIC_CAPTAIN,"Торлоф теперь готов командовать кораблем. Правда, он хочет получить за эту работу 2500 золотых монет.");
};

func void dia_torlof_bemycaptain3_ok()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_ok_15_00");	//Хорошо. Вот твое золото.
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_01");	//Превосходно. Теперь тебе остается только рассказать подробно, что я должен делать.
		TORLOF_PAIDTOBECAPTAIN = TRUE;
		b_logentry(TOPIC_CAPTAIN,"После того, как Торлоф получил 2500 золотых монет, он, наконец, готов идти со мной.");
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_02");	//Ты пытаешься надуть меня? Сначала добудь деньги. Тогда и поговорим.
	};
	Info_ClearChoices(dia_torlof_bemycaptain3);
};


instance DIA_TORLOF_BEMYCAPTAIN4(C_INFO)
{
	npc = sld_801_torlof;
	nr = 54;
	condition = dia_torlof_bemycaptain4_condition;
	information = dia_torlof_bemycaptain4_info;
	permanent = TRUE;
	description = "Будь моим капитаном.";
};


func int dia_torlof_bemycaptain4_condition()
{
	if((SCGOTCAPTAIN == FALSE) && (TORLOF_PAIDTOBECAPTAIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain4_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_00");	//Будь моим капитаном.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_01");	//Хорошо. Дай мне корабль и крепкую команду, и я доставлю тебя на этот проклятый остров.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_02");	//У тебя есть морская карта? Без нее мы далеко не уплывем.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_03");	//Я позабочусь обо всем. Увидимся в порту.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_04");	//Мне не терпится увидеть, как это все у тебя получится.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	TORLOFISCAPTAIN = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_TORLOF_LOSFAHREN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 59;
	condition = dia_torlof_losfahren_condition;
	information = dia_torlof_losfahren_info;
	permanent = TRUE;
	description = "Мы отправляемся к острову.";
};


func int dia_torlof_losfahren_condition()
{
	if((TORLOFISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_losfahren_info()
{
	AI_Output(other,self,"DIA_Torlof_LOSFAHREN_15_00");	//Мы отправляемся к острову.
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_01");	//Хорошо. Дай мне морскую карту, и мы поднимаем паруса.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_02");	//(кричит) Поднять паруса!
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_03");	//Проверь, успел ли ты взять все необходимое. Возврата не будет.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_04");	//Если ты во всем уверен, иди, вздремни в капитанской каюте. Это путешествие будет долгим.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_05");	//Без корабля, команды и морской карты никакого путешествия не будет, приятель.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_06");	//Мне нужно, по крайней мере, 5 человек, готовых встать под мое начало.
		AI_StopProcessInfos(self);
	};
};


instance DIA_TORLOF_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 59;
	condition = dia_torlof_perm5_notcaptain_condition;
	information = dia_torlof_perm5_notcaptain_info;
	permanent = TRUE;
	description = "Я решил взять другого капитана.";
};


func int dia_torlof_perm5_notcaptain_condition()
{
	if((SCGOTCAPTAIN == TRUE) && (TORLOFISCAPTAIN == FALSE) && (TORLOF_PAIDTOBECAPTAIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Torlof_PERM5_NOTCAPTAIN_15_00");	//Я решил взять другого капитана. Верни мне мои деньги.
	AI_Output(self,other,"DIA_Torlof_PERM5_NOTCAPTAIN_01_01");	//Черта с два! Если ты заплатил мне вперед, а затем отказался от моих услуг, это твои проблемы.
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_KAP6_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap6_exit_condition;
	information = dia_torlof_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_torlof_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_PICKPOCKET(C_INFO)
{
	npc = sld_801_torlof;
	nr = 900;
	condition = dia_torlof_pickpocket_condition;
	information = dia_torlof_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_torlof_pickpocket_condition()
{
	return c_beklauen(76,120);
};

func void dia_torlof_pickpocket_info()
{
	Info_ClearChoices(dia_torlof_pickpocket);
	Info_AddChoice(dia_torlof_pickpocket,DIALOG_BACK,dia_torlof_pickpocket_back);
	Info_AddChoice(dia_torlof_pickpocket,DIALOG_PICKPOCKET,dia_torlof_pickpocket_doit);
};

func void dia_torlof_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_torlof_pickpocket);
};

func void dia_torlof_pickpocket_back()
{
	Info_ClearChoices(dia_torlof_pickpocket);
};

