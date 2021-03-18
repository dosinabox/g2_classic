
instance DIA_NAGUR_EXIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 999;
	condition = dia_nagur_exit_condition;
	information = dia_nagur_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nagur_exit_condition()
{
	return TRUE;
};

func void dia_nagur_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PICKPOCKET(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 900;
	condition = dia_nagur_pickpocket_condition;
	information = dia_nagur_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_nagur_pickpocket_condition()
{
	return c_beklauen(75,150);
};

func void dia_nagur_pickpocket_info()
{
	Info_ClearChoices(dia_nagur_pickpocket);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_BACK,dia_nagur_pickpocket_back);
	Info_AddChoice(dia_nagur_pickpocket,DIALOG_PICKPOCKET,dia_nagur_pickpocket_doit);
};

func void dia_nagur_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_nagur_pickpocket);
};

func void dia_nagur_pickpocket_back()
{
	Info_ClearChoices(dia_nagur_pickpocket);
};


instance DIA_NAGUR_HALLO(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 2;
	condition = dia_nagur_hallo_condition;
	information = dia_nagur_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_KARDIF_DIEBESWERK_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_hallo_info()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_00");	//��, � ���� ��� �������, ����� ������� � �����. ���� ���� ����� ����������, �������� � ��������.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Hallo_08_01");	//��������, ������ ���� � �����, ������?
		AI_StopProcessInfos(self);
	};
};

func void b_nagur_abfertigen()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if((Hlp_IsItem(heroarmor,itar_mil_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_mil_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_m) == FALSE) && (Hlp_IsItem(heroarmor,itar_pal_h) == FALSE) && (Hlp_IsItem(heroarmor,itar_nov_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_l) == FALSE) && (Hlp_IsItem(heroarmor,itar_kdf_h) == FALSE))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_02");	//�� �������, � �� ����� ����, ��� �� ����� ������ ������?!
	};
	AI_Output(self,other,"DIA_Nagur_Add_08_03");	//(������������) �� ��� ��� ����, ���� �� �������!
	AI_Output(self,other,"DIA_Nagur_Add_08_04");	//����������!
	MIS_NAGUR_BOTE = LOG_SUCCESS;
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_JOB(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 3;
	condition = dia_nagur_job_condition;
	information = dia_nagur_job_info;
	permanent = FALSE;
	description = "������ �������, ��� � ���� ����� ���� ������ ��� ����.";
};


func int dia_nagur_job_condition()
{
	if(DIA_KARDIF_DIEBESWERK_PERMANENT == TRUE)
	{
		return TRUE;
	};
};

func void dia_nagur_job_info()
{
	AI_Output(other,self,"DIA_Nagur_Job_15_00");	//������ �������, ��� � ���� ����� ���� ������ ��� ����.
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_00");	//�����, � ������ ��� ������ ��� ����� �� ���������! (�������)
		b_nagur_abfertigen();
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Nagur_Add_08_01");	//�����, � ������ ��� ������ ��� ����������� ������.
		b_nagur_abfertigen();
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Job_08_01");	//(����������) ���, ���... �� ����� ��������� ������. �����. �� ����� ������ �� ���� ��������, �������?
		AI_Output(other,self,"DIA_Nagur_Job_15_02");	//��� ��� ������?
		AI_Output(self,other,"DIA_Nagur_Job_08_03");	//��� ������, ��� �� ������ ������, ��� � �����, � ������ �������� ����� �� ������.
		AI_Output(self,other,"DIA_Nagur_Job_08_04");	//���� ���� ��� �� ����������, �� � ���� ��� ������ ��� ����.
		Info_ClearChoices(dia_nagur_job);
		Info_AddChoice(dia_nagur_job,"�� ��������. ������� ��������� �� ���������.",dia_nagur_job_halbe);
		Info_AddChoice(dia_nagur_job,"������, �� ����� �������.",dia_nagur_job_klar);
	};
};

func void dia_nagur_job_klar()
{
	AI_Output(other,self,"DIA_Nagur_Job_Klar_15_00");	//������, �� ����� �������.
	AI_Output(self,other,"DIA_Nagur_Job_Klar_08_01");	//�������. ����� ��� ��� �����, ����� ������ ����� ���������� ���� ������.
	NAGUR_DEAL = 80;
	Info_ClearChoices(dia_nagur_job);
};

func void dia_nagur_job_halbe()
{
	AI_Output(other,self,"DIA_Nagur_Job_Halbe_15_00");	//�� ��������. ������� ��������� �� ���������.
	AI_Output(self,other,"DIA_Nagur_Job_Halbe_08_01");	//������, ��� �������. ������� ��, �� ����� ������ ������������ ������.
	NAGUR_DEAL = 120;
	Info_ClearChoices(dia_nagur_job);
};


instance DIA_NAGUR_AUFTRAG(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 4;
	condition = dia_nagur_auftrag_condition;
	information = dia_nagur_auftrag_info;
	permanent = FALSE;
	description = "������������. ��� ����� � ���� ����?";
};


func int dia_nagur_auftrag_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_job))
	{
		return TRUE;
	};
};

func void dia_nagur_auftrag_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_15_00");	//������������. ��� ����� � ���� ����?
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_01");	//�� ������ �������� ���������, ���? ���� ���, ������ ����� ���������� � ���.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_02");	//� ����� ��������� ���� ���������, ������������ ��� ������ � ����� �����.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_03");	//������ � ���� ��� ���������, ���� � �� ��������� ��� ������. � ������ ��������� �������� ������ ������ �������� �� ����������. � �� ������ ��.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_04");	//�� ������ ��������� �� ������ � ��������� � ����� ������� � �����.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_05");	//����� �� ��������� �� ���, � � ������ �� ����������������� ����������. �� ���� �������� ���� �� ���.
	AI_Output(self,other,"DIA_Nagur_Auftrag_08_06");	//� �� ������� ������� ��� ������ ���. �� ��� �����?
	Info_ClearChoices(dia_nagur_auftrag);
	Info_AddChoice(dia_nagur_auftrag,"������, ������������ (�����)",dia_nagur_auftrag_okay);
	Info_AddChoice(dia_nagur_auftrag,"��� ��� ����� ���������?",dia_nagur_auftrag_baltram);
	Info_AddChoice(dia_nagur_auftrag,"����� ��� ���������� � ����������?",dia_nagur_auftrag_wann);
	Info_AddChoice(dia_nagur_auftrag,"��� ����� �����?",dia_nagur_auftrag_akil);
	Info_AddChoice(dia_nagur_auftrag,"����� ��������� �����?",dia_nagur_auftrag_gewinn);
};

func void dia_nagur_auftrag_akil()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Akil_15_00");	//��� ����� �����?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_01");	//������� �� ������ ����� ��������� ������, ��� ��������� �� �������� �������.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_02");	//���� �� ������� �� ������ �������, ������ ������� ��������, ���������� � �����.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Akil_08_03");	//��������� �� ��� � ��������� �� ����� �����.
};

func void dia_nagur_auftrag_gewinn()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Gewinn_15_00");	//����� ��������� �����?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Gewinn_08_01");	//�� ���� ������� �����. ��, � �����, �� ����� 400 �����.
};

func void dia_nagur_auftrag_baltram()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Baltram_15_00");	//��� ��� ����� ���������?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Baltram_08_01");	//��� �������� ��������� �� �������� �������.
};

func void dia_nagur_auftrag_wann()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Wann_15_00");	//����� ��� ���������� � ����������?
	AI_Output(self,other,"DIA_Nagur_Auftrag_Wann_08_01");	//�� ������ ������� ��� ����� ������. �� ��� ������ ������, ��� ��� ��������� ������� ��� �� ��������. (������� ����)
};

func void dia_nagur_auftrag_okay()
{
	AI_Output(other,self,"DIA_Nagur_Auftrag_Okay_15_00");	//������, ������������.
	AI_Output(self,other,"DIA_Nagur_Auftrag_Okay_08_01");	//�������. ����� �� ���� - �� ���� �� ����������� �������� ����, ���� ����� ����� �� �� ������, ��� � ����� ����������! �� ������� �� ����!
	MIS_NAGUR_BOTE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_NAGUR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NAGUR,LOG_RUNNING);
	b_logentry(TOPIC_NAGUR,"� ������ ��������� ��������� ����� ���� � �������� �������� �� ����������. ����� � ������ ������� ������� � ������� ����� � �������� �� ������.");
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SUCCESS(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 5;
	condition = dia_nagur_success_condition;
	information = dia_nagur_success_info;
	permanent = FALSE;
	description = "� ������ �����.";
};


func int dia_nagur_success_condition()
{
	if((MIS_NAGUR_BOTE == LOG_RUNNING) && (Npc_HasItems(other,itmi_baltrampaket) >= 1) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_success_info()
{
	AI_Output(other,self,"DIA_Nagur_Success_15_00");	//� ������ �����.
	AI_Output(self,other,"DIA_Nagur_Success_08_01");	//�������. ������ ��� ����� ������� ���. ������ ������.
	b_logentry(TOPIC_NAGUR,"����� ������� �������. �� �������� ��� ������� ������.");
	AI_StopProcessInfos(self);
	if(b_giveinvitems(other,self,itmi_baltrampaket,1))
	{
		Npc_RemoveInvItems(self,itmi_baltrampaket,1);
	};
	NAGURDAY = b_getdayplus();
};


instance DIA_NAGUR_DEAL(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 6;
	condition = dia_nagur_deal_condition;
	information = dia_nagur_deal_info;
	permanent = TRUE;
	description = "�� ��� ������ ������?";
};


var int dia_nagur_deal_permanent;

func int dia_nagur_deal_condition()
{
	if((DIA_NAGUR_DEAL_PERMANENT == FALSE) && (MIS_NAGUR_BOTE == LOG_RUNNING) && (NAGUR_AUSGELIEFERT == FALSE) && Npc_KnowsInfo(other,dia_nagur_success))
	{
		return TRUE;
	};
};

func void dia_nagur_deal_info()
{
	AI_Output(other,self,"DIA_Nagur_Deal_15_00");	//�� ��� ������ ������?
	if(b_getdayplus() > NAGURDAY)
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_01");	//��, �� �� ������� �����, ��� �����������. � ������� ������ 300 �����.
		AI_Output(self,other,"DIA_Nagur_Deal_08_02");	//����� ���� ����� ����� ���� ��������...
		AI_Output(self,other,"DIA_Nagur_Deal_08_03");	//� ������ ������� ���� ������� ������� - ���� ������ �� ��, ��� �� ����� ����.
		AI_Output(self,other,"DIA_Nagur_Deal_08_04");	//�������� 240 ������� �����. �� ������� �� ��� ������������. ��� ���� ����.
		AI_Output(self,other,"DIA_Nagur_Deal_08_05");	//�� ������ ���������. � ������� �� ���� ���� ��������.
		AI_Output(self,other,"DIA_Nagur_Deal_08_06");	//��� �� ����� ������ - �� ����.
		b_giveinvitems(self,other,itmi_gold,NAGUR_DEAL);
		MIS_NAGUR_BOTE = LOG_SUCCESS;
		MIS_BALTRAM_SCOUTAKIL = LOG_FAILED;
		b_giveplayerxp(XP_NAGUR_BOTE);
		DIA_NAGUR_DEAL_PERMANENT = TRUE;
		DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Nagur_Deal_08_07");	//���� ��� ���. �� ��� ����� �����. � �� ���� �����������.
	};
};


instance DIA_NAGUR_AUFTRAGGEBER(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_auftraggeber_condition;
	information = dia_nagur_auftraggeber_info;
	permanent = FALSE;
	description = "��� ���� �������?";
};


func int dia_nagur_auftraggeber_condition()
{
	if(MIS_NAGUR_BOTE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_nagur_auftraggeber_info()
{
	AI_Output(other,self,"DIA_Nagur_Auftraggeber_15_00");	//��� ���� �������?
	AI_Output(self,other,"DIA_Nagur_Auftraggeber_08_01");	//�� ���, ������������� �������, ��� � ������ ��� ������ � ����� ����?
};


instance DIA_NAGUR_FAZIT(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_fazit_condition;
	information = dia_nagur_fazit_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_fazit_condition()
{
	if(Npc_KnowsInfo(other,dia_nagur_auftraggeber) && Npc_IsInState(self,zs_talk) && (KNOWS_SECRETSIGN == FALSE))
	{
		return TRUE;
	};
};

func void dia_nagur_fazit_info()
{
	AI_Output(self,other,"DIA_Nagur_Fazit_08_00");	//���� ������ ������, �� � �� ������ � ����� ��������. ��� ��� ������ ������������.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_KNAST(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_knast_condition;
	information = dia_nagur_knast_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_knast_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_NAGUR") <= 1000) && (NAGUR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_knast_info()
{
	AI_Output(self,other,"DIA_Nagur_Knast_08_00");	//�� ������ ����! ��� ���� ������� ������ - � ������ ����������!
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_SIGN(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_sign_condition;
	information = dia_nagur_sign_info;
	permanent = FALSE;
	description = "(�������� ������ �����)";
};


func int dia_nagur_sign_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && (KNOWS_SECRETSIGN == TRUE))
	{
		return TRUE;
	};
};

func void dia_nagur_sign_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Nagur_Sign_08_00");	//��� ���� ������� ���. ������ �� ������, ��� ��� �������.
	AI_Output(self,other,"DIA_Nagur_Sign_08_01");	//�� ������� � ���, ��� ������ ������� ���� - ��� �� ���������, ��� �� �����. �� ���� �� ���, � ������ ��� ����� ��������.
	AI_StopProcessInfos(self);
};


instance DIA_NAGUR_PERM(C_INFO)
{
	npc = vlk_493_nagur;
	nr = 7;
	condition = dia_nagur_perm_condition;
	information = dia_nagur_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_nagur_perm_condition()
{
	if((MIS_NAGUR_BOTE == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_nagur_sign) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_nagur_perm_info()
{
	AI_Output(self,other,"DIA_Nagur_Perm_08_00");	//����� ����-������ ���, ����� ������ ����� ������. � � ���� ������ ������ ��� ��� ����.
	AI_StopProcessInfos(self);
};

