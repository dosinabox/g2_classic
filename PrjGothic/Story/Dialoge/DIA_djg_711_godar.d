
instance DIA_GODAR_EXIT(C_INFO)
{
	npc = djg_711_godar;
	nr = 999;
	condition = dia_godar_exit_condition;
	information = dia_godar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_godar_exit_condition()
{
	return TRUE;
};

func void dia_godar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GODAR_HELLO(C_INFO)
{
	npc = djg_711_godar;
	nr = 4;
	condition = dia_godar_hello_condition;
	information = dia_godar_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_godar_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_godar_hello_info()
{
	AI_Output(self,other,"DIA_Godar_Hello_13_00");	//Э-э? Что?
};


instance DIA_GODAR_COMEFROM(C_INFO)
{
	npc = djg_711_godar;
	nr = 4;
	condition = dia_godar_comefrom_condition;
	information = dia_godar_comefrom_info;
	permanent = FALSE;
	description = "Откуда ты?";
};


func int dia_godar_comefrom_condition()
{
	return TRUE;
};

func void dia_godar_comefrom_info()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_15_00");	//Откуда вы?
	AI_Output(self,other,"DIA_Godar_ComeFrom_13_01");	//Мы пришли... э-э, из города.
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Вы бандиты!",dia_godar_comefrom_bandits);
	Info_AddChoice(dia_godar_comefrom,"Я что-то не видел тебя в городе.",dia_godar_comefrom_notcity);
	Info_AddChoice(dia_godar_comefrom,"Понятно. Вы из города.",dia_godar_comefrom_understand);
};

func void dia_godar_comefrom_bandits()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_15_00");	//Вы бандиты!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_13_01");	//Поосторожнее! Твой язык не доведет тебя до добра!
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Расслабься. Я не буду сдавать вас.",dia_godar_comefrom_bandits_keepcalm);
	Info_AddChoice(dia_godar_comefrom,"Тебе не напугать меня.",dia_godar_comefrom_bandits_nofear);
};

func void dia_godar_comefrom_bandits_keepcalm()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00");	//Расслабься. Я не буду сдавать вас.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01");	//Надеюсь. Это для твоей же пользы. А то не сносить тебе головы!
	Info_ClearChoices(dia_godar_comefrom);
};

func void dia_godar_comefrom_bandits_nofear()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Bandits_NoFear_15_00");	//Тебе не напугать меня.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Bandits_NoFear_13_01");	//Ну, это мы еще посмотрим.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_godar_comefrom_notcity()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_15_00");	//Я что-то не видел тебя в городе.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_13_01");	//Не выношу людей, которые суют нос не в свое дело. Понял?
	Info_ClearChoices(dia_godar_comefrom);
	Info_AddChoice(dia_godar_comefrom,"Нет.",dia_godar_comefrom_notcity_cutthroat);
	Info_AddChoice(dia_godar_comefrom,"Понял. Вы пришли из города.",dia_godar_comefrom_notcity_forget);
};

func void dia_godar_comefrom_notcity_forget()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_Forget_15_00");	//Понял. Вы пришли из города.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01");	//Именно.
	Info_ClearChoices(dia_godar_comefrom);
};

func void dia_godar_comefrom_notcity_cutthroat()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00");	//Нет.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_CutThroat_13_01");	//Тогда мне придется объяснить это в деталях...
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_godar_comefrom_understand()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_Understand_15_00");	//Понятно. Вы из города.
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_01");	//Видишь! Ты все понимаешь!
	AI_Output(self,other,"DIA_Godar_ComeFrom_Understand_13_02");	//Вот, глотни!
	CreateInvItems(self,itfo_beer,1);
	b_giveinvitems(self,other,itfo_beer,1);
	b_useitem(other,itfo_beer);
	Info_ClearChoices(dia_godar_comefrom);
};


instance DIA_GODAR_PLAN(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_plan_condition;
	information = dia_godar_plan_info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int dia_godar_plan_condition()
{
	return TRUE;
};

func void dia_godar_plan_info()
{
	AI_Output(other,self,"DIA_Godar_Plan_15_00");	//Что вы делаете здесь?
	AI_Output(self,other,"DIA_Godar_Plan_13_01");	//Мы услышали об охоте на драконов. Ну... Мы собрали свои пожитки и пришли сюда.
	AI_Output(self,other,"DIA_Godar_Plan_13_02");	//Но, говоря откровенно, мне плевать на драконов. Мне нужно золото.
	AI_Output(self,other,"DIA_Godar_Plan_13_03");	//У драконов ведь есть золото, правда?
	AI_Output(other,self,"DIA_Godar_Plan_15_04");	//Конечно.
};


instance DIA_GODAR_DRAGONLORE(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_dragonlore_condition;
	information = dia_godar_dragonlore_info;
	permanent = FALSE;
	description = "Что ты знаешь о драконах?";
};


func int dia_godar_dragonlore_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_plan))
	{
		return TRUE;
	};
};

func void dia_godar_dragonlore_info()
{
	AI_Output(other,self,"DIA_Godar_DragonLore_15_00");	//Что ты знаешь о драконах?
	AI_Output(self,other,"DIA_Godar_DragonLore_13_01");	//Я знаю о них только из детских сказок.
	AI_Output(self,other,"DIA_Godar_DragonLore_13_02");	//Понимаешь, девственницы, золото, огненное дыхание и все такое.
};


instance DIA_GODAR_DESTINATION(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_destination_condition;
	information = dia_godar_destination_info;
	permanent = FALSE;
	description = "А куда вы собираетесь идти отсюда?";
};


func int dia_godar_destination_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_plan))
	{
		return TRUE;
	};
};

func void dia_godar_destination_info()
{
	AI_Output(other,self,"DIA_Godar_Destination_15_00");	//А куда вы собираетесь идти отсюда?
	AI_Output(self,other,"DIA_Godar_Destination_13_01");	//Понятия не имею. Мы все еще думаем над этим.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(other,self,"DIA_Godar_Destination_15_02");	//Вы могли бы пойти в замок.
		AI_Output(self,other,"DIA_Godar_Destination_13_03");	//Меня туда силком не затащишь. Нет уж. Только не к паладинам.
		AI_Output(self,other,"DIA_Godar_Destination_13_04");	//Я не хочу обратно в тюрьму. Я уже был там, и мне этого хватило.
	};
};


instance DIA_GODAR_ORKS(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_orks_condition;
	information = dia_godar_orks_info;
	permanent = FALSE;
	description = "Что насчет орков?";
};


func int dia_godar_orks_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_destination))
	{
		return TRUE;
	};
};

func void dia_godar_orks_info()
{
	AI_Output(other,self,"DIA_Godar_Orks_15_00");	//Что насчет орков?
	AI_Output(self,other,"DIA_Godar_Orks_13_01");	//Ими окружен весь замок.
	AI_Output(self,other,"DIA_Godar_Orks_13_02");	//Пытаться пробраться туда - чистое безумие. Если ты хочешь сразиться с орками, то сразу можешь считать себя трупом.
	AI_Output(self,other,"DIA_Godar_Orks_13_03");	//Никому не пробиться туда.
	AI_Output(other,self,"DIA_Godar_Orks_15_04");	//Ах, действительно.
};


instance DIA_GODAR_PRISON(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_prison_condition;
	information = dia_godar_prison_info;
	permanent = FALSE;
	description = "За что ты сидел?";
};


func int dia_godar_prison_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_destination) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_godar_prison_info()
{
	AI_Output(other,self,"DIA_Godar_Prison_15_00");	//За что ты сидел?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_01");	//Так я тебе и сказал! Ха!
		AI_Output(self,other,"DIA_Godar_Prison_13_02");	//Вы, маги, заодно с паладинами. Нет, дружок. Забудь об этом.
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Prison_13_03");	//Эти свиньи поймали меня за браконьерство. За двух жалких зайцев!
		AI_Output(self,other,"DIA_Godar_Prison_13_04");	//Мне дали 10 лет за это!
		AI_Output(other,self,"DIA_Godar_Prison_15_05");	//Это все?
		AI_Output(self,other,"DIA_Godar_Prison_13_06");	//Ну... Конечно же, я защищался...
		AI_Output(other,self,"DIA_Godar_Prison_15_07");	//И?
		AI_Output(self,other,"DIA_Godar_Prison_13_08");	//Я тут не причем. Этот парень сам поскользнулся и сломал себе шею. Честно!
		Info_ClearChoices(dia_godar_prison);
		Info_AddChoice(dia_godar_prison,"Знакомые слова.",dia_godar_prison_court);
		Info_AddChoice(dia_godar_prison,"Тебе не следовало попадаться.",dia_godar_prison_pissoff);
	};
};

func void dia_godar_prison_court()
{
	AI_Output(other,self,"DIA_Godar_Prison_Court_15_00");	//Знакомая история.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_01");	//Ты понимаешь меня? Эти спесивые богачи понятия не имеют, как нам тяжело.
	AI_Output(self,other,"DIA_Godar_Prison_Court_13_02");	//Ну, по крайней мере, их это не волнует.
	Info_ClearChoices(dia_godar_prison);
	GODARLIKESYOU = TRUE;
};

func void dia_godar_prison_pissoff()
{
	AI_Output(other,self,"DIA_Godar_Prison_Pissoff_15_00");	//Тебе не следовало попадаться.
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_01");	//(сердито) Ручаюсь, ты никогда не был в тюрьме, так ведь?
	AI_Output(self,other,"DIA_Godar_Prison_Pissoff_13_02");	//Сейчас я покажу тебе, что может стать с человеком в тюрьме!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_GODAR_HUNTING(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_hunting_condition;
	information = dia_godar_hunting_info;
	permanent = FALSE;
	description = "Ты можешь научить меня охотиться?";
};


func int dia_godar_hunting_condition()
{
	if(Npc_KnowsInfo(other,dia_godar_prison) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_godar_hunting_info()
{
	AI_Output(other,self,"DIA_Godar_Hunting_15_00");	//Ты можешь научить меня охотиться?
	if(GODARLIKESYOU == FALSE)
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_01");	//Ты шутишь? Ни за что!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Hunting_13_03");	//Животные - это не только мясо. Ты также можешь продавать их шкуры или когти. Это неплохие деньги.
		AI_Output(self,other,"DIA_Godar_Hunting_13_04");	//Дождаться не могу, когда мы доберемся до этого дракона!
		GODAR_TEACHANIMALTROPHY = TRUE;
	};
};


instance DIA_GODAR_DRAGONSTUFF(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_dragonstuff_condition;
	information = dia_godar_dragonstuff_info;
	permanent = TRUE;
	description = "Расскажи мне, как потрошить дракона.";
};


var int godar_teachdragonstuff;

func int dia_godar_dragonstuff_condition()
{
	if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)) && ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)) && (GODAR_TEACHDRAGONSTUFF == FALSE))
	{
		return TRUE;
	};
};

func void dia_godar_dragonstuff_info()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_15_00");	//Расскажи мне, как потрошить дракона.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_01");	//Чтобы ты прибрал все золотишко себе, ха?
	AI_Output(self,other,"DIA_Godar_Dragonstuff_13_02");	//Ладно, хорошо, но то обойдется тебе в 1000 золотых.
	Info_ClearChoices(dia_godar_dragonstuff);
	Info_AddChoice(dia_godar_dragonstuff,"Мне это не очень интересно.",dia_godar_dragonstuff_nein);
	Info_AddChoice(dia_godar_dragonstuff,"Это честно.",dia_godar_dragonstuff_fair);
};

func void dia_godar_dragonstuff_fair()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_fair_15_00");	//Это честно.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		GODAR_TEACHDRAGONSTUFF = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Godar_Dragonstuff_fair_13_01");	//Без денег не очень. Сначала раздобудь золото.
	};
	Info_ClearChoices(dia_godar_dragonstuff);
};

func void dia_godar_dragonstuff_nein()
{
	AI_Output(other,self,"DIA_Godar_Dragonstuff_nein_15_00");	//Мне это не очень интересно.
	AI_Output(self,other,"DIA_Godar_Dragonstuff_nein_13_01");	//Как знаешь.
	Info_ClearChoices(dia_godar_dragonstuff);
};


instance DIA_GODAR_TEACH(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_teach_condition;
	information = dia_godar_teach_info;
	permanent = TRUE;
	description = "Научи меня охотиться.";
};


func int dia_godar_teach_condition()
{
	if((GODAR_TEACHANIMALTROPHY == TRUE) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_godar_teach_info()
{
	AI_Output(other,self,"DIA_Godar_Teach_15_00");	//Научи меня охотиться.
	if((Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE))
	{
		Info_AddChoice(dia_godar_teach,DIALOG_BACK,dia_godar_teach_back);
		if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Красться",b_getlearncosttalent(other,NPC_TALENT_SNEAK)),dia_godar_teach_thief_sneak);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Удаление зубов",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Жало кровавой мухи",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
		{
			Info_AddChoice(dia_godar_teach,b_buildlearnstring("Крылья кровавой мухи",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_bfwing);
		};
		if(GODAR_TEACHDRAGONSTUFF == TRUE)
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONSCALE] == FALSE)
			{
				Info_AddChoice(dia_godar_teach,b_buildlearnstring("Удаление чешуи драконов",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_dragonscale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRAGONBLOOD] == FALSE)
			{
				Info_AddChoice(dia_godar_teach,b_buildlearnstring("Сбор крови дракона",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_godar_teach_trophys_dragonblood);
			};
		};
	}
	else
	{
		b_say(self,other,"$NOLEARNYOUREBETTER");
	};
};

func void dia_godar_teach_back()
{
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Teeth_13_00");	//Зубы лучше всего отделять при помощи хорошего ножа.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFSting_13_00");	//Чтобы изъять жало кровавой мухи, нужно сначала выдавить его из ее тела.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_BFWing_13_00");	//Крылья кровавых мух очень нежные. Нужно быть очень аккуратным, когда отрезаешь их.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_thief_sneak()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_Sneak_13_00");	//Чтобы неслышно красться, лучше всего использовать мягкую обувь. Жесткая подошва издает слишком много шума.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_dragonscale()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONSCALE))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonScale_13_00");	//Чтобы оторвать чешую дракона, нужно иметь много сил. Но ты справишься.
	};
	Info_ClearChoices(dia_godar_teach);
};

func void dia_godar_teach_trophys_dragonblood()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRAGONBLOOD))
	{
		AI_Output(self,other,"DIA_Godar_TEACHHUNTING_DragonBlood_13_00");	//Найди мягкое место на животе дракона. Там легче всего сцедить его кровь.
	};
	Info_ClearChoices(dia_godar_teach);
};


instance DIA_GODAR_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_711_godar;
	nr = 5;
	condition = dia_godar_alldragonsdead_condition;
	information = dia_godar_alldragonsdead_info;
	permanent = FALSE;
	description = "Я убил всех драконов.";
};


func int dia_godar_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_godar_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Godar_AllDragonsDead_15_00");	//Я убил всех драконов.
	AI_Output(self,other,"DIA_Godar_AllDragonsDead_13_01");	//Ну и ладно. Здесь, в долине, мы все равно найдем, чем поживиться.
};


instance DIA_GODAR_PICKPOCKET(C_INFO)
{
	npc = djg_711_godar;
	nr = 900;
	condition = dia_godar_pickpocket_condition;
	information = dia_godar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_godar_pickpocket_condition()
{
	return c_beklauen(16,160);
};

func void dia_godar_pickpocket_info()
{
	Info_ClearChoices(dia_godar_pickpocket);
	Info_AddChoice(dia_godar_pickpocket,DIALOG_BACK,dia_godar_pickpocket_back);
	Info_AddChoice(dia_godar_pickpocket,DIALOG_PICKPOCKET,dia_godar_pickpocket_doit);
};

func void dia_godar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_godar_pickpocket);
};

func void dia_godar_pickpocket_back()
{
	Info_ClearChoices(dia_godar_pickpocket);
};

