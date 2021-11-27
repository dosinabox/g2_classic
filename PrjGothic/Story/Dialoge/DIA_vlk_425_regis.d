
instance DIA_REGIS_EXIT(C_INFO)
{
	npc = vlk_425_regis;
	nr = 999;
	condition = dia_regis_exit_condition;
	information = dia_regis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_regis_exit_condition()
{
	return TRUE;
};

func void dia_regis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_REGIS_PICKPOCKET(C_INFO)
{
	npc = vlk_425_regis;
	nr = 900;
	condition = dia_regis_pickpocket_condition;
	information = dia_regis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_regis_pickpocket_condition()
{
	return c_beklauen(40,35);
};

func void dia_regis_pickpocket_info()
{
	Info_ClearChoices(dia_regis_pickpocket);
	Info_AddChoice(dia_regis_pickpocket,DIALOG_BACK,dia_regis_pickpocket_back);
	Info_AddChoice(dia_regis_pickpocket,DIALOG_PICKPOCKET,dia_regis_pickpocket_doit);
};

func void dia_regis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_regis_pickpocket);
};

func void dia_regis_pickpocket_back()
{
	Info_ClearChoices(dia_regis_pickpocket);
};


instance DIA_REGIS_HALLO(C_INFO)
{
	npc = vlk_425_regis;
	nr = 1;
	condition = dia_regis_hallo_condition;
	information = dia_regis_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_regis_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_regis_hallo_info()
{
	AI_Output(self,other,"DIA_Regis_Hallo_13_00");	//��, �� ������� � ���� ������, ��?
	AI_Output(other,self,"DIA_Regis_Hallo_15_01");	//��, � ��?
	AI_Output(self,other,"DIA_Regis_Hallo_13_02");	//� ������� � �������� � ��� ������ �������� ����� ��� ����. � ���� ����� ����������� ������, �������, ������, ��� ������ ������� �� ��������, ����� ��� ��������� � ���������.
	AI_Output(self,other,"DIA_Regis_Hallo_13_03");	//�� � �� ���� ������ �����. � �� ����, ����� ���� ����� ����, ����� � ���� ��������� �� ������.
};


instance DIA_REGIS_MILIZ(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_miliz_condition;
	information = dia_regis_miliz_info;
	permanent = FALSE;
	description = "��� �� ������ ���������� �� ���������?";
};


func int dia_regis_miliz_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_hallo))
	{
		return TRUE;
	};
};

func void dia_regis_miliz_info()
{
	AI_Output(other,self,"DIA_Regis_MILIZ_15_00");	//��� �� ������ ���������� �� ���������?
	AI_Output(self,other,"DIA_Regis_Add_13_01");	//��� ������ ��������� ���� �� ���������. ����� ���� �����.
	AI_Output(self,other,"DIA_Regis_Add_13_02");	//�� �������� ������������ �������� ������ �� ������ ��������� �����.
	AI_Output(self,other,"DIA_Regis_Add_13_03");	//�� ����� �������� � ���������, ����� ���� ����������� ����� ������.
	AI_Output(self,other,"DIA_Regis_Add_13_04");	//��������� ��� ��������, ���� �� �� ��������� ����������� ������, ���� ��� ����� ����� �����������, �� ���������� �� ��������.
};


instance DIA_REGIS_ANDRE(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_andre_condition;
	information = dia_regis_andre_info;
	permanent = FALSE;
	description = "��� ��� �� ������ ���������� � ����� �����?";
};


func int dia_regis_andre_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_miliz))
	{
		return TRUE;
	};
};

func void dia_regis_andre_info()
{
	AI_Output(other,self,"DIA_Regis_ANDRE_15_00");	//��� ��� �� ������ ���������� � ����� �����?
	AI_Output(self,other,"DIA_Regis_Add_13_05");	//�� ����� ����� ��������� �����.
	AI_Output(self,other,"DIA_Regis_Add_13_06");	//���� �� ������� ����� � ������, ���� �������� ������� ����� ����� ���.
	AI_Output(self,other,"DIA_Regis_Add_13_07");	//� ���-�� �������� � ����� �����������.
	AI_Output(self,other,"DIA_Regis_Add_13_08");	//�� ������� ���������� � ����� �����.
	AI_Output(self,other,"DIA_Regis_Add_13_09");	//� ���� ������ �������� ��� � 50 ������� �����.
	AI_Output(self,other,"DIA_Regis_Add_13_10");	//������ ���, ��� ��� ��������� �����, � �� ���� �� ������ ���������.
	AI_Output(self,other,"DIA_Regis_Add_13_11");	//��� ������ ����� �������� �� ����, ��� ���� �����.
};


instance DIA_REGIS_VALENTINO(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_valentino_condition;
	information = dia_regis_valentino_info;
	permanent = FALSE;
	description = "� ��� �� ������?";
};


func int dia_regis_valentino_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_andre))
	{
		return TRUE;
	};
};

func void dia_regis_valentino_info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_12");	//� ��� �� ������?
	AI_Output(self,other,"DIA_Regis_Add_13_13");	//� ������ �� ����� ���������. �� ����� ��������� � ������� ����� �����.
	AI_Output(self,other,"DIA_Regis_Add_13_14");	//������ � �������� ������. �� ���� ���� ������ ����� ���� �� ����...
};


instance DIA_REGIS_VALDEFEAT(C_INFO)
{
	npc = vlk_425_regis;
	nr = 5;
	condition = dia_regis_valdefeat_condition;
	information = dia_regis_valdefeat_info;
	permanent = FALSE;
	description = "� �������� ����� ���������...";
};


func int dia_regis_valdefeat_condition()
{
	if(Npc_KnowsInfo(other,dia_regis_valentino) && (valentino.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_regis_valdefeat_info()
{
	AI_Output(other,self,"DIA_Regis_Add_15_15");	//� �������� ����� ���������...
	AI_Output(self,other,"DIA_Regis_Add_13_16");	//�?
	AI_Output(other,self,"DIA_Regis_Add_15_17");	//� ����� ��� ������� �������...
	AI_Output(self,other,"DIA_Regis_Add_13_18");	//(�������) �� �������� ���...
	if(!Npc_IsDead(valentino))
	{
		AI_Output(self,other,"DIA_Regis_Add_13_19");	//��� - � ����� ��� ������ � ��� �������, ����� ���� ������ �����������.
		b_giveinvitems(self,other,itri_prot_edge_01_valentino,1);
		REGIS_RING = TRUE;
		AI_Output(self,other,"DIA_Regis_Add_13_20");	//(����������) �� ������ �������� ��� ����������, ��� ������ ��� �������...
	};
};


var int regis_bogendieb;

instance DIA_REGIS_PERM(C_INFO)
{
	npc = vlk_425_regis;
	nr = 200;
	condition = dia_regis_perm_condition;
	information = dia_regis_perm_info;
	permanent = TRUE;
	description = "������ ���-������ ����������?";
};


func int dia_regis_perm_condition()
{
	return TRUE;
};

func void dia_regis_perm_info()
{
	AI_Output(other,self,"DIA_Regis_PERM_15_00");	//������ ���-������ ����������?
	if((REGIS_BOGENDIEB == FALSE) && (MIS_BOSPER_BOGEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_01");	//����� ������� � ���.
		AI_Output(self,other,"DIA_Regis_PERM_13_02");	//�������, ������, ������-������, ��� ��������. ������ ����� ������ �������!
		AI_Output(self,other,"DIA_Regis_PERM_13_03");	//��� �������� � ��� ����� ����� ���� ��� � ������� ���.
		AI_Output(self,other,"DIA_Regis_PERM_13_04");	//������ ������� �� ���, ���� "����� ����!" �� ��� �������� ����� ���������.
		MIS_BOSPER_BOGEN = LOG_RUNNING;
		REGIS_BOGENDIEB = TRUE;
	}
	else if((MIS_BOSPER_BOGEN == LOG_SUCCESS) && (REGIS_BOGENDIEB != 2))
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_05");	//� ����� �����-�� ������� ������� ����� ���� ��� � ������ �������.
		AI_Output(self,other,"DIA_Regis_PERM_13_06");	//��� ������� - � ���� ����� ������ ������ ��� ���� �� ������, �� ���� ������ ��� ����� � ���� � ������ ���.
		REGIS_BOGENDIEB = 2;
	}
	else if(KAPITEL != 3)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_07");	//���� ��� ����. �� � �����, ��� ����� ������ ����, �� ��� �������...
	}
	else if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_08");	//����������, ��� ���� ������� ���������, � �� �������� ��������� ���.
		AI_Output(self,other,"DIA_Regis_PERM_13_09");	//���� �����, ������ ����, ��� ���� �� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Regis_PERM_13_10");	//���� ����� ������ � ������� �� ����. �� ������� ������, ��������?
		AI_Output(other,self,"DIA_Regis_PERM_15_11");	//����� ����.
		AI_Output(self,other,"DIA_Regis_PERM_13_12");	//��� ���, �� �����. ���� ����� �� �����. � ���� ����������� ���������, ������� ��.
	};
};


instance DIA_REGIS_CREW(C_INFO)
{
	npc = vlk_425_regis;
	nr = 51;
	condition = dia_regis_crew_condition;
	information = dia_regis_crew_info;
	permanent = FALSE;
	description = "� ������� ������� ������� ��� ������� ��������.";
};


func int dia_regis_crew_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_regis_crew_info()
{
	AI_Output(other,self,"DIA_Regis_Crew_15_00");	//� ������� ������� ������� ��� ������� ��������.
	AI_Output(self,other,"DIA_Regis_Crew_13_01");	//����� �� ���� ������. ���� ����� ������������ � �����, �� ��� ����� � ������.
	AI_Output(self,other,"DIA_Regis_Crew_13_02");	//���� ����� ��� �������� ������, ��, ������ �����, �� ������� �� ���.
};

