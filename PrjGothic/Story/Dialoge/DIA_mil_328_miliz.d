
instance DIA_328_MILIZ_EXIT(C_INFO)
{
	npc = mil_328_miliz;
	nr = 999;
	condition = dia_328_miliz_exit_condition;
	information = dia_328_miliz_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_328_miliz_exit_condition()
{
	return TRUE;
};

func void dia_328_miliz_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_328_MILIZ_HI(C_INFO)
{
	npc = mil_328_miliz;
	nr = 1;
	condition = dia_328_miliz_hi_condition;
	information = dia_328_miliz_hi_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_328_miliz_hi_condition()
{
	return TRUE;
};

func void dia_328_miliz_hi_info()
{
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_00");	//Эй, тебе нечего делать здесь. Понятно?
	AI_Output(other,self,"DIA_328_Miliz_Hi_15_01");	//Кто ты такой?
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_02");	//Это не твое дело! Здесь я главный. Понял?
	AI_Output(other,self,"DIA_328_Miliz_Hi_15_03");	//Главный? Над чем? Над этими сундуками?
	AI_Output(self,other,"DIA_328_Miliz_Hi_08_04");	//Эй, этот склад находится в моем ведении, понял? Так что проваливай, или я раскрою твой череп.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,30);
};


instance DIA_328_MILIZ_KILL(C_INFO)
{
	npc = mil_328_miliz;
	nr = 2;
	condition = dia_328_miliz_kill_condition;
	information = dia_328_miliz_kill_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_328_miliz_kill_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_328_miliz_kill_info()
{
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_00");	//Эй, ты все еще здесь! Разве я не сказал тебе, чтобы ты проваливал?
	AI_Output(self,other,"DIA_328_Miliz_Kill_08_01");	//Ну, держись! Сейчас я покажу тебе, кто здесь главный!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	b_attack(self,other,AR_KILL,1);
};

