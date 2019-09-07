
instance DIA_FESTER_EXIT(C_INFO)
{
	npc = sld_816_fester;
	nr = 999;
	condition = dia_fester_exit_condition;
	information = dia_fester_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fester_exit_condition()
{
	return TRUE;
};

func void dia_fester_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FESTER_HELLO(C_INFO)
{
	npc = sld_816_fester;
	nr = 1;
	condition = dia_fester_hello_condition;
	information = dia_fester_hello_info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int dia_fester_hello_condition()
{
	return TRUE;
};

func void dia_fester_hello_info()
{
	AI_Output(other,self,"DIA_Fester_Hello_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Fester_Hello_08_01");	//Я готовлюсь к бою...
};


instance DIA_FESTER_AUFTRAG(C_INFO)
{
	npc = sld_816_fester;
	nr = 2;
	condition = dia_fester_auftrag_condition;
	information = dia_fester_auftrag_info;
	permanent = FALSE;
	description = "Почему?";
};


func int dia_fester_auftrag_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_hello))
	{
		return TRUE;
	};
};

func void dia_fester_auftrag_info()
{
	AI_Output(other,self,"DIA_Fester_Auftrag_15_00");	//Зачем?
	AI_Output(self,other,"DIA_Fester_Auftrag_08_01");	//Последнее время у фермеров все больше с полевыми хищниками.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_02");	//Нескольких крестьян эти твари даже съели.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_03");	//А этот жирный Онар не видит здесь никакой проблемы. Нам не платят жалование уже неделю.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_04");	//И в этом есть моя вина. Теперь Ли хочет, чтобы я лично уничтожил гнездо этих тварей.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_05");	//А остальные наемники уже делают ставки, удастся мне выжить или нет...
};


instance DIA_FESTER_YOUFIGHT(C_INFO)
{
	npc = sld_816_fester;
	nr = 3;
	condition = dia_fester_youfight_condition;
	information = dia_fester_youfight_info;
	permanent = FALSE;
	description = "Ты хороший боец?";
};


func int dia_fester_youfight_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_hello) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_youfight_info()
{
	AI_Output(other,self,"DIA_Fester_YouFight_15_00");	//Ты хороший боец?
	AI_Output(self,other,"DIA_Fester_YouFight_08_01");	//Я неплохо умею обращаться с мечом, а лук это вообще мой конек! А почему ты спрашиваешь?
};


instance DIA_FESTER_WONEST(C_INFO)
{
	npc = sld_816_fester;
	nr = 4;
	condition = dia_fester_wonest_condition;
	information = dia_fester_wonest_info;
	permanent = FALSE;
	description = "Где это гнездо?";
};


func int dia_fester_wonest_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_auftrag) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_wonest_info()
{
	AI_Output(other,self,"DIA_Fester_WoNest_15_00");	//Где это гнездо?
	AI_Output(self,other,"DIA_Fester_WoNest_08_01");	//В центре поля вон там, вон в той большой скале.
};


var int fester_choice;
const int FC_GOLD = 0;
const int FC_JOIN = 1;

instance DIA_FESTER_TOGETHER(C_INFO)
{
	npc = sld_816_fester;
	nr = 5;
	condition = dia_fester_together_condition;
	information = dia_fester_together_info;
	permanent = FALSE;
	description = "Мы могли бы атаковать это гнездо вместе...";
};


func int dia_fester_together_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_auftrag))
	{
		return TRUE;
	};
};

func void dia_fester_together_info()
{
	AI_Output(other,self,"DIA_Fester_Together_15_00");	//Мы могли бы атаковать это гнездо вместе...
	AI_Output(self,other,"DIA_Fester_Together_08_01");	//Ты хочешь помочь мне? Почему?
	Info_ClearChoices(dia_fester_together);
	Info_AddChoice(dia_fester_together,"Я хочу получить за это золото!",dia_fester_together_gold);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_fester_together,"Я хочу присоединиться к вам!",dia_fester_together_join);
	};
};

func void dia_fester_together_join()
{
	AI_Output(other,self,"DIA_Fester_Together_Join_15_00");	//Я хочу присоединиться к вам!
	AI_Output(self,other,"DIA_Fester_Together_Join_08_01");	//Ох, тогда ладно. Ты хочешь показать, что ты хороший боец...
	AI_Output(self,other,"DIA_Fester_Together_Join_08_02");	//(лукаво) Хорошо, давай расправимся с этими тварями вместе.
	FESTER_CHOICE = FC_JOIN;
	Info_ClearChoices(dia_fester_together);
};

func void dia_fester_together_gold()
{
	AI_Output(other,self,"DIA_Fester_Together_Gold_15_00");	//Я хочу получить за это золото!
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_01");	//(смеется) Ах ты шельмец! Ты хочешь воспользоваться моим положением, ха?
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_02");	//То есть, либо я заплачу тебе, либо отправлюсь к праотцам?
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_03");	//Хорошо. Я могу заплатить тебе 50 золотых - это все, что у меня есть.
	FESTER_CHOICE = FC_GOLD;
	Info_ClearChoices(dia_fester_together);
};


var int fester_losgeh_day;

instance DIA_FESTER_TOGETHERNOW(C_INFO)
{
	npc = sld_816_fester;
	nr = 6;
	condition = dia_fester_togethernow_condition;
	information = dia_fester_togethernow_info;
	permanent = TRUE;
	description = "Давай атаковать гнездо!";
};


func int dia_fester_togethernow_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_together) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_togethernow_info()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_15_00");	//Давай атаковать гнездо!
	if(Wld_IsTime(20,30,6,0))
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_01");	//В темноте? Нет, нам лучше дождаться рассвета.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_02");	//Прямо сейчас? А может, тебе сначала раздобыть снаряжение получше?
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_03");	//Ты мог бы сходить сначала на ферму...
		Info_ClearChoices(dia_fester_togethernow);
		Info_AddChoice(dia_fester_togethernow,"Хорошо, давай подождем еще немного...",dia_fester_togethernow_later);
		Info_AddChoice(dia_fester_togethernow,"Лучшей возможности, чем сейчас, не будет.",dia_fester_togethernow_now);
	};
};

func void dia_fester_togethernow_now()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Now_15_00");	//Лучшей возможности, чем сейчас, не будет.
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Now_08_01");	//Хорошо, давай посмотрим, на что ты способен.
	Npc_ExchangeRoutine(self,"GUIDE");
	FESTER_LOSGEH_DAY = b_getdayplus();
	MIS_FESTER_KILLBUGS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FESTERRAUBER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FESTERRAUBER,LOG_RUNNING);
	b_logentry(TOPIC_FESTERRAUBER,"Я собираюсь атаковать гнездо полевых хищников вместе с Фестером.");
	Info_ClearChoices(dia_fester_togethernow);
	AI_StopProcessInfos(self);
};

func void dia_fester_togethernow_later()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Later_15_00");	//Хорошо, давай подождем еще немного...
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Later_08_01");	//Ты знаешь, где найти меня...
	Info_ClearChoices(dia_fester_togethernow);
};


instance DIA_FESTER_INCAVE(C_INFO)
{
	npc = sld_816_fester;
	nr = 7;
	condition = dia_fester_incave_condition;
	information = dia_fester_incave_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fester_incave_condition()
{
	if((MIS_FESTER_KILLBUGS == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_BIGFARM_FELDREUBER4") <= 500))
	{
		self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
		return TRUE;
	};
};

func void dia_fester_incave_info()
{
	if(Wld_GetDay() > FESTER_LOSGEH_DAY)
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_00");	//Где ты шлялся, черт тебя побери?
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_01");	//Так вот куда они уволокли мертвых фермеров. Какая мерзость.
	};
	AI_Output(self,other,"DIA_Fester_InCave_08_02");	//Похоже, все эти грязные твари уничтожены.
	AI_Output(self,other,"DIA_Fester_InCave_08_03");	//Пойдем назад!
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_FESTER_WASMITABMACHUNG(C_INFO)
{
	npc = sld_816_fester;
	nr = 8;
	condition = dia_fester_wasmitabmachung_condition;
	information = dia_fester_wasmitabmachung_info;
	permanent = FALSE;
	description = "Что насчет нашего соглашения?";
};


func int dia_fester_wasmitabmachung_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_incave))
	{
		return TRUE;
	};
};

func void dia_fester_wasmitabmachung_info()
{
	AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_00");	//Что насчет нашего соглашения?
	if(FESTERS_GIANT_BUG_KILLED == 0)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_01");	//Ты шутишь? Ты же вообще ничего не делал.
	}
	else if(FESTER_CHOICE == FC_JOIN)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_02");	//Я мог бы помочь тебе вступить в наши ряды, но я не буду делать этого.
		AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_03");	//Почему?
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_04");	//Если я скажу кому-нибудь, что ты помог мне, они дадут мне новое задание.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_05");	//Ты понимаешь, что такая перспектива меня не воодушевляет?
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_06");	//Тебе не повезло, парень. Но я уверен, ты найдешь кого-нибудь еще, кто поможет тебе.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_07");	//Эй - ты хотел воспользоваться моим положением. А теперь я воспользуюсь твоим.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_08");	//Попробуй взглянуть на это дело с оптимизмом: ты получил опыт. А это что-то да значит, разве нет?
	};
	MIS_FESTER_KILLBUGS = LOG_OBSOLETE;
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGMILL_FIELD_MONSTER_04");
	Wld_InsertNpc(giant_bug,"NW_BIGMILL_FIELD_MONSTER_04");
};


var int fester_duell_day;
var int fester_fightverarscht;
var int fester_fightsylvio;

instance DIA_FESTER_PERMPRUEGEL(C_INFO)
{
	npc = sld_816_fester;
	nr = 9;
	condition = dia_fester_permpruegel_condition;
	information = dia_fester_permpruegel_info;
	permanent = TRUE;
	description = "Я думаю, тебе не помешает еще одна трепка.";
};


func int dia_fester_permpruegel_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_wasmitabmachung) || Npc_KnowsInfo(other,dia_jarvis_missionko) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void dia_fester_permpruegel_info()
{
	var int random;
	AI_Output(other,self,"DIA_Fester_PERMPruegel_15_00");	//Я думаю, тебе не помешает еще одна трепка.
	if(FESTER_DUELL_DAY < Wld_GetDay())
	{
		random = Hlp_Random(11);
		CreateInvItems(self,itmi_gold,random);
		FESTER_DUELL_DAY = Wld_GetDay();
	};
	if(Npc_KnowsInfo(other,dia_fester_wasmitabmachung) && (FESTER_FIGHTVERARSCHT == FALSE))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_01");	//Мне не нравится, когда меня обманывают.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_02");	//Я весь дрожу, я весь дрожу!
		FESTER_FIGHTVERARSCHT = TRUE;
	}
	else if(Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_03");	//Тебе не стоило связываться с Сильвио.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_04");	//Ты один из лизоблюдов Ли, да? Тогда ты ошибся адресом!
		FESTER_FIGHTSYLVIO = TRUE;
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_05");	//Какого черта тебе от меня надо?
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_06");	//Мне очень хочется посмотреть, как ты будешь валяться в грязи!
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_07");	//Тебе что мало, да?
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_FESTER_PICKPOCKET(C_INFO)
{
	npc = sld_816_fester;
	nr = 900;
	condition = dia_fester_pickpocket_condition;
	information = dia_fester_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_fester_pickpocket_condition()
{
	return c_beklauen(27,45);
};

func void dia_fester_pickpocket_info()
{
	Info_ClearChoices(dia_fester_pickpocket);
	Info_AddChoice(dia_fester_pickpocket,DIALOG_BACK,dia_fester_pickpocket_back);
	Info_AddChoice(dia_fester_pickpocket,DIALOG_PICKPOCKET,dia_fester_pickpocket_doit);
};

func void dia_fester_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fester_pickpocket);
};

func void dia_fester_pickpocket_back()
{
	Info_ClearChoices(dia_fester_pickpocket);
};

