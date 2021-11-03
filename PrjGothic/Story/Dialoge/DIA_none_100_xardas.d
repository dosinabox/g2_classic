
instance DIA_XARDAS_FIRSTEXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_firstexit_condition;
	information = dia_xardas_firstexit_info;
	permanent = FALSE;
	description = "� ���������� ����������� � ����! (�����)";
};


func int dia_xardas_firstexit_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_firstexit_info()
{
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_15_00");	//� ���������� ����������� � ����!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_01");	//������! � ��� ����: �� ������ ������, ��� ������������ �� ����. �, ������ �����, �� ������ �� ���� �����!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_02");	//� ��� ���, ��� � ������ �� ���, ���� ���� ������� ���� ������� - � ��� ����� ������.
	AI_StopProcessInfos(self);
	b_kapitelwechsel(1,NEWWORLD_ZEN);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_XARDAS_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_exit_condition;
	information = dia_xardas_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_exit_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_HELLO(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_xardas_hello_condition;
	information = dia_xardas_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_hello_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_xardas_hello_info()
{
	AI_Output(self,other,"DIA_Xardas_Hello_14_00");	//�������-��! � ����� ���� ������� ������� ���� ����.
	AI_Output(other,self,"DIA_Xardas_Hello_15_01");	//� �������� ���� ���, ��� ����� � ��� ������ �������� ��� ������ ������.
	AI_Output(self,other,"DIA_Xardas_Hello_14_02");	//��, ��� � ����. ������ ����� ����� �������� ������������ ����� � ���� - �� ������ �� ����. �� ����� ������������ ���� ����.
	AI_Output(other,self,"DIA_Xardas_Hello_15_03");	//�� ������� ����, � ��� ������ ���������� �������. � ������ ���. ������...
	AI_Output(self,other,"DIA_Xardas_Hello_14_04");	//...��� ������. �� ������� ���, ��, ��� ��� - �� �� � ����� ����� ���������� �����, ������� ����������� ������.
	AI_Output(other,self,"DIA_Xardas_Hello_15_05");	//�� �������� �� �����?
	AI_Output(self,other,"DIA_Xardas_Hello_14_06");	//� ������ � ������� ����� ������� ���������.
	AI_Output(self,other,"DIA_Xardas_Hello_14_07");	//����� ���������, �������� ������, ������ ������ � �������� ����� ����.
	AI_Output(self,other,"DIA_Xardas_Hello_14_08");	//��� ��� ������ ���� ��������� ����. ����� ����, �������� ��� ��� ������� ������������.
	AI_Output(self,other,"DIA_Xardas_Hello_14_09");	//��� ��������� �������� ����: �����! � ��� �����. ���. ���� �������.
	AI_Output(other,self,"DIA_Xardas_Hello_15_10");	//(���������) �������!
	AI_Output(self,other,"DIA_Xardas_Hello_14_11");	//��� �������� ������� ����. � �������� �� ����������� - ���� �����.
	AI_Output(self,other,"DIA_Xardas_Hello_14_12");	//� ��� ������� ������ ���� ����� ����� �� ������ �������.
	AI_Output(other,self,"DIA_Xardas_Hello_15_13");	//� ��� ��� ����� ������?
	AI_Output(self,other,"DIA_Xardas_Hello_14_14");	//������ ���� ����� ��������� �������� ������, � ������ �������� ����� ��������, � ��� ��������� � �����.
	AI_Output(self,other,"DIA_Xardas_Hello_14_15");	//(���������) � ��� ����� ���� �������.
};


instance DIA_XARDAS_AWAY(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_xardas_away_condition;
	information = dia_xardas_away_info;
	permanent = FALSE;
	description = "����� ����� ��������� ������� ������ ����!";
};


func int dia_xardas_away_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_hello) && !Npc_KnowsInfo(other,dia_xardas_todo) && !Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_away_info()
{
	AI_Output(other,self,"DIA_Xardas_AWAY_15_00");	//����� ����� ��������� ������� ������ ����!
	AI_Output(self,other,"DIA_Xardas_AWAY_14_01");	//���� �� ������ ������, ��� ����� ���� �������� ���� ������� � ���������.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_02");	//��� ������ ������ � �����, ������� �����, �� ����� ���������� �� �� ����, ��� ����� ���� ����� ��������� ������������.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_03");	//� ��� �� ����� ������� ����� ��� �����.
};


instance DIA_XARDAS_TODO(C_INFO)
{
	npc = none_100_xardas;
	nr = 2;
	condition = dia_xardas_todo_condition;
	information = dia_xardas_todo_info;
	permanent = FALSE;
	description = "��� �� ����� �������?";
};


func int dia_xardas_todo_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_todo_info()
{
	AI_Output(other,self,"DIA_Xardas_TODO_15_00");	//��� �� ����� �������?
	AI_Output(self,other,"DIA_Xardas_TODO_14_01");	//�� ���� ��� ����� ��� �� ����������. ������ ���� ������ ����� ������ ��� � ������ ������ ���� ��������.
	AI_Output(self,other,"DIA_Xardas_TODO_14_02");	//� ������ �������, ��� ���������� ������, ����������� ����� ���������.
	AI_Output(self,other,"DIA_Xardas_TODO_14_03");	//��� �������� ������� ����������, ������� ����� ������ ��� �������� ���� ��������.
	AI_Output(self,other,"DIA_Xardas_TODO_14_04");	//"��� �������� ��� ""���� ������"". �� ������ ��������� ���� ����������."
	AI_Output(self,other,"DIA_Xardas_TODO_14_05");	//�������� ��������� � ������������� ������. �� ������ ������� �� ������������ ���������� ���!
	Log_CreateTopic(TOPIC_INNOSEYE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE,LOG_RUNNING);
	b_logentry(TOPIC_INNOSEYE,"� ������ ������� ������������ ����� ���������. ��� �������� ������� ����������: ������ ������. ��� ���� ������ ������ ��� ���������� �� ��������. � ������ ������� ���������, ��� ��� ����� ���������� ���� ������.");
};


instance DIA_XARDAS_WEAPON(C_INFO)
{
	npc = none_100_xardas;
	nr = 5;
	condition = dia_xardas_weapon_condition;
	information = dia_xardas_weapon_info;
	permanent = FALSE;
	description = "��� ����� ������.";
};


func int dia_xardas_weapon_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_weapon_info()
{
	AI_Output(other,self,"DIA_Xardas_WEAPON_15_00");	//��� ����� ������.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_01");	//� ���� ���� ���� ������ �� ��������, ��� � ���� ���� �����.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_02");	//�������� � ���� �����. �� ������ ����� ���, ��� ��������� ���� ��������.
};


instance DIA_XARDAS_ARTEFAKT(C_INFO)
{
	npc = none_100_xardas;
	nr = 2;
	condition = dia_xardas_artefakt_condition;
	information = dia_xardas_artefakt_info;
	permanent = FALSE;
	description = "� ��� ����� ���� '���� ������'?";
};


func int dia_xardas_artefakt_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_artefakt_info()
{
	AI_Output(other,self,"DIA_Xardas_ARTEFAKT_15_00");	//� ��� ����� ���� '���� ������'?
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_01");	//��� ������. ������� ������, ��� ��� ����� ������ ����� ����� ���� � ���� ������.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_02");	//�� ����������� ����� ����� ���������� ���� � ������� ��� �������� ��������.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_03");	//����� �� �������� � ������� �������� �������������. � �������� ���� ������, ����� ���� ������ ����� � ���� � �����.
};


instance DIA_XARDAS_PALADIN(C_INFO)
{
	npc = none_100_xardas;
	nr = 3;
	condition = dia_xardas_paladin_condition;
	information = dia_xardas_paladin_info;
	permanent = FALSE;
	description = "� ������ �������� ������ ������ ��� ���� ���� ������?";
};


func int dia_xardas_paladin_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_paladin_info()
{
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_00");	//� ������ �������� ������ ������ ��� ���� ���� ������?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_01");	//������ ��� �� ���, ���� ������� ������������� ������ ���.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_02");	//� ������ ���� ��� ��������?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_03");	//���� ��������� ������ �������� ���. ��� ����� ������ �� ���: �� ������� �������. ���� �� ���� �� ����������� ����, �� �� ����� ��� ��� �����.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_04");	//�����������, ��� �� ����, � ��� ������������� ������������� ������ ���� ������. � ������ �������� ������, ��� ��� ������?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_05");	//���� ��� �������� ����, ��� ����� ������ ���. ����� �� �������� ���, ��� �������� ��������� ���������.
};


instance DIA_XARDAS_KHORINIS(C_INFO)
{
	npc = none_100_xardas;
	nr = 4;
	condition = dia_xardas_khorinis_condition;
	information = dia_xardas_khorinis_info;
	permanent = FALSE;
	description = "� ��� ��� ��������� �� ������?";
};


func int dia_xardas_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (lothar.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_khorinis_info()
{
	AI_Output(other,self,"DIA_Xardas_Khorinis_15_00");	//� ��� ��� ��������� �� ������?
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_01");	//������ ��� �� ��������, ������� ������ ����� ����. ����� �������, �� ��� �� ����������.
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_02");	//�� ���� ���������! ���� � ����� ����� ����������. � �� ������ ������ �� ��� �����, ��� ��� ������.
};


instance DIA_XARDAS_WHEREEX(C_INFO)
{
	npc = none_100_xardas;
	nr = 6;
	condition = dia_xardas_whereex_condition;
	information = dia_xardas_whereex_info;
	permanent = FALSE;
	description = "� ��� ������ �� ������ ���������?";
};


func int dia_xardas_whereex_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_whereex_info()
{
	AI_Output(other,self,"DIA_Xardas_Add_15_00");	//� ��� ������ �� ������ ���������?
	AI_Output(self,other,"DIA_Xardas_Add_14_01");	//��� � ��� ������, ���������� �� ������ �������.
	AI_Output(self,other,"DIA_Xardas_Add_14_02");	//� �������� ��� ����� �����.
	AI_Output(other,self,"DIA_Xardas_Add_15_03");	//�� ���� ������ ����� ��������� ����, � ��� ��� ��� �� ���� � ������ ��������...
	AI_Output(self,other,"DIA_Xardas_Add_14_04");	//�����, ������� � ������ ��� ������������� ��� �����, ��������� ����������� ������...
	AI_Output(other,self,"DIA_Xardas_Add_15_05");	//��, ������ �� ���.
};


instance DIA_XARDAS_EQUIPMENT(C_INFO)
{
	npc = none_100_xardas;
	nr = 7;
	condition = dia_xardas_equipment_condition;
	information = dia_xardas_equipment_info;
	permanent = FALSE;
	description = "� ��� � ����� ����� ���������� �������?";
};


func int dia_xardas_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_weapon) && Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_equipment_info()
{
	AI_Output(other,self,"DIA_Xardas_EQUIPMENT_15_00");	//� ��� � ����� ����� ���������� �������?
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_01");	//��������� �����, ��� �� ������� ��������� ��������� ������ � ������� - ����� �������.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_02");	//�� �����, � ������, �� ������� ����� �������� �����, ������� ������� ����, ���� �� ������ ����� � ���.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_03");	//������ ����� ������ �� ���� �����? ������ � ������ ����� ��������� ������.
};


instance DIA_XARDAS_ABOUTLESTER(C_INFO)
{
	npc = none_100_xardas;
	nr = 5;
	condition = dia_xardas_aboutlester_condition;
	information = dia_xardas_aboutlester_info;
	permanent = FALSE;
	description = "�� ��� ��������� � ��������?";
};


func int dia_xardas_aboutlester_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_send_xardas) && (Npc_GetDistToWP(lester,"NW_XARDAS_TOWER_IN1_31") <= 500) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_aboutlester_info()
{
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_00");	//�� ��� ��������� � ��������?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_01");	//��, � ������ ������� ��� ���������. �� ������ ���� ���������� ���, �� �� ��������� �������.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_02");	//��� ����� ����, ��� ��� ������� ������. � �������� ��� � �������.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_03");	//��� �� ��������� ����?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_04");	//�����, ��� ������ ��������. �� ����� �� ������ �������, �� ��� � ����� � ������ ������ � ����������.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_05");	//�?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_06");	//���� ��� ���� ����������, �� �� ����������� ����� ������������ ������.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_07");	//� ��� ��� �� ��������. ���, ������ ��� ������. ��� ������� ���� �� �����.
	b_giveinvitems(self,other,itri_prot_mage_01,1);
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_FIRSTPAL(C_INFO)
{
	npc = none_100_xardas;
	nr = 10;
	condition = dia_xardas_firstpal_condition;
	information = dia_xardas_firstpal_info;
	permanent = FALSE;
	description = "� ��� � ������...";
};


func int dia_xardas_firstpal_condition()
{
	if((lothar.aivar[AIV_TALKEDTOPLAYER] == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_xardas_firstpal_info()
{
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_00");	//� ��� � ������...
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_01");	//�? �� ���� ���������� � ������������� ���������?
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_02");	//���� � ���� �� ���������...
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_03");	//����! ������ ���� ������ ��������� � ���.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_04");	//���� ��� ��������� �� ���������, ������ � ��������� � ����� �����.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_05");	//���, ��������, ������������ ����� � ����� ������ ������, �� ��� ���� ���� ��, ��� ���� �����.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_06");	//���� �� ������ �����, ��� �������� ����������� � �����.
};


instance DIA_XARDAS_WEITER(C_INFO)
{
	npc = none_100_xardas;
	nr = 99;
	condition = dia_xardas_weiter_condition;
	information = dia_xardas_weiter_info;
	permanent = TRUE;
	description = "� ��� ��� ������ ������?";
};


func int dia_xardas_weiter_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_weiter_info()
{
	AI_Output(other,self,"DIA_Xardas_Weiter_15_00");	//� ��� ��� ������ ������?
	AI_Output(self,other,"DIA_Xardas_Weiter_14_01");	//�� ������ ����������� �������� ������ �����. ������� ���� ���.
	AI_Output(self,other,"DIA_Xardas_Weiter_14_02");	//�� ������ ������ ���� ������, � � ���� ���������� ������ ������.
};


instance DIA_XARDAS_KDFSECRET(C_INFO)
{
	npc = none_100_xardas;
	nr = 9;
	condition = dia_xardas_kdfsecret_condition;
	information = dia_xardas_kdfsecret_info;
	permanent = FALSE;
	description = "������ ���� ���� �� ������ ����� � ����?";
};


func int dia_xardas_kdfsecret_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit))
	{
		return TRUE;
	};
};

func void dia_xardas_kdfsecret_info()
{
	AI_Output(other,self,"DIA_Xardas_KdfSecret_15_00");	//������ ���� ���� �� ������ ����� � ����?
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_01");	//�����-�� � ��� ������ ������ �����. ���� ����� � ����������, ��� ������������ ����� ����� ���� ������ � ����� ����������� �������.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_02");	//�� ��� ���� �� �� ��� �� ������� ��������� ������ ����� ����������� ����� ����.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_03");	//������� � ������� ����, ����� ������� ������ �����.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_04");	//��� ������������, �������� � ������ ����� ����, (����������) '����������� ������', ������ ����� '������' � '��������������', ������� �� ����� ����������.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_05");	//��� �������, ��� � ��� ��� ���, �� ��� ������� �� �����, ��� ������ ���� - � ��� ������.
};


instance DIA_XARDAS_KAP3_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap3_exit_condition;
	information = dia_xardas_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_xardas_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_BACKFROMOW(C_INFO)
{
	npc = none_100_xardas;
	nr = 31;
	condition = dia_xardas_backfromow_condition;
	information = dia_xardas_backfromow_info;
	description = "� �������� �� ������ ��������.";
};


func int dia_xardas_backfromow_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_xardas_backfromow_info()
{
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_00");	//� �������� �� ������ ��������.
	AI_Output(self,other,"DIA_Xardas_BACKFROMOW_14_01");	//����� �� ����. � ��� �� ��� �����?
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_02");	//�� ��� ����. ��� ��� ����� �������, ���� ������ ������ �����.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_03");	//���� �������� �����, � ������� ���������� ��� ������.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_04");	//�������� �������, ������ ��� ��� ������� �� �������, ���� � �� ��������.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_DMTSINDDA(C_INFO)
{
	npc = none_100_xardas;
	nr = 32;
	condition = dia_xardas_dmtsindda_condition;
	information = dia_xardas_dmtsindda_info;
	description = "���, ���� ������, ��������� �����?";
};


func int dia_xardas_dmtsindda_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_xardas_backfromow))
	{
		return TRUE;
	};
};

func void dia_xardas_dmtsindda_info()
{
	if(Npc_KnowsInfo(other,dia_lester_backintown))
	{
		AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_00");	//������ ������, ��� �� ����� ������ ���� ��� ����� �������.
	};
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_01");	//���, ���� ������, ��������� �����?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_02");	//���� �����, ��� �� ��������� �� ����� ����, � ��������� ��������� ������ ������.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_03");	//�� ��������� ��� ������. ��� ��������� ��� ����� �� ���� � �������� �� �������� �����.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_04");	//���� � ������ ��������. ����� ��� ����� �� ����, ������ ����� ����� �����. �� ������ ��� ���������� ������� ��������.
	b_logentry(TOPIC_INNOSEYE,"����� ������ ��������, ��� � ��� ���� ������. ��� ����� ��������� ����� ���, ���� ��� �� ������� ������.");
	Info_ClearChoices(dia_xardas_dmtsindda);
	Info_AddChoice(dia_xardas_dmtsindda,"���� ��������� ���� � ������ �������.",dia_xardas_dmtsindda_dmt);
	Info_AddChoice(dia_xardas_dmtsindda,"�, �������, ����� ��������������, ��� ����� ������.",dia_xardas_dmtsindda_beweis);
};

func void dia_xardas_dmtsindda_dmt()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_15_00");	//���� ��������� ���� � ������ �������.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_01");	//� ����� ����� �������. ������ - ���� �� ���. ��� ��, ��� �������������� �������� ��� �����.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_02");	//��� ������ ������� � �������������� ������, � ������ ������ ���� ����������� ���������� �������.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_03");	//������� �� ��� ��������. ��� ������� ����, � ��� ���������� �� ��� �� �� �� ����� ���������� ����.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_RUNNING);
		b_logentry(TOPIC_DEMENTOREN,"������� ����� ��� ����� ��� ���� � ������ �����. ������ ������ ������ ���������� ���� � � ��������� �����, � ��� ����� ������.");
	};
};

func void dia_xardas_dmtsindda_beweis()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_00");	//�, �������, ����� ��������������, ������� �������� �� ���� ���� �����.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_01");	//��� ��� �� ��������������?
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_02");	//� ������� ������ �� �������, ������������ ��������� � ������ ��������. � ��� �� ������ � ������������.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_03");	//����� ������ ���� ����������, ����� ������� ������������� ��������. �������.
	Info_AddChoice(dia_xardas_dmtsindda,"� ����� ����� ��� ��������� ���?",dia_xardas_dmtsindda_dmt_whattodo);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_xardas_dmtsindda_dmt_whattodo()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00");	//� ����� ����� ��� ��������� ���?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01");	//��� � ������ ����� ������ ������ �� �������, � ������� �� ����, ����� �� �������� ���� ����� ���� ������.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02");	//����� ��� � ���������, � �������� � ���������. �� ������ ���� ���� ����.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03");	//������ ��� ������ ����� �������, ��� ���������� ������������ ����� ���������.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04");	//���, ���� ��� �� ������� ������. ���� ����� ���������� �������� �� ���� ���� ����.
	b_logentry(TOPIC_INNOSEYE,"���� ��������� � ��������� ����� ����. � �������, ��� ���� ����� ����������� ��� ������ � ����, ����� � ������� ��� ������ �� ����� �������. ��������� ��� ������� �� �������� ��� ������ ���� ������ ��� ��������� ������.");
};


instance DIA_XARDAS_INNOSEYEBROKEN(C_INFO)
{
	npc = none_100_xardas;
	nr = 33;
	condition = dia_xardas_innoseyebroken_condition;
	information = dia_xardas_innoseyebroken_info;
	description = "���� ������ ��� ���������.";
};


func int dia_xardas_innoseyebroken_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_xardas_dmtsindda) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_xardas_innoseyebroken_info()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_00");	//���� ������ ��� ���������.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_01");	//��� �� ��������? ���������!
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_02");	//� ����� ��� � �������� ����� - � ���������, ��� ������� ����� ������ ���������.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_03");	//��� ��� ��� ������������ ���� ������������� ���� ��������. � �� ��������� ���!
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_xardas_innoseyebroken);
	Info_AddChoice(dia_xardas_innoseyebroken,"� ��� ������?",dia_xardas_innoseyebroken_wasnun);
};

func void dia_xardas_innoseyebroken_wasnun()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00");	//� ��� ������?
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01");	//��� ����������� ����. �� ������ �������������. � ������ ����������, � ��� ��������.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02");	//� ��� ��������, �� ����������� � ����� � �������� � ��������, ����� ����. ��������, �� �����, ��� ����� ������.
	b_logentry(TOPIC_INNOSEYE,"������� ������� �� ����� ������� ������������ ����� ������. ��� ���� ������ � ������ �������, ��������, ���� ������������ �������.");
	MIS_XARDAS_GOTOVATRASINNOSEYE = LOG_RUNNING;
};


instance DIA_XARDAS_RITUALREQUEST(C_INFO)
{
	npc = none_100_xardas;
	nr = 34;
	condition = dia_xardas_ritualrequest_condition;
	information = dia_xardas_ritualrequest_info;
	description = "������ �������� ���� � ����.";
};


func int dia_xardas_ritualrequest_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && Npc_KnowsInfo(other,dia_xardas_innoseyebroken) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualrequest_info()
{
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_00");	//������ �������� ���� � ����.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_01");	//������. ��� �� ������?
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_02");	//�� ������, ���-�� � ������� ��������� � ����� ������.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_03");	//(�������) ��� ������ ������. �����, � ����, ��� �� ������. �� ������, ����� �������� ���� � ����.
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_04");	//������ �� ��. ����� �� �������������?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_DJG) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_05");	//�� ����� ���������� ������� �����. � ����������� ����������. � �� ������ ��������� ���� ������, � ����� �������������� �� ��� �����.
		AI_StopProcessInfos(self);
		b_logentry(TOPIC_INNOSEYE,"������� ���������� ����������� � ������� � ����� ������.");
		b_giveplayerxp(XP_AMBIENT);
		Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
		XARDAS_GOESTORITUALINNOSEYE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_06");	//� ���� �������� � ���� ������� ������ ����� ���� ������, ��� �� ����� � ������� � ���������.
	};
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_WARUMNICHTJETZT(C_INFO)
{
	npc = none_100_xardas;
	nr = 34;
	condition = dia_xardas_warumnichtjetzt_condition;
	information = dia_xardas_warumnichtjetzt_info;
	description = "������ �� ���� �� ����������� �� ������� � �������� ����� ������?";
};


func int dia_xardas_warumnichtjetzt_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_ritualrequest) && (XARDAS_GOESTORITUALINNOSEYE == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_SLD)))
	{
		return TRUE;
	};
};

func void dia_xardas_warumnichtjetzt_info()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_00");	//������ �� ���� �� ����������� �� ������� � �������� ����� ������?
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_01");	//������ � ������ �� ������� ����.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_14_02");	//(�����������) �� ���� �������� �� ���� � ����� ����. ���� �� �� �, ���� �� �� ��� �� ������ ���� �� ��� ��� �� ����� � ���� �����.
	Info_AddChoice(dia_xardas_warumnichtjetzt,"�� ��������! ������ �����, ��� ��� ����� �������.",dia_xardas_warumnichtjetzt_wastun);
	Info_AddChoice(dia_xardas_warumnichtjetzt,"�����, �� ������� ���� ������� ���, ������ �� �����������.",dia_xardas_warumnichtjetzt_grund);
};

func void dia_xardas_warumnichtjetzt_grund()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_grund_15_00");	//�����, �� ������� ���� ������� ���, ������ �� �����������.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_01");	//� ��� ���, ��� � ������ �� ����� ����, � �������� ��������� �� ��� ��������.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_02");	//� � �� ��������� �������� ���� ��������, ���� ������ � ���� ������ �� �� ����� ������.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_03");	//�� ������, ��� � ��������� ����� ������������ ������ ���� �����, � ������� ���� ���������, ��� � ���� ���� ���� �����-�� ����� ������������� ��������.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_04");	//� ����� ������ �����������, �������, ���� ������ �� ������������. �����������, ����� ������� ���������� �����.
	AI_StopProcessInfos(self);
};

func void dia_xardas_warumnichtjetzt_wastun()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_wastun_15_00");	//�� ��������! ������ �����, ��� ��� ����� �������.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_01");	//�� ��� ��� ������� ����, ����� ��������� � ���������. � ���� ����������� � ���� ��� ������� ������.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_02");	//�� ����������� �� ���, ���� �� ������ ��������� �����. ��� ����� � �����, � ������������ � �������.
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_BEREIT(C_INFO)
{
	npc = none_100_xardas;
	condition = dia_xardas_bereit_condition;
	information = dia_xardas_bereit_info;
	description = "� ����� � �������� � ���������.";
};


func int dia_xardas_bereit_condition()
{
	if((XARDAS_GOESTORITUALINNOSEYE == FALSE) && Npc_KnowsInfo(other,dia_xardas_ritualrequest) && ((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_xardas_bereit_info()
{
	AI_Output(other,self,"DIA_Xardas_BEREIT_15_00");	//� ����� � �������� � ���������.
	AI_Output(self,other,"DIA_Xardas_BEREIT_14_01");	//����� �� ����� ������ �������. � ���������� ����������� � ����� ������. � �� ������� ���� ������. � ������� ���� ���.
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_INNOSEYE,"������� ���������� ����������� � ������� � ����� ������.");
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	XARDAS_GOESTORITUALINNOSEYE = TRUE;
};


instance DIA_XARDAS_BINGESPANNT(C_INFO)
{
	npc = none_100_xardas;
	nr = 35;
	condition = dia_xardas_bingespannt_condition;
	information = dia_xardas_bingespannt_info;
	permanent = TRUE;
	description = "���� ������ ��������� ���������?";
};


func int dia_xardas_bingespannt_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3) && (XARDAS_GOESTORITUALINNOSEYE == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_bingespannt_info()
{
	AI_Output(other,self,"DIA_Xardas_BINGESPANNT_15_00");	//���� ������ ��������� ���������?
	AI_Output(self,other,"DIA_Xardas_BINGESPANNT_14_01");	//� �� ������ ������. ��� ������� �� ����, ��� ������ ���������� ������� ������.
};


instance DIA_XARDAS_PYROWILLNICHT(C_INFO)
{
	npc = none_100_xardas;
	nr = 37;
	condition = dia_xardas_pyrowillnicht_condition;
	information = dia_xardas_pyrowillnicht_info;
	description = "������� ������������ ������� ������� � �������.";
};


func int dia_xardas_pyrowillnicht_condition()
{
	if((PYROKAR_DENIESINNOSEYERITUAL == TRUE) && Npc_KnowsInfo(other,dia_xardas_ritualrequest) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_pyrowillnicht_info()
{
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_00");	//������� ������������ ������� ������� � �������.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_01");	//������� �� ����� �������� �������������� ����, ��� �� ����� �������� ����.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_02");	//��, �������! �������. ��� ���������.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_03");	//���� ������ ����� ���������� ���������� �����������. �� � �����, � ���� ���� ���-���, ��� ������� ����.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_04");	//����� � ������� ����� ����� ����, � ���� � ����� �� ��������� ��������� �����.
	/*if(Npc_GetDistToWP(self,"NW_XARDAS_START") <= 2000)
	{
		AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_05");	//Now that I've built my tower so close to town, I have to be prepared. Someone could come here and look for them at anytime.
	};*/
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_06");	//� �� �����, ����� �������� ��� ���� ���� ����������� ��� � ���� ����� ����� ����, � ����� ��� ����.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_07");	//������� � ������� �� � �������� �����, ��� ����� ������� �� ������ � ������ ������ ��.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_08");	//� ��� ��?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_09");	//��������� �� ��� ����� � �������� ������� �� ����� ������.
	SEKOB_ROOMFREE = TRUE;
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_10");	//�� ��������� ����� ������?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_11");	//���. �� ��� ����� ������ � �� �� ����� �������� ������ ��������. � ���� ��, ���� ������ ������. ��� ����.
	CreateInvItems(self,itke_chest_sekob_xardasbook_mis,1);
	b_giveinvitems(self,other,itke_chest_sekob_xardasbook_mis,1);
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_12");	//���, ����� �������, ���� ����� ������ �����. ����� ������� ������ ��� �����, �� ������, ��� ��� �� ����.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_13");	//��� ������ �� ����� ���. �������, ����� ��� �������� ���� ����� ����.
	b_logentry(TOPIC_INNOSEYE,"������� ��� ��� ���� �� ������� �� ����� ������. � ������ ������� �����, ����������� � ���, ��������.");
};


instance DIA_XARDAS_RITUALINNOSEYEREPAIRIMPORTANT(C_INFO)
{
	npc = none_100_xardas;
	nr = 36;
	condition = dia_xardas_ritualinnoseyerepairimportant_condition;
	information = dia_xardas_ritualinnoseyerepairimportant_info;
	important = TRUE;
};


func int dia_xardas_ritualinnoseyerepairimportant_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualinnoseyerepairimportant_info()
{
	AI_Output(self,other,"DIA_Xardas_Add_14_06");	//������, ����� ���� ������ ������������, �� ������ ��������� ����� ���������!
	AI_Output(self,other,"DIA_Xardas_Add_14_07");	//��� ��� ������ �������, ���� ����.
	AI_Output(self,other,"DIA_Xardas_Add_14_08");	//�� ������ ���� ����� ������ ����, ������� ������������ ��. ������ ��� ����� ��������� ��� ����.
	AI_Output(self,other,"DIA_Xardas_Add_14_09");	//����� �������� ���� ����.
	AI_Output(self,other,"DIA_Xardas_Add_14_10");	//� ��� ������ �� �������� ���, ����� �� ����������� �� ���!
	Info_ClearChoices(dia_xardas_ritualinnoseyerepairimportant);
	Info_AddChoice(dia_xardas_ritualinnoseyerepairimportant,DIALOG_ENDE,dia_xardas_ritualinnoseyerepairimportant_weiter);
};

func void dia_xardas_ritualinnoseyerepairimportant_weiter()
{
	AI_StopProcessInfos(self);
	b_startotherroutine(xardas,"Start");
	b_startotherroutine(vatras,"Start");
};


instance DIA_XARDAS_WASNUN(C_INFO)
{
	npc = none_100_xardas;
	nr = 36;
	condition = dia_xardas_wasnun_condition;
	information = dia_xardas_wasnun_info;
	permanent = TRUE;
	description = "���� ������ ������������. ��� ������?";
};


func int dia_xardas_wasnun_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_wasnun_info()
{
	AI_Output(other,self,"DIA_Xardas_WASNUN_15_00");	//���� ������ ������������. ��� ������?
	AI_Output(self,other,"DIA_Xardas_WASNUN_14_01");	//�� ������ ������ ���, ����� ��, �������, ����������� ����� ���������.
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_02");	//�� ����� �������. ����������� � ������ �������� � ���� ���� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_03");	//��� � ��������, � ����� �� �������� ����, ��� ������������ ������.
	};
};


instance DIA_XARDAS_KAP4_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap4_exit_condition;
	information = dia_xardas_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_xardas_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_PERM4(C_INFO)
{
	npc = none_100_xardas;
	nr = 40;
	condition = dia_xardas_perm4_condition;
	information = dia_xardas_perm4_info;
	permanent = TRUE;
	description = "��� ������?";
};


func int dia_xardas_perm4_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_xardas_perm4_info()
{
	AI_Output(other,self,"DIA_Xardas_PERM4_15_00");	//��� ������?
	AI_Output(self,other,"DIA_Xardas_PERM4_14_01");	//������ ��� �� ����. ��� �� �����������, ���� �� ��������� ����.
	AI_Output(self,other,"DIA_Xardas_PERM4_14_02");	//���� �������� � ������ �������� � ������, ��� ����� �� ����� �����������. � ��������� ������, �� ���� ������ �������� ��� ������.
};


instance DIA_XARDAS_KAP5_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap5_exit_condition;
	information = dia_xardas_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_xardas_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_KAP6_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap6_exit_condition;
	information = dia_xardas_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_xardas_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

