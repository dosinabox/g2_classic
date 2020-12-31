
instance DIA_JERGAN_EXIT(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 999;
	condition = dia_jergan_exit_condition;
	information = dia_jergan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jergan_exit_condition()
{
	return TRUE;
};

func void dia_jergan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JERGAN_HALLO(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 2;
	condition = dia_jergan_hallo_condition;
	information = dia_jergan_hallo_info;
	permanent = FALSE;
	description = "��� �� ����� �������?";
};


func int dia_jergan_hallo_condition()
{
	return TRUE;
};

func void dia_jergan_hallo_info()
{
	AI_Output(other,self,"DIA_Jergan_Hallo_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Jergan_Hallo_13_01");	//� ������ �� �����. ���� ������� �������� ��������� � ��������� ��� ���������.
};


instance DIA_JERGAN_VERMISSTE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 2;
	condition = dia_jergan_vermisste_condition;
	information = dia_jergan_vermisste_info;
	permanent = FALSE;
	description = "���������?";
};


func int dia_jergan_vermisste_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo))
	{
		return TRUE;
	};
};

func void dia_jergan_vermisste_info()
{
	AI_Output(other,self,"DIA_Jergan_Vermisste_15_00");	//���������?
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_01");	//��������� �������, ����� �� ��� ������ �������. ����������� �� ��� �� ������� ������ - ��� � �������������!
	AI_Output(self,other,"DIA_Jergan_Vermisste_13_02");	//�� ��� ��, ���� ����-�� ������� ������, � ������ �������� �� �����.
};


instance DIA_JERGAN_BURG(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_burg_condition;
	information = dia_jergan_burg_info;
	permanent = FALSE;
	description = "�� ������ ������ ��� ���������� � �����?";
};


func int dia_jergan_burg_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void dia_jergan_burg_info()
{
	AI_Output(other,self,"DIA_Jergan_Burg_15_00");	//�� ������ ������ ��� ���������� � �����?
	AI_Output(self,other,"DIA_Jergan_Burg_13_01");	//�������, �� �� ������ ������� ��� ������.
	AI_Output(self,other,"DIA_Jergan_Burg_13_02");	//���� ���� ������� ��������� �� �����, �������� � ��������� ������. ����� ���, ��� ��� ���� ����� �����, � �������.
	Log_CreateTopic(TOPIC_ORICBRUDER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORICBRUDER,LOG_RUNNING);
	b_logentry(TOPIC_ORICBRUDER,"����� � ���� � �����, � ������ ������� �����, ��� ��� ���� ����� � �������.");
};


instance DIA_JERGAN_GEGEND(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_gegend_condition;
	information = dia_jergan_gegend_info;
	permanent = TRUE;
	description = "��� ��� ����� ����� �� ���� ���������?";
};


func int dia_jergan_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_hallo))
	{
		return TRUE;
	};
};


var int jergan_tell;

func void dia_jergan_gegend_info()
{
	if(JERGAN_TELL == FALSE)
	{
		AI_Output(other,self,"DIA_Jergan_Gegend_15_00");	//��� ��� ����� ����� �� ���� ���������?
		AI_Output(self,other,"DIA_Jergan_Gegend_13_01");	//���� �� ������ ������, ���� �� �����, ��� ���� ����������.
		AI_Output(self,other,"DIA_Jergan_Gegend_13_02");	//��� ����������� ����� ����� ����� � ������ ��� ��������� ������ �����. � ���� ��, ���-�� ����� ���������� �������.
	};
	AI_Output(self,other,"DIA_Jergan_Gegend_13_03");	//��� ������ �������� ����� ������. ���� �� �� �� ����������, �� �������� ��������� �� ���.
	JERGAN_TELL = TRUE;
};


instance DIA_JERGAN_HILFE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_hilfe_condition;
	information = dia_jergan_hilfe_info;
	permanent = FALSE;
	description = "��� ��� ������� � �����?";
};


func int dia_jergan_hilfe_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_burg) && (Npc_GetDistToWP(self,"OW_STAND_JERGAN") <= 1000))
	{
		return TRUE;
	};
};

func void dia_jergan_hilfe_info()
{
	AI_Output(other,self,"DIA_Jergan_Hilfe_15_00");	//��� ��� ������� � �����?
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_01");	//������ �����, ������ � ������ ������. �� ���� �� �������� ����� � ������ �������, ��������, � ���� ����� ����.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_02");	//���� ����� ��������� �������� �� ����� � ������������ ����. ����� �����, ���� �� ������ ����� ���� �� �������.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_03");	//���� ���������� ����� �� ������. �� ������ ������� ��� - ����������� � ����� ��� ����� �����, � ����� ������ �� ���� ��� � ������.
	AI_Output(self,other,"DIA_Jergan_Hilfe_13_04");	//� ���� ����� ����������, ���� �� ���������� �����.
};


instance DIA_JERGAN_MINE(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_mine_condition;
	information = dia_jergan_mine_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_jergan_mine_condition()
{
	if(Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000)
	{
		return TRUE;
	};
};

func void dia_jergan_mine_info()
{
	AI_Output(other,self,"DIA_Jergan_Mine_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Jergan_Mine_13_01");	//� ���������. ��� ������ - ������� �� ������. �� ��� ��� �������� ������ �� ��������� ��� �����.
	AI_Output(self,other,"DIA_Jergan_Mine_13_02");	//����, ������ ����� ����� ���������� ������� - ����, �������, �� ������, ��� �������.
};


instance DIA_JERGAN_CLAW(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_claw_condition;
	information = dia_jergan_claw_info;
	permanent = FALSE;
	description = "�� ������ �������� ���� �����?";
};


func int dia_jergan_claw_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,dia_jergan_mine) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jergan_claw_info()
{
	AI_Output(other,self,"DIA_Jergan_Claw_15_00");	//�� ������ �������� ���� �����?
	AI_Output(self,other,"DIA_Jergan_Claw_13_01");	//� ���� �������� ����, ��� �������� ����� ���� ������.
};


instance DIA_JERGAN_TEACH(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_teach_condition;
	information = dia_jergan_teach_info;
	permanent = TRUE;
	description = "(������� �������� ������)";
};


func int dia_jergan_teach_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_KnowsInfo(other,dia_jergan_claw) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE))
	{
		return TRUE;
	};
};

func void dia_jergan_teach_info()
{
	AI_Output(other,self,"DIA_Jergan_Teach_15_00");	//������ ���, ��� �������� �����.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Jergan_Teach_13_01");	//����� ����� �������� ����� ������ � ������ ������. ��� ������ ����������, ����� �� ��������� ������.
		AI_Output(self,other,"DIA_Jergan_Teach_13_02");	//����� ������� �� ������ �������� �� ������ ����� ���������, �� ����� ������ � ����������.
	};
};


instance DIA_JERGAN_DIEGO(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 9;
	condition = dia_jergan_diego_condition;
	information = dia_jergan_diego_info;
	permanent = FALSE;
	description = "�� ������, ���� ���������� �����? ";
};


func int dia_jergan_diego_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && (Npc_KnowsInfo(other,dia_diegoow_hallo) == FALSE) && Npc_KnowsInfo(other,dia_parcival_diego))
	{
		return TRUE;
	};
};

func void dia_jergan_diego_info()
{
	AI_Output(other,self,"DIA_Jergan_Diego_15_00");	//�� ������, ���� ���������� �����?
	AI_Output(self,other,"DIA_Jergan_Diego_13_01");	//�����? �� ��� ����� �� ���������� ����������. �� ����� ������.
	AI_Output(self,other,"DIA_Jergan_Diego_13_02");	//� ����� ��� � ����� �������� � ������, �������� ������.
	AI_Output(self,other,"DIA_Jergan_Diego_13_03");	//������ ������ ����� ��� ��� ������? ��� ����, � ����� �� ����������� � �����.
	AI_Output(self,other,"DIA_Jergan_Diego_13_04");	//������ ���� ����� ����� ������. ��� ���� ��� � �����.
};


instance DIA_JERGAN_LEADER(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 3;
	condition = dia_jergan_leader_condition;
	information = dia_jergan_leader_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jergan_leader_condition()
{
	if((Npc_GetDistToWP(self,"OW_NEWMINE_04") < 1000) && Npc_IsDead(newmine_leadsnapper) && Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper))
	{
		return TRUE;
	};
};

func void dia_jergan_leader_info()
{
	AI_Output(self,other,"DIA_Jergan_Leader_13_00");	//�� ���� ������ ����. � ��� - �� ������ ����� ����� �����?
	if(Npc_HasItems(other,itat_clawleader) >= 1)
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_01");	//��.
		AI_Output(self,other,"DIA_Jergan_Leader_13_02");	//���, ����� ����� ���������. ���� ����, ������� ��������������� ����� ����.
		AI_Output(self,other,"DIA_Jergan_Leader_13_03");	//���� �� ������� ����������� ����������, �� �������� �� ��� ����� ���� ������.
	}
	else
	{
		AI_Output(other,self,"DIA_Jergan_Leader_15_04");	//���.
		AI_Output(self,other,"DIA_Jergan_Leader_13_05");	//��� �� ���. � ������, ��� ����� ����� ���������.
	};
};


instance DIA_JERGAN_PICKPOCKET(C_INFO)
{
	npc = vlk_4110_jergan;
	nr = 900;
	condition = dia_jergan_pickpocket_condition;
	information = dia_jergan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_jergan_pickpocket_condition()
{
	return c_beklauen(84,110);
};

func void dia_jergan_pickpocket_info()
{
	Info_ClearChoices(dia_jergan_pickpocket);
	Info_AddChoice(dia_jergan_pickpocket,DIALOG_BACK,dia_jergan_pickpocket_back);
	Info_AddChoice(dia_jergan_pickpocket,DIALOG_PICKPOCKET,dia_jergan_pickpocket_doit);
};

func void dia_jergan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jergan_pickpocket);
};

func void dia_jergan_pickpocket_back()
{
	Info_ClearChoices(dia_jergan_pickpocket);
};

