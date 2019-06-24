
instance DIA_GRIMBALD_EXIT(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 999;
	condition = dia_grimbald_exit_condition;
	information = dia_grimbald_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_grimbald_exit_condition()
{
	return TRUE;
};

func void dia_grimbald_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRIMBALD_HALLO(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_hallo_condition;
	information = dia_grimbald_hallo_info;
	description = "Ты чего-то ждешь?";
};


func int dia_grimbald_hallo_condition()
{
	return TRUE;
};


var int grimbald_pissoff;

func void dia_grimbald_hallo_info()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_15_00");	//Ты чего-то ждешь?
	if(Npc_IsDead(grimbald_snapper1) && Npc_IsDead(grimbald_snapper2) && Npc_IsDead(grimbald_snapper3))
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_01");	//Я охочусь. По-моему, это очевидно.
		GRIMBALD_PISSOFF = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_HALLO_07_02");	//Больше нет. Ты ведь уже пришел.
		Info_ClearChoices(dia_grimbald_hallo);
		Info_AddChoice(dia_grimbald_hallo,"Меня ждут дела.",dia_grimbald_hallo_nein);
		Info_AddChoice(dia_grimbald_hallo,"Что ты задумал?",dia_grimbald_hallo_was);
		Info_AddChoice(dia_grimbald_hallo,"Почему я?",dia_grimbald_hallo_ich);
	};
};

func void dia_grimbald_hallo_ich()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_ich_15_00");	//Почему я?
	AI_Output(self,other,"DIA_Grimbald_HALLO_ich_07_01");	//Похоже, ты сильный человек. Я бы не отказался от твоей помощи.
};

func void dia_grimbald_hallo_was()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_15_00");	//Что ты задумал?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_07_01");	//Я хочу поохотиться на снепперов вон там, но боюсь, мне не справиться с ними в одиночку.
	Info_AddChoice(dia_grimbald_hallo,"Можешь не рассчитывать на меня.",dia_grimbald_hallo_was_neinnein);
	Info_AddChoice(dia_grimbald_hallo,"Хорошо, я помогу тебе. Но ты пойдешь впереди.",dia_grimbald_hallo_was_ja);
};

func void dia_grimbald_hallo_was_neinnein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_neinnein_15_00");	//Можешь не рассчитывать на меня.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_neinnein_07_01");	//Тогда проваливай, трус.
	GRIMBALD_PISSOFF = TRUE;
	Info_ClearChoices(dia_grimbald_hallo);
};

func void dia_grimbald_hallo_was_ja()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_Was_ja_15_00");	//Хорошо, я помогу тебе. Но ты пойдешь впереди.
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_01");	//Конечно. Только не приближайся слишком близко к черному троллю. Он разорвет тебя на куски, понял?
	AI_Output(self,other,"DIA_Grimbald_HALLO_Was_ja_07_02");	//И я не прощу тебе, если ты решишь выйти из игры.
	b_startotherroutine(self,"Jagd");
	AI_StopProcessInfos(self);
};

func void dia_grimbald_hallo_nein()
{
	AI_Output(other,self,"DIA_Grimbald_HALLO_nein_15_00");	//Меня ждут дела.
	AI_Output(self,other,"DIA_Grimbald_HALLO_nein_07_01");	//Не мели чепуху. Что такого важного может ждать тебя в этой глуши?
};


instance DIA_GRIMBALD_JAGD(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_jagd_condition;
	information = dia_grimbald_jagd_info;
	permanent = TRUE;
	description = "Ты можешь научить меня охотиться?";
};


func int dia_grimbald_jagd_condition()
{
	if(Npc_KnowsInfo(other,dia_grimbald_hallo) && (GRIMBALD_TEACHANIMALTROPHY == FALSE))
	{
		return TRUE;
	};
};

func void dia_grimbald_jagd_info()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_15_00");	//Ты можешь научить меня охотиться?
	if((Npc_IsDead(grimbald_snapper1) && Npc_IsDead(grimbald_snapper2) && Npc_IsDead(grimbald_snapper3)) || (GRIMBALD_PISSOFF == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_07_01");	//Ммм. Хорошо. Ты не особенно-то помог мне, но не стоит быть слишком строгим.
		GRIMBALD_TEACHANIMALTROPHY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_07_02");	//Конечно. Но не бесплатно.
		b_say_gold(self,other,200);
		Info_ClearChoices(dia_grimbald_jagd);
		Info_AddChoice(dia_grimbald_jagd,"Я подумаю над этим.",dia_grimbald_jagd_zuviel);
		Info_AddChoice(dia_grimbald_jagd,"Хорошо.",dia_grimbald_jagd_ja);
	};
};

func void dia_grimbald_jagd_ja()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_ja_15_00");	//Хорошо, вот деньги.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_01");	//Отлично. Скажешь, когда захочешь научиться чему-нибудь.
		GRIMBALD_TEACHANIMALTROPHY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_Jagd_ja_07_02");	//Принеси мне деньги, и я готов обучать тебя.
	};
	Info_ClearChoices(dia_grimbald_jagd);
};

func void dia_grimbald_jagd_zuviel()
{
	AI_Output(other,self,"DIA_Grimbald_Jagd_zuviel_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Grimbald_Jagd_zuviel_07_01");	//Как хочешь.
	Info_ClearChoices(dia_grimbald_jagd);
};


instance DIA_GRIMBALD_TEACHHUNTING(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 12;
	condition = dia_grimbald_teachhunting_condition;
	information = dia_grimbald_teachhunting_info;
	permanent = TRUE;
	description = "Научи меня охотиться.";
};


func int dia_grimbald_teachhunting_condition()
{
	if(GRIMBALD_TEACHANIMALTROPHY == TRUE)
	{
		return TRUE;
	};
};


var int dia_grimbald_teachhunting_onetime;

func void dia_grimbald_teachhunting_info()
{
	AI_Output(other,self,"DIA_Grimbald_TEACHHUNTING_15_00");	//Научи меня охотиться.
	if(DIA_GRIMBALD_TEACHHUNTING_ONETIME == FALSE)
	{
		b_startotherroutine(self,"JagdOver");
		DIA_GRIMBALD_TEACHHUNTING_ONETIME = TRUE;
	};
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_01");	//Что именно ты хочешь узнать?
		Info_AddChoice(dia_grimbald_teachhunting,DIALOG_BACK,dia_grimbald_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Жало кровавой мухи",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_grimbald_teachhunting_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Крылья кровавой мухи",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_grimbald_teachhunting_bfwing);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Удаление когтей",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_grimbald_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_MANDIBLES] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Удаление мандибул",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_grimbald_teachhunting_mandibles);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CRAWLERPLATE] == FALSE)
		{
			Info_AddChoice(dia_grimbald_teachhunting,b_buildlearnstring("Удаление панцирей краулеров",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_grimbald_teachhunting_crawlerplate);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_07_02");	//Ты уже знаешь все, чему я мог научить тебя.
	};
};

func void dia_grimbald_teachhunting_back()
{
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFSting_07_00");	//Вырезать жало кровавой мухи довольно просто. Тебе нужно найти его основание и с силой воткнуть туда нож.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_BFWing_07_00");	//Крылья кровавой мухи можно вырвать или вырезать при помощи острого ножа.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Claws_07_00");	//Есть несколько способов вырезать когти. Для одних животных необходим сильный точный удар ножом, а у других их нужно вырезать очень аккуратно.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_mandibles()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_MANDIBLES))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_Mandibles_07_00");	//У краулеров и полевых хищников сильные мандибулы, которые можно отделить от головы сильным точным ударом.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};

func void dia_grimbald_teachhunting_crawlerplate()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CRAWLERPLATE))
	{
		AI_Output(self,other,"DIA_Grimbald_TEACHHUNTING_CrawlerPlate_07_00");	//Панцири с краулеров снять нелегко, но это все же можно сделать при помощи острого прочного предмета.
	};
	Info_ClearChoices(dia_grimbald_teachhunting);
};


instance DIA_GRIMBALD_NOVCHASE(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_novchase_condition;
	information = dia_grimbald_novchase_info;
	description = "Ты не видел здесь послушника?";
};


func int dia_grimbald_novchase_condition()
{
	if(MIS_NOVIZENCHASE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_grimbald_novchase_info()
{
	AI_Output(other,self,"DIA_Grimbald_NovChase_15_00");	//Ты не видел здесь послушника?
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_01");	//Сегодня здесь прошло много разных странных личностей, включая тех двух клоунов у каменной арки.
	AI_Output(self,other,"DIA_Grimbald_NovChase_07_02");	//А недавно с ними о чем-то разговаривал послушник магов Огня.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GRIMBALD_TROLLTOT(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 3;
	condition = dia_grimbald_trolltot_condition;
	information = dia_grimbald_trolltot_info;
	important = TRUE;
};


func int dia_grimbald_trolltot_condition()
{
	if(Npc_IsDead(troll_black))
	{
		return TRUE;
	};
};

func void dia_grimbald_trolltot_info()
{
	AI_Output(self,other,"DIA_Grimbald_Trolltot_07_00");	//Черный тролль мертв. Отличная работа. Я не верил, что его вообще можно убить. Никогда этого не забуду.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GRIMBALD_PICKPOCKET(C_INFO)
{
	npc = bau_982_grimbald;
	nr = 900;
	condition = dia_grimbald_pickpocket_condition;
	information = dia_grimbald_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_grimbald_pickpocket_condition()
{
	return c_beklauen(85,250);
};

func void dia_grimbald_pickpocket_info()
{
	Info_ClearChoices(dia_grimbald_pickpocket);
	Info_AddChoice(dia_grimbald_pickpocket,DIALOG_BACK,dia_grimbald_pickpocket_back);
	Info_AddChoice(dia_grimbald_pickpocket,DIALOG_PICKPOCKET,dia_grimbald_pickpocket_doit);
};

func void dia_grimbald_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_grimbald_pickpocket);
};

func void dia_grimbald_pickpocket_back()
{
	Info_ClearChoices(dia_grimbald_pickpocket);
};

