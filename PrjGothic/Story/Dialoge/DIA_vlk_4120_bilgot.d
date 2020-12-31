
instance DIA_BILGOT_EXIT(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 999;
	condition = dia_bilgot_exit_condition;
	information = dia_bilgot_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bilgot_exit_condition()
{
	return TRUE;
};

func void dia_bilgot_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_HALLO(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_hallo_condition;
	information = dia_bilgot_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_bilgot_hallo_condition()
{
	return TRUE;
};

func void dia_bilgot_hallo_info()
{
	AI_Output(self,other,"DIA_Bilgot_HALLO_05_00");	//��, ������ �� ������? �� ������ �� �����?
	Info_AddChoice(dia_bilgot_hallo,"��, � ������ �� ����� - �� � ���?",dia_bilgot_hallo_burg);
	Info_AddChoice(dia_bilgot_hallo,"� ������ �������� ������ ����...",dia_bilgot_hallo_zufall);
};

func void dia_bilgot_hallo_zufall()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Zufall_15_00");	//� ������ �������� ������ ����...
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_01");	//������, ����� �� ������� ���� ��������. �� ������� ����� - ���������� ����������!
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_02");	//� ��� �� ��������, ����� ��� �� �������� ����-������ �� �����.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Zufall_05_03");	//��� �� �� ������� ���, ������ �� ������? ������ - ����� ����� ���� ������ ��������!
	AI_StopProcessInfos(self);
};

func void dia_bilgot_hallo_burg()
{
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_00");	//��, � ������ �� ����� - �� � ���?
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_01");	//��� ��� ����?
	AI_Output(other,self,"DIA_Bilgot_HALLO_Burg_15_02");	//�� �����, ��� �����. ���� ��� ��� ���, ���� �� ��� ���� � ����.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_03");	//����. ����� ������ ����������� ���� � ������������.
	AI_Output(self,other,"DIA_Bilgot_HALLO_Burg_05_04");	//� ����� ���� ���-���. ���� �� � �� ��� ������� �� ������, � �� ����� ������.
	Info_ClearChoices(dia_bilgot_hallo);
};


instance DIA_BILGOT_JOB(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_job_condition;
	information = dia_bilgot_job_info;
	permanent = FALSE;
	description = "� ��� �� ������ ����� �������, ������?";
};


func int dia_bilgot_job_condition()
{
	return TRUE;
};

func void dia_bilgot_job_info()
{
	AI_Output(other,self,"DIA_Bilgot_Job_15_00");	//� ��� �� ������ ����� �������, ������?
	AI_Output(self,other,"DIA_Bilgot_Job_05_01");	//� ����� ��� ������� �� ����������. �������-�����, ��������, ��� ��� ��������, ������ ����, ������ ����.
	AI_Output(self,other,"DIA_Bilgot_Job_05_02");	//��� ����� ���� �������� ���� �� ����� ��������. ��� ���� �� �����, ��, �� ������� ����, ��� ���� ��������� ���.
	AI_Output(self,other,"DIA_Bilgot_Job_05_03");	//� ������ � - ���, ��� �������� �� ������, ������� ���������� ������.
	AI_Output(self,other,"DIA_Bilgot_Job_05_04");	//������ ��� ���� �����, ��� ���� ���������� �� ������� ���� ���������?
	AI_Output(self,other,"DIA_Bilgot_Job_05_05");	//��� �������� ���� �������. ����� ����, ���� �� ��� ������� ���������...
};


instance DIA_BILGOT_HILFE(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_hilfe_condition;
	information = dia_bilgot_hilfe_info;
	permanent = FALSE;
	description = "��� �� ������ � ���������?";
};


func int dia_bilgot_hilfe_condition()
{
	if(MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bilgot_hilfe_info()
{
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_00");	//��� �� ������ � ���������?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_01");	//����� ���� ����� ���? � �� ������ ���, ��� ������ �� �����������!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_02");	//� ��������� ����������� �� ���� ���������,
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_03");	//��� �������. � �������� �� ���� - ��� �� ����������� �����!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_04");	//����� �������� ���, ��� �� � ��� ������.
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_05");	//��... � ��� �� ������ ����, �� ������ ��� ����� �������!
	AI_Output(other,self,"DIA_Bilgot_Hilfe_15_06");	//��� �� ������?
	AI_Output(self,other,"DIA_Bilgot_Hilfe_05_07");	//���� ���� ������� ����� ��������� - �� ������ �������� ���� ������!
	if(Npc_IsDead(fed) == FALSE)
	{
		AI_Output(self,other,"DIA_Bilgot_Hilfe_05_08");	//��� ����� ����� �� ������������ - �� ������� � �����? � ����� ����� ����� �������, � � �� ���� ������� ��� ��!
	};
};


instance DIA_BILGOT_KNOWSLEADSNAPPER(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 4;
	condition = dia_bilgot_knowsleadsnapper_condition;
	information = dia_bilgot_knowsleadsnapper_info;
	permanent = FALSE;
	description = "�������� ���, ��� �� ������. � � ������ ���� ������!";
};


func int dia_bilgot_knowsleadsnapper_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_hilfe) && (MIS_FAJETH_KILL_SNAPPER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bilgot_knowsleadsnapper_info()
{
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_00");	//�������� ���, ��� �� ������. � � ������ ���� ������!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_01");	//� ����, ��� ���� ������������ �� ����. ��� ��� ���� ����������. � �������� ����� �������� �� ����������.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_02");	//��� ����� ����� � �����, ��, ��� ��... ��������. ��� ������� �� ����� ���������� � �������� ������ �����.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_03");	//�� ���� ��� ���-���. ����� ��� ���� ���� ���������. �� ����� ������������, �� � ����� ���.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_04");	//������ �������� ����� ���������, ����� �������� ���� ����, �� ������� �� ������� ������.
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_05");	//���� ���� ����� �� �������� � �����, �� ���� ������� ���������� ���� �� �����������.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_06");	//��� ��� ����� ����� ������������ �����?
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_07");	//� ����� ��� �� �������� ������ ���������� �����.
	AI_Output(other,self,"DIA_Bilgot_KNOWSLEADSNAPPER_15_08");	//�������. ��� �������, � �����. �������!
	AI_Output(self,other,"DIA_Bilgot_KNOWSLEADSNAPPER_05_09");	//�����, �� ��� ��� �����!
	Wld_InsertNpc(newmine_leadsnapper,"OW_ORC_LOOKOUT_2_01");
	b_logentry(TOPIC_FAJETHKILLSNAPPER,"������ ��������� ��� � ������ ���� ���������. �� ������ ���� �� ���������� ������ ���������� �����.");
	Log_CreateTopic(TOPIC_BILGOTESCORT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BILGOTESCORT,LOG_RUNNING);
	b_logentry(TOPIC_BILGOTESCORT,"������ �����, ����� � ����� ��� �� ������.");
};


instance DIA_BILGOT_TAKEYOUWITHME(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_takeyouwithme_condition;
	information = dia_bilgot_takeyouwithme_info;
	permanent = FALSE;
	description = "����� ������, ������! ����� ���� ����, �� ������������ � ����.";
};


func int dia_bilgot_takeyouwithme_condition()
{
	if((MIS_FAJETH_KILL_SNAPPER == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_bilgot_knowsleadsnapper))
	{
		return TRUE;
	};
};

func void dia_bilgot_takeyouwithme_info()
{
	AI_Output(other,self,"DIA_Bilgot_TAKEYOUWITHME_15_00");	//����� ������, ������! ����� ���� ����, �� ������������ � ����.
	AI_Output(self,other,"DIA_Bilgot_TAKEYOUWITHME_05_03");	//� �����!
	Npc_ExchangeRoutine(self,"FOLLOWTOOCBRIDGE");
	bilgot.flags = 0;
	MIS_RESCUEBILGOT = LOG_RUNNING;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_LAUFSCHNELLER(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 5;
	condition = dia_bilgot_laufschneller_condition;
	information = dia_bilgot_laufschneller_info;
	permanent = FALSE;
	description = "�� �� ��� �� ���� ������� �������?!";
};


func int dia_bilgot_laufschneller_condition()
{
	if(Npc_KnowsInfo(other,dia_bilgot_takeyouwithme) && (Npc_KnowsInfo(other,dia_bilgot_beibrueckeangekommen) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bilgot_laufschneller_info()
{
	AI_Output(other,self,"DIA_Bilgot_LAUFSCHNELLER_15_00");	//�� �� ��� �� ���� ������� �������?!
	AI_Output(self,other,"DIA_Bilgot_LAUFSCHNELLER_05_01");	//� ��� ��� ������, ��� ����.
};


instance DIA_BILGOT_BEIBRUECKEANGEKOMMEN(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 2;
	condition = dia_bilgot_beibrueckeangekommen_condition;
	information = dia_bilgot_beibrueckeangekommen_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_bilgot_beibrueckeangekommen_condition()
{
	if(Npc_GetDistToWP(self,"START") < 8000)
	{
		return TRUE;
	};
};

func void dia_bilgot_beibrueckeangekommen_info()
{
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_00");	//������, ������. ������ ��� ����. �� ���� ���������!
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_01");	//�������!
	AI_Output(other,self,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_15_02");	//������, ����� ���� �� �����. � ����� ��������.
	AI_Output(self,other,"DIA_Bilgot_BEIBRUECKEANGEKOMMEN_05_03");	//������!
	AI_StopProcessInfos(self);
	TSCHUESSBILGOT = TRUE;
	MIS_RESCUEBILGOT = LOG_SUCCESS;
	b_giveplayerxp(XP_BILGOTESCORT);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"FLEEOUTOFOW");
};


instance DIA_BILGOT_LETZTEPAUSE(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_letztepause_condition;
	information = dia_bilgot_letztepause_info;
	permanent = TRUE;
	description = "��� �� ������� �����? � �����, �� ����� ����� ������?";
};


func int dia_bilgot_letztepause_condition()
{
	if(Npc_GetDistToWP(self,"START") < 1000)
	{
		return TRUE;
	};
};

func void dia_bilgot_letztepause_info()
{
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_00");	//��� �� ������� �����? � �����, �� ����� ����� ������?
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_01");	//� ������ �� � ����� ����. ��� ����� ����������� �������. � ���������. �� ��������!
	AI_Output(other,self,"DIA_Bilgot_LetztePause_15_02");	//��� �������.
	AI_Output(self,other,"DIA_Bilgot_LetztePause_05_03");	//������ ������� ���������.
	AI_StopProcessInfos(self);
};


instance DIA_BILGOT_OLAV(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 3;
	condition = dia_bilgot_olav_condition;
	information = dia_bilgot_olav_info;
	permanent = FALSE;
	description = "� ����� �����.";
};


func int dia_bilgot_olav_condition()
{
	if((Npc_HasItems(olav,itse_olav) == 0) && Npc_KnowsInfo(other,dia_bilgot_job))
	{
		return TRUE;
	};
};

func void dia_bilgot_olav_info()
{
	AI_Output(other,self,"DIA_Bilgot_Olav_15_00");	//� ����� �����.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_01");	//� ��� ��?
	AI_Output(other,self,"DIA_Bilgot_Olav_15_02");	//�� �����. ��� ����� �����.
	AI_Output(self,other,"DIA_Bilgot_Olav_05_03");	//��, ����. �������, ���� �� ��� ������� ��������� ������.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BILGOT_PICKPOCKET(C_INFO)
{
	npc = vlk_4120_bilgot;
	nr = 900;
	condition = dia_bilgot_pickpocket_condition;
	information = dia_bilgot_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_bilgot_pickpocket_condition()
{
	return c_beklauen(20,30);
};

func void dia_bilgot_pickpocket_info()
{
	Info_ClearChoices(dia_bilgot_pickpocket);
	Info_AddChoice(dia_bilgot_pickpocket,DIALOG_BACK,dia_bilgot_pickpocket_back);
	Info_AddChoice(dia_bilgot_pickpocket,DIALOG_PICKPOCKET,dia_bilgot_pickpocket_doit);
};

func void dia_bilgot_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bilgot_pickpocket);
};

func void dia_bilgot_pickpocket_back()
{
	Info_ClearChoices(dia_bilgot_pickpocket);
};

