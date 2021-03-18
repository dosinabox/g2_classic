
instance DIA_JORGEN_KAP3_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap3_exit_condition;
	information = dia_jorgen_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_PICKPOCKET(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 900;
	condition = dia_jorgen_pickpocket_condition;
	information = dia_jorgen_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jorgen_pickpocket_condition()
{
	return c_beklauen(59,70);
};

func void dia_jorgen_pickpocket_info()
{
	Info_ClearChoices(dia_jorgen_pickpocket);
	Info_AddChoice(dia_jorgen_pickpocket,DIALOG_BACK,dia_jorgen_pickpocket_back);
	Info_AddChoice(dia_jorgen_pickpocket,DIALOG_PICKPOCKET,dia_jorgen_pickpocket_doit);
};

func void dia_jorgen_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jorgen_pickpocket);
};

func void dia_jorgen_pickpocket_back()
{
	Info_ClearChoices(dia_jorgen_pickpocket);
};


instance DIA_JORGEN_HALLO(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 4;
	condition = dia_jorgen_hallo_condition;
	information = dia_jorgen_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jorgen_hallo_condition()
{
	if((KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_hallo_info()
{
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_00");	//Эй, ты!
	if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_01");	//Я вижу, ты из монастыря магов.
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_02");	//Да, и что?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_03");	//Вам не нужен еще один работник там?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_04");	//Эй, ты когда-нибудь был в монастыре?
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_05");	//Может быть, а что?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_06");	//Они все еще набирают людей?
	};
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_07");	//Я просто не знаю, куда еще идти.
};


instance DIA_JORGEN_NOVICE(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 6;
	condition = dia_jorgen_novice_condition;
	information = dia_jorgen_novice_info;
	permanent = FALSE;
	description = "Мимо тебя не проходил послушник?";
};


func int dia_jorgen_novice_condition()
{
	if((MIS_NOVIZENCHASE == LOG_RUNNING) && (KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_novice_info()
{
	AI_Output(other,self,"DIA_Jorgen_Novice_15_00");	//Мимо тебя не проходил послушник?
	AI_Output(self,other,"DIA_Jorgen_Novice_07_01");	//Да, конечно, он побежал туда.
	AI_PointAt(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output(self,other,"DIA_Jorgen_Novice_07_02");	//Он прыгнул в воду с моста и поплыл так, как будто за ним гналась акула.
	AI_StopPointAt(self);
};


instance DIA_JORGEN_MILTEN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 5;
	condition = dia_jorgen_milten_condition;
	information = dia_jorgen_milten_info;
	permanent = FALSE;
	description = "Если ты идешь в монастырь, тебе нужно поговорить с Милтеном.";
};


func int dia_jorgen_milten_condition()
{
	if((KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE) && (MIS_OLDWORLD == LOG_SUCCESS) && (miltennw.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_milten_info()
{
	AI_Output(other,self,"DIA_Jorgen_Milten_15_00");	//Если ты идешь в монастырь, тебе нужно поговорить с Милтеном. Он, наверняка, сможет помочь тебе.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_01");	//Как ты думаешь, меня примут туда?
	AI_Output(other,self,"DIA_Jorgen_Milten_15_02");	//Возможно. Но мне почему-то тяжело представить тебя в робе послушника.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_03");	//Хватит нести чепуху - роба так роба. Мне прежде всего нужна еда, а то мне скоро придется обгладывать кору с деревьев.
};


instance DIA_JORGEN_HOME(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 7;
	condition = dia_jorgen_home_condition;
	information = dia_jorgen_home_info;
	description = "Откуда ты?";
};


func int dia_jorgen_home_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_jorgen_home_info()
{
	AI_Output(other,self,"DIA_Jorgen_Home_15_00");	//Откуда ты?
	AI_Output(self,other,"DIA_Jorgen_Home_07_01");	//Я был капитаном большого китобойного судна, парень. Мой дом - море.
	AI_Output(self,other,"DIA_Jorgen_Home_07_02");	//Мой корабль, 'Магдалена', был потоплен пиратами несколько месяцев назад, и вот теперь я на мели здесь.
	AI_Output(self,other,"DIA_Jorgen_Home_07_03");	//Я очень хотел поскорее опять выйти в море, но с тех пор как я прибыл сюда, ни одной шхуны не зашло в этот проклятый порт.
	AI_Output(self,other,"DIA_Jorgen_Home_07_04");	//Единственный корабль, пришвартовавшийся в Хоринисе, - это чертова военная галера короля, а они никого не берут.
	AI_Output(self,other,"DIA_Jorgen_Home_07_05");	//И что мне теперь делать? В городе для меня нет работы. Я пробовал уже все.
};


instance DIA_JORGEN_BECAREFULL(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 8;
	condition = dia_jorgen_becarefull_condition;
	information = dia_jorgen_becarefull_info;
	permanent = TRUE;
	description = "Тебе лучше держаться подальше от дорог.";
};


func int dia_jorgen_becarefull_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_jorgen_home))
	{
		return TRUE;
	};
};

func void dia_jorgen_becarefull_info()
{
	AI_Output(other,self,"DIA_Jorgen_BeCarefull_15_00");	//Тебе лучше держаться подальше от дорог.
	AI_Output(self,other,"DIA_Jorgen_BeCarefull_07_01");	//Не волнуйся. Я уже заметил, что здешние места стали чертовски опасными последние пару дней.
};


instance DIA_JORGEN_KAP4_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap4_exit_condition;
	information = dia_jorgen_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_NEUHIER(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 41;
	condition = dia_jorgen_neuhier_condition;
	information = dia_jorgen_neuhier_info;
	description = "Как жизнь в монастыре?";
};


func int dia_jorgen_neuhier_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_jorgen_neuhier_info()
{
	AI_Output(other,self,"DIA_Jorgen_NEUHIER_15_00");	//Как жизнь в монастыре?
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_01");	//Я сойду здесь с ума!
	if(Npc_KnowsInfo(other,dia_jorgen_milten))
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_02");	//Но все же, спасибо за совет. Милтен действительно помог мне получить место здесь.
		b_giveplayerxp(XP_AMBIENT);
	};
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_03");	//Я чувствую себя идиотом среди этих всегда ворчащих благодетелей.
	};
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_04");	//Ну. А что еще мне делать? Чем помирать с голоду в городе, лучше уж выполнять работу, которую дают мне послушники.
};


instance DIA_JORGEN_PERM4(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 400;
	condition = dia_jorgen_perm4_condition;
	information = dia_jorgen_perm4_info;
	permanent = TRUE;
	description = "Я верю, что у тебя все будет в порядке.";
};


func int dia_jorgen_perm4_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_jorgen_home) && Npc_KnowsInfo(other,dia_jorgen_neuhier) && (JORGENISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};


var int dia_jorgen_perm4_onetime;

func void dia_jorgen_perm4_info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM4_15_00");	//Я верю, что у тебя все будет в порядке.
	if((DIA_JORGEN_PERM4_ONETIME == FALSE) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_PERM4_07_01");	//Только представь: я должен пропалывать их огород. Если так будет продолжаться и дальше, я сойду с ума.
		DIA_JORGEN_PERM4_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_PERM4_07_02");	//Я так хочу опять почувствовать палубу под моими ногами.
};


instance DIA_JORGEN_KAP5_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap5_exit_condition;
	information = dia_jorgen_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_BEMYCAPTAIN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 51;
	condition = dia_jorgen_bemycaptain_condition;
	information = dia_jorgen_bemycaptain_info;
	permanent = TRUE;
	description = "Может быть, я смогу предложить тебе работу капитана.";
};


func int dia_jorgen_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MIS_PYROKARCLEARDEMONTOWER != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jorgen_home))
	{
		return TRUE;
	};
};


var int dia_jorgen_bemycaptain_onetime;

func void dia_jorgen_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN_15_00");	//Может быть, я смогу предложить тебе работу капитана.
	if(DIA_JORGEN_BEMYCAPTAIN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_01");	//Ты не издеваешься надо мной, парень? Если ты скажешь, что это правда, я всегда готов.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_02");	//Эээ... есть только одна маленькая проблема. Я съел половину кладовки послушников.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_03");	//Они чуть не сошли с ума от злости, когда узнали. Я не думаю, что главный маг позволит мне вот так просто уйти.
		DIA_JORGEN_BEMYCAPTAIN_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_04");	//Сначала мне нужно отработать мой долг перед Пирокаром. Извини.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"Йорген готов стать моим капитаном, но я сначала должен оплатить его долг перед монастырем.");
};


instance DIA_JORGEN_BEMYCAPTAIN2(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 52;
	condition = dia_jorgen_bemycaptain2_condition;
	information = dia_jorgen_bemycaptain2_info;
	description = "Я расплатился с твоими долгами.";
};


func int dia_jorgen_bemycaptain2_condition()
{
	if(MIS_PYROKARCLEARDEMONTOWER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jorgen_bemycaptain2_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_00");	//Я расплатился с твоими долгами. Ты свободен.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_01");	//Правда? Как тебе удалось это?
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_02");	//Тебе лучше не знать.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_03");	//Ох, ладно. Меня это, действительно, не очень волнует. Тысяча благодарностей!
	if(SCGOTCAPTAIN == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_04");	//Как теперь насчет твоего предложения? У тебя еще есть место для меня?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_05");	//Отлично. Теперь я могу убраться отсюда!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_JORGEN_BEMYCAPTAIN3(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 53;
	condition = dia_jorgen_bemycaptain3_condition;
	information = dia_jorgen_bemycaptain3_info;
	description = "Будь моим капитаном.";
};


func int dia_jorgen_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_bemycaptain2) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_00");	//Будь моим капитаном.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_01");	//Это большая честь для меня, но у тебя есть корабль и команда?
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_02");	//Должен заметить, нам нужно по крайней мере пять человек.
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_03");	//Хорошо. Я посмотрю, что можно сделать. Жди меня в гавани.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_04");	//Есть, сэр.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	JORGENISCAPTAIN = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_JORGEN_LOSFAHREN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 59;
	condition = dia_jorgen_losfahren_condition;
	information = dia_jorgen_losfahren_info;
	permanent = TRUE;
	description = "Ты готов доставить меня на остров?";
};


func int dia_jorgen_losfahren_condition()
{
	if((JORGENISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_losfahren_info()
{
	AI_Output(other,self,"DIA_Jorgen_LOSFAHREN_15_00");	//Ты готов доставить меня на остров?
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_01");	//Конечно. Дай мне карту.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_02");	//Отлично. Поднять паруса! Мы отчаливаем!
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_03");	//Тебе лучше сначала проверить свое снаряжение. Когда мы выйдем в море, пути назад уже не будет.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_04");	//А когда ты закончишь с делами, ты должен поспать. В капитанской каюте для тебя приготовлена кровать. Спокойной ночи.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_05");	//Тебе нужен корабль, команда из пяти человек и морская карта, чтобы я мог ориентироваться по ней.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_06");	//Мы не сможем поднять паруса, пока у нас не будет всего необходимого.
		AI_StopProcessInfos(self);
	};
};


instance DIA_JORGEN_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 59;
	condition = dia_jorgen_perm5_notcaptain_condition;
	information = dia_jorgen_perm5_notcaptain_info;
	permanent = TRUE;
	description = "Как ты?";
};


func int dia_jorgen_perm5_notcaptain_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_bemycaptain2) && (SCGOTCAPTAIN == TRUE) && (JORGENISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};


var int dia_jorgen_perm5_notcaptain_xpgiven;

func void dia_jorgen_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM5_NOTCAPTAIN_15_00");	//Как ты?
	if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06") < 1000)
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_01");	//Отлично. Это не самое плохое место.
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_02");	//Они дают мне идиотские поручения, типа пасти овец, но все же люде здесь далеко не такие ограниченные и тупые, как в монастыре.
		if(DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN = TRUE;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_03");	//Мне нужно поискать для себя другое место. Посмотрим, куда еще меня занесет попутным ветром.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_JORGEN_KAP6_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap6_exit_condition;
	information = dia_jorgen_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

