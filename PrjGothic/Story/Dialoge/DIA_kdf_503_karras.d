
instance DIA_KARRAS_KAP1_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap1_exit_condition;
	information = dia_karras_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_karras_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_HELLO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 1;
	condition = dia_karras_hello_condition;
	information = dia_karras_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_NOVIZENCHASE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_karras_hello_info()
{
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_00");	//��� � ���� ������� ��� ����, ���������?
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_01");	//��� � ���� ������� ��� ����, ����?
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_02");	//����������� ����� ������ ����� ��������������� �����.
		AI_Output(self,other,"DIA_Karras_Hello_10_03");	//��� � ���� ������� ��� ����?
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Hello_10_04");	//(�����������) ��� �� ������� �����?
	};
};


instance DIA_KARRAS_MISSION(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_mission_condition;
	information = dia_karras_mission_info;
	permanent = FALSE;
	description = "� ������ �������� �������.";
};


func int dia_karras_mission_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_karras_mission_info()
{
	AI_Output(other,self,"DIA_Karras_Mission_15_00");	//� ������ �������� �������.
	AI_Output(self,other,"DIA_Karras_Mission_10_01");	//�������. ���� ���� ������� �������� ����� ��� �������� �������, �������� �� ���.
	AI_Output(self,other,"DIA_Karras_Mission_10_02");	//���� ���� ������, � ������� ��� �� �������� �� ������ ��������������� ����������.
};


instance DIA_KARRAS_AUFGABE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_aufgabe_condition;
	information = dia_karras_aufgabe_info;
	permanent = FALSE;
	description = "� ���� ���� ��������� ��� ����?";
};


func int dia_karras_aufgabe_condition()
{
	if(Npc_KnowsInfo(other,dia_karras_mission))
	{
		return TRUE;
	};
};

func void dia_karras_aufgabe_info()
{
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_00");	//� ���� ���� ��������� ��� ����?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_01");	//��. ��� �������� ��������� ������. �� ����� � �������� � ���������������� � ���������� ������� � ��������� ����������. �� ����� �� ���������� ����������� ������������.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_02");	//� ��� ����� ��������� ����. � ����� ���� ������ - � ������ �� ��� ����� ������?
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_03");	//����� ��������� ���, ��� �������� �� ���������� ��������� �� ��� �������.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_04");	//� ����, ����� �� ���������� � ����� � ����� � ���� ��� ������ ��� ����.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_05");	//�� ������ �� ����� - �������?
	AI_Output(other,self,"DIA_Karras_Aufgabe_15_06");	//�������.
	AI_Output(self,other,"DIA_Karras_Aufgabe_10_07");	//��� 150 ������� �����. ��� ������ �������������� ���� �������.
	MIS_KARRASVERGESSEN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_KARRASCHARM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KARRASCHARM,LOG_RUNNING);
	b_logentry(TOPIC_KARRASCHARM,"������ ������ �������� ���� � �����. �� �����, ����� � ������ ��� ��� ������ � ������������, ������� ������������� � ������� �����.");
	b_giveinvitems(self,other,itmi_gold,150);
};


instance DIA_KARRAS_SUCCESS(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_success_condition;
	information = dia_karras_success_info;
	permanent = FALSE;
	description = "��� ������, ������� �� ����� ��������.";
};


func int dia_karras_success_condition()
{
	if((MIS_KARRASVERGESSEN == LOG_RUNNING) && (Npc_HasItems(other,itsc_charm) >= 3))
	{
		return TRUE;
	};
};

func void dia_karras_success_info()
{
	AI_Output(other,self,"DIA_Karras_Success_15_00");	//��� ������, ������� �� ����� ��������.
	AI_Output(self,other,"DIA_Karras_Success_10_01");	//�������, ��� ���� ����.
	AI_Output(self,other,"DIA_Karras_Success_10_02");	//������ �� ������ ��������� ��������� ���� �������� � ����������.
	AI_Output(self,other,"DIA_Karras_Success_10_03");	//� ������ ���� ������ � �������� �������.
	MIS_KARRASVERGESSEN = LOG_SUCCESS;
	b_giveplayerxp(XP_KARRASCHARM);
	b_giveinvitems(other,self,itsc_charm,3);
	b_giveinvitems(self,other,itsc_sumwolf,1);
};


instance DIA_KARRAS_TRADE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_trade_condition;
	information = dia_karras_trade_info;
	permanent = TRUE;
	description = "������ ��� ���� ������.";
	trade = TRUE;
};


func int dia_karras_trade_condition()
{
	if(hero.guild != GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_karras_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Karras_Trade_15_00");	//������ ��� ���� ������.
};


instance DIA_KARRAS_JOB(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_job_condition;
	information = dia_karras_job_info;
	permanent = FALSE;
	description = "� ��� ������ �� �����������?";
};


func int dia_karras_job_condition()
{
	return TRUE;
};

func void dia_karras_job_info()
{
	AI_Output(other,self,"DIA_Karras_JOB_15_00");	//� ��� ������ �� �����������?
	AI_Output(self,other,"DIA_Karras_JOB_10_01");	//� ������� �� �������� ����� ��������� ������������ ����������.
	AI_Output(other,self,"DIA_Karras_JOB_15_02");	//��� ��� ��������?
	AI_Output(self,other,"DIA_Karras_JOB_10_03");	//��, � ������ �� ������ ������� �� ������ ��������� ��� ����.
	AI_Output(self,other,"DIA_Karras_JOB_10_04");	//��� ������ ���������� ������ �������, ���� ��� ����������� ������������ ����� �������� ���� ��������� ������ ����.
	AI_Output(self,other,"DIA_Karras_JOB_10_05");	//����� ����, � ���� ���� ����� ���������� ������, ������� ��� ���� � �������.
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Karras_JOB_10_06");	//�� � ���� ������� �� ������ ������ ������ ������.
	};
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"������ ������ �� ��������� ����� ������� ��� ������ � ������������. �� ��� ����� � ������ ���� ����� ����.");
};


instance DIA_KARRAS_TEACH(C_INFO)
{
	npc = kdf_503_karras;
	nr = 10;
	condition = dia_karras_teach_condition;
	information = dia_karras_teach_info;
	permanent = TRUE;
	description = "����� ���� (�������� ���).";
};


func int dia_karras_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_karras_teach_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Karras_TEACH_15_00");	//����� ����.
	Info_ClearChoices(dia_karras_teach);
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 1) && (PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONGOBLINSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_karras_teach_sumgobl);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2) && (PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONWOLF,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_karras_teachsummonwolf);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 3) && (PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONSKELETON,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_karras_teach_summonskeleton);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 4) && (PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_karras_teach_summongolem);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 5) && (PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_karras_teach_summondemon);
		abletolearn = abletolearn + 1;
	};
	if((Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 6) && (PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE))
	{
		Info_AddChoice(dia_karras_teach,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_karras_teach_armyofdarkness);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Karras_TEACH_10_01");	//� ��������� ������ ��� ������ ����� ����.
	}
	else
	{
		Info_AddChoice(dia_karras_teach,DIALOG_BACK,dia_karras_teach_back);
	};
};

func void dia_karras_teach_back()
{
	Info_ClearChoices(dia_karras_teach);
};

func void dia_karras_teach_sumgobl()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOBLINSKELETON);
};

func void dia_karras_teachsummonwolf()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONWOLF);
};

func void dia_karras_teach_summonskeleton()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONSKELETON);
};

func void dia_karras_teach_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void dia_karras_teach_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void dia_karras_teach_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};


instance DIA_KARRAS_CIRCLE4(C_INFO)
{
	npc = kdf_503_karras;
	nr = 3;
	condition = dia_karras_circle4_condition;
	information = dia_karras_circle4_info;
	permanent = TRUE;
	description = "� ���� ������� ��������� ���� �����.";
};


func int dia_karras_circle4_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3)
	{
		return TRUE;
	};
};

func void dia_karras_circle4_info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE4_15_00");	//� ���� ������� ��������� ���� �����.
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		if(b_teachmagiccircle(self,other,4))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_01");	//������. ��� ����� �� ������������ ���� �����������. ����� �� � ��������� ����, �� �������� � ����� ���� ���� ����� �����.
			AI_Output(self,other,"DIA_Karras_CIRCLE4_10_02");	//�� ����� ������ ������, � ����� ����� ���������� �������� ���� ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_03");	//�� ��� ������ �� ��������.
	};
};


instance DIA_KARRAS_CIRCLE5(C_INFO)
{
	npc = kdf_503_karras;
	nr = 3;
	condition = dia_karras_circle5_condition;
	information = dia_karras_circle5_info;
	permanent = TRUE;
	description = "� ���� ������� ����� ���� �����.";
};


func int dia_karras_circle5_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		return TRUE;
	};
};

func void dia_karras_circle5_info()
{
	AI_Output(other,self,"DIA_Karras_CIRCLE5_15_00");	//� ���� ������� ����� ���� �����.
	if(KAPITEL >= 5)
	{
		if(b_teachmagiccircle(self,other,5))
		{
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_01");	//����� �� � ����� ���� �����. ���� ������ ���������� �������������� �����, ����������� � ���, ��� �� ������ �����.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_02");	//��������� ��� ���� �� �����, ���� - ���� ��� ������, � ������ ���� �����.
			AI_Output(self,other,"DIA_Karras_CIRCLE5_10_03");	//� �� ���� ����������� ���� �� ���� � ������� � ���������� ����� �����. ��� ������� ������ ���� � ����, ����� ������ �����.
			b_logentry(TOPIC_KLOSTERTEACHER,"������ ������� �������� ���� � 6-� ���� �����.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_CIRCLE4_10_04");	//����� ��� �� ������.
	};
};


instance DIA_KARRAS_KAP2_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap2_exit_condition;
	information = dia_karras_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_karras_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_KAP3_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap3_exit_condition;
	information = dia_karras_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_karras_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_CHASEPEDRO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 31;
	condition = dia_karras_chasepedro_condition;
	information = dia_karras_chasepedro_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_karras_chasepedro_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_karras_chasepedro_info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_00");	//����, ���� ������ ������ �������. �� ������ ����� ����� � ������� ���� ������ ���������.
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_01");	//���� ���� �� �������, �� ��� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ChasePedro_10_02");	//��� �� ������� �����? ����� �� �� ������ ������ ������ ��������� ��������� �����?
		Info_ClearChoices(dia_karras_chasepedro);
		Info_AddChoice(dia_karras_chasepedro,"��� ��������. ���� ������, ����� ������ ����.",dia_karras_chasepedro_later);
		Info_AddChoice(dia_karras_chasepedro,"��� ��� ����� ������ �� ����.",dia_karras_chasepedro_wontescape);
	};
};

func void dia_karras_chasepedro_later()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_Later_15_00");	//��� ��������. ���� ������, ����� ������ ����.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_01");	//�� �� �������������, ��� ��� ������ �������� ��� ���������? ���� ������ - ������� ������.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_02");	//����� �� � ��������� �����������, ��� ���� ������������ ������� � ���� ��������, �� �� ���-�� �������, � �� ������ ������������� ��� ����.
	AI_Output(self,other,"DIA_Karras_ChasePedro_Later_10_03");	//��� ����������� �� ���������� �� ������ � ����� ����� ����!
	AI_StopProcessInfos(self);
};

func void dia_karras_chasepedro_wontescape()
{
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_00");	//��� ��� ����� ������ �� ����.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_01");	//� ����� ������� �� ���, ���� ������ �� �����. ���� �� ��� ������� ���� ��-�� ����, ��� �� ���������� �����, � ����� ���������� � ���, ����� �� �������� ����� ����������.
	AI_Output(other,self,"DIA_Karras_ChasePedro_WontEscape_15_02");	//� � ��� ���� ����� ��������?
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_03");	//� �������� � ������. �� ����� �������� �����������, ����� ����������� ���� ��������� �� ����� ������������.
	AI_Output(self,other,"DIA_Karras_ChasePedro_WontEscape_10_04");	//� ������ �� ����� ������� �������. � ��������� ������, �����, ��� ��������� ����� ������� �� ������ ������ �� ������.
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_NEEDINFO(C_INFO)
{
	npc = kdf_503_karras;
	nr = 31;
	condition = dia_karras_needinfo_condition;
	information = dia_karras_needinfo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_karras_needinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_karras_chasepedro) && (KAPITEL == 3) && (hero.guild != GIL_KDF) && (MIS_NOVIZENCHASE == LOG_RUNNING) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_karras_needinfo_info()
{
	AI_Output(self,other,"DIA_Karras_NeedInfo_10_00");	//�� ������, ��� ���� ����� ������. ��� ��� ��!
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_INNOSEYERETRIEVED(C_INFO)
{
	npc = kdf_503_karras;
	nr = 1;
	condition = dia_karras_innoseyeretrieved_condition;
	information = dia_karras_innoseyeretrieved_info;
	permanent = FALSE;
	description = "� ������ ����� ���� ������.";
};


func int dia_karras_innoseyeretrieved_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_karras_innoseyeretrieved_info()
{
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_00");	//� ������ ����� ���� ������.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_01");	//� ��� ���, ��� ���� ������� ������� ���� �� ��� �����.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_02");	//�� ��������� ��� ��� �������� ��� ����. ���� ������������� ����� ����� � ���������� �� � ����� � ����������� ��������������.
	AI_Output(other,self,"DIA_Karras_InnosEyeRetrieved_15_03");	//� ��� ������������ ��� �� ����� �����.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_04");	//������ �� ����� ��� �����. �������� ��������. ����� ��������. ������ �� ���� �� �����, ���� ����� ��������, � ���� ���.
	AI_Output(self,other,"DIA_Karras_InnosEyeRetrieved_10_05");	//���� ��� �������� � ��������� ���������� �����. �� ����� ��������� � ���� � �� ������� �������.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_KARRAS_KAP3_PERM(C_INFO)
{
	npc = kdf_503_karras;
	nr = 5;
	condition = dia_karras_kap3_perm_condition;
	information = dia_karras_kap3_perm_info;
	permanent = TRUE;
	description = "��� ������������ ���� ������������?";
};


func int dia_karras_kap3_perm_condition()
{
	if((KAPITEL >= 3) && Npc_KnowsInfo(other,dia_karras_job))
	{
		return TRUE;
	};
};

func void dia_karras_kap3_perm_info()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_00");	//��� ������������ ���� ������������?
	if((MIS_KARRASRESEARCHDMT == FALSE) && (PYROKARTOLDKARRASTORESEARCHDMT == TRUE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_01");	//� ���� �������� ���-��� �� ������.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_02");	//� ��� ��� �����?
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_03");	//��� ����� ��������� ������������ �������������. ��, �� ������� ����, ��� ��������� ��� ���������� ��� �������� �������.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_04");	//���� ��������� ��� ������� � ����.
		AI_Output(other,self,"DIA_Karras_KAP3_Perm_15_05");	//���� ��! ����� ������ ���������!
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_06");	//� ������� ���� ���������, �� � ���� ������������ ���������, ����� ������� ����� ��������� �����������.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_07");	//�� �� ��� �� �������� ��� ���-������, ������������� ��, ��� ��������...
		MIS_KARRASRESEARCHDMT = LOG_RUNNING;
		b_logentry(TOPIC_DEMENTOREN,"����� ���������� ���� ������������, ������� ����� ���-������, ��� ���� � ������ �������� � �������.");
		Info_ClearChoices(dia_karras_kap3_perm);
		Info_AddChoice(dia_karras_kap3_perm,DIALOG_BACK,dia_karras_kap3_perm_back);
		Info_AddChoice(dia_karras_kap3_perm,"� �������� ���-������ �������.",dia_karras_kap3_perm_willsee);
		Info_AddChoice(dia_karras_kap3_perm,"����� ����� � ����� ��������� ������?",dia_karras_kap3_perm_sleeper);
		Info_AddChoice(dia_karras_kap3_perm,"��� ������ ���� �����?",dia_karras_kap3_perm_material);
	}
	else if(MIS_KARRASRESEARCHDMT == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_08");	//� ��� ��� ������� ��� �������������� ������ �� ������.
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_09");	//��� ������ � ���-������ ������, �, ������� ��, ���������� ���������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_KAP3_Perm_10_10");	//� ����� ����� �������. ����� �� ��� ������������ ���������� ��������� ��� ��������� - ����������� ������ ����������.
	};
};

func void dia_karras_kap3_perm_back()
{
	Info_ClearChoices(dia_karras_kap3_perm);
};

func void dia_karras_kap3_perm_sleeper()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Sleeper_15_00");	//����� ����� � ����� ��������� ������?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_01");	//� ������ � ������. ��, ������ �� ��������� � ���� ����������, � ������ �� ���� ������� �� ����.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Sleeper_10_02");	//� ���� ����� ����� ��������� ������������ ���������� �������, � ����� �� ��� ����� ���� ���������.
};

func void dia_karras_kap3_perm_corpse()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Corpse_15_00");	//�� ������, ����� � ������ ���� ����, ��� ��?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_01");	//���! �� � ��� �����?! ���������, �������������� ����������� ������������ �������� � ������ ���������, ������� ������.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_02");	//����� ����������, ���� �� ������� �����-������ ��������, �������� ��� ���� ��������.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Corpse_10_03");	//������� ������������ ����, ��������� � ���, ������ ���� ���������� ���������� ��� ��������.
};

func void dia_karras_kap3_perm_material()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_Material_15_00");	//��� ������ ���� �����?
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_Material_10_01");	//������ � ����? ����� �������, ������� ����������� ������ ���� ���������.
	Info_AddChoice(dia_karras_kap3_perm,"�� ������, ����� � ������ ���� ����?",dia_karras_kap3_perm_corpse);
};

func void dia_karras_kap3_perm_willsee()
{
	AI_Output(other,self,"DIA_Karras_KAP3_Perm_WillSee_15_00");	//� �������� ���-������ �������.
	AI_Output(self,other,"DIA_Karras_KAP3_Perm_WillSee_10_01");	//��� ���� �� ����� ��������. � ���� � ������� ������ �������� ��������������.
	Info_ClearChoices(dia_karras_kap3_perm);
};


instance DIA_KARRAS_HAVEBOOK(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_havebook_condition;
	information = dia_karras_havebook_info;
	permanent = FALSE;
	description = "� ������ �������� ���������.";
};


func int dia_karras_havebook_condition()
{
	if((MIS_KARRASRESEARCHDMT == LOG_RUNNING) && (Npc_HasItems(hero,itwr_dementorobsessionbook_mis) >= 1) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int karrasgotresearchdmtbook_day;

func void dia_karras_havebook_info()
{
	AI_Output(other,self,"DIA_Karras_HaveBook_15_00");	//� ������ �������� ���������. ����� ����, �� ���-������ ���� �������.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_01");	//������.
	Npc_RemoveInvItems(other,itwr_dementorobsessionbook_mis,1);
	AI_PrintScreen("�������� ������",-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	AI_Output(self,other,"DIA_Karras_HaveBook_10_02");	//��, ��� ����� �������. � ������ ������� ��� �����.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_03");	//�� � ��� ������ � �����.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_04");	//�� ����� ������, ������ - ��� ������ ����������� ��������� �����, ��������� ��������.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_05");	//��� �������� ����� �������� ������������ � �������� ������������ �������.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_06");	//������ � ���� �� ���� �������, ����� �� �� ���� � �������� ������������� ������������ ��� � ������ ���������� ��������.
	AI_Output(self,other,"DIA_Karras_HaveBook_10_07");	//������ �������. ����� � ����������� ����� ������� ������.
	MIS_KARRASRESEARCHDMT = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"������ ���� ������������ �������� ��������� ��� ����������� ����� ������������. � ������ ��������� � ���� �����.");
	KARRASGOTRESEARCHDMTBOOK_DAY = Wld_GetDay();
	b_giveplayerxp(XP_KARRASRESEARCHDMT);
};


instance DIA_KARRAS_RESEARCHDMTEND(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_researchdmtend_condition;
	information = dia_karras_researchdmtend_info;
	permanent = TRUE;
	description = "������� ���-������ ����� �� ������?";
};


func int dia_karras_researchdmtend_condition()
{
	if((MIS_KARRASRESEARCHDMT == LOG_SUCCESS) && (hero.guild == GIL_KDF) && (SC_KNOWSMADPSI == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_researchdmtend_info()
{
	AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_00");	//������� ���-������ ����� �� ������?
	if(KARRASGOTRESEARCHDMTBOOK_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_01");	//��. ������ � ����, ��� ��� ��� ��� ������ �������� � ����������������.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_02");	//����������!
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_03");	//�����-�� ��� ���� ������, ��� �� ��� �. ��� ������� ����������� ������, �������� ���� �������� ����� ����� �������� ����������.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_04");	//��� �������� ����� ����������, � ����� ����� ������� ����������, ������������ ����� �� ������������� ����� �������� ���, � �� �������� �� �� ����� �������� �������� ���� ����.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_05");	//������� ��, ��� �� ����� ��� ������ ���, �� ���������� ����������� �����, � ��� ������� �� ���������� ��������� �� �������������� ������.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_06");	//�� ������ ��������� ������������. ������, ��� ������ ���� ��������� �������� ������.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_07");	//������, ���� �� ���� ��������� �����, � �� ����� ����������, ��� �� ����� ����� � ������������.
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_08");	//�������. ��� ��� ���� ����� �����������.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_09");	//������? ��� �������, ��� ��� ��������� ������ ��� ������ ��������. ��������, ��� ��� ���� ������, � ����� ��������� ������ �� ���, ��� ��� ���� ������?
		AI_Output(other,self,"DIA_Karras_ResearchDMTEnd_15_10");	//� ���� ���� �������. ��� ��� ������ �� �������� �������. � ���� ���� ������.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_11");	//�������, �� ���������, � ��� ������ ����. ���� ���������, ����.
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_12");	//��, ������� ��! ��� ���� ��������. ��� �� ������ �� �����.
		CreateInvItems(other,itwr_dementorobsessionbook_mis,1);
		AI_PrintScreen("�������� ��������",-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
		SC_KNOWSMADPSI = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"������������ ������� ����������� �������. ������, ���� ����� ����� ������� � ��������� �������.");
		b_giveplayerxp(XP_SC_KNOWSMADPSI);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ResearchDMTEnd_10_13");	//� ������� ��� ����. ������ �����.
	};
};


instance DIA_KARRAS_PROT_BLACKEYE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_prot_blackeye_condition;
	information = dia_karras_prot_blackeye_info;
	permanent = TRUE;
	description = "���� �� ������ ���������� �� ���������� ���� ������?";
};


func int dia_karras_prot_blackeye_condition()
{
	if((hero.guild == GIL_KDF) && (PYROKAR_ASKKARRASABOUTDMTAMULETT == TRUE) && (MIS_KARRAS_FINDBLESSEDSTONE == FALSE) && Npc_KnowsInfo(other,dia_karras_job))
	{
		return TRUE;
	};
};

func void dia_karras_prot_blackeye_info()
{
	AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_00");	//���� �� ������ ���������� �� ���������� ���� ������?
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_01");	//�������. ������, ������������� �� ����� � �������������� �����, ��� �� ������� �������� ��������.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_02");	//� ���������, � ���� �� �������� ����� ������.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_03");	//��������� �� �������, ����������� ����, ������� �� ����� ������.
		AI_Output(other,self,"DIA_Karras_Prot_BlackEye_15_04");	//������. � �������� ��������� ����� ������.
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_05");	//��, ������ ���. �� ���� �� �����, ����� ��������� �����-������ ������, �� ������� ����?
		b_logentry(TOPIC_DEMENTOREN,"������ ����� ���� ��� ��������� ������ �� ���������� ���� ������. ��� ����� ��� ����� ������ �� �������������� �����. ��������� ������ ������� �� ����� ������.");
		MIS_KARRAS_FINDBLESSEDSTONE = LOG_RUNNING;
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_Prot_BlackEye_10_06");	//������� �� ����. � ���� ���� ������� ����, ����� ���� ����� �� ���� ������. ����� ��� ��� ��� ��� �������.
	};
};


instance DIA_KARRAS_KARRASBLESSEDSTONE(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_karrasblessedstone_condition;
	information = dia_karras_karrasblessedstone_info;
	description = "� ������ ��������� ������ � �������������� �����.";
};


func int dia_karras_karrasblessedstone_condition()
{
	if((hero.guild == GIL_KDF) && Npc_HasItems(other,itmi_karrasblessedstone_mis) && (MIS_KARRAS_FINDBLESSEDSTONE == LOG_RUNNING))
	{
		return TRUE;
	};
};


var int karrasmakesblessedstone_day;

func void dia_karras_karrasblessedstone_info()
{
	AI_Output(other,self,"DIA_Karras_KarrasBlessedStone_15_00");	//� ������ ��������� ������ � �������������� �����.
	b_giveinvitems(other,self,itmi_karrasblessedstone_mis,1);
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_01");	//��� ������. �������, ��� ������ ��-�������� ����� �� ����� ������.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_02");	//������. � ������ ��� ���� ������, ���������� �� ������� ������� ������.
	AI_Output(self,other,"DIA_Karras_KarrasBlessedStone_10_03");	//��� ��� ������� �������. ��� ���� ����� ����������.
	KARRASMAKESBLESSEDSTONE_DAY = Wld_GetDay();
	MIS_KARRAS_FINDBLESSEDSTONE = LOG_SUCCESS;
	b_logentry(TOPIC_DEMENTOREN,"������ ��� ��� ������, ������� ����� �������� ���� �� ���������� ���� ������. ��� ������ ������ ��������� ��� �����.");
	b_giveplayerxp(XP_KARRAS_FOUNDBLESSEDSTONE);
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS(C_INFO)
{
	npc = kdf_503_karras;
	nr = 2;
	condition = dia_karras_itam_prot_blackeye_mis_condition;
	information = dia_karras_itam_prot_blackeye_mis_info;
	permanent = TRUE;
	description = "��� ��� ������ ��������� �������, ��� �� ������ ���?";
};


var int dia_karras_itam_prot_blackeye_mis_noperm;

func int dia_karras_itam_prot_blackeye_mis_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_KARRAS_FINDBLESSEDSTONE == LOG_SUCCESS) && (DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_karras_itam_prot_blackeye_mis_info()
{
	AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_00");	//��� ��� ������ ��������� �������, ��� �� ������ ���?
	if(KARRASMAKESBLESSEDSTONE_DAY <= (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_01");	//� ��������. ���, �������. �� ��������� ����� �������.
		CreateInvItems(self,itam_prot_blackeye_mis,1);
		b_giveinvitems(self,other,itam_prot_blackeye_mis,1);
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_02");	//���� ���, �� ������, � ������ �� ������ �������� ���� � ���� ���������� ��������.
		AI_Output(other,self,"DIA_Karras_ItAm_Prot_BlackEye_Mis_15_03");	//�������.
		b_logentry(TOPIC_DEMENTOREN,"������ ��� ��� ������, ������� ����� �������� ���� �� ������� ������� ������.");
		DIA_KARRAS_ITAM_PROT_BLACKEYE_MIS_NOPERM = TRUE;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Karras_ItAm_Prot_BlackEye_Mis_10_04");	//�����������. � ��� ��� ������� ��� ���.
	};
};


instance DIA_KARRAS_KAP4_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap4_exit_condition;
	information = dia_karras_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_karras_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_KAP5_EXIT(C_INFO)
{
	npc = kdf_503_karras;
	nr = 999;
	condition = dia_karras_kap5_exit_condition;
	information = dia_karras_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_karras_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_karras_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARRAS_PICKPOCKET(C_INFO)
{
	npc = kdf_503_karras;
	nr = 900;
	condition = dia_karras_pickpocket_condition;
	information = dia_karras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_karras_pickpocket_condition()
{
	return c_beklauen(49,35);
};

func void dia_karras_pickpocket_info()
{
	Info_ClearChoices(dia_karras_pickpocket);
	Info_AddChoice(dia_karras_pickpocket,DIALOG_BACK,dia_karras_pickpocket_back);
	Info_AddChoice(dia_karras_pickpocket,DIALOG_PICKPOCKET,dia_karras_pickpocket_doit);
};

func void dia_karras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_karras_pickpocket);
};

func void dia_karras_pickpocket_back()
{
	Info_ClearChoices(dia_karras_pickpocket);
};

