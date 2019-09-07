
instance DIA_SLD_7_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_sld_7_exit_condition;
	information = dia_sld_7_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sld_7_exit_condition()
{
	return TRUE;
};

func void dia_sld_7_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_7_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_sld_7_join_condition;
	information = dia_sld_7_join_info;
	permanent = TRUE;
	description = "Я хочу присоединиться к вам!";
};


func int dia_sld_7_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_sld_7_join_info()
{
	AI_Output(other,self,"DIA_SLD_7_JOIN_15_00");	//Я хочу присоединиться к вам!
	if(MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_7_JOIN_07_01");	//Я слышал, ты вступил в ополчение. Такие люди, как ты, нужны нам!
	}
	else if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_7_JOIN_07_02");	//Я не считаю сбор ренты с фермеров таким уж сложным занятием, но если Онар готов платить за это, я не против.
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_7_JOIN_07_03");	//Ты? Сначала пройди испытание Торлофа, а там посмотрим!
	};
};


instance DIA_SLD_7_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_sld_7_people_condition;
	information = dia_sld_7_people_info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int dia_sld_7_people_condition()
{
	return TRUE;
};

func void dia_sld_7_people_info()
{
	AI_Output(other,self,"DIA_SLD_7_PEOPLE_15_00");	//Кто заправляет здесь?
	AI_Output(self,other,"DIA_SLD_7_PEOPLE_07_01");	//Нами командует Ли. Торлоф - его правая рука. Большинство парней подчиняется ему еще со времен колонии.
	AI_Output(self,other,"DIA_SLD_7_PEOPLE_07_02");	//А еще есть Сильвио. Он спустился с гор со своими людьми совсем недавно.
	AI_Output(self,other,"DIA_SLD_7_PEOPLE_07_03");	//Его люди составляют совсем небольшую часть наемников, но проблем от них выше крыши. Эти парни живут по собственным законам.
	AI_Output(self,other,"DIA_SLD_7_PEOPLE_07_04");	//А этот Сильвио тот еще сукин сын, так что будь поосторожнее, если пересечешься с ним.
};


instance DIA_SLD_7_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_sld_7_location_condition;
	information = dia_sld_7_location_info;
	permanent = TRUE;
	description = "Расскажи мне об этой ферме.";
};


func int dia_sld_7_location_condition()
{
	return TRUE;
};

func void dia_sld_7_location_info()
{
	AI_Output(other,self,"DIA_SLD_7_LOCATION_15_00");	//Расскажи мне об этой ферме.
	AI_Output(self,other,"DIA_SLD_7_LOCATION_07_01");	//Онар нанял нас охранять его собственность.
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_SLD_7_LOCATION_07_02");	//Так что даже не думай что-нибудь украсть или избить фермера. У тебя будут большие проблемы, понял?
	};
};


instance DIA_SLD_7_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_sld_7_standard_condition;
	information = dia_sld_7_standard_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_sld_7_standard_condition()
{
	return TRUE;
};

func void dia_sld_7_standard_info()
{
	AI_Output(other,self,"DIA_SLD_7_STANDARD_15_00");	//Что новенького?
	if(KAPITEL <= 2)
	{
		if(ENTEROW_KAPITEL2 == FALSE)
		{
			if(other.guild == GIL_SLD)
			{
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_01");	//С тех пор как ты присоединился к нам, на ферме все спокойно - ополчение здесь больше не появляется.
			}
			else
			{
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_02");	//Здесь ничего. Лучше поспрашивай в городе. Я думаю, они страдают от нехватки продовольствия. (смеется)
			};
		}
		else if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_03");	//Драконы в Долине Рудников! Не хотел бы я сейчас оказаться на месте паладинов.
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_04");	//Я думаю, король даст лорду Хагену хорошего пинка под зад, когда тот вернется с пустыми руками из-за драконов.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_05");	//Разве вы, паладины, не можете справиться с драконами? Вот это была бы работа для настоящих мужчин.
		};
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_06");	//Проблема с Беннетом разрешилась благодаря тебе. Сильвио в ярости. Он бы предпочел взять город штурмом и разнести там все на куски.
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_07");	//Он все время обвиняет Ли в нерешительности, и Беннет давал ему такой великолепный шанс...
			}
			else
			{
				AI_Output(self,other,"DIA_SLD_7_STANDARD_07_08");	//Я не знаю, почему ты помог Беннету, но поверь мне, этим ты спас город.
			};
		}
		else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_09");	//Этот случай с Беннетом мне очень не нравится. Возможно, нам все же стоит прислушаться к Сильвио и взять город штурмом.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_10");	//Что вы собираетесь сделать с Беннетом? А, ладно, я даже не хочу знать, вы скоро сами поймете, к чему это приведет.
		};
	};
	if(KAPITEL == 4)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_11");	//Я думал, ты тоже отправился в Долину. Вместе с Сильвио.
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_12");	//Никто из нас не будет против, если Сильвио останется в долине навсегда!
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_13");	//Это мужественный поступок - прийти сюда одному.
			AI_Output(self,other,"DIA_SLD_7_STANDARD_07_14");	//Но меня это не волнует, если только ты не начнешь собирать здесь налоги.
		};
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_SLD_7_STANDARD_07_15");	//Ох, я больше не могу выносить все это. Овцы, пастбища, деревья... Я хочу свалить отсюда.
	};
};

func void b_assignambientinfos_sld_7(var C_NPC slf)
{
	dia_sld_7_exit.npc = Hlp_GetInstanceID(slf);
	dia_sld_7_join.npc = Hlp_GetInstanceID(slf);
	dia_sld_7_people.npc = Hlp_GetInstanceID(slf);
	dia_sld_7_location.npc = Hlp_GetInstanceID(slf);
	dia_sld_7_standard.npc = Hlp_GetInstanceID(slf);
};

