
instance DIA_MALETH_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_exit_condition;
	information = dia_maleth_exit_info;
	permanent = TRUE;
	description = "Мне нужно идти!";
};


func int dia_maleth_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_maleth_exit_info()
{
	AI_StopProcessInfos(self);
	if(MALETH_ERSTERWOLF == FALSE)
	{
		Wld_InsertNpc(ywolf,"NW_FARM1_PATH_CITY_SHEEP_06");
		MALETH_ERSTERWOLF = TRUE;
	};
};


instance DIA_MALETH_HALLO(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_hallo_condition;
	information = dia_maleth_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_maleth_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_maleth_hallo_info()
{
	AI_Output(self,other,"DIA_Maleth_Hallo_08_00");	//Привет, чужеземец!
	if(hero.guild == GIL_NONE)
	{
		if(Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_01");	//Я видел, как ты спустился с гор.
		};
		AI_Output(self,other,"DIA_Maleth_Hallo_08_02");	//Тебе повезло, что ты не пришел три недели назад.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_03");	//Мы бы приняли тебя за беглого каторжника. А с ними у нас разговор короткий!
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_04");	//Ты выглядишь абсолютно измотанным.
		}
		else
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_05");	//Ты выглядел абсолютно измотанным, когда первый раз появился здесь.
			AI_Output(self,other,"DIA_Maleth_Hallo_08_06");	//Ну а теперь ты похож на человека!
		};
	};
	AI_Output(self,other,"DIA_Maleth_Hallo_08_07");	//(недоверчиво) Что тебе нужно здесь?
};


instance DIA_MALETH_BANDITS(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_bandits_condition;
	information = dia_maleth_bandits_info;
	permanent = FALSE;
	description = "На меня напали бандиты в горах.";
};


func int dia_maleth_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_bdt_1013_bandit_where) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_bandits_info()
{
	AI_Output(other,self,"DIA_Maleth_BANDITS_15_00");	//На меня напали бандиты в горах.
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_01");	//Вот мерзкое отродье! Это, вероятно, те же ублюдки, что увели у нас овцу прошлой ночью!
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_02");	//Тебе еще очень повезло. Редко кому удается уйти от них живым.
};


instance DIA_MALETH_BANDITSDEAD(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsdead_condition;
	information = dia_maleth_banditsdead_info;
	permanent = FALSE;
	description = "Эти бандиты больше не будут беспокоить вас...";
};


func int dia_maleth_banditsdead_condition()
{
	var C_NPC b13;
	var C_NPC b14;
	var C_NPC b15;
	b13 = Hlp_GetNpc(bdt_1013_bandit_l);
	b14 = Hlp_GetNpc(bdt_1014_bandit_l);
	b15 = Hlp_GetNpc(bdt_1015_bandit_l);
	if((Npc_IsDead(b13) || Npc_KnowsInfo(other,dia_1013_bandit_frommaleth)) && Npc_IsDead(b14) && Npc_IsDead(b15) && Npc_KnowsInfo(other,dia_maleth_bandits))
	{
		return TRUE;
	};
};

func void dia_maleth_banditsdead_info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_00");	//Эти бандиты больше не будут беспокоить вас...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_01");	//Почему? Они мертвы?
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_02");	//Они не на того напали...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_03");	//Слава Инносу! Вот - здесь немного, но я хочу, чтобы ты принял это!
	b_giveinvitems(self,other,itfo_wine,3);
	MIS_MALETH_BANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_MALETHKILLBANDITS);
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_04");	//Я расскажу остальным об этом!
};


instance DIA_MALETH_BANDITSALIVE(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsalive_condition;
	information = dia_maleth_banditsalive_info;
	permanent = FALSE;
	description = "Я знаю, где прячутся эти бандиты...";
};


func int dia_maleth_banditsalive_condition()
{
	var C_NPC b13;
	var C_NPC b14;
	var C_NPC b15;
	b13 = Hlp_GetNpc(bdt_1013_bandit_l);
	b14 = Hlp_GetNpc(bdt_1014_bandit_l);
	b15 = Hlp_GetNpc(bdt_1015_bandit_l);
	if((!Npc_IsDead(b13) || !Npc_IsDead(b14) || !Npc_IsDead(b15)) && Npc_KnowsInfo(other,dia_maleth_bandits) && (MIS_MALETH_BANDITS != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_maleth_banditsalive_info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsALIVE_15_00");	//Я знаю, где прячутся эти бандиты...
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_01");	//Ты хочешь напасть на них? Я в такие игры не играю! Это слишком опасно!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_02");	//Кроме того, мне нужно присматривать за овцами!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_03");	//Но если ты думаешь, что можешь избавить нас от этих подонков, все на этой ферме будут очень благодарны тебе.
	MIS_MALETH_BANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MALETH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETH,LOG_RUNNING);
	b_logentry(TOPIC_MALETH,"Если я уничтожу бандитов, поселившихся на полпути от башни Ксардаса к ферме Лобарта, все обитатели фермы будут очень благодарны мне.");
};


instance DIA_MALETH_TOTHECITY(C_INFO)
{
	npc = bau_954_maleth;
	nr = 2;
	condition = dia_maleth_tothecity_condition;
	information = dia_maleth_tothecity_info;
	permanent = FALSE;
	description = "Я иду в город.";
};


func int dia_maleth_tothecity_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_hallo) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_tothecity_info()
{
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_00");	//Я иду в город.
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_01");	//Учитывая то, как ты выглядишь, тебе придется подкупить стражу, чтобы попасть в город.
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_02");	//И ты должен знать, что они хотят услышать.
	}
	else
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_03");	//Они могут впустить тебя - если ты скажешь им то, что они хотят услышать...
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_04");	//И что это?
	AI_Output(self,other,"DIA_Maleth_ToTheCity_08_05");	//Ну, например, что ты с фермы Лобарта и идешь к городскому кузнецу.
	Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
	b_logentry(TOPIC_CITY,"Чтобы попасть в город, я могу сказать стражникам у ворот, что я иду с фермы Лобарта и хочу повидать кузнеца.");
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_06");	//Но это тебе не поможет. Ты не похож на фермера.
		b_logentry(TOPIC_CITY,"Конечно, я должен быть похож на фермера.");
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_07");	//Понятно.
};


instance DIA_MALETH_EQUIPMENT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 3;
	condition = dia_maleth_equipment_condition;
	information = dia_maleth_equipment_info;
	permanent = FALSE;
	description = "Мне нужно снаряжение!";
};


func int dia_maleth_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_hallo) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_equipment_info()
{
	AI_Output(other,self,"DIA_Maleth_Equipment_15_00");	//Мне нужно снаряжение!
	AI_Output(self,other,"DIA_Maleth_Equipment_08_01");	//Могу представить. Но я честно скажу тебе: у нас нет ничего, чем мы могли бы поделиться!
	if(!Npc_IsDead(lobart))
	{
		AI_Output(self,other,"DIA_Maleth_Equipment_08_02");	//Хотя, если ты можешь заплатить, Лобарт продаст тебе кое-что.
		AI_Output(self,other,"DIA_Maleth_Equipment_08_03");	//Ну, или ты можешь пойти к нему и спросить, нет ли у него какой-нибудь работы.
	};
};


instance DIA_MALETH_LOBART(C_INFO)
{
	npc = bau_954_maleth;
	nr = 3;
	condition = dia_maleth_lobart_condition;
	information = dia_maleth_lobart_info;
	permanent = FALSE;
	description = "Где мне найти Лобарта?";
};


func int dia_maleth_lobart_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_equipment) && !Npc_IsDead(lobart) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_lobart_info()
{
	AI_Output(other,self,"DIA_Maleth_LOBART_15_00");	//Где мне найти Лобарта?
	AI_Output(self,other,"DIA_Maleth_LOBART_08_01");	//На ферме, конечно же! Это ведь его ферма!
	AI_Output(self,other,"DIA_Maleth_LOBART_08_02");	//И не пытайся надуть его! Он избил и вышвырнул с фермы уже много бездельников.
};


instance DIA_MALETH_KAP3_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap3_exit_condition;
	information = dia_maleth_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_maleth_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_PROBLEME(C_INFO)
{
	npc = bau_954_maleth;
	nr = 30;
	condition = dia_maleth_probleme_condition;
	information = dia_maleth_probleme_info;
	description = "Ничего нового в последнее время?";
};


func int dia_maleth_probleme_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_maleth_probleme_info()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_15_00");	//Ничего нового в последнее время?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_01");	//Просто иди по дороге в город.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_02");	//Если ты увидишь человека в черной рясе, ты поймешь, что нового.
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"Как твои овцы?",dia_maleth_probleme_schafe);
	Info_AddChoice(dia_maleth_probleme,"Люди в черных рясах к вам еще не наведывались?",dia_maleth_probleme_beidir);
};

func void dia_maleth_probleme_beidir()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_beidir_15_00");	//Люди в черных рясах к вам еще не наведывались?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_beidir_08_01");	//Да. Они были здесь несколько дней назад. Они выглядят так, как будто восстали из ада.
};

func void dia_maleth_probleme_schafe()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_15_00");	//Как твои овцы?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_08_01");	//(зло) Как будто это тебя интересует. У тебя свои проблемы.
	Info_AddChoice(dia_maleth_probleme,"Мои проблемы? Да что ты знаешь об этом?",dia_maleth_probleme_schafe_probleme);
};

func void dia_maleth_probleme_schafe_probleme()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_15_00");	//Мои проблемы? Да что ты знаешь об этом?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_01");	//(резко) Ты служишь в городской страже или нет? Тогда сделай что-нибудь с этими ублюдками в черных рясах.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_02");	//(зло) Вы, грязные наемники, думаете только об одном: как переложить деньги других людей в свои карманы.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_03");	//Вы, могущественные маги из монастыря, должны что-нибудь сделать с этими парнями в черных рясах.
	};
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"Эй, полегче на поворотах, приятель.",dia_maleth_probleme_schafe_probleme_drohen);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(dia_maleth_probleme,"В чем твоя проблема?",dia_maleth_probleme_schafe_probleme_geldher_auftrag);
	};
};

func void dia_maleth_probleme_schafe_probleme_geldher_auftrag()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00");	//Что у тебя за проблемы?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01");	//Всему виной это самодельное пойло, что Вино всучил мне несколько недель назад.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02");	//Я ничего не помню. Я знаю только, что мой посох с тех пор пропал.
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03");	//И из-за этого ты так шумишь?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04");	//Тебе легко говорить, это же не твой посох пропал.
	Log_CreateTopic(TOPIC_MALETHSGEHSTOCK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETHSGEHSTOCK,LOG_RUNNING);
	b_logentry(TOPIC_MALETHSGEHSTOCK,"Малет напился в стельку и потерял свой посох. Насколько я знаю его, он никогда не уходил далеко от фермы Лобарта. Возможно, я найду ее где-нибудь неподалеку.");
	Info_ClearChoices(dia_maleth_probleme);
};

func void dia_maleth_probleme_schafe_probleme_drohen()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00");	//Эй, полегче на поворотах, приятель.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01");	//Ты только и можешь, что болтать. Лучше всего тебе уйти.
};

func void dia_maleth_probleme_back()
{
	Info_ClearChoices(dia_maleth_probleme);
};


instance DIA_MALETH_GEHSTOCK(C_INFO)
{
	npc = bau_954_maleth;
	nr = 33;
	condition = dia_maleth_gehstock_condition;
	information = dia_maleth_gehstock_info;
	description = "Я думаю, это твой посох.";
};


func int dia_maleth_gehstock_condition()
{
	if(Npc_HasItems(other,itmw_malethsgehstock_mis) && Npc_KnowsInfo(other,dia_maleth_probleme))
	{
		return TRUE;
	};
};

func void dia_maleth_gehstock_info()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_00");	//Я думаю, это твой посох.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_01");	//Это невероятно! Я...
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_02");	//Минуточку. Сначала заплати за него.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_03");	//Но... у меня почти ничего нет.
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_04");	//Тогда придумай что-нибудь еще.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_05");	//Хорошо. Как насчет этого? Вчера я видел, как мимо пробежали бандиты с несколькими мешками золота.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_06");	//Если я скажу тебе, где они прячут свои сокровища, я получу мой посох назад?
	TOPIC_END_MALETHSGEHSTOCK = TRUE;
	b_giveplayerxp(XP_FOUNDMALETHSGEHSTOCK);
	Info_ClearChoices(dia_maleth_gehstock);
	Info_AddChoice(dia_maleth_gehstock,"Извини, мне это не интересно. Я хочу получить золото от тебя.",dia_maleth_gehstock_gold);
	Info_AddChoice(dia_maleth_gehstock,"Хорошо.",dia_maleth_gehstock_ok);
};

func void dia_maleth_gehstock_ok()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_ok_15_00");	//Хорошо.
	b_giveinvitems(other,self,itmw_malethsgehstock_mis,1);
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_01");	//Ладно. Просто иди на запад, вон к тому лесу. Там ты увидишь ущелье.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_02");	//В пещере внизу ты наверняка найдешь что-нибудь.
	b_logentry(TOPIC_MALETHSGEHSTOCK,"Малет рассказал мне, что в лесу, к западу от фермы Лобарта, находится большой лагерь бандитов.");
	CreateInvItems(bdt_1024_malethsbandit,itmi_malethsbanditgold,1);
	Info_ClearChoices(dia_maleth_gehstock);
	AI_StopProcessInfos(self);
};

func void dia_maleth_gehstock_gold()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_gold_15_00");	//Извини, мне это не интересно. Я хочу получить золото от тебя.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_gold_08_01");	//Вот все, что у меня есть. Этого должно быть достаточно.
	CreateInvItems(self,itmi_gold,35);
	b_giveinvitems(self,other,itmi_gold,35);
	b_giveinvitems(other,self,itmw_malethsgehstock_mis,1);
	Info_ClearChoices(dia_maleth_gehstock);
};


instance DIA_MALETH_PERM3(C_INFO)
{
	npc = bau_954_maleth;
	nr = 33;
	condition = dia_maleth_perm3_condition;
	information = dia_maleth_perm3_info;
	permanent = TRUE;
	description = "Смотри, не перетрудись.";
};


func int dia_maleth_perm3_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_probleme) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_maleth_perm3_info()
{
	AI_Output(other,self,"DIA_Maleth_PERM3_15_00");	//Смотри, не перетрудись.
	AI_Output(self,other,"DIA_Maleth_PERM3_08_01");	//(сердито) Проваливай.
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP4_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap4_exit_condition;
	information = dia_maleth_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_maleth_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP5_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap5_exit_condition;
	information = dia_maleth_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_maleth_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP6_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap6_exit_condition;
	information = dia_maleth_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_maleth_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_PICKPOCKET(C_INFO)
{
	npc = bau_954_maleth;
	nr = 900;
	condition = dia_maleth_pickpocket_condition;
	information = dia_maleth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_maleth_pickpocket_condition()
{
	return c_beklauen(10,10);
};

func void dia_maleth_pickpocket_info()
{
	Info_ClearChoices(dia_maleth_pickpocket);
	Info_AddChoice(dia_maleth_pickpocket,DIALOG_BACK,dia_maleth_pickpocket_back);
	Info_AddChoice(dia_maleth_pickpocket,DIALOG_PICKPOCKET,dia_maleth_pickpocket_doit);
};

func void dia_maleth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_maleth_pickpocket);
};

func void dia_maleth_pickpocket_back()
{
	Info_ClearChoices(dia_maleth_pickpocket);
};

