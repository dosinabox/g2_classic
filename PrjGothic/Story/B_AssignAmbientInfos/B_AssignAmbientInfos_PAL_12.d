
instance DIA_PAL_12_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_pal_12_exit_condition;
	information = dia_pal_12_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_12_exit_condition()
{
	return TRUE;
};

func void dia_pal_12_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_12_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_pal_12_join_condition;
	information = dia_pal_12_join_info;
	permanent = TRUE;
	description = "Я хочу стать паладином!";
};


func int dia_pal_12_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_pal_12_join_info()
{
	AI_Output(other,self,"DIA_PAL_12_JOIN_15_00");	//Я хочу стать паладином!
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_01");	//Ты? Не смеши меня! Да ты даже не служишь в городской страже.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_02");	//Если бы я не видел, что передо мной просто тупая деревенщина, я бы подумал, что ты издеваешься надо мной.
	AI_Output(self,other,"DIA_PAL_12_JOIN_12_03");	//Только лучшие из лучших, самые преданные последователи короля и нашего Владыки Инноса могут быть приняты в паладины.
};


instance DIA_PAL_12_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_pal_12_people_condition;
	information = dia_pal_12_people_info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int dia_pal_12_people_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_pal_12_people_info()
{
	AI_Output(other,self,"DIA_PAL_12_PEOPLE_15_00");	//Кто командует здесь?
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_01");	//Достопочтенный лорд Хаген. Но лорд Андрэ отвечает за все дела, касающиеся простого народа.
	AI_Output(self,other,"DIA_PAL_12_PEOPLE_12_02");	//Ты найдешь его в казармах. Может, тебе повезет, и он уделит тебе несколько минут своего драгоценного времени.
};


instance DIA_PAL_12_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_pal_12_location_condition;
	information = dia_pal_12_location_info;
	permanent = TRUE;
	description = "Что вы, паладины, делаете здесь, в Хоринисе?";
};


func int dia_pal_12_location_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_pal_12_location_info()
{
	AI_Output(other,self,"DIA_PAL_12_LOCATION_15_00");	//Что вы, паладины, делаете здесь, в Хоринисе?
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_01");	//Люди, задающие такие вопросы, кончают свою жизнь на виселице еще до того, как узнают это.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_02");	//ЕДИНСТВЕННОЕ, что лорд Андрэ не может себе позволить, это допустить, чтобы информация о наших задачах попала в руки шпионов.
	AI_Output(self,other,"DIA_PAL_12_LOCATION_12_03");	//Так что лучше следи за своими вопросами.
};


instance DIA_PAL_12_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_pal_12_standard_condition;
	information = dia_pal_12_standard_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_pal_12_standard_condition()
{
	return TRUE;
};

func void dia_pal_12_standard_info()
{
	AI_Output(other,self,"DIA_PAL_12_STANDARD_15_00");	//Как дела?
	if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		if(KAPITEL <= 4)
		{
			if(MIS_OLDWORLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_01");	//Теперь, когда мы знаем, что имеем дело с драконами, наш командующий наверняка вскоре что-то предпримет.
			}
			else
			{
				AI_Output(self,other,"DIA_PAL_12_STANDARD_12_02");	//У нас все еще нет никаких новостей от нашего отряда в Долине Рудников. Это тревожный знак.
			};
		};
		if(KAPITEL >= 5)
		{
			AI_Output(self,other,"DIA_PAL_12_STANDARD_12_03");	//Слава Инносу! Драконы больше не угрожают нам. Теперь, нам осталось только разобраться с орками, чтобы начать спокойно добывать руду.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_PAL_12_STANDARD_12_04");	//Ты что, действительно рассчитываешь, что я отвечу на этот вопрос, юноша?!
	};
};

func void b_assignambientinfos_pal_12(var C_NPC slf)
{
	dia_pal_12_exit.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_join.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_people.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_location.npc = Hlp_GetInstanceID(slf);
	dia_pal_12_standard.npc = Hlp_GetInstanceID(slf);
};

