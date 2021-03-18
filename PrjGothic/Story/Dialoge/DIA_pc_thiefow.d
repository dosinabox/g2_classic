
instance DIA_DIEGOOW_EXIT(C_INFO)
{
	npc = pc_thiefow;
	nr = 999;
	condition = dia_diegoow_exit_condition;
	information = dia_diegoow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_diegoow_exit_condition()
{
	return TRUE;
};

func void dia_diegoow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DIEGOOW_HALLO(C_INFO)
{
	npc = pc_thiefow;
	nr = 2;
	condition = dia_diegoow_hallo_condition;
	information = dia_diegoow_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_diegoow_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_diegoow_hallo_info()
{
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_00");	//��, � �����, �� �����.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_01");	//��... ��� ����.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_02");	//�� ������ � ��������, � ��� �������������� ��������� ��������.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_03");	//��� ���� �� ��� �������?
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_04");	//� ������� �� ����� ������. � ������� ��������� �������� ����� ����������.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_05");	//��������? ������� ��� ������� ���� ���-���. ����� ����, ��� ��� ������� ��������� ������, � ���������� � �������.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_06");	//� ����� ������������ ��������� � ��������. ��� �� ����, ����� ��� ��� ���� �����?
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_07");	//���� ���������� ����� ���� �� ���� ������� ���� - �, ������� ��, �� �������� ��� ���������� � ������ �������.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_08");	//������ �����, ��� ��������� ���� �����, � �����������. ��� ��� ����� �� ��������� ��� � ���������...
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_09");	//����� ����� ���������� ��������, ���� � ��� ��� ���� ����� - � �� �����, ��� ������� ��� ������� ���.
	AI_Output(self,other,"DIA_DiegoOw_Hallo_11_10");	//���������� ��? �� ��� ����� ������� ���� �� ���� ������ ���� � ��� ��� ���� ����� ��� �����.
	AI_Output(other,self,"DIA_DiegoOw_Hallo_15_11");	//��������, ��� ����� ��������������.
	if(garond.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_12");	//������, ���� ������ ���� ������ - ���, �������� � ����������� ��������.
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_13");	//���� �� ��� � ����� ���-������ � ��������� ��������, �� ��� ����� �� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_DiegoOw_Hallo_11_14");	//������, � ������ ����, ��� �����. �� � �� ���� ��������� ����� ������ ���������� ��-�� ����.
	};
};


instance DIA_DIEGOOW_GAROND(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_garond_condition;
	information = dia_diegoow_garond_info;
	permanent = FALSE;
	description = "� ����� �� ��������� �������.";
};


func int dia_diegoow_garond_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_diegoow_garond_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Garond_15_00");	//� ����� �� ��������� �������. �� ����� �����, ������� ���� ���� ������ � ����� �������.
	AI_Output(self,other,"DIA_DiegoOw_Garond_11_01");	//� ����� �� ���� ���� ��������������?
	AI_Output(other,self,"DIA_DiegoOw_Garond_15_02");	//������. ������� - �� ������ ������� ���-������ �� ���� ����?
	AI_Output(self,other,"DIA_DiegoOw_Garond_11_03");	//�������, ��� �� ������ �����?
};


instance DIA_DIEGOOW_SILVESTRO(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_silvestro_condition;
	information = dia_diegoow_silvestro_info;
	permanent = FALSE;
	description = "��� �� ������ � ���� ����������?";
};


func int dia_diegoow_silvestro_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_garond) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_diegoow_silvestro_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_00");	//��� �� ������ � ���� ����������?
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_01");	//�����, � ������ ����� ������ �������� ������ ����� ����. �� ������ ���� ����������.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_02");	//������ ����� ������ � ������� �� - �� ���� ����� � ���� ������� ��� �� �����.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_03");	//����� - ��� ���� ������� ���������� ����� ������? � �����, ��� ��� ����� ������.
	AI_Output(other,self,"DIA_DiegoOw_Silvestro_15_04");	//���� ���� ����� ����������� �����, ��� ��� �����.
	AI_Output(self,other,"DIA_DiegoOw_Silvestro_11_05");	//��� ������� �������. ����� � ������ ��� ����� ������� ������������ � ������� - ��� ��� ����� ��� � ��� ������ �����.
	SILVESTRO_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"����� ���������� ������ ����� ����, ������� ����������� ����������, � ���������� �����.");
};


instance DIA_DIEGOOW_MINE(C_INFO)
{
	npc = pc_thiefow;
	nr = 3;
	condition = dia_diegoow_mine_condition;
	information = dia_diegoow_mine_info;
	permanent = FALSE;
	description = "� ����� �� ������ ��������� � ����?";
};


func int dia_diegoow_mine_condition()
{
	if(Npc_KnowsInfo(other,dia_diegoow_silvestro) && (KAPITEL == 2) && (MIS_SCOUTMINE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_diegoow_mine_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Mine_15_00");	//� ����� �� ������ ��������� � ����?
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_01");	//� ��� � ������� ����������. �� �������� ���� ��� ��������� ����, ����� ���������� ����� �����������.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_02");	//�� ������, ��� �� ������ ����������� ���� � ���������� �����.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_03");	//��, ��� ��� � ��� ����� ��������� ������, � �������� ������������.
	AI_Output(self,other,"DIA_DiegoOw_Mine_11_04");	//� � ���� ��� ����� �������. ������ ��� ������ �� ���������� ������ ��������. � ����� �� ��� �� �����.
};


instance DIA_DIEGOOW_RITTER(C_INFO)
{
	npc = pc_thiefow;
	nr = 9;
	condition = dia_diegoow_ritter_condition;
	information = dia_diegoow_ritter_info;
	permanent = FALSE;
	description = "� ��� ������ ���� ���� ������� ������� ����� ����� ��������?";
};


func int dia_diegoow_ritter_condition()
{
	if((KAPITEL == 2) && ((Npc_HasItems(pal_leiche4,itmi_oldcoin) == 0) || (Npc_HasItems(pal_leiche5,itmi_oldcoin) == 0)))
	{
		return TRUE;
	};
};

func void dia_diegoow_ritter_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Ritter_15_00");	//� ��� ������ ���� ���� ������� ������� ����� ����� ��������?
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_01");	//��� ����� ���� ������ �� ����� ����� �� ����� ���������.
	AI_Output(self,other,"DIA_DiegoOw_Ritter_11_02");	//�� ��, � ������ �������� ���� ����������� �������. � ������� �� ���. �� ��� ���� �� �������.
};


instance DIA_DIEGOOW_PERM(C_INFO)
{
	npc = pc_thiefow;
	nr = 11;
	condition = dia_diegoow_perm_condition;
	information = dia_diegoow_perm_info;
	permanent = TRUE;
	description = "��� ��� ����� ����� � ������?";
};


func int dia_diegoow_perm_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_diegoow_ritter))
	{
		return TRUE;
	};
};

func void dia_diegoow_perm_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Perm_15_00");	//��� ��� ����� ����� � ������?
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_01");	//� ��� ���, ��� ������ ���, ����� ������ ������������. ������ ����� ���������� ����.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_02");	//� ��, ����, ������ �� ����� ��� ���� ��� �������� ���������� ���� ������: ��������.
	AI_Output(self,other,"DIA_DiegoOw_Perm_11_03");	//������� �������� �� ����, ��� ������� ���� - � ������� �����, ��� ���������� �������.
};


instance DIA_DIEGOOW_GORN(C_INFO)
{
	npc = pc_thiefow;
	nr = 9;
	condition = dia_diegoow_gorn_condition;
	information = dia_diegoow_gorn_info;
	permanent = FALSE;
	description = "� ���� ������ ������� �����, �� ������ ������ �� ��� 1000 �������";
};


func int dia_diegoow_gorn_condition()
{
	if((KAPITEL == 2) && (MIS_RESCUEGORN == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_diegoow_gorn_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Gorn_15_00");	//� ���� ������ ������� �����, �� ������ ������ �� ��� 1000 �������.
	AI_Output(self,other,"DIA_DiegoOw_Gorn_11_01");	//�� ��������� �����. � ���� ���� 300 �����, �� ������ ����� ��. ��������� ����� ���.
	b_giveinvitems(self,other,itmi_gold,300);
	b_logentry(TOPIC_RESCUEGORN,"����� �������� 300 ������ �� ������������ �����.");
};


instance DIA_DIEGOOW_TEACH(C_INFO)
{
	npc = pc_thiefow;
	nr = 10;
	condition = dia_diegoow_teach_condition;
	information = dia_diegoow_teach_info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_diegoow_teach_condition()
{
	return TRUE;
};

func void dia_diegoow_teach_info()
{
	AI_Output(other,self,"DIA_DiegoOw_Teach_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_DiegoOw_Teach_11_01");	//������ �� ����� ��� �����. � ���� ���� ���� ��������.
};


instance DIA_THIEFOW_PICKPOCKET(C_INFO)
{
	npc = pc_thiefow;
	nr = 900;
	condition = dia_thiefow_pickpocket_condition;
	information = dia_thiefow_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thiefow_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thiefow_pickpocket_info()
{
	Info_ClearChoices(dia_thiefow_pickpocket);
	Info_AddChoice(dia_thiefow_pickpocket,DIALOG_BACK,dia_thiefow_pickpocket_back);
	Info_AddChoice(dia_thiefow_pickpocket,DIALOG_PICKPOCKET,dia_thiefow_pickpocket_doit);
};

func void dia_thiefow_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thiefow_pickpocket);
};

func void dia_thiefow_pickpocket_back()
{
	Info_ClearChoices(dia_thiefow_pickpocket);
};

