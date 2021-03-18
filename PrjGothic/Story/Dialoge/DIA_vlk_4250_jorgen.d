
instance DIA_JORGEN_KAP3_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap3_exit_condition;
	information = dia_jorgen_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_PICKPOCKET(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 900;
	condition = dia_jorgen_pickpocket_condition;
	information = dia_jorgen_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jorgen_pickpocket_condition()
{
	return c_beklauen(59,70);
};

func void dia_jorgen_pickpocket_info()
{
	Info_ClearChoices(dia_jorgen_pickpocket);
	Info_AddChoice(dia_jorgen_pickpocket,DIALOG_BACK,dia_jorgen_pickpocket_back);
	Info_AddChoice(dia_jorgen_pickpocket,DIALOG_PICKPOCKET,dia_jorgen_pickpocket_doit);
};

func void dia_jorgen_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jorgen_pickpocket);
};

func void dia_jorgen_pickpocket_back()
{
	Info_ClearChoices(dia_jorgen_pickpocket);
};


instance DIA_JORGEN_HALLO(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 4;
	condition = dia_jorgen_hallo_condition;
	information = dia_jorgen_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jorgen_hallo_condition()
{
	if((KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_hallo_info()
{
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_00");	//��, ��!
	if((hero.guild == GIL_NOV) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_01");	//� ����, �� �� ��������� �����.
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_02");	//��, � ���?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_03");	//��� �� ����� ��� ���� �������� ���?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_04");	//��, �� �����-������ ��� � ���������?
		AI_Output(other,self,"DIA_Jorgen_Hallo_15_05");	//����� ����, � ���?
		AI_Output(self,other,"DIA_Jorgen_Hallo_07_06");	//��� ��� ��� �������� �����?
	};
	AI_Output(self,other,"DIA_Jorgen_Hallo_07_07");	//� ������ �� ����, ���� ��� ����.
};


instance DIA_JORGEN_NOVICE(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 6;
	condition = dia_jorgen_novice_condition;
	information = dia_jorgen_novice_info;
	permanent = FALSE;
	description = "���� ���� �� �������� ���������?";
};


func int dia_jorgen_novice_condition()
{
	if((MIS_NOVIZENCHASE == LOG_RUNNING) && (KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_novice_info()
{
	AI_Output(other,self,"DIA_Jorgen_Novice_15_00");	//���� ���� �� �������� ���������?
	AI_Output(self,other,"DIA_Jorgen_Novice_07_01");	//��, �������, �� ������� ����.
	AI_PointAt(self,"NW_TROLLAREA_NOVCHASE_01");
	AI_Output(self,other,"DIA_Jorgen_Novice_07_02");	//�� ������� � ���� � ����� � ������ ���, ��� ����� �� ��� ������� �����.
	AI_StopPointAt(self);
};


instance DIA_JORGEN_MILTEN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 5;
	condition = dia_jorgen_milten_condition;
	information = dia_jorgen_milten_info;
	permanent = FALSE;
	description = "���� �� ����� � ���������, ���� ����� ���������� � ��������.";
};


func int dia_jorgen_milten_condition()
{
	if((KAPITEL == 3) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE) && (MIS_OLDWORLD == LOG_SUCCESS) && (miltennw.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_jorgen_milten_info()
{
	AI_Output(other,self,"DIA_Jorgen_Milten_15_00");	//���� �� ����� � ���������, ���� ����� ���������� � ��������. ��, ���������, ������ ������ ����.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_01");	//��� �� �������, ���� ������ ����?
	AI_Output(other,self,"DIA_Jorgen_Milten_15_02");	//��������. �� ��� ������-�� ������ ����������� ���� � ���� ����������.
	AI_Output(self,other,"DIA_Jorgen_Milten_07_03");	//������ ����� ������ - ���� ��� ����. ��� ������ ����� ����� ���, � �� ��� ����� �������� ����������� ���� � ��������.
};


instance DIA_JORGEN_HOME(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 7;
	condition = dia_jorgen_home_condition;
	information = dia_jorgen_home_info;
	description = "������ ��?";
};


func int dia_jorgen_home_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_jorgen_home_info()
{
	AI_Output(other,self,"DIA_Jorgen_Home_15_00");	//������ ��?
	AI_Output(self,other,"DIA_Jorgen_Home_07_01");	//� ��� ��������� �������� ����������� �����, ������. ��� ��� - ����.
	AI_Output(self,other,"DIA_Jorgen_Home_07_02");	//��� �������, '���������', ��� �������� �������� ��������� ������� �����, � ��� ������ � �� ���� �����.
	AI_Output(self,other,"DIA_Jorgen_Home_07_03");	//� ����� ����� �������� ����� ����� � ����, �� � ��� ��� ��� � ������ ����, �� ����� ����� �� ����� � ���� ��������� ����.
	AI_Output(self,other,"DIA_Jorgen_Home_07_04");	//������������ �������, ����������������� � ��������, - ��� ������� ������� ������ ������, � ��� ������ �� �����.
	AI_Output(self,other,"DIA_Jorgen_Home_07_05");	//� ��� ��� ������ ������? � ������ ��� ���� ��� ������. � �������� ��� ���.
};


instance DIA_JORGEN_BECAREFULL(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 8;
	condition = dia_jorgen_becarefull_condition;
	information = dia_jorgen_becarefull_info;
	permanent = TRUE;
	description = "���� ����� ��������� �������� �� �����.";
};


func int dia_jorgen_becarefull_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_jorgen_home))
	{
		return TRUE;
	};
};

func void dia_jorgen_becarefull_info()
{
	AI_Output(other,self,"DIA_Jorgen_BeCarefull_15_00");	//���� ����� ��������� �������� �� �����.
	AI_Output(self,other,"DIA_Jorgen_BeCarefull_07_01");	//�� ��������. � ��� �������, ��� ������� ����� ����� ��������� �������� ��������� ���� ����.
};


instance DIA_JORGEN_KAP4_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap4_exit_condition;
	information = dia_jorgen_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_NEUHIER(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 41;
	condition = dia_jorgen_neuhier_condition;
	information = dia_jorgen_neuhier_info;
	description = "��� ����� � ���������?";
};


func int dia_jorgen_neuhier_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_jorgen_neuhier_info()
{
	AI_Output(other,self,"DIA_Jorgen_NEUHIER_15_00");	//��� ����� � ���������?
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_01");	//� ����� ����� � ���!
	if(Npc_KnowsInfo(other,dia_jorgen_milten))
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_02");	//�� ��� ��, ������� �� �����. ������ ������������� ����� ��� �������� ����� �����.
		b_giveplayerxp(XP_AMBIENT);
	};
	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_03");	//� �������� ���� ������� ����� ���� ������ �������� ������������.
	};
	AI_Output(self,other,"DIA_Jorgen_NEUHIER_07_04");	//��. � ��� ��� ��� ������? ��� �������� � ������ � ������, ����� �� ��������� ������, ������� ���� ��� ����������.
};


instance DIA_JORGEN_PERM4(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 400;
	condition = dia_jorgen_perm4_condition;
	information = dia_jorgen_perm4_info;
	permanent = TRUE;
	description = "� ����, ��� � ���� ��� ����� � �������.";
};


func int dia_jorgen_perm4_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_jorgen_home) && Npc_KnowsInfo(other,dia_jorgen_neuhier) && (JORGENISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};


var int dia_jorgen_perm4_onetime;

func void dia_jorgen_perm4_info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM4_15_00");	//� ����, ��� � ���� ��� ����� � �������.
	if((DIA_JORGEN_PERM4_ONETIME == FALSE) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Jorgen_PERM4_07_01");	//������ ���������: � ������ ����������� �� ������. ���� ��� ����� ������������ � ������, � ����� � ���.
		DIA_JORGEN_PERM4_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_PERM4_07_02");	//� ��� ���� ����� ������������� ������ ��� ����� ������.
};


instance DIA_JORGEN_KAP5_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap5_exit_condition;
	information = dia_jorgen_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JORGEN_BEMYCAPTAIN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 51;
	condition = dia_jorgen_bemycaptain_condition;
	information = dia_jorgen_bemycaptain_info;
	permanent = TRUE;
	description = "����� ����, � ����� ���������� ���� ������ ��������.";
};


func int dia_jorgen_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MIS_PYROKARCLEARDEMONTOWER != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jorgen_home))
	{
		return TRUE;
	};
};


var int dia_jorgen_bemycaptain_onetime;

func void dia_jorgen_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN_15_00");	//����� ����, � ����� ���������� ���� ������ ��������.
	if(DIA_JORGEN_BEMYCAPTAIN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_01");	//�� �� ����������� ���� ����, ������? ���� �� �������, ��� ��� ������, � ������ �����.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_02");	//���... ���� ������ ���� ��������� ��������. � ���� �������� �������� �����������.
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_03");	//��� ���� �� ����� � ��� �� ������, ����� ������. � �� �����, ��� ������� ��� �������� ��� ��� ��� ������ ����.
		DIA_JORGEN_BEMYCAPTAIN_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN_07_04");	//������� ��� ����� ���������� ��� ���� ����� ���������. ������.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"������ ����� ����� ���� ���������, �� � ������� ������ �������� ��� ���� ����� ����������.");
};


instance DIA_JORGEN_BEMYCAPTAIN2(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 52;
	condition = dia_jorgen_bemycaptain2_condition;
	information = dia_jorgen_bemycaptain2_info;
	description = "� ����������� � ������ �������.";
};


func int dia_jorgen_bemycaptain2_condition()
{
	if(MIS_PYROKARCLEARDEMONTOWER == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jorgen_bemycaptain2_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_00");	//� ����������� � ������ �������. �� ��������.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_01");	//������? ��� ���� ������� ���?
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN2_15_02");	//���� ����� �� �����.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_03");	//��, �����. ���� ���, �������������, �� ����� �������. ������ ��������������!
	if(SCGOTCAPTAIN == FALSE)
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_04");	//��� ������ ������ ������ �����������? � ���� ��� ���� ����� ��� ����?
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN2_07_05");	//�������. ������ � ���� �������� ������!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_JORGEN_BEMYCAPTAIN3(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 53;
	condition = dia_jorgen_bemycaptain3_condition;
	information = dia_jorgen_bemycaptain3_info;
	description = "���� ���� ���������.";
};


func int dia_jorgen_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_bemycaptain2) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_00");	//���� ���� ���������.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_01");	//��� ������� ����� ��� ����, �� � ���� ���� ������� � �������?
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_02");	//������ ��������, ��� ����� �� ������� ���� ���� �������.
	AI_Output(other,self,"DIA_Jorgen_BEMYCAPTAIN3_15_03");	//������. � ��������, ��� ����� �������. ��� ���� � ������.
	AI_Output(self,other,"DIA_Jorgen_BEMYCAPTAIN3_07_04");	//����, ���.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	JORGENISCAPTAIN = TRUE;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_JORGEN_LOSFAHREN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 59;
	condition = dia_jorgen_losfahren_condition;
	information = dia_jorgen_losfahren_info;
	permanent = TRUE;
	description = "�� ����� ��������� ���� �� ������?";
};


func int dia_jorgen_losfahren_condition()
{
	if((JORGENISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_jorgen_losfahren_info()
{
	AI_Output(other,self,"DIA_Jorgen_LOSFAHREN_15_00");	//�� ����� ��������� ���� �� ������?
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_01");	//�������. ��� ��� �����.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_02");	//�������. ������� ������! �� ����������!
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_03");	//���� ����� ������� ��������� ���� ����������. ����� �� ������ � ����, ���� ����� ��� �� �����.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_04");	//� ����� �� ��������� � ������, �� ������ �������. � ����������� ����� ��� ���� ������������ �������. ��������� ����.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_05");	//���� ����� �������, ������� �� ���� ������� � ������� �����, ����� � ��� ��������������� �� ���.
		AI_Output(self,other,"DIA_Jorgen_LOSFAHREN_07_06");	//�� �� ������ ������� ������, ���� � ��� �� ����� ����� ������������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_JORGEN_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 59;
	condition = dia_jorgen_perm5_notcaptain_condition;
	information = dia_jorgen_perm5_notcaptain_info;
	permanent = TRUE;
	description = "��� ��?";
};


func int dia_jorgen_perm5_notcaptain_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_bemycaptain2) && (SCGOTCAPTAIN == TRUE) && (JORGENISCAPTAIN == FALSE))
	{
		return TRUE;
	};
};


var int dia_jorgen_perm5_notcaptain_xpgiven;

func void dia_jorgen_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Jorgen_PERM5_NOTCAPTAIN_15_00");	//��� ��?
	if(Npc_GetDistToWP(self,"NW_BIGFARM_KITCHEN_OUT_06") < 1000)
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_01");	//�������. ��� �� ����� ������ �����.
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_02");	//��� ���� ��� ��������� ���������, ���� ����� ����, �� ��� �� ���� ����� ������ �� ����� ������������ � �����, ��� � ���������.
		if(DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_JORGEN_PERM5_NOTCAPTAIN_XPGIVEN = TRUE;
		};
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Jorgen_PERM5_NOTCAPTAIN_07_03");	//��� ����� �������� ��� ���� ������ �����. ���������, ���� ��� ���� ������� �������� ������.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"RausAusKloster");
	};
};


instance DIA_JORGEN_KAP6_EXIT(C_INFO)
{
	npc = vlk_4250_jorgen;
	nr = 999;
	condition = dia_jorgen_kap6_exit_condition;
	information = dia_jorgen_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jorgen_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_jorgen_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

