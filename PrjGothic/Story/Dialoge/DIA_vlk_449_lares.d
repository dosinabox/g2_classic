
instance DIA_LARES_KAP1_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap1_exit_condition;
	information = dia_lares_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_lares_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_PICKPOCKET(C_INFO)
{
	npc = vlk_449_lares;
	nr = 900;
	condition = dia_lares_pickpocket_condition;
	information = dia_lares_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_lares_pickpocket_condition()
{
	return c_beklauen(95,350);
};

func void dia_lares_pickpocket_info()
{
	Info_ClearChoices(dia_lares_pickpocket);
	Info_AddChoice(dia_lares_pickpocket,DIALOG_BACK,dia_lares_pickpocket_back);
	Info_AddChoice(dia_lares_pickpocket,DIALOG_PICKPOCKET,dia_lares_pickpocket_doit);
};

func void dia_lares_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lares_pickpocket);
};

func void dia_lares_pickpocket_back()
{
	Info_ClearChoices(dia_lares_pickpocket);
};


instance DIA_LARES_HALLO(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_hallo_condition;
	information = dia_lares_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_hallo_condition()
{
	return TRUE;
};

func void dia_lares_hallo_info()
{
	AI_Output(self,other,"DIA_Lares_HALLO_09_00");	//Я, должно быть, сошел с ума! Что ты делаешь здесь?
	if((MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		AI_Output(self,other,"DIA_Lares_HALLO_09_01");	//Ты что, ПРИПЛЫЛ сюда?
		AI_Output(self,other,"DIA_Lares_HALLO_09_02");	//(смеется) Это единственный способ миновать стражу у городских ворот.
		b_giveplayerxp(500);
	};
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Мы уже встречались раньше?",dia_lares_hallo_no);
	Info_AddChoice(dia_lares_hallo,"Эй, Ларес, старый пройдоха ...",dia_lares_hallo_yes);
};

func void dia_lares_hallo_no()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NO_15_00");	//Мы уже встречались раньше?
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_01");	//Парень, ты что, не помнишь меня? Мы были вместе в Новом Лагере.
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_02");	//Не говоря уже о шахте... Эй, мы знатно повеселились там. Ты помнишь Ли?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Конечно же, я помню Ли!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Ли?..",dia_lares_hallo_noidea);
};

func void dia_lares_hallo_yes()
{
	AI_Output(other,self,"DIA_Lares_HALLO_YES_15_00");	//Эй, Ларес, старый пройдоха! А как ты попал сюда?
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_01");	//Я смог выбраться из Долины Рудников вместе с Ли и другими парнями.
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_02");	//Ты ведь помнишь Ли?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"Конечно же, я помню Ли!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"Ли?..",dia_lares_hallo_noidea);
};

func void b_lares_aboutlee()
{
	AI_Output(self,other,"B_Lares_AboutLee_09_00");	//Я выбрался из колонии вместе с ним. Сразу после того, как Барьер был уничтожен.
	AI_Output(self,other,"B_Lares_AboutLee_09_01");	//Он и его парни сейчас на ферме лендлорда Онара.
	AI_Output(self,other,"B_Lares_AboutLee_09_02");	//Он договорился с этим фермером. Ли с парнями защищает ферму, а Онар кормит их за это.
};

func void dia_lares_hallo_lee()
{
	AI_Output(other,self,"DIA_Lares_HALLO_LEE_15_00");	//Конечно же, я помню Ли!
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};

func void dia_lares_hallo_noidea()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//Ли?..
	AI_Output(self,other,"DIA_Lares_HALLO_NOIDEA_09_01");	//Тебе, похоже, многое пришлось пережить. Ли был предводителем наемником в Новом Лагере.
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};


instance DIA_LARES_WHYINCITY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_lares_whyincity_condition;
	information = dia_lares_whyincity_info;
	permanent = FALSE;
	description = "А почему ТЫ не с Ли и наемниками?";
};


func int dia_lares_whyincity_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lares_whyincity_info()
{
	AI_Output(other,self,"DIA_Lares_WhyInCity_15_00");	//А почему ТЫ не с Ли и наемниками?
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_01");	//Я с ними! Просто я сейчас не на ферме.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_02");	//Можно сказать, я их аванпост в городе. Мы не хотим, чтобы корабль уплыл без нас.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_03");	//А зачем ТЫ пришел в город?
};


instance DIA_LARES_PALADINE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 3;
	condition = dia_lares_paladine_condition;
	information = dia_lares_paladine_info;
	permanent = FALSE;
	description = "Мне во что бы то ни стало нужно поговорить с паладинами!";
};


func int dia_lares_paladine_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void dia_lares_paladine_info()
{
	AI_Output(other,self,"DIA_Lares_Paladine_15_00");	//Мне во что бы то ни стало нужно поговорить с паладинами!
	AI_Output(self,other,"DIA_Lares_Paladine_09_01");	//Что тебе нужно от НИХ?
	AI_Output(other,self,"DIA_Lares_Paladine_15_02");	//У них есть амулет, Глаз Инноса. Я должен заполучить его.
	AI_Output(self,other,"DIA_Lares_Paladine_09_03");	//И ты думаешь, они отдадут его тебе? Тебе никогда не попасть в верхний квартал города.
	AI_Output(other,self,"DIA_Lares_Paladine_15_04");	//Я что-нибудь придумаю.
	AI_Output(self,other,"DIA_Lares_Paladine_09_05");	//Конечно, если ты сможешь снискать уважение горожан или станешь мальчиком на побегушках в ополчении...
};


instance DIA_LARES_ALTERNATIVE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 4;
	condition = dia_lares_alternative_condition;
	information = dia_lares_alternative_info;
	permanent = FALSE;
	description = "У меня есть выбор?";
};


func int dia_lares_alternative_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_paladine))
	{
		return TRUE;
	};
};

func void dia_lares_alternative_info()
{
	AI_Output(other,self,"DIA_Lares_Alternative_15_00");	//У меня есть выбор?
	AI_Output(self,other,"DIA_Lares_Alternative_09_01");	//На твоем месте я бы пошел на ферму Онара и поговорил с Ли.
	AI_Output(self,other,"DIA_Lares_Alternative_09_02");	//Я уверен, он найдет способ попасть в верхний квартал.
};


instance DIA_LARES_ABOUTSLD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_aboutsld_condition;
	information = dia_lares_aboutsld_info;
	permanent = FALSE;
	description = "Расскажи мне подробнее о наемниках.";
};


func int dia_lares_aboutsld_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void dia_lares_aboutsld_info()
{
	AI_Output(other,self,"DIA_Lares_AboutSld_15_00");	//Расскажи мне подробнее о наемниках.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_01");	//Ну, если ты так же силен, как был в долине, то у тебя не должно возникнуть проблем с ними.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_02");	//Большинство из них настоящие головорезы, и если ты не сможешь дать им отпор, то далеко ты не продвинешься.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_03");	//(смеется) Если ты проявишь слабость, у тебя не будет шансов присоединиться к ним...
};


instance DIA_LARES_SCHIFF(C_INFO)
{
	npc = vlk_449_lares;
	nr = 6;
	condition = dia_lares_schiff_condition;
	information = dia_lares_schiff_info;
	permanent = FALSE;
	description = "О каком корабле ты говоришь?";
};


func int dia_lares_schiff_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity) && (schiffswache_213.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_schiff_info()
{
	AI_Output(other,self,"DIA_Lares_Schiff_15_00");	//О каком корабле ты говоришь?
	AI_Output(self,other,"DIA_Lares_Schiff_09_01");	//Он стоит в гавани порта, за утесами. Ли и часть его людей очень хотят убраться отсюда.
	AI_Output(self,other,"DIA_Lares_Schiff_09_02");	//Но это может занять некоторое время...
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//Почему?
	AI_Output(self,other,"DIA_Lares_Schiff_09_04");	//Тебе лучше спросить об этом Ли, если встретишь его... У него есть план.
};


instance DIA_LARES_WEGZUMHOF(C_INFO)
{
	npc = vlk_449_lares;
	nr = 7;
	condition = dia_lares_wegzumhof_condition;
	information = dia_lares_wegzumhof_info;
	permanent = FALSE;
	description = "Как мне найти ферму лендлорда?";
};


func int dia_lares_wegzumhof_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void dia_lares_wegzumhof_info()
{
	AI_Output(other,self,"DIA_Lares_WegZumHof_15_00");	//Как мне найти ферму лендлорда?
	AI_Output(self,other,"DIA_Lares_WegZumHof_09_01");	//Я могу отвести тебя туда, если хочешь. Я все равно уже слишком долго здесь ошиваюсь.
	AI_Output(self,other,"DIA_Lares_WegZumHof_09_02");	//Ополчение в гавани бывает редко, но все же не стоит рисковать и вызывать их подозрения...
};


instance DIA_LARES_WHYPALHERE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 8;
	condition = dia_lares_whypalhere_condition;
	information = dia_lares_whypalhere_info;
	permanent = FALSE;
	description = "Ты знаешь, зачем паладины прибыли сюда?";
};


func int dia_lares_whypalhere_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_lares_whypalhere_info()
{
	AI_Output(other,self,"DIA_Lares_WhyPalHere_15_00");	//Ты знаешь, зачем паладины прибыли сюда?
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_01");	//Никто точно не знает этого... Большинство думает, что из-за орков, но мне кажется, причина совсем в другом.
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_02");	//Скорее всего, это имеет отношение к старой колонии.
};


instance DIA_LARES_GUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_lares_guildofthieves_condition;
	information = dia_lares_guildofthieves_info;
	permanent = FALSE;
	description = "Ты знаешь что-нибудь о городской гильдии воров?";
};


func int dia_lares_guildofthieves_condition()
{
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lares_guildofthieves_info()
{
	AI_Output(other,self,"DIA_Lares_GuildOfThieves_15_00");	//Ты знаешь что-нибудь о городской гильдии воров?
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_01");	//Ну и вопросы ты задаешь...
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_02");	//Конечно, здесь есть гильдия воров. Как и в любом большом городе.
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_03");	//И каждый более-менее стоящий вор, вероятно, как-то связан с ними.
};


instance DIA_LARES_WHEREGUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_lares_whereguildofthieves_condition;
	information = dia_lares_whereguildofthieves_info;
	permanent = FALSE;
	description = "Ты знаешь, где мне найти гильдию воров?";
};


func int dia_lares_whereguildofthieves_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_guildofthieves) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_whereguildofthieves_info()
{
	AI_Output(other,self,"DIA_Lares_WhereGuildOfThieves_15_00");	//Ты знаешь, где мне найти гильдию воров?
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_01");	//(смеется) Не обижайся, но даже если бы знал, не сказал бы.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_02");	//Эти люди обычно ОЧЕНЬ жестко реагируют на такие вещи.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_03");	//Если ты собираешься связаться с ними, тебе нужно быть поосторожнее.
};


instance DIA_LARES_GOTKEY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_lares_gotkey_condition;
	information = dia_lares_gotkey_info;
	permanent = FALSE;
	description = "Я нашел здесь этот ключ. Он весь изъеден морской водой...";
};


func int dia_lares_gotkey_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_whereguildofthieves) && Npc_HasItems(other,itke_thiefguildkey_mis) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_gotkey_info()
{
	AI_Output(other,self,"DIA_Lares_GotKey_15_00");	//Я нашел здесь этот ключ. Он весь изъеден морской водой...
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//И?
	AI_Output(other,self,"DIA_Lares_GotKey_15_02");	//Я думаю, он приведет меня к логову воровской гильдии...
	AI_Output(self,other,"DIA_Lares_GotKey_09_03");	//Ну, это может быть ключ от канализации.
};


instance DIA_LARES_KANALISATION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_lares_kanalisation_condition;
	information = dia_lares_kanalisation_info;
	permanent = FALSE;
	description = "Где мне найти канализацию?";
};


func int dia_lares_kanalisation_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_gotkey) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_kanalisation_info()
{
	AI_Output(other,self,"DIA_Lares_Kanalisation_15_00");	//Где мне найти канализацию?
	AI_Output(self,other,"DIA_Lares_Kanalisation_09_01");	//Насколько я знаю... канализации обычно выходят в океан.
};


instance DIA_LARES_OTHERGUILD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_otherguild_condition;
	information = dia_lares_otherguild_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_otherguild_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lares_otherguild_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_00");	//Теперь ты в ополчении!
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_01");	//(смеется) Со смеху помереть можно - бывший каторжник в ополчении...
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_02");	//Так теперь ты один из паладинов короля!
		};
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//(лукаво) Только ты мог провернуть такое...
		if(Npc_KnowsInfo(other,dia_lares_whyincity))
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_04");	//(озабоченно) Ты ведь никому не расскажешь, что я работаю на Ли, правда?
			AI_Output(other,self,"DIA_Lares_OtherGuild_15_05");	//Ты же знаешь меня...
		};
	};
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06");	//Я не понимаю. Ты поступил в монастырь? Как там тебе?
		AI_Output(other,self,"DIA_Lares_OtherGuild_15_07");	//По-разному.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_08");	//Представляю.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_09");	//Я слышал, ты был принят.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_10");	//Поздравляю.
	};
};


instance DIA_LARES_GONOW(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_gonow_condition;
	information = dia_lares_gonow_info;
	permanent = FALSE;
	description = "Хорошо, пошли.";
};


func int dia_lares_gonow_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_wegzumhof) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lares_gonow_info()
{
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//Хорошо, пошли.
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//Пошли... Иди за мной.
	AI_StopProcessInfos(self);
	LARES_GUIDE = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	if(Npc_KnowsInfo(other,dia_moe_hallo) == FALSE)
	{
		Npc_SetRefuseTalk(moe,30);
	};
};


instance DIA_LARES_GUIDE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_guide_condition;
	information = dia_lares_guide_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_guide_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_gonow) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_04"))
	{
		self.flags = 0;
		return TRUE;
	};
};

func void dia_lares_guide_info()
{
	if(LARES_GUIDE > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_00");	//Пришли.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_01");	//Вот ты где. А я уж начал думать, что тебя загрызли волки.
	};
	AI_Output(self,other,"DIA_Lares_GUIDE_09_02");	//Что ж, оставшуюся часть пути ты сможешь пройти сам. А мне нужно возвращаться в город...
	AI_Output(self,other,"DIA_Lares_GUIDE_09_03");	//Просто пойдешь по этой дороге. Но помни - сумей постоять за себя, не нарушай закон и все будет в порядке.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_LARES_DEX(C_INFO)
{
	npc = vlk_449_lares;
	nr = 10;
	condition = dia_lares_dex_condition;
	information = dia_lares_dex_info;
	permanent = FALSE;
	description = "Ты можешь научить меня чему-нибудь?";
};


func int dia_lares_dex_condition()
{
	return TRUE;
};

func void dia_lares_dex_info()
{
	AI_Output(other,self,"DIA_Lares_DEX_15_00");	//Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"DIA_Lares_DEX_09_01");	//Конечно. Если хочешь, я помогу тебе стать более ловким.
	LARES_TEACHDEX = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"Ларес может помочь мне повысить мою ловкость.");
};


var int lares_merkedex;

instance DIA_LARES_TEACH(C_INFO)
{
	npc = vlk_449_lares;
	nr = 10;
	condition = dia_lares_teach_condition;
	information = dia_lares_teach_info;
	permanent = TRUE;
	description = "Я хочу стать более ловким!";
};


func int dia_lares_teach_condition()
{
	if(LARES_TEACHDEX == TRUE)
	{
		return TRUE;
	};
};

func void dia_lares_teach_info()
{
	AI_Output(other,self,"DIA_Lares_TEACH_15_00");	//Я хочу стать более ловким!
	LARES_MERKEDEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
};

func void dia_lares_teach_back()
{
	if(other.attribute[ATR_DEXTERITY] > LARES_MERKEDEX)
	{
		AI_Output(self,other,"DIA_Lares_TEACH_BACK_09_00");	//Ты уже стал более ловким.
	};
	Info_ClearChoices(dia_lares_teach);
};

func void dia_lares_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,30);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
};

func void dia_lares_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,30);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
};


instance DIA_LARES_KAP2_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap2_exit_condition;
	information = dia_lares_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_lares_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KAP3_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap3_exit_condition;
	information = dia_lares_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lares_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_ANYNEWS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 39;
	condition = dia_lares_anynews_condition;
	information = dia_lares_anynews_info;
	permanent = TRUE;
	description = "Есть новости?";
};


func int dia_lares_anynews_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lares_anynews_info()
{
	AI_Output(other,self,"DIA_Lares_AnyNews_15_00");	//Есть новости?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_01");	//Основные новости связаны с тобой. Беннета отпустили, и он возвращается на ферму.
		AI_Output(self,other,"DIA_Lares_AnyNews_09_02");	//Иди к нему, я думаю, он хочет отблагодарить тебя лично.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_03");	//Можно сказать и так. Паладины арестовали Беннета, нашего кузнеца.
		if(MIS_RESCUEBENNET == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_04");	//Я слышал. Нечистое это дело.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_05");	//Ну, ты сам все понимаешь.
		}
		else
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_06");	//Как это случилось?
			AI_Output(self,other,"DIA_Lares_AnyNews_09_07");	//Беннет пришел в город за покупками. Но вернуться ему было не суждено.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_08");	//Если хочешь узнать больше, расспроси Ходжеса, он был в городе вместе с Беннетом.
			MIS_RESCUEBENNET = LOG_RUNNING;
		};
	};
};


instance DIA_LARES_NEWSABOUTBENNET(C_INFO)
{
	npc = vlk_449_lares;
	nr = 38;
	condition = dia_lares_newsaboutbennet_condition;
	information = dia_lares_newsaboutbennet_info;
	permanent = FALSE;
	description = "Есть новости о Беннете?";
};


func int dia_lares_newsaboutbennet_condition()
{
	if(MIS_RESCUEBENNET == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lares_newsaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_00");	//Есть новости о Беннете?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_01");	//Его увели в казармы и бросили там за решетку.
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_02");	//Как нам вызволить его оттуда?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_03");	//Пока у меня нет никаких идей. Я не могу пробраться в его камеру и поговорить с ним.
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_04");	//Все, что мне остается - это держать ушки на макушке, может, мне удастся что-то узнать.
};


instance DIA_LARES_KAP4_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap4_exit_condition;
	information = dia_lares_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lares_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KAP4_PERM(C_INFO)
{
	npc = vlk_449_lares;
	nr = 49;
	condition = dia_lares_kap4_perm_condition;
	information = dia_lares_kap4_perm_info;
	permanent = TRUE;
	description = "Почему ты не охотишься на драконов?";
};


func int dia_lares_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lares_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Lares_Kap4_PERM_15_00");	//Почему ты не охотишься на драконов?
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_01");	//Это не по мне. Пусть этим занимаются другие.
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_02");	//Нет уж, спасибо. Чистый морской воздух - это все, что мне сейчас нужно.
};


instance DIA_LARES_KAP5_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap5_exit_condition;
	information = dia_lares_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lares_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 51;
	condition = dia_lares_knowwhereenemy_condition;
	information = dia_lares_knowwhereenemy_info;
	permanent = TRUE;
	description = "Ты не хочешь покинуть этот остров?";
};


func int dia_lares_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LARES_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_00");	//Ты не хочешь покинуть этот остров?
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_01");	//Это самое большое мое желание. А что ты задумал?
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_02");	//Я выяснил, где скрывается повелитель драконов. Он на острове, недалеко отсюда.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_03");	//Я собираюсь избавиться от него раз и навсегда.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_04");	//Звучит заманчиво. Если я тебе нужен, ты можешь на меня рассчитывать.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_05");	//Тебе не нужен учитель ловкости или боя одноручным оружием в твоем путешествии?
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_06");	//Корабль уже полон, но я вернусь к тебе, если что-то изменится.
	}
	else
	{
		Info_ClearChoices(dia_lares_knowwhereenemy);
		Info_AddChoice(dia_lares_knowwhereenemy,"Я ценю твое предложение, но вынужден отказать тебе.",dia_lares_knowwhereenemy_no);
		Info_AddChoice(dia_lares_knowwhereenemy,"Я знал, что могу положиться на тебя.",dia_lares_knowwhereenemy_yes);
	};
};

func void dia_lares_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_00");	//Я знал, что могу положиться на тебя.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_01");	//Встретимся у корабля.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02");	//Ты человек действия - это мне нравится. Увидимся позже.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	LARES_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lares_knowwhereenemy);
};

func void dia_lares_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_No_15_00");	//Я ценю твое предложение, но вынужден отказать тебе.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_No_09_01");	//Ты должен понять, что ты хочешь. Если захочешь вернуться к этому вопросу, ты знаешь, где меня найти.
	if(hero.guild == GIL_DJG)
	{
		LARES_ISONBOARD = LOG_OBSOLETE;
	}
	else
	{
		LARES_ISONBOARD = LOG_FAILED;
	};
	Info_ClearChoices(dia_lares_knowwhereenemy);
};


instance DIA_LARES_LEAVEMYSHIP(C_INFO)
{
	npc = vlk_449_lares;
	nr = 51;
	condition = dia_lares_leavemyship_condition;
	information = dia_lares_leavemyship_info;
	permanent = TRUE;
	description = "Будет лучше, если ты не поплывешь со мной.";
};


func int dia_lares_leavemyship_condition()
{
	if((LARES_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lares_LeaveMyShip_15_00");	//Будет лучше, если ты не поплывешь со мной.
	AI_Output(self,other,"DIA_Lares_LeaveMyShip_09_01");	//Как знаешь, но в будущем думай, что ты обещаешь и кому.
	if(hero.guild == GIL_DJG)
	{
		LARES_ISONBOARD = LOG_OBSOLETE;
	}
	else
	{
		LARES_ISONBOARD = LOG_FAILED;
	};
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LARES_STILLNEEDYOU(C_INFO)
{
	npc = vlk_449_lares;
	nr = 51;
	condition = dia_lares_stillneedyou_condition;
	information = dia_lares_stillneedyou_info;
	permanent = TRUE;
	description = "Ты все еще заинтересован в месте на корабле?";
};


func int dia_lares_stillneedyou_condition()
{
	if(((LARES_ISONBOARD == LOG_OBSOLETE) || (LARES_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lares_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//Ты все еще заинтересован в месте на корабле?
	if(LARES_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_01");	//Обычно я не позволяю людям так обращаться со мной, но так как ты - один из нас, на этот раз я тебя прощу.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_02");	//Встретимся на корабле.
		LARES_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_03");	//Не обижайся, но я думаю, ты был прав.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_04");	//Мне лучше остаться здесь.
		AI_StopProcessInfos(self);
	};
};

