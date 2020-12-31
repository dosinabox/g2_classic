
instance DIA_KARDIF_EXIT(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 999;
	condition = dia_kardif_exit_condition;
	information = dia_kardif_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kardif_exit_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KARDIF_PICKPOCKET(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 900;
	condition = dia_kardif_pickpocket_condition;
	information = dia_kardif_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_kardif_pickpocket_condition()
{
	return c_beklauen(55,85);
};

func void dia_kardif_pickpocket_info()
{
	Info_ClearChoices(dia_kardif_pickpocket);
	Info_AddChoice(dia_kardif_pickpocket,DIALOG_BACK,dia_kardif_pickpocket_back);
	Info_AddChoice(dia_kardif_pickpocket,DIALOG_PICKPOCKET,dia_kardif_pickpocket_doit);
};

func void dia_kardif_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kardif_pickpocket);
};

func void dia_kardif_pickpocket_back()
{
	Info_ClearChoices(dia_kardif_pickpocket);
};


instance DIA_KARDIF_HI(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_hi_condition;
	information = dia_kardif_hi_info;
	permanent = FALSE;
	description = "��� ����?";
};


func int dia_kardif_hi_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_hi_info()
{
	AI_Output(other,self,"DIA_Kardif_Hi_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Kardif_Hi_14_01");	//���� �� ������ ���-������ ������, ���������.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"������ ������� ��������� � ������� � ������.");
};


instance DIA_KARDIF_HALLO(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_hallo_condition;
	information = dia_kardif_hallo_info;
	permanent = FALSE;
	description = "����� �������� �� ������, �� ������ ����� �������...";
};


func int dia_kardif_hallo_condition()
{
	if(Npc_KnowsInfo(other,dia_kardif_hi) && (KARDIF_DEAL == 0))
	{
		return TRUE;
	};
};

func void dia_kardif_hallo_info()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_15_00");	//����� �������� �� ������, �� ������ ����� �������...
	AI_Output(self,other,"DIA_Kardif_Hallo_14_01");	//� ���� ����� �� ����� ����?
	AI_Output(other,self,"DIA_Kardif_Hallo_15_02");	//��� ��� ������ ������� ��� ��������.
	AI_Output(self,other,"DIA_Kardif_Hallo_14_03");	//� ������� � ���� ���� ������?
	AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//������ ����������, ������� � ������ ����, ����� ������ 10 ������� �����.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"������, �������� ������� � ������, �������������� �����������.");
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"� �� ����� ������� �� ���������� ������ 5 �����.",dia_kardif_hallo_angebot);
	Info_AddChoice(dia_kardif_hallo,"������ �� ���� - � ����� ������ ��� ���������� � ������ �����.",dia_kardif_hallo_hart);
	Info_AddChoice(dia_kardif_hallo,"������, ������������.",dia_kardif_hallo_zehn);
};

func void dia_kardif_hallo_zehn()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Zehn_15_00");	//������, ������������.
	AI_Output(self,other,"DIA_Kardif_Hallo_Zehn_14_01");	//�� �������� �������� ������ (����������). � ������ � ����� �������.
	KARDIF_DEAL = 10;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_angebot()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Angebot_15_00");	//� �� ����� ������� �� ���������� ������ 5 �����.
	AI_Output(self,other,"DIA_Kardif_Hallo_Angebot_14_01");	//���, 5 ������� �����? �� ������ �������� ����? (������ ���������� ���) - ����� �������� �� 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"���, ��� �� ������. ����� ����� 6!",dia_kardif_hallo_keindeal);
	Info_AddChoice(dia_kardif_hallo,"������������, 7 ������� ����� - �������� ����.",dia_kardif_hallo_sieben);
};

func void dia_kardif_hallo_hart()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Hart_15_00");	//������ �� ���� - � ����� ������ ��� ���������� � ������ �����.
	AI_Output(self,other,"DIA_Kardif_Hallo_Hart_14_01");	//������, ������... � �������� � �� 7.
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"������������, 7 ������� ����� - �������� ����.",dia_kardif_hallo_sieben);
	Info_AddChoice(dia_kardif_hallo,"���, ��� �� ��� �� ������ ����� ���� ����������.",dia_kardif_hallo_ablehnen);
};

func void dia_kardif_hallo_sieben()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Sieben_15_00");	//������������, 7 ������� ����� - �������� ����.
	AI_Output(self,other,"DIA_Kardif_Hallo_Sieben_14_01");	//(����������) ������ �������. ��, ���� ���� ����� ����� ���-�� ������, ��������� �� ���.
	KARDIF_DEAL = 7;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_ablehnen()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Ablehnen_15_00");	//���, ��� �� ��� �� ������ ����� ���� ����������.
	AI_Output(self,other,"DIA_Kardif_Hallo_Ablehnen_14_01");	//��, �������... (��������) - ������, 5 ������� �����. �� ��� ��� ��������� ����!
	Info_ClearChoices(dia_kardif_hallo);
	Info_AddChoice(dia_kardif_hallo,"� ������ ������ ���� ����� ������� �� ����?",dia_kardif_hallo_fuenf);
};

func void dia_kardif_hallo_fuenf()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_Fuenf_15_00");	//� ������ ������ ���� ����� ������� �� ����?
	AI_Output(self,other,"DIA_Kardif_Hallo_Fuenf_14_01");	//��, � ������ ������ �� � ������ �����. ��, ��� �� �� �� ���� - ������ ���� ������.
	KARDIF_DEAL = 5;
	Info_ClearChoices(dia_kardif_hallo);
};

func void dia_kardif_hallo_keindeal()
{
	AI_Output(other,self,"DIA_Kardif_Hallo_KeinDeal_15_00");	//���, ��� �� ������. ����� ����� 6!
	AI_Output(self,other,"DIA_Kardif_Hallo_KeinDeal_14_01");	//�� ����������� �������, ����� � ����. ��, ���� �� ��� �����������, ���������� ���� ��������� � 6 ������� �����.
	KARDIF_DEAL = 6;
	Info_ClearChoices(dia_kardif_hallo);
};


instance DIA_KARDIF_TRADE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_trade_condition;
	information = dia_kardif_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "��� ��� ���-������ ������.";
};


func int dia_kardif_trade_condition()
{
	if(KARDIF_ONEQUESTION == FALSE)
	{
		return TRUE;
	};
};

func void dia_kardif_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Kardif_TRADE_15_00");	//��� ��� ���-������ ������.
};


instance DIA_KARDIF_TRADEINFO(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_tradeinfo_condition;
	information = dia_kardif_tradeinfo_info;
	permanent = TRUE;
	description = "��� ����� ����������.";
};


func int dia_kardif_tradeinfo_condition()
{
	if((KARDIF_ONEQUESTION == FALSE) && (KARDIF_DEAL > 0))
	{
		return TRUE;
	};
};

func void dia_kardif_tradeinfo_info()
{
	AI_Output(other,self,"DIA_Kardif_TradeInfo_15_00");	//��� ����� ����������.
	KARDIF_ONEQUESTION = TRUE;
};

func void b_saykardifzuweniggold()
{
	AI_Output(self,other,"B_SayKardifZuwenigGold_14_00");	//�����������, ����� � ���� ����� ���������� ������.
};


instance DIA_KARDIF_BUERGER(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_buerger_condition;
	information = dia_kardif_buerger_info;
	permanent = TRUE;
	description = "��� ��������� ������������ ������ � ���� ������?";
};


var int dia_kardif_buerger_permanent;

func int dia_kardif_buerger_condition()
{
	if((DIA_KARDIF_BUERGER_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_buerger_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Buerger_15_00");	//��� ��������� ������������ ������ � ���� ������?
		AI_Output(self,other,"DIA_Kardif_Buerger_14_01");	//�����, � �����, �� ������ �� ��� �� �������. ������������ ����������� ������� ����� - ��� �����.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_02");	//���� ��������� �� ����� ���������, �� � ���� ���� ������, � ������ ����������� �������� ������ ��� ������.
		AI_Output(self,other,"DIA_Kardif_Buerger_14_03");	//�������� � ������� ���� ����� ����������� ���� - � ���� �������, ���� ���� ��������� ��� ������.
		DIA_KARDIF_BUERGER_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_LEHMAR(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_lehmar_condition;
	information = dia_kardif_lehmar_info;
	permanent = TRUE;
	description = "��� ������ ������?";
};


var int dia_kardif_lehmar_permanent;

func int dia_kardif_lehmar_condition()
{
	if((DIA_KARDIF_LEHMAR_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_BUERGER_PERMANENT == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_lehmar_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Add_15_00");	//��� ������ ������?
		AI_Output(self,other,"DIA_Kardif_Add_14_01");	//(�������) ���� �� ������ ������ ���, ���� ����� ��������� � ��� ��������.
		AI_Output(self,other,"DIA_Kardif_Add_14_02");	//������ ��� ����� ����� �������� ������� ���������.
		AI_Output(self,other,"DIA_Kardif_Add_14_03");	//��������� ��� ��������, �� ������ ����� ��� � �����...
		DIA_KARDIF_LEHMAR_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_ARBEIT(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_arbeit_condition;
	information = dia_kardif_arbeit_info;
	permanent = TRUE;
	description = "��� � ���� ����� ������?";
};


var int dia_kardif_arbeit_permanent;

func int dia_kardif_arbeit_condition()
{
	if((DIA_KARDIF_ARBEIT_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_arbeit_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Arbeit_15_00");	//��� � ���� ����� ������?
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_01");	//�� ���� �� ������� ������ �����, � �����. ���� ����� ���������� � �������� � ������ ����� ������.
		AI_Output(self,other,"DIA_Kardif_Arbeit_14_02");	//�� ���� � ���� ���� ��������� ���, �� ������ ������� ������� �� ��������. �� ������� ��� �� �������, �� ��������� �� ������.
		DIA_KARDIF_ARBEIT_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_LERNEN(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_lernen_condition;
	information = dia_kardif_lernen_info;
	permanent = TRUE;
	description = "� � ���� ����� ����� ��������� ����-������?";
};


var int dia_kardif_lernen_permanent;

func int dia_kardif_lernen_condition()
{
	if((DIA_KARDIF_LERNEN_PERMANENT == FALSE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_lernen_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Lernen_15_00");	//� � ���� ����� ����� ��������� ����-������?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_01");	//�����, � �������� �������� ���� ��������� ������� �����.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_02");	//����, ������, - ������� ������. �������, �� ������ ������ ���� ����� �������.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_03");	//������ ������ � ������ ����������. � ����� - ��������, ����� ���� �� �������. �� ���� ������� ������ � ����.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_04");	//� ���� �� ��������� ����� �� ���, ����� ����� � ������� ������ - �� ����� ���� � �����... �����... ������.
		AI_Output(other,self,"DIA_Kardif_Lernen_15_05");	//� ��� ��� ����� ���� ���� �����?
		AI_Output(self,other,"DIA_Kardif_Lernen_14_06");	//(������) ����, ������ ������ �������� ����� ������ �����, ������ ��� � ���� ������� ��� ���.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_07");	//������ ��������� � �������� ��������, �� ����������� ������� ��. � ���� �� ������ ����� ��������������� �����, ����� � �������� � ���� � ���� �����.
		AI_Output(self,other,"DIA_Kardif_Lernen_14_08");	//��� ������ ����� �����. �� ����� � �������� ���� ������� �� ����� ��������. (��������) � ������ ��� ����� � ��� ���� ������ �� ��� ����������.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"����, ������ � �������� ��������, ����� ������� ���� �������.");
		b_logentry(TOPIC_CITYTEACHER,"����� ����� ������ ��� �������� ��� ��������.");
		b_logentry(TOPIC_CITYTEACHER,"������ ����� ������� ���� ��������� �������� ���������� �������. �� ��������� �� ������� � �������� ��������.");
		b_logentry(TOPIC_CITYTEACHER,"����� ����� �������� ��� ������� ������������� �����. �� ����� � �������� ��������.");
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"������� ������ ����� � ������� �� � ������.");
		DIA_KARDIF_LERNEN_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DIEBESWERK(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_diebeswerk_condition;
	information = dia_kardif_diebeswerk_info;
	permanent = TRUE;
	description = "� ��� �� ����� �����-������ '������' ������ ...?";
};


var int dia_kardif_diebeswerk_permanent;

func int dia_kardif_diebeswerk_condition()
{
	if((DIA_KARDIF_DIEBESWERK_PERMANENT == FALSE) && (DIA_KARDIF_ARBEIT_PERMANENT == TRUE) && (KARDIF_ONEQUESTION == TRUE))
	{
		return TRUE;
	};
};

func void dia_kardif_diebeswerk_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk_15_00");	//� ��� �� ����� �����-������ '������' ������, ��� �� �������� ��������� ���������� �����?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_01");	//����-������ �������, ��������? ���...
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other,"DIA_Kardif_Diebeswerk_14_02");	//...�������� ���������� � �������. ��������, �� ������ ������ ����.
		DIA_KARDIF_DIEBESWERK_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DIEBESWERK2(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_diebeswerk2_condition;
	information = dia_kardif_diebeswerk2_info;
	permanent = TRUE;
	description = "���� ���-������ '���������' ��� ����?";
};


var int dia_kardif_diebeswerk2_permanent;

func int dia_kardif_diebeswerk2_condition()
{
	if((DIA_KARDIF_DIEBESWERK2_PERMANENT == FALSE) && (DIA_KARDIF_DIEBESWERK_PERMANENT == TRUE) && (DIA_KARDIF_ARBEIT_PERMANENT == TRUE) && (KARDIF_ONEQUESTION == TRUE) && (other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_MIL) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_kardif_diebeswerk2_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_00");	//���� ���-������ '���������' ��� ����?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_01");	//��, ���� ���-��� - �� ��� ������������ ����, ������ ���� �� ������� ��������������� ���������.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_02");	//����������, ��� ��� � ����?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_03");	//��, � ������, �������� ������� �� �����, ������ ������ �����, ��� ����.
		AI_Output(other,self,"DIA_Kardif_Diebeswerk2_15_04");	//�?
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_05");	//��� ��� ���� ����� ��������, ��������� ���������� ��� ���� �������� ���������.
		AI_Output(self,other,"DIA_Kardif_Diebeswerk2_14_06");	//�������, ��� ���� ����� ����� � ����� ��������� ���������. �� �� ������ �� ������ �� ����, �������?
		DIA_KARDIF_DIEBESWERK2_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_ZURUECK(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_zurueck_condition;
	information = dia_kardif_zurueck_info;
	permanent = TRUE;
	description = DIALOG_BACK;
};


func int dia_kardif_zurueck_condition()
{
	if(KARDIF_ONEQUESTION == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_zurueck_info()
{
	KARDIF_ONEQUESTION = FALSE;
	Info_ClearChoices(dia_kardif_zurueck);
};


instance DIA_KARDIF_DOPE(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 5;
	condition = dia_kardif_dope_condition;
	information = dia_kardif_dope_info;
	permanent = TRUE;
	description = "��� ��� ����� ������ ������?";
};


var int dia_kardif_dope_perm;

func int dia_kardif_dope_condition()
{
	if((MIS_ANDRE_REDLIGHT == LOG_RUNNING) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_DOPE_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_dope_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Kardif_DOPE_15_01");	//��� ��� ����� ������ ������?
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_00");	//������ �� ����� - � �� ���� ���� � ��������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Kardif_DOPE_14_02");	//������ �� �����.
		AI_Output(other,self,"DIA_Kardif_DOPE_15_03");	//�����, ����� ���?
		AI_Output(self,other,"DIA_Kardif_DOPE_14_04");	//� �� �� ����� ����� ��������� � �������� - �� ����� ��� ����� ��������.
		DIA_KARDIF_DOPE_PERM = TRUE;
	};
};


instance DIA_KARDIF_PAKET(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 3;
	condition = dia_kardif_paket_condition;
	information = dia_kardif_paket_info;
	permanent = TRUE;
	description = "�� ���-������ ������ � ���� �������� �����?";
};


var int dia_kardif_paket_perm;

func int dia_kardif_paket_condition()
{
	if((MIS_ANDRE_WAREHOUSE == LOG_RUNNING) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_PAKET_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_paket_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Paket_15_00");	//�� ���-������ ������ � ���� �������� �����?
		AI_Output(self,other,"DIA_Kardif_Paket_14_01");	//���, ��� ������� ���� ����� - ������� �������. �, ��������, ������ ������������� �����!
		AI_Output(other,self,"DIA_Kardif_Paket_15_02");	//�� ������� �������� ����. �� ���-�� ������. �����, ����������!
		AI_Output(self,other,"DIA_Kardif_Paket_14_03");	//������, ������ - ���� ������ ������� ������� � ��� �������. �� �� ���������.
		AI_Output(self,other,"DIA_Kardif_Paket_14_04");	//�� ������, ��� ������ ��� �������� ����� � ������, ��, ������� ��, �� ��� ���������� � ����. ��� ���, ��� � ����.
		DIA_KARDIF_PAKET_PERM = TRUE;
		b_logentry(TOPIC_WAREHOUSE,"������ ������� � ���������. � ����� ����� ���� ��� �������� �����, ������� �� ����� �������.");
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_SENDATTILA(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_sendattila_condition;
	information = dia_kardif_sendattila_info;
	important = TRUE;
};


func int dia_kardif_sendattila_condition()
{
	if((MIS_THIEFGUILD_SUCKED == TRUE) || ((DIEBESGILDE_OKAY >= 3) && Npc_IsInState(self,zs_talk)))
	{
		return TRUE;
	};
};

func void dia_kardif_sendattila_info()
{
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_00");	//��, ��, ��� ����. � ���� ���-��� ���� ��� ����.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_01");	//���� ������ ����� ����� ���������� � �����.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_02");	//��� ��� �� �� ����� ���� �����, �� �������� ���� �������� ���� �������.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_03");	//�� ����� ����������� � �����. �� ������ ������ �������.
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_04");	//��� ���������� ��������� - �� ��� ����������! ���� �� ��� ��������� �������� �������.
	AI_Output(other,self,"DIA_Kardif_SENDATTILA_15_05");	//��� �������� ���� ������?
	AI_Output(self,other,"DIA_Kardif_SENDATTILA_14_06");	//� ��� �� ������� ���� - �� ���� �������� ��������� �� ���, ��� ����. (����������)
	if(KARDIF_DEAL == 0)
	{
		AI_Output(self,other,"DIA_Kardif_Hallo_14_04");	//������ ����������, ������� � ������ ����, ����� ������ 10 ������� �����.
		KARDIF_DEAL = 10;
	};
	Wld_InsertNpc(vlk_494_attila,"NW_CITY_ENTRANCE_01");
};


instance DIA_KARDIF_KERL(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_kerl_condition;
	information = dia_kardif_kerl_info;
	permanent = TRUE;
	description = "��� �������� ���� ������?";
};


var int dia_kardif_kerl_permanent;

func int dia_kardif_kerl_condition()
{
	if(Npc_KnowsInfo(other,dia_kardif_sendattila) && (attila.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KARDIF_ONEQUESTION == TRUE) && (DIA_KARDIF_KERL_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_kardif_kerl_info()
{
	if(b_giveinvitems(other,self,itmi_gold,KARDIF_DEAL))
	{
		AI_Output(other,self,"DIA_Kardif_Kerl_15_00");	//��� �������� ���� ������?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_01");	//��, �� �������� �������, ���������� � ������� - �� �� �� ����� ��������. �����-�� ��... ��������.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_02");	//� ��� ����?
		AI_Output(self,other,"DIA_Kardif_Kerl_14_03");	//��� ����? ����� �� ������ �� ����, � ��� ���, ��� �� ������ �� �� ����.
		AI_Output(self,other,"DIA_Kardif_Kerl_14_04");	//� ��� ������ ���� ���-�� �������� - ��, ��� �� �� �� ����, � �����, �� ������ �����, ���������� � ���. ��� ������ ���� ���������.
		AI_Output(other,self,"DIA_Kardif_Kerl_15_05");	//��... ���� ������ � ���, ��� ����...
		DIA_KARDIF_KERL_PERMANENT = TRUE;
	}
	else
	{
		b_saykardifzuweniggold();
	};
};


instance DIA_KARDIF_DEFEATEDATTILA(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_defeatedattila_condition;
	information = dia_kardif_defeatedattila_info;
	permanent = FALSE;
	description = "���� ������� ������� ����� ����!";
};


func int dia_kardif_defeatedattila_condition()
{
	if(Npc_KnowsInfo(other,dia_attila_hallo))
	{
		return TRUE;
	};
};

func void dia_kardif_defeatedattila_info()
{
	AI_Output(other,self,"DIA_Kardif_DEFEATEDATTILA_15_00");	//���� ������� ������� ����� ����!
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_01");	//��, ������ ��� ���� �����? � ������ ������� ����������.
	AI_Output(self,other,"DIA_Kardif_DEFEATEDATTILA_14_02");	//���� ���-�� ����� �������� ����, � �����, � ���� ���� ������ �������.
	b_giveplayerxp(XP_KARDIF_BLAME4ATTILA);
	b_killnpc(attila);
	Npc_RemoveInvItem(attila,itmi_oldcoin);
};


instance DIA_KARDIF_ZEICHEN(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 2;
	condition = dia_kardif_zeichen_condition;
	information = dia_kardif_zeichen_info;
	permanent = FALSE;
	description = "(�������� ������ �����)";
};


func int dia_kardif_zeichen_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_00");	//��, �� ������ ���� � ������. ������. � ����� ������, � ���� ���-��� ���� ��� ����.
	AI_Output(self,other,"DIA_Kardif_Zeichen_14_01");	//(���������) ���� ���� ����������� �������, �������. � ������ ��������� �� ������ ������. ������ ������� ���� ������ ���� �������.
	CreateInvItems(self,itke_lockpick,20);
};


instance DIA_KARDIF_CREW(C_INFO)
{
	npc = vlk_431_kardif;
	nr = 51;
	condition = dia_kardif_crew_condition;
	information = dia_kardif_crew_info;
	permanent = FALSE;
	description = "��� ��� ��� ����� �������.";
};


func int dia_kardif_crew_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_kardif_crew_info()
{
	AI_Output(other,self,"DIA_Kardif_Crew_15_00");	//��� ��� ��� ����� �������.
	AI_Output(self,other,"DIA_Kardif_Crew_14_01");	//������� ������ �������, �������. �� �� ������� �������� �� ���� ��������. ����������� �� ��� ����� �������� �����.
	AI_Output(self,other,"DIA_Kardif_Crew_14_02");	//�� � ������� ��������� ����� �������� ������� ��������� ���������� ������, � �������� ������ ������� �� ��� �������� �������.
	AI_Output(other,self,"DIA_Kardif_Crew_15_03");	//��� � ���� ����� ��������?
	AI_Output(self,other,"DIA_Kardif_Crew_14_04");	//�� ����������� �� �� ������. � ������� ����������.
	if(Npc_IsDead(jack) == FALSE)
	{
		if(SCGOTCAPTAIN == FALSE)
		{
			Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
			b_logentry(TOPIC_CAPTAIN,"������ �������� ���� � ������� �����. ��������, �� ������ ������ ���");
		};
		AI_Output(self,other,"DIA_Kardif_Crew_14_05");	//���, �������� �� ������ ������. �� ��������� � ���� �����, ������� � ���� �����. � ���, ��� �������� �������� ����, ��� ��� �������, ��� ���� �����.
	};
};

