
instance DIA_GORNOW_EXIT(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 999;
	condition = dia_gornow_exit_condition;
	information = dia_gornow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornow_exit_condition()
{
	return TRUE;
};

func void dia_gornow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNOW_HELLO(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 2;
	condition = dia_gornow_hello_condition;
	information = dia_gornow_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gornow_hello_condition()
{
	return TRUE;
};

func void dia_gornow_hello_info()
{
	var C_NPC milten;
	milten = Hlp_GetNpc(pc_mage_ow);
	AI_Output(other,self,"DIA_GornOW_Hello_15_00");	//Хватит бездельничать здесь - ты свободен!
	AI_Output(self,other,"DIA_GornOW_Hello_12_01");	//Да уж. Давно пора было вытащить меня отсюда.
	AI_Output(self,other,"DIA_GornOW_Hello_12_02");	//Но я совсем не ожидал, что это будешь ты, впрочем. Я чертовски рад видеть тебя.
	AI_Output(other,self,"DIA_GornOW_Hello_15_03");	//(ухмыляется) Гаронд говорит, что ты ешь слишком много и он больше не может себе позволить кормить тебя.
	AI_Output(self,other,"DIA_GornOW_Hello_12_04");	//Раз уж ты упомянул об этом, я бы не отказался от пары кружек пива. Но нужно выбираться отсюда. Эта камера мне уже порядком надоела.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_GornOW_Add_12_00");	//Подожди, у меня есть кое-что, что могло бы пригодиться тебе.
		AI_Output(self,other,"DIA_GornOW_Add_12_01");	//Я нашел эти доспехи здесь, в камере. Наверное, их спрятал какой-то заключенный.
		b_giveinvitems(self,other,itar_sld_m,1);
		AI_Output(self,other,"DIA_GornOW_Add_12_02");	//Для меня они слишком малы, но тебе могут подойти ...
		AI_Output(other,self,"DIA_GornOW_Add_15_03");	//Спасибо! Увидимся у Милтена ...
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_Hello_15_05");	//Ладно, увидимся у Милтена.
	};
	AI_Output(self,other,"DIA_GornOW_Hello_12_06");	//Конечно.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FREE");
	b_startotherroutine(milten,"GORNFREE");
	MIS_RESCUEGORN = LOG_SUCCESS;
	b_giveplayerxp(XP_RESCUEGORN);
};


instance DIA_GORNOW_METMILTEN(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 2;
	condition = dia_gornow_metmilten_condition;
	information = dia_gornow_metmilten_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gornow_metmilten_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (Npc_GetDistToWP(self,"OC_MAGE_LIBRARY_IN") <= 500) && Npc_IsInState(self,zs_talk) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gornow_metmilten_info()
{
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_00");	//Послушай - мне здесь уже порядком надоело. Я думаю, нужно выбираться из этой долины.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_01");	//Как ты прошел через проход?
	AI_Output(other,self,"DIA_GornOW_MetMilten_15_02");	//Там есть путь через заброшенную шахту.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_03");	//Хорошо. Я выжду нужный момент и уберусь отсюда.
	if(other.guild != GIL_SLD)
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_04");	//А куда ты пойдешь?
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_05");	//Я слышал, Ли еще жив. Я хочу опять присоединиться к нему.
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_06");	//Тогда иди на ферму Онара. Ли и его парни сейчас там. Ему всегда нужны парни вроде тебя.
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_07");	//Так и сделаю. Схожу, проверю, как они там.
	};
};


instance DIA_GORNOW_SEEYOU(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 900;
	condition = dia_gornow_seeyou_condition;
	information = dia_gornow_seeyou_info;
	permanent = TRUE;
	description = "Еще увидимся.";
};


func int dia_gornow_seeyou_condition()
{
	if(Npc_KnowsInfo(other,dia_gornow_metmilten) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gornow_seeyou_info()
{
	AI_Output(other,self,"DIA_GornOW_SeeYou_15_00");	//Еще увидимся.
	AI_Output(self,other,"DIA_GornOW_SeeYou_12_01");	//Это точно.
	AI_StopProcessInfos(self);
};

