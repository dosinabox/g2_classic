
instance DIA_VLK_8_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_8_exit_condition;
	information = dia_vlk_8_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_8_exit_condition()
{
	return TRUE;
};

func void dia_vlk_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_8_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_8_join_condition;
	information = dia_vlk_8_join_info;
	permanent = TRUE;
	description = "Я хочу стать гражданином этого города!";
};


func int dia_vlk_8_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_8_join_info()
{
	AI_Output(other,self,"DIA_VLK_8_JOIN_15_00");	//Я хочу стать гражданином этого города!
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_01");	//А мне ты зачем об этом говоришь? Иди к одному из мастеров ремесленников в нижней части города. Может быть, если тебе повезет, кому-нибудь из них нужен ученик.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_02");	//В противном случае, тебе придется обратиться к губернатору, чтобы он зарегистрировал тебя как гражданина.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_03");	//Но сейчас, ты можешь забыть об этом. С тех пор, как пришли паладины, губернатор больше ничего не решает.
	AI_Output(self,other,"DIA_VLK_8_JOIN_08_04");	//А у их главы, лорда Хагена, уж точно нет времени на такие пустяки.
};


instance DIA_VLK_8_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_8_people_condition;
	information = dia_vlk_8_people_info;
	permanent = TRUE;
	description = "Кто самые влиятельные граждане этого города?";
};


func int dia_vlk_8_people_condition()
{
	return TRUE;
};

func void dia_vlk_8_people_info()
{
	AI_Output(other,self,"DIA_VLK_8_PEOPLE_15_00");	//Кто самые влиятельные граждане этого города?
	AI_Output(self,other,"DIA_VLK_8_PEOPLE_08_01");	//Кроме паладинов... мастера ремесленники из нижней части города. Они очень влиятельны.
};


instance DIA_VLK_8_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_8_location_condition;
	information = dia_vlk_8_location_info;
	permanent = TRUE;
	description = "Что здесь интересного?";
};


func int dia_vlk_8_location_condition()
{
	return TRUE;
};

func void dia_vlk_8_location_info()
{
	AI_Output(other,self,"DIA_VLK_8_LOCATION_15_00");	//Что интересного здесь можно увидеть?
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_01");	//Большой корабль, на котором паладины приплыли в гавань. Это огромное судно! Тебе обязательно нужно взглянуть на него.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_02");	//Но я сомневаюсь, что они пустят тебя на борт. Паладины охраняют этот корабль лучше, чем королевские бриллианты.
	AI_Output(self,other,"DIA_VLK_8_LOCATION_08_03");	//Что неудивительно. Это единственное морское судно на многие мили вокруг.
};


instance DIA_VLK_8_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_8_standard_condition;
	information = dia_vlk_8_standard_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_vlk_8_standard_condition()
{
	return TRUE;
};

func void dia_vlk_8_standard_info()
{
	AI_Output(other,self,"DIA_VLK_8_STANDARD_15_00");	//Что новенького?
	if((KAPITEL == 1) || (KAPITEL == 2))
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_01");	//Все ждут, когда паладины объявят, зачем они сюда прибыли. Я полагаю, что из-за орков. Они, наверняка, скоро нападут на нас!
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_02");	//Паладины, может быть, и благословлены Инносом, но когда орды орков появятся здесь, я думаю, нам всем несдобровать.
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_03");	//Я слышал, что паладины здесь только затем, чтобы выковырять из острова всю руду. Для войны на материке, как они говорят.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_04");	//Ты понимаешь, что это означает? Король даже пальцем не пошевелит, если мы все тут погибнем во время атаки орков.
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_05");	//Я попробую попасть на корабль, когда паладины будут поднимать якорь.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_06");	//Говорят, что орки прилетят сюда на огромных драконах, размером с половину города! У нас нет ни единого шанса!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_8_STANDARD_08_07");	//Говорят, что все драконы уничтожены. Неужели это правда?
	};
};

func void b_assignambientinfos_vlk_8(var C_NPC slf)
{
	dia_vlk_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_8_standard.npc = Hlp_GetInstanceID(slf);
};

