
instance DIA_DMT_1201_DEMENTOR_EXIT(C_INFO)
{
	npc = dmt_1201_dementor;
	nr = 999;
	condition = dia_dmt_1201_dementor_exit_condition;
	information = dia_dmt_1201_dementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dmt_1201_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1201_dementor_exit_info()
{
	b_assigndementortalk_ritual_exit();
};


instance DIA_DMT_1201_DEMENTOR(C_INFO)
{
	npc = dmt_1201_dementor;
	nr = 1;
	condition = dia_dmt_1201_dementor_condition;
	information = dia_dmt_1201_dementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_dmt_1201_dementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_dmt_1201_dementor_info()
{
	b_assigndementortalk_ritual();
};


instance DIA_DMT_1202_DEMENTOR_EXIT(C_INFO)
{
	npc = dmt_1202_dementor;
	nr = 999;
	condition = dia_dmt_1202_dementor_exit_condition;
	information = dia_dmt_1202_dementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dmt_1202_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1202_dementor_exit_info()
{
	b_assigndementortalk_ritual_exit();
};


instance DIA_DMT_1202_DEMENTOR(C_INFO)
{
	npc = dmt_1202_dementor;
	nr = 1;
	condition = dia_dmt_1202_dementor_condition;
	information = dia_dmt_1202_dementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_dmt_1202_dementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_dmt_1202_dementor_info()
{
	b_assigndementortalk_ritual();
};


instance DIA_DMT_1203_DEMENTOR_EXIT(C_INFO)
{
	npc = dmt_1203_dementor;
	nr = 999;
	condition = dia_dmt_1203_dementor_exit_condition;
	information = dia_dmt_1203_dementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dmt_1203_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1203_dementor_exit_info()
{
	b_assigndementortalk_ritual_exit();
};


instance DIA_DMT_1203_DEMENTOR(C_INFO)
{
	npc = dmt_1203_dementor;
	nr = 1;
	condition = dia_dmt_1203_dementor_condition;
	information = dia_dmt_1203_dementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_dmt_1203_dementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_dmt_1203_dementor_info()
{
	b_assigndementortalk_ritual();
};


instance DIA_DMT_1204_DEMENTOR_EXIT(C_INFO)
{
	npc = dmt_1204_dementor;
	nr = 999;
	condition = dia_dmt_1204_dementor_exit_condition;
	information = dia_dmt_1204_dementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dmt_1204_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1204_dementor_exit_info()
{
	b_assigndementortalk_ritual_exit();
};


instance DIA_DMT_1204_DEMENTOR(C_INFO)
{
	npc = dmt_1204_dementor;
	nr = 1;
	condition = dia_dmt_1204_dementor_condition;
	information = dia_dmt_1204_dementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_dmt_1204_dementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_dmt_1204_dementor_info()
{
	b_assigndementortalk_ritual();
};


instance DIA_DMT_1205_DEMENTOR_EXIT(C_INFO)
{
	npc = dmt_1205_dementor;
	nr = 999;
	condition = dia_dmt_1205_dementor_exit_condition;
	information = dia_dmt_1205_dementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dmt_1205_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1205_dementor_exit_info()
{
	b_assigndementortalk_ritual_exit();
};


instance DIA_DMT_1205_DEMENTOR(C_INFO)
{
	npc = dmt_1205_dementor;
	nr = 1;
	condition = dia_dmt_1205_dementor_condition;
	information = dia_dmt_1205_dementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_dmt_1205_dementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_dmt_1205_dementor_info()
{
	b_assigndementortalk_ritual();
};


instance DIA_DMT_1206_DEMENTOR_EXIT(C_INFO)
{
	npc = dmt_1206_dementor;
	nr = 999;
	condition = dia_dmt_1206_dementor_exit_condition;
	information = dia_dmt_1206_dementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dmt_1206_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1206_dementor_exit_info()
{
	b_assigndementortalk_ritual_exit();
};


instance DIA_DMT_1206_DEMENTOR(C_INFO)
{
	npc = dmt_1206_dementor;
	nr = 1;
	condition = dia_dmt_1206_dementor_condition;
	information = dia_dmt_1206_dementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_dmt_1206_dementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_dmt_1206_dementor_info()
{
	b_assigndementortalk_ritual();
};


instance DIA_DMT_1207_DEMENTOR_EXIT(C_INFO)
{
	npc = dmt_1207_dementor;
	nr = 999;
	condition = dia_dmt_1207_dementor_exit_condition;
	information = dia_dmt_1207_dementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dmt_1207_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1207_dementor_exit_info()
{
	b_assigndementortalk_ritual_exit();
};


instance DIA_DMT_1207_DEMENTOR(C_INFO)
{
	npc = dmt_1207_dementor;
	nr = 1;
	condition = dia_dmt_1207_dementor_condition;
	information = dia_dmt_1207_dementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_dmt_1207_dementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_dmt_1207_dementor_info()
{
	b_assigndementortalk_ritual();
};


instance DIA_DMT_1208_DEMENTOR_EXIT(C_INFO)
{
	npc = dmt_1208_dementor;
	nr = 999;
	condition = dia_dmt_1208_dementor_exit_condition;
	information = dia_dmt_1208_dementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dmt_1208_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1208_dementor_exit_info()
{
	b_assigndementortalk_ritual_exit();
};


instance DIA_DMT_1208_DEMENTOR(C_INFO)
{
	npc = dmt_1208_dementor;
	nr = 1;
	condition = dia_dmt_1208_dementor_condition;
	information = dia_dmt_1208_dementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_dmt_1208_dementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_dmt_1208_dementor_info()
{
	b_assigndementortalk_ritual();
};


instance DIA_DMT_1209_DEMENTOR_EXIT(C_INFO)
{
	npc = dmt_1209_dementor;
	nr = 999;
	condition = dia_dmt_1209_dementor_exit_condition;
	information = dia_dmt_1209_dementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dmt_1209_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1209_dementor_exit_info()
{
	b_assigndementortalk_ritual_exit();
};


instance DIA_DMT_1209_DEMENTOR(C_INFO)
{
	npc = dmt_1209_dementor;
	nr = 1;
	condition = dia_dmt_1209_dementor_condition;
	information = dia_dmt_1209_dementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_dmt_1209_dementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_dmt_1209_dementor_info()
{
	b_assigndementortalk_ritual();
};


instance DIA_DMT_1210_DEMENTOR_EXIT(C_INFO)
{
	npc = dmt_1210_dementor;
	nr = 999;
	condition = dia_dmt_1210_dementor_exit_condition;
	information = dia_dmt_1210_dementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dmt_1210_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1210_dementor_exit_info()
{
	b_assigndementortalk_ritual_exit();
};


instance DIA_DMT_1210_DEMENTOR(C_INFO)
{
	npc = dmt_1210_dementor;
	nr = 1;
	condition = dia_dmt_1210_dementor_condition;
	information = dia_dmt_1210_dementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_dmt_1210_dementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_dmt_1210_dementor_info()
{
	b_assigndementortalk_ritual();
};


instance DIA_DMT_1211_DEMENTOR_EXIT(C_INFO)
{
	npc = dmt_1211_dementor;
	nr = 999;
	condition = dia_dmt_1211_dementor_exit_condition;
	information = dia_dmt_1211_dementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dmt_1211_dementor_exit_condition()
{
	return TRUE;
};

func void dia_dmt_1211_dementor_exit_info()
{
	b_assigndementortalk_ritual_exit();
};


instance DIA_DMT_1211_DEMENTOR(C_INFO)
{
	npc = dmt_1211_dementor;
	nr = 1;
	condition = dia_dmt_1211_dementor_condition;
	information = dia_dmt_1211_dementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_dmt_1211_dementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_dmt_1211_dementor_info()
{
	b_assigndementortalk_ritual();
};

