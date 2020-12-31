
instance DIA_BOSPER_EXIT(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 999;
	condition = dia_bosper_exit_condition;
	information = dia_bosper_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bosper_exit_condition()
{
	return TRUE;
};

func void dia_bosper_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BOSPER_HALLO(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_hallo_condition;
	information = dia_bosper_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bosper_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bosper_hallo_info()
{
	AI_Output(self,other,"DIA_Bosper_HALLO_11_00");	//����� ���������� � ��� �����, ���������!
	AI_Output(self,other,"DIA_Bosper_HALLO_11_01");	//� ������. � ����� ���� � ������ �������.
	AI_Output(self,other,"DIA_Bosper_HALLO_11_02");	//��� ������� ���� � �������?
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"������ ������ ���� � ������� �������. ��� ����� ��������� � ����� �����, � ������ ����� ������.");
};


instance DIA_BOSPER_INTOOV(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_intoov_condition;
	information = dia_bosper_intoov_info;
	permanent = FALSE;
	description = "��� ����� ������� � ������� �������...";
};


func int dia_bosper_intoov_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_intoov_info()
{
	AI_Output(other,self,"DIA_Bosper_IntoOV_15_00");	//��� ����� ������� � ������� �������...
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_01");	//��� ����� ��������? ������ �� ����.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_02");	//���� ����� ���� ��������� ����������� ���, ���� ��, ����� ��������� ������.
	AI_Output(self,other,"DIA_Bosper_IntoOV_11_03");	//� ������ ����� ���� �� �� ��� ���� �� �������.
	if(torwache_305.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(other,self,"DIA_Bosper_IntoOV_15_04");	//� ��� �������...
	};
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"����� ������� � ������� �������, � ���� ������ ����� ��������� �����������, ���� �������� ������.");
};


instance DIA_BOSPER_SEEKWORK(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_seekwork_condition;
	information = dia_bosper_seekwork_info;
	permanent = FALSE;
	description = "� ��� ������!";
};


func int dia_bosper_seekwork_condition()
{
	return TRUE;
};

func void dia_bosper_seekwork_info()
{
	AI_Output(other,self,"DIA_Bosper_SeekWork_15_00");	//� ��� ������!
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_01");	//��� - ��� �� ������� �� ����� ������.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_02");	//���������, ��� � ���� ���, ������ ���� ������ ���� ���� �����.
	AI_Output(self,other,"DIA_Bosper_SeekWork_11_03");	//�� ���-������ ������ �� �����, �?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_04");	//�����...
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_05");	//� ��� �� ������� ���� ������� ����� � ��������.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_06");	//� ���� ������ ������� ���� �� ������ �����, ��� �� ��������� ���.
	}
	else
	{
		AI_Output(other,self,"DIA_Bosper_SeekWork_15_07");	//� ���� ���� ���� ��������� ����, ���� �� ��� ���� � ����.
		AI_Output(self,other,"DIA_Bosper_SeekWork_11_08");	//�����������! ������� ��� ��� �����, ��� ���� ������� ������ - � ����� �� � ���� �� ����� ������� ����.
	};
	b_logentry(TOPIC_LEHRLING,"������ ���� ������ �������. � ���� ������ �������� � ����.");
};


var int bosper_hinttojob;
var int bosper_startguild;

instance DIA_BOSPER_LEHRLING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_lehrling_condition;
	information = dia_bosper_lehrling_info;
	permanent = TRUE;
	description = "� ���� ����� ����� ��������!";
};


func int dia_bosper_lehrling_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_lehrling_info()
{
	var int stimmen;
	stimmen = 0;
	AI_Output(other,self,"DIA_Bosper_LEHRLING_15_00");	//� ���� ����� ����� ��������!
	if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_01");	//(����������) �������! ������, �� ��� ������ ������.
		stimmen = stimmen + 1;
		if(harad.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if((MIS_HARAD_ORC == LOG_SUCCESS) || (MIS_HAKONBANDITS == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_02");	//����� �������, ��� �� ������� �������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_03");	//�� ����� ���� �� ������ � ����� ������������.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_04");	//�� ����� �������, ��� ������� �� ����� ����.
		};
		if(thorben.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_THORBEN_GETBLESSINGS == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_05");	//������ ���� ���� ���� �������������. � �� ��� �������, ��� ��, �� ��� �� ��� ������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_06");	//������ ���� ���� ���� ��������� ������ � ������������� �����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_07");	//������ ������� �� �����, ��� �� �����.
		};
		if(constantino.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(b_getgreatestpetzcrime(self) == CRIME_NONE)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_08");	//����������� �������, ��� �� ������ ����� �������� ���� ��������.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_09");	//����������� �������, ��� �� ����������� � ������������ � ������ - �������, ��� �����-������ ������?
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_10");	//����������, ����� ���� ������ ��� ������.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_11");	//����������� ������� ���� �� ������ � ����.
		};
		if(matteo.aivar[AIV_TALKEDTOPLAYER] == TRUE)
		{
			if(MIS_MATTEO_GOLD == LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_12");	//������ �������, ��� �� ������ ������� ��, ������� ������ ������ ������ ����.
				stimmen = stimmen + 1;
			}
			else if(MIS_MATTEO_GOLD == LOG_RUNNING)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_13");	//������ �������� � �����-�� ������ - � �� ����, ��� �� ����� � ����, �� ���� ����� ���������� � ���.
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_14");	//������ �������, ��� ��� �� ������� � ����� �� ����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_15");	//������ �������, ��� ������� �� ����� ����.
		};
		if(stimmen >= 4)
		{
			if(stimmen == 5)
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_16");	//��� ��������, ��� �� ������� ��������� ���� ��������!
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_LEHRLING_11_17");	//�� ������� ��������� ������� ��������. ����� ����������, ����� ���� �������� � �������.
			};
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_18");	//�� ������ ������ �������� �� ���� ����� ������ ��������.
			Info_ClearChoices(dia_bosper_lehrling);
			Info_AddChoice(dia_bosper_lehrling,"������ - � ������� ��� ����.",dia_bosper_lehrling_later);
			Info_AddChoice(dia_bosper_lehrling,"� ����� ����� ����� ��������!",dia_bosper_lehrling_ok);
		}
		else
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_19");	//���� ����� �������� ��������� ���� �� ������� ��������. ��� ����� �� �� ������� ����� �������� � ������ ����� ������.
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_20");	//��� ��������, ��� �� ������ ���������� �� �����, ��� ��� ����������� � ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_LEHRLING_11_21");	//������ ��� ����� ���� � ����, � ������ ������� ������, ����� �� �� ������ ���� �� ���-��.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_LEHRLING_11_22");	//�� ������ ����� ��� ���, �� ��� ������ �� ������� � ����� ������� ��������.
		};
		BOSPER_HINTTOJOB = TRUE;
	};
};

func void dia_bosper_lehrling_ok()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_OK_15_00");	//� ����� ����� ����� ��������!
	AI_Output(self,other,"DIA_Bosper_LEHRLING_OK_11_01");	//�� �� ��������� �� ����! �����, �� �����������.
	PLAYER_ISAPPRENTICE = APP_BOSPER;
	BOSPER_STARTGUILD = other.guild;
	BOSPER_LEHRLING_DAY = Wld_GetDay();
	Wld_AssignRoomToGuild("gritta",GIL_NONE);
	MIS_APPRENTICE = LOG_SUCCESS;
	b_giveplayerxp(XP_LEHRLING);
	b_logentry(TOPIC_BONUS,"������ ������ ���� � �������. ������ � ����� ������� � ������� �������.");
	Info_ClearChoices(dia_bosper_lehrling);
};

func void dia_bosper_lehrling_later()
{
	AI_Output(other,self,"DIA_Bosper_LEHRLING_Later_15_00");	//������ - � ������� ��� ����.
	AI_Output(self,other,"DIA_Bosper_LEHRLING_Later_11_01");	//������, �� ����� ���������� �������! �� ����� ����� ��������� ������ ��� ���� ������.
	Info_ClearChoices(dia_bosper_lehrling);
};


instance DIA_BOSPER_OTHERMASTERS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_othermasters_condition;
	information = dia_bosper_othermasters_info;
	permanent = FALSE;
	description = "� ��� ���� � ������ ��������� � ������� � ������� �������?";
};


func int dia_bosper_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_bosper_othermasters_info()
{
	AI_Output(other,self,"DIA_Bosper_OtherMasters_15_00");	//� ��� ���� � ������ ��������� � ������� � ������� �������?
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_01");	//(�����������) ����!
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_02");	//����� � ������ ��� ����� ��������.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_03");	//������� ����������� - �������� ����. � ���� �� ���� ������� ��� ������ ����.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_04");	//� ��� �������� ������� - ��� �����, ��� �� ������������. ��, ��������, ���� �� ������ ������� ����.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_05");	//� ��� ���, ��������, ����� ����� ������. � ����� � ������.
	AI_Output(self,other,"DIA_Bosper_OtherMasters_11_06");	//�� �� �����, ���� �������� �� ������ ����� - ���� ����������� ��������� ���� �������� �� ������ ����� ������...
};


instance DIA_BOSPER_BARTOK(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 4;
	condition = dia_bosper_bartok_condition;
	information = dia_bosper_bartok_info;
	permanent = FALSE;
	description = "� ������ ���� ������ ������ ������?";
};


func int dia_bosper_bartok_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_seekwork))
	{
		return TRUE;
	};
};

func void dia_bosper_bartok_info()
{
	AI_Output(other,self,"DIA_Bosper_Bartok_15_00");	//� ������ ���� ������ ������ ������?
	AI_Output(self,other,"DIA_Bosper_Bartok_11_01");	//��� �� ������, ��������� ����� ��������� ����� ������� ������.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_02");	//���� ���� ��� ������������� ���������, �� ������ �������� ��� �� ���� ���.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_03");	//��� ����� ������. ��, ��������, ��������� ���-�� � ������� ��������.
	AI_Output(self,other,"DIA_Bosper_Bartok_11_04");	//������ ����� ��������� ������ � ������� � ��������� ����� ����� ���.
};


instance DIA_BOSPER_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_zustimmung_condition;
	information = dia_bosper_zustimmung_info;
	permanent = TRUE;
	description = "� ������ ���� ��������� �� ������ � ������ ��������?";
};


func int dia_bosper_zustimmung_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_othermasters) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};


var int bosper_zustimmung_once;

func void dia_bosper_zustimmung_info()
{
	AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_00");	//� ������ ���� ��������� �� ������ � ������ ��������?
	if((MIS_BOSPER_BOGEN == LOG_SUCCESS) || (MIS_BOSPER_WOLFFURS == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_01");	//(�������������) � ��������, ��� �� �������� ����.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_02");	//�� ���� �� ����� ���...
		AI_Output(other,self,"DIA_Bosper_ZUSTIMMUNG_15_03");	//��� ��������, ��� �� ������������ �� ����?
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_04");	//���� ����� ������ �� �������� �� ����� ��������� - �� ��.
		if(MIS_BOSPER_BOGEN == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_05");	//�� ���� ��� �� ������ ����� ��� ���.
		};
		if(MIS_BOSPER_WOLFFURS == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_06");	//�� �� ���� �� ��������� ����� ������� �������!
		};
		if(BOSPER_ZUSTIMMUNG_ONCE == FALSE)
		{
			b_giveplayerxp(XP_ZUSTIMMUNG);
			BOSPER_ZUSTIMMUNG_ONCE = TRUE;
		};
		b_logentry(TOPIC_LEHRLING,"������ ���� ��� ���� ���������, ���� � ������ ����� �������� ������� �������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_07");	//(��������) ������! �� �������� ��� ��������� - �� ��� ����� �������.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_08");	//��������� �� ����, ���� �� �������.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_09");	//����� �������, �� ������� ������, �������� ���� ��� ������� ��� ���.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_10");	//� ��� ����� - ����� ��� ���� ��� ����������, ��� �� ���������� �� ����.
		AI_Output(self,other,"DIA_Bosper_ZUSTIMMUNG_11_11");	//���� �� ���������� �����, ����� ����� ���� ��������, �� �� ����� ��������� � ������ ��������.
		BOSPER_HINTTOJOB = TRUE;
	};
};


instance DIA_BOSPER_JOB(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_job_condition;
	information = dia_bosper_job_info;
	permanent = FALSE;
	description = "��� �� ������, ����� � ������ ��� ����?";
};


func int dia_bosper_job_condition()
{
	if(BOSPER_HINTTOJOB == TRUE)
	{
		return TRUE;
	};
};

func void dia_bosper_job_info()
{
	AI_Output(other,self,"DIA_Bosper_Job_15_00");	//��� �� ������, ����� � ������ ��� ����?
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_01");	//� ����� ���� ������� ����� � ��������, � �� ��������� ��� - ������ - ��������� ������� ����.
		Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
		b_logentry(TOPIC_CITYTEACHER,"������ ����� ������� ���� ������� ����� � ��������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_02");	//������� ��� ��������� ������� ����.
	};
	AI_Output(self,other,"DIA_Bosper_Job_11_03");	//����� � �����, ��� �� ������ ��� �������.
	AI_Output(self,other,"DIA_Bosper_Job_11_04");	//���� ������ � ���� �� ����� �� ��� ����� ��������, � ���� ����� ����� � ���������� ���������. � ����� � ������ ���� � ����, ���� �� ��������.
	if(Npc_KnowsInfo(other,dia_bosper_othermasters))
	{
		AI_Output(self,other,"DIA_Bosper_Job_11_05");	//��� (��������) �� ������� ����� �������� ������� ������� - ���� �� ����� ������������� ������.
	};
	MIS_BOSPER_WOLFFURS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOSPERWOLF,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERWOLF,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERWOLF,"� ������ �������� ������� ����� ������� ����. ����� � ����� ���� �������� �� ����, ���� ������ ��� ��������� �� ������ � ������� ���������.");
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
	{
		b_logentry(TOPIC_BOSPERWOLF,"� ������ ��������� ��� ������� ���� ������� ����� � ��������.");
	};
};


instance DIA_BOSPER_BRINGFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 102;
	condition = dia_bosper_bringfur_condition;
	information = dia_bosper_bringfur_info;
	permanent = TRUE;
	description = "������ ������� ����...";
};


func int dia_bosper_bringfur_condition()
{
	if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bosper_bringfur_info()
{
	AI_Output(other,self,"DIA_Bosper_BringFur_15_00");	//������ ������� ����...
	if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_01");	//�� ��� ���� �������� ������� �������. � ���� �������� � ���� ����� �� ������� ����.
		MIS_BOSPER_WOLFFURS = LOG_OBSOLETE;
		return;
	};
	if(b_giveinvitems(other,self,itat_wolffur,6))
	{
		AI_Output(other,self,"DIA_Bosper_BringFur_15_02");	//� ������ �� - ���.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_03");	//�������! � ����, ��� �� ��������� ��� ���� ������.
		AI_Output(self,other,"DIA_Bosper_BringFur_11_04");	//��� ������, ��� � � ������ ����.
		b_giveinvitems(self,other,itmi_gold,VALUE_WOLFFUR * 6);
		BosperFurCounter += 6;
		ApprenticeGoldCounter += VALUE_WOLFFUR * 6;
		AI_Output(self,other,"DIA_Bosper_BringFur_11_05");	//�? ��� �������? ����� ��� �� �����, ��� ������� ��� ������ ���� �������� ��� ��������� ��������� � ������� �������?
		MIS_BOSPER_WOLFFURS = LOG_SUCCESS;
		b_logentry(TOPIC_LEHRLING,"������ ������ ���� � �������, ���� ������ ������� �� ����� ������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_BringFur_11_06");	//�� ������������ �� ��������� - �� � ���� ��� ���� �����. ��� � ������ ��� �����.
	};
};


instance DIA_BOSPER_TEACHFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 2;
	condition = dia_bosper_teachfur_condition;
	information = dia_bosper_teachfur_info;
	permanent = TRUE;
	description = "����� ���� ������� ����� � ��������! (5 ����� ��������)";
};


func int dia_bosper_teachfur_condition()
{
	if(Npc_KnowsInfo(other,dia_bosper_job) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE))
	{
		return TRUE;
	};
};

func void dia_bosper_teachfur_info()
{
	AI_Output(other,self,"DIA_Bosper_TeachFUR_15_00");	//����� ���� ������� ����� � ��������!
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_01");	//������. ������. ��� �������� ������.
		AI_Output(self,other,"DIA_Bosper_TeachFUR_11_02");	//������ ������ ��� � ���������� ����� ���������. ����� ������� ��������� ��������� �������� �� ���������� ������� ���, � �������� �����.
		if(MIS_BOSPER_WOLFFURS == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Bosper_TeachFUR_11_03");	//������� ��� ������ �����, � ��� ���������...
			b_logentry(TOPIC_BOSPERWOLF,"������ ������ ���� ������� ����� � ��������.");
		};
	};
};


instance DIA_BOSPER_TRADE(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 700;
	condition = dia_bosper_trade_condition;
	information = dia_bosper_trade_info;
	permanent = TRUE;
	description = "������ ��� ���� ������.";
};


func int dia_bosper_trade_condition()
{
	if(MIS_BOSPER_WOLFFURS != LOG_RUNNING)
	{
		dia_bosper_trade.trade = TRUE;
	};
	return TRUE;
};

func void dia_bosper_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Bosper_Trade_15_00");	//������ ��� ���� ������.
	if(dia_bosper_trade.trade == TRUE)
	{
		b_givetradeinv(self);
		Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
		mcbolzenamount = KAPITEL * 50;
		CreateInvItems(self,itrw_bolt,mcbolzenamount);
		Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
		mcarrowamount = KAPITEL * 50;
		CreateInvItems(self,itrw_arrow,mcarrowamount);
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_Trade_11_01");	//�� ����� �� ��� ����, ����� ������������ ��� ������, �� ������ �������� ��� �����!
		AI_Output(self,other,"DIA_Bosper_Trade_11_02");	//��� ��� ������ �� ����!
	};
};


instance DIA_BOSPER_BOGENRUNNING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 5;
	condition = dia_bosper_bogenrunning_condition;
	information = dia_bosper_bogenrunning_info;
	permanent = FALSE;
	description = "� ������, ��� � ���� ���-�� ������.";
};


func int dia_bosper_bogenrunning_condition()
{
	if(MIS_BOSPER_BOGEN == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_bosper_bogenrunning_info()
{
	AI_Output(other,self,"DIA_Bosper_BogenRunning_15_00");	//� ������, ��� � ���� ���-�� ������.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_01");	//��� ������ ���� ���? �������� ������, ��? ��� ���, ������ ������ ���� ������� ����? ��, �����.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_02");	//�� ���� � �������� �� ����� �������, ������� ������� ��� �� �������!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_03");	//� ��������� �� ����� ����� ����� �� ������. � ����� ��������, � ������ ������, ��� �� ������� - � ���� ����� �� �����.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_04");	//� ��� �� ������ ������, �� ���� ������� ������� � ������. � ��� �������� ��� ���!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_05");	//� ������� �� ��� ���� ����� �� ���, � ��������� �������� ���� �������� �������. �� ������ �� �����.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_06");	//���������!
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_07");	//����� ����������, ��� ��� ��� ��� ��� ��������� ���-�� � ������. � ��������� �� ������� � ����� ��������� �����, �� ��� �� ������, ����� ���-������ ������� �� ������ � �����.
	AI_Output(self,other,"DIA_Bosper_BogenRunning_11_08");	//����� � �������� �� ����� �������...
	Log_CreateTopic(TOPIC_BOSPERBOGEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOSPERBOGEN,LOG_RUNNING);
	b_logentry(TOPIC_BOSPERBOGEN,"� ������� ��� ������� ���. ��� ������� � ������, � ������� ���. ��������� �������� �������� �������, �� ��� ������ �� �����, ���� ��� ��� ��� ������ ���� � ������.");
};


instance DIA_BOSPER_BOGENSUCCESS(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 6;
	condition = dia_bosper_bogensuccess_condition;
	information = dia_bosper_bogensuccess_info;
	permanent = FALSE;
	description = "� �����, ��� ���� ���...";
};


func int dia_bosper_bogensuccess_condition()
{
	if(Npc_HasItems(other,itrw_bow_l_03_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_bosper_bogensuccess_info()
{
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_00");	//� �����, ��� ���� ���...
	b_giveinvitems(other,self,itrw_bow_l_03_mis,1);
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_01");	//��� ���! ��� �� ����� ���?
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_02");	//� ������ ����, ������ ����.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_03");	//�������, � ���� �� �������� ������� ��-�� �����...
	AI_Output(other,self,"DIA_Bosper_BogenSuccess_15_04");	//��� - ��� ����������� ������ ����� � ������.
	AI_Output(self,other,"DIA_Bosper_BogenSuccess_11_05");	//�� - �� ��� �� �������. � ���� �������!
	MIS_BOSPER_BOGEN = LOG_SUCCESS;
	b_giveplayerxp(XP_BOSPER_BOGEN);
	Npc_RemoveInvItems(self,itrw_bow_l_03_mis,1);
};


var int bosper_island;

instance DIA_BOSPER_PERM(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 10;
	condition = dia_bosper_perm_condition;
	information = dia_bosper_perm_info;
	permanent = TRUE;
	description = "��� ���������� � ������?";
};


func int dia_bosper_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_bosper_perm_info()
{
	AI_Output(other,self,"DIA_Bosper_PERM_15_00");	//��� ���������� � ������?
	if(BOSPER_ISLAND == FALSE)
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_01");	//���� ���� ������������� ������� ������� �� ���, ����� ������ ������ �������.
		AI_Output(self,other,"DIA_Bosper_PERM_11_02");	//� ������ ����� ������ ���� ������� - � ��� �������� ��������. � �� �����, ��� ��� ���������� ��� ��� �������� �������.
		AI_Output(other,self,"DIA_Bosper_PERM_15_03");	//� ��� ������� ������� ��������� ������?
		AI_Output(self,other,"DIA_Bosper_PERM_11_04");	//���, ������ �� ��� �� �������� ���� ������ ��� �������.
		BOSPER_ISLAND = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_PERM_11_05");	//���� ��� ������� ��������. ���� ������, ����� �����.
	};
};


var int bosper_milkommentar;
var int bosper_palkommentar;
var int bosper_innoskommentar;

instance DIA_BOSPER_ALSLEHRLING(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_alslehrling_condition;
	information = dia_bosper_alslehrling_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bosper_alslehrling_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_BOSPER) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bosper_alslehrling_info()
{
	if((other.guild == GIL_MIL) && (BOSPER_STARTGUILD != GIL_MIL) && (BOSPER_MILKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_00");	//�� ���, ������� � ���������, ��?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_01");	//���, � �����-��, ��� �����. ���� �� ��, ������ ����� � ��������, �������� ����� � �� ������. (����������)
		BOSPER_MILKOMMENTAR = TRUE;
	}
	else if((other.guild == GIL_PAL) && (BOSPER_STARTGUILD != GIL_PAL) && (BOSPER_PALKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_02");	//������, ���� ������� ���������� ������������� �����. ������� ������!
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_03");	//�� ���� �� �� ������� ����, �����, �� ������� ������ ������� �������...
		BOSPER_PALKOMMENTAR = TRUE;
	}
	else if(((other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (BOSPER_STARTGUILD != GIL_NOV) && (BOSPER_STARTGUILD != GIL_KDF) && (BOSPER_INNOSKOMMENTAR == FALSE))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_04");	//�� ��������� � ���������, ��? �������, ��� ����� ��������� ���� ���� ������, � �� ������� ��������� ��� �����...
		BOSPER_INNOSKOMMENTAR = TRUE;
	}
	else if((BOSPER_LEHRLING_DAY <= (Wld_GetDay() - 4)) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_05");	//��� �� �������� ��� �����?
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_06");	//��� ����� ��� �����. �� ������ ��?
		BOSPER_LEHRLING_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_AlsLehrling_11_07");	//������, �������...
		BOSPER_LEHRLING_DAY = Wld_GetDay();
	};
};


instance DIA_BOSPER_AUFGABEN(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 1;
	condition = dia_bosper_aufgaben_condition;
	information = dia_bosper_aufgaben_info;
	permanent = FALSE;
	description = "��� ������ ������ ������?";
};


func int dia_bosper_aufgaben_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_BOSPER)
	{
		return TRUE;
	};
};

func void dia_bosper_aufgaben_info()
{
	AI_Output(other,self,"DIA_Bosper_Aufgaben_15_00");	//��� ������ ������ ������?
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_01");	//��� ������. ������� ��� ��� �����, ��� ������� ������.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_02");	//� ��� ���� �� ��� ����� ������� ����, ��� ����� ������ �� ������� ���������.
	AI_Output(self,other,"DIA_Bosper_Aufgaben_11_03");	//��, � � ��������� �����, ���� �� ����������� ���������� � ���� �����. � � ���� ��� ������� ����������.
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Bosper_Aufgaben_15_04");	//� ��� � ���� �����?
		AI_Output(self,other,"DIA_Bosper_Aufgaben_11_05");	//� ���� ����� ��� ����� ��� ����. �� �� ������ ������� ��������� ����� � ����� �� �������� �������.
	};
	Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
	b_logentry(TOPIC_BONUS,"������ ����� ������� ����� ������� ���� �� ����� ��������.");
};


var int bosper_trollfursold;

instance DIA_BOSPER_SELLFUR(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 600;
	condition = dia_bosper_sellfur_condition;
	information = dia_bosper_sellfur_info;
	permanent = TRUE;
	description = "� ������ ��������� ���� ��� ����...";
};


func int dia_bosper_sellfur_condition()
{
	if(PLAYER_ISAPPRENTICE == APP_BOSPER)
	{
		return TRUE;
	};
};

func void dia_bosper_sellfur_info()
{
	var int furs;
	AI_Output(other,self,"DIA_Bosper_SellFur_15_00");	//� ������ ��������� ���� ��� ����...
	furs = Npc_HasItems(other,itat_sheepfur) + Npc_HasItems(other,itat_wolffur) + Npc_HasItems(other,itat_wargfur) + Npc_HasItems(other,itat_shadowfur) + Npc_HasItems(other,itat_trollfur) + Npc_HasItems(other,itat_trollblackfur);
	if(furs > 0)
	{
		BosperFurCounter += furs;
		ApprenticeGoldCounter += (Npc_HasItems(other,itat_sheepfur) * VALUE_SHEEPFUR) + (Npc_HasItems(other,itat_wolffur) * VALUE_WOLFFUR) + (Npc_HasItems(other,itat_wargfur) * VALUE_WARGFUR) + (Npc_HasItems(other,itat_shadowfur) * VALUE_SHADOWFUR) + (Npc_HasItems(other,itat_trollfur) * VALUE_TROLLFUR) + (Npc_HasItems(other,itat_trollblackfur) * VALUE_TROLLBLACKFUR);
		if(Npc_HasItems(other,itat_sheepfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_01");	//������ �����? �� ���� �� ������ ���� �������� �� ���������, ���?
			AI_Output(other,self,"DIA_Bosper_SellFur_15_02");	//� ���� � �� ����� ���������� ����...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_sheepfur) * VALUE_SHEEPFUR);
			b_giveinvitems(other,self,itat_sheepfur,Npc_HasItems(other,itat_sheepfur));
		};
		if(Npc_HasItems(other,itat_wolffur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_03");	//������ ����� ��� ������...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wolffur) * VALUE_WOLFFUR);
			b_giveinvitems(other,self,itat_wolffur,Npc_HasItems(other,itat_wolffur));
		};
		if(Npc_HasItems(other,itat_wargfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_04");	//����� �����? ��� ������� ����� ...
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_wargfur) * VALUE_WARGFUR);
			b_giveinvitems(other,self,itat_wargfur,Npc_HasItems(other,itat_wargfur));
		};
		if(Npc_HasItems(other,itat_shadowfur) > 0)
		{
			AI_Output(self,other,"DIA_Bosper_SellFur_11_05");	//��, � ���� ����� ��������� - ��� �������� �����.
			b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_shadowfur) * VALUE_SHADOWFUR);
			b_giveinvitems(other,self,itat_shadowfur,Npc_HasItems(other,itat_shadowfur));
		};
		if((Npc_HasItems(other,itat_trollfur) > 0) || (Npc_HasItems(other,itat_trollblackfur) > 0))
		{
			if(BOSPER_TROLLFURSOLD == FALSE)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_06");	//� ��� ��� �� �����, ���� ������?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_07");	//� ���� �� � ������.
				AI_Output(self,other,"DIA_Bosper_SellFur_11_08");	//���... ��� ����� ����� ���������.
				BOSPER_TROLLFURSOLD = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_09");	//��� ���� ����� ��������� ������... �� ���, ��������� �� ���?
				AI_Output(other,self,"DIA_Bosper_SellFur_15_10");	//����� � ��������� �� ������ �� ���, � �� ������� ����� �����������...
			};
			if(Npc_HasItems(other,itat_trollfur) > 0)
			{
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollfur) * VALUE_TROLLFUR);
				b_giveinvitems(other,self,itat_trollfur,Npc_HasItems(other,itat_trollfur));
			};
			if(Npc_HasItems(other,itat_trollblackfur) > 0)
			{
				AI_Output(self,other,"DIA_Bosper_SellFur_11_11");	//� ����� ������� ������, ���� ��!
				b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_trollblackfur) * VALUE_TROLLBLACKFUR);
				b_giveinvitems(other,self,itat_trollblackfur,Npc_HasItems(other,itat_trollblackfur));
			};
		};
		AI_Output(self,other,"DIA_Bosper_SellFur_11_12");	//�������� ������. ������ �� ��� ���, ����� � ���� ����� �����...
	}
	else
	{
		AI_Output(self,other,"DIA_Bosper_SellFur_11_13");	//��, ������ - ���� ���������� ������ ����� ������, ���������� � �� ��������...
	};
};


instance DIA_BOSPER_MINENANTEIL(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 3;
	condition = dia_bosper_minenanteil_condition;
	information = dia_bosper_minenanteil_info;
	description = "� ����, �� �������� ����� ����.";
};


func int dia_bosper_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bosper_minenanteil_info()
{
	AI_Output(other,self,"DIA_Bosper_Minenanteil_15_00");	//� ����, �� �������� ����� ����.
	AI_Output(self,other,"DIA_Bosper_Minenanteil_11_01");	//��. � ������ �� ���� �� ����. �� ������ ������� ��, ���� ������.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_BOSPER_PICKPOCKET(C_INFO)
{
	npc = vlk_413_bosper;
	nr = 900;
	condition = dia_bosper_pickpocket_condition;
	information = dia_bosper_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_bosper_pickpocket_condition()
{
	return c_beklauen(67,120);
};

func void dia_bosper_pickpocket_info()
{
	Info_ClearChoices(dia_bosper_pickpocket);
	Info_AddChoice(dia_bosper_pickpocket,DIALOG_BACK,dia_bosper_pickpocket_back);
	Info_AddChoice(dia_bosper_pickpocket,DIALOG_PICKPOCKET,dia_bosper_pickpocket_doit);
};

func void dia_bosper_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bosper_pickpocket);
};

func void dia_bosper_pickpocket_back()
{
	Info_ClearChoices(dia_bosper_pickpocket);
};

