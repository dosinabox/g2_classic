
instance DIA_ALWIN_EXIT(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 999;
	condition = dia_alwin_exit_condition;
	information = dia_alwin_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alwin_exit_condition()
{
	return TRUE;
};

func void dia_alwin_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALWIN_PICKPOCKET(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 900;
	condition = dia_alwin_pickpocket_condition;
	information = dia_alwin_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_alwin_pickpocket_condition()
{
	return c_beklauen(20,10);
};

func void dia_alwin_pickpocket_info()
{
	Info_ClearChoices(dia_alwin_pickpocket);
	Info_AddChoice(dia_alwin_pickpocket,DIALOG_BACK,dia_alwin_pickpocket_back);
	Info_AddChoice(dia_alwin_pickpocket,DIALOG_PICKPOCKET,dia_alwin_pickpocket_doit);
};

func void dia_alwin_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alwin_pickpocket);
};

func void dia_alwin_pickpocket_back()
{
	Info_ClearChoices(dia_alwin_pickpocket);
};


instance DIA_ALWIN_SHEEP(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 3;
	condition = dia_alwin_sheep_condition;
	information = dia_alwin_sheep_info;
	permanent = FALSE;
	description = "��� ���� ����?";
};


func int dia_alwin_sheep_condition()
{
	return TRUE;
};

func void dia_alwin_sheep_info()
{
	AI_Output(other,self,"DIA_Alwin_Sheep_15_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_Alwin_Sheep_12_01");	//������������ ����, ��� ����������� ���, ���������� �� ��� ����. (�������) ��� ��� ���� - ����.
	AI_Output(self,other,"DIA_Alwin_Sheep_12_02");	//��� ���� ����������� ���������. ��� �������� �� � �������� � �������� �� ���.
};


instance DIA_ALWIN_FELLAN(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 2;
	condition = dia_alwin_fellan_condition;
	information = dia_alwin_fellan_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alwin_fellan_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(fellan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_alwin_fellan_info()
{
	AI_Output(self,other,"DIA_Alwin_Fellan_12_00");	//��, ���� ���� ������� ����� ������������ ����� � ���� ������ � ���.
	AI_Output(other,self,"DIA_Alwin_Fellan_15_01");	//� ��� �� ��������?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_02");	//����� �� �� ������� ���� �������? ���, ��� �� �������, ������� ��� �������� � �������� ��������?
	AI_Output(self,other,"DIA_Alwin_Fellan_12_03");	//� ���� � ���� ����� ����� �������. �� ������ �������� �� ����� ������ ������ ����.
};


instance DIA_ALWIN_FELLANRUNNING(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 2;
	condition = dia_alwin_fellanrunning_condition;
	information = dia_alwin_fellanrunning_info;
	permanent = FALSE;
	description = "� ���� ���������� � ��������...";
};


func int dia_alwin_fellanrunning_condition()
{
	if(Npc_IsInState(self,zs_talk) && (Npc_IsDead(fellan) == FALSE))
	{
		return TRUE;
	};
};

func void dia_alwin_fellanrunning_info()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_00");	//� ���� ���������� � ��������...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_01");	//�� ������ ������ ���? � ����� ���� ���?
	AI_Output(other,self,"DIA_Alwin_FellanRunning_15_02");	//�� ����� ���.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_03");	//��, ��� �� ���! ������ - ���� �� ��������� ��� ��������� ��������, � ������� ���� 25 ������� �����.
	AI_Output(self,other,"DIA_Alwin_FellanRunning_12_04");	//�� � ����� ���� ����� - �� �� ������� ��������� ����� �����. �� ����� � ���. ������������, ��� ����� ������, ��� ��������� ������� �������!
	MIS_ATTACKFELLAN = LOG_RUNNING;
	Log_CreateTopic(TOPIC_ALWIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ALWIN,LOG_RUNNING);
	b_logentry(TOPIC_ALWIN,"����� �����, ����� � �������� ������� ��������� �������� ��������. �������, ������� ��� �� ��� �� �����.");
	Info_ClearChoices(dia_alwin_fellanrunning);
	Info_AddChoice(dia_alwin_fellanrunning,"� ��������, ��� ����� �������...",dia_alwin_fellanrunning_ok);
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		Info_AddChoice(dia_alwin_fellanrunning,"���� � ����� ���� ���, � ���� ����� �������� � ����������...",dia_alwin_fellanrunning_problems);
	};
};

func void dia_alwin_fellanrunning_ok()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Ok_15_00");	//� ��������, ��� ����� �������...
	AI_Output(self,other,"DIA_Alwin_FellanRunning_Ok_12_01");	//������� �� ����. � �����, � ������� ���� 25 �������.
	Info_ClearChoices(dia_alwin_fellanrunning);
};

func void dia_alwin_fellanrunning_problems()
{
	AI_Output(other,self,"DIA_Alwin_FellanRunning_Problems_15_00");	//���� � ����� ���� ���, � ���� ����� �������� � ����������...
	AI_Output(self,other,"DIA_Alwin_Add_12_00");	//�����, � �����, ����� �� �������� �������� �� ����� ...
	AI_Output(self,other,"DIA_Alwin_Add_12_01");	//�� ���� �� �������� ���-������, ��� ������ ����, � ���� ����� ������� ��������.
};


instance DIA_ALWIN_FELLANSUCCESS(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 4;
	condition = dia_alwin_fellansuccess_condition;
	information = dia_alwin_fellansuccess_info;
	permanent = FALSE;
	description = "������ ������ �� ����� �������.";
};


func int dia_alwin_fellansuccess_condition()
{
	if((MIS_ATTACKFELLAN == LOG_RUNNING) && ((FELLANGESCHLAGEN == TRUE) || Npc_IsDead(fellan)))
	{
		return TRUE;
	};
};

func void dia_alwin_fellansuccess_info()
{
	AI_Output(other,self,"DIA_Alwin_FellanSuccess_15_00");	//������ ������ �� ����� �������.
	AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_01");	//���� ��! ������ ��� ����� �����. �������-��. � �� �����, �� ������� �� ����������.
	if(Npc_IsDead(fellan) == FALSE)
	{
		AI_Output(self,other,"DIA_Alwin_FellanSuccess_12_02");	//�� ������ ��� ������� ������. ������ ���, � ��� ���� 30 ������� �����.
		b_giveinvitems(self,other,itmi_gold,30);
		MIS_ATTACKFELLAN = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		MIS_ATTACKFELLAN = LOG_FAILED;
	};
};


instance DIA_ALWIN_ENDLOS(C_INFO)
{
	npc = vlk_424_alwin;
	nr = 8;
	condition = dia_alwin_endlos_condition;
	information = dia_alwin_endlos_info;
	permanent = TRUE;
	description = "��� ���� ����?";
};


func int dia_alwin_endlos_condition()
{
	if(Npc_KnowsInfo(other,dia_alwin_sheep))
	{
		return TRUE;
	};
};

func void dia_alwin_endlos_info()
{
	AI_Output(other,self,"DIA_Alwin_Endlos_15_00");	//��� ���� ����?
	if((MIS_ATTACKFELLAN != LOG_SUCCESS) && (Npc_IsDead(fellan) == FALSE))
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_01");	//���� ����� ������� ������ �� � ���. ������� ��� ��� ����������.
	}
	else if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_02");	//���� ���� � ���������� ��� ����� � �����. ����� ��� ��� ����. ������ (������ �������)
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_03");	//�, �������, ����� ���� �� ���. �� ���� ��� ��������� �������!
			AI_Output(other,self,"DIA_Alwin_Endlos_15_04");	//��� ����?
			AI_Output(self,other,"DIA_Alwin_Endlos_12_05");	//��� ��������, ������� ���� ��������. ������� ��, ��� ������.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_06");	//��� ������ ����� ������, ����� �� ��� ��������� �� �����.
		}
		else
		{
			AI_Output(self,other,"DIA_Alwin_Endlos_12_07");	//���� ����� �������, ��� ��� �������� � �����.
			AI_Output(other,self,"DIA_Alwin_Endlos_15_08");	//� �����, ��� ���� - ��� ���� ����.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_09");	//���������, �� � ����� ������ ��� ���� ����. � ���� � ���� ����, ������� ���� ������������� ��� ��������� ������� �������.
			AI_Output(self,other,"DIA_Alwin_Endlos_12_10");	//�� ��� ��������� ������. ���� ������ ���� ����.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_11");	//���������� ������, �������� �� ���, ��� ���� ���� - ����� �����!
	}
	else
	{
		AI_Output(self,other,"DIA_Alwin_Endlos_12_12");	//� ������ �� - ��������. ���� ����� ��������, ����� ��� ���� ����� �� �������� ��� ��� �����.
		AI_Output(self,other,"DIA_Alwin_Endlos_12_13");	//��, ������ � ���� �� ���� ��������� ������ ������� �� ����� �����.
	};
};

