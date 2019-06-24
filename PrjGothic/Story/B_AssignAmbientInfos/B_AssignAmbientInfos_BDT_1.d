
instance DIA_BDT_1_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bdt_1_exit_condition;
	information = dia_bdt_1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_1_exit_condition()
{
	return TRUE;
};

func void dia_bdt_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1_STANDARD(C_INFO)
{
	nr = 2;
	condition = dia_bdt_1_standard_condition;
	information = dia_bdt_1_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_1_standard_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bdt_1_standard_info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_BDT_1_STANDARD_01_00");	//Убирайся с глаз моих!
	};
	if(randy == 1)
	{
		AI_Output(self,other,"DIA_BDT_1_STANDARD_01_01");	//Тебе нужны проблемы?
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_BDT_1_STANDARD_01_02");	//Уходи, пока еще можешь!
	};
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_bdt_1(var C_NPC slf)
{
	dia_bdt_1_exit.npc = Hlp_GetInstanceID(slf);
	dia_bdt_1_standard.npc = Hlp_GetInstanceID(slf);
};

