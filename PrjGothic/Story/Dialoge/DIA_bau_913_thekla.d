
instance DIA_THEKLA_EXIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 999;
	condition = dia_thekla_exit_condition;
	information = dia_thekla_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_thekla_exit_condition()
{
	return TRUE;
};

func void dia_thekla_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THEKLA_HALLO(C_INFO)
{
	npc = bau_913_thekla;
	nr = 1;
	condition = dia_thekla_hallo_condition;
	information = dia_thekla_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_hallo_condition()
{
	return TRUE;
};

func void dia_thekla_hallo_info()
{
	AI_Output(self,other,"DIA_Thekla_HALLO_17_00");	//��� �� ������� �����, �� ���� �����?
};


instance DIA_THEKLA_LECKER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 2;
	condition = dia_thekla_lecker_condition;
	information = dia_thekla_lecker_info;
	permanent = FALSE;
	description = "��� � ���� ����� ������ ������!";
};


func int dia_thekla_lecker_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_lecker_info()
{
	AI_Output(other,self,"DIA_Thekla_Lecker_15_00");	//��� � ���� ����� ������ ������!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_01");	//�� ������������! � ���� �����, ��� ��, ��� �����������! ��� �� ������� ������ ������!
	AI_Output(self,other,"DIA_Thekla_Lecker_17_02");	//������� �� ��������� ��������������, � �����, ����� �� ��� ���-�� �����, �� ������ �� �������!
};


var int thekla_gavestew;

instance DIA_THEKLA_HUNGER(C_INFO)
{
	npc = bau_913_thekla;
	nr = 3;
	condition = dia_thekla_hunger_condition;
	information = dia_thekla_hunger_info;
	permanent = FALSE;
	description = "� �������!";
};


func int dia_thekla_hunger_condition()
{
	if(THEKLA_GAVESTEW == FALSE)
	{
		return TRUE;
	};
};

func void dia_thekla_hunger_info()
{
	AI_Output(other,self,"DIA_Thekla_Hunger_15_00");	//� �������!
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_01");	//� �� ������ ������. � ������ ������ ���, ��� ��������.
		AI_Output(self,other,"DIA_Thekla_Hunger_17_02");	//(������������) � ���� �����, ���������, �������.
	}
	else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_03");	//��� ���� ���.
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_04");	//�� �� ����������� ����� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_Hunger_17_05");	//��� � ���� �������� ��������� ������?
		b_giveinvitems(self,other,itfo_xpstew,1);
		THEKLA_GAVESTEW = TRUE;
	};
};


instance DIA_THEKLA_ARBEIT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_arbeit_condition;
	information = dia_thekla_arbeit_info;
	permanent = FALSE;
	description = "� ��� ������.";
};


func int dia_thekla_arbeit_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_arbeit_info()
{
	AI_Output(other,self,"DIA_Thekla_Arbeit_15_00");	//� ��� ������...
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_01");	//�� ������ �������� �����, �� �����?
	AI_Output(self,other,"DIA_Thekla_Arbeit_17_02");	//���� ������ ����� ������ ������ ����. ��� ����� ���, ��� � ��� ������.
};


instance DIA_THEKLA_WANNAJOIN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 5;
	condition = dia_thekla_wannajoin_condition;
	information = dia_thekla_wannajoin_info;
	permanent = FALSE;
	description = "������-�� � ���������� �������������� � ���������...";
};


func int dia_thekla_wannajoin_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_thekla_arbeit))
	{
		return TRUE;
	};
};

func void dia_thekla_wannajoin_info()
{
	AI_Output(other,self,"DIA_Thekla_WannaJoin_15_00");	//������-�� � ���������� �������������� � ���������...
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_01");	//��� �� ���� ���������� �� �������?
	AI_Output(self,other,"DIA_Thekla_WannaJoin_17_02");	//� ����� �� ����������! ������ ���� � �����! ����� ������ ����� ��� � ��� �������!
};


instance DIA_THEKLA_SCHLAFEN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 6;
	condition = dia_thekla_schlafen_condition;
	information = dia_thekla_schlafen_info;
	permanent = FALSE;
	description = "��� ��� ����� �������?";
};


func int dia_thekla_schlafen_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_thekla_schlafen_info()
{
	AI_Output(other,self,"DIA_Thekla_Schlafen_15_00");	//��� ��� ����� �������?
	AI_Output(self,other,"DIA_Thekla_Schlafen_17_01");	//���� �� ����� ����� � ���� �����. ����� ���� ����� � �����.
};


instance DIA_THEKLA_PROBLEM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_problem_condition;
	information = dia_thekla_problem_info;
	permanent = FALSE;
	description = "������ �� �� ������ ���������?";
};


func int dia_thekla_problem_condition()
{
	if((KAPITEL <= 3) && Npc_KnowsInfo(other,dia_thekla_wannajoin))
	{
		return TRUE;
	};
};

func void dia_thekla_problem_info()
{
	AI_Output(other,self,"DIA_Thekla_Problem_15_00");	//������ �� �� ������ ���������?
	AI_Output(self,other,"DIA_Thekla_Problem_17_01");	//��, ��� ������� ��������� ��� �� �����! �������� ������� � ��� ������ �������� �����.
	AI_Output(self,other,"DIA_Thekla_Problem_17_02");	//��� ���� ����� ��� ���, � ����, ������ ����� �������� � ��������� ��� �����.
	AI_Output(self,other,"DIA_Thekla_Problem_17_03");	//�� ��� �� ������� �������, �� ���� ������� �������, �� � ��� ���� ��������...
	if(other.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Thekla_Problem_15_04");	//� ������ �� ������ �� ������� � ����?
		AI_Output(self,other,"DIA_Thekla_Problem_17_05");	//� ��� � ���� �������, ������ ������-��������? ������� �� ����� �������? ��, � ��������� ��� ��������, �� ���� ��� ������� ������� ����� ������� �����!
	};
};


instance DIA_THEKLA_MANIEREN(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_manieren_condition;
	information = dia_thekla_manieren_info;
	permanent = FALSE;
	description = "������, � ����� ���� ����� ������� �������?";
};


func int dia_thekla_manieren_condition()
{
	if(Npc_KnowsInfo(other,dia_thekla_problem) && (sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_thekla_manieren_info()
{
	AI_Output(other,self,"DIA_Thekla_Manieren_15_00");	//������, � ����� ���� ����� ������� �������?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_01");	//���� ����� �� ����������� � ����. ��� � ����, � ������� ���������� �������. ��� ������ ��������.
	AI_Output(other,self,"DIA_Thekla_Manieren_15_02");	//� ��� ������ �����?
	AI_Output(self,other,"DIA_Thekla_Manieren_17_03");	//���� ������ ����� ��� ���. ���� �� ����� ���������� �� �����, ��� ������� ��������� ������ ���� ��� �������.
};


instance DIA_THEKLA_AFTERFIGHT(C_INFO)
{
	npc = bau_913_thekla;
	nr = 7;
	condition = dia_thekla_afterfight_condition;
	information = dia_thekla_afterfight_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thekla_afterfight_condition()
{
	if((sylvio.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || (bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || ((bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (KAPITEL <= 3)))
	{
		return TRUE;
	};
};

func void dia_thekla_afterfight_info()
{
	if(bullco.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_00");	//�� ������������� ���� ������ ���� �� ����� �����.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_01");	//������ ����, �� ����� �����, ���� ������� ��� ������ ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_02");	//�� ���, ������� �� ������ ���������?
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_03");	//� �� ���� �������������! ������ �� ���������, ��� � ����� � ����?
		AI_Output(other,self,"DIA_Thekla_AfterFight_15_04");	//� ���, ��� �������� ���� ���� ������������.
		AI_Output(self,other,"DIA_Thekla_AfterFight_17_05");	//�� ������������� ���. �� ������ �� ������, ��� ��������� �� ���� �������.
	};
	AI_Output(self,other,"DIA_Thekla_AfterFight_17_06");	//���, ����� �������. ��� ����������� ���� ����.
	b_giveinvitems(self,other,itfo_xpstew,1);
	THEKLA_GAVESTEW = TRUE;
};


instance DIA_THEKLA_SAGITTAPAKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 4;
	condition = dia_thekla_sagittapaket_condition;
	information = dia_thekla_sagittapaket_info;
	permanent = TRUE;
	description = "��� ����� �� �������.";
};


func int dia_thekla_sagittapaket_condition()
{
	if(Npc_HasItems(other,itmi_theklaspaket) && (MIS_THEKLA_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_thekla_sagittapaket_info()
{
	b_giveinvitems(other,self,itmi_theklaspaket,1);
	AI_Output(other,self,"DIA_Thekla_SagittaPaket_15_00");	//��� ����� �� �������.
	AI_Output(self,other,"DIA_Thekla_SagittaPaket_17_01");	//�������� �������. �� ���� ���� ���� �����-�� ������ � ������� �� ������.
	MIS_THEKLA_PAKET = LOG_SUCCESS;
	b_giveplayerxp(XP_THEKLASPAKET);
};


var int thekla_mehreintopfkap1;
var int thekla_mehreintopfkap3;
var int thekla_mehreintopfkap5;

instance DIA_THEKLA_PERM(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_perm_condition;
	information = dia_thekla_perm_info;
	permanent = TRUE;
	description = "�� ��� �� ���� ��� ����� ��������?";
};


func int dia_thekla_perm_condition()
{
	if(THEKLA_GAVESTEW == TRUE)
	{
		return TRUE;
	};
};

func void dia_thekla_perm_info()
{
	AI_Output(other,self,"DIA_Thekla_PERM_15_00");	//�� ��� �� ���� ��� ����� ��������?
	if(MIS_THEKLA_PAKET == FALSE)
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_01");	//��� �����������.
		AI_Output(other,self,"DIA_Thekla_PERM_15_02");	//�� �������� ���� ��������� �����?
		AI_Output(self,other,"DIA_Thekla_PERM_17_03");	//���.
		AI_Output(other,self,"DIA_Thekla_PERM_15_04");	//� ���� �������� ������, �?
		AI_Output(self,other,"DIA_Thekla_PERM_17_05");	//��������!
		AI_Output(self,other,"DIA_Thekla_PERM_17_06");	//���� ���� ��� ����������� ��� ��������, ���� �������� ������� ���-���, ����� �������� ��.
		AI_Output(other,self,"DIA_Thekla_PERM_15_07");	//���?
		AI_Output(self,other,"DIA_Thekla_PERM_17_08");	//����� � �������, ��������, ��� ����� �� ������ ������, � ������� ��� �� ��� ����� � ������.
		AI_Output(self,other,"DIA_Thekla_PERM_17_09");	//���� �� ��������� ��� ��� �����, � ����� �������� ��� ����.
		MIS_THEKLA_PAKET = LOG_RUNNING;
		Log_CreateTopic(TOPIC_THEKLAEINTOPF,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_THEKLAEINTOPF,LOG_RUNNING);
		b_logentry(TOPIC_THEKLAEINTOPF,"���� � ������� ����� ����� �� �������� �������, ��� ������ ��� ���� �������� ��� ����. ������� ����� �� ������ ������.");
	}
	else if(MIS_THEKLA_PAKET == LOG_SUCCESS)
	{
		if(KAPITEL <= 2)
		{
			if(THEKLA_MEHREINTOPFKAP1 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_10");	//������. � ������� ��� �����. ���, �����. �� ���� ��������, ��� �� �������� �� ������ � ���� �� ������.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP1 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_11");	//��, ��, ��! �� ���� ����� ������! � ��� ���� �����, ���� � ���� �������� ��� ������ ��� ����.
				AI_Output(self,other,"DIA_Thekla_PERM_17_12");	//� ����� �� �������� ��� ���� ��������, �������?
			};
		};
		if((KAPITEL == 3) || (KAPITEL == 4))
		{
			if((THEKLA_MEHREINTOPFKAP3 == FALSE) && (MIS_RESCUEBENNET == LOG_SUCCESS))
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_13");	//� �������, �� ����� ������� ��������� �� ������. �������� ������, ������.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP3 = TRUE;
			}
			else if(MIS_RESCUEBENNET != LOG_SUCCESS)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_14");	//��� ������� �� ��������� ������� ������� �� �������.
				AI_Output(self,other,"DIA_Thekla_PERM_17_15");	//����� ��� ������, ������� ��� ������, ������? � ��� �������� � ����� ��� ���� ����� ������� ��������.
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_16");	//� ���� ������ �� ��������. ������ �����.
			};
		};
		if(KAPITEL >= 5)
		{
			if(THEKLA_MEHREINTOPFKAP5 == FALSE)
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_17");	//�� ���, ������ ����� ��������? � ��� �� ����� ��� ��� �����?
				AI_Output(other,self,"DIA_Thekla_PERM_15_18");	//� ��������� ���������� ��������.
				AI_Output(self,other,"DIA_Thekla_PERM_17_19");	//��! ����� ���� ������������� �� �������� ����� ������� ��������.
				b_giveinvitems(self,other,itfo_xpstew,1);
				THEKLA_MEHREINTOPFKAP5 = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Thekla_PERM_17_20");	//���! �������� ��� �����������.
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Thekla_PERM_17_21");	//��� ����, ��� �������� - �������?
	};
};


instance DIA_THEKLA_PICKPOCKET(C_INFO)
{
	npc = bau_913_thekla;
	nr = 900;
	condition = dia_thekla_pickpocket_condition;
	information = dia_thekla_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_thekla_pickpocket_condition()
{
	return c_beklauen(53,60);
};

func void dia_thekla_pickpocket_info()
{
	Info_ClearChoices(dia_thekla_pickpocket);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_BACK,dia_thekla_pickpocket_back);
	Info_AddChoice(dia_thekla_pickpocket,DIALOG_PICKPOCKET,dia_thekla_pickpocket_doit);
};

func void dia_thekla_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thekla_pickpocket);
};

func void dia_thekla_pickpocket_back()
{
	Info_ClearChoices(dia_thekla_pickpocket);
};

