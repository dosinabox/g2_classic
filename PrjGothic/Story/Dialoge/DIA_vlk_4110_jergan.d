
instance DIA_JERGAN_EXIT(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 999;
	condition = dia_jergan_exit_condition;
	information = dia_jergan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jergan_exit_condition()
{
	return TRUE;
};

func void dia_jergan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JERGAN_HALLO(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 2;
	condition = dia_jergan_hallo_condition;
	information = dia_jergan_hallo_info;
	permanent = FALSE;
	description = "Что ты здесь делаешь?";
};


func int dia_jergan_hallo_condition()
{
	return TRUE;
};

func void dia_jergan_hallo_info()
{
	AI_Output(other,self,"DIA_Jergan_Hallo_15_00");	//Что ты здесь делаешь?
	AI_Output(self,other,"DIA_Jergan_Hallo_13_01");	//Я пришел из замка. Меня послали поискать пропавших и разведать эту местность.
};


instance DIA_JERGAN_VERMISSTE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 2;
	condition = dia_jergan_vermisste_condition;
	information = dia_jergan_vermisste_info;
	permanent = FALSE;
	description = "Пропавших?";
};


func int dia_jergan_vermisste_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo))
	{
		return TRUE;
	};
};

func void dia_jergan_vermisste_info()
{
	AI_Output(other,self,"DIA_Jergan_Vermisste_15_00");	//Пропавших?
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_01");	//Некоторые сбежали, когда на нас напали драконы. Большинству из них не удалось выжить - это и неудивительно!
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_02");	//Но все же, если кому-то удалось выжить, я должен привести их назад.
};


instance DIA_JERGAN_BURG(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_burg_condition;
	information = dia_jergan_burg_info;
	permanent = FALSE;
	description = "Ты можешь помочь мне пробраться в замок?";
};


func int dia_jergan_burg_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void dia_jergan_burg_info()
{
	AI_Output(other,self,"DIA_Jergan_Burg_15_00");	//Ты можешь помочь мне пробраться в замок?
	AI_Output(self,other,"DIA_Jergan_Burg_13_01");	//Конечно, но ты должен оказать мне услугу.
	AI_Output(self,other,"DIA_Jergan_Burg_13_02");	//Если тебе удастся добраться до замка, поговори с паладином Ориком. Скажи ему, что его брат погиб здесь, у Прохода.
	Log_CreateTopic(TOPIC_ORICBRUDER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORICBRUDER,LOG_RUNNING);
	b_logentry(TOPIC_ORICBRUDER,"Когда я буду в замке, я должен сказать Орику, что его брат погиб в Проходе.");
};


instance DIA_JERGAN_GEGEND(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_gegend_condition;
	information = dia_jergan_gegend_info;
	permanent = TRUE;
	description = "Что мне нужно знать об этой местности?";
};


func int dia_jergan_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo))
	{
		return TRUE;
	};
};


var int jergan_tell;

func void dia_jergan_gegend_info()
{
	if(JERGAN_TELL == FALSE)
	{
		AI_Output(other,self,"DIA_Jergan_Gegend_15_00");	//Что мне нужно знать об этой местности?
		AI_Output(self,other,"DIA_Jergan_Gegend_13_01");	//Если ты хочешь выжить, беги от всего, что тебе встретится.
		AI_Output(self,other,"DIA_Jergan_Gegend_13_02");	//Эти зеленокожие твари взяли замок в кольцо уже несколько недель назад. К тому же, где-то здесь спрятались драконы.
	};
	AI_Output(self,other,"DIA_Jergan_Gegend_13_03");	//Вся Долина Рудников кишит орками. Куда бы ты ни направился, ты рискуешь нарваться на них.
	JERGAN_TELL = TRUE;
};


instance DIA_JERGAN_HILFE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_hilfe_condition;
	information = dia_jergan_hilfe_info;
	permanent = FALSE;
	description = "Как мне попасть в замок?";
};


func int dia_jergan_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_burg) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void dia_jergan_hilfe_info()
{
	AI_Output(other,self,"DIA_Jergan_Hilfe_15_00");	//Как мне попасть в замок?
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_01");	//Прежде всего, забудь о прямой дороге. Но если ты обойдешь замок с другой стороны, возможно, у тебя будет шанс.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_02");	//Тебе лучше держаться подальше от дорог и использовать реку. Лучше всего, если ты будешь плыть вниз по течению.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_03");	//Орки установили таран за замком. Ты можешь сделать так - подкрасться к оркам как можно ближе, а затем бежать со всех ног к тарану.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_04");	//У тебя может получиться, если ты достаточно быстр.
};


instance DIA_JERGAN_MINE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_mine_condition;
	information = dia_jergan_mine_info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int dia_jergan_mine_condition()
{
	if(Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000)
	{
		return TRUE;
	};
};

func void dia_jergan_mine_info()
{
	AI_Output(other,self,"DIA_Jergan_Mine_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Jergan_Mine_13_01");	//Я разведчик. Моя работа - следить за врагом. Но все эти снепперы совсем не облегчают мне жизнь.
	AI_Output(self,other,"DIA_Jergan_Mine_13_02");	//Хотя, сейчас самое время насобирать трофеев - если, конечно, ты знаешь, что делаешь.
};


instance DIA_JERGAN_CLAW(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_claw_condition;
	information = dia_jergan_claw_info;
	permanent = FALSE;
	description = "Ты можешь напучить меня этому?";
};


func int dia_jergan_claw_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,dia_jergan_mine) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jergan_claw_info()
{
	AI_Output(other,self,"DIA_Jergan_Claw_15_00");	//Ты можешь напучить меня этому?
	AI_Output(self,other,"DIA_Jergan_Claw_13_01");	//Я могу показать тебе, как отделять когти этих тварей.
};


instance DIA_JERGAN_TEACH(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_teach_condition;
	information = dia_jergan_teach_info;
	permanent = TRUE;
	description = "(изучить удаление когтей)";
};


func int dia_jergan_teach_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,dia_jergan_claw) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jergan_teach_info()
{
	AI_Output(other,self,"DIA_Jergan_Teach_15_00");	//Покажи мне, как отделять когти.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Jergan_Teach_13_01");	//Когти нужно отрубить одним точным и резким ударом. Тут нельзя колебаться, иначе ты испортишь трофей.
		AI_Output(self,other,"DIA_Jergan_Teach_13_02");	//Таким образом ты можешь отделять не только когти снепперов, но также ящеров и мракорисов.
	};
};


instance DIA_JERGAN_DIEGO(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_diego_condition;
	information = dia_jergan_diego_info;
	permanent = FALSE;
	description = "Ты знаешь, куда отправился Диего? ";
};


func int dia_jergan_diego_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && (Npc_KnowsInfo(other,dia_diegoow_hallo) == FALSE) && Npc_KnowsInfo(other,dia_parcival_diego))
	{
		return TRUE;
	};
};

func void dia_jergan_diego_info()
{
	AI_Output(other,self,"DIA_Jergan_Diego_15_00");	//Ты знаешь, куда отправился Диего?
	AI_Output(self,other,"DIA_Jergan_Diego_13_01");	//Диего? Он был одним из старателей Сильвестро. Но потом сбежал.
	AI_Output(self,other,"DIA_Jergan_Diego_13_02");	//Я видел его с двумя рыцарями и ящиком, недалеко отсюда.
	AI_Output(self,other,"DIA_Jergan_Diego_13_03");	//Видишь старую башню вон там справа? Иди туда, а затем по направлению к замку.
	AI_Output(self,other,"DIA_Jergan_Diego_13_04");	//Дорога идет через скалы справа. Вот туда они и пошли.
};


instance DIA_JERGAN_LEADER(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_leader_condition;
	information = dia_jergan_leader_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jergan_leader_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_IsDead(newmine_leadsnapper) && Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper))
	{
		return TRUE;
	};
};

func void dia_jergan_leader_info()
{
	AI_Output(self,other,"DIA_Jergan_Leader_13_00");	//Ты убил вожака стаи. И как - ты забрал когти этого зверя?
	if(Npc_HasItems(other,itat_clawleader) >= 1)
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_01");	//Да.
		AI_Output(self,other,"DIA_Jergan_Leader_13_02");	//Они, стоят целое состояние. Есть люди, которые коллекционируют такие вещи.
		AI_Output(self,other,"DIA_Jergan_Leader_13_03");	//Если ты найдешь правильного покупателя, то получишь за них целую кучу золота.
	}
	else
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_04");	//Нет.
		AI_Output(self,other,"DIA_Jergan_Leader_13_05");	//Это ты зря. Я уверен, они стоят целое состояние.
	};
};


instance DIA_JERGAN_PICKPOCKET(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 900;
	condition = dia_jergan_pickpocket_condition;
	information = dia_jergan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_jergan_pickpocket_condition()
{
	return c_beklauen(84,110);
};

func void dia_jergan_pickpocket_info()
{
	Info_ClearChoices(dia_jergan_pickpocket);
	Info_AddChoice(dia_jergan_pickpocket,DIALOG_BACK,dia_jergan_pickpocket_back);
	Info_AddChoice(dia_jergan_pickpocket,DIALOG_PICKPOCKET,dia_jergan_pickpocket_doit);
};

func void dia_jergan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jergan_pickpocket);
};

func void dia_jergan_pickpocket_back()
{
	Info_ClearChoices(dia_jergan_pickpocket);
};

