
instance DIA_OCVLK_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocvlk_1_exit_condition;
	information = dia_ocvlk_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocvlk_1_exit_condition()
{
	return TRUE;
};

func void dia_ocvlk_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_1_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocvlk_1_people_condition;
	information = dia_ocvlk_1_people_info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int dia_ocvlk_1_people_condition()
{
	if((KAPITEL <= 4) && (MIS_KILLEDDRAGONS < 4))
	{
		return TRUE;
	};
};

func void dia_ocvlk_1_people_info()
{
	AI_Output(other,self,"DIA_OCVLK_1_PEOPLE_15_00");	//Кто командует здесь?
	AI_Output(self,other,"DIA_OCVLK_1_PEOPLE_01_01");	//Командующий Гаронд. Но с тех пор, как ситуация ухудшилась, он не выходил из тронного зала. Боюсь, что это все плохо кончится.
};


instance DIA_OCVLK_1_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocvlk_1_location_condition;
	information = dia_ocvlk_1_location_info;
	permanent = TRUE;
	description = "Что тебе известно о Долине Рудников?";
};


func int dia_ocvlk_1_location_condition()
{
	if((KAPITEL <= 4) && (MIS_KILLEDDRAGONS < 4))
	{
		return TRUE;
	};
};

func void dia_ocvlk_1_location_info()
{
	AI_Output(other,self,"DIA_OCVLK_1_LOCATION_15_00");	//Что тебе известно о Долине Рудников?
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_01");	//Насколько я знаю, несколько наших парней находятся в шахтах и все еще добывают руду.
	AI_Output(self,other,"DIA_OCVLK_1_LOCATION_01_02");	//Я бы не хотел поменяться с ними местами. Вся долина кишит орками. Не говоря уже о драконах.
};


instance DIA_OCVLK_1_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocvlk_1_standard_condition;
	information = dia_ocvlk_1_standard_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_ocvlk_1_standard_condition()
{
	return TRUE;
};

func void dia_ocvlk_1_standard_info()
{
	AI_Output(other,self,"DIA_OCVLK_1_STANDARD_15_00");	//Как дела?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_01");	//Орки загнали нас в угол, как и хотели! Без подкрепления никому из нас не выжить! Я удивлен, что драконы все еще не прикончили нас.
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_02");	//По крайней мере, скоро мы, наконец, получим подкрепление.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_03");	//Я слышал, что драконы были уничтожены? Слава Инносу!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_04");	//Все эта проклятая руда. Нам нужно было сбросить все наши запасы руды со стен крепости. Может быть, тогда орки оставили бы нас в покое.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_1_STANDARD_01_05");	//Эти идиотские ящики, что они второпях навалили перед входом, не смогут остановить орков!
		};
	};
};

func void b_assignambientinfos_ocvlk_1(var C_NPC slf)
{
	dia_ocvlk_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_1_standard.npc = Hlp_GetInstanceID(slf);
};

