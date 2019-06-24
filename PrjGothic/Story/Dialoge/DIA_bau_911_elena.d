
instance DIA_ELENA_EXIT(C_INFO)
{
	npc = bau_911_elena;
	nr = 999;
	condition = dia_elena_exit_condition;
	information = dia_elena_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_elena_exit_condition()
{
	return TRUE;
};

func void dia_elena_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ELENA_HALLO(C_INFO)
{
	npc = bau_911_elena;
	nr = 1;
	condition = dia_elena_hallo_condition;
	information = dia_elena_hallo_info;
	permanent = FALSE;
	description = "Привет, красавица.";
};


func int dia_elena_hallo_condition()
{
	return TRUE;
};

func void dia_elena_hallo_info()
{
	AI_Output(other,self,"DIA_Elena_HALLO_15_00");	//Привет, красавица.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_01");	//Хм. Откуда это ты сбежал?
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_HALLO_16_02");	//Что тебе нужно?
	};
};


instance DIA_ELENA_AUFSTAND(C_INFO)
{
	npc = bau_911_elena;
	nr = 2;
	condition = dia_elena_aufstand_condition;
	information = dia_elena_aufstand_info;
	permanent = FALSE;
	description = "Говорят, что вы восстали против короля?";
};


func int dia_elena_aufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_aufstand_info()
{
	AI_Output(other,self,"DIA_Elena_Aufstand_15_00");	//Говорят, что вы восстали против короля?
	AI_Output(self,other,"DIA_Elena_Aufstand_16_01");	//Мой отец решил, что пришло время защищать себя самим.
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Elena_Aufstand_16_02");	//Ополчение никогда не помогало нам. Они приходили сюда только, чтобы забрать провизию.
	};
};


instance DIA_ELENA_ARBEIT(C_INFO)
{
	npc = bau_911_elena;
	nr = 3;
	condition = dia_elena_arbeit_condition;
	information = dia_elena_arbeit_info;
	permanent = FALSE;
	description = "Здесь, на ферме, есть какая-нибудь работа?";
};


func int dia_elena_arbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_elena_arbeit_info()
{
	AI_Output(other,self,"DIA_Elena_Arbeit_15_00");	//Здесь, на ферме, есть какая-нибудь работа?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_01");	//Мой отец хорошо платит всем, кто помогает защищать ферму.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_02");	//Тебе это интересно? Ты не похож на человека, привычного к работе в поле.
	AI_Output(other,self,"DIA_Elena_Arbeit_15_03");	//Сколько платит твой отец?
	AI_Output(self,other,"DIA_Elena_Arbeit_16_04");	//Тебе лучше обсудить этот вопрос с ним.
	AI_Output(self,other,"DIA_Elena_Arbeit_16_05");	//Я знаю только, что наемникам платят ежедневно.
};


instance DIA_ELENA_REGELN(C_INFO)
{
	npc = bau_911_elena;
	nr = 4;
	condition = dia_elena_regeln_condition;
	information = dia_elena_regeln_info;
	permanent = FALSE;
	description = "Здесь есть какие-нибудь правила, которых мне нужно придерживаться?";
};


func int dia_elena_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_elena_regeln_info()
{
	AI_Output(other,self,"DIA_Elena_Regeln_15_00");	//Здесь есть какие-нибудь правила, которых мне нужно придерживаться?
	AI_Output(self,other,"DIA_Elena_Regeln_16_01");	//Не трогай того, что тебе не принадлежит.
	AI_Output(self,other,"DIA_Elena_Regeln_16_02");	//Не суй свой нос в чужие дела.
	AI_Output(self,other,"DIA_Elena_Regeln_16_03");	//А если тебе хочется подраться, дерись с наемниками.
	AI_Output(self,other,"DIA_Elena_Regeln_16_04");	//Если ты начнешь драку с фермером, все здесь будут против тебя.
};


instance DIA_ELENA_AUFGABE(C_INFO)
{
	npc = bau_911_elena;
	nr = 5;
	condition = dia_elena_aufgabe_condition;
	information = dia_elena_aufgabe_info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int dia_elena_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_aufgabe_info()
{
	AI_Output(other,self,"DIA_Elena_AUFGABE_15_00");	//А чем ты занимаешься?
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_01");	//Я продаю то, что мы выращиваем на ферме. Если захочешь купить что-нибудь, дай мне знать.
	AI_Output(self,other,"DIA_Elena_AUFGABE_16_02");	//Но я хочу предупредить тебя. Я не люблю торговаться и не потерплю воровства. Понятно?
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"Елена продает товары на ферме Онара.");
};


var int elena_trade_mit_mir;

instance DIA_ELENA_TRADE(C_INFO)
{
	npc = bau_911_elena;
	nr = 7;
	condition = dia_elena_trade_condition;
	information = dia_elena_trade_info;
	permanent = TRUE;
	description = "Покажи мне свои товары!";
	trade = TRUE;
};


func int dia_elena_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_aufgabe) || (ELENA_TRADE_MIT_MIR == TRUE))
	{
		return TRUE;
	};
};

func void dia_elena_trade_info()
{
	AI_Output(other,self,"DIA_Elena_TRADE_15_00");	//Покажи мне свои товары!
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Elena_TRADE_16_01");	//Выбирай.
};


instance DIA_ELENA_PERM(C_INFO)
{
	npc = bau_911_elena;
	nr = 900;
	condition = dia_elena_perm_condition;
	information = dia_elena_perm_info;
	permanent = TRUE;
	description = "Ничего интересного последнее время не было?";
};


func int dia_elena_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_perm_info()
{
	AI_Output(other,self,"DIA_Elena_PERM_15_00");	//Ничего интересного последнее время не было?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_01");	//Несколько дней назад мой отец объявил, что нам больше нельзя ничего продавать городу.
		AI_Output(self,other,"DIA_Elena_PERM_16_02");	//Поэтому я теперь все время на ферме и продаю товары только здесь.
		ELENA_TRADE_MIT_MIR = TRUE;
	}
	else if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_03");	//Нападения ополчения на соседние фермы происходят все чаще и чаще. Это только вопрос времени, когда мой отец вмешается.
	}
	else if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_04");	//Жизнь здесь стала такой опасной. Никто не осмеливается далеко отходить от своего поля. Уже давно никто из нас не был в городе.
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_05");	//Наемники становятся все более и более нервными. Но с тех пор, как ушел Сильвио со своими парнями, они вроде немного успокоились.
	}
	else
	{
		AI_Output(self,other,"DIA_Elena_PERM_16_06");	//Все только и говорят, что о скором нападении орков. Но я не очень-то верю в это. Я думаю, что здесь, на ферме, мы в безопасности.
	};
};


instance DIA_ELENA_MINENANTEIL(C_INFO)
{
	npc = bau_911_elena;
	nr = 2;
	condition = dia_elena_minenanteil_condition;
	information = dia_elena_minenanteil_info;
	description = "Ты продаешь акции?";
};


func int dia_elena_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_elena_hallo))
	{
		return TRUE;
	};
};

func void dia_elena_minenanteil_info()
{
	AI_Output(other,self,"DIA_Elena_MINENANTEIL_15_00");	//Ты продаешь акции шахт?
	AI_Output(self,other,"DIA_Elena_MINENANTEIL_16_01");	//Ну и что? Я сама их купила у другого торговца.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ELENA_PICKPOCKET(C_INFO)
{
	npc = bau_911_elena;
	nr = 900;
	condition = dia_elena_pickpocket_condition;
	information = dia_elena_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_elena_pickpocket_condition()
{
	return c_beklauen(30,35);
};

func void dia_elena_pickpocket_info()
{
	Info_ClearChoices(dia_elena_pickpocket);
	Info_AddChoice(dia_elena_pickpocket,DIALOG_BACK,dia_elena_pickpocket_back);
	Info_AddChoice(dia_elena_pickpocket,DIALOG_PICKPOCKET,dia_elena_pickpocket_doit);
};

func void dia_elena_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_elena_pickpocket);
};

func void dia_elena_pickpocket_back()
{
	Info_ClearChoices(dia_elena_pickpocket);
};

