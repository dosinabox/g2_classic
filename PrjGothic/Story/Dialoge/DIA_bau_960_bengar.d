
instance DIA_BENGAR_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_exit_condition;
	information = dia_bengar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bengar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_HALLO(C_INFO)
{
	npc = bau_960_bengar;
	nr = 3;
	condition = dia_bengar_hallo_condition;
	information = dia_bengar_hallo_info;
	description = "�� ������� ������?";
};


func int dia_bengar_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bengar_hallo_info()
{
	AI_Output(other,self,"DIA_Bengar_HALLO_15_00");	//�� ������� ������?
	AI_Output(self,other,"DIA_Bengar_HALLO_10_01");	//����� ������� � ���, ���� �� ����� ����, � ������� ���������.
	AI_Output(self,other,"DIA_Bengar_HALLO_10_02");	//��� ����� ����� ����������� ������ �������� ��������������.
};


instance DIA_BENGAR_WOVONLEBTIHR(C_INFO)
{
	npc = bau_960_bengar;
	nr = 5;
	condition = dia_bengar_wovonlebtihr_condition;
	information = dia_bengar_wovonlebtihr_info;
	description = "��� �� ������������� �� �����?";
};


func int dia_bengar_wovonlebtihr_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_wovonlebtihr_info()
{
	AI_Output(other,self,"DIA_Bengar_WOVONLEBTIHR_15_00");	//��� �� ������������� �� �����?
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_01");	//� �������� ������ � ������ ����. �� �, ������� ��, �� ����� ���������� ���� � �������� � ����.
	AI_Output(self,other,"DIA_Bengar_WOVONLEBTIHR_10_02");	//���� ������� ��� ���� ���� ���������� � ��� ���������� ���-�� �������� ��. ����� ��������� �� ��� ������� ��������, ���������?
};


instance DIA_BENGAR_TAGELOEHNER(C_INFO)
{
	npc = bau_960_bengar;
	nr = 6;
	condition = dia_bengar_tageloehner_condition;
	information = dia_bengar_tageloehner_info;
	description = "�� ��������� �������� �������?";
};


func int dia_bengar_tageloehner_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_wovonlebtihr) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_tageloehner_info()
{
	AI_Output(other,self,"DIA_Bengar_TAGELOEHNER_15_00");	//�� ��������� �������� �������?
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_01");	//���� ��������� ����������, ������� �� ����� �� ��� �����.
	AI_Output(self,other,"DIA_Bengar_TAGELOEHNER_10_02");	//����� �� �������� �� �� ���. � ������ ��, � ��� �������� �� ����.
};


instance DIA_BENGAR_REBELLIEREN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 8;
	condition = dia_bengar_rebellieren_condition;
	information = dia_bengar_rebellieren_info;
	description = "��� �� ������� �� �����?";
};


func int dia_bengar_rebellieren_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_rebellieren_info()
{
	AI_Output(other,self,"DIA_Bengar_REBELLIEREN_15_00");	//��� �� ������� �� �����?
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_01");	//��� ������ �������. ��-�� ���� ��� ���� �������.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_02");	//������� ������ �������� �� ������ � �������� ���, ������ ��������, �������������� �� ���, ��� �� �������.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_03");	//�� � ���� ��� ������. ��������� �������� ���� ������ ����� �������� ������, � �� �����, ����� �������� ��� �����.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_04");	//���� � ���� ��������� ���������� � ������, � �������� ������ ����.
	AI_Output(self,other,"DIA_Bengar_REBELLIEREN_10_05");	//� ���, ���� ���� �� ������ ��������� ��������� ����������, ��� �� ��� �����.
};


instance DIA_BENGAR_PALADINE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 9;
	condition = dia_bengar_paladine_condition;
	information = dia_bengar_paladine_info;
	description = "� ��� �� ������ ������ ����������� �����?";
};


func int dia_bengar_paladine_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_rebellieren) && ((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_bengar_paladine_info()
{
	AI_Output(other,self,"DIA_Bengar_PALADINE_15_00");	//� ��� �� ������ ������ ����������� �����?
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_01");	//��� ��������. � ��� ���, ��� �������� ������� � �����, �� ����� ������� ���������. ������ ��������.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_02");	//������ ��� ������� ��������� ����� ���������� � ��� ���� ����. ��� ������ ���, ��� ������ �����, � �������� ������ �� ������ � ����.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_03");	//������������ ��������, ��� � ������ �����-���� �����, ��� ��� �� ��� ��������� � �������.
	AI_Output(self,other,"DIA_Bengar_PALADINE_10_04");	//��� �� �����������, ���� ���� ��������� ������� ��� ����.
};


instance DIA_BENGAR_PASS(C_INFO)
{
	npc = bau_960_bengar;
	nr = 10;
	condition = dia_bengar_pass_condition;
	information = dia_bengar_pass_info;
	description = "� �������?";
};


func int dia_bengar_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_paladine))
	{
		return TRUE;
	};
};

func void dia_bengar_pass_info()
{
	AI_Output(other,self,"DIA_Bengar_PASS_15_00");	//� �������?
	AI_Output(self,other,"DIA_Bengar_PASS_10_01");	//��. ������ � ������ ������ �������� ��������� � �������� � ������ ����� ����� �����������.
	if(!Npc_IsDead(malak) && (KAPITEL < 3))
	{
		AI_Output(self,other,"DIA_Bengar_PASS_10_02");	//������ ������ � ���. �� ��� ������ ���� ��� � ������.
	};
};


instance DIA_BENGAR_MILIZ(C_INFO)
{
	npc = bau_960_bengar;
	nr = 11;
	condition = dia_bengar_miliz_condition;
	information = dia_bengar_miliz_info;
	permanent = FALSE;
	description = "� ������ ������ ���� �������� � ����������.";
};


func int dia_bengar_miliz_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_miliz_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZ_15_00");	//� ������ ������ ���� �������� � ����������.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_01");	//���?! � ������ �����, ����� �� ������� ����� ���������.
		AI_Output(other,self,"DIA_Bengar_MILIZ_15_02");	//��� ��� ���� �������� ����.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_03");	//����! �� �� ������, ��� ��������� ������� �� ����, ���� � ���� ������ �� ���������?
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_04");	//� �� �����, ��� ����� �� ������.
		AI_Output(self,other,"DIA_Bengar_MILIZ_10_05");	//� ������ �� ���� ����� ��� ���� ���� �����. � �� ��� � ����� ���� �����?!
	};
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_06");	//��� ������� ���������� ���� ������ ������ � �������� ������ � ������ ������.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_07");	//�� ��� ��� ������� ������.
	AI_Output(self,other,"DIA_Bengar_MILIZ_10_08");	//��� ����� ��������� � ����� ������.
};


instance DIA_BENGAR_SELBER(C_INFO)
{
	npc = bau_960_bengar;
	nr = 11;
	condition = dia_bengar_selber_condition;
	information = dia_bengar_selber_info;
	permanent = FALSE;
	description = "������ �� �� ������ ���������� � ���������� ����?";
};


func int dia_bengar_selber_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && (BENGAR_MILSUCCESS == FALSE) && Npc_KnowsInfo(other,dia_bengar_hallo))
	{
		return TRUE;
	};
};

func void dia_bengar_selber_info()
{
	AI_Output(other,self,"DIA_Bengar_Selber_15_00");	//��� ��� ��� �����. ������ �� �� ������ ���������� � ���������� ����?
	AI_Output(self,other,"DIA_Bengar_Selber_10_01");	//��, ��� �����. �� �� �� ������ ������������� ������ ��������� ������ ���������.
};


instance DIA_BENGAR_MILIZKLATSCHEN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 12;
	condition = dia_bengar_milizklatschen_condition;
	information = dia_bengar_milizklatschen_info;
	permanent = FALSE;
	description = "�� � ��� ���� ���������, � ����� ����������� � ����!";
};


func int dia_bengar_milizklatschen_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_miliz) && !Npc_IsDead(rick) && !Npc_IsDead(rumbold) && (RUMBOLD_BEZAHLT == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_milizklatschen_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZKLATSCHEN_15_00");	//�� � ��� ���� ���������, � ����� ����������� � ����!
	AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_01");	//���, ��� ��� ����. ������, � �� ������� ����.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_02");	//������ �� �������!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZKLATSCHEN_10_03");	//����� ����! ������ ��, ��� ���� ������.
	};
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MilComing");
	if(Hlp_IsValidNpc(rick) && !Npc_IsDead(rick))
	{
		Npc_ExchangeRoutine(rick,"MilComing");
		AI_ContinueRoutine(rick);
	};
	if(Hlp_IsValidNpc(rumbold) && !Npc_IsDead(rumbold))
	{
		Npc_ExchangeRoutine(rumbold,"MilComing");
		AI_ContinueRoutine(rumbold);
	};
};


var int bengar_milsuccess;

instance DIA_BENGAR_MILIZWEG(C_INFO)
{
	npc = bau_960_bengar;
	nr = 12;
	condition = dia_bengar_milizweg_condition;
	information = dia_bengar_milizweg_info;
	permanent = TRUE;
	description = "���� �������� � ���������� ��� � �������.";
};


func int dia_bengar_milizweg_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_miliz) && (BENGAR_MILSUCCESS == FALSE))
	{
		if((Npc_IsDead(rick) && Npc_IsDead(rumbold)) || (RUMBOLD_BEZAHLT == TRUE))
		{
			return TRUE;
		};
	};
};

func void dia_bengar_milizweg_info()
{
	AI_Output(other,self,"DIA_Bengar_MILIZWEG_15_00");	//���� �������� � ���������� ��� � �������.
	if((RUMBOLD_BEZAHLT == TRUE) && (Npc_IsDead(rumbold) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_01");	//�� � ��� �����? �� �� ������, ��� ��� ������� �� ����, ����� �� ������?
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_02");	//��� ��� ��� ����� ��� ���. ����� ��, ����� ��� ������� ������!
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_03");	//�������. �����, ���� �� ���� ����� � ���� �� � ������. �������.
		if(RUMBOLD_BEZAHLT == TRUE)
		{
			AI_Output(self,other,"DIA_Bengar_MILIZWEG_10_04");	//�� ���� ����� ��� ��������� �� ����. ��� ����� ���������� � ����� �������.
			b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN + 50);
		}
		else
		{
			b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
		};
		BENGAR_MILSUCCESS = TRUE;
	};
};


instance DIA_BENGAR_BALTHASAR(C_INFO)
{
	npc = bau_960_bengar;
	nr = 13;
	condition = dia_bengar_balthasar_condition;
	information = dia_bengar_balthasar_info;
	description = "������� ���������� ��������� ���������� �� ����� ���������?";
};


func int dia_bengar_balthasar_condition()
{
	if((MIS_BALTHASAR_BENGARSWEIDE == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bengar_wovonlebtihr))
	{
		return TRUE;
	};
};

func void dia_bengar_balthasar_info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASAR_15_00");	//������� ���������� ��������� ���������� �� ����� ���������?
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_01");	//��, ��. ��� ������ �������. � ������ ���, ��� ����� ������ ������� ������, ���� ����� ����� ����� ���� �� ���� ���������.
	AI_Output(self,other,"DIA_Bengar_BALTHASAR_10_02");	//�� ������ ������, ��� ����� ���� ���������. � ������ �� ��� �� �������� ����������.
	b_logentry(TOPIC_BALTHASARSSCHAFE,"����� ������� ������� ��������� ���������� ��������� �� ��� ��������, � ������ ������� ��� ������. � ������, ��� ����� ����������� ����������� �����������.");
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_BALTHASARDARFAUFWEIDE(C_INFO)
{
	npc = bau_960_bengar;
	nr = 14;
	condition = dia_bengar_balthasardarfaufweide_condition;
	information = dia_bengar_balthasardarfaufweide_info;
	description = "��������� ����, � ��������� ����� ����� ������������ ���� ��������.";
};


func int dia_bengar_balthasardarfaufweide_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_balthasar) && (BENGAR_MILSUCCESS == TRUE))
	{
		return TRUE;
	};
};

func void dia_bengar_balthasardarfaufweide_info()
{
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_00");	//��������� ����, � ��������� ����� ����� ������������ ���� ��������.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_01");	//������?
	AI_Output(other,self,"DIA_Bengar_BALTHASARDARFAUFWEIDE_15_02");	//(���������) ������ ��� � ��� ������.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_03");	//���. ������, ��� �������.
	AI_Output(self,other,"DIA_Bengar_BALTHASARDARFAUFWEIDE_10_04");	//������ ����� �� ����� ����� ���� ���-������ �� �����.
	MIS_BALTHASAR_BENGARSWEIDE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BENGAR_PERMKAP1(C_INFO)
{
	npc = bau_960_bengar;
	nr = 15;
	condition = dia_bengar_permkap1_condition;
	information = dia_bengar_permkap1_info;
	permanent = TRUE;
	description = "������ ����.";
};


func int dia_bengar_permkap1_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_balthasardarfaufweide) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_bengar_permkap1_info()
{
	AI_Output(other,self,"DIA_Bengar_PERMKAP1_15_00");	//������ ����.
	AI_Output(self,other,"DIA_Bengar_PERMKAP1_10_01");	//�� ����.
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP3_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap3_exit_condition;
	information = dia_bengar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_bengar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_ALLEIN(C_INFO)
{
	npc = bau_960_bengar;
	nr = 30;
	condition = dia_bengar_allein_condition;
	information = dia_bengar_allein_info;
	description = "��� ����?";
};


func int dia_bengar_allein_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_bengar_allein_info()
{
	AI_Output(other,self,"DIA_Bengar_ALLEIN_15_00");	//��� ����?
	if((MALAK_ISALIVE_KAP3 == TRUE) && ((Npc_GetDistToWP(malak,"FARM3") < 3000) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_01");	//����� ���� �� ���� � ������ � ����� ����, ��� ������� �� ����. �� ������, ��� ������������ � ����.
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_02");	//�� ������ �� ��� ���������� �����.
		MIS_GETMALAKBACK = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_ALLEIN_10_03");	//������� ������� �������. � ���� �� ����, ������� � ��� ����� ������������.
	};
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_04");	//����� ���� �������� ������ ���� �������� ����� ������. ����� ��� ���� ��� ������.
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_05");	//���� �� ������ ���� �������� ���� �� ��������� ���������...
	AI_Output(self,other,"DIA_Bengar_ALLEIN_10_06");	//���� �� ��� ���� ��� ����� �������� �� ����. �� �� ���������, �������. ��� �������, ��� ����� �����.
	MIS_BENGARSHELPINGSLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BENGARALLEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BENGARALLEIN,LOG_RUNNING);
	b_logentry(TOPIC_BENGARALLEIN,"������ ������� ���� �� ����� �����. ����� ���� � ���� � ����� ���� ���������. ������ ������, ��� ��� ����������� � ����.");
	b_logentry(TOPIC_BENGARALLEIN,"������ ��� ����� ��������� ����������. ��� ����� ������. �� ������� ���-�� � ��������, �������� ����� �����. ����� ����, � ���� ����� �����?!");
};


instance DIA_BENGAR_MALAKTOT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 32;
	condition = dia_bengar_malaktot_condition;
	information = dia_bengar_malaktot_info;
	description = "����� �����.";
};


func int dia_bengar_malaktot_condition()
{
	if(Npc_IsDead(malak) && (MALAK_ISALIVE_KAP3 == TRUE))
	{
		return TRUE;
	};
};

func void dia_bengar_malaktot_info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKTOT_15_00");	//����� �����.
	AI_Output(self,other,"DIA_Bengar_MALAKTOT_10_01");	//������ ��� ������ ��� ����.
};


instance DIA_BENGAR_SLDDA(C_INFO)
{
	npc = bau_960_bengar;
	nr = 32;
	condition = dia_bengar_sldda_condition;
	information = dia_bengar_sldda_info;
	description = "� ����� ���� ��������, ��� �� � �����.";
};


func int dia_bengar_sldda_condition()
{
	if((Npc_GetDistToWP(sld_wolf,"FARM3") < 3000) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS) && (Npc_IsDead(sld_wolf) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_sldda_info()
{
	AI_Output(other,self,"DIA_Bengar_SLDDA_15_00");	//� ����� ���� ��������, ��� �� � �����.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_01");	//� ���� ����� ��� ������� �� ���� ����� ����������. �������, �� ������ ������ ���.
	AI_Output(self,other,"DIA_Bengar_SLDDA_10_02");	//���, ������. � �����, ��� ���� ����������.
	CreateInvItems(self,itmi_gold,400);
	b_giveinvitems(self,other,itmi_gold,400);
	b_giveplayerxp(XP_BENGARSHELPINGSLDARRIVED);
};


instance DIA_BENGAR_MALAKWIEDERDA(C_INFO)
{
	npc = bau_960_bengar;
	nr = 35;
	condition = dia_bengar_malakwiederda_condition;
	information = dia_bengar_malakwiederda_info;
	description = "����� ��������.";
};


func int dia_bengar_malakwiederda_condition()
{
	if((Npc_GetDistToWP(malak,"FARM3") < 3000) && ((MIS_GETMALAKBACK == LOG_SUCCESS) || (NPCOBSESSEDBYDMT_MALAK == TRUE)) && (Npc_IsDead(malak) == FALSE))
	{
		return TRUE;
	};
};

func void dia_bengar_malakwiederda_info()
{
	AI_Output(other,self,"DIA_Bengar_MALAKWIEDERDA_15_00");	//����� ��������.
	AI_Output(self,other,"DIA_Bengar_MALAKWIEDERDA_10_01");	//����� ������. � � �� ������, ��� ������ ������� �� ����� ���.
	b_giveplayerxp(XP_GETMALAKBACK);
};


instance DIA_BENGAR_PERM(C_INFO)
{
	npc = bau_960_bengar;
	nr = 80;
	condition = dia_bengar_perm_condition;
	information = dia_bengar_perm_info;
	permanent = TRUE;
	description = "��� ����� ������.";
};


func int dia_bengar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_bengar_allein) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_bengar_perm_info()
{
	AI_Output(other,self,"DIA_Bengar_PERM_15_00");	//��� ����� � �������.
	if((Npc_GetDistToWP(malak,"FARM3") < 3000) && (Npc_IsDead(malak) == FALSE))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_01");	//����� ����� �����, �� �������� ����� �� ����������.
		AI_Output(self,other,"DIA_Bengar_PERM_10_02");	//���� ������ �� ���������� ����, ���� ��� ����� �������� �����.
	}
	else if(Npc_KnowsInfo(other,dia_bengar_sldda) && (Npc_IsDead(sld_wolf) == FALSE) && (Npc_GetDistToWP(sld_wolf,"FARM3") < 3000))
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_03");	//����� �������� ������, �� � �������, �� ��� �� ������ ������ ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Bengar_PERM_10_04");	//��� ������ ���� ����� ����� ������ �����. ���� ������ �� ����������� � ��������� �����, �����, ��� �������� ������� ��.
		if((MALAK_ISALIVE_KAP3 == TRUE) && (Npc_IsDead(malak) == FALSE))
		{
			AI_Output(self,other,"DIA_Bengar_PERM_10_05");	//�������, �� ����� ��������.
		};
	};
	AI_StopProcessInfos(self);
	if(Npc_IsDead(sld_wolf) && (MIS_BENGARSHELPINGSLD == LOG_SUCCESS))
	{
		b_startotherroutine(sld_815_soeldner,"Start");
		b_startotherroutine(sld_817_soeldner,"Start");
	};
};


instance DIA_BENGAR_KAP4_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap4_exit_condition;
	information = dia_bengar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_bengar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP5_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap5_exit_condition;
	information = dia_bengar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_bengar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_KAP6_EXIT(C_INFO)
{
	npc = bau_960_bengar;
	nr = 999;
	condition = dia_bengar_kap6_exit_condition;
	information = dia_bengar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bengar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_bengar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENGAR_PICKPOCKET(C_INFO)
{
	npc = bau_960_bengar;
	nr = 900;
	condition = dia_bengar_pickpocket_condition;
	information = dia_bengar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bengar_pickpocket_condition()
{
	return c_beklauen(28,50);
};

func void dia_bengar_pickpocket_info()
{
	Info_ClearChoices(dia_bengar_pickpocket);
	Info_AddChoice(dia_bengar_pickpocket,DIALOG_BACK,dia_bengar_pickpocket_back);
	Info_AddChoice(dia_bengar_pickpocket,DIALOG_PICKPOCKET,dia_bengar_pickpocket_doit);
};

func void dia_bengar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bengar_pickpocket);
};

func void dia_bengar_pickpocket_back()
{
	Info_ClearChoices(dia_bengar_pickpocket);
};

