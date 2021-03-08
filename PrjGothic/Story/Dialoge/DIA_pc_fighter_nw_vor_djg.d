
instance DIA_GORNNW_KAP3_EXIT(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 999;
	condition = dia_gornnw_kap3_exit_condition;
	information = dia_gornnw_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornnw_kap3_exit_condition()
{
	return TRUE;
};

func void dia_gornnw_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNNW_HALLO(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 1;
	condition = dia_gornnw_hallo_condition;
	information = dia_gornnw_hallo_info;
	permanent = FALSE;
	description = "С тобой все в порядке?";
};


func int dia_gornnw_hallo_condition()
{
	return TRUE;
};

func void dia_gornnw_hallo_info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_00");	//С тобой все в порядке?
	if(MIS_RESCUEGORN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_01");	//Ты спас меня, парень.
		AI_Output(self,other,"DIA_GornNW_Add_12_02");	//Я никогда не забуду этого.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_03");	//Милтен вытащил меня.
		AI_Output(self,other,"DIA_GornNW_Add_12_04");	//Я никогда не забуду этого.
	};
};


instance DIA_GORNNW_WHATNEXT(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 1;
	condition = dia_gornnw_whatnext_condition;
	information = dia_gornnw_whatnext_info;
	permanent = TRUE;
	description = "Что ты собираешься делать теперь?";
};


func int dia_gornnw_whatnext_condition()
{
	return TRUE;
};

func void dia_gornnw_whatnext_info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_05");	//Что ты собираешься делать теперь?
	AI_Output(self,other,"DIA_GornNW_Add_12_06");	//Сначала я отъемся.
	AI_Output(other,self,"DIA_GornNW_Add_15_07");	//А потом?
	AI_Output(self,other,"DIA_GornNW_Add_12_08");	//Кто знает... Возможно, я опять вернусь в колонию.
	AI_Output(self,other,"DIA_GornNW_Add_12_09");	//Кто-то ведь должен присматривать за орками - иначе они могут появиться у нас на пороге без всякого предупреждения.
};

