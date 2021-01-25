
instance DIA_RUPERT_EXIT(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 999;
	condition = dia_rupert_exit_condition;
	information = dia_rupert_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rupert_exit_condition()
{
	return TRUE;
};

func void dia_rupert_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUPERT_PICKPOCKET(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 900;
	condition = dia_rupert_pickpocket_condition;
	information = dia_rupert_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rupert_pickpocket_condition()
{
	return c_beklauen(18,10);
};

func void dia_rupert_pickpocket_info()
{
	Info_ClearChoices(dia_rupert_pickpocket);
	Info_AddChoice(dia_rupert_pickpocket,DIALOG_BACK,dia_rupert_pickpocket_back);
	Info_AddChoice(dia_rupert_pickpocket,DIALOG_PICKPOCKET,dia_rupert_pickpocket_doit);
};

func void dia_rupert_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rupert_pickpocket);
};

func void dia_rupert_pickpocket_back()
{
	Info_ClearChoices(dia_rupert_pickpocket);
};


instance DIA_RUPERT_HELLO(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_hello_condition;
	information = dia_rupert_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_rupert_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_rupert_hello_info()
{
	AI_Output(self,other,"DIA_Rupert_Hello_03_00");	//������, ���������!
	AI_Output(self,other,"DIA_Rupert_Hello_03_01");	//��, ������ ����, ������� � ������ ����. �����, ���� ������������ ��� ������?
};


instance DIA_RUPERT_ZUPAL(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_zupal_condition;
	information = dia_rupert_zupal_info;
	permanent = FALSE;
	description = "���������� ������, � ������, ����� ����������� � ����������...";
};


func int dia_rupert_zupal_condition()
{
	if(KAPITEL < 2)
	{
		return TRUE;
	};
};

func void dia_rupert_zupal_info()
{
	AI_Output(other,self,"DIA_Rupert_ZuPal_15_00");	//���������� ������, � ������, ����� ����������� � ����������...
	AI_Output(self,other,"DIA_Rupert_ZuPal_03_01");	//� ���� ���� ������ �� ���. � ��� ���, ��� �������� ������������ � ������� ��������, ���� ����� ����� ������ �������.
};


instance DIA_RUPERT_HELPMEINTOOV(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_helpmeintoov_condition;
	information = dia_rupert_helpmeintoov_info;
	permanent = FALSE;
	description = "�� ������ ������ ��� ������� � ������� �������?";
};


func int dia_rupert_helpmeintoov_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_zupal) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_helpmeintoov_info()
{
	AI_Output(other,self,"DIA_Rupert_HelpMeIntoOV_15_00");	//�� ������ ������ ��� ������� � ������� �������?
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_01");	//�? ���, ��� ����� ���� ��� ������!
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_02");	//����� ��������� ����� � ������ ����� ������ ���������� ���������, ��� ����� ��������� ������ ���������� ����.
	AI_Output(self,other,"DIA_Rupert_HelpMeIntoOV_03_03");	//������, ��� ����, - ���� �� ���. ��������, ���� ����� ���������� � ���.
	Log_CreateTopic(TOPIC_OV,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OV,LOG_RUNNING);
	b_logentry(TOPIC_OV,"����� ������� � ������� �������, ��� ����� ������ ����������� ������� �� ������ ����� ������.");
	b_logentry(TOPIC_OV,"�������� ������ - ���� �� ����������� ������� ������ ����� ������.");
};


instance DIA_RUPERT_WOMATTEO(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 1;
	condition = dia_rupert_womatteo_condition;
	information = dia_rupert_womatteo_info;
	permanent = FALSE;
	description = "��� � ���� ����� ������?";
};


func int dia_rupert_womatteo_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_helpmeintoov) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_womatteo_info()
{
	AI_Output(other,self,"DIA_Rupert_WoMatteo_15_00");	//��� � ���� ����� ������?
	AI_Output(self,other,"DIA_Rupert_WoMatteo_03_01");	//�� ������ ����� ����� ��� ������. ������ ����� ������. �� ����������� ������ ���.
	if(KNOWS_MATTEO == FALSE)
	{
		Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
		b_logentry(TOPIC_CITYTRADER,"����� ������ ��������� � ����� ����� ������. �� ������� ����������, ������ � ������ ������.");
		KNOWS_MATTEO = TRUE;
	};
};


instance DIA_RUPERT_WEREINFLUSS(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 2;
	condition = dia_rupert_wereinfluss_condition;
	information = dia_rupert_wereinfluss_info;
	permanent = FALSE;
	description = "� ��� ������ ������ ����������� �������?";
};


func int dia_rupert_wereinfluss_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_helpmeintoov) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_wereinfluss_info()
{
	AI_Output(other,self,"DIA_Rupert_WerEinfluss_15_00");	//� ��� ������ ������ ����������� �������?
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_01");	//�������� � ������� ������������, �����, �� ������� ����� - ����� ����������� ������ � ������.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_02");	//�� ������ ���������� ����� �������� ������ �� ���, ��� �.
	AI_Output(self,other,"DIA_Rupert_WerEinfluss_03_03");	//� ��� ���, ��� � ������� �� ������, ���� � ������ ��������� �� ��� � ���������!
	b_logentry(TOPIC_OV,"� ������ ���������� ����� �������� ������ �� ��������.");
};


instance DIA_RUPERT_WORK(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 3;
	condition = dia_rupert_work_condition;
	information = dia_rupert_work_info;
	permanent = FALSE;
	description = "��� ����� ������ � � ��� ������.";
};


func int dia_rupert_work_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_rupert_work_info()
{
	AI_Output(other,self,"DIA_Rupert_Work_15_00");	//��� ����� ������ � � ��� ������.
	AI_Output(self,other,"DIA_Rupert_Work_03_01");	//� ������, ��� � ������� �������� � ������������. ��� ����� ��������� ��� ���.
	AI_Output(self,other,"DIA_Rupert_Work_03_02");	//�������, �� ������ �������� ������.
};


instance DIA_RUPERT_YOUROFFER(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_youroffer_condition;
	information = dia_rupert_youroffer_info;
	permanent = FALSE;
	description = "��� �� ������ ���������� ���?";
};


func int dia_rupert_youroffer_condition()
{
	return TRUE;
};

func void dia_rupert_youroffer_info()
{
	AI_Output(other,self,"DIA_Rupert_YourOffer_15_00");	//��� �� ������ ����������?
	AI_Output(self,other,"DIA_Rupert_YourOffer_03_01");	//������, � ���� ���� ��� ����.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Rupert_YourOffer_03_02");	//���� ������ �������� �� ���������� ������ ��������, � ����, ��� �� �������� � ��������� ����, ������������ ��� �������������� ������������ ������.
	};
};


instance DIA_RUPERT_TRADE(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 800;
	condition = dia_rupert_trade_condition;
	information = dia_rupert_trade_info;
	permanent = TRUE;
	description = "������ ��� ���� ������.";
	trade = TRUE;
};


func int dia_rupert_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_youroffer))
	{
		return TRUE;
	};
};

func void dia_rupert_trade_info()
{
	if(Npc_HasItems(self,itfo_apple) < 5)
	{
		CreateInvItems(self,itfo_apple,5);
	};
	AI_Output(other,self,"DIA_Rupert_Trade_15_00");	//������ ��� ���� ������.
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Rupert_Trade_03_01");	//� ������� ��������� �� ������� �����. ������� ������ ��������� ��������� ������ � �������.
	};
};


instance DIA_RUPERT_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_bauernaufstand_condition;
	information = dia_rupert_bauernaufstand_info;
	permanent = FALSE;
	description = "�������� ��� � ��������� ��������.";
};


func int dia_rupert_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_youroffer) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_rupert_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Rupert_Bauernaufstand_15_00");	//�������� ��� � ��������� ��������.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_01");	//��� �������� ������: ����, ������ ��������, ������ �� ������ ������ ������.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_02");	//������ ���������! �� ����� � ������, � ���� ������ ���� �������� ��� ����!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_03");	//������ ��������� ������ ��������� ������� ���� � ����� �������.
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_04");	//�� ������ ����� ����������: �������, ��� ���� ����� ���������, ����� �� �� ���������� � ��� ����� ��������� ������!
	AI_Output(self,other,"DIA_Rupert_Bauernaufstand_03_05");	//���������! ��� ��� �������� ������! ��� ����� ����� ����� �� ����������!
};


instance DIA_RUPERT_MERCS(C_INFO)
{
	npc = vlk_458_rupert;
	nr = 4;
	condition = dia_rupert_mercs_condition;
	information = dia_rupert_mercs_info;
	permanent = FALSE;
	description = "��� �� ������ � ��������� �����?";
};


func int dia_rupert_mercs_condition()
{
	if(Npc_KnowsInfo(other,dia_rupert_bauernaufstand) && (hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_rupert_mercs_info()
{
	AI_Output(other,self,"DIA_Rupert_Mercs_15_00");	//��� �� ������ � ��������� �����?
	AI_Output(self,other,"DIA_Rupert_Mercs_03_01");	//� ������, ��� ����������� �� ��� ������ ���������� �� �������.
	AI_Output(self,other,"DIA_Rupert_Mercs_03_02");	//� �� �������, �� ������, ��� ������� ������ ��� ������ - ��������� ��� ���-�� � ���� ����, - �������� ������� �� �������������!
	AI_Output(self,other,"DIA_Rupert_Mercs_03_03");	//������� �������!
};

