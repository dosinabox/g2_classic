
instance DIA_TENGRON_EXIT(C_INFO)
{
	npc = pal_280_tengron;
	nr = 999;
	condition = dia_tengron_exit_condition;
	information = dia_tengron_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_tengron_exit_condition()
{
	return TRUE;
};

func void dia_tengron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TENGRON_FIRST(C_INFO)
{
	npc = pal_280_tengron;
	nr = 2;
	condition = dia_tengron_first_condition;
	information = dia_tengron_first_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tengron_first_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_SCOUTMINE != LOG_RUNNING) && (MIS_SCOUTMINE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_tengron_first_info()
{
	AI_Output(self,other,"DIA_Tengron_First_07_00");	//Что ты делаешь здесь?
	AI_Output(other,self,"DIA_Tengron_First_15_01");	//Я здесь по приказу лорда Хагена.
	AI_Output(self,other,"DIA_Tengron_First_07_02");	//Тебе абсолютно необходимо добраться до замка и поговорить с командующим Гарондом.
};


instance DIA_TENGRON_HALLO(C_INFO)
{
	npc = pal_280_tengron;
	nr = 2;
	condition = dia_tengron_hallo_condition;
	information = dia_tengron_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tengron_hallo_condition()
{
	if((Npc_IsInState(self,zs_talk) && (MIS_SCOUTMINE == LOG_RUNNING)) || (MIS_SCOUTMINE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_tengron_hallo_info()
{
	AI_Output(self,other,"DIA_Tengron_HALLO_07_00");	//Да пребудет с тобой Иннос! Ты принес мне новости из замка? Скоро прибудет подкрепление?
	if(Npc_IsDead(fajeth) == FALSE)
	{
		AI_Output(other,self,"DIA_Tengron_HALLO_15_01");	//Я пришел не за тем, чтобы принести новости, а чтобы получить их.
		AI_Output(self,other,"DIA_Tengron_HALLO_07_02");	//Тогда поговори с Фаджетом. Он командует здесь. Но если у тебя будут новости из замка, дай мне знать.
	};
};


instance DIA_TENGRON_NEWS(C_INFO)
{
	npc = pal_280_tengron;
	nr = 7;
	condition = dia_tengron_news_condition;
	information = dia_tengron_news_info;
	permanent = FALSE;
	description = "Насчет новостей...";
};


func int dia_tengron_news_condition()
{
	if(Npc_KnowsInfo(other,dia_tengron_hallo))
	{
		return TRUE;
	};
};

func void dia_tengron_news_info()
{
	AI_Output(other,self,"DIA_Tengron_News_15_00");	//Насчет новостей...
	AI_Output(self,other,"DIA_Tengron_News_07_01");	//Да, как там, в замке?
	AI_Output(other,self,"DIA_Tengron_News_15_02");	//Его все еще осаждают орки, и он все также открыт для атак драконов.
	AI_Output(self,other,"DIA_Tengron_News_07_03");	//Черт, я надеюсь, парни все же продержатся.
	AI_Output(self,other,"DIA_Tengron_News_07_04");	//Послушай, у меня есть друг в замке. Его зовут Удар. Мы давно знаем друг друга, и через многое прошли рука об руку.
	AI_Output(self,other,"DIA_Tengron_News_07_05");	//Я хочу, чтобы ты передал ему это кольцо. Пусть он сохранит его ради меня. Скажи ему, я заберу кольцо, когда вернусь.
	Info_ClearChoices(dia_tengron_news);
	Info_AddChoice(dia_tengron_news,"У меня нет времени на это.",dia_tengron_news_no);
	Info_AddChoice(dia_tengron_news,"Нет проблем.",dia_tengron_news_yes);
};

func void dia_tengron_news_no()
{
	AI_Output(other,self,"DIA_Tengron_News_No_15_00");	//У меня нет времени на это.
	AI_Output(self,other,"DIA_Tengron_News_No_07_01");	//Понимаю.
	Info_ClearChoices(dia_tengron_news);
};

func void dia_tengron_news_yes()
{
	AI_Output(other,self,"DIA_Tengron_News_Yes_15_00");	//Нет проблем. Когда я буду в замке, я передам это кольцо Удару.
	AI_Output(self,other,"DIA_Tengron_News_Yes_07_01");	//Хорошо. Магия этого кольца придаст Удару силу. И не забудь сказать ему, что я потом заберу его.
	b_giveinvitems(self,other,itri_hp_01_tengron,1);
	Info_ClearChoices(dia_tengron_news);
	Log_CreateTopic(TOPIC_TENGRONRING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TENGRONRING,LOG_RUNNING);
	b_logentry(TOPIC_TENGRONRING,"Тенгрон дал мне кольцо, которое я должен передать Удару в замке.");
};


instance DIA_TENGRON_SITUATION(C_INFO)
{
	npc = pal_280_tengron;
	nr = 70;
	condition = dia_tengron_situation_condition;
	information = dia_tengron_situation_info;
	permanent = TRUE;
	description = "Как обстановка?";
};


func int dia_tengron_situation_condition()
{
	if(Npc_KnowsInfo(other,dia_tengron_hallo))
	{
		return TRUE;
	};
};

func void dia_tengron_situation_info()
{
	AI_Output(other,self,"DIA_Tengron_Situation_15_00");	//Как обстановка?
	AI_Output(self,other,"DIA_Tengron_Situation_07_01");	//Мы окружены монстрами, и нам удалось добыть очень мало руды. К тому же, мы потеряли много хороших людей.
	AI_Output(self,other,"DIA_Tengron_Situation_07_02");	//Я не знаю, сколько мы еще подержимся, но мы не сдадимся просто так!
};


instance DIA_TENGRON_HELP(C_INFO)
{
	npc = pal_280_tengron;
	nr = 9;
	condition = dia_tengron_help_condition;
	information = dia_tengron_help_info;
	permanent = FALSE;
	description = "Мне нужна твоя помощь.";
};


func int dia_tengron_help_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING) && Npc_KnowsInfo(other,dia_tengron_hallo))
	{
		return TRUE;
	};
};

func void dia_tengron_help_info()
{
	AI_Output(other,self,"DIA_Tengron_HELP_15_00");	//Мне нужна твоя помощь. Фаджет хочет, чтобы я перебил снепперов и...
	AI_Output(self,other,"DIA_Tengron_HELP_07_01");	//Я выполняю приказы ТОЛЬКО Фаджета. И мне дан приказ охранять шахту. Именно этим я и занимаюсь.
	AI_Output(self,other,"DIA_Tengron_HELP_07_02");	//Может, кто-нибудь еще сможет помочь тебе.
};


instance DIA_TENGRON_PICKPOCKET(C_INFO)
{
	npc = pal_280_tengron;
	nr = 900;
	condition = dia_tengron_pickpocket_condition;
	information = dia_tengron_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_tengron_pickpocket_condition()
{
	return c_beklauen(32,50);
};

func void dia_tengron_pickpocket_info()
{
	Info_ClearChoices(dia_tengron_pickpocket);
	Info_AddChoice(dia_tengron_pickpocket,DIALOG_BACK,dia_tengron_pickpocket_back);
	Info_AddChoice(dia_tengron_pickpocket,DIALOG_PICKPOCKET,dia_tengron_pickpocket_doit);
};

func void dia_tengron_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_tengron_pickpocket);
};

func void dia_tengron_pickpocket_back()
{
	Info_ClearChoices(dia_tengron_pickpocket);
};

