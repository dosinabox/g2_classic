
instance DIA_PEDRO_EXIT(C_INFO)
{
	npc = nov_600_pedro;
	nr = 999;
	condition = dia_pedro_exit_condition;
	information = dia_pedro_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pedro_exit_condition()
{
	return TRUE;
};

func void dia_pedro_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEDRO_WELCOME(C_INFO)
{
	npc = nov_600_pedro;
	nr = 1;
	condition = dia_pedro_welcome_condition;
	information = dia_pedro_welcome_info;
	important = TRUE;
};


func int dia_pedro_welcome_condition()
{
	return TRUE;
};

func void dia_pedro_welcome_info()
{
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_00");	//Добро пожаловать в монастырь Инноса, чужеземец.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_01");	//Я брат Педро, скромный слуга Инноса и хранитель врат этого священного монастыря.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//Что ты хочешь?
};


instance DIA_PEDRO_WURST(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_wurst_condition;
	information = dia_pedro_wurst_info;
	permanent = FALSE;
	description = "Вот, возьми колбасу, брат!";
};


func int dia_pedro_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_pedro_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Pedro_Wurst_15_00");	//Вот, возьми колбасу, брат!
	AI_Output(self,other,"DIA_Pedro_Wurst_09_01");	//Я рад, что ты подумал обо мне. Обычно обо мне забывают.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_02");	//Ты можешь дать мне еще одну колбаску?
	AI_Output(other,self,"DIA_Pedro_Wurst_15_03");	//Забудь об этом, тогда ее на всех не хватит.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_04");	//Эй, всего одну колбаску - никто даже не заметит этого. А ты кое-что получишь за это - я знаю место, где растет огненная крапива.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_05");	//Если ты отнесешь ее Неорасу, он наверняка даст тебе ключ от библиотеки. Что скажешь?
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
	Info_ClearChoices(dia_pedro_wurst);
	Info_AddChoice(dia_pedro_wurst,"Ладно, держи еще одну колбасу.",dia_pedro_wurst_ja);
	Info_AddChoice(dia_pedro_wurst,"Нет, забудь об этом.",dia_pedro_wurst_nein);
};

func void dia_pedro_wurst_ja()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_JA_15_00");	//Ладно, держи еще одну колбасу.
	AI_Output(self,other,"DIA_Pedro_Wurst_JA_09_01");	//Отлично. Огненная крапива растет слева и справа по другую сторону моста.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	Info_ClearChoices(dia_pedro_wurst);
};

func void dia_pedro_wurst_nein()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_NEIN_15_00");	//Нет, забудь об этом.
	AI_Output(self,other,"DIA_Pedro_Wurst_NEIN_09_01");	//Ты хочешь выслужиться перед Гораксом, да? Эх, новые послушники все одинаковые...
	Info_ClearChoices(dia_pedro_wurst);
};


instance DIA_PEDRO_EINLASS(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_einlass_condition;
	information = dia_pedro_einlass_info;
	permanent = FALSE;
	description = "Я хочу войти в монастырь.";
};


func int dia_pedro_einlass_condition()
{
	if(Npc_KnowsInfo(hero,dia_pedro_welcome))
	{
		return TRUE;
	};
};

func void dia_pedro_einlass_info()
{
	AI_Output(other,self,"DIA_Pedro_EINLASS_15_00");	//Я хочу войти в монастырь.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_01");	//Доступ в монастырь открыт только для слуг Инноса.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_02");	//Если ты хочешь помолиться Инносу, иди к одному из придорожных алтарей. Ты найдешь там успокоение в молитвах.
};


instance DIA_PEDRO_TEMPEL(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_tempel_condition;
	information = dia_pedro_tempel_info;
	permanent = FALSE;
	description = "Что нужно сделать, чтобы меня приняли в монастырь?";
};


func int dia_pedro_tempel_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_einlass) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pedro_tempel_info()
{
	AI_Output(other,self,"DIA_Pedro_TEMPEL_15_00");	//Что нужно сделать, чтобы меня приняли в монастырь?
	if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_01");	//Поступление в монастырь невозможно для тебя - ты уже выбрал свой путь.
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_02");	//Если ты хочешь быть принятым в Братство Инноса, ты должен знать и выполнять правила монастыря.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_03");	//Кроме того, мы требуем приношение Инносу от каждого нового послушника. Это должна быть овца и...
		b_say_gold(self,other,SUMME_KLOSTER);
		AI_Output(other,self,"DIA_Pedro_TEMPEL_15_04");	//Это целая куча золота.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_05");	//Это знак того, что ты начинаешь новую жизнь в качестве слуги Инноса. Когда ты будешь принят, все твои предыдущие прегрешения будут прощены.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_06");	//И хорошенько подумай - потом ты не сможешь отказаться от своего решения стать слугой Инноса.
		Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
		b_logentry(TOPIC_KLOSTER,"Чтобы стать послушником монастыря Инноса, мне нужна овца и огромная сумма золотом.");
	};
};


instance DIA_PEDRO_RULES(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_rules_condition;
	information = dia_pedro_rules_info;
	permanent = FALSE;
	description = "Что это за правила, по которым вы живете?";
};


func int dia_pedro_rules_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_tempel))
	{
		return TRUE;
	};
};

func void dia_pedro_rules_info()
{
	AI_Output(other,self,"DIA_Pedro_Rules_15_00");	//Что это за правила, по которым вы живете?
	AI_Output(self,other,"DIA_Pedro_Rules_09_01");	//Иннос - бог правды и закона. Поэтому мы НИКОГДА не лжем и не совершаем преступлений.
	AI_Output(self,other,"DIA_Pedro_Rules_09_02");	//Если ты согрешишь против брата из нашей общины или украдешь нашу собственность, тебе придется заплатить за это штраф.
	AI_Output(self,other,"DIA_Pedro_Rules_09_03");	//Иннос также бог правления и огня.
	AI_Output(self,other,"DIA_Pedro_Rules_09_04");	//Будучи послушником, ты должен проявлять ПОСЛУШАНИЕ и УВАЖЕНИЕ ко всем Магам Огня.
	AI_Output(other,self,"DIA_Pedro_Rules_15_05");	//Понятно.
	AI_Output(self,other,"DIA_Pedro_Rules_09_06");	//Кроме того, послушник ОБЯЗАН выполнять работу в монастыре на благо общины.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_Rules_09_07");	//Если ты готов следовать этим правилам, и у тебя есть приношение Инносу, мы готовы принять тебя в монастырь в качестве послушника.
	};
};


instance DIA_PEDRO_AUFNAHME(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_aufnahme_condition;
	information = dia_pedro_aufnahme_info;
	permanent = TRUE;
	description = "Я хочу стать послушником.";
};


var int dia_pedro_aufnahme_noperm;

func int dia_pedro_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,dia_pedro_rules) && (DIA_PEDRO_AUFNAHME_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_pedro_aufnahme_info()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_15_00");	//Я хочу стать послушником.
	Npc_PerceiveAll(self);
	if(hero.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_01");	//Ты уже выбрал свой путь. Путь магии закрыт для тебя.
		DIA_PEDRO_AUFNAHME_NOPERM = TRUE;
	}
	else if((hero.guild == GIL_NONE) && (Npc_HasItems(hero,itmi_gold) >= SUMME_KLOSTER) && Wld_DetectNpc(self,follow_sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_03");	//Я вижу, ты принес необходимое приношение. Если ты действительно желаешь этого, ты можешь стать послушником.
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_04");	//Однако, если ты примешь это решение, пути назад не будет - хорошо подумай, твой ли это путь!
		Info_ClearChoices(dia_pedro_aufnahme);
		Info_AddChoice(dia_pedro_aufnahme,"Я еще немного подумаю над этим.",dia_pedro_aufnahme_no);
		Info_AddChoice(dia_pedro_aufnahme,"Да, я хочу посвятить свою жизнь служению Инносу.",dia_pedro_aufnahme_yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_02");	//Ты не принес необходимое приношение.
	};
};

func void dia_pedro_aufnahme_yes()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_00");	//Да, я хочу посвятить свою жизнь служению Инносу.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_01");	//Тогда добро пожаловать, брат. Я даю тебе этот ключ от монастырских ворот.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_02");	//В знак твоего добровольного принятия этого решения, ты должен сам открыть эти ворота и войти внутрь.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_03");	//Теперь ты послушник. Носи эту робу в знак того, что теперь ты член нашего братства.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_04");	//Когда ты войдешь в монастырь, подойди к Парлану. С этого момента он будет отвечать за тебя.
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_05");	//Мои прегрешения теперь прощены?
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_06");	//Пока еще нет. Поговори с мастером Парланом. Он благословит тебя и очистит от твоих грехов.
	CreateInvItems(self,itke_innos_mis,1);
	b_giveinvitems(self,hero,itke_innos_mis,1);
	CreateInvItems(other,itar_nov_l,1);
	AI_EquipArmor(other,itar_nov_l);
	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other,GIL_NOV);
	DIA_PEDRO_AUFNAHME_NOPERM = TRUE;
	NOV_AUFNAHME = TRUE;
	b_giveplayerxp(XP_AUFNAHMENOVIZE);
	Wld_AssignRoomToGuild("Kloster02",GIL_KDF);
	AI_StopProcessInfos(self);
};

func void dia_pedro_aufnahme_no()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_NO_15_00");	//Я еще немного подумаю над этим.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_NO_09_01");	//Возвращайся, когда будешь готов.
	Info_ClearChoices(dia_pedro_aufnahme);
};


instance DIA_PEDRO_MONASTERY(C_INFO)
{
	npc = nov_600_pedro;
	nr = 90;
	condition = dia_pedro_monastery_condition;
	information = dia_pedro_monastery_info;
	permanent = TRUE;
	description = "Расскажи мне о жизни в монастыре.";
};


func int dia_pedro_monastery_condition()
{
	return TRUE;
};

func void dia_pedro_monastery_info()
{
	AI_Output(other,self,"DIA_Pedro_Monastery_15_00");	//Расскажи мне о жизни в монастыре.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_01");	//Мы живем в монастыре, чтобы служить Инносу. Мы, послушники, выполняем различные работы и изучаем писания, когда у нас появляется такая возможность.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_02");	//Маги присматривают за нами, а также изучают искусство магии.
};


instance DIA_PEDRO_PICKPOCKET(C_INFO)
{
	npc = nov_600_pedro;
	nr = 900;
	condition = dia_pedro_pickpocket_condition;
	information = dia_pedro_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_pedro_pickpocket_condition()
{
	return c_beklauen(45,60);
};

func void dia_pedro_pickpocket_info()
{
	Info_ClearChoices(dia_pedro_pickpocket);
	Info_AddChoice(dia_pedro_pickpocket,DIALOG_BACK,dia_pedro_pickpocket_back);
	Info_AddChoice(dia_pedro_pickpocket,DIALOG_PICKPOCKET,dia_pedro_pickpocket_doit);
};

func void dia_pedro_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pedro_pickpocket);
};

func void dia_pedro_pickpocket_back()
{
	Info_ClearChoices(dia_pedro_pickpocket);
};

