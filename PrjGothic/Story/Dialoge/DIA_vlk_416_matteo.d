
instance DIA_MATTEO_EXIT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 999;
	condition = dia_matteo_exit_condition;
	information = dia_matteo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_matteo_exit_condition()
{
	return TRUE;
};

func void dia_matteo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MATTEO_PICKPOCKET(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 900;
	condition = dia_matteo_pickpocket_condition;
	information = dia_matteo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_matteo_pickpocket_condition()
{
	return c_beklauen(80,150);
};

func void dia_matteo_pickpocket_info()
{
	Info_ClearChoices(dia_matteo_pickpocket);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_BACK,dia_matteo_pickpocket_back);
	Info_AddChoice(dia_matteo_pickpocket,DIALOG_PICKPOCKET,dia_matteo_pickpocket_doit);
};

func void dia_matteo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_matteo_pickpocket);
};

func void dia_matteo_pickpocket_back()
{
	Info_ClearChoices(dia_matteo_pickpocket);
};


instance DIA_MATTEO_HALLO(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_hallo_condition;
	information = dia_matteo_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_matteo_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_matteo_hallo_info()
{
	AI_Output(self,other,"DIA_Matteo_Hallo_09_00");	//��� ���� ������?
};


instance DIA_MATTEO_SELLWHAT(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 1;
	condition = dia_matteo_sellwhat_condition;
	information = dia_matteo_sellwhat_info;
	permanent = FALSE;
	description = "��� �� ��������?";
};


func int dia_matteo_sellwhat_condition()
{
	return TRUE;
};

func void dia_matteo_sellwhat_info()
{
	AI_Output(other,self,"DIA_Matteo_SellWhat_15_00");	//��� �� ��������?
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_01");	//� ���� ���������� ���, ��� ����� ������������ � ����� �����������. ������, ������, ��������... ���� �������.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_02");	//� ���� ���� ����� ������� ��������� �� ������.
	AI_Output(self,other,"DIA_Matteo_SellWhat_09_03");	//������� ��������� ������� �� ���� �������� - ������ �����. ���� ��� ���������?
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"����� ������ ��������� � ����� ����� ������. �� ������� ����������, ������ � ������ ������.");
		KNOWS_MATTEO = TRUE;
	};
};


instance DIA_MATTEO_TRADE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 800;
	condition = dia_matteo_trade_condition;
	information = dia_matteo_trade_info;
	permanent = TRUE;
	description = "������ ��� ���� ������.";
	trade = TRUE;
};


func int dia_matteo_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};


var int matteo_tradenewspermanent;

func void dia_matteo_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Matteo_TRADE_15_00");	//������ ��� ���� ������.
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS) && (MATTEO_TRADENEWSPERMANENT == FALSE))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_01");	//� ��� ���, ��� �������� ���������� ������, ��������� ��������� ����� ����������� ���� ��������.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_02");	//� �������, ��� ����������, ����� ����� ������ �������.
		MATTEO_TRADENEWSPERMANENT = 1;
	};
	if((KAPITEL == 5) && (MATTEO_TRADENEWSPERMANENT < 2))
	{
		AI_Output(self,other,"DIA_Matteo_TRADE_09_03");	//������, �������� ������������� �������� ��������� �� ���� ���. ��� ���� ��������� ������ �� ����� �������.
		AI_Output(self,other,"DIA_Matteo_TRADE_09_04");	//��� ������, ��� �� ����� ���������� ���� ������, ��� �����, ����� �� ��� ������������ ���� ����� �� ��������� ������.
		MATTEO_TRADENEWSPERMANENT = 2;
	};
};


var int matteo_leatherbought;

instance DIA_MATTEO_LEATHER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 850;
	condition = dia_matteo_leather_condition;
	information = dia_matteo_leather_info;
	permanent = TRUE;
	description = "������ ������� �������. ������: ������ 25, ������ 20. (250 ������)";
};


func int dia_matteo_leather_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_sellwhat) && (MATTEO_LEATHERBOUGHT == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_leather_info()
{
	AI_Output(other,self,"DIA_Matteo_LEATHER_15_00");	//������, ����� ��� ��� �������.
	if(b_giveinvitems(other,self,itmi_gold,250))
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_01");	//��� ���� ����������. (����������)
		b_giveinvitems(self,other,itar_leather_l,1);
		MATTEO_LEATHERBOUGHT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_LEATHER_09_02");	//��� ������� ����� �������� - �� ���, �����������, ����� ����� �����. ��� ��� �����������, ����� � ���� ����� ���������� ������.
	};
};


instance DIA_MATTEO_PALADINE(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_paladine_condition;
	information = dia_matteo_paladine_info;
	permanent = FALSE;
	description = "��� �� ������ � ���������?";
};


func int dia_matteo_paladine_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_matteo_paladine_info()
{
	AI_Output(other,self,"DIA_Matteo_Paladine_15_00");	//��� �� ������ � ���������?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_01");	//� ��� ���, ��� ��� ������� ������� � �����, � ���� �� ��� ���� ��������.
	AI_Output(self,other,"DIA_Matteo_Paladine_09_02");	//��������� ���, ����� � ��� � ������� �������, ��������� ���������� ��� ������ � ������ ��������, ��� ��� ��� �����!
	AI_Output(other,self,"DIA_Matteo_Paladine_15_03");	//�?
	AI_Output(self,other,"DIA_Matteo_Paladine_09_04");	//������� ��, ��� ���������� ����!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_05");	//�� � ���� ��� ���� ����� � ���� ������, ����� ��� ���������� ������� ��� ������ ��� ���� ������!
	AI_Output(self,other,"DIA_Matteo_Paladine_09_06");	//� ����� ��� ������� ������ � ������������ �������� ���� �������!
};


instance DIA_MATTEO_CONFISCATED(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_confiscated_condition;
	information = dia_matteo_confiscated_info;
	permanent = FALSE;
	description = "�������� ������� ���� ������?";
};


func int dia_matteo_confiscated_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine))
	{
		return TRUE;
	};
};

func void dia_matteo_confiscated_info()
{
	AI_Output(other,self,"DIA_Matteo_Confiscated_15_00");	//�������� ������� ���� ������?
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_01");	//���, ��� � ���� ��������� �� ������ �����.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_02");	//��� ������ ��������� ��������� ����� ������ �� ����.
	AI_Output(self,other,"DIA_Matteo_Confiscated_09_03");	//��� ��� �������, ��� ��� �� ������� ���. ���� �� ������� ��������.
};


instance DIA_MATTEO_HELPMETOOV(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmetoov_condition;
	information = dia_matteo_helpmetoov_info;
	permanent = FALSE;
	description = "�� ������ ������ ��� ������� � ������� �������?";
};


func int dia_matteo_helpmetoov_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_paladine) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmetoov_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_00");	//�� ������ ������ ��� ������� � ������� �������?
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_01");	//(�����������) ���? � ��� ���� ����� ���?
	AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_02");	//� ���� ������ ���������...
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_03");	//���-���... � �� ������� ����� ���� ����������?
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_04");	//(������� ����) ��, ������ �� ����!
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_05");	//(�������) ��� ��� ������� ��� ���� �����!
	}
	else
	{
		AI_Output(other,self,"DIA_Matteo_HelpMeToOV_15_06");	//� �� �������, ����� ��� ���� ��������.
		AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_07");	//��������, �� ����.
	};
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_08");	//� �� ���� ��������� ������ � ���� ��������� - ��� ���� �� ��������.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_09");	//�� ���� ���� �� ������� ��, ��� �������, ������� ������, �������������� � ������, ��� �� ������ ����.
	AI_Output(self,other,"DIA_Matteo_HelpMeToOV_09_10");	//������ ��� � ��� ���� ������.
};

func void b_matteo_preis()
{
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_01");	//������, ��� ����� ����� ��� ����.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_02");	//(������) ������ � ���: ��������� ��� ����� ��� ����?
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_03");	//�� ��� �� ���������?
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_04");	//� ���� ������ ���� - � ����, ��� ��, ���� �� ����� ����������� ����� �����.
	AI_Output(self,other,"DIA_Matteo_HelpMeNow_09_05");	//�� ��� ���� ��������� � ��������� �����.
};


instance DIA_MATTEO_HELPMENOW(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_helpmenow_condition;
	information = dia_matteo_helpmenow_info;
	permanent = FALSE;
	description = "��� �� ������ ������ ��� ������� � ������� �������?";
};


func int dia_matteo_helpmenow_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmetoov) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_helpmenow_info()
{
	AI_Output(other,self,"DIA_Matteo_HelpMeNow_15_00");	//��� �� ������ ������ ��� ������� � ������� �������?
	b_matteo_preis();
};


instance DIA_MATTEO_LEHRLINGLATER(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_lehrlinglater_condition;
	information = dia_matteo_lehrlinglater_info;
	permanent = FALSE;
	description = "������ ��� ����� �������� ������ �� ��������.";
};


func int dia_matteo_lehrlinglater_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_lehrlinglater_info()
{
	AI_Output(other,self,"DIA_Matteo_LehrlingLater_15_00");	//������ ��� ����� �������� ������ �� ��������.
	b_matteo_preis();
};


instance DIA_MATTEO_PRICEOFHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_priceofhelp_condition;
	information = dia_matteo_priceofhelp_info;
	permanent = FALSE;
	description = "��� �� ������ �� ���� ������?";
};


func int dia_matteo_priceofhelp_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmenow) || Npc_KnowsInfo(other,dia_matteo_lehrlinglater))
	{
		return TRUE;
	};
};

func void dia_matteo_priceofhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_15_00");	//��� �� ������ �� ���� ������?
	AI_Output(self,other,"DIA_Matteo_PriceOfHelp_09_01");	//100 ������� �����.
	Info_ClearChoices(dia_matteo_priceofhelp);
	Info_AddChoice(dia_matteo_priceofhelp,"��� ��� ���������...",dia_matteo_priceofhelp_wow);
	Info_AddChoice(dia_matteo_priceofhelp,"�� ��, �������!",dia_matteo_priceofhelp_cutthroat);
};

func void b_matteo_regdichab()
{
	AI_Output(self,other,"B_Matteo_RegDichAb_09_00");	//����������� ��� �����! ��� �� ���� ������ � ���� � ����.
	AI_Output(other,self,"B_Matteo_RegDichAb_15_01");	//� ���?
	AI_Output(self,other,"B_Matteo_RegDichAb_09_02");	//� ��������, ��� ��� ������.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_03");	//������, ���������� ��������, ��� ����� �� ������ ��� ����.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_04");	//�� ��� ��������� ������������ ��������� ���������� � ����� ������� - ��� ��������, ��� ������ � ��� ����.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_05");	//� ����, ����� �� ����� �� ��� ���� ����. �� ������ ������ - ������� - ���� ����� ����������� �������.
	AI_Output(self,other,"B_Matteo_RegDichAb_09_06");	//������� ��� ��� ������, � � ������ ����.
	MIS_MATTEO_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MATTEO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MATTEO,LOG_RUNNING);
	b_logentry(TOPIC_MATTEO,"���������� �������� ������� ������ ������ ������ 100 ������� �����. ���� � ����� �� ���, �� ������� ��� ������� � ������� �������.");
};

func void dia_matteo_priceofhelp_cutthroat()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Cutthroat_15_00");	//�� ��, �������!
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};

func void dia_matteo_priceofhelp_wow()
{
	AI_Output(other,self,"DIA_Matteo_PriceOfHelp_Wow_15_00");	//��� ��� ���������...
	b_matteo_regdichab();
	Info_ClearChoices(dia_matteo_priceofhelp);
};


instance DIA_MATTEO_WOGRITTA(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 2;
	condition = dia_matteo_wogritta_condition;
	information = dia_matteo_wogritta_info;
	permanent = FALSE;
	description = "��� ��� ����� ��� ������?";
};


func int dia_matteo_wogritta_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (gritta.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_wogritta_info()
{
	AI_Output(other,self,"DIA_Matteo_WoGritta_15_00");	//��� ��� ����� ��� ������?
	AI_Output(self,other,"DIA_Matteo_WoGritta_09_01");	//��� � ��� ������� - ��� ���������� �������� - ��� ��� ��������� ���� �� �����, ������ �� �������.
};


instance DIA_MATTEO_GOLDRUNNING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 500;
	condition = dia_matteo_goldrunning_condition;
	information = dia_matteo_goldrunning_info;
	permanent = TRUE;
	description = "��� ���� 100 �������!";
};


func int dia_matteo_goldrunning_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && (Npc_KnowsInfo(other,dia_gritta_wantsmoney) || Npc_IsDead(gritta)))
	{
		return TRUE;
	};
};

func void dia_matteo_goldrunning_info()
{
	AI_Output(other,self,"DIA_Matteo_GoldRunning_15_00");	//��� ���� 100 �������!
	if(Npc_IsDead(gritta))
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_01");	//�� ���� ������ ����� ������! � �� �������, ��� ����� ������� ��!
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_02");	//� �� ���� ����� �������� ��������� � ����� ����. �� ������ ������ � ����� ������! �� ���� ���� ���������� �� ����!
		MIS_MATTEO_GOLD = LOG_FAILED;
		b_checklog();
		AI_StopProcessInfos(self);
		return;
	};
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		if(Npc_HasItems(gritta,itmi_gold) < 100)
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_03");	//�? ���� �����-������ ��������?
			AI_Output(other,self,"DIA_Matteo_GoldRunning_15_04");	//������ ������, � ��� ������ �� ��������.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_05");	//������! �� �������� ���� ����� ������.
		}
		else
		{
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_06");	//�� ������ ��������� �� ���? �� - � �� ���������, ����� �� ��������� ��� ������ �� ���!
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_07");	//�� ��� �� - 100 ������� ���� 100 �������.
			AI_Output(self,other,"DIA_Matteo_GoldRunning_09_08");	//�� �������� ���� ����� ������.
		};
		MIS_MATTEO_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_MATTEO_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_GoldRunning_09_09");	//� ���� �������� �� ������? � �� ���� 100 ������� �����.
	};
};


instance DIA_MATTEO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_zustimmung_condition;
	information = dia_matteo_zustimmung_info;
	permanent = TRUE;
	description = "������ ��� ����� �������� ������ �� ��������!";
};


var int dia_matteo_zustimmung_perm;

func int dia_matteo_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && ((MIS_MATTEO_GOLD == LOG_RUNNING) || (MIS_MATTEO_GOLD == LOG_SUCCESS)) && (PLAYER_ISAPPRENTICE == APP_NONE) && (DIA_MATTEO_ZUSTIMMUNG_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_matteo_zustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_Zustimmung_15_00");	//������ ��� ����� �������� ������ �� ��������!
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_01");	//�� ��������, � ������� ���� ��������.
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_02");	//������ ������� ������� �� ���� � ���� ������ �������.
		b_giveplayerxp(XP_ZUSTIMMUNG);
		b_logentry(TOPIC_LEHRLING,"������ ���� ��� ���� ���������, ���� � ������ ����� �������� ������� �������.");
		DIA_MATTEO_ZUSTIMMUNG_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Matteo_Zustimmung_09_03");	//����� ���� �������. ������� ������� ���� ����� ������ � ������� ��� ������!
	};
};


instance DIA_MATTEO_HOWCANYOUHELP(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_howcanyouhelp_condition;
	information = dia_matteo_howcanyouhelp_info;
	permanent = FALSE;
	description = "��� ������ �� ����������� ������ ���?";
};


func int dia_matteo_howcanyouhelp_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_helpmenow) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_howcanyouhelp_info()
{
	AI_Output(other,self,"DIA_Matteo_HowCanYouHelp_15_00");	//��� ������ �� ����������� ������ ���?
	AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_01");	//��� ������. � ��������� ���� �������, ����� ������� ������ ������� �������� ����� ���� � �������.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Matteo_HowCanYouHelp_09_02");	//���� ��������, �� ������������� ������� � ����������� ������ � ������� ������� � ������� �������. ������ �����, �� ������� ���-������ ����������.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"������ ����� ������ ��� ����� �������� ������ �� ����������.");
};


instance DIA_MATTEO_WOALSLEHRLING(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 4;
	condition = dia_matteo_woalslehrling_condition;
	information = dia_matteo_woalslehrling_info;
	permanent = FALSE;
	description = "� � ���� � ���� ��������� � �������?";
};


func int dia_matteo_woalslehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_woalslehrling_info()
{
	AI_Output(other,self,"DIA_Matteo_WoAlsLehrling_15_00");	//� � ���� � ���� ��������� � �������?
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_01");	//� ������ ������� �� ���� �����.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_02");	//��� ����� ���� ������ �����, ������-������ ������, ������� ������ ��� ������� �����������.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_03");	//���� �� ��� ����������� ������� ����.
	AI_Output(self,other,"DIA_Matteo_WoAlsLehrling_09_04");	//�� �����, ����� � ���� ���� �������� ������ �������. ����� ������ ��������.
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"� ���� ����� �������� �������-������� �������, ������� ������, �������� ������� ��� �������� �����������.");
	b_logentry(TOPIC_LEHRLING,"������ ��� � ����� ��������, � ������ �������� ��������� ������ ��������.");
};


instance DIA_MATTEO_WIEZUSTIMMUNG(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 5;
	condition = dia_matteo_wiezustimmung_condition;
	information = dia_matteo_wiezustimmung_info;
	permanent = FALSE;
	description = "��� ��� �������� ��������� ������ ��������?";
};


func int dia_matteo_wiezustimmung_condition()
{
	if((Npc_KnowsInfo(other,dia_matteo_woalslehrling) || Npc_KnowsInfo(other,dia_matteo_warumnichtbeidir)) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_wiezustimmung_info()
{
	AI_Output(other,self,"DIA_Matteo_WieZustimmung_15_00");	//��� ��� �������� ��������� ������ ��������?
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_01");	//�� ������ ������ ������� ��. ��� � �������� � ����.
	AI_Output(self,other,"DIA_Matteo_WieZustimmung_09_02");	//�� ���� ���� �� ���� �� ��� ����� ������ ����, ���� �� ��������� � �������! ��� ��� ���������� ����������� ��!
	b_logentry(TOPIC_LEHRLING,"� ����� �������� ��������� ��������, ������ ���� � ������� ���� � ������ ������� ����� ����.");
};


instance DIA_MATTEO_WARUMNICHTBEIDIR(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_warumnichtbeidir_condition;
	information = dia_matteo_warumnichtbeidir_info;
	permanent = FALSE;
	description = "� ������ �� �� �������� ���� � �������?";
};


func int dia_matteo_warumnichtbeidir_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_warumnichtbeidir_info()
{
	AI_Output(other,self,"DIA_Matteo_WarumNichtBeiDir_15_00");	//� ������ �� �� �������� ���� � �������?
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_01");	//� �� ���� - �� ������ ������� �� ����������.
	AI_Output(self,other,"DIA_Matteo_WarumNichtBeiDir_09_02");	//� ������ ������� ���� ��� ������ �������.
};


instance DIA_MATTEO_OTHERWAY(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 6;
	condition = dia_matteo_otherway_condition;
	information = dia_matteo_otherway_info;
	permanent = FALSE;
	description = "� ���� ������ ������ ������� � ������� �������?";
};


func int dia_matteo_otherway_condition()
{
	if(Npc_KnowsInfo(other,dia_matteo_howcanyouhelp) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_matteo_otherway_info()
{
	AI_Output(other,self,"DIA_Matteo_OtherWay_15_00");	//� ���� ������ ������ ������� � ������� �������?
	AI_Output(self,other,"DIA_Matteo_OtherWay_09_01");	//��������... ���� � ���-������ ��������, � ��� ���� �����.
};


instance DIA_MATTEO_MINENANTEIL(C_INFO)
{
	npc = vlk_416_matteo;
	nr = 3;
	condition = dia_matteo_minenanteil_condition;
	information = dia_matteo_minenanteil_info;
	description = "� ���� ����� ������ ������� ���� � ����� ��������������� ��������.";
};


func int dia_matteo_minenanteil_condition()
{
	if((other.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_matteo_sellwhat))
	{
		return TRUE;
	};
};

func void dia_matteo_minenanteil_info()
{
	AI_Output(other,self,"DIA_Matteo_Minenanteil_15_00");	//� ����, � ���� ����� ������ ������� ���� � ����� ��������������� ��������. ��� ������ �� ����?
	AI_Output(self,other,"DIA_Matteo_Minenanteil_09_01");	//(������) �����? ��. � ������ ��� �������? ������� �� ����, ��� � ���� ��. �������, ���� �����.
	b_giveplayerxp(XP_AMBIENT);
};

