
instance DIA_MOE_EXIT(C_INFO)
{
	npc = vlk_432_moe;
	nr = 999;
	condition = dia_moe_exit_condition;
	information = dia_moe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_moe_exit_condition()
{
	return TRUE;
};

func void dia_moe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MOE_PICKPOCKET(C_INFO)
{
	npc = vlk_432_moe;
	nr = 900;
	condition = dia_moe_pickpocket_condition;
	information = dia_moe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_moe_pickpocket_condition()
{
	return c_beklauen(25,30);
};

func void dia_moe_pickpocket_info()
{
	Info_ClearChoices(dia_moe_pickpocket);
	Info_AddChoice(dia_moe_pickpocket,DIALOG_BACK,dia_moe_pickpocket_back);
	Info_AddChoice(dia_moe_pickpocket,DIALOG_PICKPOCKET,dia_moe_pickpocket_doit);
};

func void dia_moe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_moe_pickpocket);
};

func void dia_moe_pickpocket_back()
{
	Info_ClearChoices(dia_moe_pickpocket);
};


instance DIA_MOE_HALLO(C_INFO)
{
	npc = vlk_432_moe;
	nr = 2;
	condition = dia_moe_hallo_condition;
	information = dia_moe_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_moe_hallo_condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_MIL) && (hero.guild != GIL_NOV) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_moe_hallo_info()
{
	AI_Output(self,other,"DIA_Moe_Hallo_01_00");	//Эй, я не знаю тебя. Чего тебе здесь нужно? Ты идешь в кабак?
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Нет, я не иду в кабак...",dia_moe_hallo_gehen);
	Info_AddChoice(dia_moe_hallo,"Ох, так это портовый трактир ...",dia_moe_hallo_witz);
	Info_AddChoice(dia_moe_hallo,"Ты имеешь что-то против?",dia_moe_hallo_reizen);
};

func void dia_moe_hallo_gehen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Gehen_15_00");	//Нет, я не иду в кабак...
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_01");	//Я так и подумал. Но это не так уж важно - мы можем перейти прямо к делу.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_02");	//Так как ты здесь новичок, я хочу сделать тебе заманчивое предложение. Ты даешь мне 50 золотых монет и можешь идти дальше.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_03");	//Это плата за свободный вход в кабак.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Давай спросим, что думает по этому поводу ополчение...",dia_moe_hallo_miliz);
	Info_AddChoice(dia_moe_hallo,"Забудь об этом, ты не получишь ни цента!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"Хорошо, я заплачу.",dia_moe_hallo_zahlen);
	Info_AddChoice(dia_moe_hallo,"Но я не хочу идти в кабак!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_kneipe()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Kneipe_15_00");	//Но я не хочу идти в кабак!
	AI_Output(self,other,"DIA_Moe_Hallo_Kneipe_01_01");	//Понимаешь, рано или поздно все заходят в кабак. Так что лучше тебе заплатить прямо сейчас - и больше эта проблема не будет волновать тебя.
};

func void dia_moe_hallo_witz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Witz_15_00");	//Ох, так это портовый трактир. А я то принял его за дворец губернатора.
	AI_Output(self,other,"DIA_Moe_Hallo_Witz_01_01");	//Эй - держи свои шуточки при себе, кретин, или я заставлю тебя грызть булыжники из мостовой.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Понимаю, чтобы пройти дальше мне придется сломать тебе пару ребер ...",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"Ты пытаешься создать мне проблемы?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"Успокойся, я просто хотел выпить пива.",dia_moe_hallo_ruhig);
	Info_AddChoice(dia_moe_hallo,"Но я не хочу идти в кабак!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_reizen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Reizen_15_00");	//Ты имеешь что-то против?
	AI_Output(self,other,"DIA_Moe_Hallo_Reizen_01_01");	//Тебе нечего здесь делать, малыш.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Понимаю, чтобы пройти дальше мне придется сломать тебе пару ребер ...",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"Ты пытаешься создать мне проблемы?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"Успокойся, я просто хотел выпить пива.",dia_moe_hallo_ruhig);
};

func void dia_moe_hallo_miliz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Miliz_15_00");	//Давай спросим, что думает по этому поводу ополчение...
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_01");	//(смеется) Ополчения здесь нет. А ты знаешь, почему их здесь не бывает?
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_02");	//Ты находишься в портовом квартале, малыш. Никто из ополчения не осмелится вступать здесь в драку со мной.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_03");	//Они только иногда заглядывают в 'Красный Фонарь'. Понимаешь, здесь есть только ты и я. (мерзкая ухмылка)
};

func void dia_moe_hallo_pruegel()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Pruegel_15_00");	//Понимаю, чтобы пройти дальше, мне придется сломать тебе пару ребер.
	AI_Output(self,other,"DIA_Moe_Hallo_Pruegel_01_01");	//Можешь попробовать, малыш. Покажи мне, на что ты способен!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_aerger()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Aerger_15_00");	//Ты пытаешься создать мне проблемы?
	AI_Output(self,other,"DIA_Moe_Hallo_Aerger_01_01");	//Конечно, я мастер создавать проблемы. Так что защищайся, кретин!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_ruhig()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Ruhig_15_00");	//Успокойся, я просто хотел выпить пива.
	AI_Output(self,other,"DIA_Moe_Hallo_Ruhig_01_01");	//Хорошо, но это будет стоить тебе 50 монет. Это плата за вход. (ухмыляется)
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"Забудь об этом, ты не получишь ни цента!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"Хорошо, я заплачу.",dia_moe_hallo_zahlen);
};

func void dia_moe_hallo_zahlen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_00");	//Хорошо, я заплачу.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_01");	//Отлично. Раз сегодня ты такой щедрый, теперь ты можешь отдать мне все содержимое твоего кошелька.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"Забудь об этом, ты не получишь ни цента!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"Хорошо, это все, что у меня есть.",dia_moe_hallo_alles);
	}
	else if(Npc_HasItems(hero,itmi_gold) > 9)
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_02");	//...но у меня нет с собой столько золота.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_03");	//Это не важно. Просто отдай мне все, что у тебя есть.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"Забудь об этом, ты не получишь ни цента!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"Хорошо, это все, что у меня есть.",dia_moe_hallo_alles);
	}
	else
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_04");	//...но у меня нет даже и 10 монет.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_05");	//Черт, неужели сегодня мне не повезло?!
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_06");	//Хорошо, (вздох) ты можешь идти.
		AI_StopProcessInfos(self);
	};
};

func void dia_moe_hallo_vergisses()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Vergisses_15_00");	//Забудь об этом, ты не получишь ни цента!
	AI_Output(self,other,"DIA_Moe_Hallo_Vergisses_01_01");	//Тогда я возьму все, что у тебя есть, - а ты будешь лежать распростертым на земле передо мной.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_alles()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Alles_15_00");	//Хорошо, это все, что у меня есть.
	b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
	AI_Output(self,other,"DIA_Moe_Hallo_Alles_01_01");	//Отлично, этого достаточно. Я сегодня великодушен. (ухмыляется)
	AI_StopProcessInfos(self);
};


instance DIA_MOE_HARBOR(C_INFO)
{
	npc = vlk_432_moe;
	nr = 998;
	condition = dia_moe_harbor_condition;
	information = dia_moe_harbor_info;
	permanent = TRUE;
	description = "Ты знаешь о порте почти все, да?";
};


func int dia_moe_harbor_condition()
{
	return TRUE;
};

func void dia_moe_harbor_info()
{
	AI_Output(other,self,"DIA_Moe_Harbor_15_00");	//Ты знаешь о порте почти все, да?
	AI_Output(self,other,"DIA_Moe_Harbor_01_01");	//Конечно. А что?
	Info_ClearChoices(dia_moe_harbor);
	Info_AddChoice(dia_moe_harbor,DIALOG_BACK,dia_moe_harbor_back);
	Info_AddChoice(dia_moe_harbor,"Как тут с кораблями?",dia_moe_harbor_ship);
	Info_AddChoice(dia_moe_harbor,"Почему я не вижу здесь никого из ополчения?",dia_moe_harbor_militia);
	Info_AddChoice(dia_moe_harbor,"Какие слухи бродят в последнее время?",dia_moe_harbor_rumors);
};

func void dia_moe_harbor_back()
{
	Info_ClearChoices(dia_moe_harbor);
};

func void dia_moe_harbor_ship()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Ship_15_00");	//Как тут с кораблями?
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_01");	//Единственный корабль, который пришел за последнее время, - это корабль паладинов.
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_02");	//Он стоит вон там, за скалами к юго-западу.
};

func void dia_moe_harbor_militia()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Militia_15_00");	//Почему я не вижу здесь никого из ополчения?
	AI_Output(self,other,"DIA_Moe_Harbor_Militia_01_01");	//Они не осмеливаются соваться сюда. У нас здесь свои порядки.
};

func void dia_moe_harbor_rumors()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_00");	//Какие слухи бродят в последнее время?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_01");	//Мы здесь не любим людей, которые задают слишком много вопросов. Особенно, если они чужаки.
	}
	else if(KAPITEL == 2)
	{
		if(hero.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_02");	//Ничего, да и что может случиться? Все тихо.
		}
		else if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_03");	//(наиграно) Все плохо. Времена настали тяжелые, но мы все еще пытаемся не сбиться с праведного пути.
			AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_04");	//Хватит издеваться надо мной.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_05");	//Как ты мог подумать такое обо мне? Я глубоко оскорблен.
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_06");	//Становится жарко. Лорд Андрэ пытается сунуть свой нос туда, где ему делать нечего.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_07");	//Эти шишки никогда не понимали, как здесь ведутся дела.
		};
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_08");	//К этому делу мы не имеем никакого отношения.
				AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_09");	//К какому делу?
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_10");	//К этому убийству паладина там, наверху. Я бы на твоем месте подумал о наемниках вместо того, чтобы попусту проводить время здесь.
			}
			else
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_11");	//Я знаю, что ты не имеешь к этому никакого отношения, но убийство паладина сильно напугало этих вельмож.
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_12");	//Хочешь дружеский совет? Тебе лучше убираться из города. По крайней мере, на некоторое время.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_13");	//С тех пор, как выяснилось, что наемники не имели отношения к этому паладину, ополчение не осмеливается даже заглядывать сюда.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_14");	//Я думаю, они боятся уйти отсюда с расквашенным носом. А по мне, так даже лучше.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_15");	//Здесь абсолютно ничего не происходит.
	}
	else
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_16");	//Наконец-то эти разжиревшие паладины покидают гавань. Давно пора.
	};
};


instance DIA_MOE_LEHMARGELDEINTREIBEN(C_INFO)
{
	npc = vlk_432_moe;
	nr = 2;
	condition = dia_moe_lehmargeldeintreiben_condition;
	information = dia_moe_lehmargeldeintreiben_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_moe_lehmargeldeintreiben_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0))
	{
		return TRUE;
	};
};

func void dia_moe_lehmargeldeintreiben_info()
{
	AI_Output(self,other,"DIA_Moe_LEHMARGELDEINTREIBEN_01_00");	//Эй, ты! Лемар передает тебе привет.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

