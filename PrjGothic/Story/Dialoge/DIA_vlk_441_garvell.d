
instance DIA_GARVELL_EXIT(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 999;
	condition = dia_garvell_exit_condition;
	information = dia_garvell_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garvell_exit_condition()
{
	return TRUE;
};

func void dia_garvell_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GARVELL_PICKPOCKET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 900;
	condition = dia_garvell_pickpocket_condition;
	information = dia_garvell_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_garvell_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket25) >= 1) && (other.attribute[ATR_DEXTERITY] >= (10 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_garvell_pickpocket_info()
{
	Info_ClearChoices(dia_garvell_pickpocket);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_BACK,dia_garvell_pickpocket_back);
	Info_AddChoice(dia_garvell_pickpocket,DIALOG_PICKPOCKET,dia_garvell_pickpocket_doit);
};

func void dia_garvell_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 10)
	{
		b_giveinvitems(self,other,itse_goldpocket25,1);
		TotalTheftGold += 25;
		b_givethiefxp();
		Info_ClearChoices(dia_garvell_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_garvell_pickpocket_back()
{
	Info_ClearChoices(dia_garvell_pickpocket);
};


instance DIA_GARVELL_GREET(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_greet_condition;
	information = dia_garvell_greet_info;
	description = "��� �� ������� �����?";
};


func int dia_garvell_greet_condition()
{
	if(Wld_IsTime(5,0,19,0))
	{
		return TRUE;
	};
};

func void dia_garvell_greet_info()
{
	AI_Output(other,self,"DIA_Garvell_GREET_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Garvell_GREET_04_01");	//� ����� �������, ������ ��� � ���� �������� ������ - � ��� �������, ��� �����.
	AI_Output(self,other,"DIA_Garvell_GREET_04_02");	//�� ���� �� ����, ��� ���� ������, ���� ������� ������� �� ����� ��������.
};


instance DIA_GARVELL_EILIG(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_eilig_condition;
	information = dia_garvell_eilig_info;
	description = "������ �� ��� ����������?";
};


func int dia_garvell_eilig_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_eilig_info()
{
	AI_Output(other,self,"DIA_Garvell_eilig_15_00");	//������ �� ��� ����������?
	AI_Output(self,other,"DIA_Garvell_eilig_04_01");	//����� ������ ���� � ������ ����� �����.
	AI_Output(other,self,"DIA_Garvell_eilig_15_02");	//������ �� ��� �������?
	AI_Output(self,other,"DIA_Garvell_eilig_04_03");	//������, �� ������, ��� �������� ������ �������? ������, ��� �� �������, ��� �����?
	AI_Output(self,other,"DIA_Garvell_eilig_04_04");	//� ���� ����. ��� �����, ������ ��� ����� �� ��� ������� ����. � ��� �� �������� ��� �������.
};


instance DIA_GARVELL_SCHIFF(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 99;
	condition = dia_garvell_schiff_condition;
	information = dia_garvell_schiff_info;
	description = "������ �� �� ������ ��������� �������?";
};


func int dia_garvell_schiff_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_greet))
	{
		return TRUE;
	};
};

func void dia_garvell_schiff_info()
{
	AI_Output(other,self,"DIA_Garvell_Schiff_15_00");	//������ �� �� ������ ��������� �������?
	AI_Output(self,other,"DIA_Garvell_Schiff_04_01");	//��, � ��� ������ �������. ����� ���� ��� �� ����� �������� � �� ������� ����� �� �������.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_02");	//� ���� ����� �� �������� ������� �� ������� ����������, � ��������� ������ ��� ���� ������� ������.
	AI_Output(self,other,"DIA_Garvell_Schiff_04_03");	//��� ����� �������� �� ����� ����������. ���� ����� ��������� ������� �������, � ������� ������� ������ ������ ������, ������� ����� ����������� �� ���� �����
	AI_Output(self,other,"DIA_Garvell_Schiff_04_04");	//��� ����� ��� ������ ����� ��������!
};


instance DIA_GARVELL_MISSION(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_mission_condition;
	information = dia_garvell_mission_info;
	permanent = FALSE;
	description = "���� � ���-������ ������?";
};


func int dia_garvell_mission_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_eilig) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_garvell_mission_info()
{
	AI_Output(other,self,"DIA_Garvell_MISSION_15_00");	//���� � ���-������ ������?
	AI_Output(self,other,"DIA_Garvell_MISSION_04_01");	//��, ������. ������, ��� ��������� ��������. � ���� �����, ����� ��� �����.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_02");	//� � ������ �����, ������������� �� ���� ���������� ������� �� ��� � ��� ������ �� ������ ��� ���������.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_03");	//������ �� ���� ������� ������ ������ ���������� �� ������.
	AI_Output(self,other,"DIA_Garvell_MISSION_04_04");	//������ ������� ��� ��� ����������, ��� �����������.
	AI_Output(self,other,"DIA_Garvell_Add_04_00");	//� ������ �����, ������� � ���� �������� ������� �� ��������� �����.
	MIS_GARVELL_INFOS = LOG_RUNNING;
	KNOWS_ORK = TRUE;
	Log_CreateTopic(TOPIC_GARVELL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GARVELL,LOG_RUNNING);
	b_logentry(TOPIC_GARVELL,"������� ����� �������� ���������� �� �����, � ����� �����, ����� �������� � ������.");
};

func void b_garvellweiter()
{
	AI_Output(self,other,"DIA_Garvell_Weiter_04_00");	//������. ���� ��� ���-������ ��������, ��� ��� �����.
};

func void b_garvellsuccess()
{
	AI_Output(self,other,"DIA_Garvell_Success_04_00");	//������� �� ����������. ���� �� �����, � ��� ������� ������ ������� �� ��������� �����.
	MIS_GARVELL_INFOS = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GARVELL_ORKS(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 3;
	condition = dia_garvell_orks_condition;
	information = dia_garvell_orks_info;
	permanent = FALSE;
	description = "� ���� ���� ���������� �� �����.";
};


func int dia_garvell_orks_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 1))
	{
		return TRUE;
	};
};

func void dia_garvell_orks_info()
{
	AI_Output(other,self,"DIA_Garvell_Orks_15_00");	//� ���� ���� ���������� �� �����.
	AI_Output(self,other,"DIA_Garvell_Orks_04_01");	//����������.
	AI_Output(other,self,"DIA_Garvell_Orks_15_02");	//��� �������� � ������ ��������, �, ������, ��� ���������� �������� ���.
	AI_Output(other,self,"DIA_Garvell_Orks_15_03");	//����� ����� ���� ���������, �������� �������� ������.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PALADINE(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 2;
	condition = dia_garvell_paladine_condition;
	information = dia_garvell_paladine_info;
	permanent = FALSE;
	description = "� ����, ����� �������� �����.";
};


func int dia_garvell_paladine_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWSPALADINS_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garvell_paladine_info()
{
	AI_Output(other,self,"DIA_Garvell_Paladine_15_00");	//� ����, ����� �������� �����.
	AI_Output(self,other,"DIA_Garvell_Paladine_04_01");	//������? ����� ���!
	AI_Output(other,self,"DIA_Garvell_Paladine_15_02");	//�������� �����, ����� �������� ���������� ���� � ������ ��������, � �� ������, ��� ��� ������� ��������� ����� �� �����.
	AI_Output(other,self,"DIA_Garvell_Paladine_15_03");	//��� ������ ��� ������� ����, ��� �������� �� �������.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_CITY(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 4;
	condition = dia_garvell_city_condition;
	information = dia_garvell_city_info;
	permanent = FALSE;
	description = "��� �������� ���� ����� ������...";
};


func int dia_garvell_city_condition()
{
	if((MIS_GARVELL_INFOS == LOG_RUNNING) && (KNOWS_PALADINS >= 2))
	{
		return TRUE;
	};
};

func void dia_garvell_city_info()
{
	AI_Output(other,self,"DIA_Garvell_City_15_00");	//��� �������� ���� ����� ������...
	AI_Output(self,other,"DIA_Garvell_City_04_01");	//����?..
	AI_Output(other,self,"DIA_Garvell_City_15_02");	//�� �������� ������ ����. ��������� ������ ����������� � ���.
	TELL_GARVELL = TELL_GARVELL + 1;
	b_giveplayerxp(XP_AMBIENT);
	if(TELL_GARVELL >= 3)
	{
		b_garvellsuccess();
	}
	else
	{
		b_garvellweiter();
	};
};


instance DIA_GARVELL_PERM(C_INFO)
{
	npc = vlk_441_garvell;
	nr = 13;
	condition = dia_garvell_perm_condition;
	information = dia_garvell_perm_info;
	permanent = TRUE;
	description = "��� ���������� � ������?";
};


func int dia_garvell_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_garvell_mission))
	{
		return TRUE;
	};
};

func void dia_garvell_perm_info()
{
	AI_Output(other,self,"DIA_Garvell_Perm_15_00");	//��� ���������� � ������?
	if(MIS_GARVELL_INFOS != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_01");	//���� ����� ��� � �����, � �� ����������� � ������?
		AI_Output(other,self,"DIA_Garvell_Perm_15_02");	//� ������ �����...
		AI_Output(self,other,"DIA_Garvell_Perm_04_03");	//����� ������� �������� � ���, ��� � ������ ������������ ��������, ����� ������� ��� ������.
		AI_Output(self,other,"DIA_Garvell_Perm_04_04");	//���� ������, ����� ����� ���� �������, � �� ����������� ���������. � ��� �� ����� �� �������� ��� ��������������� ��.
	}
	else
	{
		AI_Output(self,other,"DIA_Garvell_Perm_04_05");	//�������� ������, ����� ����� ��� ������ �� ����������.
	};
};

