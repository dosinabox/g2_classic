
instance DIA_BDT_13_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_bdt_13_exit_condition;
	information = dia_bdt_13_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bdt_13_exit_condition()
{
	return TRUE;
};

func void dia_bdt_13_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_13_STANDARD(C_INFO)
{
	nr = 2;
	condition = dia_bdt_13_standard_condition;
	information = dia_bdt_13_standard_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bdt_13_standard_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void b_verschwinde_stimme13()
{
	AI_Output(self,other,"DIA_BDT_13_STANDARD_13_01");	//Проваливай!
};

func void dia_bdt_13_standard_info()
{
	var int randy;
	randy = Hlp_Random(3);
	if(randy == 0)
	{
		AI_Output(self,other,"DIA_BDT_13_STANDARD_13_00");	//Что уставился, как идиот?!
	};
	if(randy == 1)
	{
		b_verschwinde_stimme13();
	};
	if(randy == 2)
	{
		AI_Output(self,other,"DIA_BDT_13_STANDARD_13_02");	//Оставь меня в покое, придурок.
	};
	AI_StopProcessInfos(self);
};

func void b_assignambientinfos_bdt_13(var C_NPC slf)
{
	dia_bdt_13_exit.npc = Hlp_GetInstanceID(slf);
	dia_bdt_13_standard.npc = Hlp_GetInstanceID(slf);
};

