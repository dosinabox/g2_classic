
instance DIA_SLD_6_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_sld_6_exit_condition;
	information = dia_sld_6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sld_6_exit_condition()
{
	return TRUE;
};

func void dia_sld_6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_6_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_sld_6_join_condition;
	information = dia_sld_6_join_info;
	permanent = TRUE;
	description = "Я хочу присоединиться к вам!";
};


func int dia_sld_6_join_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_sld_6_join_info()
{
	AI_Output(other,self,"DIA_SLD_6_JOIN_15_00");	//Я хочу присоединиться к вам!
	if(MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_01");	//Я слышал об этом деле с ополчением. Торлоф говорит, что ты прошел испытание. Ты получишь мой голос.
	}
	else if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_02");	//Обирать фермеров - это одно, но вступать в бой с ополчением - это совсем другое. Если Онар найдет место для тебя, я буду не против.
	}
	else
	{
		AI_Output(self,other,"DIA_SLD_6_JOIN_06_03");	//Поговори с Торлофом. Он покажет тебе... (смеется)
	};
};


instance DIA_SLD_6_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_sld_6_people_condition;
	information = dia_sld_6_people_info;
	permanent = TRUE;
	description = "Кто командует здесь?";
};


func int dia_sld_6_people_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_6_people_info()
{
	AI_Output(other,self,"DIA_SLD_6_PEOPLE_15_00");	//Кто заправляет здесь?
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_01");	//Эта ферма принадлежит Онару, если ты это имеешь в виду. Но нами командует Ли.
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_02");	//Он был генералом в королевской армии. Но он больше не на дружеской ноге с королем. (смеется)
	AI_Output(self,other,"DIA_SLD_6_PEOPLE_06_03");	//Запомни его имя. Если у тебя возникнут проблемы здесь, он, пожалуй, единственный, кто может решить их. Все остальные просто снимут с тебя шкуру.
};


instance DIA_SLD_6_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_sld_6_location_condition;
	information = dia_sld_6_location_info;
	permanent = TRUE;
	description = "Вы охраняете фермеров?";
};


func int dia_sld_6_location_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_6_location_info()
{
	AI_Output(other,self,"DIA_SLD_6_LOCATION_15_00");	//Вы охраняете фермеров?
	AI_Output(self,other,"DIA_SLD_6_LOCATION_06_01");	//Мы охраняем не только ферму Онара, но и всю эту долину.
	AI_Output(self,other,"DIA_SLD_6_LOCATION_06_02");	//Онар хочет, чтобы мы жестко пресекали любые беспорядки. Так что постарайся вести себя как положено.
};


instance DIA_SLD_6_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_sld_6_standard_condition;
	information = dia_sld_6_standard_info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int dia_sld_6_standard_condition()
{
	return TRUE;
};

func void dia_sld_6_standard_info()
{
	AI_Output(other,self,"DIA_SLD_6_STANDARD_15_00");	//В чем дело?
	if(KAPITEL <= 2)
	{
		if(ENTEROW_KAPITEL2 == FALSE)
		{
			if(other.guild == GIL_SLD)
			{
				AI_Output(self,other,"DIA_SLD_6_STANDARD_06_01");	//Ты теперь один из нас, парень!
			}
			else
			{
				AI_Output(self,other,"DIA_SLD_6_STANDARD_06_02");	//Чего тебе нужно?
			};
		}
		else if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_03");	//Когда я услышал о драконах, я сначала даже не поверил.
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_04");	//Дракон - вот это настоящий противник. Это не то, что какая-то там овца или полусонный ополченец.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_05");	//Как там ваш лорд Хаген, он еще не обгадил штаны от страха перед драконами?
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_06");	//Похоже, теперь ему придется оторвать свою вельможную задницу от кресла и выползти из города.
		};
	};
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_07");	//Лорд Хаген может считать себя везунчиком. Еще несколько дней - и мы бы ворвались в город и освободили Беннета сами.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_08");	//Если Беннета не выпустят из тюрьмы, мы сами пойдем туда и освободим его.
		};
	};
	if(KAPITEL == 4)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_09");	//Что ты все ошиваешься здесь? Разве ты не отправился в долину вместе с остальными?
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_10");	//Чтоб вы там все и остались.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_11");	//Ты должен идти в Долину Рудников. Я слышал, что этим беднягам там необходима помощь.
		};
	};
	if(KAPITEL >= 5)
	{
		if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_12");	//Когда ты появился здесь, я сразу понял, что ты все здесь перевернешь вверх дном.
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_13");	//Но драконы? Это что-то! Теперь вряд ли кто-то рискнет связываться с тобой.
		}
		else
		{
			AI_Output(self,other,"DIA_SLD_6_STANDARD_06_14");	//Я поражен. Ты не на нашей стороне, но победа над драконами - это великий подвиг.
		};
	};
};

func void b_assignambientinfos_sld_6(var C_NPC slf)
{
	dia_sld_6_exit.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_join.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_people.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_location.npc = Hlp_GetInstanceID(slf);
	dia_sld_6_standard.npc = Hlp_GetInstanceID(slf);
};

