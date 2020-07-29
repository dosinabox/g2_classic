
instance DIA_AKIL_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_exit_condition;
	information = dia_akil_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_akil_exit_info()
{
	AI_Output(other,self,"DIA_Akil_EXIT_15_00");	//� ������ ����.
	if(AKIL_SAUER == TRUE)
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_01");	//�� ���� ����������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_EXIT_13_02");	//����! ������ ��� ���� ������ ���-������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_HALLO(C_INFO)
{
	npc = bau_940_akil;
	nr = 4;
	condition = dia_akil_hallo_condition;
	information = dia_akil_hallo_info;
	permanent = FALSE;
	description = "� ���� �����-�� ��������?";
};


func int dia_akil_hallo_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_akil_hallo_info()
{
	AI_Output(other,self,"DIA_Akil_Hallo_15_00");	//� ���� �����-�� ��������?
	AI_Output(self,other,"DIA_Akil_Hallo_13_01");	//(� ����)... �-�... ���, ���... ��� � �������. (������) ���... ���� ����� ���� ������.
	AI_Output(other,self,"DIA_Akil_Hallo_15_02");	//�� � ���� ������?
	AI_Output(self,other,"DIA_Akil_Hallo_13_03");	//�-�... ��, ��... ��� � �������. ��... �-�... �... � ������ �� ���� �������� � �����.
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"������� ����� �������� ��������.");
	AKILS_SLDSTILLTHERE = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_NICHTJETZT(C_INFO)
{
	npc = bau_940_akil;
	nr = 7;
	condition = dia_akil_nichtjetzt_condition;
	information = dia_akil_nichtjetzt_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_akil_nichtjetzt_condition()
{
	if(Npc_IsInState(self,zs_talk) && !Npc_IsDead(alvares) && !Npc_IsDead(engardo) && Npc_KnowsInfo(other,dia_akil_hallo))
	{
		return TRUE;
	};
};

func void dia_akil_nichtjetzt_info()
{
	AI_Output(self,other,"DIA_Akil_Nichtjetzt_13_00");	//�-�... �� ������, � ������ �� ���� �������� � �����.
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_NACHKAMPF(C_INFO)
{
	npc = bau_940_akil;
	nr = 5;
	condition = dia_akil_nachkampf_condition;
	information = dia_akil_nachkampf_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_akil_nachkampf_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo))
	{
		return TRUE;
	};
};

func void dia_akil_nachkampf_info()
{
	AI_Output(self,other,"DIA_Akil_NachKampf_13_00");	//����� ������. � �� �����, ��� �����.
	AI_Output(self,other,"DIA_Akil_NachKampf_13_01");	//���� ����� ����. � ������ �� ���� ��������� ������ �����.
	AI_Output(other,self,"DIA_Akil_NachKampf_15_02");	//��� ��� ����?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_03");	//�� ������ ����� ��. ��� �������� � ����� �����. ��� � ��.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_13_04");	//��� �������� � ����� �����. ��� ������� ������ � �����, ��� ������� � �������.
	};
	AI_Output(self,other,"DIA_Akil_NachKampf_13_05");	//� ������ �������...
	AI_Output(self,other,"DIA_Akil_NachKampf_13_06");	//(������� ��������)... ����� ������ �� ����� �� �����. ����� ���, ��� � ���� ������� ��� ����?
	Info_ClearChoices(dia_akil_nachkampf);
	Info_AddChoice(dia_akil_nachkampf,"������. � ������ ���, ��� � ���� ������ ��� � �������.",dia_akil_nachkampf_ehre);
	Info_AddChoice(dia_akil_nachkampf,"��� ������ ���������� �������?",dia_akil_nachkampf_gold);
	Npc_ExchangeRoutine(self,"Start");
	self.flags = 0;
	if(Hlp_IsValidNpc(kati) && !Npc_IsDead(kati))
	{
		Npc_ExchangeRoutine(kati,"Start");
		AI_ContinueRoutine(kati);
		kati.flags = 0;
	};
	if(Hlp_IsValidNpc(randolph) && !Npc_IsDead(randolph))
	{
		Npc_ExchangeRoutine(randolph,"Start");
		AI_ContinueRoutine(randolph);
		randolph.flags = 0;
	};
	TOPIC_END_AKILSSLDSTILLTHERE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_akil_nachkampf_ehre()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Ehre_15_00");	//������. � ������ ���, ��� � ���� ������ ��� � �������.
	AI_Output(self,other,"DIA_Akil_NachKampf_Ehre_13_01");	//�� ��������� ����. �� ������ ���� ����� �� ����� ����.
	b_giveplayerxp(XP_AKIL_SLDWEGVOMHOFEHRE);
	Info_ClearChoices(dia_akil_nachkampf);
};

func void dia_akil_nachkampf_gold()
{
	AI_Output(other,self,"DIA_Akil_NachKampf_Gold_15_00");	//��� ������ ���������� �������?
	AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_01");	//�����, ��� �������� ������������ ���� - �� ������ �������. ��� ��� �� ����� �������.
	if(!Npc_IsDead(kati))
	{
		AI_Output(self,other,"DIA_Akil_NachKampf_Gold_13_02");	//���, ��� � ���� ���������� ���� - ��� ���. ��� � ����, ����� ��� �������� ����.
	};
	b_giveplayerxp(XP_AKIL_SLDWEGVOMHOF);
	Info_ClearChoices(dia_akil_nachkampf);
	KATI_MAHLZEIT = TRUE;
};


instance DIA_AKIL_SOELDNER(C_INFO)
{
	npc = bau_940_akil;
	nr = 7;
	condition = dia_akil_soeldner_condition;
	information = dia_akil_soeldner_info;
	permanent = FALSE;
	description = "��� ��� �������� ������ �� ����?";
};


func int dia_akil_soeldner_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf))
	{
		return TRUE;
	};
};

func void dia_akil_soeldner_info()
{
	AI_Output(other,self,"DIA_Akil_Soeldner_15_00");	//��� ��� �������� ������ �� ����?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_01");	//�� ����������� ���� ����? ��� �������� ������ ������� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_Soeldner_13_02");	//�� ����� �� ������? �� ����� ����, ��������. ��� �������� ��� ����� � �������� ����� ��� ����.
		AI_Output(self,other,"DIA_Akil_Soeldner_13_03");	//��� ��������, ��� ��� ����� � ����� �� ����� � �������� ��, ��� �� ������ ��������. � ��, ��� �� ����� �������, ������� ���������� � ������.
	};
};


instance DIA_AKIL_LIEFERUNG(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_lieferung_condition;
	information = dia_akil_lieferung_info;
	permanent = FALSE;
	description = "���� ������� ��������. � ������ ������� ������� ��� ����.";
};


func int dia_akil_lieferung_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_nachkampf) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_akil_lieferung_info()
{
	AI_Output(other,self,"DIA_Akil_Lieferung_15_00");	//���� ������� ��������. � ������ ������� ������� ��� ����.
	AI_Output(self,other,"DIA_Akil_Lieferung_13_01");	//��� �� ��� ����� ���������. ������, � ��� ���������� ��.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
	b_logentry(TOPIC_BALTRAM,"� ������� �������. ������ � ���� ��������� �� ���������...");
	b_logentry(TOPIC_NAGUR,"� ������� �������. ������ � ���� ������� �� ������...");
};


instance DIA_AKIL_GEGEND(C_INFO)
{
	npc = bau_940_akil;
	nr = 90;
	condition = dia_akil_gegend_condition;
	information = dia_akil_gegend_info;
	permanent = FALSE;
	description = "�� ������ ������� �����...";
};


func int dia_akil_gegend_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_soeldner) && (KAPITEL < 3))
	{
		return TRUE;
	};
};


var int knows_taverne;

func void dia_akil_gegend_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_15_00");	//�� ������ ������� �����...
	AI_Output(self,other,"DIA_Akil_Gegend_13_01");	//�������, ��� �� ������ ������?
};


instance DIA_AKIL_HOF(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_hof_condition;
	information = dia_akil_hof_info;
	permanent = FALSE;
	description = "��� ��� ����� ����� �����?";
};


func int dia_akil_hof_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_gegend))
	{
		return TRUE;
	};
};

func void dia_akil_hof_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Onar_15_00");	//��� ��� ����� ����� �����?
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_01");	//�������� �� �������� �������� ��� ���, � ������ ��� �� ������ �� ������.
	AI_Output(self,other,"DIA_Akil_Gegend_Onar_13_02");	//�� ���� ���� ���������� �������. �� ��� ��� ������ �� ������, ���� �� ������� �� ������� ����. ��� ���-�� ��� �������� � �����.
	KNOWS_TAVERNE = TRUE;
};


instance DIA_AKIL_TAVERNE(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_taverne_condition;
	information = dia_akil_taverne_info;
	permanent = FALSE;
	description = "��� ��� �� ������� � ������� ������?";
};


func int dia_akil_taverne_condition()
{
	if(KNOWS_TAVERNE == TRUE)
	{
		return TRUE;
	};
};

func void dia_akil_taverne_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Taverne_15_00");	//��� ��� �� ������� � ������� ������?
	AI_Output(self,other,"DIA_Akil_Gegend_Taverne_13_01");	//������ �� ���� ���������. �� ����� � ��� ����� ����. �� ����� ��� ��������� ���.
};


instance DIA_AKIL_WALD(C_INFO)
{
	npc = bau_940_akil;
	nr = 20;
	condition = dia_akil_wald_condition;
	information = dia_akil_wald_info;
	permanent = FALSE;
	description = "� ��� ���, � ���� �� ����� ������?";
};


func int dia_akil_wald_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_gegend))
	{
		return TRUE;
	};
};

func void dia_akil_wald_info()
{
	AI_Output(other,self,"DIA_Akil_Gegend_Wald_15_00");	//� ��� ���, � ���� �� ����� ������?
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_01");	//��� ������ �������. � ����� ��� ����� ���������� �� ���.
	AI_Output(self,other,"DIA_Akil_Gegend_Wald_13_02");	//����� �������, ��� ��� �������� ���� ������ �������. �� - ���� �� ��� �� ������� ��� �����.
};


instance DIA_AKIL_PERM(C_INFO)
{
	npc = bau_940_akil;
	nr = 32;
	condition = dia_akil_perm_condition;
	information = dia_akil_perm_info;
	permanent = TRUE;
	description = "���� ���-������ ����������?";
};


func int dia_akil_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_akil_soeldner) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_akil_perm_info()
{
	AI_Output(other,self,"DIA_Akil_Perm_15_00");	//���� ���-������ ����������?
	if(KAPITEL == 3)
	{
		if(MIS_AKIL_SCHAFDIEBE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_01");	//���. � �������, ������ ��� ���� ������ �� ����� ���������.
		}
		else
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_02");	//��� ���� ��������� ���������. ����� ��� ������ ����� ����.
		};
	}
	else
	{
		if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_03");	//���� ������ �������. ������� ����, ��� � ��� ����� ���-�� ���� ����-��������. ��������� �� ���� ������� �������.
		};
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_04");	//�������, ��� � ������ ��������� ����-�����. �� ����� ����� � �� �� ����� � ������.
		};
		if(hero.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Akil_Perm_13_05");	//���� � ������ ����� ���� ����.
			AI_Output(other,self,"DIA_Akil_Perm_15_06");	//��� �� �������.
			AI_Output(self,other,"DIA_Akil_Perm_13_07");	//�� � �����. � ������ �������, ��� ���� ����� ����� ���.
		};
	};
};


instance DIA_AKIL_KAP3_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap3_exit_condition;
	information = dia_akil_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_akil_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_SCHAFDIEB(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_schafdieb_condition;
	information = dia_akil_schafdieb_info;
	description = "��� �� �������.";
};


func int dia_akil_schafdieb_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_akil_schafdieb_info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_15_00");	//���� ��� �������?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_13_01");	//���-�� ��������� ������ ���� ����. � ������ �� ���� �������� ����� �� �����.
	Info_ClearChoices(dia_akil_schafdieb);
	Info_AddChoice(dia_akil_schafdieb,"��� �� ��� ��������.",dia_akil_schafdieb_nein);
	Info_AddChoice(dia_akil_schafdieb,"������� ���� � ���� �������?",dia_akil_schafdieb_wieviel);
	Info_AddChoice(dia_akil_schafdieb,"��� ����� ������ ���?",dia_akil_schafdieb_wer);
	MIS_AKIL_SCHAFDIEBE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_AKILSCHAFDIEBE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSCHAFDIEBE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSCHAFDIEBE,"���� ����� ���������� ���������. �� �����������, ��� � ����� ��������� �������, ������� � ������ � �������� ����.");
};

func void dia_akil_schafdieb_wer()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wer_15_00");	//��� ����� ������ ���?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_01");	//� ���� ���� ����������.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_02");	//�����-�� ������ �������� ������������ � ������ ��� � ��� ����.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wer_13_03");	//��� ������ ��������, ��� ��� �������� ������ �������. � ����� ������, ��� ������ ��� ������� � ������������ ���� ����.
	Info_ClearChoices(dia_akil_schafdieb);
};

func void dia_akil_schafdieb_wieviel()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_wieviel_15_00");	//������� ���� � ���� �������?
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_wieviel_13_01");	//�� ������� ����, ���.
};

func void dia_akil_schafdieb_nein()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEB_nein_15_00");	//��� �� ��� ��������.
	AI_Output(self,other,"DIA_Akil_SCHAFDIEB_nein_13_01");	//�������. � ���� ������ ����� �����.
	Info_ClearChoices(dia_akil_schafdieb);
};


instance DIA_AKIL_SCHAFDIEBEPLATT(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_schafdiebeplatt_condition;
	information = dia_akil_schafdiebeplatt_info;
	description = "� ����� ���, ��� ������� � ���� ����.";
};


func int dia_akil_schafdiebeplatt_condition()
{
	if((KAPITEL >= 3) && (MIS_AKIL_SCHAFDIEBE == LOG_RUNNING) && Npc_IsDead(bdt_1025_bandit_h) && Npc_IsDead(bdt_1026_bandit_h) && Npc_IsDead(bdt_1027_bandit_h))
	{
		return TRUE;
	};
};

func void dia_akil_schafdiebeplatt_info()
{
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_00");	//� ����� ���, ��� ������� � ���� ����.
	AI_Output(other,self,"DIA_Akil_SCHAFDIEBEPLATT_15_01");	//�� ��� ����. ��� ���� ������� �� ������ � ����. �� ������ ��� � ���� ������ �� �������.
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_02");	//������� ����, �, ����������� ��������� ������.
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_03");	//�������. ������ � ����, ��� ��������� ������ �������� ���, ������ ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_04");	//�������. �� ����� �������� �������. �� �����, ��� ������.
	};
	AI_Output(self,other,"DIA_Akil_SCHAFDIEBEPLATT_13_05");	//������ ��� � �������� ������������� �� ������������ ������, ��� �� ������ ���.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	MIS_AKIL_SCHAFDIEBE = LOG_SUCCESS;
	b_giveplayerxp(XP_AKIL_SCHAFDIEBE);
};


instance DIA_AKIL_AKILSSCHAF(C_INFO)
{
	npc = bau_940_akil;
	nr = 2;
	condition = dia_akil_akilsschaf_condition;
	information = dia_akil_akilsschaf_info;
	description = "(������� ���� �����)";
};


func int dia_akil_akilsschaf_condition()
{
	if((KAPITEL >= 3) && (Npc_GetDistToNpc(self,follow_sheep_akil) < 1000) && (MIS_AKIL_SCHAFDIEBE != 0))
	{
		return TRUE;
	};
};

func void dia_akil_akilsschaf_info()
{
	AI_Output(self,other,"DIA_Akil_AkilsSchaf_13_01");	//����� ������. ��� ��������� �������. �������, ����� ����������.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	follow_sheep_akil.aivar[AIV_PARTYMEMBER] = FALSE;
	follow_sheep_akil.wp = "NW_FARM2_OUT_02";
	follow_sheep_akil.start_aistate = zs_mm_allscheduler;
	b_giveplayerxp(XP_AKILSSCHAF);
};


instance DIA_AKIL_KAP4_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap4_exit_condition;
	information = dia_akil_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_akil_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_KAP5_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap5_exit_condition;
	information = dia_akil_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_akil_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_KAP6_EXIT(C_INFO)
{
	npc = bau_940_akil;
	nr = 999;
	condition = dia_akil_kap6_exit_condition;
	information = dia_akil_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_akil_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_akil_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_AKIL_PICKPOCKET(C_INFO)
{
	npc = bau_940_akil;
	nr = 900;
	condition = dia_akil_pickpocket_condition;
	information = dia_akil_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_akil_pickpocket_condition()
{
	return c_beklauen(37,30);
};

func void dia_akil_pickpocket_info()
{
	Info_ClearChoices(dia_akil_pickpocket);
	Info_AddChoice(dia_akil_pickpocket,DIALOG_BACK,dia_akil_pickpocket_back);
	Info_AddChoice(dia_akil_pickpocket,DIALOG_PICKPOCKET,dia_akil_pickpocket_doit);
};

func void dia_akil_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_akil_pickpocket);
};

func void dia_akil_pickpocket_back()
{
	Info_ClearChoices(dia_akil_pickpocket);
};

