
instance DIA_DRAGON_SWAMP_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_swamp_exit_condition;
	information = dia_dragon_swamp_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_swamp_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Swamp_Exit_20_00");	//Сила Глаза иссякла. Твоя жизнь закончится здесь, человек.
	self.flags = 0;
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	if(DJG_SWAMPPARTY_GOGOGO == TRUE)
	{
		if((DJG_SWAMPPARTY == TRUE) && (Npc_IsDead(djg_cipher) == FALSE))
		{
			b_startotherroutine(djg_rod,"SwampDragon");
		};
		b_startotherroutine(djg_cipher,"SwampDragon");
	};
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
};


instance DIA_DRAGON_SWAMP_HELLO(C_INFO)
{
	nr = 5;
	condition = dia_dragon_swamp_hello_condition;
	information = dia_dragon_swamp_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_swamp_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_00");	//Горе тебе, если ты сделаешь еще один шаг вперед!
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_01");	//Ах. Глаз Инноса, похоже, работает.
	};
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_02");	//Многие из вас приходили сюда. Я смел их всех.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_03");	//Хватит болтать. Твои громкие слова не пугают меня, вонючее порождение болота.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_04");	//Скажи мне то, что я хочу знать, или я утоплю тебя в твоей же крови.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_05");	//Ха-ха-ха. Ты смеешь угрожать мне, жалкий червь? Назови хотя бы одну причину, почему мне не разорвать тебя на мелкие клочки прямо сейчас.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_06");	//Я посланник Инноса, и со мной его Глаз. У тебя нет выбора. Ты должен подчиниться моей воле, или ты будешь уничтожен.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_07");	//(ревет) Ах-х. Говори, что тебе нужно от меня.
};


instance DIA_DRAGON_SWAMP_WERBISTDU(C_INFO)
{
	nr = 6;
	condition = dia_dragon_swamp_werbistdu_condition;
	information = dia_dragon_swamp_werbistdu_info;
	description = "Кто ты?";
};


func int dia_dragon_swamp_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_swamp_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WERBISTDU_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Dragon_Swamp_WERBISTDU_20_01");	//Меня зовут Пандродор. И лучше всего тебе побыстрее уползти обратно под камень, из которого ты выполз.
};


instance DIA_DRAGON_SWAMP_WOSINDDIEANDEREN(C_INFO)
{
	nr = 7;
	condition = dia_dragon_swamp_wosinddieanderen_condition;
	information = dia_dragon_swamp_wosinddieanderen_info;
	description = "Где мне найти остальных из вас, омерзительных созданий?";
};


func int dia_dragon_swamp_wosinddieanderen_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_swamp_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_wosinddieanderen_info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00");	//Где мне найти остальных из вас, омерзительных созданий?
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01");	//Стихии, из которых состоит все, поддерживают целостность этого мира.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02");	//Каждая из них отвечает за свою часть мира.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03");	//Ищи стихии и ты найдешь остальных.
};

func void b_assigndragontalk_swamp(var C_NPC slf)
{
	dia_dragon_swamp_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_wosinddieanderen.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

