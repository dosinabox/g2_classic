
instance DIA_HARAD_EXIT(C_INFO)
{
	npc = vlk_412_harad;
	nr = 999;
	condition = dia_harad_exit_condition;
	information = dia_harad_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_harad_exit_condition()
{
	return TRUE;
};

func void dia_harad_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HARAD_HALLO(C_INFO)
{
	npc = vlk_412_harad;
	nr = 2;
	condition = dia_harad_hallo_condition;
	information = dia_harad_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_harad_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_harad_hallo_info()
{
	AI_Output(self,other,"DIA_Harad_Hallo_12_00");	//(�����������) ��� �� ������?
};


instance DIA_HARAD_ARBEIT(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_arbeit_condition;
	information = dia_harad_arbeit_info;
	permanent = FALSE;
	description = "� ��� ������!";
};


func int dia_harad_arbeit_condition()
{
	return TRUE;
};

func void dia_harad_arbeit_info()
{
	AI_Output(other,self,"DIA_Harad_Arbeit_15_00");	//� ��� ������!
	AI_Output(self,other,"DIA_Harad_Arbeit_12_01");	//�� - ��� �� ������� �� ����� ������.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_02");	//������ ����� �������� ���� ��������, � ����� ������� �����.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_03");	//� �� �� ���-������ ��������?
	AI_Output(other,self,"DIA_Harad_Arbeit_15_04");	//���� �� ������ � ����, ���� �� � ������ ������� ...
	AI_Output(self,other,"DIA_Harad_Arbeit_12_05");	//���. � � ������.
	AI_Output(self,other,"DIA_Harad_Arbeit_12_06");	//���� ��� ������, ������ ���� � ������� ����� � ������. � ����� � ������ ����� ����������� ������ �������, ��������� �������� �����.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Harad_Arbeit_12_07");	//� � �� ����, ����� ��� ������ �������� ��� ���, ������ �� ������ ������ � ��������� � ���������� �������������, ������ ����, ����� ������� ������� ������ � ������� ���������.
	};
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"���� � ����� ������� ������, ��� � ���� �� ���-������ ������, �� ������ ���� � �������.");
};


instance DIA_HARAD_TAUGENICHTS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_taugenichts_condition;
	information = dia_harad_taugenichts_info;
	permanent = FALSE;
	description = "� �� ���������!";
};


func int dia_harad_taugenichts_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_arbeit))
	{
		return TRUE;
	};
};

func void dia_harad_taugenichts_info()
{
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_00");	//� �� ���������!
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_01");	//��� ������� �����! � �� ������ ����������� �� ������ �� �������� ������?
	AI_Output(other,self,"DIA_Harad_Taugenichts_15_02");	//�� ��� �� ���������?
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_03");	//������� ��� ������ �����.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_04");	//����� ������� ������ ����� ������. � �����, ���� �� �������� ������ �� ������� �����.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_05");	//���� ���� ������� �������� ������ �� ���, � ������ ���� � �������.
	AI_Output(self,other,"DIA_Harad_Taugenichts_12_06");	//����, �������, ������ ������� ����� ��������.
	MIS_HARAD_ORC = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HARADORK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HARADORK,LOG_RUNNING);
	b_logentry(TOPIC_HARADORK,"���������� �� ������ ������ ����. ������ ����� �����, ����� � ���� ���. ������ ���� �������� ����������� ���������������.");
};


instance DIA_HARAD_ORCRUNNING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_orcrunning_condition;
	information = dia_harad_orcrunning_info;
	permanent = FALSE;
	description = "����� ��� ��������� �� ���� ����� ...";
};


func int dia_harad_orcrunning_condition()
{
	if((MIS_HARAD_ORC == LOG_RUNNING) && (HARAD_HAKONMISSION == FALSE))
	{
		return TRUE;
	};
};

func void dia_harad_orcrunning_info()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_15_00");	//����� ��� ��������� �� ���� ����� ...
	AI_Output(self,other,"DIA_Harad_OrcRunning_12_01");	//(���������) ���?
	Info_ClearChoices(dia_harad_orcrunning);
	Info_AddChoice(dia_harad_orcrunning,"������ ������� ������ ���� �������!",dia_harad_orcrunning_done);
	Info_AddChoice(dia_harad_orcrunning,"��� ��� ����� ��������� ���������...",dia_harad_orcrunning_toohard);
};

func void dia_harad_orcrunning_toohard()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_00");	//�� ��� ��� ����� ��������� ���������...
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_01");	//�� - ���� �� ����, ��� �� ���������, �������� �� ����. � ���� ������� ���� ���� �� ������. �� ��� ����� ���������.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_02");	//��� �� �����, �� ������ �������� ���, ��� � ���� ������ �������� ���������, ���� ��� ����� ����������.
	AI_Output(other,self,"DIA_Harad_OrcRunning_TooHard_15_03");	//� ��� �� ��� ���� ���������� ������� ��������?
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_04");	//�� - (���������) �����, �������� ������� �� �������� �������, ������ ���, ��� �� ���� ������ ������� ��������� ���� �����.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_05");	//��� �������, �� ������, �������� ���� ������ ���-�� �� ���������� ��������.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_06");	//��� ��������� ������ �� ������ ���� ��� �� ������.
	AI_Output(self,other,"DIA_Harad_OrcRunning_TooHard_12_07");	//���� ���� ��������! ����! ����� � �����, ��� �� �� ��������� ��� �����.
	HARAD_HAKONMISSION = TRUE;
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	if(MIS_HAKONBANDITS != LOG_RUNNING)
	{
		b_logentry(TOPIC_LEHRLING,"����� ������ ���, ��� ������� �������� �������� ������ �������� �� ������. ���� � ����� ����� ��, ��� ������ ���, ��� � ���� �� ���-�� ������. � ������ ���������� � �������. ��������, �� �����, ��� ���������� ��� �������.");
	}
	else
	{
		b_logentry(TOPIC_LEHRLING,"����� ������ ���, ��� ������� �������� �������� ������ �������� �� ������. ���� � ����� ����� ��, ��� ������ ���, ��� � ���� �� ���-�� ������.");
	};
	Info_ClearChoices(dia_harad_orcrunning);
};

func void dia_harad_orcrunning_done()
{
	AI_Output(other,self,"DIA_Harad_OrcRunning_Done_15_00");	//������ ������� ������ ���� �������!
	AI_Output(self,other,"DIA_Harad_OrcRunning_Done_12_01");	//������! ����� �� ����� ����� �������. ����� ���� ���� ���� ������� �� ����.
	Info_ClearChoices(dia_harad_orcrunning);
};


func int C_ScHasOrcWeapon()
{
	if(Npc_HasItems(hero,itmw_2h_orcmace_01))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itmw_2h_orcaxe_01))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itmw_2h_orcaxe_02))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itmw_2h_orcaxe_03))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itmw_2h_orcaxe_04))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itmw_2h_orcsword_01))
	{
		return TRUE;
	}
	else if(Npc_HasItems(hero,itmw_2h_orcsword_02))
	{
		return TRUE;
	};
	return FALSE;
};

instance DIA_HARAD_ORCSUCCESS(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_orcsuccess_condition;
	information = dia_harad_orcsuccess_info;
	permanent = FALSE;
	description = "� ������ ���� ������ �����, ��� �� �����.";
};


func int dia_harad_orcsuccess_condition()
{
	if((MIS_HARAD_ORC == LOG_RUNNING) && C_ScHasOrcWeapon())
	{
		return TRUE;
	};
};

func void dia_harad_orcsuccess_info()
{
	AI_Output(other,self,"DIA_Harad_OrcSuccess_15_00");	//� ������ ���� ������ �����, ��� �� �����.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_01");	//������ ...
	if(Npc_HasItems(other,itmw_2h_orcaxe_04))
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_04,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcsword_02))
	{
		b_giveinvitems(other,self,itmw_2h_orcsword_02,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcsword_01))
	{
		b_giveinvitems(other,self,itmw_2h_orcsword_01,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_03))
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_03,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_02))
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_02,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcaxe_01))
	{
		b_giveinvitems(other,self,itmw_2h_orcaxe_01,1);
	}
	else if(Npc_HasItems(other,itmw_2h_orcmace_01))
	{
		b_giveinvitems(other,self,itmw_2h_orcmace_01,1);
	};
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	if(HARAD_HAKONMISSION == TRUE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_02");	//�� ��� �� ������ ���?! �� ��������� �������!
	};
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_03");	//����� ��� �� ������ � ��������� ������ � ����� ����� - � ��� ��� ��� ��� �������� �� ����� ����� � ������.
	AI_Output(self,other,"DIA_Harad_OrcSuccess_12_04");	//�� ��, ������� �� ���� �������, ����� � ����.
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_05");	//� ����, ��� �� ���� ��������� ������� ������. �������� ������!
	}
	else if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_06");	//� �� �����, ��� ���� ������� ���. � �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_07");	//����, ������, ��� �� ������ ������ �������.
		AI_Output(self,other,"DIA_Harad_OrcSuccess_12_08");	//�� �� ����� ���������� ���.
	};
	MIS_HARAD_ORC = LOG_SUCCESS;
	b_giveplayerxp(XP_HARAD_ORC);
	b_logentry(TOPIC_LEHRLING,"����� ������ ���� � �������, ���� � ����� �������� ��������� ������ ��������.");
};


var int harad_startguild;

instance DIA_HARAD_LEHRLING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_lehrling_condition;
	information = dia_harad_lehrling_info;
	permanent = TRUE;
	description = "����� � ���� ����� ����� ��������?";
};


func int dia_harad_lehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_arbeit) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_harad_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Harad_LEHRLING_15_00");	//����� � ���� ����� ����� ��������?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		if(MIS_HARAD_ORC == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_01");	//��� ����� ������ �� ������� �� �������, ��������� ���������� ����.
			if(MIS_HAKONBANDITS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_02");	//����� ����, ����� ��������� ���, ��� �� ����� �������� � ���������. �� ��������� �������!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_03");	//�� �� ���� ����, �� ����� ��������� ���, ��� �� ����� �������� � ���������. ��� ������!
		};
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_04");	//��� �������� ����� ������, �� �� ������ ���������� � ������ ���� ������.
		stimmen = stimmen + 1;
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_05");	//� ������ ������� ...
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_06");	//������ ��� ���� ���� �������������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_07");	//������ ������ ������ �����, ����� �� ������� ������������� �����. � �����, ��� ������� ����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_08");	//������ �������, ��� ������� �� ����� ����.
		};
		if(bosper.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_09");	//������ ������� ��������� ���� �� ���� ����� ���� � �������. �� �����, ����� �� ���� ��� ��������.
			if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_10");	//� ���� �������, �� ����������� �������� � ��� �� ����� �������.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_11");	//� ����� ������, �� ����������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_12");	//�� �������� ����, ����� � ��� ���� ����������� ���� �� ����������� ���� � ��� �������.
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_13");	//�������� - �� ������ ������� ������� ���� �����. ����, �������, ���� ����� ��� �����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_14");	//������ ���� �� �����, ��� �� �����
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_15");	//��� ������, ����������� ������ �� �������. �� ������, ��� � ��� ����� ������, �� ������ ����� ���� �������� � ����� ������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_16");	//����������� �������, ��� �� ����������� � ������������ � ������ - ��� ������?
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_17");	//���� ��� ���, �� ���� ����� ������� ��� �������� ��� ����� �������!
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_18");	//����������� ������� �� ������ � ����.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_19");	//������ �������, ��� �� ������ ��� ��� ������. ��� �������, �� ����������� ������� �������.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_20");	//������ �������, ��� �� ��� ���-�� ������. � �� ����, ��� � ��� ��� �� ����, �� �� ������ ������������� ��� ��������.
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_21");	//������ �������, ��� ������� �� ������� �� ���� � �����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_22");	//������ �������, ��� ������� �� ����� ���� � ����� �����.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_23");	//��� ��������, ��� �� ������� ��������� ���� ��������!
			}
			else
			{
				AI_Output(self,other,"DIA_Harad_LEHRLING_12_24");	//��� ��������, ��� �� ������� ��������� ������� ��������. ����� ����������, ����� ���� �������� � �������.
			};
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_25");	//�� ����� ����� ���� ��������?
			Info_ClearChoices(dia_harad_lehrling);
			Info_AddChoice(dia_harad_lehrling,"������ - � ������� ��� ����.",dia_harad_lehrling_later);
			Info_AddChoice(dia_harad_lehrling,"� ����� ����� ����� ��������!",dia_harad_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_26");	//���� ����� �������� ���������, �� ������� ����, ������� ��������. ����� �� �� ������� ����� �������� � ������ ����� ������.
			AI_Output(self,other,"DIA_Harad_LEHRLING_12_27");	//������� �� ������ ���������� �� ����� ���������, ������� ��� �� ������� � ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_12_28");	//�� ������, ��� �������� ���, ��� ���� �� ���-�� �����.
	};
};

func void dia_harad_lehrling_ok()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_00");	//� �����!
	AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_01");	//�������! � ����� ���� ������ ������� ����.
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE)
	{
		AI_Output(other,self,"DIA_Harad_LEHRLING_OK_15_02");	//� ��� ���� ���!
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_03");	//��� �. ��� �����!
	};
	if(other.attribute[ATR_STRENGTH] < 50)
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_OK_12_04");	//����� ����, ������ ����� ����� ������� �������. �� ������� ����� � ���� �� ������!
	};
	PLAYER_ISAPPRENTICE = APP_HARAD;
	ApprenticeGoldCounter = 0;
	HARAD_STARTGUILD = other.guild;
	HARAD_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("schmied",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_logentry(TOPIC_BONUS,"����� ������ ���� � �������. ������ � ����� ������� � ������� �������.");
	b_logentry(TOPIC_BONUS,"����� ����� �������� ������, ���������� ����, �� ������� ����.");
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_CITYTEACHER,"����� ����� ������� ���� ���������� ����. ����� �� ����� ������ ��� ����� �������.");
	Info_ClearChoices(dia_harad_lehrling);
};

func void dia_harad_lehrling_later()
{
	AI_Output(other,self,"DIA_Harad_LEHRLING_Later_15_00");	//������ - � ������� ��� ����.
	if(!Npc_IsDead(brian))
	{
		AI_Output(self,other,"DIA_Harad_LEHRLING_Later_12_01");	//��� ������. ������ ��� ����� ��� ���������� ����� ��������� �����.
	};
	Info_ClearChoices(dia_harad_lehrling);
};


instance DIA_HARAD_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_412_harad;
	nr = 2;
	condition = dia_harad_zustimmung_condition;
	information = dia_harad_zustimmung_info;
	permanent = TRUE;
	description = "���� � ����� �������� ������� �������?";
};


func int dia_harad_zustimmung_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && Npc_KnowsInfo(other,dia_harad_arbeit))
	{
		return TRUE;
	};
};


var int dia_harad_zustimmung_permanent;

func void dia_harad_zustimmung_info()
{
	AI_Output(other,self,"DIA_Harad_Zustimmung_15_00");	//���� � ����� �������� ������� �������?
	if((MIS_HARAD_ORC == LOG_SUCCESS) || ((MIS_HAKONBANDITS == LOG_SUCCESS) && (HARAD_HAKONMISSION == TRUE)))
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_01");	//�� ������� �������.
		if(MIS_HAKONBANDITS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_02");	//����� ��������� ���, ��� �� ���������� � ���������.
		};
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_03");	//� ��� ���� ���� ���������.
		if(DIA_HARAD_ZUSTIMMUNG_PERMANENT == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			DIA_HARAD_ZUSTIMMUNG_PERMANENT = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"����� ���� ��� ���� ���������, ���� � ������ ����� �������� ������� �������.");
		if(!Npc_IsDead(brian))
		{
			AI_Output(self,other,"DIA_Harad_Zustimmung_12_04");	//������ ��� ���������� ����� ��������� �����. � � ������, ��� ���� ��� ������ �������� ������� ������, ��������� �������� ���.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Zustimmung_12_05");	//������ ������� ����� ���� ���� �������� �� ���. �� � ��� ��� ��������� ������ ����� ����, ��� �� ��������, ��� ���� �� ���-�� �����!
	};
};


var int harad_milkommentar;
var int harad_palkommentar;
var int harad_innoskommentar;

instance DIA_HARAD_ALSLEHRLING(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_alslehrling_condition;
	information = dia_harad_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_harad_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_HARAD) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_harad_alslehrling_info()
{
	if((other.guild == GIL_MIL) && (HARAD_STARTGUILD != GIL_MIL) && (HARAD_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_00");	//�� ������ ������� � ���������? � ������� �����!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_01");	//���� �� ������� � �����, ����������� � �� ���� ������������, ��� �� ������ ��������� ��� � ���� ����������� �������.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_02");	//�� ���� ���� ���-������ �����������, ������ �������� �� ���, ����� ��������.
		HARAD_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (HARAD_STARTGUILD != GIL_PAL) && (HARAD_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_03");	//���� ������� ����� ���������!
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_04");	//� ���, ��� �����-�� ���� ���� � �������. ���� ���� �� � �� �������� ����� ������� �� �����������.
		HARAD_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (HARAD_STARTGUILD != GIL_NOV) && (HARAD_STARTGUILD != GIL_KDF) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_05");	//��� �� ��������� � ���������. � �� ���������, ����� �� ��������� � ������. ��� ����� ������� ����.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_06");	//�� ���� �� ����� ��������� ���� ������, �� ��� ���� � ����.
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_07");	//���� ���� ����� ���-������ ����� �� ����, � ������ ���� ��� ������.
		HARAD_INNOSKOMMENTAR = TRUE;
	}
	else if((HARAD_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (HARAD_MILKOMMENTAR == FALSE) && (HARAD_PALKOMMENTAR == FALSE) && (HARAD_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_08");	//��������� ���� �� ���� ����� �����. ��� �� ��� ��� ��� �����, ��?
		HARAD_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_AlsLehrling_12_09");	//����� �� ...
		HARAD_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_HARAD_WAFFEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_waffen_condition;
	information = dia_harad_waffen_info;
	permanent = FALSE;
	description = "�� �������� ������?";
};


func int dia_harad_waffen_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_harad_waffen_info()
{
	AI_Output(other,self,"DIA_Harad_Waffen_15_00");	//�� �������� ������?
	AI_Output(self,other,"DIA_Harad_Waffen_12_01");	//������ �� ����. ���, ��� � �����, ������ ��������� ��� ���������.
	AI_Output(self,other,"DIA_Harad_Add_12_00");	//� ���� ����� �� 100 ����� �� ����� ������. �� ����� ��������� ��������� ������.
};


instance DIA_HARAD_AUFGABEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 1;
	condition = dia_harad_aufgaben_condition;
	information = dia_harad_aufgaben_info;
	permanent = FALSE;
	description = "��� ������ ������ ������?";
};


func int dia_harad_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_aufgaben_info()
{
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_00");	//��� ������ ������ ������?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_01");	//��� ����. �������� �������.
	AI_Output(other,self,"DIA_Harad_Aufgaben_15_02");	//������, ������ � ������?
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_03");	//�� �� ��� �� ���������, ��� ��������. � ����� �� ������ ���. ���� �� �� ���������, �� � ����� �� ���������. ��� ������.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_05");	//����� ����, � ����� ���� �����, ��� ����� ����� ��� ������������ ������� �����.
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_06");	//������������ ���������� ����� - ������ ��� �������� �������. ���� �� ����� ��� ������ ...
	AI_Output(self,other,"DIA_Harad_Aufgaben_12_07");	//���� ���� ����� ����� ��� ���, �� ������ ������� ���-������ � ���� ����. ��� �������?
};


instance DIA_HARAD_SELLBLADES(C_INFO)
{
	npc = vlk_412_harad;
	nr = 200;
	condition = dia_harad_sellblades_condition;
	information = dia_harad_sellblades_info;
	permanent = TRUE;
	description = "� ���� ������� ������, ���������� ����.";
};


func int dia_harad_sellblades_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_sellblades_info()
{
	var int anzahl;
	var C_ITEM equipweap;
	AI_Output(other,self,"DIA_Harad_SellBlades_15_00");	//� ���� ������� ������, ���������� ����.
	anzahl = Npc_HasItems(other,itmw_1h_common_01);
	equipweap = Npc_GetEquippedMeleeWeapon(other);
	if(Hlp_IsItem(equipweap,itmw_1h_common_01) == TRUE)
	{
		anzahl = anzahl - 1;
		if(anzahl == 0)
		{
			AI_Output(self,other,"DIA_Harad_SellBlades_12_01");	//���, ��� � ���� ���� - ��� ���, ������� �� �����. �� ����� ������ ��� ����.
			return;
		};
	};
	if(anzahl >= 1)
	{
		AI_Output(self,other,"DIA_Harad_SellBlades_12_02");	//������ - ����� ����.
		b_giveinvitems(other,self,itmw_1h_common_01,anzahl);
		AI_Output(self,other,"DIA_Harad_SellBlades_12_03");	//�������. �����, ��� ���������.
		b_giveinvitems(self,other,itmi_gold,VALUE_COMMON1 * anzahl);
		HaradSwordsCounter += anzahl;
		ApprenticeGoldCounter += VALUE_COMMON1 * anzahl;
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_SellBlades_12_04");	//����� ������ ���! � �������� ������ ������� ����.
	};
};


instance DIA_HARAD_TEACHCOMMON(C_INFO)
{
	npc = vlk_412_harad;
	nr = 50;
	condition = dia_harad_teachcommon_condition;
	information = dia_harad_teachcommon_info;
	permanent = TRUE;
	description = b_buildlearnstring("����� ���� ������ ������� ����!",b_getlearncosttalent(other,NPC_TALENT_SMITH));
};


func int dia_harad_teachcommon_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) && (PLAYER_ISAPPRENTICE == APP_HARAD))
	{
		return TRUE;
	};
};

func void dia_harad_teachcommon_info()
{
	AI_Output(other,self,"DIA_Harad_TeachCommon_15_00");	//����� ���� ������ ������� ����!
	if(b_teachplayertalentsmith(self,other,WEAPON_COMMON))
	{
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_01");	//��� �������� ������, ������. ������ ����� ����� �����, � ������� ��� ��� �����, ���� �� �� ����������.
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_02");	//����� �������� ������ ����� �� ����������.
		AI_Output(self,other,"DIA_Harad_TeachCommon_12_03");	//���� ������ ��� ������� �� ������ ������������� ���������, �� ����� ���������� �� ��������� ���� �����.
	};
};


var int harad_merke_str;

instance DIA_HARAD_TEACHSTR(C_INFO)
{
	npc = vlk_412_harad;
	nr = 100;
	condition = dia_harad_teachstr_condition;
	information = dia_harad_teachstr_info;
	permanent = TRUE;
	description = "� ���� ����� �������!";
};


func int dia_harad_teachstr_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_HARAD)
	{
		return TRUE;
	};
};

func void dia_harad_teachstr_info()
{
	AI_Output(other,self,"DIA_Harad_TeachSTR_15_00");	//� ���� ����� �������!
	HARAD_MERKE_STR = other.attribute[ATR_STRENGTH];
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};

func void dia_harad_teachstr_back()
{
	if(HARAD_MERKE_STR < other.attribute[ATR_STRENGTH])
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_01");	//�� ��� �������� ������� ��������.
	};
	if(other.attribute[ATR_STRENGTH] < 50)
	{
		AI_Output(self,other,"DIA_Harad_TeachSTR_BACK_12_02");	//�����������, ���� ������ ��������� ���.
	};
	Info_ClearChoices(dia_harad_teachstr);
};

func void dia_harad_teachstr_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,50);
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};

func void dia_harad_teachstr_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,50);
	Info_ClearChoices(dia_harad_teachstr);
	Info_AddChoice(dia_harad_teachstr,DIALOG_BACK,dia_harad_teachstr_back);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_harad_teachstr_1);
	Info_AddChoice(dia_harad_teachstr,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_harad_teachstr_5);
};


instance DIA_HARAD_IMMERNOCH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_immernoch_condition;
	information = dia_harad_immernoch_info;
	permanent = FALSE;
	description = "�� ��� ��� ��������� �� ���������?";
};


func int dia_harad_immernoch_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_harad_immernoch_info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_01");	//�� ��� ��� ��������� �� ���������?
	AI_Output(self,other,"DIA_Harad_Add_12_02");	//� �������� ����� ����� ������.
	AI_Output(self,other,"DIA_Harad_Add_12_03");	//������ � ����� ���� ���� ���� �� ���������� ���� - �� �� ���� ��� �� �����.
	AI_Output(self,other,"DIA_Harad_Add_12_04");	//�� ������ � ���� ����� ���� �����, ����� ������ ������ ��� ��������� �� �������� �������.
	AI_Output(self,other,"DIA_Harad_Add_12_05");	//��� ��� ���� �� ����� ������� ���, �������� � ���.
};


instance DIA_HARAD_ABOUTERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_abouterzklingen_condition;
	information = dia_harad_abouterzklingen_info;
	permanent = FALSE;
	description = "�������� ��� � ����� �� ���������� ����!";
};


func int dia_harad_abouterzklingen_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_immernoch))
	{
		return TRUE;
	};
};

func void dia_harad_abouterzklingen_info()
{
	AI_Output(other,self,"DIA_Harad_Add_15_06");	//�������� ��� � ����� �� ���������� ����!
	AI_Output(self,other,"DIA_Harad_Waffen_12_02");	//�������� ����������� ���� - ����� ������� � ������� �������, �� � ���������� ���������� ����� ������� � ����������� �� ��������� ���.
	AI_Output(self,other,"DIA_Harad_Waffen_12_03");	//��� ����� ������� ���, �� ��� ��� ����������� ������������ ������ � ����� ��������.
	AI_Output(self,other,"DIA_Harad_Waffen_12_04");	//��� �������� ���������� ����� �������. � ����������, �� ���������� ������������ �������, ��������� �������� ���� �����!
};


instance DIA_HARAD_ERZKLINGEN(C_INFO)
{
	npc = vlk_412_harad;
	nr = 3;
	condition = dia_harad_erzklingen_condition;
	information = dia_harad_erzklingen_info;
	permanent = TRUE;
	description = "� ���� ������ ��� �� ���������� ����.";
};


func int dia_harad_erzklingen_condition()
{
	if((OREBLADEBOUGHT == FALSE) && Npc_KnowsInfo(other,dia_harad_abouterzklingen))
	{
		return TRUE;
	};
};


var int orebladebought;

func void dia_harad_erzklingen_info()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_15_00");	//� ���� ������ ��� �� ���������� ����.
	if(hero.guild != GIL_PAL)
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_01");	//� ����� ���������� ���� ������ ���������. � ������ �� ������ � ���� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_02");	//��, ��������, ������ ������� ���� ��������������, ��� ��� ��������� ������� ������ ������������� ������.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_03");	//�������� ������� ����� ������, � ���� ������� ���� ������ ���� ���������� ������.
		AI_Output(self,other,"DIA_Harad_Erzklingen_12_04");	//���, ��� � ���� ���������� ����?
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"��������� ��� (2000 ������)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"���������� ��� (2000 ������)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_back()
{
	Info_ClearChoices(dia_harad_erzklingen);
};

func void b_harad_notenoughgold()
{
	AI_Output(self,other,"B_Harad_NotEnoughGold_12_00");	//� ���� ������������ ������.
};

func void b_harad_havefunwithyoursword()
{
	AI_Output(self,other,"B_Harad_HaveGunWithYourSword_12_00");	//������ ���� ����� ������. ��� ����� ����� ���������.
	OREBLADEBOUGHT = TRUE;
	Info_ClearChoices(dia_harad_erzklingen);
};

func void dia_harad_erzklingen_2h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_2h_15_00");	//� ������ ��������� ���!
	if(Npc_HasItems(other,itmi_gold) >= VALUE_BLESSED_2H_1)
	{
		b_giveinvitems(other,self,itmi_gold,VALUE_BLESSED_2H_1);
		CreateInvItems(self,itmw_2h_blessed_01,1);
		b_giveinvitems(self,other,itmw_2h_blessed_01,1);
		b_harad_havefunwithyoursword();
	}
	else
	{
		b_harad_notenoughgold();
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"��������� ��� (2000 ������)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"���������� ��� (2000 ������)",dia_harad_erzklingen_1h);
	};
};

func void dia_harad_erzklingen_1h()
{
	AI_Output(other,self,"DIA_Harad_Erzklingen_1h_15_00");	//� ������ ���������� ���!
	if(Npc_HasItems(other,itmi_gold) >= VALUE_BLESSED_1H_1)
	{
		b_giveinvitems(other,self,itmi_gold,VALUE_BLESSED_1H_1);
		CreateInvItems(self,itmw_1h_blessed_01,1);
		b_giveinvitems(self,other,itmw_1h_blessed_01,1);
		b_harad_havefunwithyoursword();
	}
	else
	{
		b_harad_notenoughgold();
		Info_ClearChoices(dia_harad_erzklingen);
		Info_AddChoice(dia_harad_erzklingen,DIALOG_BACK,dia_harad_erzklingen_back);
		Info_AddChoice(dia_harad_erzklingen,"��������� ��� (2000 ������)",dia_harad_erzklingen_2h);
		Info_AddChoice(dia_harad_erzklingen,"���������� ��� (2000 ������)",dia_harad_erzklingen_1h);
	};
};


instance DIA_HARAD_REPAIRNECKLACE(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_repairnecklace_condition;
	information = dia_harad_repairnecklace_info;
	permanent = FALSE;
	description = "�� ������ ������������� ��������� �������?";
};


func int dia_harad_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_harad_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Harad_RepairNecklace_15_00");	//�� ������ ������ �������������?
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_01");	//� ���������, � �� ������. �������, ����� � ������ �� �� ������� ������, ��� ��� �� ������ ����.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_02");	//������ ���� � ���� ������� ������, � ����� ��� ������ �� ��������� ����������� �����.
	AI_Output(self,other,"DIA_Harad_RepairNecklace_12_03");	//����������� ���� ���� �� ����, ��� �� ������� �� ����.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_HARAD_GOLDSMITH(C_INFO)
{
	npc = vlk_412_harad;
	nr = 8;
	condition = dia_harad_goldsmith_condition;
	information = dia_harad_goldsmith_info;
	permanent = FALSE;
	description = "��� ��� ����� �������?";
};


func int dia_harad_goldsmith_condition()
{
	if(Npc_KnowsInfo(other,dia_harad_repairnecklace))
	{
		return TRUE;
	};
};

func void dia_harad_goldsmith_info()
{
	AI_Output(other,self,"DIA_Harad_Goldsmith_15_00");	//��� ��� ����� �������?
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_01");	//� ������, ��� � ��������� �� ����� ����� ���� ������� ������.
	AI_Output(self,other,"DIA_Harad_Goldsmith_12_02");	//�����, ���� ����� ������������ ���.
};


instance DIA_HARAD_PICKPOCKET(C_INFO)
{
	npc = vlk_412_harad;
	nr = 900;
	condition = dia_harad_pickpocket_condition;
	information = dia_harad_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_harad_pickpocket_condition()
{
	return c_beklauen(14,35);
};

func void dia_harad_pickpocket_info()
{
	Info_ClearChoices(dia_harad_pickpocket);
	Info_AddChoice(dia_harad_pickpocket,DIALOG_BACK,dia_harad_pickpocket_back);
	Info_AddChoice(dia_harad_pickpocket,DIALOG_PICKPOCKET,dia_harad_pickpocket_doit);
};

func void dia_harad_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_harad_pickpocket);
};

func void dia_harad_pickpocket_back()
{
	Info_ClearChoices(dia_harad_pickpocket);
};

