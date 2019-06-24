
instance DIA_RAOUL_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_exit_condition;
	information = dia_raoul_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_raoul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_NOSENTENZA(C_INFO)
{
	npc = sld_822_raoul;
	nr = 1;
	condition = dia_raoul_nosentenza_condition;
	information = dia_raoul_nosentenza_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_raoul_nosentenza_condition()
{
	if(!Npc_KnowsInfo(other,dia_sentenza_hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_raoul_nosentenza_info()
{
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_00");	//Минутку, приятель!
	AI_Output(self,other,"DIA_Raoul_NoSentenza_01_01");	//Я не видел, чтобы Сентенза обыскивал тебя.
	if(Hlp_IsValidNpc(sentenza) && !c_npcisdown(sentenza))
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_02");	//СЕНТЕНЗА! Иди сюда!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_03");	//(фальшиво вежливо) Подожди секундочку, сейчас он подойдет!
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_04");	//И тогда тебя ждет неприятный сюрприз!
		b_attack(sentenza,other,AR_NONE,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_NoSentenza_01_05");	//Где же он? А, ладно, не важно, тебе повезло...
	};
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_HELLO(C_INFO)
{
	npc = sld_822_raoul;
	nr = 1;
	condition = dia_raoul_hello_condition;
	information = dia_raoul_hello_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_raoul_hello_condition()
{
	if((other.guild == GIL_NONE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_raoul_hello_info()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_00");	//(скучающе) Чего тебе нужно?
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_Hello_01_01");	//(раздраженно) Что тебе нужно на этот раз?
	};
};


var int raoul_gesagt;

instance DIA_RAOUL_PERMNONE(C_INFO)
{
	npc = sld_822_raoul;
	nr = 1;
	condition = dia_raoul_permnone_condition;
	information = dia_raoul_permnone_info;
	permanent = TRUE;
	description = "Я хочу осмотреться на этой ферме!";
};


func int dia_raoul_permnone_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_permnone_info()
{
	if(RAOUL_GESAGT == FALSE)
	{
		AI_Output(other,self,"DIA_Raoul_PERMNone_15_00");	//Я хочу осмотреться на этой ферме!
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_01");	//Не заходи в здание слева. Там Сильвио. Он сейчас не в самом лучшем расположении духа.
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_02");	//Если он увидит слабака, не работающего на этой ферме, он может решить выместить на нем свою злобу.
		RAOUL_GESAGT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERMNone_01_03");	//Удачи!
		AI_StopProcessInfos(self);
	};
};


instance DIA_RAOUL_WANNAJOIN(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_wannajoin_condition;
	information = dia_raoul_wannajoin_info;
	permanent = FALSE;
	description = "Я хочу присоединиться к Ли!";
};


func int dia_raoul_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_wannajoin_info()
{
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_00");	//Я хочу присоединиться к Ли!
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_01");	//Если Ли будет продолжать в том же духе, ему скоро некем будет командовать!
	AI_Output(other,self,"DIA_Raoul_WannaJoin_15_02");	//Что ты хочешь этим сказать?
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_03");	//Он хочет, чтобы мы сидели здесь и били баклуши. Иногда приходится задавать взбучку фермерам - и это все.
	AI_Output(self,other,"DIA_Raoul_WannaJoin_01_04");	//Сильвио всегда говорил, что нападение - это лучшая оборона, и, черт возьми, он прав.
};


instance DIA_RAOUL_ABOUTSYLVIO(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_aboutsylvio_condition;
	information = dia_raoul_aboutsylvio_info;
	permanent = FALSE;
	description = "Кто такой Сильвио?";
};


func int dia_raoul_aboutsylvio_condition()
{
	if((RAOUL_GESAGT == TRUE) || Npc_KnowsInfo(other,dia_raoul_wannajoin))
	{
		return TRUE;
	};
};

func void dia_raoul_aboutsylvio_info()
{
	AI_Output(other,self,"DIA_Raoul_AboutSylvio_15_00");	//Кто такой Сильвио?
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_01");	//Наш следующий предводитель, если тебе интересно мое мнение. Если ты собираешься просить его, чтобы он позволил тебе присоединиться к нашим рядам, забудь об этом!
	AI_Output(self,other,"DIA_Raoul_AboutSylvio_01_02");	//Судя по твоему виду, ты не подходишь даже для того, чтобы пасти овец.
};


instance DIA_RAOUL_STIMME(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_stimme_condition;
	information = dia_raoul_stimme_info;
	permanent = FALSE;
	description = "Я бы хотел стать наемником. Ты не возражаешь?";
};


func int dia_raoul_stimme_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_raoul_stimme_info()
{
	AI_Output(other,self,"DIA_Raoul_Stimme_15_00");	//Я бы хотел стать наемником. Ты не возражаешь?
	AI_Output(self,other,"DIA_Raoul_Stimme_01_01");	//Ааа, делай, что хочешь...
	Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
	b_logentry(TOPIC_SLDRESPEKT,"Рауль не возражает против моего вступления в ряды наемников.");
};


instance DIA_RAOUL_DUELL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_duell_condition;
	information = dia_raoul_duell_info;
	permanent = TRUE;
	description = "Я думаю, тебе стоит дать по морде...";
};


func int dia_raoul_duell_condition()
{
	if((RAOUL_GESAGT == TRUE) || Npc_KnowsInfo(other,dia_raoul_aboutsylvio) || Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		return TRUE;
	};
};

func void dia_raoul_duell_info()
{
	AI_Output(other,self,"DIA_Raoul_Duell_15_00");	//Я думаю, тебе стоит дать по морде...
	AI_Output(self,other,"DIA_Raoul_Duell_01_01");	//Что?
	AI_Output(other,self,"DIA_Raoul_Duell_15_02");	//Это именно то, что тебе сейчас нужно...
	AI_Output(self,other,"DIA_Raoul_Duell_01_03");	//По-моему, я был с тобой слишком вежлив!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_RAOUL_PERM(C_INFO)
{
	npc = sld_822_raoul;
	nr = 900;
	condition = dia_raoul_perm_condition;
	information = dia_raoul_perm_info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int dia_raoul_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_perm_info()
{
	AI_Output(other,self,"DIA_Raoul_PERM_15_00");	//Все в порядке?
	if(MIS_RAOUL_KILLTROLLBLACK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_01");	//Не болтай попусту. Или и принеси шкуру черного тролля.
	}
	else
	{
		AI_Output(self,other,"DIA_Raoul_PERM_01_02");	//Ты пытаешься подлизаться ко мне? Забудь об этом!
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Raoul_PERM_01_03");	//Я не забыл, что ты сделал со мной.
		};
	};
};


instance DIA_RAOUL_TROLL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_troll_condition;
	information = dia_raoul_troll_info;
	important = TRUE;
};


func int dia_raoul_troll_condition()
{
	if(hero.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_raoul_troll_info()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_01_00");	//(цинично) Только посмотрите на это!
	AI_Output(other,self,"DIA_Raoul_TROLL_15_01");	//Чего тебе нужно?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_02");	//Ты присоединился к городским нищим? Похоже на то.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_03");	//Не думай, что я стану уважать тебя только за то, что ты стал одним из нас.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Raoul_TROLL_01_04");	//Разыгрываешь из себя великого мага, ха?
	};
	AI_Output(self,other,"DIA_Raoul_TROLL_01_05");	//Я скажу тебе одну вещь. Не важно, что ты носишь, я вижу тебя насквозь.
	AI_Output(self,other,"DIA_Raoul_TROLL_01_06");	//По мне, так ты просто скользкий маленький бездельник и ничего больше.
	Info_ClearChoices(dia_raoul_troll);
	Info_AddChoice(dia_raoul_troll,"Я должен идти.",dia_raoul_troll_weg);
	Info_AddChoice(dia_raoul_troll,"В чем твоя проблема?",dia_raoul_troll_rechnung);
};

func void dia_raoul_troll_weg()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_weg_15_00");	//Я должен идти.
	AI_Output(self,other,"DIA_Raoul_TROLL_weg_01_01");	//Да, проваливай.
	AI_StopProcessInfos(self);
};

func void dia_raoul_troll_rechnung()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_00");	//В чем твоя проблема?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_01");	//Я вижу таких людей, как ты, насквозь. Способны только на слова, а когда доходит до дела - в кусты.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_02");	//Я ненавижу тех, кто одевается как вельможа и повсюду хвастает своими героическими делами.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_03");	//Не далее как вчера я набил морду одному такому. Он утверждал, что может завалить черного тролля одной левой.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_15_04");	//И что?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_05");	//(язвительно) Что ты хочешь сказать этим 'и что'?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_06");	//Ты хоть раз в своей жизни видел черного тролля, болтун? Ты хотя бы представляешь себе, насколько велики эти монстры?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_01_07");	//Если ты подойдешь к ним слишком близко, они разорвут тебя на куски.
	Info_ClearChoices(dia_raoul_troll);
	Info_AddChoice(dia_raoul_troll,"Мне это не интересно.",dia_raoul_troll_rechnung_hastrecht);
	if(Npc_IsDead(troll_black))
	{
		Info_AddChoice(dia_raoul_troll,"Я уже убил черного тролля.",dia_raoul_troll_rechnung_ich);
	}
	else
	{
		Info_AddChoice(dia_raoul_troll,"Черного тролля? Нет проблем.",dia_raoul_troll_rechnung_noprob);
	};
};

func void b_raoul_blame()
{
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_00");	//Ты напрашиваешься, да? Я должен был уже оторвать тебе голову. Но у меня есть идея получше.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_01");	//Если ты такой великий боец, докажи это.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_02");	//А что мне с этого будет?
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_03");	//Глупый вопрос. Почет, и твоя челюсть останется не сломанной.
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_04");	//Не так уж много.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_05");	//Ммм. Скажем, я заплачу тебе целую кучу денег, если ты принесешь мне шкуру черного тролля. Как тебе?
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_15_06");	//Уже лучше.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_B_Raoul_Blame_01_07");	//Тогда чего ты ждешь?
	Log_CreateTopic(TOPIC_KILLTROLLBLACK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLTROLLBLACK,LOG_RUNNING);
	b_logentry(TOPIC_KILLTROLLBLACK,"Рауль чтобы я принес ему шкуру черного тролля.");
	MIS_RAOUL_KILLTROLLBLACK = LOG_RUNNING;
	Info_ClearChoices(dia_raoul_troll);
};

func void dia_raoul_troll_rechnung_hastrecht()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_hastrecht_15_00");	//Мне это не интересно.
	AI_Output(self,other,"DIA_Raoul_TROLL_rechnung_hastrecht_01_01");	//Ну, как знаешь.
	Info_ClearChoices(dia_raoul_troll);
};

func void dia_raoul_troll_rechnung_ich()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_ich_15_00");	//Я уже убил черного тролля.
	b_raoul_blame();
};

func void dia_raoul_troll_rechnung_noprob()
{
	AI_Output(other,self,"DIA_Raoul_TROLL_rechnung_noProb_15_00");	//Черного тролля? Нет проблем.
	b_raoul_blame();
};


instance DIA_RAOUL_TROPHYFUR(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_trophyfur_condition;
	information = dia_raoul_trophyfur_info;
	permanent = TRUE;
	description = "Сначала скажи мне, как снять шкуру с черного тролля.";
};


func int dia_raoul_trophyfur_condition()
{
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) && (MIS_RAOUL_KILLTROLLBLACK == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_raoul_trophyfur_info()
{
	AI_Output(other,self,"DIA_Raoul_TrophyFur_15_00");	//Сначала скажи мне, как снять шкуру с черного тролля.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_01");	//Тогда прочисть свои уши. Этот совет бесплатный.
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_02");	//Ты хватаешь этого зверя и делаешь надрез на каждой из его лап.
		AI_Output(self,other,"DIA_Raoul_TrophyFur_01_03");	//Затем снимаешь с него шкуру через голову. Разве это так сложно?
	};
};


instance DIA_RAOUL_TROLLFELL(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_trollfell_condition;
	information = dia_raoul_trollfell_info;
	description = "Я принес шкуру черного тролля.";
};


func int dia_raoul_trollfell_condition()
{
	if(Npc_HasItems(other,itat_trollblackfur) && Npc_KnowsInfo(other,dia_raoul_troll))
	{
		return TRUE;
	};
};

func void dia_raoul_trollfell_info()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_00");	//Я принес шкуру черного тролля.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_01");	//Невероятно. Покажи.
	b_giveinvitems(other,self,itat_trollblackfur,1);
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_02");	//Невероятно. Что ты хочешь за нее?
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_15_03");	//Отдай мне все, что у тебя есть.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_01_04");	//Хорошо. Я дам тебе 500 золотых монет и три сильных лечебных зелья. Что скажешь?
	Info_ClearChoices(dia_raoul_trollfell);
	Info_AddChoice(dia_raoul_trollfell,"Этого недостаточно.",dia_raoul_trollfell_nein);
	Info_AddChoice(dia_raoul_trollfell,"Готово.",dia_raoul_trollfell_ja);
	MIS_RAOUL_KILLTROLLBLACK = LOG_SUCCESS;
	b_giveplayerxp(XP_RAOUL_KILLTROLLBLACK);
};

func void dia_raoul_trollfell_ja()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_ja_15_00");	//Продано.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_ja_01_01");	//Отличная сделка.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	CreateInvItems(self,itmi_gold,500);
	b_giveinvitems(self,other,itmi_gold,500);
	Info_ClearChoices(dia_raoul_trollfell);
};

func void dia_raoul_trollfell_nein()
{
	AI_Output(other,self,"DIA_Raoul_TROLLFELL_nein_15_00");	//Этого недостаточно.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_01");	//Как знаешь. Я все равно заберу эту шкуру.
	AI_Output(self,other,"DIA_Raoul_TROLLFELL_nein_01_02");	//Я не прощу себе, если упущу такую возможность.
	MIS_RAOUL_DOESNTPAYTROLLFUR = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_FELLZURUECK(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_fellzurueck_condition;
	information = dia_raoul_fellzurueck_info;
	permanent = TRUE;
	description = "Верни мне мою шкуру черного тролля.";
};


func int dia_raoul_fellzurueck_condition()
{
	if((MIS_RAOUL_DOESNTPAYTROLLFUR == LOG_RUNNING) && Npc_HasItems(self,itat_trollblackfur))
	{
		return TRUE;
	};
};

func void dia_raoul_fellzurueck_info()
{
	AI_Output(other,self,"DIA_Raoul_FELLZURUECK_15_00");	//Верни мне мою шкуру черного тролля.
	AI_Output(self,other,"DIA_Raoul_FELLZURUECK_01_01");	//Нет.
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_GOTTROLLFURBACK(C_INFO)
{
	npc = sld_822_raoul;
	nr = 3;
	condition = dia_raoul_gottrollfurback_condition;
	information = dia_raoul_gottrollfurback_info;
	description = "Никогда больше не пытайся обмануть меня, понятно?";
};


func int dia_raoul_gottrollfurback_condition()
{
	if((MIS_RAOUL_DOESNTPAYTROLLFUR == LOG_RUNNING) && (Npc_HasItems(self,itat_trollblackfur) == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		return TRUE;
	};
};

func void dia_raoul_gottrollfurback_info()
{
	AI_Output(other,self,"DIA_Raoul_GotTrollFurBack_15_00");	//Никогда больше не пытайся обмануть меня, понятно?
	AI_Output(self,other,"DIA_Raoul_GotTrollFurBack_01_01");	//Хорошо. Ты знаешь здешние законы. Так что успокойся.
	MIS_RAOUL_DOESNTPAYTROLLFUR = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_KAP3_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap3_exit_condition;
	information = dia_raoul_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_raoul_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_KAP4_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap4_exit_condition;
	information = dia_raoul_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_raoul_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_KAP5_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap5_exit_condition;
	information = dia_raoul_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_raoul_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_SHIP(C_INFO)
{
	npc = sld_822_raoul;
	nr = 2;
	condition = dia_raoul_ship_condition;
	information = dia_raoul_ship_info;
	description = "Ты не отказался бы от океанского круиза?";
};


func int dia_raoul_ship_condition()
{
	if((KAPITEL >= 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_raoul_ship_info()
{
	AI_Output(other,self,"DIA_Raoul_Ship_15_00");	//Ты не отказался бы от океанского круиза?
	AI_Output(self,other,"DIA_Raoul_Ship_01_01");	//Что ты замышляешь? Ты хочешь захватить корабль паладинов? (смеется)
	AI_Output(other,self,"DIA_Raoul_Ship_15_02");	//А что если и так?
	AI_Output(self,other,"DIA_Raoul_Ship_01_03");	//(серьезно) У тебя совсем крыша поехала. Нет, спасибо. Это не для меня.
	AI_Output(self,other,"DIA_Raoul_Ship_01_04");	//Я не вижу причин покидать Хоринис. Мне все равно, где зарабатывать деньги, здесь или на материке.
	AI_Output(self,other,"DIA_Raoul_Ship_01_05");	//Найди кого-нибудь еще.
	if(Npc_IsDead(torlof) == FALSE)
	{
		AI_Output(self,other,"DIA_Raoul_Ship_01_06");	//Спроси Торлофа. Он ходил по морям, насколько я знаю.
	};
};


instance DIA_RAOUL_KAP6_EXIT(C_INFO)
{
	npc = sld_822_raoul;
	nr = 999;
	condition = dia_raoul_kap6_exit_condition;
	information = dia_raoul_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_raoul_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_raoul_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAOUL_PICKPOCKET(C_INFO)
{
	npc = sld_822_raoul;
	nr = 900;
	condition = dia_raoul_pickpocket_condition;
	information = dia_raoul_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_raoul_pickpocket_condition()
{
	return c_beklauen(45,85);
};

func void dia_raoul_pickpocket_info()
{
	Info_ClearChoices(dia_raoul_pickpocket);
	Info_AddChoice(dia_raoul_pickpocket,DIALOG_BACK,dia_raoul_pickpocket_back);
	Info_AddChoice(dia_raoul_pickpocket,DIALOG_PICKPOCKET,dia_raoul_pickpocket_doit);
};

func void dia_raoul_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_raoul_pickpocket);
};

func void dia_raoul_pickpocket_back()
{
	Info_ClearChoices(dia_raoul_pickpocket);
};

