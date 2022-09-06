
instance DIA_MELDOR_EXIT(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 999;
	condition = dia_meldor_exit_condition;
	information = dia_meldor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_meldor_exit_condition()
{
	return TRUE;
};

func void dia_meldor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MELDOR_HALLO(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 1;
	condition = dia_meldor_hallo_condition;
	information = dia_meldor_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_meldor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && !Npc_IsDead(lehmar))
	{
		return TRUE;
	};
};

func void dia_meldor_hallo_info()
{
	AI_Output(self,other,"DIA_Meldor_Hallo_07_00");	//��� ���� �����?
	AI_Output(other,self,"DIA_Meldor_Hallo_15_01");	//� ������ ������� �������������...
	AI_Output(self,other,"DIA_Meldor_Hallo_07_02");	//� ���� ������ �� �������������?
};


instance DIA_MELDOR_INTERESSANTES(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 2;
	condition = dia_meldor_interessantes_condition;
	information = dia_meldor_interessantes_info;
	permanent = FALSE;
	description = "��� ����� �����������?";
};


func int dia_meldor_interessantes_condition()
{
	return TRUE;
};

func void dia_meldor_interessantes_info()
{
	AI_Output(other,self,"DIA_Meldor_Interessantes_15_00");	//��� ����� �����������?
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_01");	//����� ���� ������� � �����. ������� ������ ����� ������. ���� ���� ����� ����������, � ������� ����������� ������ � ���.
	AI_Output(self,other,"DIA_Meldor_Interessantes_07_02");	//����, ������, �� ����� ������?
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"������, �������� ������ � ������, �������������� �����������.");
};


instance DIA_MELDOR_LEHMAR(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 3;
	condition = dia_meldor_lehmar_condition;
	information = dia_meldor_lehmar_info;
	permanent = FALSE;
	description = "� �� ����� ��?";
};


func int dia_meldor_lehmar_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_interessantes))
	{
		return TRUE;
	};
};

func void dia_meldor_lehmar_info()
{
	AI_Output(other,self,"DIA_Meldor_Lehmar_15_00");	//� �� ����� ��?
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_01");	//(������) ���. �� ����� ����� ����� ��������� ��� ������, ����������.
	AI_Output(self,other,"DIA_Meldor_Lehmar_07_02");	//� ������, ��� �� ������ �������� ���� ��������� �������.
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_MELDOR_ARBEITEST(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 4;
	condition = dia_meldor_arbeitest_condition;
	information = dia_meldor_arbeitest_info;
	permanent = FALSE;
	description = "�� ��������� �� ������?";
};


func int dia_meldor_arbeitest_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_lehmar))
	{
		return TRUE;
	};
};

func void dia_meldor_arbeitest_info()
{
	AI_Output(other,self,"DIA_Meldor_Arbeitest_15_00");	//�� ��������� �� ������?
	AI_Output(self,other,"DIA_Meldor_Arbeitest_07_01");	//����� �������.
};


instance DIA_MELDOR_INSOV(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 5;
	condition = dia_meldor_insov_condition;
	information = dia_meldor_insov_info;
	permanent = FALSE;
	description = "������-�� � ����������� � ������� �������...";
};


func int dia_meldor_insov_condition()
{
	return TRUE;
};

func void dia_meldor_insov_info()
{
	AI_Output(other,self,"DIA_Meldor_InsOV_15_00");	//������-�� � ����������� � ������� �������...
	AI_Output(self,other,"DIA_Meldor_InsOV_07_01");	//(�����������) ��, �������. � � ��������� ����� �� ������� � ������� ����� ������.
	AI_Output(self,other,"DIA_Meldor_InsOV_07_02");	//����� ����� ���� � ���� ������ � ������� ������� ������ � ��� ���, ��� � ����� ������� ��������.
};


instance DIA_MELDOR_CITIZEN(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 6;
	condition = dia_meldor_citizen_condition;
	information = dia_meldor_citizen_info;
	permanent = FALSE;
	description = "�� ��������� ����� ������?";
};


func int dia_meldor_citizen_condition()
{
	if(Npc_KnowsInfo(other,dia_meldor_insov))
	{
		return TRUE;
	};
};

func void dia_meldor_citizen_info()
{
	AI_Output(other,self,"DIA_Meldor_Citizen_15_00");	//�� ��������� ����� ������?
	AI_Output(self,other,"DIA_Meldor_Citizen_07_01");	//���� �� ������ � ����, ���� �� � �����, �� ��. �� ���� ��� ����� �� ������ � ������� �������.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_02");	//���� ����� ������� ������ ������ ��������, ��, ��� �������� � ������������ �� ������ ����� ������.
	AI_Output(self,other,"DIA_Meldor_Citizen_07_03");	//������ ��������� �������� �� ����� ������� ���� � ��������. ���� ���� ������� ��������� ����� ������� �� �����������.
};


instance DIA_MELDOR_SMOKE(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 5;
	condition = dia_meldor_smoke_condition;
	information = dia_meldor_smoke_info;
	permanent = FALSE;
	description = "�� �� ������, ��� ��� ������ ������?";
};


func int dia_meldor_smoke_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_meldor_smoke_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	AI_Output(other,self,"DIA_Meldor_Smoke_15_00");	//�� �� ������, ��� ��� ������ ������?
	if(Hlp_IsItem(heroarmor,itar_mil_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_01");	//(����������) ���, ������� �� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_Smoke_07_02");	//�� ����� �����, � �� ������� ������� � '������� ������'.
	};
};


var int meldor_dgnews;

instance DIA_MELDOR_PERM(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 7;
	condition = dia_meldor_perm_condition;
	information = dia_meldor_perm_info;
	permanent = TRUE;
	description = "������ ����������� �� ����?";
};


func int dia_meldor_perm_condition()
{
	return TRUE;
};

func void dia_meldor_perm_info()
{
	AI_Output(other,self,"DIA_Meldor_PERM_15_00");	//������ ����������� �� ���� ��������� �����?
	if(KAPITEL <= 1)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_01");	//�������, ��������� ������ ����������� ����� ���� ����� �������� �������.
		AI_Output(self,other,"DIA_Meldor_PERM_07_02");	//��� ������ ����������. ��������� ����� ��������� �� ������ ����� �����. �������� � ���������� ���������.
		AI_Output(self,other,"DIA_Meldor_PERM_07_03");	//��� �������� �� ���� �������� �������� �� ��������� ��������.
	}
	else if((ANDRE_DIEBESGILDE_AUFGERAEUMT == TRUE) && (MELDOR_DGNEWS == FALSE))
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_04");	//� ������, � ����������� ������� ����� �����. ��� ���� ���� �����.
		MELDOR_DGNEWS = TRUE;
	}
	else if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_05");	//�������, ��� � ������ �������� ��������� �������. ���������, ����� �������� ����� ������, ����� ��������� � ���������.
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_06");	//����������������, ��� ������� ������. ���-�� ����� �� �������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Meldor_PERM_07_07");	//���.
	};
};


instance DIA_MELDOR_VONLEHMAR(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 1;
	condition = dia_meldor_vonlehmar_condition;
	information = dia_meldor_vonlehmar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_meldor_vonlehmar_condition()
{
	if(Npc_IsDead(lehmar))
	{
		return TRUE;
	};
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0))
	{
		return TRUE;
	};
};

func void dia_meldor_vonlehmar_info()
{
	AI_Output(self,other,"DIA_Meldor_VonLehmar_07_00");	//��, �������...
	if(!Npc_IsDead(lehmar))
	{
		AI_Output(self,other,"DIA_Meldor_VonLehmar_07_01");	//� ���� ���� ��� ���� ��������� �� ������...
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_KILL,0);
	};
};


instance DIA_MELDOR_PICKPOCKET(C_INFO)
{
	npc = vlk_415_meldor;
	nr = 900;
	condition = dia_meldor_pickpocket_condition;
	information = dia_meldor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_meldor_pickpocket_condition()
{
	return c_beklauen(34,55);
};

func void dia_meldor_pickpocket_info()
{
	Info_ClearChoices(dia_meldor_pickpocket);
	Info_AddChoice(dia_meldor_pickpocket,DIALOG_BACK,dia_meldor_pickpocket_back);
	Info_AddChoice(dia_meldor_pickpocket,DIALOG_PICKPOCKET,dia_meldor_pickpocket_doit);
};

func void dia_meldor_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_meldor_pickpocket);
};

func void dia_meldor_pickpocket_back()
{
	Info_ClearChoices(dia_meldor_pickpocket);
};

