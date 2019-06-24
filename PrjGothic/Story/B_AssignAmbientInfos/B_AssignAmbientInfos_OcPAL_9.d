
instance DIA_OCPAL_9_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocpal_9_exit_condition;
	information = dia_ocpal_9_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocpal_9_exit_condition()
{
	return TRUE;
};

func void dia_ocpal_9_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCPAL_9_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocpal_9_people_condition;
	information = dia_ocpal_9_people_info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int dia_ocpal_9_people_condition()
{
	return TRUE;
};

func void dia_ocpal_9_people_info()
{
	AI_Output(other,self,"DIA_OCPAL_9_PEOPLE_15_00");	//Кто командует здесь?
	AI_Output(self,other,"DIA_OCPAL_9_PEOPLE_09_01");	//Гаронд. Но его работе не позавидуешь.
};


instance DIA_OCPAL_9_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocpal_9_location_condition;
	information = dia_ocpal_9_location_info;
	permanent = TRUE;
	description = "Что ты знаешь об этой долине?";
};


func int dia_ocpal_9_location_condition()
{
	return TRUE;
};

func void dia_ocpal_9_location_info()
{
	AI_Output(other,self,"DIA_OCPAL_9_LOCATION_15_00");	//Что ты знаешь об этой долине?
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_01");	//Ну, то что орки построили большую защитную стену. За этой стеной есть место, где они могут швартовать свои корабли.
	AI_Output(self,other,"DIA_OCPAL_9_LOCATION_09_02");	//Надеюсь, что орки не подтянут основные силы слишком быстро. По мне, так и тех, что уже есть, хватает с избытком.
};


instance DIA_OCPAL_9_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocpal_9_standard_condition;
	information = dia_ocpal_9_standard_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_ocpal_9_standard_condition()
{
	return TRUE;
};

func void dia_ocpal_9_standard_info()
{
	AI_Output(other,self,"DIA_OCPAL_4_STANDARD_15_00");	//Как дела?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_01");	//Драконы опять напали на нас! Но Иннос защитил нас в этом бою. Создания Белиара дорого заплатят за это!
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_02");	//Охотники на драконов! Нужно было послать нас, паладинов!
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_03");	//Теперь, когда мы избавились от этих драконов, мы можем разобраться с орками!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_04");	//Нам нужно доставить руду на корабль и убираться с этой проклятой земли.
		}
		else
		{
			AI_Output(self,other,"DIA_OCPAL_4_STANDARD_09_05");	//Предательство! Ворота нельзя было открывать! Смерть предателям!
		};
	};
};

func void b_assignambientinfos_ocpal_9(var C_NPC slf)
{
	dia_ocpal_9_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_people.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_location.npc = Hlp_GetInstanceID(slf);
	dia_ocpal_9_standard.npc = Hlp_GetInstanceID(slf);
};

