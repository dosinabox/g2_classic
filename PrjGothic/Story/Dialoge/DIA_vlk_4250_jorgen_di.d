
instance DIA_JORGEN_DI_KAP3_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen_di;
	nr = 999;
	condition = dia_jorgen_di_kap3_exit_condition;
	information = dia_jorgen_di_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_di_kap3_exit_condition()
{
	return TRUE;
};

func void dia_jorgen_di_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_DI_HALLO(C_INFO)
{
	npc = vlk_4250_jorgen_di;
	nr = 4;
	condition = dia_jorgen_di_hallo_condition;
	information = dia_jorgen_di_hallo_info;
	permanent = TRUE;
	description = "Все в порядке?";
};


func int dia_jorgen_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_jorgen_di_hallo_info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_Hallo_15_00");	//Все в порядке?
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_01");	//Конечно - пока эти монстры не приближаются к нам...
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_DI_Hallo_07_02");	//Нам не пережить следующую атаку орков. Так что поторопись - нужно убираться отсюда.
		b_startotherroutine(jorgen_di,"Start");
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = vlk_4250_jorgen_di;
	nr = 4;
	condition = dia_jorgen_di_undeaddragondead_condition;
	information = dia_jorgen_di_undeaddragondead_info;
	permanent = TRUE;
	description = "Врагу настал конец.";
};


func int dia_jorgen_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_jorgen_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_15_00");	//Врагу настал конец.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_07_01");	//Это хорошие новости. Надеюсь, нам больше ничего не нужно на этом острове?
	Info_ClearChoices(dia_jorgen_di_undeaddragondead);
	Info_AddChoice(dia_jorgen_di_undeaddragondead,"Подожди минутку.",dia_jorgen_di_undeaddragondead_moment);
	Info_AddChoice(dia_jorgen_di_undeaddragondead,"Все, мы можем отправляться в путь.",dia_jorgen_di_undeaddragondead_over);
};

func void dia_jorgen_di_undeaddragondead_moment()
{
	AI_Output(other,self,"DIA_Jorgen_DI_UndeadDragonDead_moment_15_00");	//Подожди минутку. Я забыл сделать кое-что.
	AI_Output(self,other,"DIA_Jorgen_DI_UndeadDragonDead_moment_07_01");	//Хорошо. Но поторопись.
	AI_StopProcessInfos(self);
};

func void dia_jorgen_di_undeaddragondead_over()
{
	AI_StopProcessInfos(self);
	b_extro_avi();
};

