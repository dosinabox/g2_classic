
instance DIA_ORC_ANTIPALADIN1_EXIT(C_INFO)
{
	npc = orcelite_antipaladin1;
	nr = 999;
	condition = dia_orc_antipaladin1_exit_condition;
	information = dia_orc_antipaladin1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_orc_antipaladin1_exit_condition()
{
	return TRUE;
};

func void dia_orc_antipaladin1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_ANTIPALADIN1(C_INFO)
{
	npc = orcelite_antipaladin1;
	nr = 1;
	condition = dia_orc_antipaladin1_condition;
	information = dia_orc_antipaladin1_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_orc_antipaladin1_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_orc_antipaladin1_info()
{
	b_assignorc_antipaladintalk(self);
};


instance DIA_ORC_ANTIPALADIN2_EXIT(C_INFO)
{
	npc = orcelite_antipaladin2;
	nr = 999;
	condition = dia_orc_antipaladin2_exit_condition;
	information = dia_orc_antipaladin2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_orc_antipaladin2_exit_condition()
{
	return TRUE;
};

func void dia_orc_antipaladin2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_ANTIPALADIN2(C_INFO)
{
	npc = orcelite_antipaladin2;
	nr = 1;
	condition = dia_orc_antipaladin2_condition;
	information = dia_orc_antipaladin2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_orc_antipaladin2_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_orc_antipaladin2_info()
{
	b_assignorc_antipaladintalk(self);
};


instance DIA_ORC_ANTIPALADIN3_EXIT(C_INFO)
{
	npc = orcelite_antipaladin3;
	nr = 999;
	condition = dia_orc_antipaladin3_exit_condition;
	information = dia_orc_antipaladin3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_orc_antipaladin3_exit_condition()
{
	return TRUE;
};

func void dia_orc_antipaladin3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_ANTIPALADIN3(C_INFO)
{
	npc = orcelite_antipaladin3;
	nr = 1;
	condition = dia_orc_antipaladin3_condition;
	information = dia_orc_antipaladin3_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_orc_antipaladin3_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_orc_antipaladin3_info()
{
	b_assignorc_antipaladintalk(self);
};

