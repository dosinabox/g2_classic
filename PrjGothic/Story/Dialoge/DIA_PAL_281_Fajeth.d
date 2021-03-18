
func int c_snapperdeath()
{
	if(Npc_IsDead(newmine_snapper1) && Npc_IsDead(newmine_snapper2) && Npc_IsDead(newmine_snapper3) && Npc_IsDead(newmine_snapper4) && Npc_IsDead(newmine_snapper5) && Npc_IsDead(newmine_snapper6) && Npc_IsDead(newmine_snapper7) && Npc_IsDead(newmine_snapper8))
	{
		return TRUE;
	};
	return FALSE;
};


instance DIA_FAJETH_EXIT(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 999;
	condition = dia_fajeth_exit_condition;
	information = dia_fajeth_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fajeth_exit_condition()
{
	return TRUE;
};

func void dia_fajeth_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_FIRST(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_first_condition;
	information = dia_fajeth_first_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fajeth_first_condition()
{
	if(garond.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_fajeth_first_info()
{
	AI_Output(self,other,"DIA_Fajeth_First_12_00");	//��� �� ����� � ��� �� ������� �����?
	AI_Output(other,self,"DIA_Fajeth_First_15_01");	//� ������ �� ������� ����� ������...
	AI_Output(self,other,"DIA_Fajeth_First_12_02");	//����� ���� ����� ���������� ��������� �� �����. ����������� ������ ���. �� ����������������� ���� �����������.
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_HALLO(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_hallo_condition;
	information = dia_fajeth_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fajeth_hallo_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_fajeth_hallo_info()
{
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_00");	//������ �� ������?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_01");	//� ������ �� ������� �������...
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_02");	//����� ������. ��� ����� ����� ����� ����.
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_03");	//� ����� �� ��� ����, ����� �������� ����.
	AI_Output(self,other,"DIA_Fajeth_Hallo_12_04");	//���? ����� ����� �� ������?
	AI_Output(other,self,"DIA_Fajeth_Hallo_15_05");	//� ��� ������ ������ ��������, ������� ���� ������ � ���������� �������.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_06");	//�, �������������� ���. ���� ����������� ������� � ���� � ���� ����� �����������.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_07");	//�� ���� �� ����� ����������, ���� �� �� ���� ������������ ������ ���� ������� ����, ����� ������ ���.
		Info_AddChoice(dia_fajeth_hallo,"��� � ���� ������� ��� ����?",dia_fajeth_hallo_tun);
		Info_AddChoice(dia_fajeth_hallo,"��� ������� ������.",dia_fajeth_hallo_kdfnein);
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_08");	//��� ������ - ��������� ��� ����, ������� � ����� ������������ ��� ������ ���� � ��� �� ������.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_09");	//��� �������� � ���������� �����. �� ������� ������ - �������������, �� ������ ��������� ��� �������.
		Info_AddChoice(dia_fajeth_hallo,"��� � ���� ������� ��� ����?",dia_fajeth_hallo_tun);
		Info_AddChoice(dia_fajeth_hallo,"� ���� ��� ���� ������. �� �������.",dia_fajeth_hallo_milnein);
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_10");	//�������� - � �� ����, ����� ������ ������� ��� �������� - ��, ������ ����, � ���� ���� �� �� �������.
		AI_Output(self,other,"DIA_Fajeth_Hallo_12_11");	//�� ������ ��� � �������� ���� �����, �� ������ ��������� ���� ������� ��� ����.
		Info_AddChoice(dia_fajeth_hallo,"� ����� ���� ���� ����.",dia_fajeth_hallo_sldja);
		Info_AddChoice(dia_fajeth_hallo,"���, � ���� ��� ������� �� ��, ����� ������ ���� ��������.",dia_fajeth_hallo_sldnein);
	};
};

func void dia_fajeth_hallo_tun()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_Tun_15_00");	//��� � ���� ������� ��� ����?
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_01");	//��� ��� ��������� ����, ���� ��������� ������ ������ ������ ������. ������, ��� ������ �������� ���������� ����������� ��� ���������.
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_02");	//� �� ����, ���� ��� ���� - �� ���� ��� �����, � ������ �� ����� �����������.
	if(Npc_IsDead(fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_03");	//���, ������ ����� �������, ������� ��� �� ������ - � ������ � ��� ��������� �����������.
	};
	if(Npc_IsDead(bilgot) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_04");	//� ���� ��� �������? �������? �� - �� ���� ������.
	};
	if(Npc_IsDead(tengron) == FALSE)
	{
		AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_05");	//��������? �������, �� ����� ���������, �� �� �� �������� ��������� ��������.
	};
	AI_Output(self,other,"DIA_Fajeth_Hallo_Tun_12_06");	//�� ������������, ��� ����� ������� ���. � ����, ����� �� �������� ���� �������� ������ � ���� ��.
	Wld_InsertNpc(newmine_snapper7,"OW_PATH_333");
	Wld_InsertNpc(newmine_snapper8,"OW_PATH_333");
	Wld_InsertNpc(newmine_snapper3,"SPAWN_OW_BLOCKGOBBO_CAVE_DM6");
	MIS_FAJETH_KILL_SNAPPER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FAJETHKILLSNAPPER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FAJETHKILLSNAPPER,LOG_RUNNING);
	b_logentry(TOPIC_FAJETHKILLSNAPPER,"������ ������ ����, ��� ��������� �� ���������, ������� ������ ������� ������ �����.");
	Info_ClearChoices(dia_fajeth_hallo);
	PrintScreen("",-1,-1,FONT_SCREEN,0);
};

func void dia_fajeth_hallo_kdfnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_KDFNein_15_00");	//��� ������� ������. � �� ���� ������ ����.
	AI_Output(self,other,"DIA_Fajeth_Hallo_KDFNein_12_01");	//�������, �, ��������������. � ������ ���� ���, ��� �� ������� �����.
	MIS_FAJETH_KILL_SNAPPER = LOG_OBSOLETE;
	Info_ClearChoices(dia_fajeth_hallo);
};

func void dia_fajeth_hallo_milnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_MILNein_15_00");	//� ���� ��� ���� ������. �� �������.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_01");	//� �� ��������� ���. �� ������ ����� ����, ��� � ������ ����.
	AI_Output(self,other,"DIA_Fajeth_Hallo_MILNein_12_02");	//������������, ��� � ���� ������� �� ���� -��� '��� � ���� �������?' �������?
};

func void dia_fajeth_hallo_sldja()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDJa_15_00");	//� ����� ���� ���� ����. ���� �� ��������� ���, ��������, � � ���������.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_01");	//� �� ������ ����� ���� � ����������. � �������� �����������, ����� ������� ����.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_02");	//�� � ���� ���������� ���� ������ ����, � ������� ���� 100 �������, ���� �� ��������� ��� ������ ��� ����.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDJa_12_03");	//�� ���, �� �����?
	FAJETH_PAY = TRUE;
	Info_ClearChoices(dia_fajeth_hallo);
	Info_AddChoice(dia_fajeth_hallo,"��� � ���� ������� ��� ����?",dia_fajeth_hallo_tun);
	Info_AddChoice(dia_fajeth_hallo,"���, � ���� ��� �������...",dia_fajeth_hallo_sldnein);
};

func void dia_fajeth_hallo_sldnein()
{
	AI_Output(other,self,"DIA_Fajeth_Hallo_SLDNein_15_00");	//���, � ���� ��� ������� �� ��, ����� ������ ���� ��������.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_01");	//�� ����� ��� ����� ���������� �� ������ �����? �� ������ ������ �� ��������.
	AI_Output(self,other,"DIA_Fajeth_Hallo_SLDNein_12_02");	//��� ��� �� �� ������ ������ ���, ������� ���� ������� � ����������.
	MIS_FAJETH_KILL_SNAPPER = LOG_OBSOLETE;
	Info_ClearChoices(dia_fajeth_hallo);
};


instance DIA_FAJETH_LEADER(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 2;
	condition = dia_fajeth_leader_condition;
	information = dia_fajeth_leader_info;
	permanent = FALSE;
	description = "� ���� ������ ����.";
};


func int dia_fajeth_leader_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper) && Npc_IsDead(newmine_leadsnapper) && (MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_fajeth_leader_info()
{
	AI_Output(other,self,"DIA_Fajeth_Leader_15_00");	//� ���� ������ ����.
	AI_Output(self,other,"DIA_Fajeth_Leader_12_01");	//������. ��� ������, ��� ����� �� ��� ������. � �� �����, ��� ������ ��� ������� ������� �� ���.
	if(FAJETH_PAY == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_Leader_12_02");	//��� ���� ������ - ��� ��������������.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	fajeth.flags = 0;
	MIS_FAJETH_KILL_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_FAJETHKILLSNAPPER);
};


instance DIA_FAJETH_SNAPPER_KILLED(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_snapper_killed_condition;
	information = dia_fajeth_snapper_killed_info;
	permanent = TRUE;
	description = "�� ���������� ���������.";
};


func int dia_fajeth_snapper_killed_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING) && (c_snapperdeath() == TRUE))
	{
		return TRUE;
	};
};

func void dia_fajeth_snapper_killed_info()
{
	AI_Output(hero,self,"DIA_Fajeth_SNAPPER_KILLED_15_00");	//�� ���������� ���������.
	AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_01");	//������� ������. � � ���������� ������� �� ���� ����������.
	if(FAJETH_PAY == TRUE)
	{
		AI_Output(self,hero,"DIA_Fajeth_SNAPPER_KILLED_12_02");	//�� ��������� ���� ������ - ��� 100 �����, ��� � ��������������.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	fajeth.flags = 0;
	MIS_FAJETH_KILL_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_FAJETHKILLSNAPPER);
};


instance DIA_FAJETH_RUNNING(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_running_condition;
	information = dia_fajeth_running_info;
	permanent = TRUE;
	description = "��� ���������� � ����� �����?";
};


func int dia_fajeth_running_condition()
{
	if(MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_fajeth_running_info()
{
	AI_Output(other,self,"DIA_Fajeth_Running_15_00");	//��� ���������� � ����� �����?
	AI_Output(self,other,"DIA_Fajeth_Running_12_01");	//�� ������ ������, ������ ���������� ���� �����? �� ��� ��� ����� �������� �� ������!
	AI_Output(self,other,"DIA_Fajeth_Running_12_02");	//��������� � ����� ����������, ��� ���-������ ��������!
};


instance DIA_FAJETH_BELOHNUNG(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 3;
	condition = dia_fajeth_belohnung_condition;
	information = dia_fajeth_belohnung_info;
	permanent = FALSE;
	description = "����� ���, ������� ���� ������� ��� ������.";
};


func int dia_fajeth_belohnung_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) || (MIS_FAJETH_KILL_SNAPPER == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_fajeth_belohnung_info()
{
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_00");	//����� ���, ������� ���� ������� ��� ������.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_01");	//������ �������, ��� �� ������ ������ ������ ��� ����� ����.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_02");	//��-�� ���������� ��������� �� ��� �� �������� ����� ����� �����.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_03");	//���� ������ ������ �������� ������������, �� ������ �������� ������ ����.
	AI_Output(other,self,"DIA_Fajeth_BELOHNUNG_15_04");	//�������. � ��� � ������� ���.
	AI_Output(self,other,"DIA_Fajeth_BELOHNUNG_12_05");	//������. �� �������� �� ����. � ����� ���������� ���� ������� �� ����������.
	FAJETH_ORE = TRUE;
	b_logentry(TOPIC_SCOUTMINE,"��������� ������� ������ ������ ��� ����� ����.");
	AI_StopProcessInfos(self);
};


instance DIA_FAJETH_PERM2(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 9;
	condition = dia_fajeth_perm2_condition;
	information = dia_fajeth_perm2_info;
	permanent = TRUE;
	description = "��� ���� ������ ����?";
};


func int dia_fajeth_perm2_condition()
{
	if(Npc_KnowsInfo(other,dia_fajeth_belohnung) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_fajeth_perm2_info()
{
	AI_Output(other,self,"DIA_Fajeth_Perm2_15_00");	//��� ���� ������ ����?
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_01");	//�����. ��������� ����� ���.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_02");	//����� �� ������� ����, ������� ��� ��� ������ - �� ������ ��� ����� �� �������� ����� ������ ����� ��������. ������ ��������.
	AI_Output(self,other,"DIA_Fajeth_Perm2_12_03");	//�� �� �� �������� - �� ������� ����, ���� � �������� �����.
};


instance DIA_FAJETH_ERZABBAU(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 11;
	condition = dia_fajeth_erzabbau_condition;
	information = dia_fajeth_erzabbau_info;
	permanent = TRUE;
	description = "��� ���� ������ ����?";
};


func int dia_fajeth_erzabbau_condition()
{
	if(Npc_KnowsInfo(other,dia_fajeth_belohnung) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_fajeth_erzabbau_info()
{
	AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_00");	//��� ���� ������ ����?
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_01");	//����� ����� ���������. � ���� �� ���?
		AI_Output(other,self,"DIA_Fajeth_ERZABBAU_15_02");	//������� ������.
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_03");	//��, ����� � �������, ��� ������������ ����� �������. � ��� ����� ����� ����� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Fajeth_ERZABBAU_12_04");	//�� �� ��� ��� ������...
	};
};


instance DIA_FAJETH_PICKPOCKET(C_INFO)
{
	npc = pal_281_fajeth;
	nr = 900;
	condition = dia_fajeth_pickpocket_condition;
	information = dia_fajeth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_fajeth_pickpocket_condition()
{
	return c_beklauen(56,95);
};

func void dia_fajeth_pickpocket_info()
{
	Info_ClearChoices(dia_fajeth_pickpocket);
	Info_AddChoice(dia_fajeth_pickpocket,DIALOG_BACK,dia_fajeth_pickpocket_back);
	Info_AddChoice(dia_fajeth_pickpocket,DIALOG_PICKPOCKET,dia_fajeth_pickpocket_doit);
};

func void dia_fajeth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fajeth_pickpocket);
};

func void dia_fajeth_pickpocket_back()
{
	Info_ClearChoices(dia_fajeth_pickpocket);
};

