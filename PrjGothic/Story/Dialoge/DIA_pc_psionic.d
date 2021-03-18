
instance DIA_LESTER_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_exit_condition;
	information = dia_lester_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lester_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_HELLO(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_hello_condition;
	information = dia_lester_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lester_hello_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lester_hello_info()
{
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		b_turntonpc(self,other);
	};
	AI_Output(self,other,"DIA_Lester_Hello_13_00");	//��� ��? - �����! ��, ��� � ��� ������ ����!
	Info_ClearChoices(dia_lester_hello);
	Info_AddChoice(dia_lester_hello,"� ���, ���� ����?",dia_lester_hello_youknowme);
	Info_AddChoice(dia_lester_hello,"������! ��� �� �������� �����?",dia_lester_hello_lester);
};

func void dia_lester_hello_lester()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_Lester_15_00");	//������! ��� �� �������� �����?
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_01");	//��� ��� �������� �����. ����� ����, ��� ������ ������, � ������ ��� ��������� ����� � ������ ��������.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_02");	//����� � �������� ��������� ����, ���������� ����� ��� ��� ����, ����, �������, �� �������� � ���� ������.
	AI_Output(self,other,"DIA_Lester_Hello_Lester_13_03");	//�����, ������ � ���� ��� ��� � ������ ��������. �� ������� ����, � ��� �����.
};

func void dia_lester_hello_youknowme()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_YouKnowMe_15_00");	//� ���, ���� ����?
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_01");	//��? � ���� ��� ����? � �������� ����� ����, ����� �� ��� ���������� ���� ������ ������.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_02");	//�� ����� ������... ��, �� ���-�� �� ������ �������.
	AI_Output(self,other,"DIA_Lester_Hello_YouKnowMe_13_03");	//� �� ������� �����, ������� � �����?
	Info_AddChoice(dia_lester_hello,"�����, ������ � ���?",dia_lester_hello_whofourfriends);
	Info_AddChoice(dia_lester_hello,"�������. ��� ���?",dia_lester_hello_knowfourfriends);
};

func void dia_lester_hello_knowfourfriends()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_KnowFourFriends_15_00");	//�������. ��� ���?
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_01");	//��������� � ����, ��� ������ ��� ���������� �������.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_02");	//�� � ������� �� ����, ��� ��� ������ - ��� ������, ��������, ��� ��� ��������� � ������ ��������.
	AI_Output(self,other,"DIA_Lester_Hello_KnowFourFriends_13_03");	//���� �� ���������� �� ���, ��� ��� �����.
};

func void dia_lester_hello_whofourfriends()
{
	Info_ClearChoices(dia_lester_hello);
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_00");	//�����, ������ � ���?
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_01");	//������ �� ������ ���, ��� �� ������ ����� �� �������. ������������ ����� - ������ - �������� ���� ����, ������������� ����� ����?
	AI_Output(other,self,"DIA_Lester_Hello_WhoFourFriends_15_02");	//� �� ����...
	AI_Output(self,other,"DIA_Lester_Hello_WhoFourFriends_13_03");	//������ � ���� ��� ��������. ��� ���� ������������ ��������� �����, ����� �������� ���� ������ � �������.
};


instance DIA_LESTER_WHATHAPPENED(C_INFO)
{
	npc = pc_psionic;
	nr = 1;
	condition = dia_lester_whathappened_condition;
	information = dia_lester_whathappened_info;
	permanent = FALSE;
	description = "��� ���������?";
};


func int dia_lester_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lester_whathappened_info()
{
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_00");	//��� ���������?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_01");	//����� ����, ��� ������ ��� ��������, ��� �������� ��� ����� ����� � ���.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_02");	//��� ������ ������� ��� ����� ���������� ������ ��������.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_03");	//� ��? ��� ������ ����?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_04");	//�� ���� ���� �� ��� ���� �����. � ���� ���� �������, � ���� ������������. �� ����� � ���� ������ �����-����� �����������, � ������� ������.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_05");	//���-�� ��� ����������, ��� � �����, ��� �������� ������ ���� �������� �� ������ �������� � ������ �� � �����, ������ ���������� ������� ����.
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_06");	//����� � ���� �������, ��� ��� �������� ������, ����� ����� ����.
	AI_Output(other,self,"DIA_Lester_WhatHappened_15_07");	//�� ����� ���-������ ���?
	AI_Output(self,other,"DIA_Lester_WhatHappened_13_08");	//��� - � ������� � �������!
};


instance DIA_LESTER_MINECOLONY(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_minecolony_condition;
	information = dia_lester_minecolony_info;
	permanent = FALSE;
	description = "������� �� ��� ����������� � ���� ������?";
};


func int dia_lester_minecolony_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lester_minecolony_info()
{
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_00");	//������� �� ��� ����������� � ���� ������?
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_01");	//����� �� ����. �����, ������. �� ���� ��� ���-���:
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_02");	//����� � ������ ���� �������, � �������� �� ��� ���� - ��� ������ ����� ��������� ��������.
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_03");	//� ����� � ��������� ���� �� �� ��������� ����, ��� ��� ������ ��� �����. � ����� ����������, ��� ������ �� ��� �� ����. � � ��� ��� � �� ������� ��� ������.
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_04");	//�� ������ � ���� ����� ��������? � ����, ��� �� �� ������ ��������, �� ������� ����� ��� ��� ��������...
	AI_Output(self,other,"DIA_Lester_ReturnToColony_13_05");	//�������, ���������? �� ����� � ���� �����? ��� ��� �� ��������...
	AI_Output(other,self,"DIA_Lester_ReturnToColony_15_06");	//�� ��������, ��� �� ���� ���� �� ����� �������. �� �� ����� �������.
};


instance DIA_LESTER_SEND_XARDAS(C_INFO)
{
	npc = pc_psionic;
	nr = 4;
	condition = dia_lester_send_xardas_condition;
	information = dia_lester_send_xardas_info;
	permanent = FALSE;
	description = "�� ������ ���������� �������� �� ���� ����. ��� ����� ���� �����.";
};


func int dia_lester_send_xardas_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_whathappened) && Npc_KnowsInfo(other,dia_lester_minecolony) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lester_send_xardas_info()
{
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_00");	//�� ������ ���������� �������� �� ���� ����. ��� ����� ���� �����.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_01");	//�� �� �������, ��� ��� ����������? �� ������ �������, ��� ��� ������������� ���...
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_02");	//... ������. ��.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_03");	//�� ����� ������ � ����� �����. � ����?
	AI_Output(other,self,"DIA_Lester_SEND_XARDAS_15_04");	//�� ������ ��, ��� � �����... ����...
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_05");	//(��������) ������, ���� ��� ��� �����, �� � ����� � ���� - �� �� ������.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_06");	//������ � ��������� ���������. � ��� ��� ������� ����� ����� ������� �� �������.
	AI_Output(self,other,"DIA_Lester_SEND_XARDAS_13_07");	//��� �������, � ���� ������� �����. �������� ����� � ��������.
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_PERM(C_INFO)
{
	npc = pc_psionic;
	nr = 99;
	condition = dia_lester_perm_condition;
	information = dia_lester_perm_info;
	permanent = TRUE;
	description = "��� �� ������ �� ���� ���������?";
};


func int dia_lester_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_hello) && (KAPITEL < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_LESTER") <= 2000))
	{
		return TRUE;
	};
};

func void dia_lester_perm_info()
{
	AI_Output(other,self,"DIA_Lester_Perm_15_00");	//��� �� ������ �� ���� ���������?
	AI_Output(self,other,"DIA_Lester_Perm_13_01");	//���� �� ������� �� ���� ��������, �� �������� �� �����. � ��� ���� ������ ���������� �����.
	AI_Output(self,other,"DIA_Lester_Perm_13_02");	//�� ���� ���������, �� ������ ���� ����� ����������� �� ������ ����� � �����, �� ����� ������� � �������!
};


instance DIA_LESTER_SLEEP(C_INFO)
{
	npc = pc_psionic;
	nr = 99;
	condition = dia_lester_sleep_condition;
	information = dia_lester_sleep_info;
	permanent = TRUE;
	description = "�� ��� ��� ���������� ���� ����������?";
};


func int dia_lester_sleep_condition()
{
	if((KAPITEL < 3) && (Npc_GetDistToWP(self,"NW_XARDAS_TOWER_IN1_31") <= 500))
	{
		return TRUE;
	};
};

func void dia_lester_sleep_info()
{
	AI_Output(other,self,"DIA_Lester_Sleep_15_00");	//�� ��� ��� ���������� ���� ����������?
	AI_Output(self,other,"DIA_Lester_Sleep_13_01");	//��� ���. (������) � ��������� �������� ���. � ������ � ������ �������. �����...
	AI_Output(self,other,"DIA_Lester_Sleep_13_02");	//...������... ��� ���� ������.
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_KAP3_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap3_exit_condition;
	information = dia_lester_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lester_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_BACKINTOWN(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_backintown_condition;
	information = dia_lester_backintown_info;
	important = TRUE;
};


func int dia_lester_backintown_condition()
{
	if((Npc_GetDistToWP(self,"LEVELCHANGE") <= 500) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lester_backintown_info()
{
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_00");	//��, �� ��������, �������! �� ������ ���������� ��������� � ���������. �������� ��������.
	AI_Output(other,self,"DIA_Lester_BACKINTOWN_15_01");	//� ��� � ����� ��������.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_02");	//����� ����, ��� �� ����, ����� ������� �� ���������.
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_03");	//�������� � ���������, �� ���� ����!
	AI_Output(self,other,"DIA_Lester_BACKINTOWN_13_04");	//������� ��� ��� ���� ��� ����. ��� ������� ���� ��������� �� ���� ���������. �������� ���.
	CreateInvItems(self,itru_teleportxardas,1);
	b_giveinvitems(self,other,itru_teleportxardas,1);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"XARDAS");
};


instance DIA_LESTER_PERM3(C_INFO)
{
	npc = pc_psionic;
	nr = 900;
	condition = dia_lester_perm3_condition;
	information = dia_lester_perm3_info;
	permanent = TRUE;
	description = "�� �� �����-�� ������ ���������.";
};


func int dia_lester_perm3_condition()
{
	if((KAPITEL >= 3) && (LESTER_ISONBOARD != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_lester_perm3_onetime;

func void dia_lester_perm3_info()
{
	AI_Output(other,self,"DIA_Lester_PERM3_15_00");	//�� �� �����-�� ������ ���������.
	if(hero.guild == GIL_KDF)
	{
		if(DIA_LESTER_PERM3_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Lester_PERM3_13_01");	//� � �������� ���� �� ����� ������. � ���������� ���������, � ��� ��� ���������� �������� ����...
			AI_Output(self,other,"DIA_Lester_PERM3_13_02");	//������ ���, ����� ���� �� ���� ������ � ������ ����� ���������� �����, ��� ������ �����������.
			if(SC_KNOWSMADPSI == TRUE)
			{
				AI_Output(other,self,"DIA_Lester_PERM3_15_03");	//� � ���� ������� ���� ������.
				AI_Output(self,other,"DIA_Lester_PERM3_13_04");	//��? �����, � �� ���� ����� �����.
				AI_Output(other,self,"DIA_Lester_PERM3_15_05");	//���� � ������ ����� - ��� ������, ��� ��, ����, �������� �� - ���� ��������������� �������� ����������. ���� ��� �� � ��� �� �������?
				AI_Output(self,other,"DIA_Lester_PERM3_13_06");	//���. ���. ���� ������ �� �� ������ ������� ���, ���...
				AI_Output(other,self,"DIA_Lester_PERM3_15_07");	//��, ������. ������ ���� ��������������� �������. ������� �� ����� ����������� �� ��������� ������.
				AI_Output(other,self,"DIA_Lester_PERM3_15_08");	//��� ���� ����, ������. ������ �������� �������. ������ ��� ������ ��������� ����������� ���.
				AI_Output(self,other,"DIA_Lester_PERM3_13_09");	//� ���� ���� ����������, �� � ��������, ��� ��� �� ���. �� ������ �������, �� ��������? ������ ����� �����?
				AI_Output(other,self,"DIA_Lester_PERM3_15_10");	//������� ������. � ���� ���������, ������ ��� � ������ ���������� ������ �� ����, ��� ��� ������ ������� ������.
				AI_Output(self,other,"DIA_Lester_PERM3_13_11");	//��� ��� �� ��������, �� � �����, �� ����. ��� ����� ����, �� � ���� ������� �������� �����...
				b_logentry(TOPIC_DEMENTOREN,"��� ���������� �������������. ���� � ������� ��� ��������, ��� ������ - ��� ������������� ������ �� ������� ������ � �������.");
				b_giveplayerxp(XP_LESTER_KNOWSMADPSI);
				DIA_LESTER_PERM3_ONETIME = TRUE;
			};
		};
	}
	else if(LESTER_ISONBOARD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_12");	//�������� ���� ��� ��� ������ ����, �� � �������, ��� �������� ����� ����� ������.
		AI_Output(self,other,"DIA_Lester_PERM3_13_13");	//��� ��� �����.
	}
	else if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_14");	//��� �������� ���� ����� ������ ������������. � ������ ��� ��� ����-����� ��������� �������� �� ����. � ����� ���� ������ - ������ ��� ��� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_PERM3_13_15");	//��� �������� ���� ��� �� ������������. ������ ���-�� �������.
	};
	AI_Output(self,other,"DIA_Lester_PERM3_13_16");	//(��������) � �����, ��� ����� ���������.
};


instance DIA_LESTER_KAP4_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap4_exit_condition;
	information = dia_lester_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lester_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_KAP5_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap5_exit_condition;
	information = dia_lester_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lester_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LESTER_XARDASWEG(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_xardasweg_condition;
	information = dia_lester_xardasweg_info;
	description = "��� �������?";
};


func int dia_lester_xardasweg_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lester_xardasweg_info()
{
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_00");	//��� �������?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_01");	//�� ����, � ��� ����� ������ ��� ������������ ��������.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_02");	//� �����, �� ������ �� �����, ����� ���-������ ����� � ����� � ��� ����������.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_03");	//���� �� ����������?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_04");	//�� �� ������. �� ������ �������� ���� �������� ���� ��� ������.
	CreateInvItems(self,itwr_xardaslettertoopenbook_mis,1);
	b_giveinvitems(self,other,itwr_xardaslettertoopenbook_mis,1);
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_05");	//� ������ ���. ������. ��� ������ ���� ���������.
	AI_Output(other,self,"DIA_Lester_XARDASWEG_15_06");	//�?
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_07");	//�� ����, � ������ �� �����. �� ��� ���� ����: �������� �� ������ ������ �������.
	AI_Output(self,other,"DIA_Lester_XARDASWEG_13_08");	//� �����, ����� ����� ������� ����� ��� ����, � �� ���������� � ����.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"������� �����. ������ ������� ��� ������, ����������� ��������� ��� ����.");
};


instance DIA_LESTER_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_psionic;
	nr = 2;
	condition = dia_lester_knowwhereenemy_condition;
	information = dia_lester_knowwhereenemy_info;
	permanent = TRUE;
	description = "� �����, ��� ���������� ����.";
};


func int dia_lester_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LESTER_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_00");	//� �����, ��� ���������� ����.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_01");	//�� ��������� ����, ������ � ��� �����, �� ��� �������, � ������ ����������� � �����.
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_02");	//��� �� ������ ���� �������?
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_03");	//� �� ���� ��������� �����, �� � ����, ��� ����� �������� �����, ������ ���� ���������� � �����.
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_15_04");	//������, �� ������� ��� �����.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_05");	//����� ��� � �����. �����, ��� ������ ������ �� ������ �� ��������� � ���������, ��� ���� ��� �������.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_06");	//�� ������, ��� ���� ����� ������. �������� �� ���� - � ��� ��� �� ��������.
		AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_13_07");	//��� ������ �� �����.
	}
	else
	{
		Info_ClearChoices(dia_lester_knowwhereenemy);
		Info_AddChoice(dia_lester_knowwhereenemy,"� �� ���� ����� ���� � �����.",dia_lester_knowwhereenemy_no);
		Info_AddChoice(dia_lester_knowwhereenemy,"����� ������ �� ����, � �������� ������ �� ���� �������!",dia_lester_knowwhereenemy_yes);
	};
};

func void dia_lester_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_00");	//����� ������ �� ����, � �������� ������ �� ���� �������!
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_Yes_15_01");	//���������� � ������. � ����� ����, ����� ���� �����.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_Yes_13_02");	//����������. ������� � ��� ����.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	LESTER_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lester_knowwhereenemy);
};

func void dia_lester_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lester_KnowWhereEnemy_No_15_00");	//� �� ���� ����� ���� � �����.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_01");	//�������. �, ��������, ������������� ���� ��� ����� ������ ����.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_02");	//�� �����, ���� �� �������� � ����� - �������, ����� �� ������� ��.
	AI_Output(self,other,"DIA_Lester_KnowWhereEnemy_No_13_03");	//� ������ ����.
	LESTER_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_lester_knowwhereenemy);
};


instance DIA_LESTER_LEAVEMYSHIP(C_INFO)
{
	npc = pc_psionic;
	nr = 4;
	condition = dia_lester_leavemyship_condition;
	information = dia_lester_leavemyship_info;
	permanent = TRUE;
	description = "� ���� ��� �� ��� ����� ��� ����.";
};


func int dia_lester_leavemyship_condition()
{
	if((LESTER_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lester_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lester_LeaveMyShip_15_00");	//� ���� ��� �� ��� ����� ��� ����.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_01");	//�������. �, ��������, ������ �� �� �� ����� �� ����� �����.
	AI_Output(self,other,"DIA_Lester_LeaveMyShip_13_02");	//�� ���� � ����������� ����, � ���� ��� ������. �� ������, ��� ����� ����.
	LESTER_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LESTER_STILLNEEDYOU(C_INFO)
{
	npc = pc_psionic;
	nr = 4;
	condition = dia_lester_stillneedyou_condition;
	information = dia_lester_stillneedyou_info;
	permanent = TRUE;
	description = "��� ����� ����, ������ ������� ������.";
};


func int dia_lester_stillneedyou_condition()
{
	if(((LESTER_ISONBOARD == LOG_OBSOLETE) || (LESTER_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lester_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lester_StillNeedYou_15_00");	//��� ����� ����, ������ ������� ������.
	if(LESTER_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_01");	//� ���� ���! �� ����� ��������� ���� �� ����. ��� � ������ �������!
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_02");	//��������, ���! �� ������� ���� ���!
		self.flags = NPC_FLAG_IMMORTAL;
		LESTER_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lester_StillNeedYou_13_03");	//� �����, ����� �����, ���� � ��� �� �������� �����. �����.
		AI_StopProcessInfos(self);
	};
};


instance DIA_LESTER_KAP6_EXIT(C_INFO)
{
	npc = pc_psionic;
	nr = 999;
	condition = dia_lester_kap6_exit_condition;
	information = dia_lester_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lester_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lester_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_PSIONIC_PICKPOCKET(C_INFO)
{
	npc = pc_psionic;
	nr = 900;
	condition = dia_pc_psionic_pickpocket_condition;
	information = dia_pc_psionic_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_pc_psionic_pickpocket_condition()
{
	return c_beklauen(76,20);
};

func void dia_pc_psionic_pickpocket_info()
{
	Info_ClearChoices(dia_pc_psionic_pickpocket);
	Info_AddChoice(dia_pc_psionic_pickpocket,DIALOG_BACK,dia_pc_psionic_pickpocket_back);
	Info_AddChoice(dia_pc_psionic_pickpocket,DIALOG_PICKPOCKET,dia_pc_psionic_pickpocket_doit);
};

func void dia_pc_psionic_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pc_psionic_pickpocket);
};

func void dia_pc_psionic_pickpocket_back()
{
	Info_ClearChoices(dia_pc_psionic_pickpocket);
};

