
instance DIA_CONSTANTINO_EXIT(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 999;
	condition = dia_constantino_exit_condition;
	information = dia_constantino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_constantino_exit_condition()
{
	return TRUE;
};

func void dia_constantino_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CONSTANTINO_PICKPOCKET(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 900;
	condition = dia_constantino_pickpocket_condition;
	information = dia_constantino_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_constantino_pickpocket_condition()
{
	return c_beklauen(59,90);
};

func void dia_constantino_pickpocket_info()
{
	Info_ClearChoices(dia_constantino_pickpocket);
	Info_AddChoice(dia_constantino_pickpocket,DIALOG_BACK,dia_constantino_pickpocket_back);
	Info_AddChoice(dia_constantino_pickpocket,DIALOG_PICKPOCKET,dia_constantino_pickpocket_doit);
};

func void dia_constantino_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_constantino_pickpocket);
};

func void dia_constantino_pickpocket_back()
{
	Info_ClearChoices(dia_constantino_pickpocket);
};


instance DIA_CONSTANTINO_HALLO(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_hallo_condition;
	information = dia_constantino_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_constantino_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_constantino_hallo_info()
{
	AI_Output(self,other,"DIA_Constantino_Hallo_10_00");	//��� ���� �����? ����������� ����� ������ ���, � ��������� ���� � ���� ������ �� ���������.
};


instance DIA_CONSTANTINO_ABOUTLEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_aboutlehrling_condition;
	information = dia_constantino_aboutlehrling_info;
	permanent = FALSE;
	description = "� ���� ��������� � �������.";
};


func int dia_constantino_aboutlehrling_condition()
{
	return TRUE;
};

func void dia_constantino_aboutlehrling_info()
{
	AI_Output(other,self,"DIA_Constantino_AboutLehrling_15_00");	//� ���� ��������� � �������.
	AI_Output(self,other,"DIA_Constantino_AboutLehrling_10_01");	//������? � ���� �������� �� ������ �����?
};


instance DIA_CONSTANTINO_HEILUNG(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 5;
	condition = dia_constantino_heilung_condition;
	information = dia_constantino_heilung_info;
	permanent = FALSE;
	description = "��� ����� �������.";
};


func int dia_constantino_heilung_condition()
{
	return TRUE;
};

func void dia_constantino_heilung_info()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_15_00");	//��� ����� �������.
	AI_Output(self,other,"DIA_Constantino_Heilung_10_01");	//(�������) �����, �� �����?
	Info_ClearChoices(dia_constantino_heilung);
	Info_AddChoice(dia_constantino_heilung,"� �����-��, ���.",dia_constantino_heilung_nein);
	Info_AddChoice(dia_constantino_heilung,"��.",dia_constantino_heilung_ja);
};

func void dia_constantino_heilung_ja()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Ja_15_00");	//��.
	if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_01");	//����� ��� � �������, �� �������� ����. � ��������� ������ ������ �� ��� ���!
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_Heilung_Ja_10_02");	//� ���� ����� ���� ���������� ��������, � � ���� ���� ���� ��������, ��� ������� � �����.
	};
	AI_StopProcessInfos(self);
};

func void dia_constantino_heilung_nein()
{
	AI_Output(other,self,"DIA_Constantino_Heilung_Nein_15_00");	//� �����-��, ���.
	AI_Output(self,other,"DIA_Constantino_Heilung_Nein_10_01");	//����� ����������, � �� ���� ������������� ����������� ����������� ������.
	AI_StopProcessInfos(self);
};


instance DIA_CONSTANTINO_TRADE(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 700;
	condition = dia_constantino_trade_condition;
	information = dia_constantino_trade_info;
	permanent = TRUE;
	description = "������ ��� ���� ������.";
	trade = TRUE;
};


func int dia_constantino_trade_condition()
{
	return TRUE;
};

func void dia_constantino_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Constantino_Trade_15_00");	//������ ��� ���� ������.
	if(CONSTANTINO_LOGPATCH1 == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"����������� ������� ������������ ������.");
		CONSTANTINO_LOGPATCH1 = TRUE;
	};
};


instance DIA_CONSTANTINO_BEIDIR(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_beidir_condition;
	information = dia_constantino_beidir_info;
	permanent = FALSE;
	description = "� ���� ����� ����� ��������.";
};


func int dia_constantino_beidir_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aboutlehrling) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_beidir_info()
{
	AI_Output(other,self,"DIA_Constantino_BeiDir_15_00");	//� ���� ����� ����� ��������.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_01");	//����? ���! � ��� ���-�� ���� ������������ ������������ ����� �������. � ���� ����������.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_02");	//� �������� ��������� ��� �� ��� ��������, � ����� ���� ����� ���� � ���������.
	AI_Output(self,other,"DIA_Constantino_BeiDir_10_03");	//��� ����� ��������� � ������� � ������� �������!
};


instance DIA_CONSTANTINO_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_zustimmung_condition;
	information = dia_constantino_zustimmung_info;
	permanent = TRUE;
	description = "� ���� ����� �������� ������ �� ������ ��������.";
};


func int dia_constantino_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aboutlehrling) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_zustimmung_info()
{
	AI_Output(other,self,"DIA_Constantino_ZUSTIMMUNG_15_00");	//� ���� ����� �������� ������ �� ������ ��������.
	AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_01");	//�� ������ �������� ��� ���������?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_02");	//�� - ��� �������� ����� ������, �� ������ ����� �������� ������ �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_03");	//�� ��� �� ��������! ��, ��� � ������ � ����, ������� �� � ���� ������.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_04");	//� �� ���������� �� ��, ����� ���������� ����� ���� ����� ��������� ��������� � ���� ������.
		AI_Output(self,other,"DIA_Constantino_ZUSTIMMUNG_10_05");	//���� �� �� ������� ���� ������ � ����������� ��������� �������, ��� ����� ����� - ���!
	};
	if(CONSTANTINO_LOGPATCH2 == FALSE)
	{
		Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
		b_logentry(TOPIC_LEHRLING,"����������� ���� ��� ���� ���������, ���� � �� ��������� �� � ����� ������������ � ������.");
		CONSTANTINO_LOGPATCH2 = TRUE;
	};
};


instance DIA_CONSTANTINO_BRINGHERBS(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_bringherbs_condition;
	information = dia_constantino_bringherbs_info;
	permanent = FALSE;
	description = "��� ��� ����� �������, ����� ����� ����� ��������?";
};


func int dia_constantino_bringherbs_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_beidir) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_bringherbs_info()
{
	AI_Output(other,self,"DIA_Constantino_BringHerbs_15_00");	//��� ��� ����� �������, ����� ����� ����� ��������?
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_01");	//(��������) � �� ������, ���� ��� ���� �������� �������� �� ���� �������.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_02");	//� ������� ������������ ��������� ����. � ��������� ����������� ��� ���� ����� ��������� �������.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_03");	//��������, � �������� ���� ���� �� ���� �� ������.
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_04");	//(��������) ��� - ��� ������ ����� ������ ��������.
	b_giveinvitems(self,other,itwr_kraeuterliste,1);
	AI_Output(self,other,"DIA_Constantino_BringHerbs_10_05");	//������� ��� ���� �������� ������� ����, �, ��������, � �������� ���� ������ ������ �������.
	MIS_CONSTANTINO_BRINGHERBS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CONSTANTINOPLANTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CONSTANTINOPLANTS,LOG_RUNNING);
	b_logentry(TOPIC_CONSTANTINOPLANTS,"����������� ����� �������� �� ������ ���������� ������� ��������, ����� �� �� ������ ���� � �������.");
};


instance DIA_CONSTANTINO_HERBSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_herbsrunning_condition;
	information = dia_constantino_herbsrunning_info;
	permanent = TRUE;
	description = "������ ��������...";
};


func int dia_constantino_herbsrunning_condition()
{
	if(MIS_CONSTANTINO_BRINGHERBS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_constantino_herbsrunning_info()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_15_00");	//������ ��������...
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_10_01");	//���� �� �� ������ ��������� ��� ������� ��������������, �� ���� �� ��������� �������� ��������!
	Info_ClearChoices(dia_constantino_herbsrunning);
	Info_AddChoice(dia_constantino_herbsrunning,"�������.",dia_constantino_herbsrunning_running);
	if((Npc_HasItems(other,itpl_mana_herb_01) > 0) && (Npc_HasItems(other,itpl_mana_herb_02) > 0) && (Npc_HasItems(other,itpl_mana_herb_03) > 0) && (Npc_HasItems(other,itpl_health_herb_01) > 0) && (Npc_HasItems(other,itpl_health_herb_02) > 0) && (Npc_HasItems(other,itpl_health_herb_03) > 0) && (Npc_HasItems(other,itpl_dex_herb_01) > 0) && (Npc_HasItems(other,itpl_strength_herb_01) > 0) && (Npc_HasItems(other,itpl_speed_herb_01) > 0) && (Npc_HasItems(other,itpl_temp_herb) > 0) && (Npc_HasItems(other,itpl_perm_herb) > 0))
	{
		Info_AddChoice(dia_constantino_herbsrunning,"� ������ ��� ��������, ��� �� ������!",dia_constantino_herbsrunning_success);
	};
};

func void dia_constantino_herbsrunning_success()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Success_15_00");	//� ������ ��� ��������, ��� �� ������!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_01");	//���? �� ��������� �������� ����, ��?
	b_giveinvitems(other,self,itpl_mana_herb_01,1);
	b_giveinvitems(other,self,itpl_mana_herb_02,1);
	b_giveinvitems(other,self,itpl_mana_herb_03,1);
	b_giveinvitems(other,self,itpl_health_herb_01,1);
	b_giveinvitems(other,self,itpl_health_herb_02,1);
	b_giveinvitems(other,self,itpl_health_herb_03,1);
	b_giveinvitems(other,self,itpl_dex_herb_01,1);
	b_giveinvitems(other,self,itpl_strength_herb_01,1);
	b_giveinvitems(other,self,itpl_speed_herb_01,1);
	b_giveinvitems(other,self,itpl_temp_herb,1);
	b_giveinvitems(other,self,itpl_perm_herb,1);
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_02");	//������� ��������! ��� ��� �����, � ���� ����� �������!
	AI_Output(self,other,"DIA_Constantino_HerbsRunning_Success_10_03");	//��� �����, �����, �����-������ �� ���� ������������� ��������� ��������� �������.
	MIS_CONSTANTINO_BRINGHERBS = LOG_SUCCESS;
	b_giveplayerxp(XP_CONSTANTINO_HERBS);
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"����������� ������ ���� � �������, ���� ������ ������� ����� �� ������.");
	Info_ClearChoices(dia_constantino_herbsrunning);
};

func void dia_constantino_herbsrunning_running()
{
	AI_Output(other,self,"DIA_Constantino_HerbsRunning_Running_15_00");	//�������.
	Info_ClearChoices(dia_constantino_herbsrunning);
};


var int constantino_startguild;

instance DIA_CONSTANTINO_LEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_lehrling_condition;
	information = dia_constantino_lehrling_info;
	permanent = TRUE;
	description = "���� � ������ ����� ����� ��������?";
};


func int dia_constantino_lehrling_condition()
{
	if((MIS_CONSTANTINO_BRINGHERBS == LOG_SUCCESS) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_constantino_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Constantino_LEHRLING_15_00");	//���� � ������ ����� ����� ��������?
	if(b_getgreatestpetzcrime(self) == CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_01");	//��� �������� ����� ������ - ��.
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_02");	//������ ����� ������, ����� �� ��� �������� �������� ����� � ������ ��������� �����.
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_03");	//�, ������, �� ���� ������� ��� � ����.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_04");	//�� �� �������, ��� �� ����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_05");	//�� ����� ����������, ��� ������� ���� �� �����.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_06");	//������ ����� �������� ��������� � ����� ������������.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_07");	//� �������, ��� �� ����� �� ����� ���� � ������� ���.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_08");	//�� ��� ��, � ����� ������, �� ����������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_09");	//���������� ����-���� � ��������� �� ���� �������, �����������, ���������� ���������� �������!
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_10");	//�� ���� ��� ������ ������� ����������, ���� �� ����������� ��� �����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_11");	//� ������ ���� ���� �� �����.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_12");	//������ - ����� ����������� �������.
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_13");	//�� ��� ���� ���� �������������. ��� ������� ����.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_14");	//�� ���� ���� ��������� ������ � ������������� �����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_15");	//������ �� �����, ��� �� �����.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_16");	//��� �������� ������ - �� ������������ ���� �� ������ ����.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_17");	//������ �������, ��� �� ���-�� ������ ���. ���� �� ������ �������� ��� �����, ���� ����� ������ � ��� ��� ������ ��������.
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_18");	//������ �������, ��� ��� �� ������������ � ����� �� ����� ������.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_19");	//������ �������, ��� ������� �� ����� ���� � ����� �����.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_20");	//��� ��������, ��� �� ������� ��������� ���� ��������!
			}
			else
			{
				AI_Output(self,other,"DIA_Constantino_LEHRLING_10_21");	//������ � ���� ���� ��������� ������� ��������. ����� ����������, ����� ���� �������� � �������.
			};
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_22");	//�� ����� ���������� � �������� � ����?
			Info_ClearChoices(dia_constantino_lehrling);
			Info_AddChoice(dia_constantino_lehrling,"��� ����� ������� ��������.",dia_constantino_lehrling_later);
			Info_AddChoice(dia_constantino_lehrling,"��, ������.",dia_constantino_lehrling_yes);
		}
		else
		{
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_23");	//����� ����� �������� � ������ ����� ������, ���� ����� �������� ���������, �� ������� ����, ������� ��������.
			AI_Output(self,other,"DIA_Constantino_LEHRLING_10_24");	//��� ��������, ��� �� ������ ���������� �� �����, ��� ��� �� ����� �� ���� ���� �����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_25");	//(�������) �� �� ���! �� ���� ����� �����, ��� �� ����������� � ������������ �����, � ��������!
		AI_Output(self,other,"DIA_Constantino_LEHRLING_10_26");	//� �� ������ ���� � �������, ���� �� �� ������� ���� ������ � ����������� ��������� ������.
	};
};

func void dia_constantino_lehrling_yes()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Yes_15_00");	//��, ������.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_01");	//(��������) ������! �������, � �� ������� �� ���� �������.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Yes_10_02");	//� ����� �������, �� ������ ������� ���� ���� ��������.
	PLAYER_ISAPPRENTICE = APP_CONSTANTINO;
	ApprenticeGoldCounter = 0;
	CONSTANTINO_STARTGUILD = other.guild;
	CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("alchemist",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_BONUS,"����������� ������ ���� � �������. ������ � ����� ������� � ������� �������.");
	Info_ClearChoices(dia_constantino_lehrling);
};

func void dia_constantino_lehrling_later()
{
	AI_Output(other,self,"DIA_Constantino_LEHRLING_Later_15_00");	//��� ����� ������� ��������.
	AI_Output(self,other,"DIA_Constantino_LEHRLING_Later_10_01");	//������! ���� �� �� ������� ������ ����� ���� ���� ������, ���� ����� ������� ������ ���������.
	Info_ClearChoices(dia_constantino_lehrling);
};


var int constantino_milkommentar;
var int constantino_innoskommentar;

instance DIA_CONSTANTINO_ALSLEHRLING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 1;
	condition = dia_constantino_alslehrling_condition;
	information = dia_constantino_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_constantino_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_CONSTANTINO) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_constantino_alslehrling_info()
{
	if(b_getgreatestpetzcrime(self) > CRIME_NONE)
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_00");	//(�������) � ����������� ������� ����, ���� �� ����������� � ������������ � ������.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_01");	//��� � ����� ����� � ����� ���� ������ � ���.
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	else if((other.guild == GIL_MIL) && (CONSTANTINO_STARTGUILD != GIL_MIL) && (CONSTANTINO_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_02");	//��� �� �������� � ���������? � ��� ������ �� ����.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_03");	//�� ��� ��������� ����� ��������, � ����� ��� ��� ������ ���� � �������� � ���������? �� � �� ����� ������ ���� ������ �� ���.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_04");	//� ������, ��� �� ������ ������ �������������� ������ ����������, � ������ ��������� ��������� ��� �������� � �����.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_05");	//���� ��� ������� ������ ��� ���� - �������� �� ���� ������� ������������, ���� ������ �������� ������ �����!
		CONSTANTINO_MILKOMMENTAR = TRUE;
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL)) && (CONSTANTINO_STARTGUILD != GIL_NOV) && (CONSTANTINO_STARTGUILD != GIL_KDF) && (CONSTANTINO_STARTGUILD != GIL_PAL) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_06");	//� ����, �� �������� � ��������� � ������. � �������, ��� ������, ��� � ����� ������� �� �� ������� ������� ����� �������� ����� ���� ��� �������.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_07");	//�� ��� ��, � ����� �� ������� ����� ������������ ���� �� ����� ����.
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_08");	//� ����, �������� �� ���� ����� �����������, �� ������� ����� ���������� ��������, �� ������ ������ ������������ �� ������ ����� �����.
		CONSTANTINO_INNOSKOMMENTAR = TRUE;
	}
	else if((CONSTANTINO_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (CONSTANTINO_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_09");	//��� �� ��������?
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_10");	//� ������ �� ����� ������� �������� �������. ��� ������ �� �������, ��� �� ����������� ����� ��� � �����!
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_11");	//�� ���� �� ������ ��� �����?
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_AlsLehrling_10_12");	//����� ��...
		CONSTANTINO_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_CONSTANTINO_AUFGABEN(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_aufgaben_condition;
	information = dia_constantino_aufgaben_info;
	permanent = FALSE;
	description = "������ ��� ������?";
};


func int dia_constantino_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
	{
		return TRUE;
	};
};

func void dia_constantino_aufgaben_info()
{
	AI_Output(other,self,"DIA_Constantino_Aufgaben_15_00");	//������ ��� ������?
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_01");	//� �������, ��� �� ���� ������� �� �������� ��������, ��� �� ����� ��������� ��� �������� ������ �� ���� � ���� �������.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_02");	//����� �� ������� �� ������ ��������� ��������, ������� ��� ����������. ������, � ���� ������� ���� ��������� �������.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_03");	//�� ������ �������� � ���� ��������. �� ����������� ������������, �������, ���� �������� �������� ������.
	AI_Output(self,other,"DIA_Constantino_Aufgaben_10_04");	//� � ������, ��� �� ������ ����� ���� ��� ��������������� ��������� ����� ������.
};


instance DIA_CONSTANTINO_MUSHROOMS(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushrooms_condition;
	information = dia_constantino_mushrooms_info;
	permanent = FALSE;
	description = "����� �������� � ������ ���������?";
};


func int dia_constantino_mushrooms_condition()
{
	if(Npc_KnowsInfo(other,dia_constantino_aufgaben))
	{
		return TRUE;
	};
};

func void dia_constantino_mushrooms_info()
{
	AI_Output(other,self,"DIA_Constantino_Mushrooms_15_00");	//����� �������� � ������ ���������?
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_01");	//� ���� �������� ���, ��� �� ��������� ��� - � ���� ������� �� ����� ������� ����.
	AI_Output(self,other,"DIA_Constantino_Mushrooms_10_02");	//�� ��� �������� ������, ��� ��� � ���� ������ ����.
	MIS_CONSTANTINO_MUSHROOMS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"� ���� ��������� ����� ����������� �� ����� ������� ����.");
};


instance DIA_CONSTANTINO_MUSHROOMSRUNNING(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_mushroomsrunning_condition;
	information = dia_constantino_mushroomsrunning_info;
	permanent = TRUE;
	description = "���� ����� ���� �����...";
};


func int dia_constantino_mushroomsrunning_condition()
{
	if(MIS_CONSTANTINO_MUSHROOMS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_constantino_mushroomsrunning_info()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_15_00");	//���� ����� ���� �����...
	Info_ClearChoices(dia_constantino_mushroomsrunning);
	Info_AddChoice(dia_constantino_mushroomsrunning,"� ��������� �������� ���� ��...",dia_constantino_mushroomsrunning_later);
	if(PLAYER_KNOWSDUNKELPILZBONUS == FALSE)
	{
		Info_AddChoice(dia_constantino_mushroomsrunning,"������ ��� ����� ��� �����?",dia_constantino_mushroomsrunning_why);
	};
	if((Npc_HasItems(other,itpl_mushroom_01) > 0) || (Npc_HasItems(other,itpl_mushroom_02) > 0))
	{
		Info_AddChoice(dia_constantino_mushroomsrunning,"� ������ ��������� ...",dia_constantino_mushroomsrunning_sell);
	};
};

func void dia_constantino_mushroomsrunning_sell()
{
	var int Mushroom1_Count;
	var int Mushroom2_Count;
	var int dunkelpilz_dabei;
	dunkelpilz_dabei = FALSE;
	if(Npc_HasItems(other,itpl_mushroom_01))
	{
		Mushroom1_Count = Npc_HasItems(other,itpl_mushroom_01);
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_00");	//� ������ ��������� ������ ������...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_01");	//��! ��� ������ �����! �������! ��� ���� ������!
		dunkelpilz_dabei = TRUE;
		CONSTANTINO_DUNKELPILZCOUNTER += Mushroom1_Count;
		ApprenticeGoldCounter += Mushroom1_Count * VALUE_MUSHROOM_01;
		b_giveinvitems(self,other,itmi_gold,Mushroom1_Count * VALUE_MUSHROOM_01);
		b_giveinvitems(other,self,itpl_mushroom_01,Mushroom1_Count);
	};
	if(Npc_HasItems(other,itpl_mushroom_02) > 0)
	{
		Mushroom2_Count = Npc_HasItems(other,itpl_mushroom_02);
		if(dunkelpilz_dabei == TRUE)
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_02");	//� ��� ��� ������...
		}
		else
		{
			AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Sell_15_03");	//� ���� ����� ��������� ������!
		};
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Sell_10_04");	//��� �� ��� ������, ��� ������ �����, �� � ��� ����� ������ ��.
		Constantino_BigMushroomsCounter += Mushroom2_Count;
		ApprenticeGoldCounter += Mushroom2_Count * VALUE_MUSHROOM_02;
		b_giveinvitems(self,other,itmi_gold,Mushroom2_Count * VALUE_MUSHROOM_02);
		b_giveinvitems(other,self,itpl_mushroom_02,Mushroom2_Count);
	};
	Info_ClearChoices(dia_constantino_mushroomsrunning);
};

func void dia_constantino_mushroomsrunning_why()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_00");	//������ ��� ����� ��� �����?
	if(CONSTANTINO_DUNKELPILZCOUNTER == 0)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_01");	//���� �������� �� ��, ��� �� ��� ������, � �� ���� ������� ���� ���.
	}
	else if(CONSTANTINO_DUNKELPILZCOUNTER >= 50)
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_02");	//������ - � ��� �� ����� ����. �� �� ������ ��������� ��� � �����.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_03");	//������ ����� ����� ���������� �������. � ������ ���, ����� �� �������� ����� ����, ������� ���� ������� �������������� ����� �����.
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_04");	//� ����� �� ����� ����������� ���������� ���� ������, ���� ���������� ������� ���������...
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_05");	//���� �� � ������ ���� ��� �����, �� �� ������ ��� ��� ����� ���, ����� ���?
		AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Why_15_06");	//(��������) ��!
		PLAYER_KNOWSDUNKELPILZBONUS = TRUE;
		Info_ClearChoices(dia_constantino_mushroomsrunning);
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Why_10_07");	//�� ��� ��������� ���� �� ����. (������) ��� �����, ����� ���� ������� � ������������� ����� ����...
	};
};

func void dia_constantino_mushroomsrunning_later()
{
	AI_Output(other,self,"DIA_Constantino_MushroomsRunning_Later_15_00");	//� ��������� �������� ���� ��...
	AI_Output(self,other,"DIA_Constantino_MushroomsRunning_Later_10_01");	//�������! ������� ��� ���, ��� ������ �������...
	Info_ClearChoices(dia_constantino_mushroomsrunning);
};


instance DIA_CONSTANTINO_ALCHEMY(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_alchemy_condition;
	information = dia_constantino_alchemy_info;
	permanent = FALSE;
	description = "����� ���� ��������� �������!";
};


func int dia_constantino_alchemy_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
	{
		return TRUE;
	};
};

func void dia_constantino_alchemy_info()
{
	AI_Output(other,self,"DIA_Constantino_Alchemy_15_00");	//����� ���� ��������� �������!
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_01");	//������. ������� ������.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_02");	//��� ����� �������� �� �������� - ��� �������� ��������� �����.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_03");	//�� �������� ������� ��� ���� ���� � ���� - � ������� ���������� ���������� ���� ���� � ������������ �� � ������ �����.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_04");	//����� ����������� ����� �� ������������ �����, ���� ����������� ������������ ��������.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_05");	//�� ������ ����� ���������� ������� � ����� ��������������� �����������.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_06");	//� ���� ������� ���� ������ ����� ��������.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_07");	//�������� �����, ����������������� ���� ���������� ����, � ���� �����, ������� ������������ �� ���� ���� �����������.
	AI_Output(self,other,"DIA_Constantino_Alchemy_10_08");	//�� ������ ������� ��� �����.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"����������� ����� ������� ���� ��������� �������.");
};


instance DIA_CONSTANTINO_NEWRECIPES(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_newrecipes_condition;
	information = dia_constantino_newrecipes_info;
	permanent = FALSE;
	description = "� ���� ������ ����� ������� �����.";
};


func int dia_constantino_newrecipes_condition()
{
	if((PLAYER_ISAPPRENTICE != APP_CONSTANTINO) && (PLAYER_ISAPPRENTICE > APP_NONE) && (Npc_GetTalentSkill(other,NPC_TALENT_ALCHEMY) > 0))
	{
		return TRUE;
	};
};

func void dia_constantino_newrecipes_info()
{
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_00");	//� ���� ������ ����� ������� �����.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_01");	//� ���� ���� �����-������ ���� � �������?
	AI_Output(other,self,"DIA_Constantino_NewRecipes_15_02");	//��, ����.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_03");	//� �� ��� ��� ���... ��� �������� ����.
	AI_Output(self,other,"DIA_Constantino_NewRecipes_10_04");	//� �����, ��� ���� �������� ���� ��������� ��������. �� ��� �������, ������� ��, �� ����, ��� �� ������ ������.
	CONSTANTINO_TEACHALCHEMY = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"����������� ����� ������� ���� ��������� �������.");
};


instance DIA_CONSTANTINO_TEACH(C_INFO)
{
	npc = vlk_417_constantino;
	nr = 2;
	condition = dia_constantino_teach_condition;
	information = dia_constantino_teach_info;
	permanent = TRUE;
	description = "����� �������� �� ������ ������� ����?";
};


func int dia_constantino_teach_condition()
{
	if(CONSTANTINO_TEACHALCHEMY == TRUE)
	{
		return TRUE;
	};
};

func void dia_constantino_teach_info()
{
	AI_Output(other,self,"DIA_Constantino_TEACH_15_00");	//����� �������� �� ������ ������� ����?
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == TRUE))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_01");	//������. � ������ ������ �� ���� ������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_10_02");	//���� ��������� - �������.
		Info_ClearChoices(dia_constantino_teach);
		Info_AddChoice(dia_constantino_teach,DIALOG_BACK,dia_constantino_teach_back);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("�������� ��������",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_health01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("�������� ��������",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_health02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("�������� �������",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_health03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("������� �����",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_permhealth);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("�������� ����",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_mana01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("�������� ����",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_mana02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == FALSE) && ((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE)))
	{
		Info_AddChoice(dia_constantino_teach,b_buildlearnstring("������� ����",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_constantino_teach_permstr);
	};
};

func void dia_constantino_teach_back()
{
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health01()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health01_10_00");	//����������� ��� �������� �������� - �������� ����� � ������� �����.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_00");	//����� ����������� �������� ��������, ���� ����������� �������� �������� � ������� �����.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health02_10_01");	//�������� ���� �������� ����� ����� ���������.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_health03()
{
	if(b_teachplayertalentalchemy(self,other,POTION_HEALTH_03))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_00");	//��� �������� ��������� �������� ��������� ���� ������ �����.
		AI_Output(self,other,"DIA_Constantino_TEACH_Health03_10_01");	//���� ����������� �������� ����� � ������� �����. ��� ��������� ����� ����� ����� ���� �������� ������������.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permhealth()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_00");	//������� �����! ������ ������. �� �� ��-�� ��������� ������������� - ��� ����� �� ��� �� ������ �������.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermHealth_10_01");	//�� � ��� ������������ ������ �����������. ���� ����������� �������� ����� � ������� ������.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana01()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_01))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_00");	//�������� ���� - ����� ������� �� ���������� �����.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana01_10_01");	//������ �������� ������� � ������� ����� � �������� �� �� ��������� ����.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_mana02()
{
	if(b_teachplayertalentalchemy(self,other,POTION_MANA_02))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_00");	//��� ��� �� ��� ������ �������� �������� ����, ���� ������� ��������������, �� ������� �������� ����� � ��������.
		AI_Output(self,other,"DIA_Constantino_TEACH_Mana02_10_01");	//�����������, ����� ������� ������ �������� �������� ����������� ����� �����. � �������� ������������ ��� ���� ������������ �������� ����� � ������� �����.
	};
	Info_ClearChoices(dia_constantino_teach);
};

func void dia_constantino_teach_permstr()
{
	if(b_teachplayertalentalchemy(self,other,POTION_PERM_STR))
	{
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_00");	//������� ����! ������������ �����. ��� ���� ���� ����������� ������ �������� ������ � ������� ������.
		AI_Output(self,other,"DIA_Constantino_TEACH_PermSTR_10_01");	//��� ��������� ����� ����� �����, ����� �������� �� ����� ������� ��������, ����� ���� ����� ����� ���������� �������!
	};
	Info_ClearChoices(dia_constantino_teach);
};

