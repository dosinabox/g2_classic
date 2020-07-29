
instance DIA_ISGAROTH_EXIT(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 999;
	condition = dia_isgaroth_exit_condition;
	information = dia_isgaroth_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_isgaroth_exit_condition()
{
	return TRUE;
};

func void dia_isgaroth_exit_info()
{
	AI_Output(self,other,"DIA_Isgaroth_EXIT_01_00");	//����� ����� ������ �������� ���� ����.
	AI_StopProcessInfos(self);
};


instance DIA_ISGAROTH_HELLO(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 2;
	condition = dia_isgaroth_hello_condition;
	information = dia_isgaroth_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_isgaroth_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_isgaroth_hello_info()
{
	AI_Output(self,other,"DIA_Isgaroth_Hello_01_00");	//�� �������� � ����� �����. ��� � ���� ������� ��� ����, ��������?
};


instance DIA_ISGAROTH_SEGEN(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 10;
	condition = dia_isgaroth_segen_condition;
	information = dia_isgaroth_segen_info;
	permanent = TRUE;
	description = "���������� ����!";
};


func int dia_isgaroth_segen_condition()
{
	return TRUE;
};

func void dia_isgaroth_segen_info()
{
	AI_Output(other,self,"DIA_Isgaroth_Segen_15_00");	//���������� ����!
	AI_Output(self,other,"DIA_Isgaroth_Segen_01_01");	//������������ ���� �� ��� ������. ����� ����� ���������� ����� � ����� ������ � ���� ���� ���� ���� �������� ��� �������.
	ISGAROTH_SEGEN = TRUE;
};


instance DIA_ISGAROTH_WOLF(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 2;
	condition = dia_isgaroth_wolf_condition;
	information = dia_isgaroth_wolf_info;
	permanent = FALSE;
	description = "���� ������ ������.";
};


func int dia_isgaroth_wolf_condition()
{
	if((MIS_KLOSTERARBEIT == LOG_RUNNING) && (SERGIO_SENDS == TRUE) && (KAPITEL == 1))
	{
		return TRUE;
	};
};

func void dia_isgaroth_wolf_info()
{
	AI_Output(other,self,"DIA_Isgaroth_Wolf_15_00");	//���� ������ ������. �� ������� ��� ���� �����������. ��� ����� �������?
	AI_Output(self,other,"DIA_Isgaroth_Wolf_01_01");	//����� ������� �������� ������ ����. ����� ��� � ����.
	MIS_ISGAROTHWOLF = LOG_RUNNING;
	b_logentry(TOPIC_ISGAROTHWOLF,"����� ������ ������ ������ ����. � ������ ����� ��� � �����.");
};


instance DIA_ISGAROTH_TOT(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 2;
	condition = dia_isgaroth_tot_condition;
	information = dia_isgaroth_tot_info;
	permanent = TRUE;
	description = "� ���� �����.";
};


func int dia_isgaroth_tot_condition()
{
	WOLFI = Hlp_GetNpc(blackwolf);
	if((MIS_ISGAROTHWOLF == LOG_RUNNING) && Npc_IsDead(wolfi))
	{
		return TRUE;
	};
};

func void dia_isgaroth_tot_info()
{
	AI_Output(other,self,"DIA_Isgaroth_tot_15_00");	//� ���� �����.
	AI_Output(self,other,"DIA_Isgaroth_tot_01_01");	//������� ������, ���������. �� ������������ �������. � ������ ����������� � ��������� � ���������� �� ���� �����������.
	MIS_ISGAROTHWOLF = LOG_SUCCESS;
	b_giveplayerxp(XP_ISGAROTHWOLF);
	AI_StopProcessInfos(self);
};


instance DIA_ISGAROTH_JOB(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 4;
	condition = dia_isgaroth_job_condition;
	information = dia_isgaroth_job_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_isgaroth_job_condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_isgaroth_job_info()
{
	AI_Output(other,self,"DIA_Isgaroth_Job_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Isgaroth_Job_01_01");	//� ��� ����. ���� ������ ���� ������.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_02");	//���� ������ �������� ���, ������� ����, ��������� ���� � ���������� �����.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_03");	//�� ��� �������� ����, ����� ���������� ������ � �������� �������������.
	AI_Output(self,other,"DIA_Isgaroth_Job_01_04");	//� �� ��������� ������������� �� ������ �������� �� ���� ����� ���������.
	Log_CreateTopic(TOPIC_KLOSTERTRADER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTRADER,"������ ������� ������� �������� ���������� �������� � ������� ���������� �� ���������.");
};


instance DIA_ISGAROTH_TRADE(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 99;
	condition = dia_isgaroth_trade_condition;
	information = dia_isgaroth_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "������ ��� ���� ������.";
};


func int dia_isgaroth_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_isgaroth_job))
	{
		return TRUE;
	};
};

func void dia_isgaroth_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Isgaroth_Trade_15_00");	//������ ��� ���� ������.
};


instance DIA_ISGAROTH_KLOSTER(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 3;
	condition = dia_isgaroth_kloster_condition;
	information = dia_isgaroth_kloster_info;
	permanent = FALSE;
	description = "���� ����� ��� ������?";
};


func int dia_isgaroth_kloster_condition()
{
	if((other.guild != GIL_NOV) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_isgaroth_kloster_info()
{
	AI_Output(other,self,"DIA_Isgaroth_Kloster_15_00");	//���� ����� ��� ������?
	AI_Output(self,other,"DIA_Isgaroth_Kloster_01_01");	//��� ������ ����� � ��������� ����� ����. ������ ���� � ���� �������� ������ ������ ������.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_02");	//���� �� ������ ����� ����������� ���������, �� ������ �������� ���� �...
		b_say_gold(self,other,SUMME_KLOSTER);
		Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
		b_logentry(TOPIC_KLOSTER,"����� ����� ����������� ��������� ������, ��� ����� ���� � 1000 ������� �����.");
	}
	else
	{
		AI_Output(self,other,"DIA_Isgaroth_Kloster_01_03");	//��� ��� �� ��� ����� �������������� � ������ ������, ���� ��� ���� ������.
	};
};


instance DIA_ISGAROTH_VATRAS(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 3;
	condition = dia_isgaroth_vatras_condition;
	information = dia_isgaroth_vatras_info;
	permanent = TRUE;
	description = "� ���� ��������� �� �������.";
};


func int dia_isgaroth_vatras_condition()
{
	if((MIS_VATRAS_MESSAGE == LOG_RUNNING) && ((Npc_HasItems(other,itwr_vatrasmessage) == 1) || (Npc_HasItems(other,itwr_vatrasmessage_open) == 1)))
	{
		return TRUE;
	};
};

func void dia_isgaroth_vatras_info()
{
	AI_Output(other,self,"DIA_ISgaroth_Vatras_15_00");	//� ���� ��������� �� �������.
	AI_Output(self,other,"DIA_Isgaroth_Vatras_01_01");	//��� ��� �� ���������?
	AI_Output(other,self,"DIA_Isgaroth_Vatras_15_02");	//��� ������, ���.
	if(Npc_HasItems(other,itwr_vatrasmessage) == 1)
	{
		if(b_giveinvitems(other,self,itwr_vatrasmessage,1))
		{
			Npc_RemoveInvItems(self,itwr_vatrasmessage,1);
		};
		b_usefakescroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_03");	//������, �� ������ ������� �������, ��� � ������� ��� ���������.
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_04");	//������ ��� ����� � �������� ������� �� ���� ��������, ��� ��������� ���������� ����.
		CreateInvItems(self,itpo_health_02,2);
		b_giveinvitems(self,other,itpo_health_02,2);
		b_giveplayerxp(XP_AMBIENT * 2);
	}
	else if(Npc_HasItems(other,itwr_vatrasmessage_open) == 1)
	{
		if(b_giveinvitems(other,self,itwr_vatrasmessage_open,1))
		{
			Npc_RemoveInvItems(self,itwr_vatrasmessage_open,1);
		};
		b_usefakescroll();
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_05");	//������ �������. � ��� �� �����, �����!
		AI_Output(self,other,"DIA_Isgaroth_Vatras_01_06");	//��� � ����� �������, ��� � ������� ��� ���������.
		AI_StopProcessInfos(self);
	};
	VATRAS_RETURN = TRUE;
};


instance DIA_ISGAROTH_PICKPOCKET(C_INFO)
{
	npc = kdf_509_isgaroth;
	nr = 900;
	condition = dia_isgaroth_pickpocket_condition;
	information = dia_isgaroth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_isgaroth_pickpocket_condition()
{
	return c_beklauen(48,50);
};

func void dia_isgaroth_pickpocket_info()
{
	Info_ClearChoices(dia_isgaroth_pickpocket);
	Info_AddChoice(dia_isgaroth_pickpocket,DIALOG_BACK,dia_isgaroth_pickpocket_back);
	Info_AddChoice(dia_isgaroth_pickpocket,DIALOG_PICKPOCKET,dia_isgaroth_pickpocket_doit);
};

func void dia_isgaroth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_isgaroth_pickpocket);
};

func void dia_isgaroth_pickpocket_back()
{
	Info_ClearChoices(dia_isgaroth_pickpocket);
};

