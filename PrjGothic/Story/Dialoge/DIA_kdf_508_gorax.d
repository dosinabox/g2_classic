
instance DIA_GORAX_KAP1_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap1_exit_condition;
	information = dia_gorax_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_gorax_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_PICKPOCKET(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 888;
	condition = dia_gorax_pickpocket_condition;
	information = dia_gorax_pickpocket_info;
	permanent = TRUE;
	description = "(������� ���� ���� ����� ����� ������)";
};


func int dia_gorax_pickpocket_condition()
{
	if((self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (other.attribute[ATR_DEXTERITY] >= (80 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_gorax_pickpocket_info()
{
	Info_ClearChoices(dia_gorax_pickpocket);
	Info_AddChoice(dia_gorax_pickpocket,DIALOG_BACK,dia_gorax_pickpocket_back);
	Info_AddChoice(dia_gorax_pickpocket,DIALOG_PICKPOCKET,dia_gorax_pickpocket_doit);
};

func void dia_gorax_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self,itke_klosterschatz,1);
		b_giveinvitems(self,other,itke_klosterschatz,1);
		b_givethiefxp();
		Info_ClearChoices(dia_gorax_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_gorax_pickpocket_back()
{
	Info_ClearChoices(dia_gorax_pickpocket);
};


instance DIA_GORAX_HELP(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_help_condition;
	information = dia_gorax_help_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gorax_help_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_gorax_help_info()
{
	AI_Output(self,other,"DIA_Gorax_HELP_14_00");	//���� � ���-������ ������ ����?
};


instance DIA_GORAX_GOLD(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_gold_condition;
	information = dia_gorax_gold_info;
	permanent = TRUE;
	description = "� ������ ����� ���� ������.";
};


var int dia_gorax_gold_perm;

func int dia_gorax_gold_condition()
{
	if((other.guild == GIL_NOV) && (DIA_GORAX_GOLD_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_gold_info()
{
	AI_Output(other,self,"DIA_Gorax_GOLD_15_00");	//� ������ ����� ���� ������.
	if(Npc_HasItems(other,itmi_gold) >= SUMME_KLOSTER)
	{
		AI_Output(self,other,"DIA_Gorax_GOLD_14_01");	//(� ������������) ��! ���������� ������. ��� ����� ������, ��� ���.
		AI_Output(self,other,"DIA_Gorax_GOLD_14_02");	//� ��������� ���� ������������� �� ����� ���������, ��� ���� ������ �����.
		DIA_GORAX_GOLD_PERM = TRUE;
		b_giveinvitems(other,self,itmi_gold,SUMME_KLOSTER);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//��� �� ������ � ���� �������? �� �������� ���? ����� � �� ����������� ���� ��� ������!
	};
};


instance DIA_GORAX_SLEEP(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 4;
	condition = dia_gorax_sleep_condition;
	information = dia_gorax_sleep_info;
	description = "� ��� �����, ��� ����� ���� �� �������.";
};


func int dia_gorax_sleep_condition()
{
	if((DIA_GORAX_GOLD_PERM == TRUE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_gorax_sleep_info()
{
	AI_Output(other,self,"DIA_Gorax_SLEEP_15_00");	//� ��� �����, ��� ����� ���� �� �������.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_01");	//���� ���� ��������� ������� � ��������� �������. ������ ����� �������, ����� � ������. �� ������ ������� ���.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_02");	//�� ������ ������� ���� ���� � ���� �� ������ ��������.
	AI_Output(self,other,"DIA_Gorax_SLEEP_14_03");	//� ����� - ���� ������ ������� � ����������� �����. �����, ��� ���������������� ���������� ���� ������ ������� � ����������.
};


instance DIA_GORAX_AUFGABE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_aufgabe_condition;
	information = dia_gorax_aufgabe_info;
	permanent = FALSE;
	description = "� ���� ���� �����-������ ������� ��� ����?";
};


func int dia_gorax_aufgabe_condition()
{
	if(MIS_KLOSTERARBEIT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_gorax_aufgabe_info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe_15_00");	//� ���� ���� �����-������ ������� ��� ����?
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_01");	//��, ���������� ������ ����������. � ���, ��� ������ ��������, ������ ������ ��������.
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_02");	//� ��� ���� ���� �� ��������. �� ������� ��� ������� �������. ������ �� ����������� - �� ������� �� �� ��������������!
	AI_Output(self,other,"DIA_Gorax_Aufgabe_14_03");	//� ����� ��������� � ����, ������ ���������� �� ��� �����.
	CreateInvItems(self,itke_klosterstore,1);
	b_giveinvitems(self,other,itke_klosterstore,1);
	MIS_GORAXESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXESSEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXESSEN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXESSEN,"������ ������ �����, ����� � �������� ������� ������� �� �������� ������� ����� �����������. ����� ����, � ��������� ���� ��� ���������� �����������.");
};


instance DIA_GORAX_WURST(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 2;
	condition = dia_gorax_wurst_condition;
	information = dia_gorax_wurst_info;
	permanent = TRUE;
	description = "� ������ ������� (���������� �������).";
};


func int dia_gorax_wurst_condition()
{
	if((MIS_GORAXESSEN == LOG_RUNNING) && (Mob_HasItems("WURSTTRUHE",itfo_schafswurst) == 0))
	{
		return TRUE;
	};
};

func void dia_gorax_wurst_info()
{
	AI_Output(other,self,"DIA_Gorax_Wurst_15_00");	//� ������ �������.
	if(WURST_GEGEBEN >= 13)
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_01");	//� �������� �� �� ��������������. ���, ������ ��� ������ ��������� - � ����������� � ����� ������.
		MIS_GORAXESSEN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXESSEN);
		b_giveinvitems(self,other,itsc_lightheal,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Wurst_14_02");	//��? � �����, �� ������������ ������������ ���������� � ����� ������.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_03");	//�� ���� ���� ������� ���, ���� ��� ����-������ ������, ��� ��� �����������.
		AI_Output(self,other,"DIA_Gorax_Wurst_14_04");	//��������, ��� ��� �� ������� - � ������ �� ���� ������� - � �� ������ ��� ����� ����. �� ����� ������ ������ �� �����������, ���������!
		MIS_GORAXESSEN = LOG_FAILED;
	};
};


instance DIA_GORAX_AUFGABE2(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_aufgabe2_condition;
	information = dia_gorax_aufgabe2_info;
	permanent = FALSE;
	description = "� ���� ���� ��� �����-������ ��������� ��� ����?";
};


func int dia_gorax_aufgabe2_condition()
{
	if(((MIS_GORAXESSEN == LOG_SUCCESS) || (MIS_GORAXESSEN == LOG_FAILED)) && (Npc_IsDead(orlan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_aufgabe2_info()
{
	AI_Output(other,self,"DIA_Gorax_Aufgabe2_15_00");	//� ���� ���� ��� �����-������ ��������� ��� ����?
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_01");	//��. ��� �� ������, �� ������ ����� ������������ ����, � ����� ��� �������.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_02");	//�����, ������ �������� '������� ������' ������� �������� ������. �� ������������ �� ����� � 240 ������� �����.
	AI_Output(self,other,"DIA_Gorax_Aufgabe2_14_03");	//������ ��� ��� ������� - �� ������, ����� �� �� �������� ����.
	b_giveinvitems(self,other,itfo_wine,12);
	MIS_GORAXWEIN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GORAXWEIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GORAXWEIN,LOG_RUNNING);
	b_logentry(TOPIC_GORAXWEIN,"������ ������ �����, ����� � �������� ������, ������� ��������, ���������� ������� ����. ��� ����� 240 ������� �����.");
};


instance DIA_GORAX_ORLAN(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_orlan_condition;
	information = dia_gorax_orlan_info;
	permanent = TRUE;
	description = "� ����� ���� ������.";
};


var int dia_gorax_orlan_permanent;

func int dia_gorax_orlan_condition()
{
	if((MIS_GORAXWEIN == LOG_RUNNING) && Npc_KnowsInfo(other,dia_orlan_wein) && (DIA_GORAX_ORLAN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gorax_orlan_info()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_15_00");	//� ����� ���� ������.
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_01");	//�? �� ������� 240 ������� �����?
		DIA_GORAX_ORLAN_PERMANENT = TRUE;
		Info_ClearChoices(dia_gorax_orlan);
		Info_AddChoice(dia_gorax_orlan,"�� ����� ����! (������ 100 �����)",dia_gorax_orlan_100);
		Info_AddChoice(dia_gorax_orlan,"� ������ ������. (������ 240 �����)",dia_gorax_orlan_240);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_14_02");	//��� �� ������ � ���� �������? �� �������� ���? ����� � �� ����������� ���� ��� ������!
	};
};

func void dia_gorax_orlan_100()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_100_15_00");	//�� ����� ����!
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_01");	//�� ������ ��� ���� �������? ��, ���! � ������ ������ � ������ ����?!
	AI_Output(self,other,"DIA_Gorax_Orlan_100_14_02");	//�� ���������� �� �� ��� �� ��������! �������� � ���� ����!
	b_giveinvitems(other,self,itmi_gold,100);
	MIS_GORAXWEIN = LOG_FAILED;
	Info_ClearChoices(dia_gorax_orlan);
	AI_StopProcessInfos(self);
};

func void dia_gorax_orlan_240()
{
	AI_Output(other,self,"DIA_Gorax_Orlan_240_15_00");	//� ������ ������.
	if(b_giveinvitems(other,self,itmi_gold,240))
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_01");	//�����������. �� ���������� ��������� �����������. ���, ������ � �������� �������������� ������ ���������. � ������ ��� � ������� �����-������ �����.
		MIS_GORAXWEIN = LOG_SUCCESS;
		b_giveplayerxp(XP_GORAXWEIN);
	}
	else
	{
		AI_Output(self,other,"DIA_Gorax_Orlan_240_14_02");	//�� �� ��� �������� ����� ���� �����, ��? �� ����������� - ����� �����!
		MIS_GORAXWEIN = LOG_FAILED;
		b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
	};
	Info_ClearChoices(dia_gorax_orlan);
};


instance DIA_GORAX_JOB(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 35;
	condition = dia_gorax_job_condition;
	information = dia_gorax_job_info;
	permanent = FALSE;
	description = "� ��� ������ � ���� ����������� �����?";
};


func int dia_gorax_job_condition()
{
	return TRUE;
};

func void dia_gorax_job_info()
{
	AI_Output(other,self,"DIA_Gorax_JOB_15_00");	//� ��� ������ � ���� ����������� �����?
	AI_Output(self,other,"DIA_Gorax_JOB_14_01");	//��� ����������� ������������� � ������������. � �� ������ �����������, �� ����� � ��������.
	AI_Output(self,other,"DIA_Gorax_JOB_14_02");	//����� ����, � ������� ������ ��������, � ����� �� ���� ������ ����� ����������� ��������� ��������� ���������.
	AI_Output(self,other,"DIA_Gorax_JOB_14_03");	//�������, ���� ���� ���-������ �����, �� ������ ������ ���������� �� ��� � �������� ��� ����������� - �� �������� �������������, �������.
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"������ ������ � ��������� ����� ������������ ��� ���, ��� ��� �����.");
};


instance DIA_GORAX_TRADE(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 99;
	condition = dia_gorax_trade_condition;
	information = dia_gorax_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "��� ����� ���-���...";
};


func int dia_gorax_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_gorax_job))
	{
		return TRUE;
	};
};

func void dia_gorax_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Gorax_TRADE_15_00");	//��� ����� ���-���...
};


instance DIA_GORAX_KDF(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 5;
	condition = dia_gorax_kdf_condition;
	information = dia_gorax_kdf_info;
	permanent = FALSE;
	description = "��� ����� ����� ��� ���.";
};


func int dia_gorax_kdf_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_gorax_kdf_info()
{
	AI_Output(other,self,"DIA_Gorax_KDF_15_00");	//��� ����� ����� ��� ���.
	AI_Output(self,other,"DIA_Gorax_KDF_14_01");	//� ��� ���� ��������� ������� ������ ������. ���, ������ ����. ��� �� ������� ���, ��� ���� ����� ������������.
	b_giveinvitems(self,other,itke_kdfplayer,1);
	Wld_InsertItem(itpo_perm_mana,"FP_ITEM_KDFPLAYER");
};


instance DIA_GORAX_KAP2_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap2_exit_condition;
	information = dia_gorax_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_gorax_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP3_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap3_exit_condition;
	information = dia_gorax_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_gorax_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KILLPEDRO(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 3;
	condition = dia_gorax_killpedro_condition;
	information = dia_gorax_killpedro_info;
	important = TRUE;
};


func int dia_gorax_killpedro_condition()
{
	if((PEDRO_TRAITOR == TRUE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_gorax_killpedro_info()
{
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_00");	//�������, �������. ��� ����� ���������� � �����.
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_15_01");	//���� �� ������?
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_02");	//��������� ���������� ������ ����� ���������� ��������.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_03");	//� ��������� ������, ������, ��� �� �������� ���� �����. � � ���� ��, ���� ������ � �����, ��� �����... (����������)
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_04");	//� ���� ���� ��������� ��� ���� �� ����������������. �� �� ��������� ������ �������� ����, �, �������������, �� ������������, ��� ����� ������ ��� � ������� ���� ��������.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_14_05");	//�� � ������ ������������ ����. ���� � ��� ���� ��� ���������, �� ������ ������ ��������� ���. ����� �� �������, � ��� ��� �����������, � ���� ��� �� ����� ������. �� ��������� ���?
	Info_ClearChoices(dia_gorax_killpedro);
	Info_AddChoice(dia_gorax_killpedro,"������ �� ����. ��� ������� ����������� ����������� ��� ����.",dia_gorax_killpedro_nein);
	Info_AddChoice(dia_gorax_killpedro,"����� ���, ���� �� ������.",dia_gorax_killpedro_ja);
};

func void dia_gorax_killpedro_nein()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_nein_15_00");	//������ �� ����. ��� ������� ����������� ����������� ��� ����.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_nein_14_01");	//������, � ����� ������, ������ � ���, ��� � �������.
	AI_StopProcessInfos(self);
};

func void dia_gorax_killpedro_ja()
{
	AI_Output(other,self,"DIA_Gorax_KILLPEDRO_ja_15_00");	//����� ���, ���� �� ������.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_01");	//������. ����� ������ �����������, ������ ��������� � �� ����.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_02");	//��������� �����, ����� �� ���� ����� �� ��� �������������.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_03");	//����� �� ��������� ��� ������, ���� ���������� ����� ������ ��������������.
	AI_Output(self,other,"DIA_Gorax_KILLPEDRO_ja_14_04");	//� ������ ���� �� �������. � �� ������ �� ������. �������?
	b_logentry(TOPIC_TRAITORPEDRO,"������ ������ ���, ��� ��������� �����, ����� � ���� ��������� �����, ���� � ������������ � ���.");
	b_giveplayerxp(XP_GORAX_KILLPEDRO_GOTMISSION);
	MIS_GORAX_KILLPEDRO = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP4_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap4_exit_condition;
	information = dia_gorax_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_gorax_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORAX_KAP5_EXIT(C_INFO)
{
	npc = kdf_508_gorax;
	nr = 999;
	condition = dia_gorax_kap5_exit_condition;
	information = dia_gorax_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gorax_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_gorax_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};

