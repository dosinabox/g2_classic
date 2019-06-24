
instance DIA_BAU_13_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bau_13_exit_condition;
	information = dia_bau_13_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bau_13_exit_condition()
{
	return TRUE;
};

func void dia_bau_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BAU_13_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_bau_13_join_condition;
	information = dia_bau_13_join_info;
	permanent = TRUE;
	description = "Расскажи мне подробнее об этих наемниках!";
};


func int dia_bau_13_join_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_bau_13_join_info()
{
	AI_Output(other,self,"DIA_BAU_13_JOIN_15_00");	//Расскажи мне подробнее об этих наемниках!
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_01");	//Если у тебя с ними какие-то проблемы, иди к Ли. Мы, фермеры, всегда так делаем. Он держит своих людей в ежовых рукавицах.
	AI_Output(self,other,"DIA_BAU_13_JOIN_13_02");	//Если кто-то из них ведет себя неправильно, он рискует нарваться на неприятности.
};


instance DIA_BAU_13_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_bau_13_people_condition;
	information = dia_bau_13_people_info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int dia_bau_13_people_condition()
{
	return TRUE;
};

func void dia_bau_13_people_info()
{
	AI_Output(other,self,"DIA_BAU_13_PEOPLE_15_00");	//Кто заправляет здесь?
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_01");	//Если тебе интересно мое мнение - то наемники. Конечно, Онар платит им, но только Иннос знает, сколько еще они будут повиноваться его приказам.
	AI_Output(self,other,"DIA_BAU_13_PEOPLE_13_02");	//Я не хотел бы оказаться в его шкуре, если до наемников вдруг дойдет, что без него можно обойтись.
};


instance DIA_BAU_13_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_bau_13_location_condition;
	information = dia_bau_13_location_info;
	permanent = TRUE;
	description = "Что ты можешь рассказать мне об этом квартале?";
};


func int dia_bau_13_location_condition()
{
	return TRUE;
};

func void dia_bau_13_location_info()
{
	AI_Output(other,self,"DIA_BAU_13_LOCATION_15_00");	//Что ты можешь сказать об этом районе?
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_01");	//Здесь есть три фермы. Ферма Онара к востоку и Секоба к северу в конце долины.
	AI_Output(self,other,"DIA_BAU_13_LOCATION_13_02");	//На юго-западе есть проход на высокогорное плато. Там находится ферма Бенгара.
};


instance DIA_BAU_13_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_bau_13_standard_condition;
	information = dia_bau_13_standard_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_bau_13_standard_condition()
{
	return TRUE;
};

func void dia_bau_13_standard_info()
{
	AI_Output(other,self,"DIA_BAU_13_STANDARD_15_00");	//Что новенького?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_01");	//Войска из города больше не забирают наш урожай и скот! Они не захотели играть в эту игру, когда мы начали защищаться!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_02");	//Паладинов из города не волнует судьба фермеров. Если нападут орки, мы будем брошены на произвол судьбы.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_03");	//Драконы! Ходят слухи, что в Долине Рудников появились драконы. Они скоро доберутся до Прохода!
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_04");	//Говорят, даже, что бандиты с гор направились в Долину Рудников. Ну, по мне - так это слишком опасно.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_BAU_13_STANDARD_13_05");	//Когда налоги будут снижены, и нам будут достойно платить за нашу работу, тогда мы опять будем торговать с городом.
	};
};

func void b_assignambientinfos_bau_13(var C_NPC slf)
{
	dia_bau_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_join.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_people.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_location.npc = Hlp_GetInstanceID(slf);
	dia_bau_13_standard.npc = Hlp_GetInstanceID(slf);
};

