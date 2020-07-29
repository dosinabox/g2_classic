
instance DIA_SARAH_EXIT(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 999;
	condition = dia_sarah_exit_condition;
	information = dia_sarah_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sarah_exit_condition()
{
	return TRUE;
};

func void dia_sarah_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SARAH_PICKPOCKET(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 900;
	condition = dia_sarah_pickpocket_condition;
	information = dia_sarah_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_sarah_pickpocket_condition()
{
	return c_beklauen(57,60);
};

func void dia_sarah_pickpocket_info()
{
	Info_ClearChoices(dia_sarah_pickpocket);
	Info_AddChoice(dia_sarah_pickpocket,DIALOG_BACK,dia_sarah_pickpocket_back);
	Info_AddChoice(dia_sarah_pickpocket,DIALOG_PICKPOCKET,dia_sarah_pickpocket_doit);
};

func void dia_sarah_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sarah_pickpocket);
};

func void dia_sarah_pickpocket_back()
{
	Info_ClearChoices(dia_sarah_pickpocket);
};


instance DIA_SARAH_GREET(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 1;
	condition = dia_sarah_greet_condition;
	information = dia_sarah_greet_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_AUSGELIEFERT == TRUE))
	{
		return TRUE;
	};
};

func void dia_sarah_greet_info()
{
	AI_Output(self,other,"DIA_Sarah_Add_16_07");	//��! ����� ��!
};


instance DIA_SARAH_HALLO(C_INFO)
{
	npc = vlk_470_sarah;
	condition = dia_sarah_hallo_condition;
	information = dia_sarah_hallo_info;
	permanent = FALSE;
	description = "��� ��������?";
};


func int dia_sarah_hallo_condition()
{
	return TRUE;
};

func void dia_sarah_hallo_info()
{
	AI_Output(other,self,"DIA_Sarah_HALLO_15_00");	//��� ��������?
	AI_Output(self,other,"DIA_Sarah_HALLO_16_01");	//����� ������ ��������, � ������� ������, ��� ��� ������ ��� �������.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_02");	//�� ������ ����� ������ ��� ��� ������, � �� �, �� ����� ��� �� �������� �� ��� �� ����� ������.
	AI_Output(self,other,"DIA_Sarah_HALLO_16_03");	//�, ��� ��� ����, ������� ������ �� ���������� ��� ��������������, � ���� �� ��� �������� �� �����.
	AI_Output(self,other,"DIA_Sarah_Add_16_00");	//���� ��������� �������� - �������� ���������� ��� ������� � �����.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"���� ������� ������� �� �������� �������.");
};


instance DIA_SARAH_BAUERN(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 2;
	condition = dia_sarah_bauern_condition;
	information = dia_sarah_bauern_info;
	permanent = FALSE;
	description = "� ��� �� �������� � ���������?";
};


func int dia_sarah_bauern_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_hallo))
	{
		return TRUE;
	};
};

func void dia_sarah_bauern_info()
{
	AI_Output(other,self,"DIA_Sarah_Bauern_15_00");	//� ��� �� �������� � ���������?
	AI_Output(self,other,"DIA_Sarah_Bauern_16_01");	//��� ������������ ���������� ��� ��������������.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_02");	//������, ����� ������� ������ �� ������� � ��� ����, ����� ��������� ������� �� ���������, ������������ ������ ���������.
	AI_Output(self,other,"DIA_Sarah_Bauern_16_03");	//� ����, ����� ������� ������, ����� ���������, ����� �������� ���� ����� �� ��������� ������. �� ����� ��� �������� � ���� ��� ���������.
	AI_Output(self,other,"DIA_Sarah_Add_16_01");	//�� �������� �� ������ �������� ����� �����.
	AI_Output(self,other,"DIA_Sarah_Add_16_02");	//��� ��������� ���� �� ��������� ���� � ������, � ���������� �� ����������.
	AI_Output(self,other,"DIA_Sarah_Add_16_03");	//� ������ ��, ����� ������ �� ����� �����. �� ������ �� � ������ ��������� �� ��� �����.
};


instance DIA_SARAH_AKILSHOF(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 3;
	condition = dia_sarah_akilshof_condition;
	information = dia_sarah_akilshof_info;
	permanent = FALSE;
	description = "��� ��� ����� ����� �����?";
};


func int dia_sarah_akilshof_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_bauern))
	{
		return TRUE;
	};
};

func void dia_sarah_akilshof_info()
{
	AI_Output(other,self,"DIA_Sarah_AkilsHof_15_00");	//��� ��� ����� ����� �����?
	AI_Output(self,other,"DIA_Sarah_Add_16_04");	//���� ������� �� ��������� ����� � ������� �� ������ �������, ����� �� ������� �������� ��������.
	AI_Output(self,other,"DIA_Sarah_Add_16_05");	//��� ����� ����� � ����� �����.
	AI_Output(self,other,"DIA_Sarah_Add_16_06");	//�� � �� ������ ���� �� �������� - ��� �������� ��������� ��� ��� ���.
};


instance DIA_SARAH_TRADE(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 99;
	condition = dia_sarah_trade_condition;
	information = dia_sarah_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "������ ��� ���� ������.";
};


func int dia_sarah_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_sarah_hallo) && (MIS_CANTHARS_KOMPROBRIEF != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_sarah_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Sarah_Trade_15_00");	//������ ��� ���� ������.
	SARAH_WAFFENGESEHEN = TRUE;
};


instance DIA_SARAH_IMKNAST(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 99;
	condition = dia_sarah_imknast_condition;
	information = dia_sarah_imknast_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_sarah_imknast_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_sarah_imknast_info()
{
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_00");	//��! �� ��������� ��������� �����! �, ������� �� ���� �������� �����, �� � ������ ����������, ��� ��� ����� ��� ����!
	AI_Output(self,other,"DIA_Sarah_IMKNAST_16_01");	//��� �� �������, ��� � �����. �� � ���� ��������� ������ - �� ������� ��� �����!
	AI_StopProcessInfos(self);
};


instance DIA_SARAH_SUCCESS(C_INFO)
{
	npc = vlk_470_sarah;
	nr = 4;
	condition = dia_sarah_success_condition;
	information = dia_sarah_success_info;
	permanent = FALSE;
	description = "������ ������� ���������� ���� � ���������� ���� ��������.";
};


func int dia_sarah_success_condition()
{
	if(CANTHAR_AUSGELIEFERT == TRUE)
	{
		return TRUE;
	};
};

func void dia_sarah_success_info()
{
	AI_Output(other,self,"DIA_Sarah_Success_15_00");	//������ ������� ���������� ���� � ���������� ���� ��������. �� � ���� ��� ��������� ������.
	AI_Output(self,other,"DIA_Sarah_Success_16_01");	//�� ���� ����� ���� ����� �������� �����. � ����� ���� ����� �������. � �� ������ ����� ���������� ��� ��������.
	AI_Output(self,other,"DIA_Sarah_Success_16_02");	//������ ��� ������ � ���� ���� �������������.
	b_giveplayerxp(XP_CANTHARIMKNAST);
	b_giveinvitems(self,other,itmw_piratensaebel,1);
};

