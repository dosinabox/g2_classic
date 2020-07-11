
instance DIA_DRAGON_ROCK_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_rock_exit_condition;
	information = dia_dragon_rock_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_rock_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_rock_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Rock_Exit_20_00");	//Но хватит болтать. Твоя временная сила иссякла. Глаз потерял свою силу. Приготовься умереть.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_ROCK_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_rock_hello_condition;
	information = dia_dragon_rock_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_rock_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_rock_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_00");	//Еще один самонадеянный человечишка осмелился взобраться на мою скалу. Вы, люди, такие жалкие. Такие мужественные и такие слабые.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Rock_Hello_15_01");	//Смотри-ка, действительно разговаривает.
	};
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_02");	//Я вырву твои внутренности и скормлю их крысам.
	AI_Output(other,self,"DIA_Dragon_Rock_Add_15_00");	//Не так быстро. Со мной Глаз Инноса. Ты будешь повиноваться мне и отвечать на мои вопросы.
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_04");	//(ревет) Ах-х. Задавай свои вопросы.
};


instance DIA_DRAGON_ROCK_WERBISTDU(C_INFO)
{
	nr = 6;
	condition = dia_dragon_rock_werbistdu_condition;
	information = dia_dragon_rock_werbistdu_info;
	description = "Кто ты?";
};


func int dia_dragon_rock_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_rock_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_rock_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_WERBISTDU_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Dragon_Rock_WERBISTDU_20_01");	//Меня зовут Педракан, и я медленно-медленно буду снимать с тебя шкуру, когда доберусь до тебя.
};


instance DIA_DRAGON_ROCK_HIERARCHIE(C_INFO)
{
	nr = 7;
	condition = dia_dragon_rock_hierarchie_condition;
	information = dia_dragon_rock_hierarchie_info;
	description = "Кто самый сильный из вас, драконов?";
};


func int dia_dragon_rock_hierarchie_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_rock_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_rock_hierarchie_info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_HIERARCHIE_15_00");	//Кто самый сильный из вас, драконов?
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_01");	//Мы черпаем нашу силу из стихий этого мира. Иерархия очевидна и проста.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_02");	//Земля, покрытая мягкой почвой, дарует жизнь всем созданиям, живущим под солнцем. Но она может раскрыться и поглотить тебя целиком, если ты подойдешь слишком близко.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_03");	//Скала, которая скорее расколется, нежели поддастся, гордо возвышается над всем и похоронит беспечных под собой. А еще она дает лучшую защиту от прилива.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_04");	//Искры жизни живут в глубоких огнях этого мира. А еще огонь обжигает все своим дыханием, не оставляя за собой ничего, кроме пепла.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_05");	//Все эти стихии сохраняют и уничтожают. Но только в воде, которая стала твердой как скала, все превращается в вечную колонну из соли, где жизнь едва ли возможна.
};

func void b_assigndragontalk_rock(var C_NPC slf)
{
	dia_dragon_rock_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hierarchie.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

