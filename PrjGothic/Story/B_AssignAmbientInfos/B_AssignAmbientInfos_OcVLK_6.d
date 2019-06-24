
instance DIA_OCVLK_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ocvlk_6_exit_condition;
	information = dia_ocvlk_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ocvlk_6_exit_condition()
{
	return TRUE;
};

func void dia_ocvlk_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_OCVLK_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_ocvlk_6_people_condition;
	information = dia_ocvlk_6_people_info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int dia_ocvlk_6_people_condition()
{
	return TRUE;
};

func void dia_ocvlk_6_people_info()
{
	AI_Output(other,self,"DIA_OCVLK_6_PEOPLE_15_00");	//Кто командует здесь?
	AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_01");	//Гаронд командует всем фортом - вернее, тем, что от него осталось.
	AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_02");	//Но сам он не предпринимает практически ничего. Ну, если только кто-либо из его людей не попадет в беду.
	if(Npc_IsDead(engor) == FALSE)
	{
		AI_Output(self,other,"DIA_OCVLK_6_PEOPLE_06_03");	//Если тебе нужно снаряжение, поговори с Энгором. Ты найдешь его в доме напротив дома Гаронда.
	};
};


instance DIA_OCVLK_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_ocvlk_6_location_condition;
	information = dia_ocvlk_6_location_info;
	permanent = TRUE;
	description = "Что ты можешь рассказать мне о ситуации в Долине Рудников?";
};


func int dia_ocvlk_6_location_condition()
{
	if((KAPITEL <= 4) && (MIS_KILLEDDRAGONS < 4))
	{
		return TRUE;
	};
};

func void dia_ocvlk_6_location_info()
{
	AI_Output(other,self,"DIA_OCVLK_6_LOCATION_15_00");	//Что ты можешь рассказать мне о ситуации в Долине Рудников?
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_01");	//Меня беспокоит защитная стена орков. Я даже знать не хочу, что орки скрывают за ней.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_02");	//Сначала их было мало - они строили эту стену. А затем, однажды ночью, они приволокли осадные машины.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_03");	//Нам повезло, и мы смогли отразить эту атаку.
	AI_Output(self,other,"DIA_OCVLK_6_LOCATION_06_04");	//За стеной лежит море. Если еще прибудут корабли с орками, у нас не будет ни единого шанса.
};


instance DIA_OCVLK_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_ocvlk_6_standard_condition;
	information = dia_ocvlk_6_standard_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_ocvlk_6_standard_condition()
{
	return TRUE;
};

func void dia_ocvlk_6_standard_info()
{
	AI_Output(other,self,"DIA_OCVLK_6_STANDARD_15_00");	//Как дела?
	if(KAPITEL <= 3)
	{
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_01");	//Они говорили: 'Вступи в армию и у тебя не будет забот'. И вот как все вышло.
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_02");	//Теперь под страхом смерти запрещено даже приближаться к запасам продовольствия. Гаронд, похоже, боится, что мы соберем манатки и свалим отсюда. (горькая усмешка)
		AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_03");	//Мы все здесь сдохнем от голода, если эти чертовы драконы не убьют нас раньше!
	};
	if(KAPITEL == 4)
	{
		if(MIS_KILLEDDRAGONS < 4)
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_04");	//Охотники на драконов. Не смеши меня! Они ничего не изменят.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_05");	//Говорят, что все драконы убиты! Теперь у нас появился шанс!
		};
	};
	if(KAPITEL >= 5)
	{
		if(MIS_OCGATEOPEN == FALSE)
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_06");	//Все из-за этой проклятой руды. Нам бы лучше выбросить все, что мы наковыряли здесь. Может, тогда орки оставят нас в покое.
		}
		else
		{
			AI_Output(self,other,"DIA_OCVLK_6_STANDARD_06_07");	//Эти дурацкие ящики, что они навалили перед входом, не смогут остановить орков!
		};
	};
};

func void b_assignambientinfos_ocvlk_6(var C_NPC slf)
{
	dia_ocvlk_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_people.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_location.npc = Hlp_GetInstanceID(slf);
	dia_ocvlk_6_standard.npc = Hlp_GetInstanceID(slf);
};

