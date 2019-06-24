
instance DIA_HEROLD_INFO(C_INFO)
{
	npc = vlk_406_herold;
	nr = 10;
	condition = dia_herold_info_condition;
	information = dia_herold_info_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_herold_info_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_herold_info_info()
{
	AI_Output(self,other,"DIA_Herold_Info_04_00");	//Отстань от меня, я на работе.
	AI_StopProcessInfos(self);
};

