
instance DIA_MIL_7_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_mil_7_exit_condition;
	information = dia_mil_7_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_7_exit_condition()
{
	return TRUE;
};

func void dia_mil_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_7_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_mil_7_join_condition;
	information = dia_mil_7_join_info;
	permanent = TRUE;
	description = "Я хочу вступить в ополчение!";
};


func int dia_mil_7_join_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_mil_7_join_info()
{
	AI_Output(other,self,"DIA_MIL_7_JOIN_15_00");	//Я хочу вступить в ополчение!
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_01");	//Ты даже не гражданин Хориниса! С чего ты взял, что лорд Андрэ возьмет тебя?
		AI_Output(self,other,"DIA_MIL_7_JOIN_07_02");	//Так каждый мог бы вступить, получить оружие и доспехи бесплатно, а затем исчезнуть с ними!
		if(c_npcisinquarter(self) != Q_KASERNE)
		{
			AI_Output(other,self,"DIA_MIL_7_JOIN_15_03");	//Но у меня серьезные намерения!
			AI_Output(self,other,"DIA_MIL_7_JOIN_07_04");	//Не надо объяснять это мне, попробуй объяснить это лорду Андрэ. Ты найдешь его в казармах.
		};
	}
	else
	{
		b_say(self,other,"$ABS_GOOD");
	};
};


instance DIA_MIL_7_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_mil_7_people_condition;
	information = dia_mil_7_people_info;
	permanent = TRUE;
	description = "Что ты знаешь о паладинах?";
};


func int dia_mil_7_people_condition()
{
	if(hero.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_mil_7_people_info()
{
	AI_Output(other,self,"DIA_MIL_7_PEOPLE_15_00");	//Что ты знаешь о паладинах?
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_01");	//Не многое. Никто точно не знает, зачем они здесь. Даже те, кто входит в городскую стражу.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_02");	//Они взяли всю власть в городе в свои руки. Выгнали губернатора из зала заседаний и судью из его палаты.
	AI_Output(self,other,"DIA_MIL_7_PEOPLE_07_03");	//Если тебя интересует мое мнение - то это даже хорошо. Этим напыщенным ослам стоило преподать урок.
};


instance DIA_MIL_7_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_mil_7_location_condition;
	information = dia_mil_7_location_info;
	permanent = TRUE;
	description = "А чем я могу заняться в городе?";
};


func int dia_mil_7_location_condition()
{
	return TRUE;
};

func void dia_mil_7_location_info()
{
	AI_Output(other,self,"DIA_MIL_7_LOCATION_15_00");	//А чем я могу заняться в городе?
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_01");	//Если ты не хочешь закончить жизнь в сточной канаве в порту, найди постоянную работу. Поспрашивай в нижней части города - возможно, тебе повезет.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_02");	//Если ты планируешь остаться в городе надолго, тебе стоит подумать о вступлении в ополчение или, по крайней мере, потренироваться в боевых искусствах.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_03");	//Инструкторы боя в казармах тренируют и гражданских.
	AI_Output(self,other,"DIA_MIL_7_LOCATION_07_04");	//Скоро придут орки, и тогда ты будешь рад каждому часу, проведенному на плацу.
};


instance DIA_MIL_7_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_mil_7_standard_condition;
	information = dia_mil_7_standard_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_mil_7_standard_condition()
{
	return TRUE;
};

func void dia_mil_7_standard_info()
{
	AI_Output(other,self,"DIA_MIL_7_STANDARD_15_00");	//Что новенького?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_01");	//Говорят, что фермеры взбунтовались. Только этого нам еще не хватало. Как раз в самый разгар войны с орками!
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_02");	//Паладины должны подавить восстание фермеров. Тот, кто нарушает закон, должен быть наказан. Особенно сейчас, когда идет война.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_03");	//Наемник, которого обвиняли в убийстве Лотара, оказался невиновным. Кто-то смог доказать, что его оклеветали.
		}
		else
		{
			AI_Output(self,other,"DIA_MIL_7_STANDARD_07_04");	//Один из наемников Онара убил благородного паладина Лотара. Но этого ублюдка удалось схватить и бросить за решетку.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_05");	//Часть наемников уже покинула ферму Онара. Некоторые проблемы решаются сами собой.
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_MIL_7_STANDARD_07_06");	//С драконами покончено, но это еще не все. Следующие на очереди орки. Их мы тоже скоро уничтожим!
	};
};

func void b_assignambientinfos_mil_7(var C_NPC slf)
{
	dia_mil_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_join.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_people.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_location.npc = Hlp_GetInstanceID(slf);
	dia_mil_7_standard.npc = Hlp_GetInstanceID(slf);
};

