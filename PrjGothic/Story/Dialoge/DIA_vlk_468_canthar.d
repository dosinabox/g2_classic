
instance DIA_CANTHAR_PICKPOCKET(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 900;
	condition = dia_canthar_pickpocket_condition;
	information = dia_canthar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_canthar_pickpocket_condition()
{
	return c_beklauen(20,25);
};

func void dia_canthar_pickpocket_info()
{
	Info_ClearChoices(dia_canthar_pickpocket);
	Info_AddChoice(dia_canthar_pickpocket,DIALOG_BACK,dia_canthar_pickpocket_back);
	Info_AddChoice(dia_canthar_pickpocket,DIALOG_PICKPOCKET,dia_canthar_pickpocket_doit);
};

func void dia_canthar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_canthar_pickpocket);
};

func void dia_canthar_pickpocket_back()
{
	Info_ClearChoices(dia_canthar_pickpocket);
};


instance DIA_CANTHAR_EXIT(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 999;
	condition = dia_canthar_exit_condition;
	information = dia_canthar_exit_info;
	permanent = TRUE;
	description = "��� ����� ����!";
};


func int dia_canthar_exit_condition()
{
	return TRUE;
};

func void dia_canthar_exit_info()
{
	AI_Output(other,self,"DIA_Canthar_EXIT_15_00");	//��� ����� ����!
	AI_Output(self,other,"DIA_Canthar_EXIT_09_01");	//��� ������.
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_PERSONALCRIMES(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_personalcrimes_condition;
	information = dia_canthar_personalcrimes_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_canthar_personalcrimes_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void dia_canthar_personalcrimes_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_00");	//��� ���� ����� ����� � ����� ������� ��������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_01");	//(����������) �� �����, ��� ��� ������ ������� ���������� �� ����?
	};
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_09_02");	//���� �� ������ ����������, ���� � ����������, ����� �� ������ ������� � ���, ��� ������!
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_15_03");	//� ��� ������ �� ���� � ����?
	b_say_gold(self,other,100);
	Info_ClearChoices(dia_canthar_personalcrimes);
	Info_AddChoice(dia_canthar_personalcrimes,"� ���� ��� �������!",dia_canthar_personalcrimes_notenough);
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_canthar_personalcrimes,"��� ���� ������ - ����� ������� �� ����!",dia_canthar_personalcrimes_pay);
	};
};

func void dia_canthar_personalcrimes_pay()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_Pay_15_00");	//��� ���� ������ - ����� ������� �� ����!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_Pay_09_01");	//����� ������� � ����� �������!
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_canthar_personalcrimes_notenough()
{
	AI_Output(other,self,"DIA_Canthar_PersonalCRIMES_NotEnough_15_00");	//� ���� ��� �������!
	AI_Output(self,other,"DIA_Canthar_PersonalCRIMES_NotEnough_09_01");	//����� ����� �� ������� ������� ��� �����?
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_HALLO(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_hallo_condition;
	information = dia_canthar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_canthar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_hallo_info()
{
	var C_ITEM itm;
	itm = Npc_GetEquippedArmor(other);
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_00");	//����������, ��� � ��� �����!
		AI_Output(self,other,"DIA_Canthar_Hallo_09_01");	//�� ���� ����� � ����� - � �� ����?
		AI_Output(other,self,"DIA_Canthar_Hallo_15_02");	//����� ����.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_03");	//��! (�������) �� ����� �� �������! ��� ������� ������������ � �����.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_04");	//��������, �� ���� ������ ��������� �� �������.
		AI_Output(self,other,"DIA_Canthar_Hallo_09_05");	//(���������) ���� �� �������, ������ �� ������. �� ��� �������, � ���� ���� ���������� ����������� ��� ����...
		CANTHAR_GOTME = TRUE;
	}
	else if(Hlp_IsItem(itm,itar_bau_l) || Hlp_IsItem(itm,itar_bau_m))
	{
		AI_Output(self,other,"DIA_Canthar_HelloArmor_09_06");	//��� ���� ������, ����������?
		Info_ClearChoices(dia_canthar_hallo);
		Info_AddChoice(dia_canthar_hallo,"� ����� �� �������?",dia_canthar_hallo_nobauer);
		Info_AddChoice(dia_canthar_hallo,"��� �� �� ��� ����������.",dia_canthar_hallo_bauer);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_Hallo_09_07");	//��� � ���� ������� ��� ����?
	};
};

func void dia_canthar_hallo_bauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_Bauer_15_00");	//��� �� �� ��� ����������.
	AI_Output(self,other,"DIA_Canthar_Hallo_Bauer_09_01");	//���� � ���-������ ������� ��� ����?
	Info_ClearChoices(dia_canthar_hallo);
};

func void dia_canthar_hallo_nobauer()
{
	AI_Output(other,self,"DIA_Canthar_Hallo_NoBauer_15_00");	//� ����� �� �������?
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_01");	//�� ��������� ��� ������. �� �������� ������ �� ���, ��� ���!
	AI_Output(self,other,"DIA_Canthar_Hallo_NoBauer_09_02");	//(� ���������) ���� � �� � ��� �� ��������, � ���� ���� ���������� ����������� ��� ����...
	CANTHAR_GOTME = TRUE;
	Info_ClearChoices(dia_canthar_hallo);
};


instance DIA_CANTHAR_WHATOFFER(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 1;
	condition = dia_canthar_whatoffer_condition;
	information = dia_canthar_whatoffer_info;
	permanent = FALSE;
	description = "��� �� ������ ���������� ���?";
};


func int dia_canthar_whatoffer_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_hallo))
	{
		return TRUE;
	};
};

func void dia_canthar_whatoffer_info()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_15_00");	//��� �� ������ ���������� ���?
	if(CANTHAR_GOTME == TRUE)
	{
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_01");	//���� �� ����, ��� �� ���������, ������ ������� �� ������ ���� � �����.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_02");	//"(��������) ���� �� ������ �������� ��� �� ""�����������"" �� ������� � �����, ��� �������� �� ����, ��� ������� �� ������ ���� � �����."
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_03");	//� ���� ������ ���� ������� � �����.
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_04");	//� ���� ���� ��� ���� ������ ������. � ����������� ������� � �������� �����������. �������.
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Canthar_WhatOffer_09_05");	//� ���� ��������� � ������� �� ������� �������� ����� � �����, � ������ �������� ���������� ����.
		};
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_06");	//���� ��� ���������?
		Info_ClearChoices(dia_canthar_whatoffer);
		Info_AddChoice(dia_canthar_whatoffer,"���! ������ ��� ������ ����!",dia_canthar_whatoffer_no);
		Info_AddChoice(dia_canthar_whatoffer,"��� �� ������ �� ���� �������?",dia_canthar_whatoffer_price);
		Info_AddChoice(dia_canthar_whatoffer,"� ��� �� �������� � �����?",dia_canthar_whatoffer_howyouin);
		Info_AddChoice(dia_canthar_whatoffer,"��� ������ �� ������...",dia_canthar_whatoffer_strings);
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_WhatOffer_09_07");	//� �������� ��������. � ������ ����.
	};
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"������ ������� ��������� �������.");
};

func void dia_canthar_whatoffer_strings()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Strings_15_00");	//��� ������ �� ������...
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Strings_09_01");	//���! �������� �������. �� ������ ������� ��� ������.
};

func void dia_canthar_whatoffer_howyouin()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_HowYouIn_15_00");	//� ��� �� �������� � �����?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_HowYouIn_09_01");	//������ ����� ����. � ������ ����� ��, ��� ������� ��� �������.
};

func void dia_canthar_whatoffer_price()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_00");	//��� �� ������ �� ���� �������?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_01");	//(��������������) � ����, ��� �� ������ � ����!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_02");	//��������. �� �������� �� ���� �������. ����� ������!
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Price_15_03");	//������ ���?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_04");	//��. ��: ���� � ������� ���� � ������, �� ������ ������ ������� ��� ������.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Price_09_05");	//�� ���, ������������?
	Info_AddChoice(dia_canthar_whatoffer,"�������. ����� ���� ��� ������.",dia_canthar_whatoffer_ok);
};

func void dia_canthar_whatoffer_ok()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_Ok_15_00");	//�������. ����� ���� ��� ������.
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_01");	//�����. �� ��������� � ��� ���������, ��� ����� ������.
	CreateInvItems(self,itwr_passierschein,1);
	b_giveinvitems(self,other,itwr_passierschein,1);
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_02");	//� ��� ����: ���� � �� ����� �������� ���� �����!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_Ok_09_03");	//� �������� � ���� ����� ������� ������� � ������ - ������ ��� ��� ���� � ��� �� ������, �� ������ ���!
	CANTHAR_GEFALLEN = TRUE;
	Info_ClearChoices(dia_canthar_whatoffer);
	Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
	b_logentry(TOPIC_CITY,"� ������� ������� � �������� �������, ������� �������� ��� ������� � �����. ������, � ������ ������� ��� ������ � ��������� ���, ����� ����� ��� � ������.");
};

func void dia_canthar_whatoffer_no()
{
	AI_Output(other,self,"DIA_Canthar_WhatOffer_No_15_00");	//���! ������ ��� ������ ����!
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_01");	//��. ������, � ���������� ����, �?
	AI_Output(self,other,"DIA_Canthar_WhatOffer_No_09_02");	//�����. ���� ����� ���-������ ���? ����� ���� �������� ��� ������?
	Info_ClearChoices(dia_canthar_whatoffer);
};


instance DIA_CANTHAR_TRADE(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 888;
	condition = dia_canthar_trade_condition;
	information = dia_canthar_trade_info;
	permanent = TRUE;
	description = "������ ��� ���� ������!";
	trade = TRUE;
};


func int dia_canthar_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_whatoffer))
	{
		return TRUE;
	};
};

func void dia_canthar_trade_info()
{
	AI_Output(other,self,"DIA_Canthar_TRADE_15_00");	//������ ��� ���� ������!
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Canthar_TRADE_09_01");	//�������.
};


instance DIA_CANTHAR_PAYPRICEINCITY(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_paypriceincity_condition;
	information = dia_canthar_paypriceincity_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_canthar_paypriceincity_condition()
{
	if((CANTHAR_INSTADT == TRUE) && (Npc_IsDead(sarah) == FALSE) && (CANTHAR_GOTME == TRUE))
	{
		return TRUE;
	};
};

func void dia_canthar_paypriceincity_info()
{
	if(CANTHAR_GEFALLEN == TRUE)
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_00");	//�� ����� ������. � ������ ����� ������� ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_01");	//��, ��, � ���� ���� ����������� ��� ����.
	};
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_02");	//��� �� ������?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_03");	//� ���� ������� ��� ������ �������� �� �������� �������. ���� ����� ��� � ����.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_04");	//� � ����, ����� ��� ������� ��� ���� �������� �����.
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_05");	//� ��� ���� � ���� �����?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_06");	//� ��� ���� ������, ������� �� ������ ��������� � �� ������.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_07");	//����� �� ������� � ����� � ������� ���, ��� ���� ������� ������ �����.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_08");	//�� ������� � ������, �� �������� �������, � � ���� ��������.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_09");	//� ���� ���� ��� ��� �� ���������� �����.
	if(CANTHAR_GEFALLEN == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_15_10");	//� ��� ��� � ����� �����?
		AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_09_11");	//����� � ����� ���� ��������, �� �������� ������ �� ���� - ����� ������� ������.
	};
	Info_ClearChoices(dia_canthar_paypriceincity);
	Info_AddChoice(dia_canthar_paypriceincity,"���, � �� ���� ����������� � ����.",dia_canthar_paypriceincity_nein);
	Info_AddChoice(dia_canthar_paypriceincity,"������, � ������ ���.",dia_canthar_paypriceincity_ok);
	Info_AddChoice(dia_canthar_paypriceincity,"� ��� �����, ���� � ��������?",dia_canthar_paypriceincity_if);
};

func void dia_canthar_paypriceincity_if()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_if_15_00");	//� ��� �����, ���� � ��������?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_01");	//��� ����� ����� ����� � ����� �������. ���������, � ����, ��� �� ������ ���������.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_if_09_02");	//���� �� ���� �������� ���������, ��� ������� ������������ ���� ����� ��������� � ������...
};

func void dia_canthar_paypriceincity_nein()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Nein_15_00");	//���, � �� ���� ����������� � ����.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Nein_09_01");	//��� ���� �������� �������, ��� �������. �� �� ��� ���������.
	MIS_CANTHARS_KOMPROBRIEF = LOG_OBSOLETE;
	b_checklog();
	Info_ClearChoices(dia_canthar_paypriceincity);
};

func void dia_canthar_paypriceincity_ok()
{
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_00");	//������, ������, � ���� ��� ������.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_01");	//�� ��������������� ������. ���, ����� ������.
	CreateInvItems(self,itwr_canthars_komprobrief_mis,1);
	b_giveinvitems(self,other,itwr_canthars_komprobrief_mis,1);
	AI_Output(other,self,"DIA_Canthar_PAYPRICEINCITY_Ok_15_02");	//� ��� � ������� �� ��� ������?
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_03");	//����� ��� ������� ���� ���� ������ - � ���� ��� ����� ������ ���, �� ��������� �� ������.
	AI_Output(self,other,"DIA_Canthar_PAYPRICEINCITY_Ok_09_04");	//� �����, � ����� ����������� �������, ��� ��� �� ������� �������� ����.
	MIS_CANTHARS_KOMPROBRIEF = LOG_RUNNING;
	MIS_CANTHARS_KOMPROBRIEF_DAY = Wld_GetDay();
	Log_CreateTopic(TOPIC_CANTHAR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CANTHAR,LOG_RUNNING);
	if(CANTHAR_GEFALLEN == TRUE)
	{
		b_logentry(TOPIC_CANTHAR,"������ �����, ����� � ������ ��� ������, ��� ������.");
	}
	else
	{
		b_logentry(TOPIC_CANTHAR,"������ �������� ���� ��� ������, ������ �� ��������� ��� ������.");
	};
	b_logentry(TOPIC_CANTHAR,"� ������ ��������� ������ �������� ����, ������� ���� ����� ����������� �� � ���, ��� ��� ������� ������ �����. ����� � ������ ����� � ����� ����� � ��������� �� ���.");
	Info_ClearChoices(dia_canthar_paypriceincity);
};


instance DIA_CANTHAR_SARAHERLEDIGT(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_saraherledigt_condition;
	information = dia_canthar_saraherledigt_info;
	permanent = TRUE;
	description = "������ ����...";
};


func int dia_canthar_saraherledigt_condition()
{
	if(MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_canthar_saraherledigt_info()
{
	if(Npc_IsDead(sarah) == FALSE)
	{
		if(MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() + 2))
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_00");	//� ���� ��� ������ ��� ����?
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_01");	//������� ������� ������ ����, � ����� ����� � ����� � ������ ��.
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_02");	//������ �� ���. � �� ������� �������� ����, �� ��������� �� ����.
		}
		else
		{
			AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_03");	//�� ������� ������� ���� ����������� �����. �� ����!
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Canthar_SARAHERLEDIGT_15_04");	//���� ������.
		AI_Output(self,other,"DIA_Canthar_SARAHERLEDIGT_09_05");	//������? �����������. ������, �� �������� ���� ����� ����� ��������� ������.
		MIS_CANTHARS_KOMPROBRIEF = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
		Npc_ExchangeRoutine(self,"MARKTSTAND");
	};
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_SUCCESS(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_success_condition;
	information = dia_canthar_success_info;
	permanent = FALSE;
	description = "������ ����...";
};


func int dia_canthar_success_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_SUCCESS) && (Npc_IsDead(sarah) == FALSE))
	{
		return TRUE;
	};
};

func void dia_canthar_success_info()
{
	AI_Output(self,other,"DIA_Canthar_Success_09_00");	//�������. ���� ����������� ����, ��� �� ����� �����.
	AI_Output(self,other,"DIA_Canthar_Success_09_01");	//� ������ �� ������, ��� ���, ���� ���� ����� ������, ������ �� ���.
	if(KAPITEL == 1)
	{
		CreateInvItems(self,itmw_shortsword3,1);
		CreateInvItems(self,itmw_shortsword4,1);
		CreateInvItems(self,itmw_shortsword5,1);
		CreateInvItems(self,itmw_kriegshammer1,1);
		CreateInvItems(self,itmw_1h_vlk_sword,1);
		CreateInvItems(self,itmw_1h_nov_mace,1);
	};
	if(KAPITEL == 2)
	{
		CreateInvItems(self,itmw_stabkeule,1);
		CreateInvItems(self,itmw_steinbrecher,1);
		CreateInvItems(self,itmw_schwert2,1);
		CreateInvItems(self,itmw_bartaxt,1);
	};
	if(CANTHAR_GEFALLEN == FALSE)
	{
		AI_Output(other,self,"DIA_Canthar_Success_15_02");	//�� ��������� ���� ��� ������.
		AI_Output(self,other,"DIA_Canthar_Success_09_03");	//���������. ���, ��� ������ - ������������ ���������� ���������.
		b_giveinvitems(self,other,itmw_schiffsaxt,1);
	};
	b_giveplayerxp(XP_CANTHARS_KOMPROBRIEF);
};


instance DIA_CANTHAR_AGAIN(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 5;
	condition = dia_canthar_again_condition;
	information = dia_canthar_again_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_canthar_again_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_again_info()
{
	AI_Output(self,other,"DIA_Canthar_Again_09_00");	//��, ����� ��.
	if(MIS_CANTHARS_KOMPROBRIEF == LOG_FAILED)
	{
		AI_Output(other,self,"DIA_Canthar_Again_15_01");	//������ �� �� � ������?
		AI_Output(self,other,"DIA_Canthar_Again_09_02");	//���� ���������. ��� � ��� ������� ���� - � ����� ����������� ������� � ���� ������.
	}
	else if(MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_03");	//������, � ���������� � ����� ���. �� ������ ������ �� ���� ���� � �������.
	}
	else if(MIS_CANTHARS_KOMPROBRIEF == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Canthar_Again_09_04");	//����� � �� ������������ ����? ���� �� �����, ���� �� �� ����� ��, ��� � ������.
	};
	AI_Output(self,other,"DIA_Canthar_Again_09_05");	//������ ��� �������� ������, ��� �� ������ ���������.
	AI_Output(self,other,"DIA_Canthar_Again_09_06");	//����� ������� - ������ �� �� ������� ������ �� �������� ������� ���� ����� �����.
	AI_Output(self,other,"DIA_Canthar_Again_09_07");	//� ����, ������� ��, ������� ��� �������� ��� ����, ��� ����� ������, ������...
	b_say_gold(self,other,CANTHAR_GOLD);
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_PAY(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_pay_condition;
	information = dia_canthar_pay_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_canthar_pay_condition()
{
	if(Npc_KnowsInfo(other,dia_canthar_again) && (CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_pay_info()
{
	AI_Output(self,other,"DIA_Canthar_Pay_09_00");	//�� ����� ���������?
	Info_ClearChoices(dia_canthar_pay);
	if(Npc_HasItems(other,itmi_gold) >= CANTHAR_GOLD)
	{
		Info_AddChoice(dia_canthar_pay,"������, � �������, �� �� ���������� ��� ������.",dia_canthar_pay_ja);
	};
	Info_AddChoice(dia_canthar_pay,"� ���� ��� � ����� ������� �����...",dia_canthar_pay_nein);
	Info_AddChoice(dia_canthar_pay,"������� ��� �����?",dia_canthar_pay_wieviel);
};

func void dia_canthar_pay_ja()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Ja_15_00");	//������, � �������, �� �� ���������� ��� ������.
	b_giveinvitems(other,self,itmi_gold,CANTHAR_GOLD);
	AI_Output(self,other,"DIA_Canthar_Pay_Ja_09_01");	//(����������) ������. � ������ � ����������, ����� ���� ��������� ����� ��������� ������� �����.
	CANTHAR_SPERRE = FALSE;
	CANTHAR_PAY = TRUE;
	Info_ClearChoices(dia_canthar_pay);
};

func void dia_canthar_pay_nein()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Nein_15_00");	//� ���� ��� � ����� ������� �����...
	AI_Output(self,other,"DIA_Canthar_Pay_Nein_09_01");	//����� ������ ��.
	Info_ClearChoices(dia_canthar_pay);
	AI_StopProcessInfos(self);
};

func void dia_canthar_pay_wieviel()
{
	AI_Output(other,self,"DIA_Canthar_Pay_Wieviel_15_00");	//������� ��� �����?
	b_say_gold(self,other,CANTHAR_GOLD);
};


instance DIA_CANTHAR_CANTHARANGEPISST(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 2;
	condition = dia_canthar_cantharangepisst_condition;
	information = dia_canthar_cantharangepisst_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_canthar_cantharangepisst_condition()
{
	if((CANTHAR_AUSGELIEFERT == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_KASERN_RENGARU") <= 1000) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_canthar_cantharangepisst_info()
{
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_00");	//� ������������ ����, �� �� �� ������. �� ������� ���� ������ �����.
	AI_Output(self,other,"DIA_Canthar_CANTHARANGEPISST_09_01");	//� ������ ����������, � ���� ���������.
	AI_StopProcessInfos(self);
};


instance DIA_CANTHAR_MINENANTEIL(C_INFO)
{
	npc = vlk_468_canthar;
	nr = 3;
	condition = dia_canthar_minenanteil_condition;
	information = dia_canthar_minenanteil_info;
	description = "�� �������� ���������� �����!";
};


func int dia_canthar_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_canthar_whatoffer))
	{
		return TRUE;
	};
};

func void dia_canthar_minenanteil_info()
{
	AI_Output(other,self,"DIA_Canthar_Minenanteil_15_00");	//�� �������� ���������� �����!
	AI_Output(self,other,"DIA_Canthar_Minenanteil_09_01");	//��? � ���?! ���� �� �, ��� ������.
	b_giveplayerxp(XP_AMBIENT);
};

