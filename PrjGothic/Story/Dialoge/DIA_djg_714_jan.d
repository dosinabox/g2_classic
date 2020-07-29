
instance DIA_JAN_EXIT(C_INFO)
{
	npc = djg_714_jan;
	nr = 999;
	condition = dia_jan_exit_condition;
	information = dia_jan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jan_exit_condition()
{
	return TRUE;
};

func void dia_jan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JAN_HELLO(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_hello_condition;
	information = dia_jan_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jan_hello_condition()
{
	if((KAPITEL >= 4) && Npc_IsInState(self,zs_talk) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_hello_info()
{
	AI_Output(self,other,"DIA_Jan_Hello_10_00");	//И какой идиот затащил меня сюда?!
	AI_Output(self,other,"DIA_Jan_Hello_10_01");	//Я думал, здесь для меня действительно найдется настоящая работа. Но здесь ничего нет кроме нескольких высокомерных паладинов и банды орков.
};


instance DIA_JAN_DRAGONS(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_dragons_condition;
	information = dia_jan_dragons_info;
	permanent = FALSE;
	description = "Ты забыл о драконах!";
};


func int dia_jan_dragons_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (MIS_JANBECOMESSMITH == FALSE) && (KAPITEL == 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_dragons_info()
{
	AI_Output(other,self,"DIA_Jan_Dragons_15_00");	//Ты забыл о драконах!
	AI_Output(self,other,"DIA_Jan_Dragons_10_01");	//(с издевкой) Как же я мог забыть?! Знаешь что? Я кузнец, а не воин.
	AI_Output(self,other,"DIA_Jan_Dragons_10_02");	//Я делаю оружие. А сражаются им путь другие.
	AI_Output(other,self,"DIA_Jan_Dragons_15_03");	//Тогда почему ты не стоишь за этой наковальней?
	AI_Output(self,other,"DIA_Jan_Dragons_10_04");	//Паладины не подпускают меня к кузнице. Если я подойду к ней, меня бросят за решетку.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_Dragons_10_05");	//Ты ведь один из них. Может, замолвишь за меня словечко?
	};
	Info_ClearChoices(dia_jan_dragons);
	Info_AddChoice(dia_jan_dragons,"Мне нужно идти.",dia_jan_dragons_shithappen);
	Info_AddChoice(dia_jan_dragons,"И что я получу за то, что помогу тебе?",dia_jan_dragons_reward);
	Info_AddChoice(dia_jan_dragons,"Я попробую помочь тебе.",dia_jan_dragons_helpyou);
};

func void dia_jan_dragons_helpyou()
{
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_00");	//Я попробую помочь тебе.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_01");	//Как тебе это удастся? Парсиваль приказал страже ни к чему нас не подпускать.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_02");	//Никто не осмелится нарушить его.
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_03");	//Я сделаю все, что смогу.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_04");	//Представить себе не могу, что он послушает тебя.
	Log_CreateTopic(TOPIC_JANBECOMESSMITH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JANBECOMESSMITH,LOG_RUNNING);
	b_logentry(TOPIC_JANBECOMESSMITH,"Охотник на драконов Ян, находящийся в замке Долины рудников, хочет работать в кузнице. Но Парсиваль запрещает ему это.");
	MIS_JANBECOMESSMITH = LOG_RUNNING;
	Info_ClearChoices(dia_jan_dragons);
};

func void dia_jan_dragons_reward()
{
	AI_Output(other,self,"DIA_JAN_Dragons_Reward_15_00");	//А что мне будет, если я помогу тебе?
	AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_01");	//У меня ничего нет. Единственно, я могу научить тебя чему-нибудь.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_02");	//Я знаю способ, как сделать клинок, выкованный из магической руды, еще прочнее.
	};
	JAN_TEACHPLAYER = TRUE;
};

func void dia_jan_dragons_shithappen()
{
	AI_Output(other,self,"DIA_JAN_Dragons_ShitHappen_15_00");	//Мне нужно идти.
	AI_Output(self,other,"DIA_JAN_Dragons_ShitHappen_10_01");	//Все просто ужасно. Я не могу покинуть этот замок и не могу работать в кузнице.
	Info_ClearChoices(dia_jan_dragons);
};


instance DIA_JAN_HOME(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_home_condition;
	information = dia_jan_home_info;
	permanent = FALSE;
	description = "Откуда ты?";
};


func int dia_jan_home_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (KAPITEL >= 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_home_info()
{
	AI_Output(other,self,"DIA_Jan_Home_15_00");	//Откуда ты пришел?
	AI_Output(self,other,"DIA_Jan_Home_10_01");	//Я присоединился к парням с гор. И мы направились в эту долину, чтобы разбогатеть, охотясь на драконов.
	AI_Output(self,other,"DIA_Jan_Home_10_02");	//Их главаря звали Сильвио. Такая сволочь! Он обращался со мной как со своей собственностью.
};


instance DIA_JAN_OLDCAMP(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_oldcamp_condition;
	information = dia_jan_oldcamp_info;
	permanent = TRUE;
	description = "Что произошло в замке?";
};


func int dia_jan_oldcamp_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (KAPITEL == 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_oldcamp_info()
{
	AI_Output(other,self,"DIA_Jan_OldCamp_15_00");	//А что произошло в замке?
	AI_Output(self,other,"DIA_Jan_OldCamp_10_01");	//Ничего, насколько я слышал. Но, конечно, меня очень волнует, что произошло ВНЕ замка.
};


instance DIA_JAN_PARCIVAL(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_parcival_condition;
	information = dia_jan_parcival_info;
	permanent = FALSE;
	description = "Я поговорил с Парсивалем.";
};


func int dia_jan_parcival_condition()
{
	if((MIS_JANBECOMESSMITH != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_parcival_info()
{
	AI_Output(other,self,"DIA_Jan_Parcival_15_00");	//Я поговорил с Парсивалем.
	AI_Output(self,other,"DIA_Jan_Parcival_10_01");	//И?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_02");	//Он не доверяет нам, охотникам на драконов.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_03");	//Он не доверяет вам, охотникам на драконов.
	};
	AI_Output(self,other,"DIA_Jan_Parcival_10_04");	//Черт. Я так хочу работать.
	AI_Output(self,other,"DIA_Jan_Parcival_10_05");	//Что ж, видимо, придется смириться. Только Гаронд может помочь мне теперь.
};


instance DIA_JAN_JANISSMITH(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_janissmith_condition;
	information = dia_jan_janissmith_info;
	permanent = FALSE;
	description = "Берись за молот, для тебя есть работа.";
};


func int dia_jan_janissmith_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_janissmith_info()
{
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_00");	//Берись за молот, для тебя есть работа.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_01");	//Ты сделал это? Как тебе удалось?
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_02");	//Мне пришлось поручиться за тебя, так что не разочаруй меня.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_03");	//Не волнуйся. Я так рад, что опять могу работать.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SMITH");
};


instance DIA_JAN_SELLWEAPONS(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_sellweapons_condition;
	information = dia_jan_sellweapons_info;
	permanent = FALSE;
	description = "Ты продаешь оружие?";
};


func int dia_jan_sellweapons_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (JAN_TEACHPLAYER == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_sellweapons_info()
{
	AI_Output(other,self,"DIA_Jan_SellWeapons_15_00");	//Ты продаешь оружие?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_01");	//Ни за что. Чтобы потом твои собратья бросили меня в темницу за торговлю из-под полы? Нет, забудь об этом!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_02");	//Мог бы, если бы оно у меня было. Но сначала я должен обеспечить оружием паладинов в замке.
	};
	AI_Output(self,other,"DIA_Jan_SellWeapons_10_03");	//Но я могу показать тебе, как ковать хорошее оружие.
	JAN_TEACHPLAYER = TRUE;
};


instance JAN_TRAINING_TALENTE(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = jan_training_talente_condition;
	information = jan_training_talente_info;
	permanent = TRUE;
	description = "Обучи меня кузнечному делу.";
};


func int jan_training_talente_condition()
{
	if((JAN_TEACHPLAYER == TRUE) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void jan_training_talente_info()
{
	AI_Output(other,self,"DIA_Jan_TeachPlayer_15_00");	//Обучи меня кузнечному делу.
	AI_Output(self,other,"DIA_Jan_TeachPlayer_10_01");	//Что именно ты хочешь научиться ковать?
	Info_ClearChoices(jan_training_talente);
	Info_AddChoice(jan_training_talente,DIALOG_BACK,jan_training_smith_back);
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		Info_AddChoice(jan_training_talente,b_buildlearnstring("Научиться кузнечному делу",b_getlearncosttalent(other,NPC_TALENT_SMITH)),jan_training_smith_common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH)),jan_training_smith_1hspecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH)),jan_training_smith_2hspecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH)),jan_training_smith_1hspecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH)),jan_training_smith_2hspecial2);
		};
	};
};

func void jan_training_smith_back()
{
	Info_ClearChoices(jan_training_talente);
};

func void jan_training_smith_common()
{
	b_teachplayertalentsmith(self,other,WEAPON_COMMON);
};

func void jan_training_smith_1hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_01);
};

func void jan_training_smith_2hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_01);
};

func void jan_training_smith_1hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_02);
};

func void jan_training_smith_2hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_02);
};


var int dia_jan_sellarmor_permanent;

instance DIA_JAN_SELLARMOR(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_sellarmor_condition;
	information = dia_jan_sellarmor_info;
	permanent = TRUE;
	description = "Могу я купить у тебя доспехи?";
};


func int dia_jan_sellarmor_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE) && (DIA_JAN_SELLARMOR_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_sellarmor_info()
{
	AI_Output(other,self,"DIA_Jan_SellArmor_15_00");	//Могу я купить у тебя доспехи?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_01");	//Мои доспехи не идут ни в какое сравнение с теми, что у тебя сейчас есть. Забудь об этом.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_02");	//Маг, который нуждается в доспехах? Забудь об этом - тебе лучше обратиться к портному. Я не могу сделать доспехи для тебя.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_03");	//Если бы они у меня были, я бы продал их тебе. Но, к сожалению, у меня их нет.
		Info_ClearChoices(dia_jan_sellarmor);
		Info_AddChoice(dia_jan_sellarmor,"Думаю, ничего не получится.",dia_jan_sellarmor_sorry);
		Info_AddChoice(dia_jan_sellarmor,"Ты можешь изготовить что-нибудь для меня?",dia_jan_sellarmor_buildone);
	};
};

func void dia_jan_sellarmor_sorry()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_Sorry_15_00");	//Думаю, ничего не получится.
	AI_Output(self,other,"DIA_JAN_SellArmor_Sorry_10_01");	//Ну, если все же что-нибудь придумаешь, дай мне знать.
	Info_ClearChoices(dia_jan_sellarmor);
};

func void dia_jan_sellarmor_buildone()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_00");	//Ты можешь изготовить что-нибудь для меня?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_01");	//Ну, если ты хочешь что-нибудь получше, ты должен принести мне необходимые материалы.
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_02");	//А что нужно?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_03");	//Ты хочешь сражаться с драконами, да? Принеси мне драконьи чешуйки - из них я смогу собрать что-нибудь для тебя.
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_04");	//20 чешуек должно быть достаточно.
	DIA_JAN_SELLARMOR_PERMANENT = TRUE;
	Info_ClearChoices(dia_jan_sellarmor);
};


var int jan_sells_armor;

instance DIA_JAN_DRAGONSCALES(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_dragonscales_condition;
	information = dia_jan_dragonscales_info;
	permanent = TRUE;
	description = "Я принес драконьи чешуйки.";
};


func int dia_jan_dragonscales_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE) && (DIA_JAN_SELLARMOR_PERMANENT == TRUE) && (JAN_SELLS_ARMOR == FALSE) && (Npc_HasItems(other,itat_dragonscale) >= 1))
	{
		return TRUE;
	};
};

func void dia_jan_dragonscales_info()
{
	AI_Output(other,self,"DIA_JAN_Dragonscales_15_00");	//Я принес драконьи чешуйки.
	if(Npc_HasItems(other,itat_dragonscale) >= 20)
	{
		b_giveinvitems(other,self,itat_dragonscale,20);
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_01");	//Хорошо. Думаю, из этого что-нибудь получится.
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_02");	//Заходи завтра и получишь свои новые доспехи.
		JAN_SELLS_ARMOR = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_03");	//Мне нужно 20 драконьих чешуек, иначе я не смогу сделать тебе доспехи.
	};
};


var int djg_armor_is_offered;
var int dia_jan_armorready_noperm;

instance DIA_JAN_ARMORREADY(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_armorready_condition;
	information = dia_jan_armorready_info;
	permanent = TRUE;
	description = "Доспехи готовы?";
};


func int dia_jan_armorready_condition()
{
	if((MIS_OCGATEOPEN == FALSE) && (JAN_SELLS_ARMOR != FALSE) && (DIA_JAN_ARMORREADY_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_armorready_info()
{
	AI_Output(other,self,"DIA_JAN_ArmorReady_15_00");	//Доспехи готовы?
	if(JAN_SELLS_ARMOR == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_01");	//Пока еще нет. Заходи завтра.
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_02");	//Да. Это настоящее произведение искусства. Ты можешь купить их, если хочешь.
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_03");	//Для тебя особая цена. 12,000 золотых монет.
		AI_Output(other,self,"DIA_JAN_ArmorReady_15_04");	//Что!? И это после всего, что я сделал для тебя
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_05");	//Ну не надо так. Мне же тоже нужно зарабатывать на жизнь. Не хочешь, не бери.
		DJG_ARMOR_IS_OFFERED = TRUE;
		DIA_JAN_ARMORREADY_NOPERM = TRUE;
	};
};


var int jan_dia_jan_djg_armor_m_permanent;

instance DIA_JAN_DJG_ARMOR_M(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_djg_armor_m_condition;
	information = dia_jan_djg_armor_m_info;
	permanent = TRUE;
	description = "Средние доспехи охотника на драконов: Защита: оружие 80, стрелы 80. (12000 золота)";
};


func int dia_jan_djg_armor_m_condition()
{
	if((JAN_DIA_JAN_DJG_ARMOR_M_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && (DJG_ARMOR_IS_OFFERED == TRUE))
	{
		return TRUE;
	};
};

func void dia_jan_djg_armor_m_info()
{
	AI_Output(other,self,"DIA_Jan_DJG_ARMOR_M_15_00");	//Я хочу купить эти доспехи.
	if(Npc_HasItems(other,itmi_gold) >= 12000)
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_01");	//Ты увидишь, они стоят своих денег.
		b_giveinvitems(other,self,itmi_gold,12000);
		CreateInvItems(self,itar_djg_m,1);
		b_giveinvitems(self,other,itar_djg_m,1);
		JAN_DIA_JAN_DJG_ARMOR_M_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_02");	//У тебя недостаточно золота.
	};
};


instance DIA_JAN_DRAGONPLETTBERICHT(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_dragonplettbericht_condition;
	information = dia_jan_dragonplettbericht_info;
	description = "Насчет драконов...";
};


var int dia_jan_dragonplettbericht_noperm;

func int dia_jan_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_jan_dragons) && (DIA_JAN_DRAGONPLETTBERICHT_NOPERM == FALSE) && (MIS_OCGATEOPEN == FALSE) && (MIS_KILLEDDRAGONS != 0))
	{
		return TRUE;
	};
};

func void dia_jan_dragonplettbericht_info()
{
	if(MIS_KILLEDDRAGONS == 1)
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_00");	//Я убил дракона.
	}
	else if((MIS_KILLEDDRAGONS == 2) || (MIS_KILLEDDRAGONS == 3))
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_01");	//Я убил несколько драконов.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_02");	//Я убил всех драконов.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_03");	//И что? Ты ведь охотник на драконов, разве нет?
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_04");	//А ты разве нет?
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_05");	//Да, конечно, но если честно, то мне это не интересно.
	};
	AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_06");	//Я уже говорил тебе, мне больше нравится делать оружие, чем убивать драконов.
	if((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_07");	//Впрочем, есть кое-что, что может заинтересовать меня.
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_08");	//Если бы ты принес мне драконьей крови, я бы хорошо заплатил за нее.
		JAN_WANTSDRAGONBLOOD = TRUE;
	};
};


instance DIA_JAN_DRAGONBLOOD(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_dragonblood_condition;
	information = dia_jan_dragonblood_info;
	permanent = TRUE;
	description = "Я принес тебе драконью кровь.";
};


func int dia_jan_dragonblood_condition()
{
	if((JAN_WANTSDRAGONBLOOD == TRUE) && (MIS_OCGATEOPEN == FALSE) && Npc_HasItems(other,itat_dragonblood) && ((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD)))
	{
		return TRUE;
	};
};

func void dia_jan_dragonblood_info()
{
	AI_Output(other,self,"DIA_Jan_DragonBlood_15_00");	//Я принес тебе драконью кровь.
	AI_Output(self,other,"DIA_Jan_DragonBlood_10_01");	//Отлично. Приноси мне всю кровь, что найдешь.
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(Все)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(Одну пробирку)",dia_jan_dragonblood_1);
	};
};

func void dia_jan_dragonblood_back()
{
	Info_ClearChoices(dia_jan_dragonblood);
};

func void dia_jan_dragonblood_1()
{
	var int dragonbloodcount;
	var int dragonbloodgeld;
	var int xp_djg_bringdragonbloods;
	var string bloodtext;
	var string bloodleft;
	dragonbloodcount = 1;
	b_giveinvitems(other,self,itat_dragonblood,dragonbloodcount);
	xp_djg_bringdragonbloods = dragonbloodcount * XP_AMBIENTKAP4;
	b_giveplayerxp(xp_djg_bringdragonbloods);
	dragonbloodgeld = dragonbloodcount * VALUE_DRAGONBLOOD;
	CreateInvItems(self,itmi_gold,dragonbloodgeld);
	b_giveinvitems(self,other,itmi_gold,dragonbloodgeld);
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(Все)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(Одну пробирку)",dia_jan_dragonblood_1);
	};
	bloodleft = IntToString(Npc_HasItems(other,itat_dragonblood));
	bloodtext = ConcatStrings(bloodleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(bloodtext,-1,-1,FONT_SCREENSMALL,3);
};

func void dia_jan_dragonblood_all()
{
	var int dragonbloodcount;
	var int dragonbloodgeld;
	var int xp_djg_bringdragonbloods;
	var string bloodtext;
	var string bloodleft;
	dragonbloodcount = Npc_HasItems(other,itat_dragonblood);
	b_giveinvitems(other,self,itat_dragonblood,dragonbloodcount);
	xp_djg_bringdragonbloods = dragonbloodcount * XP_AMBIENTKAP4;
	b_giveplayerxp(xp_djg_bringdragonbloods);
	dragonbloodgeld = dragonbloodcount * VALUE_DRAGONBLOOD;
	CreateInvItems(self,itmi_gold,dragonbloodgeld);
	b_giveinvitems(self,other,itmi_gold,dragonbloodgeld);
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(Все)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(Одну пробирку)",dia_jan_dragonblood_1);
	};
	bloodleft = IntToString(Npc_HasItems(other,itat_dragonblood));
	bloodtext = ConcatStrings(bloodleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(bloodtext,-1,-1,FONT_SCREENSMALL,3);
};


instance DIA_JAN_NACHOCGATEOPEN(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_nachocgateopen_condition;
	information = dia_jan_nachocgateopen_info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int dia_jan_nachocgateopen_condition()
{
	if(MIS_OCGATEOPEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_jan_nachocgateopen_info()
{
	AI_Output(other,self,"DIA_Jan_NACHOCGATEOPEN_15_00");	//Все в порядке?
	AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_01");	//Абсолютно ничего не ясно!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_02");	//Зачем эти идиоты открыли ворота? Вы, паладины, ни на что не годитесь!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_03");	//Они вот так вот просто взяли и открыли ворота. Идиоты! Мне такое не понять.
	};
	AI_StopProcessInfos(self);
};


instance DIA_JAN_PICKPOCKET(C_INFO)
{
	npc = djg_714_jan;
	nr = 900;
	condition = dia_jan_pickpocket_condition;
	information = dia_jan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_jan_pickpocket_condition()
{
	return c_beklauen(37,95);
};

func void dia_jan_pickpocket_info()
{
	Info_ClearChoices(dia_jan_pickpocket);
	Info_AddChoice(dia_jan_pickpocket,DIALOG_BACK,dia_jan_pickpocket_back);
	Info_AddChoice(dia_jan_pickpocket,DIALOG_PICKPOCKET,dia_jan_pickpocket_doit);
};

func void dia_jan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jan_pickpocket);
};

func void dia_jan_pickpocket_back()
{
	Info_ClearChoices(dia_jan_pickpocket);
};

