
instance DIA_DEXTER_EXIT(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 999;
	condition = dia_dexter_exit_condition;
	information = dia_dexter_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dexter_exit_condition()
{
	return TRUE;
};

func void dia_dexter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_HALLO(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 1;
	condition = dia_dexter_hallo_condition;
	information = dia_dexter_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_hallo_condition()
{
	if(KNOWS_DEXTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_dexter_hallo_info()
{
	AI_Output(self,other,"DIA_Dexter_Hallo_09_00");	//����������, ��� ������. ������� ������������. ��� �, �����, ��� �� ������� �����?
	AI_Output(other,self,"DIA_Dexter_Hallo_15_01");	//� ���� �������� ������ �� ��������� ��������.
	AI_Output(other,self,"DIA_Dexter_Hallo_15_02");	//���-�� �������������� ������ ������ � ���� ������������. ���-��� ������ ���, ��� ��� ��.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_03");	//���-�� ������� ����� �������.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_04");	//�� ��� ������. � ������ ����� ������ ��� ���������� � �������. � ���� �� ���� ������� ������.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_05");	//����� � ������� ��������� �� ������ ��������, ������� ���������� ���� � �������� ��� �������.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_06");	//� ��� �����, ��� ��� �����, �� ���������� ���... ������ ��������� �� ����.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_07");	//�� ��� ���� ������ ���� � ���������, ���������� ��� ��� �����. � �� ��������� �������, ���� ��������� ������������ ������������.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_08");	//�� ��������� ��� ���� ������. �� ����� ���� �� ������ � ��������� ������ ������� �� ���� ������.
	AI_Output(self,other,"DIA_Dexter_Hallo_09_09");	//��, � ��� ��� ���� ������? ���� �� � ���������, �� ���� �� ����!
	b_logentry(TOPIC_BANDITS,"������� �������� ������ � ��������� ������� �� ��� ������. ��� ��������� ������� ��� ���� � ������ �����.");
	MIS_STECKBRIEFE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_DEXTER_GLAUBE(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_glaube_condition;
	information = dia_dexter_glaube_info;
	permanent = FALSE;
	description = "� �� ���� �� ������ ������ �����.";
};


func int dia_dexter_glaube_condition()
{
	if((Npc_KnowsInfo(other,dia_dexter_wo) == FALSE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_dexter_glaube_info()
{
	AI_Output(other,self,"DIA_Dexter_Glaube_15_00");	//� �� ���� �� ������ ������ �����.
	AI_Output(self,other,"DIA_Dexter_Glaube_09_01");	//��������, ��� ��� ������. ������� ������� ����� ������!
};


instance DIA_DEXTER_WO(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 3;
	condition = dia_dexter_wo_condition;
	information = dia_dexter_wo_info;
	permanent = FALSE;
	description = "��� ��� ����� ����� ��������?";
};


func int dia_dexter_wo_condition()
{
	if((Npc_KnowsInfo(other,dia_dexter_glaube) == FALSE) && (KNOWS_DEXTER == TRUE))
	{
		return TRUE;
	};
};

func void dia_dexter_wo_info()
{
	AI_Output(other,self,"DIA_Dexter_Wo_15_00");	//��� ��� ����� ����� ��������?
	if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_01");	//� �����, �� ���-�� � ������ ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Wo_09_02");	//���� ������ �����! � �� �� ����. �� ��� �����. ��� �������! � ��� ���� ����.
	};
};


instance DIA_DEXTER_VOR(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_vor_condition;
	information = dia_dexter_vor_info;
	permanent = FALSE;
	description = "� ��� �� ����������� ������ ������? ����� ����?";
};


func int dia_dexter_vor_condition()
{
	if(Npc_KnowsInfo(other,dia_dexter_glaube) || Npc_KnowsInfo(other,dia_dexter_wo))
	{
		return TRUE;
	};
};

func void dia_dexter_vor_info()
{
	AI_Output(other,self,"DIA_Dexter_Vor_15_00");	//� ��� �� ����������� ������ ������? ����� ����?
	AI_Output(self,other,"DIA_Dexter_Vor_09_01");	//��. �� �� ��������� ��� ����. ��� ������ � ��� ���� ��� ���� ����. �������� - �������, �������� ���������. ����� � ������ �� ��������� ��� �� ����.
	AI_Output(self,other,"DIA_Dexter_Vor_09_02");	//���� � ����� ���� ��� ���, �� ��� ��������� ����! � ����������� ����.
	AI_StopProcessInfos(self);
};


instance DIA_DEXTER_KILL(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 2;
	condition = dia_dexter_kill_condition;
	information = dia_dexter_kill_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dexter_kill_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_KnowsInfo(other,dia_dexter_vor) || (KNOWS_DEXTER == FALSE)))
	{
		return TRUE;
	};
};

func void dia_dexter_kill_info()
{
	if(KNOWS_DEXTER == TRUE)
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_00");	//� ����������� ����. ���� � �� ���� ����, ��� ����� ����. ��� ��� �� �� ���������� ��� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Dexter_Kill_09_01");	//��, ���� �� ������ ������������ �����. �� �������� �� � �� ����� � �� � ��� �����.
	};
	MIS_STECKBRIEFE = LOG_OBSOLETE;
	b_checklog();
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,0);
};


instance DIA_DEXTER_PICKPOCKET(C_INFO)
{
	npc = bdt_1060_dexter;
	nr = 900;
	condition = dia_dexter_pickpocket_condition;
	information = dia_dexter_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_dexter_pickpocket_condition()
{
	return c_beklauen(96,370);
};

func void dia_dexter_pickpocket_info()
{
	Info_ClearChoices(dia_dexter_pickpocket);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_BACK,dia_dexter_pickpocket_back);
	Info_AddChoice(dia_dexter_pickpocket,DIALOG_PICKPOCKET,dia_dexter_pickpocket_doit);
};

func void dia_dexter_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dexter_pickpocket);
};

func void dia_dexter_pickpocket_back()
{
	Info_ClearChoices(dia_dexter_pickpocket);
};

