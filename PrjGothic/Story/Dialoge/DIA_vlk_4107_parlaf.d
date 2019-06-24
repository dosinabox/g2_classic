
instance DIA_PARLAF_EXIT(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 999;
	condition = dia_parlaf_exit_condition;
	information = dia_parlaf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_parlaf_exit_condition()
{
	return TRUE;
};

func void dia_parlaf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PARLAF_HALLO(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 1;
	condition = dia_parlaf_hallo_condition;
	information = dia_parlaf_hallo_info;
	description = "Привет, как дела?";
};


func int dia_parlaf_hallo_condition()
{
	return TRUE;
};

func void dia_parlaf_hallo_info()
{
	AI_Output(other,self,"DIA_Parlaf_HALLO_15_00");	//Привет, как дела?
	AI_Output(self,other,"DIA_Parlaf_HALLO_03_01");	//А как, по-твоему? Я провел целый день за точильным кругом, затачивая клинки.
	if(Npc_IsDead(engor) == FALSE)
	{
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_02");	//А вчера Энгор опять урезал наш паек. Если он будет продолжать в том же духе, мы все помрем с голода.
		AI_Output(self,other,"DIA_Parlaf_HALLO_03_03");	//Или нас всех перебьют орки. Не самая радужная перспектива.
	};
};


instance DIA_PARLAF_ENGOR(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 2;
	condition = dia_parlaf_engor_condition;
	information = dia_parlaf_engor_info;
	description = "Кто такой Энгор?";
};


func int dia_parlaf_engor_condition()
{
	if(Npc_KnowsInfo(hero,dia_parlaf_hallo) && (Npc_IsDead(engor) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlaf_engor_info()
{
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_00");	//Кто такой Энгор?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_01");	//Энгор заведует провизией и выдает пайки. А они становятся все меньше с каждой неделей.
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_02");	//Конечно, с ним можно договориться, но только за золото и весьма недешево.
	AI_Output(other,self,"DIA_Parlaf_ENGOR_15_03");	//А ты не можешь позволить себе это?
	AI_Output(self,other,"DIA_Parlaf_ENGOR_03_04");	//За те гроши, что нам платят, я могу купить только пару реп!
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	Log_AddEntry(TOPIC_TRADER_OC,"Энгор заведует припасами замка и ведет небольшой бизнес на стороне.");
};


instance DIA_PARLAF_WO(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 3;
	condition = dia_parlaf_wo_condition;
	information = dia_parlaf_wo_info;
	permanent = FALSE;
	description = "Где мне найти этого Энгора?";
};


func int dia_parlaf_wo_condition()
{
	if(Npc_KnowsInfo(other,dia_parlaf_engor) && (Npc_IsDead(engor) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlaf_wo_info()
{
	AI_Output(other,self,"DIA_Parlaf_Wo_15_00");	//Где мне найти этого Энгора?
	AI_Output(self,other,"DIA_Parlaf_Wo_03_01");	//В доме рыцарей. Пройди через открытый вход рядом с кузницей.
};


instance DIA_PARLAF_HUNGRIG(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 2;
	condition = dia_parlaf_hungrig_condition;
	information = dia_parlaf_hungrig_info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int dia_parlaf_hungrig_condition()
{
	if((MIS_ENGOR_BRINGMEAT != LOG_SUCCESS) && Npc_KnowsInfo(hero,dia_parlaf_hallo) && (Npc_IsDead(engor) == FALSE))
	{
		return TRUE;
	};
};

func void dia_parlaf_hungrig_info()
{
	AI_Output(other,self,"DIA_Parlaf_HUNGRIG_15_00");	//Что новенького?
	AI_Output(self,other,"DIA_Parlaf_HUNGRIG_03_01");	//Этот чертов Энгор должен увеличить пайки!
};


instance DIA_PARLAF_SATT(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 3;
	condition = dia_parlaf_satt_condition;
	information = dia_parlaf_satt_info;
	permanent = TRUE;
	description = "Что новенького?";
};


func int dia_parlaf_satt_condition()
{
	if(((MIS_ENGOR_BRINGMEAT == LOG_SUCCESS) || Npc_IsDead(engor)) && Npc_KnowsInfo(hero,dia_parlaf_hallo))
	{
		return TRUE;
	};
};


var int dia_parlaf_satt_onetime;

func void dia_parlaf_satt_info()
{
	AI_Output(other,self,"DIA_Parlaf_SATT_15_00");	//Что новенького?
	if((DIA_PARLAF_SATT_ONETIME == FALSE) && (Npc_IsDead(engor) == FALSE))
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_01");	//Энгор раздал мясные пайки. Ох, как долго я этого ждал.
		DIA_PARLAF_SATT_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Parlaf_SATT_03_02");	//Твое прибытие - это единственная действительно свежая новость.
	};
};


instance DIA_PARLAF_PICKPOCKET(C_INFO)
{
	npc = vlk_4107_parlaf;
	nr = 900;
	condition = dia_parlaf_pickpocket_condition;
	information = dia_parlaf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_parlaf_pickpocket_condition()
{
	return c_beklauen(34,12);
};

func void dia_parlaf_pickpocket_info()
{
	Info_ClearChoices(dia_parlaf_pickpocket);
	Info_AddChoice(dia_parlaf_pickpocket,DIALOG_BACK,dia_parlaf_pickpocket_back);
	Info_AddChoice(dia_parlaf_pickpocket,DIALOG_PICKPOCKET,dia_parlaf_pickpocket_doit);
};

func void dia_parlaf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_parlaf_pickpocket);
};

func void dia_parlaf_pickpocket_back()
{
	Info_ClearChoices(dia_parlaf_pickpocket);
};

