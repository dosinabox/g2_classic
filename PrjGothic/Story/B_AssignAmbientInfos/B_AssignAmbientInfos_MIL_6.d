
instance DIA_MIL_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_mil_6_exit_condition;
	information = dia_mil_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_6_exit_condition()
{
	return TRUE;
};

func void dia_mil_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_6_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_mil_6_join_condition;
	information = dia_mil_6_join_info;
	permanent = TRUE;
	description = "Что мне нужно сделать, чтобы вступить в ополчение?";
};


func int dia_mil_6_join_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_mil_6_join_info()
{
	AI_Output(other,self,"DIA_MIL_6_JOIN_15_00");	//Что мне нужно сделать, чтобы вступить в ополчение?
	AI_Output(self,other,"DIA_MIL_6_JOIN_06_01");	//Иди к лорду Андрэ и поговори с ним. С тех пор, как паладины пришли в город, он командует всем ополчением.
	if(c_npcisinquarter(self) != Q_KASERNE)
	{
		AI_Output(self,other,"DIA_MIL_6_JOIN_06_02");	//Ты найдешь его в казармах. Он практически всегда там.
	};
};


instance DIA_MIL_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_mil_6_people_condition;
	information = dia_mil_6_people_info;
	permanent = TRUE;
	description = "Расскажи мне об этих паладинах.";
};


func int dia_mil_6_people_condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_mil_6_people_info()
{
	AI_Output(other,self,"DIA_MIL_6_PEOPLE_15_00");	//Расскажи мне об этих паладинах.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_01");	//С тех пор, как паладины прибыли в Хоринис, они остановились в верхнем квартале города.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_02");	//Они никого туда больше не пускают. За исключением граждан города и ополчения, конечно же.
	AI_Output(self,other,"DIA_MIL_6_PEOPLE_06_03");	//Также несколько паладинов охраняет их корабль в гавани. Но они не особенно склонны к разговорам.
};


instance DIA_MIL_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_mil_6_location_condition;
	information = dia_mil_6_location_info;
	permanent = TRUE;
	description = "Что мне нужно знать об этом городе?";
};


func int dia_mil_6_location_condition()
{
	return TRUE;
};

func void dia_mil_6_location_info()
{
	AI_Output(other,self,"DIA_MIL_6_LOCATION_15_00");	//Что мне нужно знать об этом городе?
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_01");	//Паладины контролируют весь город. Ополчение полностью подчиняется им.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_02");	//Лорд Андрэ командует ополчением, и в то же время он выступает в роли судьи.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_03");	//Если тебе случится нарушить закон, тебе придется предстать перед ним.
	AI_Output(self,other,"DIA_MIL_6_LOCATION_06_04");	//Но он довольно снисходительный судья, насколько я знаю. Обычно провинившиеся отделываются лишь штрафом.
};


instance DIA_MIL_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_mil_6_standard_condition;
	information = dia_mil_6_standard_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_mil_6_standard_condition()
{
	return TRUE;
};

func void dia_mil_6_standard_info()
{
	AI_Output(other,self,"DIA_MIL_6_STANDARD_15_00");	//Что новенького?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_01");	//В последнее время город просто наводнен всяким сбродом.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_02");	//Воровство стало просто невыносимым. Лорд Андрэ подозревает, что это дело рук банды.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_03");	//Не так давно мы перевернули вверх дном весь портовый квартал, но ничего не нашли.
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_04");	//Похоже, мы взяли проблему с бандитами под контроль. Набеги случаются все реже и реже.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_05");	//Ситуация в городе становится все хуже и хуже. И все из-за этого сброда, наводнившего город. Прошлой ночью я следил в верхнем квартале за человеком в черной рясе.
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_06");	//Я уверен, что он задумал что-то худое. Но когда я приблизился к нему у дома губернатора, он просто исчез. Очень подозрительная личность...
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_07");	//Говорят, что лорд Хаген нанял наемников, чтобы те сражались против драконов. Мне-то все равно, хотя я сам был бы не прочь сразиться с драконом.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_MIL_6_STANDARD_06_08");	//Говорят, что все драконы уничтожены! Лорд Хаген собирает свои войска, чтобы изгнать оставшихся тварей из Долины Рудников.
	};
};

func void b_assignambientinfos_mil_6(var C_NPC slf)
{
	dia_mil_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_6_standard.npc = Hlp_GetInstanceID(slf);
};

