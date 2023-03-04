
instance DIA_BIFF_DI_EXIT(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 999;
	condition = dia_biff_di_exit_condition;
	information = dia_biff_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_biff_di_exit_condition()
{
	return TRUE;
};

func void dia_biff_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_DI_HALLO(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 10;
	condition = dia_biff_di_hallo_condition;
	information = dia_biff_di_hallo_info;
	important = TRUE;
};


func int dia_biff_di_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_di_hallo_info()
{
	AI_Output(self,other,"DIA_Biff_DI_HALLO_07_00");	//�? ��� ��� �� ���������, ��� �� ��� ������?
	if(Npc_KnowsInfo(other,dia_biff_di_orks) == FALSE)
	{
		AI_Output(other,self,"DIA_Biff_DI_HALLO_15_01");	//��� � ��� ������� ���� ������, � ����?
	};
	AI_Output(other,self,"DIA_Biff_DI_HALLO_15_02");	//������ ���� ������ - �������� �������.
	AI_Output(other,self,"DIA_Biff_DI_HALLO_15_03");	//��� �� ��������� ����� �����.
	AI_Output(self,other,"DIA_Biff_DI_HALLO_07_04");	//����. ���� �� � ���� ��� �������, � �� ����� ������� � ��������.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_DI_PERM(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 5;
	condition = dia_biff_di_perm_condition;
	information = dia_biff_di_perm_info;
	permanent = TRUE;
	description = "�� ����� ��� ��������?";
};


func int dia_biff_di_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_biff_di_hallo) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_di_perm_info()
{
	AI_Output(other,self,"DIA_Biff_DI_perm_15_00");	//�� ����� ��� ��������?
	AI_Output(self,other,"DIA_Biff_DI_perm_07_01");	//(�������) ��, ��. ��� ����.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_DI_ORKS(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 5;
	condition = dia_biff_di_orks_condition;
	information = dia_biff_di_orks_info;
	important = TRUE;
};


func int dia_biff_di_orks_condition()
{
	if((Npc_GetDistToWP(self,"DI_SHIP_03") < 1000) && (ORKSTURMDI == TRUE) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_biff_di_orks_info()
{
	AI_Output(self,other,"DIA_Biff_DI_ORKS_07_00");	//��� ������� �����!
	AI_Output(other,self,"DIA_Biff_DI_ORKS_15_01");	//����, ��� �� ������� �����? �� ������ ��� �������� �������.
	AI_Output(self,other,"DIA_Biff_DI_ORKS_07_02");	//�� ������ �� �� �������.
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BIFF_DI_UNDEADDRGDEAD(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 4;
	condition = dia_biff_di_undeaddrgdead_condition;
	information = dia_biff_di_undeaddrgdead_info;
	important = TRUE;
};


func int dia_biff_di_undeaddrgdead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_biff_di_undeaddrgdead_info()
{
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_00");	//���, ��� �������?
	AI_Output(other,self,"DIA_Biff_DI_UNDEADDRGDEAD_15_01");	//����� �� ��.
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_02");	//� ������, ���� �...
	AI_Output(other,self,"DIA_Biff_DI_UNDEADDRGDEAD_15_03");	//�� ������ ����������� ���� ������, ���� ������.
	AI_Output(self,other,"DIA_Biff_DI_UNDEADDRGDEAD_07_04");	//�������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PlunderTempel");
};


instance DIA_BIFF_DI_PLUNDER(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 5;
	condition = dia_biff_di_plunder_condition;
	information = dia_biff_di_plunder_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_biff_di_plunder_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_biff_di_undeaddrgdead))
	{
		return TRUE;
	};
};

func void dia_biff_di_plunder_info()
{
	AI_Output(self,other,"DIA_Biff_DI_plunder_07_00");	//����. �� ������.
	AI_StopProcessInfos(self);
};


instance DIA_BIFF_DI_PICKPOCKET(C_INFO)
{
	npc = djg_713_biff_di;
	nr = 900;
	condition = dia_biff_di_pickpocket_condition;
	information = dia_biff_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_biff_di_pickpocket_condition()
{
	return c_beklauen(92,450);
};

func void dia_biff_di_pickpocket_info()
{
	Info_ClearChoices(dia_biff_di_pickpocket);
	Info_AddChoice(dia_biff_di_pickpocket,DIALOG_BACK,dia_biff_di_pickpocket_back);
	Info_AddChoice(dia_biff_di_pickpocket,DIALOG_PICKPOCKET,dia_biff_di_pickpocket_doit);
};

func void dia_biff_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_biff_di_pickpocket);
};

func void dia_biff_di_pickpocket_back()
{
	Info_ClearChoices(dia_biff_di_pickpocket);
};

