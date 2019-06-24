
instance DIA_BOLTAN_EXIT(C_INFO)
{
	npc = mil_313_boltan;
	nr = 999;
	condition = dia_boltan_exit_condition;
	information = dia_boltan_exit_info;
	permanent = TRUE;
	description = "Мне нужно идти.";
};


func int dia_boltan_exit_condition()
{
	return TRUE;
};

func void dia_boltan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BOLTAN_HALLO(C_INFO)
{
	npc = mil_313_boltan;
	nr = 1;
	condition = dia_boltan_hallo_condition;
	information = dia_boltan_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_boltan_hallo_condition()
{
	return TRUE;
};

func void dia_boltan_hallo_info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_00");	//Что тебе нужно?
};


instance DIA_BOLTAN_TOCONVICTS(C_INFO)
{
	npc = mil_313_boltan;
	nr = 2;
	condition = dia_boltan_toconvicts_condition;
	information = dia_boltan_toconvicts_info;
	permanent = TRUE;
	description = "Я хочу увидеть заключенных.";
};


func int dia_boltan_toconvicts_condition()
{
	return TRUE;
};

func void dia_boltan_toconvicts_info()
{
	AI_Output(other,self,"DIA_Boltan_Add_15_01");	//Я хочу увидеть заключенных.
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		if(other.guild == GIL_SLD)
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_07");	//Да, иди попрощайся со своим приятелем.
		}
		else
		{
			AI_Output(self,other,"DIA_Boltan_Add_05_06");	//Мы отпустили эту свинью, что убила паладина Лотара.
		};
	}
	else if((CANTHAR_AUSGELIEFERT == FALSE) && (SARAH_AUSGELIEFERT == FALSE) && (RENGARU_AUSGELIEFERT == FALSE) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_02");	//Все камеры сейчас пусты.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_04");	//Хорошо, приятель.
	}
	else if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_05");	//Конечно.
	}
	else
	{
		AI_Output(self,other,"DIA_Boltan_Add_05_03");	//Иди, но не задерживайся там слишком долго, понятно?
	};
};


instance DIA_BOLTAN_HALLOBENNET(C_INFO)
{
	npc = mil_313_boltan;
	nr = 1;
	condition = dia_boltan_hallobennet_condition;
	information = dia_boltan_hallobennet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_boltan_hallobennet_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_boltan_hallobennet_info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_08");	//Ты ведь пришел не затем, чтобы вызволить отсюда своего приятеля, нет?
	AI_Output(self,other,"DIA_Boltan_Add_05_09");	//Забудь об этом! Как только я подниму тревогу, парни будут здесь в мгновение ока!
	AI_Output(self,other,"DIA_Boltan_Add_05_10");	//И тогда мы сделаем из тебя котлету! (грязный смех)
};


instance DIA_BOLTAN_HALLOCANTHAR(C_INFO)
{
	npc = mil_313_boltan;
	nr = 1;
	condition = dia_boltan_hallocanthar_condition;
	information = dia_boltan_hallocanthar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_boltan_hallocanthar_condition()
{
	if(((KAPITEL != 3) || ((KAPITEL == 3) && ((MIS_RESCUEBENNET == LOG_SUCCESS) || (other.guild != GIL_SLD)))) && (CANTHAR_WIEDERRAUS == TRUE) && (CANTHAR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_boltan_hallocanthar_info()
{
	AI_Output(self,other,"DIA_Boltan_Add_05_11");	//Эй, ты тот парень, что написал жалобу на Кантара, тогровца.
	AI_Output(self,other,"DIA_Boltan_Add_05_12");	//Много людей приходило, чтобы похлопотать за него. Уважаемых людей.
	AI_Output(self,other,"DIA_Boltan_Add_05_13");	//Должно быть, произошло какое-то недоразумение. Такое бывает.
	AI_Output(self,other,"DIA_Boltan_Add_05_14");	//В будущем тебе стоит быть тщательнее выбирать, кого ты хочешь упечь в тюрьму.
};

