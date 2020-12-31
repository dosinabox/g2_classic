
instance DIA_RENGARU_EXIT(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 999;
	condition = dia_rengaru_exit_condition;
	information = dia_rengaru_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rengaru_exit_condition()
{
	return TRUE;
};

func void dia_rengaru_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RENGARU_PICKPOCKET(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 900;
	condition = dia_rengaru_pickpocket_condition;
	information = dia_rengaru_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rengaru_pickpocket_condition()
{
	return c_beklauen(20,5);
};

func void dia_rengaru_pickpocket_info()
{
	Info_ClearChoices(dia_rengaru_pickpocket);
	Info_AddChoice(dia_rengaru_pickpocket,DIALOG_BACK,dia_rengaru_pickpocket_back);
	Info_AddChoice(dia_rengaru_pickpocket,DIALOG_PICKPOCKET,dia_rengaru_pickpocket_doit);
};

func void dia_rengaru_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rengaru_pickpocket);
};

func void dia_rengaru_pickpocket_back()
{
	Info_ClearChoices(dia_rengaru_pickpocket);
};


instance DIA_RENGARU_HAUAB(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_hauab_condition;
	information = dia_rengaru_hauab_info;
	permanent = TRUE;
	description = "Что ты делаешь здесь?";
};


func int dia_rengaru_hauab_condition()
{
	if((JORA_DIEB != LOG_RUNNING) && (Npc_KnowsInfo(other,dia_rengaru_gotyou) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rengaru_hauab_info()
{
	AI_Output(other,self,"DIA_Rengaru_Hauab_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Rengaru_Hauab_07_01");	//Я не понимаю, какое тебе до этого дело. Проваливай!
	AI_StopProcessInfos(self);
};


instance DIA_RENGARU_HALLODIEB(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_hallodieb_condition;
	information = dia_rengaru_hallodieb_info;
	permanent = FALSE;
	description = "Джора говорит, что ты украл у него деньги...";
};


func int dia_rengaru_hallodieb_condition()
{
	if(JORA_DIEB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_rengaru_hallodieb_info()
{
	AI_Output(other,self,"DIA_Rengaru_HALLODIEB_15_00");	//Джора говорит, что ты украл у него деньги...
	AI_Output(self,other,"DIA_Rengaru_HALLODIEB_07_01");	//Черт! Я сваливаю отсюда!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunAway");
};


instance DIA_RENGARU_GOTYOU(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 3;
	condition = dia_rengaru_gotyou_condition;
	information = dia_rengaru_gotyou_info;
	permanent = FALSE;
	description = "Поймал!";
};


func int dia_rengaru_gotyou_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_hallodieb))
	{
		return TRUE;
	};
};

func void dia_rengaru_gotyou_info()
{
	b_giveplayerxp(XP_RENGARUGOTTHIEF);
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_00");	//Поймал!
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_07_01");	//Что тебе нужно от меня?
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_02");	//Ты украл кошелек у Джоры средь бела дня, и он даже видел, как ты сделал это.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_03");	//Поэтому я пришел сказать тебе, что ты грязный вор и что...
	Info_ClearChoices(dia_rengaru_gotyou);
	Info_AddChoice(dia_rengaru_gotyou,"...Я заслуживаю долю от награбленного.",dia_rengaru_gotyou_anteil);
	Info_AddChoice(dia_rengaru_gotyou,"...тебе лучше вернуть золото Джоры. И немедленно.",dia_rengaru_gotyou_youthief);
	Info_AddChoice(dia_rengaru_gotyou,"...и теперь ты расскажешь мне, кто ты такой.",dia_rengaru_gotyou_whoareyou);
};

func void dia_rengaru_gotyou_youthief()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_YouThief_15_00");	//...тебе лучше вернуть золото Джоры. И немедленно.
	if(Npc_HasItems(self,itmi_gold) >= 1)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_01");	//Вот золото, парень! Но теперь отпусти меня. Я больше никогда не буду заниматься этим.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_02");	//У меня уже нет этого золота.
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_03");	//Но зачем я говорю тебе это? Ведь это ты меня обокрал!
		};
	};
	Info_ClearChoices(dia_rengaru_gotyou);
};

func void dia_rengaru_gotyou_anteil()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_15_00");	//...Я заслуживаю долю от награбленного.
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (Npc_HasItems(self,itmi_gold) < 1))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_07_01");	//Ты уже забрал все, что у меня было, после того, как вырубил меня! Пусти!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_15_02");	//Хорошо, похоже, у меня нет выбора. Давай, разделим пополам.
		Info_ClearChoices(dia_rengaru_gotyou);
		Info_AddChoice(dia_rengaru_gotyou,"Нет, ты отдашь мне все!",dia_rengaru_gotyou_anteil_alles);
		Info_AddChoice(dia_rengaru_gotyou,"Хорошо, давай мне половину тогда.",dia_rengaru_gotyou_anteil_gehtklar);
	};
};

func void dia_rengaru_gotyou_anteil_alles()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_alles_15_00");	//Нет, ты отдашь мне все!
	if(Npc_HasItems(self,itmi_gold) >= 2)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_02");	//Ты просто грабишь меня. Ладно, возьми это золото. А теперь оставь меня в покое.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_03");	//Я бы отдал тебе золото, но у меня больше ничего нет.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_anteil_gehtklar()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00");	//Хорошо, давай мне половину тогда.
	if(b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold) / 2))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01");	//Вот твоя половина! А теперь отпусти меня!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02");	//Я был бы не прочь отдать тебе половину, но у меня больше ничего нет.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_whoareyou()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_00");	//...и теперь ты расскажешь мне, кто ты такой.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_01");	//Я просто бедный человек, пытающийся свести концы с концами.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_02");	//Что мне еще делать? Я не могу найти работу в городе...
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_03");	//...хорошо, я понимаю. Хватит хныкать.
};


instance DIA_RENGARU_INKNAST(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 4;
	condition = dia_rengaru_inknast_condition;
	information = dia_rengaru_inknast_info;
	permanent = FALSE;
	description = "Я должен сдать тебя ополчению.";
};


func int dia_rengaru_inknast_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_gotyou))
	{
		return TRUE;
	};
};

func void dia_rengaru_inknast_info()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_15_00");	//Я должен сдать тебя ополчению.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_07_01");	//Что еще тебе нужно? У меня ничего не осталось! Отпусти меня, а?!
	Info_AddChoice(dia_rengaru_inknast,"Почему я должен отпустить тебя?",dia_rengaru_inknast_keinknast);
	Info_AddChoice(dia_rengaru_inknast,"Я позабочусь, чтобы тебя посадили за решетку.",dia_rengaru_inknast_knast);
	Info_AddChoice(dia_rengaru_inknast,"Проваливай! И чтобы больше я тебя здесь не видел!",dia_rengaru_inknast_hauab);
};

func void dia_rengaru_inknast_hauab()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_HauAb_15_00");	//Проваливай! И чтобы больше я тебя здесь не видел!
	AI_Output(self,other,"DIA_Rengaru_INKNAST_HauAb_07_01");	//Ты не пожалеешь об этом! Спасибо, парень!
	Npc_ExchangeRoutine(self,"Start");
	AI_StopProcessInfos(self);
	DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
};

func void dia_rengaru_inknast_knast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_Knast_15_00");	//Я позабочусь, чтобы тебя посадили за решетку.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_01");	//(устало) Я уже устал от этого всего. Если тебе кажется, что ты должен это сделать, поступай как знаешь.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_02");	//(предупреждающе) Но берегись: мои друзья это дело так не оставят...
	RENGARU_INKNAST = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_rengaru_inknast_keinknast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_keinKnast_15_00");	//Почему я должен отпустить тебя?
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_01");	//В городе никогда не помешают связи с нужными людьми - и хорошие отношения с ними.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_02");	//Я мог бы замолвить словечко за тебя. Я не могу и не хочу говорить больше. Решать тебе.
};


instance DIA_RENGARU_LASTINFOKAP1(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 6;
	condition = dia_rengaru_lastinfokap1_condition;
	information = dia_rengaru_lastinfokap1_info;
	permanent = TRUE;
	description = "Как дела? У тебя все в порядке?";
};


func int dia_rengaru_lastinfokap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_inknast))
	{
		return TRUE;
	};
};

func void dia_rengaru_lastinfokap1_info()
{
	AI_Output(other,self,"DIA_Rengaru_LastInfoKap1_15_00");	//Как дела? У тебя все в порядке?
	if(RENGARU_INKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_01");	//Давай, давай, дразнись. Когда-нибудь, ты поплатишься за это. Клянусь!
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_02");	//Что еще тебе нужно? Я больше ничего не украл, честно!
	};
};


instance DIA_RENGARU_ZEICHEN(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_zeichen_condition;
	information = dia_rengaru_zeichen_info;
	permanent = FALSE;
	description = "(показать сигнал воров)";
};


func int dia_rengaru_zeichen_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (RENGARU_INKNAST == FALSE) && Npc_KnowsInfo(other,dia_rengaru_gotyou))
	{
		return TRUE;
	};
};

func void dia_rengaru_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_00");	//Эй, ты один из нас.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_01");	//Я скажу тебе кое-что. Если ты намереваешься залезть в чей-нибудь карман в городе, будь особенно осторожен с торговцами!
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_02");	//Они очень бдительны и глаз не спускают со своих вещей. Но я могу дать тебе совет.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_03");	//Попробуй взять нужный тебе предмет одной рукой, размахивая при этом другой. Это отвлечет их.
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 2;
	PrintScreen(PRINT_DEX2,-1,-1,FONT_SCREENSMALL,2);
	Snd_Play("LEVELUP");
};

