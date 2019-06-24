
instance DIA_KHALED_EXIT(C_INFO)
{
	npc = sld_823_khaled;
	nr = 999;
	condition = dia_khaled_exit_condition;
	information = dia_khaled_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_khaled_exit_condition()
{
	return TRUE;
};

func void dia_khaled_exit_info()
{
	AI_StopProcessInfos(self);
};


var int khaled_weiter;

instance DIA_KHALED_HALLO(C_INFO)
{
	npc = sld_823_khaled;
	nr = 1;
	condition = dia_khaled_hallo_condition;
	information = dia_khaled_hallo_info;
	permanent = TRUE;
	description = "С тобой все в порядке?";
};


func int dia_khaled_hallo_condition()
{
	if(KHALED_WEITER == FALSE)
	{
		return TRUE;
	};
};

func void dia_khaled_hallo_info()
{
	AI_Output(other,self,"DIA_Khaled_Hallo_15_00");	//С тобой все в порядке?
	if(Npc_KnowsInfo(other,dia_lee_wannajoin))
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_01");	//Хм - так ты хочешь присоединиться к нам, да? А у тебя есть хотя бы приличное оружие?
		KHALED_WEITER = TRUE;
		Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTRADER,"Халед - торговец оружием.");
	}
	else
	{
		AI_Output(self,other,"DIA_Khaled_Hallo_11_02");	//Если у тебя что-то важное, поговори с Ли. А меня оставь в покое.
		AI_StopProcessInfos(self);
	};
};


instance DIA_KHALED_TRADE(C_INFO)
{
	npc = sld_823_khaled;
	nr = 700;
	condition = dia_khaled_trade_condition;
	information = dia_khaled_trade_info;
	permanent = TRUE;
	description = "Какое оружие ты можешь предложить мне?";
	trade = TRUE;
};


func int dia_khaled_trade_condition()
{
	if(KHALED_WEITER == TRUE)
	{
		return TRUE;
	};
};

func void dia_khaled_trade_info()
{
	AI_Output(other,self,"DIA_Khaled_TRADE_15_00");	//Какое оружие ты можешь предложить мне?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Khaled_TRADE_11_01");	//Только лучшее. Да ты сам взгляни на него.
};


instance DIA_KHALED_WANNAJOIN(C_INFO)
{
	npc = sld_823_khaled;
	nr = 10;
	condition = dia_khaled_wannajoin_condition;
	information = dia_khaled_wannajoin_info;
	permanent = TRUE;
	description = "Ты не возражаешь, если я присоединюсь к вам?";
};


func int dia_khaled_wannajoin_condition()
{
	if((KHALED_WEITER == TRUE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_khaled_wannajoin_info()
{
	AI_Output(other,self,"DIA_Khaled_WannaJoin_15_00");	//Ты не возражаешь, если я присоединюсь к вам?
	AI_Output(self,other,"DIA_Khaled_WannaJoin_11_01");	//Когда ты пройдешь испытание, я проголосую за тебя.
	if((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS) || (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Khaled_WannaJoin_15_02");	//Я его уже прошел.
		AI_Output(self,other,"DIA_Khaled_WannaJoin_11_03");	//Ну, тогда все в порядке.
	};
};


instance DIA_KHALED_WOHER(C_INFO)
{
	npc = sld_823_khaled;
	nr = 3;
	condition = dia_khaled_woher_condition;
	information = dia_khaled_woher_info;
	permanent = FALSE;
	description = "Как ты оказался среди наемников?";
};


func int dia_khaled_woher_condition()
{
	if(KHALED_WEITER == TRUE)
	{
		return TRUE;
	};
};

func void dia_khaled_woher_info()
{
	AI_Output(other,self,"DIA_Khaled_Woher_15_00");	//Как ты оказался среди наемников?
	AI_Output(self,other,"DIA_Khaled_Woher_11_01");	//Я пришел вместе с Сильвио с юга. Мы состояли в армии наемников, которая сражалась с орками.
};


instance DIA_KHALED_ABOUTSYLVIO(C_INFO)
{
	npc = sld_823_khaled;
	nr = 4;
	condition = dia_khaled_aboutsylvio_condition;
	information = dia_khaled_aboutsylvio_info;
	permanent = FALSE;
	description = "Что ты думаешь о Сильвио?";
};


func int dia_khaled_aboutsylvio_condition()
{
	if(Npc_KnowsInfo(other,dia_khaled_woher))
	{
		return TRUE;
	};
};

func void dia_khaled_aboutsylvio_info()
{
	AI_Output(other,self,"DIA_Khaled_AboutSylvio_15_00");	//Что ты думаешь о Сильвио?
	AI_Output(self,other,"DIA_Khaled_AboutSylvio_11_01");	//Это опасный тип! И многие наемники, что пришли с ним, прислушиваются к его мнению. Тебе лучше не связываться с ним.
};


instance DIA_KHALED_ABOUTLEE(C_INFO)
{
	npc = sld_823_khaled;
	nr = 5;
	condition = dia_khaled_aboutlee_condition;
	information = dia_khaled_aboutlee_info;
	permanent = FALSE;
	description = "Что ты думаешь о Ли?";
};


func int dia_khaled_aboutlee_condition()
{
	if(Npc_KnowsInfo(other,dia_khaled_woher))
	{
		return TRUE;
	};
};

func void dia_khaled_aboutlee_info()
{
	AI_Output(other,self,"DIA_Khaled_AboutLee_15_00");	//Что ты думаешь о Ли?
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_01");	//Я думаю, единственное, что по-настоящему интересует Ли - как убраться с этого острова.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_02");	//Он хочет добраться до материка. Похоже, у него там счеты с кем-то...
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_03");	//Но, как бы то ни было, он значительно лучше справляется со своей работой, чем на это способен Сильвио.
	AI_Output(self,other,"DIA_Khaled_AboutLee_11_04");	//Кроме того, он хороший лидер. Большую часть времени мы можем делать здесь что хотим.
};


instance DIA_KHALED_PICKPOCKET(C_INFO)
{
	npc = sld_823_khaled;
	nr = 900;
	condition = dia_khaled_pickpocket_condition;
	information = dia_khaled_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_khaled_pickpocket_condition()
{
	return c_beklauen(78,85);
};

func void dia_khaled_pickpocket_info()
{
	Info_ClearChoices(dia_khaled_pickpocket);
	Info_AddChoice(dia_khaled_pickpocket,DIALOG_BACK,dia_khaled_pickpocket_back);
	Info_AddChoice(dia_khaled_pickpocket,DIALOG_PICKPOCKET,dia_khaled_pickpocket_doit);
};

func void dia_khaled_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_khaled_pickpocket);
};

func void dia_khaled_pickpocket_back()
{
	Info_ClearChoices(dia_khaled_pickpocket);
};

