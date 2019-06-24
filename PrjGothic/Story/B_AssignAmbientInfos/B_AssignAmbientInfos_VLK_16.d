
instance DIA_VLK_16_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_16_exit_condition;
	information = dia_vlk_16_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_16_exit_condition()
{
	return TRUE;
};

func void dia_vlk_16_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_16_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_16_join_condition;
	information = dia_vlk_16_join_info;
	permanent = TRUE;
	description = "Я хочу стать гражданином этого города!";
};


func int dia_vlk_16_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_16_join_info()
{
	AI_Output(other,self,"DIA_VLK_16_JOIN_15_00");	//Я хочу стать гражданином этого города!
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_01");	//Ты поможешь нам защититься от орков?
	AI_Output(self,other,"DIA_VLK_16_JOIN_16_02");	//Если ты гражданин Хориниса, ты можешь поступить в ополчение - поговори с кем-нибудь из городской стражи.
};


instance DIA_VLK_16_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_16_people_condition;
	information = dia_vlk_16_people_info;
	permanent = TRUE;
	description = "Кто здесь самые влиятельные люди?";
};


func int dia_vlk_16_people_condition()
{
	return TRUE;
};

func void dia_vlk_16_people_info()
{
	AI_Output(other,self,"DIA_VLK_16_PEOPLE_15_00");	//Кто здесь самые влиятельные люди?
	AI_Output(self,other,"DIA_VLK_16_PEOPLE_16_01");	//Паладины, которые живут в верхнем квартале.
};


instance DIA_VLK_16_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_16_location_condition;
	information = dia_vlk_16_location_info;
	permanent = TRUE;
	description = "Что здесь интересного?";
};


func int dia_vlk_16_location_condition()
{
	return TRUE;
};

func void dia_vlk_16_location_info()
{
	AI_Output(other,self,"DIA_VLK_16_LOCATION_15_00");	//Что интересного можно найти здесь?
	AI_Output(self,other,"DIA_VLK_16_LOCATION_16_01");	//На рынке ты можешь купить практически любые товары.
};


instance DIA_VLK_16_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_16_standard_condition;
	information = dia_vlk_16_standard_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_vlk_16_standard_condition()
{
	return TRUE;
};

func void dia_vlk_16_standard_info()
{
	AI_Output(other,self,"DIA_VLK_16_STANDARD_15_00");	//Что новенького?
	if((KAPITEL == 1) || (KAPITEL == 2))
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_01");	//Ты разве не слышал? Орки уже около города! Остается надеяться, что у паладинов достаточно людей.
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_02");	//Интересно, почему фермеры больше не приходят на рынок?
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_03");	//Наемник, который, как все думали, убил Лотара, оказался невиновным. Нашли доказательства, что его оклеветали. Я слышала об этом на рынке.
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_04");	//Это возмутительно. Наемники Онара убили уважаемого паладина Лотара прямо у всех на глазах.
			AI_Output(self,other,"DIA_VLK_16_STANDARD_16_05");	//Но Иннос обязательно накажет их за их грехи. Никому не позволено поднимать руку на солдата нашего Владыки.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_06");	//Я слышала, что эти преступники бегут с фермы Онара. Говорят, они боятся возмездия паладинов лорда Хагена, и бегут от них назад, в Долину Рудников.
	};
	if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_VLK_16_STANDARD_16_07");	//Я слышала, что паладинам удалось уничтожить всех этих ужасных драконов из Долины Рудников.
	};
};

func void b_assignambientinfos_vlk_16(var C_NPC slf)
{
	dia_vlk_16_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_16_standard.npc = Hlp_GetInstanceID(slf);
};

