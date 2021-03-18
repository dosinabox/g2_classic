
instance DIA_MARCOS_EXIT(C_INFO)
{
	npc = pal_217_marcos;
	nr = 999;
	condition = dia_marcos_exit_condition;
	information = dia_marcos_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_marcos_exit_condition()
{
	return TRUE;
};

func void dia_marcos_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MARCOS_HALLO(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_hallo_condition;
	information = dia_marcos_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_marcos_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_marcos_hallo_info()
{
	AI_Output(self,other,"DIA_Marcos_Hallo_04_00");	//���� - �� ��� ������! � ������, ������� ������. ������, ��� ���� �����, � ������ ������!
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_01");	//��������� ������ ������ ������� ������.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_02");	//����� �������� ����, �, ����������� ���. � �� ����� �����, � ��� � ������.
		AI_Output(other,self,"DIA_Marcos_Hallo_15_03");	//��, ������, ��� ���������.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_04");	//���� ��� ����� ��������� �������� - ��� ������� ���� ����?
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_05");	//����������, � ������ �� ������ � ����� ������.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_06");	//�� ���� �� ��� �����. ����� ������ ������� ���� ����?
	}
	else
	{
		AI_Output(other,self,"DIA_Marcos_Hallo_15_07");	//����������, �� �������� �� ������ ������� - ����� ������.
		AI_Output(self,other,"DIA_Marcos_Hallo_04_08");	//� ����� ��� ��� ���� ����� ���� �������� ���������? ������, ��� ���� ����� �����?
	};
};


instance DIA_MARCOS_HAGEN(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_hagen_condition;
	information = dia_marcos_hagen_info;
	permanent = FALSE;
	description = "� ������ ��������� ����� ������ �������������� ������������� ��������.";
};


func int dia_marcos_hagen_condition()
{
	if((KAPITEL == 2) && (garond.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_marcos_hagen_info()
{
	AI_Output(other,self,"DIA_Marcos_Hagen_15_00");	//� ������ ��������� ����� ������ �������������� ������������� ��������.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_01");	//����� �� �� ������ ������ ������� � ��������� ����� ������ ����������.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_02");	//�� �������, �� ������� ����� ����� �������� ������� � ������� ���?
	AI_Output(self,other,"DIA_Marcos_Hagen_04_03");	//�������� ��������� �� ����� � ���������� � ����������� ��������.
	AI_Output(self,other,"DIA_Marcos_Hagen_04_04");	//�� ������ ������, ��� �� ���������� ������� ����� ������! �� ������ ������ ������ ����.
};


instance DIA_MARCOS_GAROND(C_INFO)
{
	npc = pal_217_marcos;
	nr = 2;
	condition = dia_marcos_garond_condition;
	information = dia_marcos_garond_info;
	permanent = FALSE;
	description = "� ������ �� �������...";
};


func int dia_marcos_garond_condition()
{
	if((KAPITEL == 2) && (MIS_OLDWORLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_marcos_garond_info()
{
	AI_Output(other,self,"DIA_Marcos_Garond_15_00");	//� ������ �� ������� - �� ����� �����, ����� ���������� ���� ������ � ���������������.
	AI_Output(self,other,"DIA_Marcos_Garond_04_01");	//����� �������, ��� ��� �������� �������� �����, ��� ��� ��������� ����� ����� ������� �������.
	AI_Output(self,other,"DIA_Marcos_Garond_04_02");	//� ��������� ��������� �� ����� � ����������� ������, �� � ����� ������ � ������������ ������� � �����.
	AI_Output(self,other,"DIA_Marcos_Garond_04_03");	//� ������� ���� � ���������� �����. ��� ������ �����. ��� � ������� � ������ ��� �� ����.
	AI_Output(self,other,"DIA_Marcos_Garond_04_04");	//����� ���, ��� � ���� �������� ����, ���� ���. �� � �� ����, ������� ������� �������, ������ ��� ���� ������ ���� �����.
	AI_Output(self,other,"DIA_Marcos_Garond_04_05");	//����� ���, ����� ������� ������������.
	AI_Output(other,self,"DIA_Marcos_Garond_15_06");	//� ��� ��� �����.
	b_logentry(TOPIC_SCOUTMINE,"������� ������ �������� ������ ����� � ��������� ������.");
	Log_CreateTopic(TOPIC_MARCOSJUNGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MARCOSJUNGS,LOG_RUNNING);
	b_logentry(TOPIC_MARCOSJUNGS,"������ �����, ����� ������ ������ ��� �������.");
	MIS_MARCOS_JUNGS = LOG_RUNNING;
	MARCOS_ORE = TRUE;
	self.flags = 0;
};


instance DIA_MARCOS_PERM(C_INFO)
{
	npc = pal_217_marcos;
	nr = 9;
	condition = dia_marcos_perm_condition;
	information = dia_marcos_perm_info;
	permanent = TRUE;
	description = "��� ����������?";
};


func int dia_marcos_perm_condition()
{
	if((KAPITEL >= 2) && (Npc_KnowsInfo(other,dia_marcos_hagen) || Npc_KnowsInfo(other,dia_marcos_garond)))
	{
		return TRUE;
	};
};

func void dia_marcos_perm_info()
{
	AI_Output(other,self,"DIA_Marcos_Perm_15_00");	//��� ����������?
	if(self.attribute[ATR_HITPOINTS] < (self.attribute[ATR_HITPOINTS_MAX] / 2))
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_01");	//��� ����� ����� �������� �����!
		b_useitem(self,itpo_health_03);
	}
	else if(MIS_MARCOS_JUNGS == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_02");	//� �������, � � �������, ��� ������ ����� ������� ������������.
	}
	else if(MIS_MARCOS_JUNGS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_03");	//������� ���� �� ������. ����� ���� ��� ���� � ������� ��� ������������.
		if(MARCOS_EINMALIG == FALSE)
		{
			b_giveplayerxp(XP_MARCOS_JUNGS);
			MARCOS_EINMALIG = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Marcos_Perm_04_04");	//� �������, ������ ��� �� ���� �����!
	};
	AI_StopProcessInfos(self);
};


instance DIA_MARCOS_PICKPOCKET(C_INFO)
{
	npc = pal_217_marcos;
	nr = 900;
	condition = dia_marcos_pickpocket_condition;
	information = dia_marcos_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_marcos_pickpocket_condition()
{
	return c_beklauen(65,380);
};

func void dia_marcos_pickpocket_info()
{
	Info_ClearChoices(dia_marcos_pickpocket);
	Info_AddChoice(dia_marcos_pickpocket,DIALOG_BACK,dia_marcos_pickpocket_back);
	Info_AddChoice(dia_marcos_pickpocket,DIALOG_PICKPOCKET,dia_marcos_pickpocket_doit);
};

func void dia_marcos_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_marcos_pickpocket);
};

func void dia_marcos_pickpocket_back()
{
	Info_ClearChoices(dia_marcos_pickpocket);
};

