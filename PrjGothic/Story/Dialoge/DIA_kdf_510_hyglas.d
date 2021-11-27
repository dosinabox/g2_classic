
instance DIA_HYGLAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap1_exit_condition;
	information = dia_hyglas_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_FEUER(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_feuer_condition;
	information = dia_hyglas_feuer_info;
	permanent = FALSE;
	description = "��� ���������� ������ ��������� �����.";
};


func int dia_hyglas_feuer_condition()
{
	if((other.guild == GIL_NOV) && (KNOWS_FIRE_CONTEST == TRUE) && (Npc_KnowsInfo(other,dia_pyrokar_fire) == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_feuer_info()
{
	AI_Output(other,self,"DIA_Hyglas_Feuer_15_00");	//��� ���������� ������ ��������� �����.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_01");	//��������� ����� - ��� ����� �� ������� ������, � �� ����������� ��� �����.
	AI_Output(self,other,"DIA_Hyglas_Feuer_14_02");	//��, ���� �� ��������, ����� ������. ���� � �� ����� �� ����.
};


instance DIA_HYGLAS_HALLO(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_hallo_condition;
	information = dia_hyglas_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hyglas_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_hyglas_hallo_info()
{
	AI_Output(self,other,"DIA_Hyglas_Hallo_14_00");	//� ������ ������, ����� ���� � ��������� ������.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_01");	//����, ������ ������ ��� ���� ���������� ������� ��������� �����.
		AI_Output(self,other,"DIA_Hyglas_Hallo_14_02");	//����� ���� �� � ������. ����� ����, �� ������� ����������� � ���� ��������.
	};
};


instance DIA_HYGLAS_JOB(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_job_condition;
	information = dia_hyglas_job_info;
	permanent = FALSE;
	description = "��� �� ��������, ������?";
};


func int dia_hyglas_job_condition()
{
	return TRUE;
};

func void dia_hyglas_job_info()
{
	AI_Output(other,self,"DIA_Hyglas_JOB_15_00");	//��� �� ��������, ������?
	AI_Output(self,other,"DIA_Hyglas_JOB_14_01");	//� �������� ���� �������� ���� - ���� ������.
	AI_Output(self,other,"DIA_Hyglas_JOB_14_02");	//��� ��� ���, � � �� �� �����, ������� ������ - � ������ ����, ���������� ������� ��� ����.
	if(other.guild == GIL_NOV)
	{
		AI_Output(other,self,"DIA_Hyglas_JOB_15_03");	//��� ��� ���������! � �� ��� �� �� ������� � ���� �����?
		AI_Output(self,other,"DIA_Hyglas_JOB_14_04");	//����� ������ �����. � ������ ��� ������, ����� ����, ���� �������, ��� ������������ ���� �����.
	};
};


instance DIA_HYGLAS_CONTEST(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_contest_condition;
	information = dia_hyglas_contest_info;
	permanent = FALSE;
	description = "� ���������� ����������� ��������� �����.";
};


func int dia_hyglas_contest_condition()
{
	if(MIS_RUNE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_hyglas_contest_info()
{
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_00");	//� ������ ������ ��������� �����. ������ ��� ��� ������� ������� ���� �������� ������.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_01");	//� �� ������, ����� � ������ ���� �����?
	AI_Output(other,self,"DIA_Hyglas_CONTEST_15_02");	//� �� ���� ������� ������� ��������� ��� �������.
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_03");	//���...
	AI_Output(self,other,"DIA_Hyglas_CONTEST_14_04");	//������, � ����� ����. �� �������, �� ������ ����� ��� ����������� �����������.
	b_logentry(TOPIC_RUNE,"������ ����� ������� ���� ��������� ���� �������� ������, ���� � ������� ��� ��� ����������� �����������.");
};


instance DIA_HYGLAS_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_firebolt_condition;
	information = dia_hyglas_firebolt_info;
	permanent = FALSE;
	description = "����� ����������� ����� ��� �������� ���� �������� ������?";
};


func int dia_hyglas_firebolt_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_contest) && (MIS_RUNE == LOG_RUNNING) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_firebolt_info()
{
	AI_Output(other,self,"DIA_Hyglas_FIREBOLT_15_00");	//����� ����������� ����� ��� �������� ���� �������� ������?
	AI_Output(self,other,"DIA_Hyglas_FIREBOLT_14_01");	//������ �� ���� - �� ������� ��� ���������� �����, � ������.
};


instance DIA_HYGLAS_TALENT_FIREBOLT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 990;
	condition = dia_hyglas_talent_firebolt_condition;
	information = dia_hyglas_talent_firebolt_info;
	permanent = TRUE;
	description = "����� ���� ��������� ���� �������� ������.";
};


func int dia_hyglas_talent_firebolt_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_contest) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE) && (Npc_HasItems(other,itmi_runeblank) >= 1) && (Npc_HasItems(other,itsc_firebolt) >= 1) && (Npc_HasItems(other,itmi_sulfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hyglas_talent_firebolt_info()
{
	AI_Output(other,self,"DIA_Hyglas_TALENT_FIREBOLT_15_00");	//����� ���� ��������� ���� �������� ������.
	if(b_teachplayertalentrunes(self,other,SPL_FIREBOLT))
	{
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_01");	//����� ������� ���� �������� ������, �� ������ ���������� �� ������ ����� ���� � ������ ������.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_02");	//���� ������ �������� ������ ��������� � ��� ����, � �� ������� ����������� ������ ������.
		AI_Output(self,other,"DIA_Hyglas_TALENT_FIREBOLT_14_03");	//����� � ���� ����� ��� �����������, ������� � ������� ����� � ������ ���� ����.
	};
};


instance DIA_HYGLAS_BLANK_RUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 9;
	condition = dia_hyglas_blank_rune_condition;
	information = dia_hyglas_blank_rune_info;
	permanent = FALSE;
	description = "��� � ���� ����� ������ ������?";
};


func int dia_hyglas_blank_rune_condition()
{
	if(Npc_KnowsInfo(hero,dia_hyglas_firebolt) && (MIS_RUNE == LOG_RUNNING) && (Npc_HasItems(other,itmi_runeblank) < 1) && (PLAYER_TALENT_RUNES[SPL_FIREBOLT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_hyglas_blank_rune_info()
{
	AI_Output(other,self,"DIA_Hyglas_BLANK_RUNE_15_00");	//��� � ���� ����� ������ ������?
	AI_Output(self,other,"DIA_Hyglas_BLANK_RUNE_14_01");	//��������, ���� ���� ���������� ������ ��������� ����� - �� ���. ������ ������ � ��� ���������.
};


instance DIA_HYGLAS_GOTRUNE(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 2;
	condition = dia_hyglas_gotrune_condition;
	information = dia_hyglas_gotrune_info;
	permanent = FALSE;
	description = "� ������ ����.";
};


func int dia_hyglas_gotrune_condition()
{
	if((Npc_KnowsInfo(hero,dia_ulthar_success) == FALSE) && (Npc_HasItems(hero,itru_firebolt) >= 1) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_hyglas_gotrune_info()
{
	AI_Output(other,self,"DIA_Hyglas_GOTRUNE_15_00");	//� ������ ����.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_01");	//������, ������. � �����, �� ������ ���� ����. �������, ��� ���� �� ��� �� � ������.
	AI_Output(self,other,"DIA_Hyglas_GOTRUNE_14_02");	//������ ��� � ������� � ������ ��� ����� ������ �����.
	b_logentry(TOPIC_RUNE,"� ������ ���� �������� ������.");
};


instance DIA_HYGLAS_TEACH(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 15;
	condition = dia_hyglas_teach_condition;
	information = dia_hyglas_teach_info;
	permanent = TRUE;
	description = "����� ����.";
};


func int dia_hyglas_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_hyglas_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Hyglas_TEACH_15_00");	//����� ����.
	Info_ClearChoices(dia_hyglas_teach);
	Info_AddChoice(dia_hyglas_teach,DIALOG_BACK,dia_hyglas_teach_back);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_hyglas_teach_instantfireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_FIRESTORM] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_FIRESTORM,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_hyglas_teach_firestorm);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_hyglas_teach_chargefireball);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_hyglas_teach_pyrokinesis);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE))
	{
		Info_AddChoice(dia_hyglas_teach,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_hyglas_teach_firerain);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		b_say(self,other,"$NOLEARNOVERPERSONALMAX");
		Info_ClearChoices(dia_hyglas_teach);
	};
};

func void dia_hyglas_teach_back()
{
	Info_ClearChoices(dia_hyglas_teach);
};

func void dia_hyglas_teach_instantfireball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_hyglas_teach_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void dia_hyglas_teach_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_hyglas_teach_firestorm()
{
	b_teachplayertalentrunes(self,other,SPL_FIRESTORM);
};

func void dia_hyglas_teach_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};


instance DIA_HYGLAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap2_exit_condition;
	information = dia_hyglas_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap3_exit_condition;
	information = dia_hyglas_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_BRINGBOOK(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 38;
	condition = dia_hyglas_bringbook_condition;
	information = dia_hyglas_bringbook_info;
	permanent = FALSE;
	description = "���� �������?";
};


func int dia_hyglas_bringbook_condition()
{
	if((KAPITEL >= 3) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_hyglas_bringbook_info()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_00");	//���� �����-������ �������?
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_01");	//���, ��. ��, ��, ��������, ������� ��� ������ � ������ �����.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_02");	//� �������� ��.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_03");	//���! � ������ �������� � ���� ����. � ��������� ������, �� ��������� ����� ������ ���������.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_04");	//���� ���� ����� ������, ��������� ���� ������ ��������� � ������ ����������� � ���������� �����. � �������, �� ������, ��� ��� ��������.
	AI_Output(other,self,"DIA_Hyglas_BringBook_15_05");	//���. ��, ���� ���� �������...
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_06");	//��, ������, � �������. ��, � �� ���� ��������� ���� ������ ��� ������, �� ���, �����������, ���������� ������� ��������. � � �� ����� ��������.
	AI_Output(self,other,"DIA_Hyglas_BringBook_14_07");	//�������, � ����, ����� �� ������ ��� �� ������ �����. ��� ���������� "������������ ���� �����". ����, ��������, �������� �������� ��, �� � ������, ��� �� ���������� � ����.
	Info_ClearChoices(dia_hyglas_bringbook);
	Info_AddChoice(dia_hyglas_bringbook,"������� ��� ����� ���.",dia_hyglas_bringbook_getityourself);
	Info_AddChoice(dia_hyglas_bringbook,"� ��� ��� � ����� �����?",dia_hyglas_bringbook_getforit);
	Info_AddChoice(dia_hyglas_bringbook,"� �������� ����� ��.",dia_hyglas_bringbook_yes);
};

func void dia_hyglas_bringbook_getityourself()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetItYourself_15_00");	//������� ��� ����� ���.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_01");	//��� �� ������ �������� �� ���� � ����� ����?! ���� ��������� �����������, �� ������ ��������� �������� �� ���!
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetItYourself_14_02");	//�������� � ���� ���� � ������� � ����� ���������.
	MIS_HYGLASBRINGBOOK = LOG_OBSOLETE;
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_getforit()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_00");	//� ��� � �� ��� ������?
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_01");	//��� �� ������ � ����?
	AI_Output(other,self,"DIA_Hyglas_BringBook_GetForIt_15_02");	//� �� ����� �����, ��� �� ���� ���, ���� � ������� ��� �����.
	AI_Output(self,other,"DIA_Hyglas_BringBook_GetForIt_14_03");	//������. � ��� �� ������ ��������? ���� � ���� ���� �����, ����� ��������� ��� ���� ������� � ������, ��� ���� ����������� ������ ���.
	Info_ClearChoices(dia_hyglas_bringbook);
};

func void dia_hyglas_bringbook_yes()
{
	AI_Output(other,self,"DIA_Hyglas_BringBook_Yes_15_00");	//� �������� ����� ��.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_01");	//������ - ��� ��������� ��� �����, � � ����� �������� ������� ������.
	AI_Output(self,other,"DIA_Hyglas_BringBook_Yes_14_02");	//�� �� ����� �� ��� ������� ����� �������. ��� ��� �������-��, �����, � ��� ����� ����.
	MIS_HYGLASBRINGBOOK = LOG_RUNNING;
	Info_ClearChoices(dia_hyglas_bringbook);
	Log_CreateTopic(TOPIC_HYGLASBRINGBOOK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HYGLASBRINGBOOK,LOG_RUNNING);
	b_logentry(TOPIC_HYGLASBRINGBOOK,"������ �����, ����� � ������ ��� ����� '������������ ���� �����'. ��� ����� ���� � ������ �� ��������� � ������.");
};


instance DIA_HYGLAS_HAVEBOOK(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 38;
	condition = dia_hyglas_havebook_condition;
	information = dia_hyglas_havebook_info;
	permanent = FALSE;
	description = "� ������ ���� �����.";
};


func int dia_hyglas_havebook_condition()
{
	if(Npc_KnowsInfo(other,dia_hyglas_bringbook) && (Npc_HasItems(other,itwr_astronomy_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_hyglas_havebook_info()
{
	AI_Output(other,self,"DIA_Hyglas_HaveBook_15_00");	//� ������ ���� �����.
	if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_01");	//����� ������, ����� �� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_HaveBook_14_02");	//�� ��� �� ���������. ����� ������. ��� ��� �� ��� �����?
	};
	b_giveinvitems(other,self,itwr_astronomy_mis,1);
	MIS_HYGLASBRINGBOOK = LOG_SUCCESS;
	b_giveplayerxp(XP_HYGLASBRINGBOOK);
	AI_Output(self,other,"DIA_Hyglas_HaveBook_14_03");	//������ �� ������ ���������. � � ������ ���������� � �������� �� ���������.
};


instance DIA_HYGLAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap4_exit_condition;
	information = dia_hyglas_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_KAP4_PERM(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 49;
	condition = dia_hyglas_kap4_perm_condition;
	information = dia_hyglas_kap4_perm_info;
	permanent = TRUE;
	description = "������ ���� �� �����?";
};


func int dia_hyglas_kap4_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_hyglas_bringbook))
	{
		return TRUE;
	};
};

func void dia_hyglas_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_00");	//������ ���� �� �����?
	if(MIS_HYGLASBRINGBOOK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_01");	//��, � �� ������ ������, �� ������� ������������ �����, ������, ����� ������ ���������.
		AI_Output(other,self,"DIA_Hyglas_Kap4_PERM_15_02");	//������ ���� ���������?
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_03");	//��, ������� ����� ������, ������, ����� �����. ����� ������ ��������� ����� ����, ������� ������������� �� � ������� �����, ����� �������� ����� � ���� �������.
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_04");	//������ ����� ������������ ��� �������, ����� ����� � ��� ���, �� �������� �������������.
		HYGLAS_SENDSTOKARRAS = TRUE;
	}
	else if(MIS_HYGLASBRINGBOOK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_05");	//���, � ��� ��� ��� ��� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Hyglas_Kap4_PERM_14_06");	//� ������� ����, ��� � ��� ����� ��������� ���� ������������, �� �� ���, ������� ��, ����������� ������ �������, ���� � ���� �� ����� ����������� ����������.
	};
};


instance DIA_HYGLAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 999;
	condition = dia_hyglas_kap5_exit_condition;
	information = dia_hyglas_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hyglas_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hyglas_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HYGLAS_PICKPOCKET(C_INFO)
{
	npc = kdf_510_hyglas;
	nr = 900;
	condition = dia_hyglas_pickpocket_condition;
	information = dia_hyglas_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_hyglas_pickpocket_condition()
{
	return c_beklauen(73,200);
};

func void dia_hyglas_pickpocket_info()
{
	Info_ClearChoices(dia_hyglas_pickpocket);
	Info_AddChoice(dia_hyglas_pickpocket,DIALOG_BACK,dia_hyglas_pickpocket_back);
	Info_AddChoice(dia_hyglas_pickpocket,DIALOG_PICKPOCKET,dia_hyglas_pickpocket_doit);
};

func void dia_hyglas_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hyglas_pickpocket);
};

func void dia_hyglas_pickpocket_back()
{
	Info_ClearChoices(dia_hyglas_pickpocket);
};

