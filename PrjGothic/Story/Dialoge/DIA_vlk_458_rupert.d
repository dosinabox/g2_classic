
instance DIA_RUPERT_EXIT(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 999;
	condition = dia_rupert_exit_condition;
	information = dia_rupert_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rupert_exit_condition()
{
	return TRUE;
};

func void dia_rupert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUPERT_PICKPOCKET(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 900;
	condition = dia_rupert_pickpocket_condition;
	information = dia_rupert_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rupert_pickpocket_condition()
{
	return c_beklauen(18,10);
};

func void dia_rupert_pickpocket_info()
{
	Info_ClearChoices(dia_rupert_pickpocket);
	Info_AddChoice(dia_rupert_pickpocket,DIALOG_BACK,dia_rupert_pickpocket_back);
	Info_AddChoice(dia_rupert_pickpocket,DIALOG_PICKPOCKET,dia_rupert_pickpocket_doit);
};

func void dia_rupert_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rupert_pickpocket);
};

func void dia_rupert_pickpocket_back()
{
	Info_ClearChoices(dia_rupert_pickpocket);
};


instance DIA_RUPERT_HELLO(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_hello_condition;
	information = dia_rupert_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_rupert_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_rupert_hello_info()
{
	AI_Output(self,other,"DIA_Rupert_Hello_03_00");	//Привет, чужеземец!
	AI_Output(self,other,"DIA_Rupert_Hello_03_01");	//Ты, должно быть, голоден и хочешь пить. Может, тебя заинтересуют мои товары?
};


instance DIA_RUPERT_ZUPAL(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_zupal_condition;
	information = dia_rupert_zupal_info;
	permanent = FALSE;
	description = "Откровенно говоря, я пришел, чтобы встретиться с паладинами...";
};


func int dia_rupert_zupal_condition()
{
	if(KAPITEL < 2)
	{
		return TRUE;
	};
};

func void dia_rupert_zupal_info()
{
	AI_Output(other,self,"DIA_Rupert_ZuPal_15_00");	//Откровенно говоря, я пришел, чтобы встретиться с паладинами...
	AI_Output(self,other,"DIA_Rupert_ZuPal_03_01");	//У тебя мало шансов на это. С тех пор, как паладины обосновались в верхнем квартале, туда стало очень трудно попасть.
};


instance DIA_RUPERT_HELPMEINTOOV(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_helpmeintoov_condition;
	information = dia_rupert_helpmeintoov_info;
	permanent = FALSE;
	description = "Ты можешь помочь мне попасть в верхний квартал?";
};


func int dia_rupert_helpmeintoov_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_zupal) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_helpmeintoov_info()
{
	AI_Output(other,self,"DIA_Rupert_HelpMeIntoOV_15_00");	//Ты можешь помочь мне попасть в верхний квартал?
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_01");	//Я? Нет, мое слово мало что значит!
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_02");	//Всего несколько людей в нижней части города влиятельны настолько, что могут заставить стражу пропустить тебя.
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_03");	//Маттео, мой босс, - один из них. Возможно, тебе стоит поговорить с ним.
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"Чтобы попасть в верхний квартал, мне нужна помощь влиятельных граждан из нижней части города.");
	b_logentry(TOPIC_OV,"Торговец Маттео - один из влиятельных граждан нижней части города.");
};


instance DIA_RUPERT_WOMATTEO(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_womatteo_condition;
	information = dia_rupert_womatteo_info;
	permanent = FALSE;
	description = "Где я могу найти Маттео?";
};


func int dia_rupert_womatteo_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_helpmeintoov) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_womatteo_info()
{
	AI_Output(other,self,"DIA_Rupert_WoMatteo_15_00");	//Где я могу найти Маттео?
	AI_Output(self,other,"DIA_Rupert_WoMatteo_03_01");	//Ты стоишь прямо перед его лавкой. Просто войди внутрь. Он практически всегда там.
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"Лавка Маттео находится у южных ворот города. Он продает снаряжение, оружие и другие товары.");
		KNOWS_MATTEO = TRUE;
	};
};


instance DIA_RUPERT_WEREINFLUSS(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 2;
	condition = dia_rupert_wereinfluss_condition;
	information = dia_rupert_wereinfluss_info;
	permanent = FALSE;
	description = "А что насчет других влиятельных горожан?";
};


func int dia_rupert_wereinfluss_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_helpmeintoov) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_wereinfluss_info()
{
	AI_Output(other,self,"DIA_Rupert_WerEinfluss_15_00");	//А что насчет других влиятельных горожан?
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_01");	//Торговцы и мастера ремесленники, здесь, на главной улице - самые влиятельные фигуры в городе.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_02");	//Ты должен попытаться стать учеником одного из них, как я.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_03");	//С тех пор, как я работаю на Маттео, люди в городе относятся ко мне с уважением!
	b_logentry(TOPIC_OV,"Я должен попытаться стать учеником одного из мастеров.");
};


instance DIA_RUPERT_WORK(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 3;
	condition = dia_rupert_work_condition;
	information = dia_rupert_work_info;
	permanent = FALSE;
	description = "Мне нужны деньги и я ищу работу.";
};


func int dia_rupert_work_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_rupert_work_info()
{
	AI_Output(other,self,"DIA_Rupert_Work_15_00");	//Мне нужны деньги и я ищу работу.
	AI_Output(self,other,"DIA_Rupert_Work_03_01");	//Я слышал, что у Боспера проблемы с поставщиками. Его лавка находится вон там.
	AI_Output(self,other,"DIA_Rupert_Work_03_02");	//Говорят, он платит довольно хорошо.
};


instance DIA_RUPERT_YOUROFFER(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_youroffer_condition;
	information = dia_rupert_youroffer_info;
	permanent = FALSE;
	description = "Что ты можешь предложить мне?";
};


func int dia_rupert_youroffer_condition()
{
	return TRUE;
};

func void dia_rupert_youroffer_info()
{
	AI_Output(other,self,"DIA_Rupert_YourOffer_15_00");	//Что ты можешь предложить?
	AI_Output(self,other,"DIA_Rupert_YourOffer_03_01");	//Сейчас, у меня мало что есть.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rupert_YourOffer_03_02");	//Этот чертов лендлорд не поставляет больше продукты, а того, что мы получаем с маленьких ферм, недостаточно для удовлетворения потребностей города.
	};
};


instance DIA_RUPERT_TRADE(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 800;
	condition = dia_rupert_trade_condition;
	information = dia_rupert_trade_info;
	permanent = TRUE;
	description = "Покажи мне свои товары.";
	trade = TRUE;
};


func int dia_rupert_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_youroffer))
	{
		return TRUE;
	};
};

func void dia_rupert_trade_info()
{
	if(Npc_HasItems(self,itfo_apple) < 5)
	{
		CreateInvItems(self,itfo_apple,5);
	};
	AI_Output(other,self,"DIA_Rupert_Trade_15_00");	//Покажи мне свои товары.
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rupert_Trade_03_01");	//Я приношу извинения за скудный выбор. Человек вашего положения наверняка привык к лучшему.
	};
};


instance DIA_RUPERT_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_bauernaufstand_condition;
	information = dia_rupert_bauernaufstand_info;
	permanent = FALSE;
	description = "Расскажи мне о восстании крестьян.";
};


func int dia_rupert_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_youroffer) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Rupert_Bauernaufstand_15_00");	//Расскажи мне о восстании крестьян.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_01");	//Это довольно просто: Онар, жирный лендлорд, больше не платит налоги городу.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_02");	//Только представь! Мы воюем с орками, а этот жирный гусь забирает все себе!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_03");	//Обычно городская стража принимает жесткие меры в таких случаях.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_04");	//Но теперь самое интересное: говорят, что Онар нанял наемников, чтобы те не подпускали к его ферме городские войска!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_05");	//НАЕМНИКОВ! Это все кончится войной! Как будто ОДНОЙ войны не достаточно!
};


instance DIA_RUPERT_MERCS(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_mercs_condition;
	information = dia_rupert_mercs_info;
	permanent = FALSE;
	description = "Что ты знаешь о наемниках Онара?";
};


func int dia_rupert_mercs_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_bauernaufstand) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_rupert_mercs_info()
{
	AI_Output(other,self,"DIA_Rupert_Mercs_15_00");	//Что ты знаешь о наемниках Онара?
	AI_Output(self,other,"DIA_Rupert_Mercs_03_01");	//Я слышал, что большинство из них бывшие каторжники из колонии.
	AI_Output(self,other,"DIA_Rupert_Mercs_03_02");	//А их главарь, по слухам, был большой шишкой при короле - генералом или что-то в этом роде, - которого осудили за предательство!
	AI_Output(self,other,"DIA_Rupert_Mercs_03_03");	//Ужасные времена!
};

