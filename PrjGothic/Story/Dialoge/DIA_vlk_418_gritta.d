
instance DIA_GRITTA_EXIT(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 999;
	condition = dia_gritta_exit_condition;
	information = dia_gritta_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gritta_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_gritta_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_PICKPOCKET(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 900;
	condition = dia_gritta_pickpocket_condition;
	information = dia_gritta_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20_FEMALE;
};


func int dia_gritta_pickpocket_condition()
{
	return c_beklauen(20,20);
};

func void dia_gritta_pickpocket_info()
{
	Info_ClearChoices(dia_gritta_pickpocket);
	Info_AddChoice(dia_gritta_pickpocket,DIALOG_BACK,dia_gritta_pickpocket_back);
	Info_AddChoice(dia_gritta_pickpocket,DIALOG_PICKPOCKET,dia_gritta_pickpocket_doit);
};

func void dia_gritta_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gritta_pickpocket);
};

func void dia_gritta_pickpocket_back()
{
	Info_ClearChoices(dia_gritta_pickpocket);
};


instance DIA_GRITTA_HELLO(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 10;
	condition = dia_gritta_hello_condition;
	information = dia_gritta_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gritta_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_gritta_hello_info()
{
	AI_Output(self,other,"DIA_Gritta_Hello_16_00");	//��� ���� �����, ���������? ���� �� ������ ������� ���������, � ��������� ������������ ����. � ������ �����.
	AI_Output(self,other,"DIA_Gritta_Hello_16_01");	//���� ����� ������. � ��� ���, ��� ���� ��� ���, � ����� �� ����� ����� ����, �������.
};


instance DIA_GRITTA_WANTSMONEY(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 2;
	condition = dia_gritta_wantsmoney_condition;
	information = dia_gritta_wantsmoney_info;
	permanent = FALSE;
	description = "���� ������� ������. �� �������, ��� �� ��������� ���.";
};


func int dia_gritta_wantsmoney_condition()
{
	if(MIS_MATTEO_GOLD == LOG_RUNNING)
	{
		return TRUE;
	};
};


var int gritta_wantpay;
var int gritta_threatened;

func void dia_gritta_wantsmoney_info()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_15_00");	//���� ������� ������. �� �������, ��� �� ��������� ���.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_01");	//�� ����� �������� ������? �� ���? ��, ��� �� ��� �������, �� �� ��� �� �������. ����� ��������������, � ��� ������������ ����� �� ������.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_02");	//� �� �����, ������ ��� �����? ��� �� ��� ����, ��� � ����������. ��� ��������������!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_16_03");	//��������, ���� �� ��� ��� ��� ���, �� �� �� ������ �������� �����. ��, ��� ������ ���...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"������. ��� ������?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"(������� ������)",dia_gritta_wantsmoney_continue01);
};

func void dia_gritta_wantsmoney_continue01()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue01_16_00");	//...�� ��� ����� ������� ���������. ��������, ���������, ��������� ����������. � ��� ���� ���. ���������, �������...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_01");	//...������ ��� ���� ���������� � ������ ����. �� ���������, ��� ����� ���� ������������ ������� � ���������...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue01_16_02");	//...�� ������ �����... ����� ��� ���� ������ ��-�������. ����� ����� �� �� ��������� ������� ������ ����� ������...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"������. ��� ������?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"(������� ������)",dia_gritta_wantsmoney_continue02);
};

func void dia_gritta_wantsmoney_continue02()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue02_16_00");	//...�������� �����������. � ��� ��� ������ ������? ��� ������ ��� ��������� ������� ����� � �������, � ����� ���������� ��� ������� � �������. �� �� ��� ��� ������ ������...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_01");	//...����� ���������� ��������� � ������ ���������� �����. ��� ����� ������ �� ���� ������� �� ������� � �����. ��� ��� ��� ��������� ��������� ������� - �� ����� ����, �� ���� ������ ���� ��������...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue02_16_02");	//...�� ����� ������ �������� �� ������ �������� ��� ������� - ���������� ����� � ��������, ������� ������ �� ����� �����...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"������. ��� ������?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"(������� ������)",dia_gritta_wantsmoney_continue03);
};

func void dia_gritta_wantsmoney_continue03()
{
	AI_Output(self,other,"DIA_Gritta_WantsMoney_continue03_16_00");	//...����������� ���� �� ������� � ����� �����. �� �������, � �������� ��������, ��� ������ �������� - ��� ��������� ���� �������, ��� ��� ������ ��� ��� ��...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue03_16_01");	//...����� �� ���. � ������� � ��������, ����� ����� ���� ������� ������ � ���� ����������. � ���������, � ����� �������� � ���, �� ��� ��� ������� ���� ��������...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_02");	//...�� ������������� ����� ��� ��� �����. ����� �� ���� ��������. � ��� ��� ��� ���������� ���� ��� � ���� �������� ��������. � ������ ���� ���������, ������������ ������...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_Continue04_16_03");	//...����� ������ � ���� ��������� ����������. ����������, ������� ��� ������ ��������. ���� �� ��� ��� ��� ���, ������ �� ������ �� ������� ���. ��, ��� ������ ���...
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"������. ��� ������?",dia_gritta_wantsmoney_wheremoney);
	Info_AddChoice(dia_gritta_wantsmoney,"(������� ������)",dia_gritta_wantsmoney_continue01);
};

func void dia_gritta_wantsmoney_wheremoney()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_WhereMoney_15_00");	//������. ��� ������?
	AI_Output(self,other,"DIA_Gritta_WantsMoney_WhereMoney_16_01");	//(���������) �� � ���� ��� ������, � ������ �����!
	Info_ClearChoices(dia_gritta_wantsmoney);
	Info_AddChoice(dia_gritta_wantsmoney,"���������� ������, ��� ��� �������� �������� ����!",dia_gritta_wantsmoney_beatup);
	Info_AddChoice(dia_gritta_wantsmoney,"����� �� ������ �������� ��������� �� ����� ������.",dia_gritta_wantsmoney_enoughstuff);
	Info_AddChoice(dia_gritta_wantsmoney,"� ��������� ��������� ��� ����� �� ����.",dia_gritta_wantsmoney_iwillpay);
};

func void dia_gritta_wantsmoney_enoughstuff()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_00");	//����� �� ������ �������� ��������� �� ����� ������. � ������, ��� � ����� ������� �� ����� �����...
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_01");	//��� �� ������, �����������! �����, ���, ������ ������.
	b_giveinvitems(self,other,itmi_gold,100);
	AI_Output(other,self,"DIA_Gritta_WantsMoney_EnoughStuff_15_02");	//(����������) ������, ��� ���� �� ��� �� ������.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_EnoughStuff_16_03");	//(�����������) � ������, ����������, ������ ��� ���.
	GRITTA_GOLDGIVEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_gritta_wantsmoney_iwillpay()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_00");	//� ��������� ��������� ��� ����� �� ����.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_01");	//�� �������� ��� ���� ����? ��, � �����, ��� �� �� ����� ������ ��� ���� ������!
	AI_Output(other,self,"DIA_Gritta_WantsMoney_IWillPay_15_02");	//��, ��, �� ����� ��������������.
	AI_Output(self,other,"DIA_Gritta_WantsMoney_IWillPay_16_03");	//�����������, ����� ������� ������ ������ - � ���� ������������� ����.
	Info_ClearChoices(dia_gritta_wantsmoney);
	GRITTA_WANTPAY = TRUE;
};

func void dia_gritta_wantsmoney_beatup()
{
	AI_Output(other,self,"DIA_Gritta_WantsMoney_BeatUp_15_00");	//(���������) ���������� ������, ��� ��� �������� �������� ����!
	AI_Output(self,other,"DIA_Gritta_WantsMoney_BeatUp_16_01");	//(���������) �� �� ������ ������� ������. �����, �������� ���� ������, � � ������ ������!
	GRITTA_THREATENED = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_WINE(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 2;
	condition = dia_gritta_wine_condition;
	information = dia_gritta_wine_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gritta_wine_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GRITTA_WANTPAY == TRUE) && (MIS_MATTEO_GOLD == LOG_SUCCESS) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		return TRUE;
	};
};

func void dia_gritta_wine_info()
{
	AI_Output(self,other,"DIA_Gritta_WINE_16_00");	//��� ���� ����� ���������� � ����� ������� ��������� �� ����. � ���� ������������� ����.
	AI_Output(self,other,"DIA_Gritta_WINE_16_01");	//��� ������� ����, ������� ��� ���, �� ������� ����� ��� ����, ������ � ����� ��������.
	AI_Output(self,other,"DIA_Gritta_WINE_16_02");	//����� � �������� � ���� ����! �������-�� � ������ �������� �������, ��� �����������...
	AI_Output(other,self,"DIA_Gritta_WINE_15_03");	//��-��, �� ����� ��������������.
	b_giveplayerxp(XP_PAYFORGRITTA);
	b_giveinvitems(self,other,itfo_wine,1);
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_PERM(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 3;
	condition = dia_gritta_perm_condition;
	information = dia_gritta_perm_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_gritta_perm_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_gritta_wantsmoney) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_gritta_perm_info()
{
	if(Npc_KnowsInfo(other,dia_gritta_wine) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_00");	//���� � ������ ���� ����� ���� ��� ��, ���� �� ��������� �������, ��� ��� ��� ����� ������.
	}
	else if((GRITTA_WANTPAY == TRUE) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_01");	//�����������, ����� ������� ������ � ������.
	}
	else if((GRITTA_THREATENED == TRUE) && (Npc_HasItems(self,itmi_gold) >= 100))
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_02");	//��� �� ��������� �� ���� ��� �����? �� ��� ����� �� ���������� ������� ����!
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_PERM_16_03");	//��� ��� ���� �����? �� ������� ��� ������! ��������!
	};
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_KAP3_EXIT(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 999;
	condition = dia_gritta_kap3_exit_condition;
	information = dia_gritta_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gritta_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_gritta_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int grittaxp_once;

instance DIA_GRITTA_PERM3U4U5(C_INFO)
{
	npc = vlk_418_gritta;
	nr = 31;
	condition = dia_gritta_perm3u4u5_condition;
	information = dia_gritta_perm3u4u5_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_gritta_perm3u4u5_condition()
{
	return TRUE;
};

func void dia_gritta_perm3u4u5_info()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_00");	//��� ����?
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_01");	//��� ����� ������� � ���������. ���� �� ���������, ����� ���� ������������ � �������. ������ ���������, ������� ����� ���� ��������!
			Info_ClearChoices(dia_gritta_perm3u4u5);
			Info_AddChoice(dia_gritta_perm3u4u5,DIALOG_BACK,dia_gritta_perm3u4u5_back);
			Info_AddChoice(dia_gritta_perm3u4u5,"��� ����� - ���� ���. ����� ���������.",dia_gritta_perm3u4u5_war);
			Info_AddChoice(dia_gritta_perm3u4u5,"��� ����� ������.",dia_gritta_perm3u4u5_turnsgood);
			Info_AddChoice(dia_gritta_perm3u4u5,"��� �� �������?",dia_gritta_perm3u4u5_rumors);
		}
		else
		{
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_02");	//��, � ��� �����������. ���� ����� ��������� ����� ��������.
			AI_Output(other,self,"DIA_Gritta_Perm3U4U5_15_03");	//� ����� ��� ����� ��������� � ����?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_04");	//�� �� ��� �������. �� ������, ��� �������� ������ ��, ����� ����, ����� �� �������� ���������� ��������?
			AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_05");	//��� �� ���������� ���������� ���, � ��������� �� ����� �����. ��, ����� ������, ��� ����������� ������.
		};
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_06");	//�������� � ����-�� ���������. ������, ��� ���������� ������� �� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Gritta_Perm3U4U5_16_07");	//��� ��� ������, �� � �� ���� ����������.
	};
};

func void dia_gritta_perm3u4u5_back()
{
	Info_ClearChoices(dia_gritta_perm3u4u5);
};

func void dia_gritta_perm3u4u5_war()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_War_15_00");	//��� ����� - ���� ���. ����� ���������.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_01");	//��, ����� ����� ��� ������� �����. ��� �������� �� ���. �� ���� ����, ��� �� ������� ������� ����� � �������.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_War_16_02");	//������ � ��������� ����, ��� �� �������, ����� ��������� ����� ��������� �� ������.
};

func void dia_gritta_perm3u4u5_turnsgood()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_TurnsGood_15_00");	//��� ����� ������.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_TurnsGood_16_01");	//�� ��������� ���������� ����. ��� ����.
	if(GRITTAXP_ONCE == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		GRITTAXP_ONCE = TRUE;
	};
};

func void dia_gritta_perm3u4u5_rumors()
{
	AI_Output(other,self,"DIA_Gritta_Perm3U4U5_Rumors_15_00");	//��� �� �������?
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_01");	//������ ��, ��� ������� �� ������.
	AI_Output(self,other,"DIA_Gritta_Perm3U4U5_Rumors_16_02");	//� �������, ��� ������ ��� �������, �� � �� ����, ������ ��� ��� ���.
};

