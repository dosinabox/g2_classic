
instance DIA_PAL_270_EXIT(C_INFO)
{
	npc = pal_270_ritter;
	nr = 999;
	condition = dia_pal_270_exit_condition;
	information = dia_pal_270_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pal_270_exit_condition()
{
	return TRUE;
};

func void dia_pal_270_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RITTER_OUT(C_INFO)
{
	npc = pal_270_ritter;
	condition = dia_ritter_out_condition;
	information = dia_ritter_out_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_ritter_out_noperm;

func int dia_ritter_out_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ritter_out_info()
{
	if(DIA_RITTER_OUT_NOPERM == FALSE)
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_00");	//Ты пришел из Хориниса, да? Когда все кончится, я тоже вернусь туда.
		DIA_RITTER_OUT_NOPERM = TRUE;
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_01");	//Я очень рад, что мы с вами в одной команде, сэр.
	}
	else
	{
		AI_Output(self,other,"DIA_Ritter_OUT_06_02");	//У нас получится. Мы доставим руду в Хоринис, и нас будут носить на руках!
	};
};

