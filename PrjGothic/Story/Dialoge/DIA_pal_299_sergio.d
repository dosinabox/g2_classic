
instance DIA_SERGIO_EXIT(C_INFO)
{
	npc = pal_299_sergio;
	nr = 999;
	condition = dia_sergio_exit_condition;
	information = dia_sergio_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sergio_exit_condition()
{
	return TRUE;
};

func void dia_sergio_exit_info()
{
	if(Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500)
	{
		AI_Output(self,other,"DIA_Sergio_EXIT_04_00");	//Да осветит Иннос твой путь.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_WELCOME(C_INFO)
{
	npc = pal_299_sergio;
	nr = 5;
	condition = dia_sergio_welcome_condition;
	information = dia_sergio_welcome_info;
	important = TRUE;
};


func int dia_sergio_welcome_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(other,dia_sergio_isgaroth) == FALSE))
	{
		return TRUE;
	};
};

func void dia_sergio_welcome_info()
{
	AI_Output(self,other,"DIA_Sergio_WELCOME_04_00");	//Да пребудет с тобой Иннос, чем я могу помочь тебе?
};


instance DIA_SERGIO_ISGAROTH(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_isgaroth_condition;
	information = dia_sergio_isgaroth_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_isgaroth_condition()
{
	if(Npc_KnowsInfo(hero,pc_prayshrine_paladine) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_sergio_isgaroth_info()
{
	AI_Output(self,other,"DIA_Sergio_Isgaroth_04_00");	//Ты молился за моих товарищей. Я благодарен тебе за это. Скажи мне, что я могу сделать для тебя.
	Info_ClearChoices(dia_sergio_isgaroth);
	Info_AddChoice(dia_sergio_isgaroth,"Как насчет небольшого пожертвования?",dia_sergio_isgaroth_spende);
	Info_AddChoice(dia_sergio_isgaroth,"Ты не мог бы поделиться своим боевым опытом?",dia_sergio_isgaroth_xp);
};

func void dia_sergio_isgaroth_spende()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_Spende_15_00");	//Как насчет небольшого пожертвования?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_Spende_04_01");	//Пусть это золото сослужит тебе добрую службу.
	b_giveinvitems(self,other,itmi_gold,100);
	Info_ClearChoices(dia_sergio_isgaroth);
};

func void dia_sergio_isgaroth_xp()
{
	AI_Output(other,self,"DIA_Sergio_Isgaroth_XP_15_00");	//Ты не мог бы поделиться своим боевым опытом?
	AI_Output(self,other,"DIA_Sergio_Isgaroth_XP_04_01");	//Когда ты сражаешься, постарайся, чтобы никто не мог атаковать тебя сзади.
	other.hitchance[NPC_TALENT_2H] = other.hitchance[NPC_TALENT_2H] + 2;
	PrintScreen(PRINT_LEARN2H,-1,-1,FONT_SCREENSMALL,2);
	Info_ClearChoices(dia_sergio_isgaroth);
};


instance DIA_SERGIO_AUFGABE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_aufgabe_condition;
	information = dia_sergio_aufgabe_info;
	description = "Мне нужен доступ в библиотеку.";
};


func int dia_sergio_aufgabe_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_sergio_isgaroth))
	{
		return TRUE;
	};
};

func void dia_sergio_aufgabe_info()
{
	AI_Output(other,self,"DIA_Sergio_Aufgabe_15_00");	//Мне нужен доступ в библиотеку.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_01");	//Ну, я не могу обеспечить тебе доступ. Для этого ты должен сначала выполнить свои задания.
	AI_Output(self,other,"DIA_Sergio_Aufgabe_04_02");	//Но я могу помочь тебе. Иди к Мастеру Исгароту и поговори с ним. Я слышал, ему нужна помощь и собирался сам помочь ему, но я поручаю эту задачу тебе.
	SERGIO_SENDS = TRUE;
	Wld_InsertNpc(blackwolf,"NW_PATH_TO_MONASTER_AREA_01");
	Log_CreateTopic(TOPIC_ISGAROTHWOLF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ISGAROTHWOLF,LOG_RUNNING);
	b_logentry(TOPIC_ISGAROTHWOLF,"Мастеру Исгароту необходима помощь в часовне. Я должен найти его.");
};


instance DIA_SERGIO_WHAT(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_what_condition;
	information = dia_sergio_what_info;
	description = "Что ты делаешь здесь?";
};


func int dia_sergio_what_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_sergio_what_info()
{
	AI_Output(other,self,"DIA_Sergio_WHAT_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_01");	//Я молюсь Инносу, чтобы он укрепил мою руку и мою волю.
	AI_Output(self,other,"DIA_Sergio_WHAT_04_02");	//Тогда я буду готов к любым опасностям и уничтожу всех его врагов с его именем на устах.
	AI_Output(other,self,"DIA_Sergio_WHAT_15_03");	//Каких врагов?
	AI_Output(self,other,"DIA_Sergio_WHAT_04_04");	//Всех тех, кто противится воле Инноса. Не важно, человек это или вызванное существо.
};


instance DIA_SERGIO_BABO(C_INFO)
{
	npc = pal_299_sergio;
	nr = 3;
	condition = dia_sergio_babo_condition;
	information = dia_sergio_babo_info;
	description = "Не мог бы ты немного потренировать Бабо?";
};


func int dia_sergio_babo_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_babo_anliegen))
	{
		return TRUE;
	};
};

func void dia_sergio_babo_info()
{
	AI_Output(other,self,"DIA_Sergio_Babo_15_00");	//Не мог бы ты немного потренировать Бабо?
	AI_Output(self,other,"DIA_Sergio_Babo_04_01");	//А почему он не попросит сам?
	AI_Output(other,self,"DIA_Sergio_Babo_15_02");	//Я думаю, он робеет.
	AI_Output(self,other,"DIA_Sergio_Babo_04_03");	//Понимаю. Хорошо, если это так много значит для него, я буду тренировать его каждое утро в течение двух часов. Мы будем начинать в 5 утра. Можешь передать ему это.
	Npc_ExchangeRoutine(self,"TRAIN");
	b_startotherroutine(babo,"TRAIN");
	b_logentry(TOPIC_BABOTRAIN,"Сержио согласился тренироваться с Бабо по два часа каждое утро.");
};


instance DIA_SERGIO_WHY(C_INFO)
{
	npc = pal_299_sergio;
	nr = 4;
	condition = dia_sergio_why_condition;
	information = dia_sergio_why_info;
	description = "Почему ты не с другими паладинами?";
};


func int dia_sergio_why_condition()
{
	if(Npc_KnowsInfo(hero,dia_sergio_welcome) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void dia_sergio_why_info()
{
	AI_Output(other,self,"DIA_Sergio_WHY_15_00");	//Почему ты не с другими паладинами?
	AI_Output(self,other,"DIA_Sergio_WHY_04_01");	//Может показаться немного странным, что я здесь, однако не надо забывать, что мы, паладины, также служим магам, так как они проповедуют волю Инноса.
	AI_Output(self,other,"DIA_Sergio_WHY_04_02");	//Мы, паладины, - воины Инноса. Его воля - закон для нас. В настоящий момент я жду новых приказов от магов.
};


instance DIA_SERGIO_ORDERS(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_orders_condition;
	information = dia_sergio_orders_info;
	permanent = TRUE;
	description = "Ты уже получил новые приказы?";
};


func int dia_sergio_orders_condition()
{
	if(Npc_KnowsInfo(hero,dia_sergio_why) && (self.aivar[AIV_PARTYMEMBER] == FALSE) && (Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500))
	{
		return TRUE;
	};
};

func void dia_sergio_orders_info()
{
	AI_Output(other,self,"DIA_Sergio_ORDERS_15_00");	//Ты уже получил новые приказы?
	AI_Output(self,other,"DIA_Sergio_ORDERS_04_01");	//Пока нет, и у меня есть время найти силу в молитвах.
};


instance DIA_SERGIO_START(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_start_condition;
	information = dia_sergio_start_info;
	permanent = FALSE;
	description = "Ты должен сопровождать меня к Проходу.";
};


func int dia_sergio_start_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_CHAPELL_02") <= 1500) && (SERGIO_FOLLOW == TRUE) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_sergio_start_info()
{
	AI_Output(other,self,"DIA_Sergio_Start_15_00");	//Ты должен сопровождать меня к Проходу.
	AI_Output(self,other,"DIA_Sergio_Start_04_01");	//Хорошо, я сделаю это. Я знаю дорогу, иди за мной.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	self.npctype = NPCTYPE_FRIEND;
	Npc_ExchangeRoutine(self,"GUIDE");
};


instance DIA_SERGIO_GUIDE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 10;
	condition = dia_sergio_guide_condition;
	information = dia_sergio_guide_info;
	permanent = TRUE;
	description = "Мы пойдем?";
};


func int dia_sergio_guide_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") > 1000))
	{
		return TRUE;
	};
};

func void dia_sergio_guide_info()
{
	AI_Output(other,self,"DIA_Sergio_Guide_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Sergio_Guide_04_01");	//Я должен сопроводить тебя к Проходу. Но самая опасная часть путешествия только начинается там.
	AI_Output(self,other,"DIA_Sergio_Guide_04_02");	//"Но не будем терять времени
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_ENDE(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_ende_condition;
	information = dia_sergio_ende_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_ende_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (Npc_GetDistToWP(self,"NW_TO_PASS_01") <= 1000))
	{
		return TRUE;
	};
};

func void dia_sergio_ende_info()
{
	AI_Output(self,other,"DIA_Sergio_Ende_04_00");	//Мы пришли. Что бы ни ждало тебя в Долине Рудников, я надеюсь, что ты найдешь дорогу назад.
	AI_Output(other,self,"DIA_Sergio_Ende_15_01");	//Не бойся - я вернусь.
	AI_Output(self,other,"DIA_Sergio_Ende_04_02");	//Иди с Инносом. Да не оставит он тебя без защиты.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_SERGIO_PERM(C_INFO)
{
	npc = pal_299_sergio;
	nr = 2;
	condition = dia_sergio_perm_condition;
	information = dia_sergio_perm_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sergio_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_sergio_perm_info()
{
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_00");	//Хвала Инносу, брат. Если ты пришел узнать что-нибудь об Освящении Меча, поговори с Мардуком.
	}
	else
	{
		AI_Output(self,other,"DIA_Sergio_Perm_04_01");	//Я слышал о тебе. Ты парень с фермы, который был в Долине Рудников. Мое почтение.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERGIO_PICKPOCKET(C_INFO)
{
	npc = pal_299_sergio;
	nr = 900;
	condition = dia_sergio_pickpocket_condition;
	information = dia_sergio_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_sergio_pickpocket_condition()
{
	return c_beklauen(78,85);
};

func void dia_sergio_pickpocket_info()
{
	Info_ClearChoices(dia_sergio_pickpocket);
	Info_AddChoice(dia_sergio_pickpocket,DIALOG_BACK,dia_sergio_pickpocket_back);
	Info_AddChoice(dia_sergio_pickpocket,DIALOG_PICKPOCKET,dia_sergio_pickpocket_doit);
};

func void dia_sergio_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sergio_pickpocket);
};

func void dia_sergio_pickpocket_back()
{
	Info_ClearChoices(dia_sergio_pickpocket);
};

