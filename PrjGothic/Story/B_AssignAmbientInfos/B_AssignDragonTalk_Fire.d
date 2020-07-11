
instance DIA_DRAGON_FIRE_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_fire_exit_condition;
	information = dia_dragon_fire_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_fire_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Fire_Exit_20_00");	//Глаз потерял свою силу, и тебе не дожить до следующей зари.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
};


instance DIA_DRAGON_FIRE_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_fire_hello_condition;
	information = dia_dragon_fire_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_fire_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_00");	//Поверить не могу, что еще находятся люди, готовые отдать свою жизнь за то, чтобы просто увидеть живого дракона.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_01");	//Ты довольно чисто говоришь для такого громоздкого монстра.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_02");	//Я пришел не затем, чтобы увидеть тебя. Боюсь, цели мои несколько более радикальны.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_03");	//Ты хочешь сказать, что готов вызвать меня на бой?
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_04");	//Ха-ха-ха. Я сломаю твою хлипкую шею.
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_05");	//Не так быстро, дружок. Со мной Глаз Инноса. Ты не можешь сопротивляться моей воле. Отвечай на мои вопросы, иначе тебя ждет невыносимая агония.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_06");	//(ревет) Ах-х. Тогда задавай свои глупые вопросы, пока еще можешь. Твоя сила долго не продлится.
};


instance DIA_DRAGON_FIRE_WERBISTDU(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_werbistdu_condition;
	information = dia_dragon_fire_werbistdu_info;
	description = "Кто ты?";
};


func int dia_dragon_fire_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_fire_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_fire_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_WerBistDu_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_01");	//Меня зовут Феоматар, и это все, что ты узнаешь обо мне.
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_02");	//Когда меня отпустят чары Глаза, ты сгоришь в огне.
};


instance DIA_DRAGON_FIRE_HORT(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_hort_condition;
	information = dia_dragon_fire_hort_info;
	description = "Где твоя сокровищница?";
};


func int dia_dragon_fire_hort_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_fire_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_fire_hort_info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_HORT_15_00");	//У каждого дракона есть сокровищница, где он хранит свои сокровища. А где твоя сокровищница?
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_01");	//В месте, которое будет недоступно для тебя, когда я освобожусь от уз Глаза.
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_02");	//Я храню свои сокровища высоко в этих горячих утесах, куда практически невозможно добраться такому бескрылому созданию вроде тебя.
};

func void b_assigndragontalk_fire(var C_NPC slf)
{
	dia_dragon_fire_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hort.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

