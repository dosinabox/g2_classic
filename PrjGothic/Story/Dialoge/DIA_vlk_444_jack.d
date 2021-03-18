
instance DIA_JACK_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_exit_condition;
	information = dia_jack_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_jack_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_PICKPOCKET(C_INFO)
{
	npc = vlk_444_jack;
	nr = 900;
	condition = dia_jack_pickpocket_condition;
	information = dia_jack_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jack_pickpocket_condition()
{
	return c_beklauen(50,100);
};

func void dia_jack_pickpocket_info()
{
	Info_ClearChoices(dia_jack_pickpocket);
	Info_AddChoice(dia_jack_pickpocket,DIALOG_BACK,dia_jack_pickpocket_back);
	Info_AddChoice(dia_jack_pickpocket,DIALOG_PICKPOCKET,dia_jack_pickpocket_doit);
};

func void dia_jack_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jack_pickpocket);
};

func void dia_jack_pickpocket_back()
{
	Info_ClearChoices(dia_jack_pickpocket);
};


instance DIA_JACK_GREET(C_INFO)
{
	npc = vlk_444_jack;
	nr = 4;
	condition = dia_jack_greet_condition;
	information = dia_jack_greet_info;
	important = TRUE;
};


func int dia_jack_greet_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_jack_greet_info()
{
	AI_Output(self,other,"DIA_Jack_GREET_14_00");	//������, ���������� �����, ������, �� ������ �� ����.
	AI_Output(self,other,"DIA_Jack_GREET_14_01");	//� ���� ����� �����-�� �������.
	AI_Output(self,other,"DIA_Jack_GREET_14_02");	//�� ���� � ������, ������. ���, ��� ���� ����� - ��� ������� ������� ����.
};


instance DIA_JACK_JOB(C_INFO)
{
	npc = vlk_444_jack;
	nr = 5;
	condition = dia_jack_job_condition;
	information = dia_jack_job_info;
	description = "��� �� ������� �����?";
};


func int dia_jack_job_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_greet))
	{
		return TRUE;
	};
};

func void dia_jack_job_info()
{
	AI_Output(other,self,"DIA_Jack_Job_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Jack_Job_14_01");	//����� � ��� ��� ������, � ���������� ������������� �� �����, � ������� ����� ������� �������.
	AI_Output(self,other,"DIA_Jack_Job_14_02");	//�� ����� ��� �����, � ���� �����, � � ��� ��� ������� ����������� ����� ��������.
	AI_Output(self,other,"DIA_Jack_Job_14_03");	//� ���� ��� ������ ��������. ������. �� ���� ������ ���� ���� ��� ������ �����.
	AI_Output(self,other,"DIA_Jack_Job_14_04");	//�� � ��� ����� ��� �� ��� � ���.
	AI_Output(other,self,"DIA_Jack_Job_15_05");	//������?
	AI_Output(self,other,"DIA_Jack_Job_14_06");	//� ��� ���, ��� ��� ������� ��������� ��� ����, � �� ����������� ������� � ���� �����, ��� �� �������� �����. ��� ����� ������ ����.
	AI_Output(self,other,"DIA_Jack_Job_14_07");	//��� ����������� �� ������ ��������, ���������?
	AI_Output(self,other,"DIA_Jack_Job_14_08");	//�� ������ ������� ��� �������� ������������� �����, � ����� ��� �������� �� ��� ����� ��� ���� �� ������. ������ ��� ���������� ����� ������� - ���� �� ���� �����.
	AI_Output(self,other,"DIA_Jack_Job_14_09");	//� �����, ��� ��������� �������, �� ������� ����� �� ������.
	AI_Output(self,other,"DIA_Jack_Job_14_10");	//��! ����� ������ ���� �����. �����, �� ������� ����, ��� �������� � ����� �����.
	Log_CreateTopic(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLLIGHTHOUSEBANDITS,LOG_RUNNING);
	b_logentry(TOPIC_KILLLIGHTHOUSEBANDITS,"������ ������� ���� ���� �� ����� ��������� �� ���� ����, ��� ��� ��� ������ �������.");
	MIS_JACK_KILLLIGHTHOUSEBANDITS = LOG_RUNNING;
};


instance DIA_JACK_CITY(C_INFO)
{
	npc = vlk_444_jack;
	nr = 6;
	condition = dia_jack_city_condition;
	information = dia_jack_city_info;
	description = "�� ����� ������� � ������?";
};


func int dia_jack_city_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_job))
	{
		return TRUE;
	};
};

func void dia_jack_city_info()
{
	AI_Output(other,self,"DIA_Jack_City_15_00");	//�� ����� ������� � ������?
	AI_Output(self,other,"DIA_Jack_City_14_01");	//� ������ ������: ����� ��������� �����, ��������� ����� ��� ����.
	AI_Output(self,other,"DIA_Jack_City_14_02");	//���� - ��� ������ � ���. ����� ��� �����������, � ��� ���������� �����.
	AI_Output(self,other,"DIA_Jack_City_14_03");	//� ����� � ����� ����� ����������, ����� ��������� ���� �� �� ������.
};


instance DIA_JACK_HARBOR(C_INFO)
{
	npc = vlk_444_jack;
	nr = 70;
	condition = dia_jack_harbor_condition;
	information = dia_jack_harbor_info;
	permanent = TRUE;
	description = "�������� ��� �� ���� �����.";
};


func int dia_jack_harbor_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_city) && ((Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) == FALSE) && (JACKISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_harbor_info()
{
	AI_Output(other,self,"DIA_Jack_Harbor_15_00");	//�������� ��� �� ���� �����.
	AI_Output(self,other,"DIA_Jack_Harbor_14_01");	//���� �������� ������ �� ���, ��� ��� ������.
	AI_Output(self,other,"DIA_Jack_Harbor_14_02");	//����� ������ �� ��������, ����� ������������������ ������, ������� ���� ������ �� �������, � �������� ������ � ������. ����� �����, ������, ����� ������ �����.
	Info_ClearChoices(dia_jack_harbor);
	Info_AddChoice(dia_jack_harbor,DIALOG_BACK,dia_jack_harbor_back);
	Info_AddChoice(dia_jack_harbor,"������ ������� ������ �� �������� ����?",dia_jack_harbor_ships);
	Info_AddChoice(dia_jack_harbor,"��� �� ������ � ���� ��� �������?",dia_jack_harbor_rogue);
	Info_AddChoice(dia_jack_harbor,"��� ������ �� �� ������ ������?",dia_jack_harbor_leave);
};

func void dia_jack_harbor_back()
{
	Info_ClearChoices(dia_jack_harbor);
};

func void dia_jack_harbor_ships()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Ships_15_00");	//������ ������� ������ �� �������� ����?
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_01");	//����� �������, ��� ����� ����� ����� ��������, ��� �������� �� ����� ����. ��� ��� ���� �������.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_02");	//������ ����, ��������� ������ ������ ������ ��������, ��� ����� �������� � ������.
	AI_Output(self,other,"DIA_Jack_Harbor_Ships_14_03");	//������ ��������� ��� ����� ������. � � ������ ����, ������ �� ���� �����, ��� ������ ��� ����� ������.
};

func void dia_jack_harbor_rogue()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Rogue_15_00");	//��� �� ������ � ���� ��� �������?
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_01");	//�������� �� ���, ��� �� ������� �������. ����������� �� ��� ���� �� �����, ��� ����� ������. ��� ������ � ������, ��� ���� ��� ��� �������� � ������� ���� ��������� ����� � �������.
	AI_Output(self,other,"DIA_Jack_Harbor_Rogue_14_02");	//������ ����, ������� �� ��� ��������.
};

func void dia_jack_harbor_leave()
{
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_00");	//��� ������ �� �� ������ ������?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_01");	//������� ����� �� ������� �� ������� ������� �������� ����� ����� ����.
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_02");	//����������� ��������, ��� ������ ���� �� �� ��� �� �����, � ��� ��� ������ ����� ��������� �������.
	AI_Output(other,self,"DIA_Jack_Harbor_Leave_15_03");	//�? ��� �����?
	AI_Output(self,other,"DIA_Jack_Harbor_Leave_14_04");	//�����. ��� ������ � ����� ���������� ��� ������ ������ ������, � ��� ���� ������ �� ���� ��������� �����.
};


instance DIA_JACK_BANDITENWEG(C_INFO)
{
	npc = vlk_444_jack;
	nr = 7;
	condition = dia_jack_banditenweg_condition;
	information = dia_jack_banditenweg_info;
	description = "��������, ������� ��������� ���� ����, ������ ���.";
};


func int dia_jack_banditenweg_condition()
{
	if(Npc_IsDead(leuchtturmbandit_1021) && Npc_IsDead(leuchtturmbandit_1022) && Npc_IsDead(leuchtturmbandit_1023) && (MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_jack_banditenweg_info()
{
	AI_Output(other,self,"DIA_Jack_BANDITENWEG_15_00");	//��������, ������� ��������� ���� ����, ������ ���.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_01");	//��� ������? �������-�� � ����� ����� ��������� � ����� ������.
	AI_Output(self,other,"DIA_Jack_BANDITENWEG_14_02");	//������ �� ���� � �����. ������ �� ������� ����������� ����������� ����� �� ����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
	MIS_JACK_KILLLIGHTHOUSEBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_KILLLIGHTHOUSEBANDITS);
};


instance DIA_JACK_LIGHTHOUSEFREE(C_INFO)
{
	npc = vlk_444_jack;
	nr = 8;
	condition = dia_jack_lighthousefree_condition;
	information = dia_jack_lighthousefree_info;
	permanent = TRUE;
	description = "��� �������� ���� ����.";
};


func int dia_jack_lighthousefree_condition()
{
	if((MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_SUCCESS) && (Npc_GetDistToWP(self,"LIGHTHOUSE") < 3000) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_lighthousefree_info()
{
	AI_Output(other,self,"DIA_Jack_LIGHTHOUSEFREE_15_00");	//��� �������� ���� ����.
	AI_Output(self,other,"DIA_Jack_LIGHTHOUSEFREE_14_01");	//�������. ��������� �� �������� ������, ������ ����������� ����� ����������� ���. �������� ���� ����� ��� ����.
};


instance DIA_JACK_KAP3_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap3_exit_condition;
	information = dia_jack_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_jack_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP4_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap4_exit_condition;
	information = dia_jack_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_jack_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP5_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap5_exit_condition;
	information = dia_jack_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_jack_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JACK_BEMYCAPTAIN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 51;
	condition = dia_jack_bemycaptain_condition;
	information = dia_jack_bemycaptain_info;
	permanent = TRUE;
	description = "�� �� �� ����� ����� ����� � ����?";
};


func int dia_jack_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MIS_JACK_KILLLIGHTHOUSEBANDITS == LOG_SUCCESS) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == 0))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_15_00");	//�� �� �� ����� ����� ����� � ����?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_01");	//� �� � �������� ����� ���� ������ ���� ������ �� ��, ����� ���-������ ����� ���� �� ������� �����, ���� �� ���������.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_14_02");	//�� ��� ������� �������� ����� ����� ���� ��� �� ���-�� �����, ��������. �� � � ���� ��, ��� ����� ����� ������������� �� ������?
	Info_ClearChoices(dia_jack_bemycaptain);
	Info_AddChoice(dia_jack_bemycaptain,"������. ��� � ������ ��� ������.",dia_jack_bemycaptain_no);
	Info_AddChoice(dia_jack_bemycaptain,"� �������� � ����� ����� ������.",dia_jack_bemycaptain_seaman);
};

func void dia_jack_bemycaptain_seaman()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_00");	//� �������� � ����� ����� ������.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_01");	//���� ���� ������! ��� �� �������, ��������? �� �� �� ����������� ��������� ����������� ������� ������, �?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_15_02");	//��� �����?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_14_03");	//(�������) ��� ����� ���-��! ��, ����. �� � �� ���� ��� ��� ����� � ������� ���� ����. ���. ��� �� ��� � ���� ������?
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"����, ������ ������� ���� �� ������, ��� �� ����� ������� ���������. �� ������� � ������ ����� ����-������, ��� ���������� ��� ����.");
	Info_ClearChoices(dia_jack_bemycaptain);
	Info_AddChoice(dia_jack_bemycaptain,"������. ��� � ������ ��� ������.",dia_jack_bemycaptain_no);
	Info_AddChoice(dia_jack_bemycaptain,"� ��� ���� � ������� � ���� ����-������ ...?",dia_jack_bemycaptain_seaman_newofficer);
};

func void dia_jack_bemycaptain_seaman_newofficer()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_15_00");	//� ��� ���� � ������� � ���� ����-������, ��� ����������� �� � ����� � ���� ����������?
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_01");	//�������� ����, ��������. � � ���� ���� ���������� �����������.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_02");	//� ������, �������, ���� ����������� �� ����� ������. � ����� ��� ��������� � ���.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_03");	//� �� ����� �������� ���� ���� ���. � �����, �� ����� ����� �������� ��� �����.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN_seaman_NewOfficer_14_04");	//���, �������� � ���. ��������, ��� �������, � ���� ������ ���������� ������ ���.
	Info_ClearChoices(dia_jack_bemycaptain);
	MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_RUNNING;
};

func void dia_jack_bemycaptain_no()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN_no_15_00");	//������. ��� � ������ ��� ������.
	Info_ClearChoices(dia_jack_bemycaptain);
};


instance DIA_JACK_BEMYCAPTAIN2(C_INFO)
{
	npc = vlk_444_jack;
	nr = 52;
	condition = dia_jack_bemycaptain2_condition;
	information = dia_jack_bemycaptain2_info;
	description = "������ �������...";
};


func int dia_jack_bemycaptain2_condition()
{
	if((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS) || ((MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_RUNNING) && Npc_IsDead(brian)))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain2_info()
{
	if(Npc_IsDead(brian))
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_00");	//������ �����.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_01");	//��. ������� �������. �� ��� ����� ������� ������.
		MIS_JACK_NEWLIGHTHOUSEOFFICER = LOG_OBSOLETE;
	}
	else
	{
		AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN2_15_02");	//������ ����������� � ����� �����.
		AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_03");	//� ��������, ��� �� ������� ���.
		b_giveplayerxp(XP_JACK_NEWLIGHTHOUSEOFFICER);
		if(SCGOTCAPTAIN == FALSE)
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_04");	//� ���� ��� ��� �����?
		}
		else
		{
			AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN2_14_05");	//���������, ������ �� �� ����� ����� ����.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_JACK_BEMYCAPTAIN3(C_INFO)
{
	npc = vlk_444_jack;
	nr = 53;
	condition = dia_jack_bemycaptain3_condition;
	information = dia_jack_bemycaptain3_info;
	description = "���� ���� ���������.";
};


func int dia_jack_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_jack_bemycaptain2) && (SCGOTCAPTAIN == FALSE) && (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_jack_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_00");	//���� ���� ���������.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_01");	//� �������� ���� �����, ��������, �� ��� ������� � �� ��� ��������� �������.
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_02");	//� ������ �� ���� � ���������. �� ������ ����� �� ���� ��� �����������.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_03");	//� ������ ���, ��� ����� � ���� �����.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_04");	//� ������, ������ ��� ��� ������� � ���� �������. � ��, ������, ������, ���� �������������? � ���� � ����, � ���� ���� ������� �����?
	AI_Output(other,self,"DIA_Jack_BEMYCAPTAIN3_15_05");	//������� ���� � �����. � �� ��������� �� ��������.
	AI_Output(self,other,"DIA_Jack_BEMYCAPTAIN3_14_06");	//��, ��� �������.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	JACKISCAPTAIN = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_JACK_LOSFAHREN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 59;
	condition = dia_jack_losfahren_condition;
	information = dia_jack_losfahren_info;
	permanent = TRUE;
	description = "�������, ������. ������� ������!";
};


func int dia_jack_losfahren_condition()
{
	if((JACKISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_jack_losfahren_info()
{
	AI_Output(other,self,"DIA_Jack_LOSFAHREN_15_00");	//�������, ������. ������� ������!
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_01");	//��� � ������ �������. � ������ ������ ��� ���� ������� �����.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_02");	//��� ����� �������� ��������. �� � ��� �� �������, ��� �� ��������� ���� ������ � �����������.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_03");	//� ���� ������������� ���� ���, ��� ���� �����? �� �� ������ ������������ ����� ������ ������, ��� �� ���-�� �����.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_04");	//���� �� ������, ��� � ���� ���� ��� �����������, ��� � ����������� ����� � �������� �������. ���� ���� ����� �����������.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_05");	//�������, ��������. � ��� ���� �� ����� ��� ������. ��� �� ������.
		AI_Output(self,other,"DIA_Jack_LOSFAHREN_14_06");	//�������, �� ������ �������������� �������, �� ����� ��� �� 5 �������, �������� ������ �� ������� � ������� ������� �����. � ��������� ������, ������ �� ����.
		AI_StopProcessInfos(self);
	};
};


instance DIA_JACK_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = vlk_444_jack;
	nr = 59;
	condition = dia_jack_perm5_notcaptain_condition;
	information = dia_jack_perm5_notcaptain_info;
	permanent = TRUE;
	description = "� ��� ������?";
};


func int dia_jack_perm5_notcaptain_condition()
{
	if((Npc_KnowsInfo(other,dia_jack_bemycaptain2) && (SCGOTCAPTAIN == TRUE) && (JACKISCAPTAIN == FALSE)) || (MIS_JACK_NEWLIGHTHOUSEOFFICER == LOG_OBSOLETE))
	{
		return TRUE;
	};
};

func void dia_jack_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Jack_PERM5_NOTCAPTAIN_15_00");	//� ��� ������?
	AI_Output(self,other,"DIA_Jack_PERM5_NOTCAPTAIN_14_01");	//� ���������. � ��� �� ����� �������� ����� � �������� ���� ����.
	AI_StopProcessInfos(self);
};


instance DIA_JACK_KAP6_EXIT(C_INFO)
{
	npc = vlk_444_jack;
	nr = 999;
	condition = dia_jack_kap6_exit_condition;
	information = dia_jack_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jack_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_jack_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

