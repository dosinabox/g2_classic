
instance DIA_VLK_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_6_exit_condition;
	information = dia_vlk_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_6_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_6_join_condition;
	information = dia_vlk_6_join_info;
	permanent = TRUE;
	description = "Как мне стать гражданином этого города?";
};


func int dia_vlk_6_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_6_join_info()
{
	AI_Output(other,self,"DIA_VLK_6_JOIN_15_00");	//Как мне стать гражданином этого города?
	AI_Output(self,other,"DIA_VLK_6_JOIN_06_01");	//Ты хочешь осесть здесь? Сейчас? Когда все указывает на приближение конца света?
	AI_Output(other,self,"DIA_VLK_6_JOIN_15_02");	//Я не планировал остаться здесь навечно.
	AI_Output(self,other,"DIA_VLK_6_JOIN_06_03");	//Хочешь совет? Тебе нужно бежать отсюда, и чем дальше, тем лучше. Но, впрочем, если ты настаиваешь, то можешь поговорить с кем-нибудь из влиятельных горожан.
};


instance DIA_VLK_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_6_people_condition;
	information = dia_vlk_6_people_info;
	permanent = TRUE;
	description = "А где мне найти влиятельных граждан Хориниса?";
};


func int dia_vlk_6_people_condition()
{
	return TRUE;
};

func void dia_vlk_6_people_info()
{
	AI_Output(other,self,"DIA_VLK_6_PEOPLE_15_00");	//А где мне найти влиятельных граждан Хориниса?
	AI_Output(self,other,"DIA_VLK_6_PEOPLE_06_01");	//Попробуй обратиться к кузнецу или плотнику в нижней части города. Там же ты найдешь и других уважаемых мастеров.
	AI_Output(self,other,"DIA_VLK_6_PEOPLE_06_02");	//К их словам здесь прислушиваются даже паладины и городская стража.
};


instance DIA_VLK_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_6_location_condition;
	information = dia_vlk_6_location_info;
	permanent = TRUE;
	description = "Как мне научиться ориентироваться в городе?";
};


func int dia_vlk_6_location_condition()
{
	return TRUE;
};

func void dia_vlk_6_location_info()
{
	AI_Output(other,self,"DIA_VLK_6_LOCATION_15_00");	//Как мне научиться ориентироваться в городе?
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_01");	//Тебе кажется, что здесь не так-то просто найти дорогу? Даже указатели не всегда помогают?
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_02");	//Если у тебя все так плохо с ориентированием, тебе лучше спуститься в гавань - если ты найдешь путь туда - и поискать дом картографа.
	AI_Output(self,other,"DIA_VLK_6_LOCATION_06_03");	//Он находится рядом с кабаком у причала. У Ибрагима наверняка найдется карта города для тебя.
};


instance DIA_VLK_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_6_standard_condition;
	information = dia_vlk_6_standard_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_vlk_6_standard_condition()
{
	return TRUE;
};

func void dia_vlk_6_standard_info()
{
	AI_Output(other,self,"DIA_VLK_6_STANDARD_15_00");	//Что новенького?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_01");	//С тех пор, как рухнул Барьер, город заполонили бандиты. Но паладины сидят сложа руки. Что они вообще тогда здесь делают, черт возьми?
	};
	if(KAPITEL == 2)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_02");	//Последнее время проблема с бандитами не стоит так остро. Похоже, кто-то, наконец, взялся за них.
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_VLK_6_STANDARD_06_03");	//Они отпустили этого грязного наемника, убившего паладина. По-моему, лучше его было все же повесить.
		}
		else
		{
			AI_Output(self,other,"DIA_VLK_6_STANDARD_06_04");	//Говорят, что один из наемников Онара убил паладина. Убийцу поймали и бросили за решетку. Скоро его повесят.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_05");	//Интересно, есть хоть доля правды в этих рассказах о драконах...
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_VLK_6_STANDARD_06_06");	//Говорят, что лорд Хаген собирает своих людей, чтобы освободить Долину Рудников. Наконец-то паладины зашевелились!
	};
};

func void b_assignambientinfos_vlk_6(var C_NPC slf)
{
	dia_vlk_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_6_standard.npc = Hlp_GetInstanceID(slf);
};

