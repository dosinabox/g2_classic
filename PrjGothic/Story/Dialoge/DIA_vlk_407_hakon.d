
instance DIA_HAKON_EXIT(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 999;
	condition = dia_hakon_exit_condition;
	information = dia_hakon_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hakon_exit_condition()
{
	return TRUE;
};

func void dia_hakon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_SPERRE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_sperre_condition;
	information = dia_hakon_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hakon_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hakon_sperre_info()
{
	AI_Output(self,other,"DIA_Hakon_Sperre_12_00");	//����������, ���������! ������ ��������� ���, ����� �� ������� �������!
	AI_StopProcessInfos(self);
};


instance DIA_HAKON_HALLO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_hallo_condition;
	information = dia_hakon_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_hakon_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hakon_hallo_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_00");	//� �����, �������� �������.
	AI_Output(self,other,"DIA_Hakon_Add_12_01");	//� ���� ��� ������ ������ ������ ������. ��������, ����� �������� �� ��������� �����.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"����� ������� ������� �� �������� �������.");
};


instance DIA_HAKON_TRADE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 99;
	condition = dia_hakon_trade_condition;
	information = dia_hakon_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "������ ��� ���� ������.";
};


func int dia_hakon_trade_condition()
{
	return TRUE;
};

func void dia_hakon_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Hakon_Trade_15_00");	//������ ��� ���� ������.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Hakon_Trade_12_01");	//��� ���� ������� �����, ��� ������������� ������ ������ ������� ������� � ���� �������.
	};
};


instance DIA_HAKON_OUTOFTOWN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_outoftown_condition;
	information = dia_hakon_outoftown_info;
	permanent = FALSE;
	description = "�������� ��� ��������� � ��������� ������ ������.";
};


func int dia_hakon_outoftown_condition()
{
	return TRUE;
};

func void dia_hakon_outoftown_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_02");	//�������� ��� ��������� � ��������� ������ ������.
	AI_Output(self,other,"DIA_Hakon_Add_12_03");	//������ ��� ����� ����� ������
	AI_Output(self,other,"DIA_Hakon_Add_12_04");	//��-�� ��������, � ����� �������, � ��-�� ��������� ����� ������ � ������.
	AI_Output(self,other,"DIA_Hakon_Add_12_05");	//���� ������, ������, ������ ���� � ��� ������� �������.
	AI_Output(self,other,"DIA_Hakon_Add_12_06");	//��� ����� ��������� ������ ������ � ������, ���� ������ �� ����.
};


instance DIA_HAKON_PALADINE(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_paladine_condition;
	information = dia_hakon_paladine_info;
	permanent = FALSE;
	description = "�� ������ ���-������ � ���������?";
};


func int dia_hakon_paladine_condition()
{
	return TRUE;
};

func void dia_hakon_paladine_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_07");	//�� ������ ���-������ � ���������?
	AI_Output(self,other,"DIA_Hakon_Add_12_08");	//��! ��� �������� ����!
	AI_Output(self,other,"DIA_Hakon_Add_12_09");	//������ ���, ��� ����� ������ � ���� ������ - ��� �������� ���, � �� � ������ ������.
	AI_Output(self,other,"DIA_Hakon_Add_12_10");	//��� ������� ���� ���, ��� ������� ���� � ���������.
	AI_Output(self,other,"DIA_Hakon_Add_12_11");	//(� ���������) � ������, ������ � ���� ��������� ���� � ����� - ��!
};


instance DIA_HAKON_WOWAFFEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_wowaffen_condition;
	information = dia_hakon_wowaffen_info;
	permanent = FALSE;
	description = "��� �� ������ ������?";
};


func int dia_hakon_wowaffen_condition()
{
	if(Npc_KnowsInfo(other,dia_hakon_paladine))
	{
		return TRUE;
	};
};

func void dia_hakon_wowaffen_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_12");	//��� �� ������ ������?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_13");	//�����! ������ ���� ����������� ��� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_14");	//������ ���� ����������� ��� ������ �����.
	};
	AI_Output(self,other,"DIA_Hakon_Add_12_15");	//� ������ ���, ��� �� ������, �������� ��������.
	AI_Output(self,other,"DIA_Hakon_Add_12_16");	//�� �������� �� ���� ������ ���� � ����� ��� ��������, ��� �����-���� ������. �� ������, ��� ��� ��� ����.
	AI_Output(self,other,"DIA_Hakon_Add_12_17");	//���, ��� � ���� ���������� ���� ������ - ��� ������� ...
};


instance DIA_HAKON_HARADBANDITS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_haradbandits_condition;
	information = dia_hakon_haradbandits_info;
	permanent = FALSE;
	description = "����� ��������� ��� � ��������� ��������...";
};


func int dia_hakon_haradbandits_condition()
{
	if(HARAD_HAKONMISSION == TRUE)
	{
		return TRUE;
	};
};

func void dia_hakon_haradbandits_info()
{
	AI_Output(other,self,"DIA_Hakon_Add_15_18");	//����� ��������� ��� � ��������� ��������...
	AI_Output(self,other,"DIA_Hakon_Add_12_19");	//��? �?
	AI_Output(other,self,"DIA_Hakon_Add_15_20");	//�� ����������� �� ���� ��� ����������� � �������, ���� � �������� ���� ��������.
	AI_Output(self,other,"DIA_Hakon_Add_12_21");	//(�������) ������ ������ �����. ��������, �� ��� ����� ������� ��� '������', �� ��, ��� �� ����� ������ ������ ������ ��� ����.
};


instance DIA_HAKON_BANDITEN(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_banditen_condition;
	information = dia_hakon_banditen_info;
	permanent = FALSE;
	description = "��� �� ������ �� ���� ��������?";
};


func int dia_hakon_banditen_condition()
{
	if(Npc_KnowsInfo(hero,dia_hakon_haradbandits) || Npc_KnowsInfo(hero,dia_hakon_outoftown))
	{
		return TRUE;
	};
};

func void dia_hakon_banditen_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_15_00");	//��� �� ������ �� ���� ��������?
	AI_Output(self,other,"DIA_Hakon_Banditen_12_01");	//��� � ���� � ���? ��� �������� ���� �� ���� � �����!
	AI_Output(self,other,"DIA_Hakon_Banditen_12_02");	//� �� ������ ����. ��� ����� ��� ����� ������������.
	AI_Output(self,other,"DIA_Hakon_Banditen_12_03");	//��������� �������� ��������� ��, �� ����������.
	MIS_HAKONBANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HAKONBANDITEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HAKONBANDITEN,LOG_RUNNING);
	b_logentry(TOPIC_HAKONBANDITEN,"�����, �������� �������, ��� �������� ��������� ���������� �� ������.");
};


instance DIA_HAKON_WIEVIEL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 6;
	condition = dia_hakon_wieviel_condition;
	information = dia_hakon_wieviel_info;
	permanent = FALSE;
	description = "� ��������� � ����...";
};


func int dia_hakon_wieviel_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wieviel_info()
{
	AI_Output(other,self,"DIA_Hakon_Banditen_Ehre_15_00");	//� ��������� � ����...
	AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_01");	//���, �� ������ ������������ � ���������? � ��������? ��, �������� ������� ����?
	AI_Output(other,self,"DIA_Hakon_Banditen_Kohle_15_00");	//������� �� ����� ���� �� ���?
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_25");	//(������) �� ���� ������ ���� �� ������� ����� � ������, ��?
		AI_Output(self,other,"DIA_Hakon_Add_12_26");	//� �� �����, ��� ������ ������� ���� �� ��� ...
	}
	else
	{
		AI_Output(self,other,"DIA_Hakon_Banditen_Ehre_12_01");	//�� ��� ������� ����.
		AI_Output(self,other,"DIA_Hakon_Banditen_Kohle_12_02");	//�����, ��� ��� ���� �����. � ������� ���� 100 �������, ���� �� ���������� ���� ��������.
		MIS_HAKONBANDITSPAY = TRUE;
	};
	Info_ClearChoices(dia_hakon_banditen);
};


instance DIA_HAKON_MILIZ(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 4;
	condition = dia_hakon_miliz_condition;
	information = dia_hakon_miliz_info;
	permanent = FALSE;
	description = "�� �� ������, ��� � ��������� ��������� �� �������?";
};


func int dia_hakon_miliz_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_miliz_info()
{
	AI_Output(other,self,"DIA_Hakon_Miliz_15_00");	//�� �� ������, ��� � ��������� ��������� �� �������?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_01");	//������ �� ����� �����. ��, � ��� ��������� ������ ������ �� ������ ���� ��������. �� ��� �� ����� ��.
	AI_Output(other,self,"DIA_Hakon_Miliz_15_02");	//�� ������, ��� ��� ����� �����?
	AI_Output(self,other,"DIA_Hakon_Miliz_12_03");	//�� ����������� �����. �� ������� ��� ���� �� �������� �������, ���� � ������ ����� ������.
	b_logentry(TOPIC_HAKONBANDITEN,"�����, ��������� ��������, ��������� ����������� �������� ��������.");
};


instance DIA_HAKON_WO(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_wo_condition;
	information = dia_hakon_wo_info;
	permanent = FALSE;
	description = "��� ��� ������ �� ����?";
};


func int dia_hakon_wo_condition()
{
	if(MIS_HAKONBANDITS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hakon_wo_info()
{
	AI_Output(other,self,"DIA_Hakon_Wo_15_00");	//��� ��� ������ �� ����?
	AI_Output(self,other,"DIA_Hakon_Wo_12_01");	//����� ����� �����. ������� �� ��� ���� ��������� ����� � ��� �� ������ �������.
	AI_Output(self,other,"DIA_Hakon_Wo_12_02");	//������ �� ������� �������� ��������. ��� ������� ������ ������. �������, � ��� ��� ������ ���-�� � ����.
};


instance DIA_HAKON_SUCCESS(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 2;
	condition = dia_hakon_success_condition;
	information = dia_hakon_success_info;
	permanent = FALSE;
	description = "� ����������� � ���������.";
};


func int dia_hakon_success_condition()
{
	if((MIS_HAKONBANDITS == LOG_RUNNING) && Npc_IsDead(bandit_1) && Npc_IsDead(bandit_2) && Npc_IsDead(bandit_3))
	{
		return TRUE;
	};
};

func void dia_hakon_success_info()
{
	AI_Output(other,self,"DIA_Hakon_Success_15_00");	//� ����������� � ���������.
	AI_Output(self,other,"DIA_Hakon_Add_12_27");	//������? ���-������ ����� ����������� ���. � ���� ���� ��������������?
	AI_Output(other,self,"DIA_Hakon_Add_15_28");	//(��������) ��� ���, ��������� ����� � �������� �� ������?
	AI_Output(self,other,"DIA_Hakon_Add_12_29");	//(��������) ��� - � �� �����, ��� ��� ����������. � ���� ����.
	AI_Output(self,other,"DIA_Hakon_Success_12_01");	//�� ������ ����� ������� ������ ���� ��������� � ������.
	if(Npc_KnowsInfo(other,dia_hakon_haradbandits))
	{
		AI_Output(self,other,"DIA_Hakon_Add_12_30");	//����� ����� ������� - � �������.
	};
	if(MIS_HAKONBANDITSPAY == TRUE)
	{
		AI_Output(self,other,"DIA_Hakon_Success_12_02");	//��� ������, ��� � � ������.
		b_giveinvitems(self,other,itmi_gold,100);
	};
	MIS_HAKONBANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_HAKON_BANDITS);
};


instance DIA_HAKON_MINENANTEIL(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 3;
	condition = dia_hakon_minenanteil_condition;
	information = dia_hakon_minenanteil_info;
	permanent = FALSE;
	description = "��� �� ���� ��� �����, ��� �� �������� �����?";
};


func int dia_hakon_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_hakon_minenanteil_info()
{
	AI_Output(other,self,"DIA_Hakon_Minenanteil_15_00");	//��� �� ���� ��� �����, ��� �� �������� �����?
	AI_Output(self,other,"DIA_Hakon_Minenanteil_12_01");	//������, �� � �� ���� ������� ���� �����. ��� ������� ������ ��� ����.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_HAKON_PICKPOCKET(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 900;
	condition = dia_hakon_pickpocket_condition;
	information = dia_hakon_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_hakon_pickpocket_condition()
{
	return c_beklauen(45,65);
};

func void dia_hakon_pickpocket_info()
{
	Info_ClearChoices(dia_hakon_pickpocket);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_BACK,dia_hakon_pickpocket_back);
	Info_AddChoice(dia_hakon_pickpocket,DIALOG_PICKPOCKET,dia_hakon_pickpocket_doit);
};

func void dia_hakon_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hakon_pickpocket);
};

func void dia_hakon_pickpocket_back()
{
	Info_ClearChoices(dia_hakon_pickpocket);
};


instance DIA_HAKON_KAPITEL2(C_INFO)
{
	npc = vlk_407_hakon;
	nr = 5;
	condition = dia_hakon_kapitel2_condition;
	information = dia_hakon_kapitel2_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hakon_kapitel2_condition()
{
	if((KAPITEL >= 2) && (CANTHAR_SPERRE == FALSE) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_hakon_kapitel2_info()
{
	AI_Output(self,other,"DIA_Hakon_Add_12_22");	//����� ��!
	AI_Output(self,other,"DIA_Hakon_Add_12_23");	//�����, �������, �������� ��� ���� ������� ������ ��� ���������.
	AI_Output(self,other,"DIA_Hakon_Add_12_24");	//��� ��������, ��� � ������ ���� ���������� ����� ������. ���� ��� ���������?
};

