
instance DIA_BAU_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bau_1_exit_condition;
	information = dia_bau_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bau_1_exit_condition()
{
	return TRUE;
};

func void dia_bau_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_1_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_bau_1_join_condition;
	information = dia_bau_1_join_info;
	permanent = TRUE;
	description = "Расскажи мне подробнее об этих наемниках.";
};


func int dia_bau_1_join_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_bau_1_join_info()
{
	AI_Output(other,self,"DIA_BAU_1_JOIN_15_00");	//Расскажи мне подробнее об этих наемниках.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_01");	//Я могу только посоветовать держаться от них подальше.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_02");	//Если одному из них не понравится твое лицо, он может не раздумывая заехать тебе по носу.
	AI_Output(self,other,"DIA_BAU_1_JOIN_01_03");	//Конечно, после этого ты можешь пожаловаться Ли, но нос-то уже будет сломан.
};


instance DIA_BAU_1_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_1_people_condition;
	information = dia_bau_1_people_info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int dia_bau_1_people_condition()
{
	return TRUE;
};

func void dia_bau_1_people_info()
{
	AI_Output(other,self,"DIA_BAU_1_PEOPLE_15_00");	//Кто заправляет здесь?
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_01");	//Это ферма Онара. Здесь он принимает все решения.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_02");	//Позволь мне дать тебе совет: не ввязывайся в драку с его наемниками. С этими парнями шутить не стоит.
	AI_Output(self,other,"DIA_BAU_1_PEOPLE_01_03");	//Сильвио - это вообще отъявленный бандит. Но их предводитель, Ли, вполне нормальный парень.
};


instance DIA_BAU_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_1_location_condition;
	information = dia_bau_1_location_info;
	permanent = TRUE;
	description = "А что здесь есть интересного?";
};


func int dia_bau_1_location_condition()
{
	return TRUE;
};

func void dia_bau_1_location_info()
{
	AI_Output(other,self,"DIA_BAU_1_LOCATION_15_00");	//А что здесь есть интересного?
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_01");	//Здесь только поля и фермы. И горстка наемников. Но почти все они находятся на востоке, на ферме Онара.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_02");	//К северу располагается ферма Секоба, но туда они заглядывают, только чтобы собрать ренту.
	AI_Output(self,other,"DIA_BAU_1_LOCATION_01_03");	//На юге находится проход к ферме Бенгара.
};


instance DIA_BAU_1_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_1_standard_condition;
	information = dia_bau_1_standard_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_bau_1_standard_condition()
{
	return TRUE;
};

func void dia_bau_1_standard_info()
{
	AI_Output(other,self,"DIA_BAU_1_STANDARD_15_00");	//Что новенького?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_01");	//Онар нанял наемников, чтобы те защищали его от городского ополчения. Если бы не наемники, они отняли бы у нас все, до последней овцы!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_02");	//Немного. Как всегда, одни и те же проблемы. Ополчение, орки и полевые хищники.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_03");	//Странные дела творятся здесь. Несколько дней назад я видел фигуру в черном. Это был не человек.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_04");	//Здесь все чаще и чаще появляются орки. Иногда мне кажется, что вместо каждого убитого орка появляются еще двое.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_1_STANDARD_01_05");	//Паладины идут в Долину Рудников. Что это все значит? Здесь никого не останется, кто держал бы ополчение в узде.
	};
};

func void b_assignambientinfos_bau_1(var C_NPC slf)
{
	dia_bau_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_1_standard.npc = Hlp_GetInstanceID(slf);
};

