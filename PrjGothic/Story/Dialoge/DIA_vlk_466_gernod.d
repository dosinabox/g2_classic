
instance DIA_GERNOD_EXIT(C_INFO)
{
	npc = vlk_466_gernod;
	nr = 999;
	condition = dia_gernod_exit_condition;
	information = dia_gernod_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gernod_exit_condition()
{
	return FALSE;
};

func void dia_gernod_exit_info()
{
	AI_StopProcessInfos(self);
};

