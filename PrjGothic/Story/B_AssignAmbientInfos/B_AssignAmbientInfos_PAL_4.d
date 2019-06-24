
instance DIA_PAL_4_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_pal_4_exit_condition;
	information = dia_pal_4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_4_exit_condition()
{
	return TRUE;
};

func void dia_pal_4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_4_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_pal_4_join_condition;
	information = dia_pal_4_join_info;
	permanent = TRUE;
	description = "Как мне стать паладином?";
};


func int dia_pal_4_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_pal_4_join_info()
{
	AI_Output(other,self,"DIA_PAL_4_JOIN_15_00");	//Как мне стать паладином?
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_01");	//Если у тебя действительно серьезные намерения, то сначала ты должен поступить в услужение паладинам.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_02");	//Иди в казармы и поговори с лордом Андрэ. Попробуй вступить в ополчение.
	AI_Output(self,other,"DIA_PAL_4_JOIN_04_03");	//Возможно, там у тебя появится шанс проявить себя.
};


instance DIA_PAL_4_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_pal_4_people_condition;
	information = dia_pal_4_people_info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int dia_pal_4_people_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_pal_4_people_info()
{
	AI_Output(other,self,"DIA_PAL_4_PEOPLE_15_00");	//Кто командует здесь?
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_01");	//Лорд Хаген - главнокомандующий всеми войсками на этом острове. Он занимает дом губернатора, пока мы расквартированы здесь.
	AI_Output(self,other,"DIA_PAL_4_PEOPLE_04_02");	//Но он очень занят. Если тебе что-то нужно, иди в казармы и поговори с лордом Андрэ.
};


instance DIA_PAL_4_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_pal_4_location_condition;
	information = dia_pal_4_location_info;
	permanent = TRUE;
	description = "Что вы, паладины, делаете здесь, в Хоринисе?";
};


func int dia_pal_4_location_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_4_location_info()
{
	AI_Output(other,self,"DIA_PAL_4_LOCATION_15_00");	//Что вы, паладины, делаете здесь, в Хоринисе?
	AI_Output(self,other,"DIA_PAL_4_LOCATION_04_01");	//Я не уполномочен сообщать тебе это.
};


instance DIA_PAL_4_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_pal_4_standard_condition;
	information = dia_pal_4_standard_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_pal_4_standard_condition()
{
	return TRUE;
};

func void dia_pal_4_standard_info()
{
	AI_Output(other,self,"DIA_PAL_4_STANDARD_15_00");	//Что новенького?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(KAPITEL <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_01");	//Теперь, когда мы знаем, что имеем дело с драконами, наш командующий наверняка вскоре что-то предпримет.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_4_STANDARD_04_02");	//У на все еще нет никаких новостей от нашего отряда в Долине Рудников. Это тревожный знак.
			};
		};
		if(KAPITEL >= 5)
		{
			AI_Output(self,other,"DIA_PAL_4_STANDARD_04_03");	//Слава Инносу! Драконы больше не угрожают нам. Теперь нам осталось только разобраться с орками, чтобы начать спокойно добывать руду.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_4_STANDARD_04_04");	//У меня нет времени на обсуждение слухов, ходящих в городе.
	};
};

func void b_assignambientinfos_pal_4(var C_NPC slf)
{
	dia_pal_4_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_4_standard.npc = Hlp_GetInstanceID(slf);
};

