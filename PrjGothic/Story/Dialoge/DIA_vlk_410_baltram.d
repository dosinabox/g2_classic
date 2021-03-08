
instance DIA_BALTRAM_EXIT(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 999;
	condition = dia_baltram_exit_condition;
	information = dia_baltram_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_baltram_exit_condition()
{
	return TRUE;
};

func void dia_baltram_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BALTRAM_SPERRE(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 1;
	condition = dia_baltram_sperre_condition;
	information = dia_baltram_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_baltram_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_baltram_sperre_info()
{
	AI_Output(self,other,"DIA_Baltram_Sperre_01_00");	//���� ���� �����? �� ����������� �� ��������������� �������. � �� ���� ����� � ����� ������� ���!
	AI_StopProcessInfos(self);
};


instance DIA_BALTRAM_HALLO(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 2;
	condition = dia_baltram_hallo_condition;
	information = dia_baltram_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baltram_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE) && (MIS_NAGUR_BOTE == FALSE))
	{
		return TRUE;
	};
};

func void dia_baltram_hallo_info()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_00");	//����� ����������, ���������, ���� ����� ��������. �� ������ ��������� ���������������?
		AI_Output(self,other,"DIA_Baltram_Hallo_01_01");	//�����, ��� ��� �������� ������������ ����. � ��������� ������ � ���� ��� ���� ����������.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_02");	//�� ����� � ��� ����� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Baltram_Hallo_01_03");	//���� �� ������ ������ � ���� �������� �������, �� ������ ��������.
		AI_Output(self,other,"DIA_Baltram_Hallo_01_04");	//� �� ������ ������� ������ � ���, ���������! �� ��� ���� ��������.
	};
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"�������� ������� ���������� �� �������� �������.");
};


instance DIA_BALTRAM_JOB(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 3;
	condition = dia_baltram_job_condition;
	information = dia_baltram_job_info;
	permanent = FALSE;
	description = "� ���� ���� ������ ��� ����?";
};


func int dia_baltram_job_condition()
{
	if((MIS_NAGUR_BOTE != LOG_RUNNING) && (MIS_NAGUR_BOTE != LOG_SUCCESS) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_baltram_job_info()
{
	AI_Output(other,self,"DIA_Baltram_Job_15_00");	//� ���� ���� ������ ��� ����?
	AI_Output(self,other,"DIA_Baltram_Job_01_01");	//���, � ���� ��� ���� ������� �� ����������. �������� ���������� � ������� ����������.
};


instance DIA_BALTRAM_TRICK(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 4;
	condition = dia_baltram_trick_condition;
	information = dia_baltram_trick_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_baltram_trick_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIS_NAGUR_BOTE == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_baltram_trick_info()
{
	AI_Output(self,other,"DIA_Baltram_Trick_01_00");	//�� ����� ������?
	AI_Output(other,self,"DIA_Baltram_Trick_15_01");	//�������, � ��� �����?
	AI_Output(self,other,"DIA_Baltram_Trick_01_02");	//��� ������� �� ���������� �� ��������, � � ��� �������� �� ������� �����.
	AI_Output(other,self,"DIA_Baltram_Trick_15_03");	//� �� ������� �� ���������� ��� ������?
	AI_Output(self,other,"DIA_Baltram_Trick_01_04");	//� ��� ���� 50 ������� �����.
	AI_Output(other,self,"DIA_Baltram_Trick_15_05");	//�������, � ��������.
	AI_Output(self,other,"DIA_Baltram_Trick_01_06");	//������, ������ ����� �����, ��� ���� ������ �. �� �������� ���� �����. ������� ��� ���.
	MIS_BALTRAM_SCOUTAKIL = LOG_RUNNING;
	b_logentry(TOPIC_NAGUR,"�������� ����� ���� � �������� �������� �� ����������. ������, � ������ ��������� ��� ������� � ����� �����.");
	Log_CreateTopic(TOPIC_BALTRAM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BALTRAM,LOG_RUNNING);
	b_logentry(TOPIC_BALTRAM,"���� � ������� ��������� ��� �������, �� �������� ��� 50 ������� �����.");
};


instance DIA_BALTRAM_WAREZ(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 2;
	condition = dia_baltram_warez_condition;
	information = dia_baltram_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "������ ��� ���� ������.";
};


func int dia_baltram_warez_condition()
{
	return TRUE;
};

func void dia_baltram_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Baltram_WAREZ_15_00");	//������ ��� ���� ������.
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_01");	//�� �� ������ ���������, ����� ��� ����� ��� ������. ������ ��� ���� �� ��������� ���� ��������.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_02");	//���-�� �������� ����������� ������ ���� ���������!
	};
	if((MIS_BALTRAMTRADE != LOG_SUCCESS) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_03");	//����� ��� �� ������ �� ���� �� �������.
		AI_Output(other,self,"DIA_Baltram_WAREZ_15_04");	//������?
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_05");	//������� �� �������� �������� � ���� ���������, � ����� ������ ���� ���, ��� ����� ������ �� ���������.
		AI_Output(self,other,"DIA_Baltram_WAREZ_01_06");	//������ ����������, �� ���������� ���� ���� ��������.
		MIS_BALTRAMTRADE = LOG_FAILED;
		AI_StopProcessInfos(self);
	};
};


instance DIA_BALTRAM_AKILSHOF(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 4;
	condition = dia_baltram_akilshof_condition;
	information = dia_baltram_akilshof_info;
	permanent = FALSE;
	description = "��� ��� ����� ����� �����?";
};


func int dia_baltram_akilshof_condition()
{
	if(MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_baltram_akilshof_info()
{
	AI_Output(other,self,"DIA_Baltram_AkilsHof_15_00");	//��� ��� ����� ����� �����?
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_01");	//��� ������ ������� �� ��������� �����, ������� ������, ������� �� ���-������.
	AI_Output(self,other,"DIA_Baltram_AkilsHof_01_02");	//������ �� ������� �������� ��������. ����� �� ����������� �� ���, �� ��� ������� ������ ����� �����.
};


instance DIA_BALTRAM_LIEFERUNG(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 5;
	condition = dia_baltram_lieferung_condition;
	information = dia_baltram_lieferung_info;
	permanent = FALSE;
	description = "� ������ ����� �� �����.";
};


func int dia_baltram_lieferung_condition()
{
	if(Npc_HasItems(other,itmi_baltrampaket) >= 1)
	{
		return TRUE;
	};
};

func void dia_baltram_lieferung_info()
{
	AI_Output(other,self,"DIA_Baltram_Lieferung_15_00");	//� ������ ����� �� �����.
	AI_Output(self,other,"DIA_Baltram_Lieferung_01_01");	//�����������. ������ � ����� ����� ��������� ������� ����������. ��� ���� 50 ������� �����.
	b_giveinvitems(other,self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_gold,50);
	MIS_BALTRAM_SCOUTAKIL = LOG_SUCCESS;
	MIS_NAGUR_BOTE = LOG_FAILED;
	b_giveplayerxp(XP_BALTRAM_SCOUTAKIL);
	Npc_RemoveInvItems(self,itmi_baltrampaket,1);
	CreateInvItems(self,itfo_cheese,5);
	CreateInvItems(self,itfo_apple,10);
	CreateInvItems(self,itfo_beer,5);
	CreateInvItems(self,itfo_bacon,5);
	CreateInvItems(self,itfo_sausage,5);
};


instance DIA_BALTRAM_LETUSTRADE(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 6;
	condition = dia_baltram_letustrade_condition;
	information = dia_baltram_letustrade_info;
	permanent = FALSE;
	description = "�����, ��� ����� ���������� ������?";
};


func int dia_baltram_letustrade_condition()
{
	if(MIS_BALTRAMTRADE == LOG_FAILED)
	{
		return TRUE;
	};
};

func void dia_baltram_letustrade_info()
{
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_00");	//�����, ��� ����� ���������� ������?
	AI_Output(self,other,"DIA_Baltram_LetUsTrade_01_01");	//��������, ���� �� ��������� ��� 10 �������� � 10 ������� ����, ����� � ����� ����� ����� � ����� ����.
	AI_Output(other,self,"DIA_Baltram_LetUsTrade_15_02");	//� ��������.
	MIS_BALTRAMTRADE = LOG_RUNNING;
};


var int baltramenoughbacon;
var int baltramenoughwine;

instance DIA_BALTRAM_HAVEYOURWAREZ(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 6;
	condition = dia_baltram_haveyourwarez_condition;
	information = dia_baltram_haveyourwarez_info;
	permanent = TRUE;
	description = "� ������ ��, ��� �� ������.";
};


func int dia_baltram_haveyourwarez_condition()
{
	if((MIS_BALTRAMTRADE == LOG_RUNNING) && (MIS_BALTRAMTRADE != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_baltram_haveyourwarez_info()
{
	AI_Output(other,self,"DIA_Baltram_HaveYourWarez_15_00");	//� ������ ��, ��� �� ������.
	AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_01");	//������.
	if(Npc_HasItems(other,itfo_bacon) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_02");	//�� ������������ �� 10 ��������. ����������� ����� �������� ��.
		BALTRAMENOUGHBACON = FALSE;
	}
	else
	{
		BALTRAMENOUGHBACON = TRUE;
	};
	if(Npc_HasItems(other,itfo_wine) < 10)
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_03");	//� ��� ������ 10 ������� ����? �� ���, ����� ��� ���?
		BALTRAMENOUGHWINE = FALSE;
	}
	else
	{
		BALTRAMENOUGHWINE = TRUE;
	};
	if((BALTRAMENOUGHBACON == TRUE) && (BALTRAMENOUGHWINE == TRUE))
	{
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_04");	//����, ����� �� ������ ������� ��������, �� � ���� ����� �� ���������� ��������������.
		b_giveinvitems(other,self,itfo_bacon,10);
		b_giveinvitems(other,self,itfo_wine,10);
		MIS_BALTRAMTRADE = LOG_SUCCESS;
		b_giveplayerxp(XP_BALTRAMTRADE);
		AI_Output(self,other,"DIA_Baltram_HaveYourWarez_01_05");	//������ ����� �� ������ ��� ����� ����.
	};
};


instance DIA_BALTRAM_PICKPOCKET(C_INFO)
{
	npc = vlk_410_baltram;
	nr = 900;
	condition = dia_baltram_pickpocket_condition;
	information = dia_baltram_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_baltram_pickpocket_condition()
{
	return c_beklauen(76,175);
};

func void dia_baltram_pickpocket_info()
{
	Info_ClearChoices(dia_baltram_pickpocket);
	Info_AddChoice(dia_baltram_pickpocket,DIALOG_BACK,dia_baltram_pickpocket_back);
	Info_AddChoice(dia_baltram_pickpocket,DIALOG_PICKPOCKET,dia_baltram_pickpocket_doit);
};

func void dia_baltram_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_baltram_pickpocket);
};

func void dia_baltram_pickpocket_back()
{
	Info_ClearChoices(dia_baltram_pickpocket);
};

