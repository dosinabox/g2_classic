
instance DIA_GAERTNER_EXIT(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 999;
	condition = dia_gaertner_exit_condition;
	information = dia_gaertner_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gaertner_exit_condition()
{
	return TRUE;
};

func void dia_gaertner_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAERTNER_PICKPOCKET(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 900;
	condition = dia_gaertner_pickpocket_condition;
	information = dia_gaertner_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gaertner_pickpocket_condition()
{
	return c_beklauen(40,50);
};

func void dia_gaertner_pickpocket_info()
{
	Info_ClearChoices(dia_gaertner_pickpocket);
	Info_AddChoice(dia_gaertner_pickpocket,DIALOG_BACK,dia_gaertner_pickpocket_back);
	Info_AddChoice(dia_gaertner_pickpocket,DIALOG_PICKPOCKET,dia_gaertner_pickpocket_doit);
};

func void dia_gaertner_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gaertner_pickpocket);
};

func void dia_gaertner_pickpocket_back()
{
	Info_ClearChoices(dia_gaertner_pickpocket);
};


instance DIA_GAERTNER_JOB(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_job_condition;
	information = dia_gaertner_job_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_gaertner_job_condition()
{
	return TRUE;
};

func void dia_gaertner_job_info()
{
	AI_Output(other,self,"DIA_Gaertner_Job_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Gaertner_Job_09_01");	//� �� ��� �������? � �������� � �������� �� ���� �����.
	AI_Output(other,self,"DIA_Gaertner_Job_15_02");	//��, ������, ������ ������� ������?
	AI_Output(self,other,"DIA_Gaertner_Job_09_03");	//��, � �������� ��, ����� ��� ��� � ���������� ��������.
	AI_Output(self,other,"DIA_Gaertner_Job_09_04");	//�����-�� ���� ���� ������ ��������� � ������� �� ��, ��� � ��������� ������ �����.
	AI_Output(self,other,"DIA_Gaertner_Job_09_05");	//�� �������, �����������, ����� ��� ��������, � ���� �������� �����.
	AI_Output(self,other,"DIA_Gaertner_Job_09_06");	//�� �������� ���� ��� ���� ���� �����. � � ������ ������� ����.
};


instance DIA_GAERTNER_PLANTS(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_plants_condition;
	information = dia_gaertner_plants_info;
	permanent = FALSE;
	description = "�� ����������� �����-������ �����?";
};


func int dia_gaertner_plants_condition()
{
	if(Npc_KnowsInfo(other,dia_gaertner_job))
	{
		return TRUE;
	};
};

func void dia_gaertner_plants_info()
{
	AI_Output(other,self,"DIA_Gaertner_Plants_15_00");	//�� ����������� �����-������ �����?
	AI_Output(self,other,"DIA_Gaertner_Plants_09_01");	//��, �������. � ��������� �������� ����� � �������� �������. ����� � ������� ������ �������� �����, �� ��� �� ����������� �����.
	AI_Output(self,other,"DIA_Gaertner_Plants_09_02");	//� ������ ��� ������ ����������. ��� ���, ���� �� ������ ���-�� ������...
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"�������� ����������� ����� ������� ��� ���-����� ��������.");
};


instance DIA_GAERTNER_TRADE(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_trade_condition;
	information = dia_gaertner_trade_info;
	permanent = TRUE;
	description = "������ ��� ���� ������.";
	trade = TRUE;
};


func int dia_gaertner_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_gaertner_plants))
	{
		return TRUE;
	};
};

func void dia_gaertner_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Gaertner_Trade_15_00");	//������ ��� ���� ������.
};


instance DIA_GAERTNER_KRAUTABAK(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 5;
	condition = dia_gaertner_krautabak_condition;
	information = dia_gaertner_krautabak_info;
	permanent = FALSE;
	description = "� ���� ���� �������� �����.";
};


func int dia_gaertner_krautabak_condition()
{
	if((Npc_HasItems(other,itmi_sumpftabak) >= 1) && Wld_IsTime(6,45,21,45))
	{
		return TRUE;
	};
};

func void dia_gaertner_krautabak_info()
{
	AI_Output(other,self,"DIA_Gaertner_Krautabak_15_00");	//� ���� ���� �������� �����. ������ ����������?
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_01");	//���� �� ����... �, �����, �����. ������ �������.
	b_giveinvitems(other,self,itmi_sumpftabak,1);
	Npc_RemoveInvItems(self,itmi_sumpftabak,1);
	CreateInvItems(self,itmi_joint,1);
	b_useitem(self,itmi_joint);
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_02");	//���... ���-���....
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Gaertner_Krautabak_09_03");	//������� �����. ���-�� ��� ����������� ������ ���.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GAERTNER_SIGN(C_INFO)
{
	npc = vlk_411_gaertner;
	nr = 6;
	condition = dia_gaertner_sign_condition;
	information = dia_gaertner_sign_info;
	permanent = FALSE;
	description = "(�������� ������ �����)";
};


func int dia_gaertner_sign_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_gaertner_sign_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Gaertner_Sign_09_00");	//������ �� ���� �� ���. � � ���� ��������� ���� ���-����� ����������.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_01");	//� ��������� ����� ����� ���� ��������� ������, ������� ����������� �������� �������������.
	AI_Output(self,other,"DIA_Gaertner_Sign_09_02");	//���� ������ ��� ����� ������ ���� ����.
};

