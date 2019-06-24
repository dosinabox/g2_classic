
instance DIA_RETHON_EXIT(C_INFO)
{
	npc = djg_709_rethon;
	nr = 999;
	condition = dia_rethon_exit_condition;
	information = dia_rethon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rethon_exit_condition()
{
	return TRUE;
};

func void dia_rethon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RETHON_HALLO(C_INFO)
{
	npc = djg_709_rethon;
	nr = 5;
	condition = dia_rethon_hallo_condition;
	information = dia_rethon_hallo_info;
	description = "Что ты делаешь здесь?";
};


func int dia_rethon_hallo_condition()
{
	return TRUE;
};

func void dia_rethon_hallo_info()
{
	AI_Output(other,self,"DIA_Rethon_HALLO_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Rethon_HALLO_12_01");	//Готовлюсь к сражению, что же еще?
};


instance DIA_RETHON_KAMPF(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_kampf_condition;
	information = dia_rethon_kampf_info;
	description = "С кем ты собрался сражаться?";
};


func int dia_rethon_kampf_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_kampf_info()
{
	AI_Output(other,self,"DIA_Rethon_KAMPF_15_00");	//С кем ты собрался сражаться?
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_01");	//Я хочу вызвать на бой паладинов и показать этим жирным лентяям, где раки зимуют.
	AI_Output(self,other,"DIA_Rethon_KAMPF_12_02");	//Идиот. С драконами, конечно же. А ты что подумал?
};


instance DIA_RETHON_PALADINE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 6;
	condition = dia_rethon_paladine_condition;
	information = dia_rethon_paladine_info;
	description = "Паладины не против того, что вы здесь?";
};


func int dia_rethon_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_paladine_info()
{
	AI_Output(other,self,"DIA_Rethon_PALADINE_15_00");	//Паладины не против того, что вы здесь?
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_01");	//Чушь. У них совсем другие проблемы. Большинство из них рады, что вообще живы.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_02");	//Боевой дух у них ни к черту. Это начало их конца.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_03");	//Я хочу сказать, ты только посмотри на эти их старые зазубренные клинки, которые они постоянно чинят.
	AI_Output(self,other,"DIA_Rethon_PALADINE_12_04");	//Любой разумный воин давно бы сбежал отсюда.
};


instance DIA_RETHON_WOGRUPPE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 7;
	condition = dia_rethon_wogruppe_condition;
	information = dia_rethon_wogruppe_info;
	description = "Ты отстал от своей группы?";
};


func int dia_rethon_wogruppe_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_hallo))
	{
		return TRUE;
	};
};

func void dia_rethon_wogruppe_info()
{
	AI_Output(other,self,"DIA_Rethon_WOGRUPPE_15_00");	//Ты отстал от своей группы?
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_01");	//Моей группы? У меня нет группы. Я охотник за трофеями.
	AI_Output(self,other,"DIA_Rethon_WOGRUPPE_12_02");	//Если я вернусь домой без трофея, никто не поймет, зачем я ходил сюда. Поэтому я не хочу ни с кем делиться.
};


instance DIA_RETHON_DRACHENGESEHEN(C_INFO)
{
	npc = djg_709_rethon;
	nr = 8;
	condition = dia_rethon_drachengesehen_condition;
	information = dia_rethon_drachengesehen_info;
	description = "Ты уже видел дракона?";
};


func int dia_rethon_drachengesehen_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_kampf))
	{
		return TRUE;
	};
};

func void dia_rethon_drachengesehen_info()
{
	AI_Output(other,self,"DIA_Rethon_DRACHENGESEHEN_15_00");	//Ты уже видел дракона?
	AI_Output(self,other,"DIA_Rethon_DRACHENGESEHEN_12_01");	//Нет. Я хочу привести свое оружие в порядок, прежде чем отправлюсь охотиться на него.
};


instance DIA_RETHON_ANGST(C_INFO)
{
	npc = djg_709_rethon;
	nr = 9;
	condition = dia_rethon_angst_condition;
	information = dia_rethon_angst_info;
	description = "А ты не боишься, что кто-нибудь может тебя опередить?";
};


func int dia_rethon_angst_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_wogruppe))
	{
		return TRUE;
	};
};

func void dia_rethon_angst_info()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_15_00");	//А ты не боишься, что кто-нибудь может тебя опередить?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_01");	//Что? Кто? Сильвио?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rethon_ANGST_12_02");	//Твой босс действительно думает, что ему здесь что-то светит, ха?
		AI_Output(other,self,"DIA_Rethon_ANGST_15_03");	//Я не из людей Сильвио. Я работаю сам на себя.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_04");	//Ох. Это хорошо. Забудь о том, что я говорил.
	};
	AI_Output(self,other,"DIA_Rethon_ANGST_12_05");	//Ты видел этих жалких трусов, что он привел с собой?
	AI_Output(self,other,"DIA_Rethon_ANGST_12_06");	//Сильвио должен радоваться, если ему удастся выбраться отсюда живым.
	if(Npc_IsDead(djg_sylvio))
	{
		AI_Output(other,self,"DIA_Rethon_ANGST_15_07");	//Не удастся. Он мертв.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_08");	//Я рад.
	}
	else
	{
		Info_AddChoice(dia_rethon_angst,DIALOG_BACK,dia_rethon_angst_weiter);
		Info_AddChoice(dia_rethon_angst,"Похоже, ты не особенно-то любишь его.",dia_rethon_angst_sylviomoegen);
		Info_AddChoice(dia_rethon_angst,"И где сейчас Сильвио?",dia_rethon_angst_wosylvio);
		Info_AddChoice(dia_rethon_angst,"Сильвио был здесь?",dia_rethon_angst_sylviohier);
	};
};

func void dia_rethon_angst_weiter()
{
	Info_ClearChoices(dia_rethon_angst);
};

func void dia_rethon_angst_sylviohier()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviohier_15_00");	//Сильвио был здесь?
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_01");	//Здесь, в замке, ты хочешь сказать? Да, был. Но очень недолго.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviohier_12_02");	//Он поболтал с несколькими парнями здесь, а затем опять исчез.
};

func void dia_rethon_angst_sylviomoegen()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_sylviomoegen_15_00");	//Похоже, ты не особенно-то любишь его.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_01");	//Что ты хочешь этим сказать - любишь? Было бы лучше, если бы я его вообще не знал.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_02");	//У Сильвио нет друзей. Ему нужны люди, которые идут за ним и не задают вопросов.
	AI_Output(self,other,"DIA_Rethon_ANGST_sylviomoegen_12_03");	//Это не по мне. Я работаю один.
};

func void dia_rethon_angst_wosylvio()
{
	AI_Output(other,self,"DIA_Rethon_ANGST_woSylvio_15_00");	//И где сейчас Сильвио?
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_01");	//Паладины говорили, что-то о ледяном драконе на западе. Он, по слухам, самый опасный и сильный из всех драконов.
	AI_Output(self,other,"DIA_Rethon_ANGST_woSylvio_12_02");	//Ты бы видел блеск в глазах Сильвио, когда он услышал об этом. Даже гадать не нужно, куда он пошел.
	b_logentry(TOPIC_DRACHENJAGD,"Охотник на драконов Ретон бормотал что-то о ледяном драконе.");
	b_logentry(TOPIC_DRAGONHUNTER,"Сильвио был в замке, а затем отправился на поиски ледяного дракона.");
};


instance DIA_RETHON_MEINEWAFFE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 10;
	condition = dia_rethon_meinewaffe_condition;
	information = dia_rethon_meinewaffe_info;
	description = "Ты можешь помочь мне улучшить мое оружие?";
};


func int dia_rethon_meinewaffe_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_paladine))
	{
		return TRUE;
	};
};

func void dia_rethon_meinewaffe_info()
{
	AI_Output(other,self,"DIA_Rethon_MEINEWAFFE_15_00");	//Ты можешь помочь мне улучшить мое оружие?
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_01");	//Улучшить? Лучше купи что-нибудь новое и выброси этот хлам, что ты носишь с собой.
	AI_Output(self,other,"DIA_Rethon_MEINEWAFFE_12_02");	//Возможно, у меня найдется что-нибудь для тебя. Тебе это интересно?
};


instance DIA_RETHON_TRADE(C_INFO)
{
	npc = djg_709_rethon;
	nr = 11;
	condition = dia_rethon_trade_condition;
	information = dia_rethon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "Что ты можешь продать мне?";
};


func int dia_rethon_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_rethon_meinewaffe))
	{
		return TRUE;
	};
};

func void dia_rethon_trade_info()
{
	AI_Output(other,self,"DIA_Rethon_TRADE_15_00");	//Что ты можешь продать мне?
	b_givetradeinv(self);
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_01");	//Ох, как низко я опустился! Теперь я даже продаю мое оружие паладину!
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_02");	//У меня мало что есть для мага, но все же ты можешь взглянуть.
	}
	else
	{
		AI_Output(self,other,"DIA_Rethon_TRADE_12_03");	//Думаю, у меня есть именно то, что тебе нужно, приятель.
	};
};


instance DIA_RETHON_PICKPOCKET(C_INFO)
{
	npc = djg_709_rethon;
	nr = 900;
	condition = dia_rethon_pickpocket_condition;
	information = dia_rethon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_rethon_pickpocket_condition()
{
	return c_beklauen(78,230);
};

func void dia_rethon_pickpocket_info()
{
	Info_ClearChoices(dia_rethon_pickpocket);
	Info_AddChoice(dia_rethon_pickpocket,DIALOG_BACK,dia_rethon_pickpocket_back);
	Info_AddChoice(dia_rethon_pickpocket,DIALOG_PICKPOCKET,dia_rethon_pickpocket_doit);
};

func void dia_rethon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rethon_pickpocket);
};

func void dia_rethon_pickpocket_back()
{
	Info_ClearChoices(dia_rethon_pickpocket);
};

