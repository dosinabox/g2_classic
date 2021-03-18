
instance DIA_ALVARES_EXIT(C_INFO)
{
	npc = sld_840_alvares;
	nr = 999;
	condition = dia_alvares_exit_condition;
	information = dia_alvares_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_alvares_exit_condition()
{
	return TRUE;
};

func void dia_alvares_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ALVARES_HAUAB(C_INFO)
{
	npc = sld_840_alvares;
	nr = 4;
	condition = dia_alvares_hauab_condition;
	information = dia_alvares_hauab_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alvares_hauab_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_alvares_hauab_info()
{
	AKILS_SLDSTILLTHERE = TRUE;
	AI_Output(self,other,"DIA_Alvares_HAUAB_11_00");	//��� �� �� ������� ���� ���� - ���� ����� ������ �� ���� � �������� ��������.
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"������� ����� �������� ��������.");
	AI_StopProcessInfos(self);
};


instance DIA_ALVARES_ATTACK(C_INFO)
{
	npc = sld_840_alvares;
	nr = 6;
	condition = dia_alvares_attack_condition;
	information = dia_alvares_attack_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alvares_attack_condition()
{
	if(Npc_KnowsInfo(other,dia_alvares_hauab) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_alvares_attack_info()
{
	AI_Output(self,other,"DIA_Alvares_ATTACK_11_00");	//��, �� ��� ��� �����. � ��� ���� �����, �����: ���������� ��� ����!
	Info_ClearChoices(dia_alvares_attack);
	Info_AddChoice(dia_alvares_attack,"��� �� �����, ����� - ���� �������?",dia_alvares_attack_kerle);
	Info_AddChoice(dia_alvares_attack,"� ���� �������������� � ���, ���������.",dia_alvares_attack_soeldner);
	Info_AddChoice(dia_alvares_attack,"��, �����, ������ ��������� ������. ��� �������?",dia_alvares_attack_witz);
	Info_AddChoice(dia_alvares_attack,"��� �� ����� ��������.",dia_alvares_attack_aerger);
	if(MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING)
	{
		Info_AddChoice(dia_alvares_attack,"� ������ ������ ���� �� �������.",dia_alvares_attack_lieferung);
	};
};

func void dia_alvares_attack_witz()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_00");	//��, �����, ������ ��������� ������. ��� �������?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_01");	//������-��, ����� ����� ����������� - � ����� ������ �����.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_02");	//�� ������, � ��� � �����?
	AI_Output(other,self,"DIA_Alvares_ATTACK_Witz_15_03");	//�� ���� ����� ����, � ��� �� �������?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Witz_11_04");	//� �����, ��� ������� ����� - ��� ������� �����. ��� ��� ������ ��� ��������� - ���� ��������!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_alvares_attack_kerle()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Kerle_15_00");	//��� �� �����, ����� - ���� �������?
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_01");	//�� ��������� �����. � � ���� ���������� ��������, ����� ���� ���� ����� ������ � �������� ����.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Kerle_11_02");	//(�����) �������, ����� ��������! �� ������ �� ���� ������� - � � ��������� � ���� �������!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

func void dia_alvares_attack_aerger()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Aerger_15_00");	//��� �� ����� ��������.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_01");	//� �� ��� ��� ���� ��������. �� ��������� ������ ����, ����� ����� ��.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Aerger_11_02");	//��, �� ���������� ������� ����� ���� �������. � ����� � � ����, ���� �� ������ �� �� ������� ������.
	AI_StopProcessInfos(self);
};

func void dia_alvares_attack_lieferung()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Lieferung_15_00");	//� ������ ������ ���� �� �������.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Lieferung_11_01");	//� �� ����. �� �� ���� ����� �������. ��� ��� ����������, ���� � �� ������ ���� ������.
	AI_StopProcessInfos(self);
};

func void dia_alvares_attack_soeldner()
{
	AI_Output(other,self,"DIA_Alvares_ATTACK_Soeldner_15_00");	//� ���� �������������� � ���, ���������.
	AI_Output(self,other,"DIA_Alvares_ATTACK_Soeldner_11_01");	//��, ������? ����� ���������� - ��� �� ��� ������� �� ������� �� � ���� ��������������.
	AI_StopProcessInfos(self);
};


instance DIA_ALVARES_SCHLUSS(C_INFO)
{
	npc = sld_840_alvares;
	nr = 4;
	condition = dia_alvares_schluss_condition;
	information = dia_alvares_schluss_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_alvares_schluss_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_alvares_attack))
	{
		return TRUE;
	};
};

func void dia_alvares_schluss_info()
{
	AI_Output(self,other,"DIA_Alvares_Schluss_11_00");	//� ��� ���� ����. ��, ������, �� �� ��������������� � �������� ������.
	AI_Output(self,other,"DIA_Alvares_Schluss_11_01");	//������ - ������, ��� �������� ����� ����. (�����) �������, �����, ��������� ��!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};


instance DIA_ALVARES_PICKPOCKET(C_INFO)
{
	npc = sld_840_alvares;
	nr = 900;
	condition = dia_alvares_pickpocket_condition;
	information = dia_alvares_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_alvares_pickpocket_condition()
{
	return c_beklauen(20,15);
};

func void dia_alvares_pickpocket_info()
{
	Info_ClearChoices(dia_alvares_pickpocket);
	Info_AddChoice(dia_alvares_pickpocket,DIALOG_BACK,dia_alvares_pickpocket_back);
	Info_AddChoice(dia_alvares_pickpocket,DIALOG_PICKPOCKET,dia_alvares_pickpocket_doit);
};

func void dia_alvares_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_alvares_pickpocket);
};

func void dia_alvares_pickpocket_back()
{
	Info_ClearChoices(dia_alvares_pickpocket);
};

