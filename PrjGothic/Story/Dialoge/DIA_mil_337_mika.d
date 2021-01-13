
instance DIA_MIKA_EXIT(C_INFO)
{
	npc = mil_337_mika;
	nr = 999;
	condition = dia_mika_exit_condition;
	information = dia_mika_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mika_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_mika_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_REFUSE(C_INFO)
{
	npc = mil_337_mika;
	nr = 1;
	condition = dia_mika_refuse_condition;
	information = dia_mika_refuse_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_mika_refuse_condition()
{
	if(Npc_IsInState(self,zs_talk) && (lares.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_mika_refuse_info()
{
	b_say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_WOHIN(C_INFO)
{
	npc = mil_337_mika;
	nr = 4;
	condition = dia_mika_wohin_condition;
	information = dia_mika_wohin_info;
	important = TRUE;
};


func int dia_mika_wohin_condition()
{
	if(lares.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_mika_wohin_info()
{
	AI_Output(self,other,"DIA_Mika_WOHIN_12_00");	//Эй, эй! Не так быстро. Прогуливаться здесь одному довольно опасно. Откуда ты идешь?
	Info_ClearChoices(dia_mika_wohin);
	Info_AddChoice(dia_mika_wohin,"Это не твое дело.",dia_mika_wohin_weg);
	Info_AddChoice(dia_mika_wohin,"С одной из ферм.",dia_mika_wohin_bauern);
	Info_AddChoice(dia_mika_wohin,"Из города!",dia_mika_wohin_stadt);
};

func void dia_mika_wohin_stadt()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_stadt_15_00");	//Из города!
	AI_Output(self,other,"DIA_Mika_WOHIN_stadt_12_01");	//Так, так. Тогда что ты делаешь тут, так далеко от его защитных стен?
	Info_ClearChoices(dia_mika_wohin);
};

func void dia_mika_wohin_bauern()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_Bauern_15_00");	//С одной из ферм.
	AI_Output(self,other,"DIA_Mika_WOHIN_Bauern_12_01");	//Ты фермер, да? Хмм. Тогда тебе не стоит бродить по этим опасным тропам совсем одному. Кто знает, кто там может поджидать тебя.
	Info_ClearChoices(dia_mika_wohin);
};

func void dia_mika_wohin_weg()
{
	AI_Output(other,self,"DIA_Mika_WOHIN_weg_15_00");	//Это не твое дело.
	AI_Output(self,other,"DIA_Mika_WOHIN_weg_12_01");	//Как знаешь. Но не плачь потом, если кто-то снимет с тебя шкуру. Удачной прогулки.
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_WASGEFAEHRLICH(C_INFO)
{
	npc = mil_337_mika;
	nr = 5;
	condition = dia_mika_wasgefaehrlich_condition;
	information = dia_mika_wasgefaehrlich_info;
	description = "А что такого опасного здесь?";
};


func int dia_mika_wasgefaehrlich_condition()
{
	return TRUE;
};

func void dia_mika_wasgefaehrlich_info()
{
	AI_Output(other,self,"DIA_Mika_WASGEFAEHRLICH_15_00");	//А что такого опасного здесь?
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_01");	//Много чего.
	if(other.protection[PROT_EDGE] < 25)
	{
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_02");	//Ну, например, бандиты. Они только и ждут, когда к ним в лапы попадет кто-нибудь вроде тебя.
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_03");	//А если тебя не поймают бандиты, то дикие животные из леса или наемники, которые шляются вокруг, позаботятся о тебе.
		AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_04");	//Так что постарайся сначала хотя бы добыть приличные доспехи. Без них тут нечего делать.
	};
	AI_Output(self,other,"DIA_Mika_WASGEFAEHRLICH_12_05");	//Я уверен, что ты прибежишь за помощью ко мне, не успев даже дойти до следующего поворота этой дороги.
};


instance DIA_MIKA_WASKOSTETHILFE(C_INFO)
{
	npc = mil_337_mika;
	nr = 6;
	condition = dia_mika_waskostethilfe_condition;
	information = dia_mika_waskostethilfe_info;
	description = "Ну, предположим, я обращусь к тебе за помощью.";
};


func int dia_mika_waskostethilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_mika_wasgefaehrlich))
	{
		return TRUE;
	};
};

func void dia_mika_waskostethilfe_info()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_15_00");	//Ну, предположим, я обращусь к тебе за помощью. Сколько это будет мне стоить?
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_01");	//Я все го лишь скромный слуга короля и мне не к лицу обдирать беззащитных граждан нашего королевства.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_02");	//Но, знаешь, если уж ты так ставишь вопрос, то я бы не отказался от небольшой финансовой помощи. Это укрепит наши будущие деловые отношения.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_12_03");	//10 золотых будет достаточно для начала. Что скажешь?
	Info_ClearChoices(dia_mika_waskostethilfe);
	Info_AddChoice(dia_mika_waskostethilfe,"Я подумаю над этим.",dia_mika_waskostethilfe_nochnicht);
	Info_AddChoice(dia_mika_waskostethilfe,"Почему бы и нет? Вот твои 10 монет.",dia_mika_waskostethilfe_ja);
};

func void dia_mika_waskostethilfe_ja()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_ja_15_00");	//Почему бы и нет? Вот твои 10 монет.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_01");	//Потрясающе. Если тебе понадобится моя помощь, ты знаешь, где найти меня.
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_02");	//Но будь так любезен, не отвлекая меня по всяким пустякам. Я не выношу этого, ты слышишь?
		MIKA_HELPS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_ja_12_03");	//У тебя нет денег. Но, возможно, они у тебя найдутся, когда тебе действительно понадобится моя помощь.
	};
	AI_StopProcessInfos(self);
};

func void dia_mika_waskostethilfe_nochnicht()
{
	AI_Output(other,self,"DIA_Mika_WASKOSTETHILFE_nochnicht_15_00");	//Я подумаю над этим.
	AI_Output(self,other,"DIA_Mika_WASKOSTETHILFE_nochnicht_12_01");	//Как знаешь. Желаю удачно погибнуть.
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_UEBERLEGT(C_INFO)
{
	npc = mil_337_mika;
	nr = 7;
	condition = dia_mika_ueberlegt_condition;
	information = dia_mika_ueberlegt_info;
	permanent = TRUE;
	description = "Я передумал. Я заплачу тебе 10 золотых.";
};


func int dia_mika_ueberlegt_condition()
{
	if(Npc_KnowsInfo(other,dia_mika_waskostethilfe) && (MIKA_HELPS == FALSE))
	{
		return TRUE;
	};
};

func void dia_mika_ueberlegt_info()
{
	AI_Output(other,self,"DIA_Mika_UEBERLEGT_15_00");	//Я передумал. Я заплачу тебе 10 золотых.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_01");	//Превосходно. Лучше поздно, чем никогда. И что теперь?
		MIKA_HELPS = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Mika_UEBERLEGT_12_02");	//(сердито) Возвращайся, когда у тебя будут деньги.
		AI_StopProcessInfos(self);
	};
};


instance DIA_MIKA_HILFE(C_INFO)
{
	npc = mil_337_mika;
	nr = 8;
	condition = dia_mika_hilfe_condition;
	information = dia_mika_hilfe_info;
	permanent = TRUE;
	description = "Мне нужна твоя помощь.";
};


func int dia_mika_hilfe_condition()
{
	if(MIKA_HELPS == TRUE)
	{
		return TRUE;
	};
};

func void dia_mika_hilfe_info()
{
	AI_Output(other,self,"DIA_Mika_HILFE_15_00");	//Мне нужна твоя помощь.
	AI_Output(self,other,"DIA_Mika_HILFE_12_01");	//Если это так необходимо... Что случилось?
	Info_ClearChoices(dia_mika_hilfe);
	Info_AddChoice(dia_mika_hilfe,"Меня преследуют бандиты.",dia_mika_hilfe_schongut);
	Info_AddChoice(dia_mika_hilfe,"На меня напали монстры.",dia_mika_hilfe_monster);
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && ((AKILS_SLDSTILLTHERE == TRUE) || Npc_KnowsInfo(other,dia_sarah_bauern)))
	{
		Info_AddChoice(dia_mika_hilfe,"На фермера Акила напали наемники.",dia_mika_hilfe_akil);
	};
};

func void dia_mika_hilfe_akil()
{
	AI_Output(other,self,"DIA_Mika_HILFE_Akil_15_00");	//На фермера Акила напали наемники.
	AI_Output(self,other,"DIA_Mika_HILFE_Akil_12_01");	//(возбужденно) Что? Этот сброд ошивается вокруг фермы Акила? Тогда не будем терять времени попусту. Идем за мной.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"Мика хочет помочь мне решить проблему с наемниками на ферме Акила.");
	Npc_ExchangeRoutine(self,"Akil");
};

func void dia_mika_hilfe_monster()
{
	AI_Output(other,self,"DIA_Mika_HILFE_monster_15_00");	//На меня напали монстры.
	AI_Output(self,other,"DIA_Mika_HILFE_monster_12_01");	//Но я не вижу никаких монстров. Я думаю, тебе померещилось.
	AI_StopProcessInfos(self);
};

func void dia_mika_hilfe_schongut()
{
	AI_Output(other,self,"DIA_Mika_HILFE_schongut_15_00");	//Меня преследуют бандиты.
	AI_Output(self,other,"DIA_Mika_HILFE_schongut_12_01");	//Да ну? И где же они? Если бы за тобой гнались, я бы видел хотя бы одного из них, правильно?
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_ZACK(C_INFO)
{
	npc = mil_337_mika;
	nr = 8;
	condition = dia_mika_zack_condition;
	information = dia_mika_zack_info;
	important = TRUE;
};


func int dia_mika_zack_condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 500) && (!Npc_IsDead(alvares) || !Npc_IsDead(engardo)))
	{
		return TRUE;
	};
};

func void dia_mika_zack_info()
{
	AI_Output(self,other,"DIA_Mika_Zack_12_00");	//Теперь смотри, как это делается.
	Info_AddChoice(dia_mika_zack,DIALOG_ENDE,dia_mika_zack_los);
};

func void dia_mika_zack_los()
{
	AI_StopProcessInfos(self);
	if(!Npc_IsDead(alvares))
	{
		alvares.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
	if(!Npc_IsDead(engardo))
	{
		engardo.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	};
};


instance DIA_MIKA_WIEDERNACHHAUSE(C_INFO)
{
	npc = mil_337_mika;
	nr = 9;
	condition = dia_mika_wiedernachhause_condition;
	information = dia_mika_wiedernachhause_info;
	important = TRUE;
};


func int dia_mika_wiedernachhause_condition()
{
	if((Npc_GetDistToWP(self,"NW_FARM2_PATH_03") < 10000) && Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_mika_wiedernachhause_info()
{
	AI_Output(self,other,"DIA_Mika_WIEDERNACHHAUSE_12_00");	//Вот и все. Я могу возвращаться назад.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_MIKA_KAP3_EXIT(C_INFO)
{
	npc = mil_337_mika;
	nr = 999;
	condition = dia_mika_kap3_exit_condition;
	information = dia_mika_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mika_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_mika_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIKA_KAP3U4U5_PERM(C_INFO)
{
	npc = mil_337_mika;
	nr = 39;
	condition = dia_mika_kap3u4u5_perm_condition;
	information = dia_mika_kap3u4u5_perm_info;
	permanent = TRUE;
	description = "Все тихо?";
};


func int dia_mika_kap3u4u5_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_mika_wohin) && Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_mika_kap3u4u5_perm_info()
{
	AI_Output(other,self,"DIA_Mika_Kap3u4u5_PERM_15_00");	//Все тихо?
	AI_Output(self,other,"DIA_Mika_Kap3u4u5_PERM_12_01");	//Ты все еще жив? Надо же!
};


instance DIA_MIKA_PICKPOCKET(C_INFO)
{
	npc = mil_337_mika;
	nr = 900;
	condition = dia_mika_pickpocket_condition;
	information = dia_mika_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_mika_pickpocket_condition()
{
	return c_beklauen(65,75);
};

func void dia_mika_pickpocket_info()
{
	Info_ClearChoices(dia_mika_pickpocket);
	Info_AddChoice(dia_mika_pickpocket,DIALOG_BACK,dia_mika_pickpocket_back);
	Info_AddChoice(dia_mika_pickpocket,DIALOG_PICKPOCKET,dia_mika_pickpocket_doit);
};

func void dia_mika_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mika_pickpocket);
};

func void dia_mika_pickpocket_back()
{
	Info_ClearChoices(dia_mika_pickpocket);
};

