
instance DIA_ALWIN_EXIT(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 999;
	condition = dia_alwin_exit_condition;
	information = dia_alwin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alwin_exit_condition()
{
	return TRUE;
};

func void dia_alwin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALWIN_PICKPOCKET(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 900;
	condition = dia_alwin_pickpocket_condition;
	information = dia_alwin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_alwin_pickpocket_condition()
{
	return c_beklauen(20,10);
};

func void dia_alwin_pickpocket_info()
{
	Info_ClearChoices(dia_alwin_pickpocket);
	Info_AddChoice(dia_alwin_pickpocket,DIALOG_BACK,dia_alwin_pickpocket_back);
	Info_AddChoice(dia_alwin_pickpocket,DIALOG_PICKPOCKET,dia_alwin_pickpocket_doit);
};

func void dia_alwin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alwin_pickpocket);
};

func void dia_alwin_pickpocket_back()
{
	Info_ClearChoices(dia_alwin_pickpocket);
};


instance DIA_ALWIN_SHEEP(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 3;
	condition = dia_alwin_sheep_condition;
	information = dia_alwin_sheep_info;
	permanent = FALSE;
	description = "Это твои овцы?";
};


func int dia_alwin_sheep_condition()
{
	return TRUE;
};

func void dia_alwin_sheep_info()
{
	AI_Output(other,self,"DIA_Alwin_Sheep_15_00");	//Это твои овцы?
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//Единственная овца, что принадлежит мне, отзывается на имя Люси. (смеется) Это моя жена - Люси.
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//Эти овцы принадлежат ополчению. Они забирают их у фермеров и приводят ко мне.
};


instance DIA_ALWIN_FELLAN(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 2;
	condition = dia_alwin_fellan_condition;
	information = dia_alwin_fellan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alwin_fellan_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(fellan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_alwin_fellan_info()
{
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//Ох, этот стук молотка этого сумасшедшего скоро и меня сведет с ума.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//О ком ты говоришь?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//Разве ты не слышишь стук молотка? Кто, как ты думаешь, колотит дни напролет в портовом квартале?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//Я имею в виду этого психа Феллана. Он стучит молотком по своей хижине каждый день.
};


instance DIA_ALWIN_FELLANRUNNING(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 2;
	condition = dia_alwin_fellanrunning_condition;
	information = dia_alwin_fellanrunning_info;
	permanent = FALSE;
	description = "Я могу поговорить с Фелланом...";
};


func int dia_alwin_fellanrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(fellan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_alwin_fellanrunning_info()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_00");	//Я могу поговорить с Фелланом...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//Ты хочешь помочь мне? А зачем тебе это?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//Ты скажи мне.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//Ох, вот ты как! Хорошо - если ты заставишь его перестать молотить, я заплачу тебе 25 золотых монет.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//Но я скажу тебе сразу - ты не сможешь уговорить этого парня. Он сошел с ума. Единственное, что может помочь, это несколько хороших тумаков!
	MIS_ATTACKFELLAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ALWIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ALWIN,LOG_RUNNING);
	b_logentry(TOPIC_ALWIN,"Алвин хочет, чтобы я заставил Феллана перестать колотить молотком. Впрочем, убивать его за это не стоит.");
	Info_ClearChoices(dia_alwin_fellanrunning);
	Info_AddChoice(dia_alwin_fellanrunning,"Я посмотрю, что можно сделать...",dia_alwin_fellanrunning_ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		Info_AddChoice(dia_alwin_fellanrunning,"Если я начну бить его, у меня будут проблемы с ополчением...",dia_alwin_fellanrunning_problems);
	};
};

func void dia_alwin_fellanrunning_ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//Я посмотрю, что можно сделать...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//Подумай об этом. И помни, я заплачу тебе 25 золотых.
	Info_ClearChoices(dia_alwin_fellanrunning);
};

func void dia_alwin_fellanrunning_problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//Если я начну бить его, у меня будут проблемы с ополчением...
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//Здесь, в порту, никто не обращает внимания на драки ...
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//Но если ты украдешь что-нибудь, или убьешь овцу, у тебя будут большие проблемы.
};


instance DIA_ALWIN_FELLANSUCCESS(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 4;
	condition = dia_alwin_fellansuccess_condition;
	information = dia_alwin_fellansuccess_info;
	permanent = FALSE;
	description = "Феллан больше не будет стучать.";
};


func int dia_alwin_fellansuccess_condition()
{
	if((MIS_ATTACKFELLAN == LOG_RUNNING) && ((FELLANGESCHLAGEN == TRUE) || Npc_IsDead(fellan)))
	{
		return TRUE;
	};
};

func void dia_alwin_fellansuccess_info()
{
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//Феллан больше не будет стучать.
	AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//Надо же! Больше нет этого стука. Наконец-то. Я уж думал, он никогда не перестанет.
	if(Npc_IsDead(fellan) == FALSE)
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//Ты оказал мне большую услугу. Знаешь что, я дам тебе 30 золотых монет.
		b_giveinvitems(self,other,itmi_gold,30);
		MIS_ATTACKFELLAN = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		MIS_ATTACKFELLAN = LOG_FAILED;
	};
};


instance DIA_ALWIN_ENDLOS(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 8;
	condition = dia_alwin_endlos_condition;
	information = dia_alwin_endlos_info;
	permanent = TRUE;
	description = "Как твои овцы?";
};


func int dia_alwin_endlos_condition()
{
	if(Npc_KnowsInfo(other,dia_alwin_sheep))
	{
		return TRUE;
	};
};

func void dia_alwin_endlos_info()
{
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//Как твои овцы?
	if((MIS_ATTACKFELLAN != LOG_SUCCESS) && (Npc_IsDead(fellan) == FALSE))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//Стук этого Феллана сведет их с ума. Однажды они все разбегутся.
	}
	else if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//Овцы едят и становятся все толще и толще. Прямо как моя жена. ХАХАХА (громко смеется)
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//Я, пожалуй, забью одну из них. На мясо для последней трапезы!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//Для кого?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//Для наемника, который убил паладина. Конечно же, его казнят.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//Мне только нужно решить, какую из них отправить на бойню.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//Люси очень повезло, что она осталась в живых.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//Я думал, что Люси - это твоя жена.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//Правильно, но я также назвал эту овцу Люси. Я имею в виду овцу, которая была предназначена для последней трапезы Беннета.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//Но все кончилось хорошо. Люси должна быть рада.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//Откровенно говоря, смотреть за тем, как овцы едят - такая скука!
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//Я говорю им - прощайте. Лорд Хаген приказал, чтобы вес овцы пошли на провиант для его армии.
		AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//Ну, теперь я хотя бы буду проводить больше времени со своей женой.
	};
};

