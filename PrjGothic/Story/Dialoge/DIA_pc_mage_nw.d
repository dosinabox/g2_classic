
instance DIA_MILTENNW_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_exit_condition;
	information = dia_miltennw_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap3_exit_condition;
	information = dia_miltennw_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP3_HELLO(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_hello_condition;
	information = dia_miltennw_kap3_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltennw_kap3_hello_condition()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_hello_info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_00");	//(�� ����) � �� ���� �������� � ���. �� ������������� ���� ���������?
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_01");	//������ �� ��.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_02");	//(� �������) ���� ����� ��� �� ���������� ����������, �� ����������� ������� ����� ������� ��� ������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_03");	//�����-�� ������� ����� ��� ���� �� ��������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_04");	//�������� �� ������ � �����.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_05");	//� ����, �� ��� ����� ������, ��� �� �� ����� �������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_06");	//�� ��.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_07");	//��� �� ������� �����, � ���������? ��� � ������. �� ������ ���� ����������� � ��������� �����.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_08");	//��������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_09");	//� ���� ��� - ����� ����� ���� ���������� � ��������, �� �������� �� ���, ���������. �� ������� ��� ����� ��������.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_10");	//� ����, ��� ����� ��������� �������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_11");	//����� �����?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_12");	//��� �� ������������� � ��������� �� ���������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_13");	//��, �� ������� �� ��� ��������� ������. ��� �� �����, �� ���������� �� ���� ����� ����, � ������ ��� ����� ��������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_14");	//��� ���?
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_15");	//� ���, �������, � ���� �� ����, ��� �� ���������, ��� ���� ������ ������� ����.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_16");	//���� �� ������ � �����.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_17");	//� ����, ��, ��� �� �����, ��� ���������� ��������. � �� ������ �����.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Hello_03_18");	//�� ������� �������. ��� ���� ������� ����� ������������ ���� ������.
		AI_Output(other,self,"DIA_MiltenNW_KAP3_Hello_15_19");	//��, �����.
	};
};


instance DIA_MILTENNW_MONASTERY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_monastery_condition;
	information = dia_miltennw_monastery_info;
	permanent = FALSE;
	description = "��� �� ���� ��������� �� ��������� ��� ������?";
};


func int dia_miltennw_monastery_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_monastery_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Monastery_15_00");	//��� �� ���� ��������� �� ��������� ��� ������?
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_01");	//������ ����� ������? � ������������ ����� ������ � ���������� ����� � ���������.
	AI_Output(self,other,"DIA_MiltenNW_Monastery_03_02");	//������ ��������, ��� ��� ���� �������� - ���� �� ���� ��������, ��� ���������� �� ��� ������� �� ������, �� ������� ��������� ��� �� ������, ��� � ������.
};


instance DIA_MILTENNW_FOURFRIENDS(C_INFO)
{
	npc = pc_mage_nw;
	nr = 35;
	condition = dia_miltennw_fourfriends_condition;
	information = dia_miltennw_fourfriends_info;
	permanent = FALSE;
	description = "�� ������, ��� ���������?";
};


func int dia_miltennw_fourfriends_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_fourfriends_info()
{
	AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_00");	//�� ������, ��� ���������?
	if(Npc_IsDead(pc_fighter_nw_vor_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_01");	//����, ������, ������ �� ��������� ����� ���������� � ������ �������.
		if(MIS_RESCUEGORN != LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_MiltenNW_FourFriends_15_02");	//��� ��� ������� ���������?
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_03");	//��� �������� ������� �������, ��� ��� �� ���� ��� ���������.
			AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_04");	//�� ��� ������ ����� ����, �������?
		};
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_05");	//� ����� ������, �� ����� ����������� � �� � ����������, ��� ���������� �� �����.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_06");	//����� ��������� � �������, ��, ��������, ������ �������� ���������� ������ � ���� � ���������� �� ��������� �������� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_07");	//���� �� �������.
	};
	if(Npc_IsDead(pc_thief_nw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_08");	//����� �������� ���-�� � ��������. �� � ������� �� ����, ��� �� ����� ������� ����.
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_09");	//�� � ����������, ��� �� ������ � ������. �� ������ ��� - �� ������ ���, ��� ����� ����������.
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_FourFriends_03_10");	//����� ������� ����� - ������, ��� ������ ������� � ���.
	};
};


instance DIA_MILTENNW_KAP3_ENTRY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 32;
	condition = dia_miltennw_kap3_entry_condition;
	information = dia_miltennw_kap3_entry_info;
	permanent = TRUE;
	description = "��� ����� ������� � ���������. ��� ������!";
};


func int dia_miltennw_kap3_entry_condition()
{
	if((KAPITEL == 3) && (hero.guild != GIL_KDF) && (MILTENNW_GIVESMONASTERYKEY == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_entry_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_15_00");	//��� ����� ������� � ���������. ��� ������!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_01");	//��, �������. ��� ����.
		CreateInvItems(self,itke_innos_mis,1);
		b_giveinvitems(self,other,itke_innos_mis,1);
		MILTENNW_GIVESMONASTERYKEY = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_02");	//� �� ���� ������� ���� � ���������. � ���� ����� �������� � ������ �������.
		AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_03_03");	//��� ���������� ��������� �����, � ������ �� ���� ������� � ���������.
		Info_ClearChoices(dia_miltennw_kap3_entry);
		Info_AddChoice(dia_miltennw_kap3_entry,DIALOG_BACK,dia_miltennw_kap3_entry_back);
		Info_AddChoice(dia_miltennw_kap3_entry,"�� ��� �����!",dia_miltennw_kap3_entry_important);
		if(Npc_HasItems(other,itwr_permissiontowearinnoseye_mis) >= 1)
		{
			Info_AddChoice(dia_miltennw_kap3_entry,"� ���� ���� ������ �� ����� ������.",dia_miltennw_kap3_entry_permit);
		};
	};
};

func void dia_miltennw_kap3_entry_back()
{
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_important()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Important_15_00");	//�� ��� �����!
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Important_03_01");	//��� �� �������. ������� ������� ��� ������ �� ���.
	Info_ClearChoices(dia_miltennw_kap3_entry);
};

func void dia_miltennw_kap3_entry_permit()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Entry_Permit_15_00");	//� ���� ���� ������ �� ����� ������.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_01");	//������.
	b_giveinvitems(other,self,itwr_permissiontowearinnoseye_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Entry_Permit_03_02");	//(���������) ������. ��� ���� �� ���������. �� ������� �������� � ������.
	CreateInvItems(self,itke_innos_mis,1);
	b_giveinvitems(self,other,itke_innos_mis,1);
	b_giveinvitems(self,other,itwr_permissiontowearinnoseye_mis,1);
	MILTENNW_GIVESMONASTERYKEY = TRUE;
	Info_ClearChoices(dia_miltennw_kap3_entry);
};


instance DIA_MILTENNW_KAP3_NOVIZENCHASE(C_INFO)
{
	npc = pc_mage_nw;
	nr = 31;
	condition = dia_miltennw_kap3_novizenchase_condition;
	information = dia_miltennw_kap3_novizenchase_info;
	permanent = FALSE;
	description = "�� ������, ��� �����?";
};


func int dia_miltennw_kap3_novizenchase_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING) && (MIS_SCKNOWSINNOSEYEISBROKEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_novizenchase_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_NovizenChase_15_00");	//�� ������, ��� �����?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_01");	//�� �������, � ����� �� ����� ���� �� � ����, ��� ���������� ���� ���������?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_02");	//�� ������ ��������� �� ��, ��� ������. � �������, ��� ������� ������� ����.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_03");	//�� ������ ������ ���. ����� ��� � ������� ����� ���� ������.
//	������� ���������� ������ ������ ��, �������� � ������
//	AI_Output(self,other,"DIA_MiltenNW_KAP3_NovizenChase_03_04");	//� ��������, ��� ����� �������.
};


instance DIA_MILTENNW_KAP3_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 39;
	condition = dia_miltennw_kap3_perm_condition;
	information = dia_miltennw_kap3_perm_info;
	permanent = FALSE;
	description = "�� ������, ���-������ � ����� � ������ �����?";
};


func int dia_miltennw_kap3_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap3_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP3_Perm_15_00");	//�� ������, ���-������ � ����� � ������ �����?
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_01");	//���, �� � ���� ������ ������������ ������ ���.
	AI_Output(self,other,"DIA_MiltenNW_KAP3_Perm_03_02");	//���� ���������, ���� ���������� �� ���.
};


instance DIA_MILTENNW_KAP4_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap4_exit_condition;
	information = dia_miltennw_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_KAP4_PERM(C_INFO)
{
	npc = pc_mage_nw;
	nr = 49;
	condition = dia_miltennw_kap4_perm_condition;
	information = dia_miltennw_kap4_perm_info;
	permanent = TRUE;
	description = "���� �������?";
};


func int dia_miltennw_kap4_perm_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap4_perm_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_00");	//���� �������?
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_01");	//��� � ������ ���� ����������. �� ��� ����� ����� �����������.
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_02");	//������ ����� �������� ����������� ��������� ��� �����.
		AI_Output(other,self,"DIA_MiltenNW_KAP4_PERM_15_03");	//���-������ ���?
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_04");	//��������� ����� ��� ������ ��������� � ��������� �����, ���� �� ��������� ������ ��������.
			AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_05");	//��� ��� ��� �� �������� - � �� �����, ��� � ��� �������� ����� �������.
		}
		else if(hero.guild == GIL_DJG)
		{
			AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_06");	//������ ������� � ��������� ���������� ������� � ��� �����.
			AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_07");	//� �� ����, ��� ��� ��� ������, �� � �����, ��� ���� ���-�� �������.
		}
		else
		{
			AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_08");	//�� �������� ��� ������ ��������� �� ��������� �����. ���� ���� �����, ����������� �������, ��� � ������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_KAP4_PERM_03_09");	//���, �������� ��� ��� ����� ���������. ���, ��� ��� �������� - ��� ������ � ������.
	};
};


instance DIA_MILTENNW_KAP5_EXIT(C_INFO)
{
	npc = pc_mage_nw;
	nr = 999;
	condition = dia_miltennw_kap5_exit_condition;
	information = dia_miltennw_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltennw_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_ALLDRAGONSDEAD(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_miltennw_alldragonsdead_condition;
	information = dia_miltennw_alldragonsdead_info;
	permanent = FALSE;
	description = "� ���� ���� ��������.";
};


func int dia_miltennw_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_miltennw_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_00");	//� ���� ���� ��������.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_01");	//������? ������, ���� ��� �������� ������� �� ���������. ������ ���, ��� ��� ��������, - ��� �������� ������ ���.
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_02");	//���� �� ������������� ������ ���, �� ����������� ������� � ���� �����.
	AI_Output(other,self,"DIA_MiltenNW_AllDragonsDead_15_03");	//����, ���?
	AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_04");	//����, ������� ��. ���� �� ���?
	if(MILTENNW_ISONBOARD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_MiltenNW_AllDragonsDead_03_05");	//�� ������ ��������� ��� ����� ������, ����� ����� ����� ������� ������.
	};
};


instance DIA_MILTENNW_SCWASINLIB(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_scwasinlib_condition;
	information = dia_miltennw_scwasinlib_info;
	important = TRUE;
};


func int dia_miltennw_scwasinlib_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_miltennw_scwasinlib_info()
{
	AI_Output(self,other,"DIA_MiltenNW_SCWasInLib_03_00");	//��, � ������, �� ������ ����� ������� � ������������ �������. ��� �� ����� ���?
};


instance DIA_MILTENNW_KNOWWHEREENEMY(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_knowwhereenemy_condition;
	information = dia_miltennw_knowwhereenemy_info;
	permanent = TRUE;
	description = "� ����, ��� ���������� ����.";
};


func int dia_miltennw_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (MILTENNW_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};


var int sctoldmiltenheknowwhereenemy;

func void dia_miltennw_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_00");	//� ����, ��� ���������� ����. �� ��������� �������, �������� ������.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_01");	//��� ��� ����. �� ������ ������������ ���� ���������� � ���������� ��� ��� � ��������.
	SCTOLDMILTENHEKNOWWHEREENEMY = TRUE;
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	if(Npc_IsDead(diegonw) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_02");	//�� ������� � �����? � �����, �� ���������� �������������� � ����.
		b_logentry(TOPIC_CREW,"����� ����� ��������� ��������. �� ������� ������� �� ������������� �� ����� �����.");
	};
	if(Npc_IsDead(gornnw_nach_djg) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_03");	//� ��� ������ �����? �������� � ���. � ������, �� �������� �� ������ ��������.
		b_logentry(TOPIC_CREW,"����, �����������, ����� ��������� ��������. ������� �� �������� ����� �� ����� ������� ������ ����������� �����. ��������, �� ������ ����������� ����.");
	};
	if(Npc_IsDead(lester) == FALSE)
	{
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_04");	//� �� ������ �������. ���� �� �� �������� ��� �� ������, �� ������ ���.
		b_logentry(TOPIC_CREW,"���� � �� ������ ������� � �����, ��� ������� �� ��������� �� ���� ������.");
	};
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_05");	//� ����� ���� ���� ���� �� ���� ����. � ���� �������� ���� ���� � ������ � �������� ���. ����� �� ���������?
	b_logentry(TOPIC_CREW,"���� ������ ���������� � ���� �� ����, �� ����� ������� ���� ��������� ���� � �������� ��� ����.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_15_06");	//�� ��� ������, � ���� ��� ���������� �����.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_07");	//�� ������, � ������ ����� ����� � �����. ���� �����������, ������ �����.
		AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_03_08");	//�����, �� �� ������� ���� ����� ��� ����� ������.
	}
	else
	{
		Info_ClearChoices(dia_miltennw_knowwhereenemy);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"������ � �� ���� ����� ���� �����.",dia_miltennw_knowwhereenemy_no);
		Info_AddChoice(dia_miltennw_knowwhereenemy,"����� ���������� �� ����!",dia_miltennw_knowwhereenemy_yes);
	};
};

func void dia_miltennw_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_00");	//����� ���������� �� ����!
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_Yes_15_01");	//���������� � ������. ��� ���� ���.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_Yes_03_02");	//������. � ���� ���, ����� �� ������ �����.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};

func void dia_miltennw_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_MiltenNW_KnowWhereEnemy_No_15_00");	//������ � �� ���� ����� ���� �����.
	AI_Output(self,other,"DIA_MiltenNW_KnowWhereEnemy_No_03_01");	//�� ������, ��� � ����� ���� � ����� �� �����. ���� �����������, ������ �����.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_miltennw_knowwhereenemy);
};


instance DIA_MILTENNW_WHERECAPTAIN(C_INFO)
{
	npc = pc_mage_nw;
	nr = 3;
	condition = dia_miltennw_wherecaptain_condition;
	information = dia_miltennw_wherecaptain_info;
	description = "��� ��� ����� ��������?";
};


func int dia_miltennw_wherecaptain_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (SCTOLDMILTENHEKNOWWHEREENEMY == TRUE) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_wherecaptain_info()
{
	AI_Output(other,self,"DIA_MiltenNW_WhereCaptain_15_00");	//��� ��� ����� ��������?
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_01");	//������ �������. �� ���� �����. ��, ������ ����, ��� ��� � ���������.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_02");	//�� ���� �� �� ������ ������, �������� ������������ �� ������ ��� � ������, ����� ����, �������� �������, ��������� ��������� ����� ��������.
	AI_Output(self,other,"DIA_MiltenNW_WhereCaptain_03_03");	//����� ����� ���������� � �� ��� ������������ � ������ ��������. ������ ������ ������ ��� � ������ �� ��������.
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"��������, ����� ����� � ����� ������� � �������� ��������. �� ��� ��� ������ ���� � ���������. ����, ����� ���� ���� � ������ ��������� �� ������ � � ������. ��������, ��� ����� ���������� � �� ��� ������������ � ������.");
};


instance DIA_MILTENNW_LEAVEMYSHIP(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_leavemyship_condition;
	information = dia_miltennw_leavemyship_info;
	permanent = TRUE;
	description = "� �� ���� ����� ���� � �����.";
};


func int dia_miltennw_leavemyship_condition()
{
	if((MILTENNW_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltennw_leavemyship_info()
{
	AI_Output(other,self,"DIA_MiltenNW_LeaveMyShip_15_00");	//� �� ���� ����� ���� � �����.
	AI_Output(self,other,"DIA_MiltenNW_LeaveMyShip_03_01");	//�� ����� ������, ��� ���� �����. ���� �����������, � ���� ����� ���� � ���������.
	MILTENNW_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_MILTENNW_STILLNEEDYOU(C_INFO)
{
	npc = pc_mage_nw;
	nr = 55;
	condition = dia_miltennw_stillneedyou_condition;
	information = dia_miltennw_stillneedyou_info;
	permanent = TRUE;
	description = "�� ����� ���.";
};


func int dia_miltennw_stillneedyou_condition()
{
	if(((MILTENNW_ISONBOARD == LOG_OBSOLETE) || (MILTENNW_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_miltennw_stillneedyou_info()
{
	AI_Output(other,self,"DIA_MiltenNW_StillNeedYou_15_00");	//�� ����� ���.
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_01");	//���� ������� ������ ��� �����. ������, �� �� ����� ������ �������!
	AI_Output(self,other,"DIA_MiltenNW_StillNeedYou_03_02");	//� ����������� � ����. ���������� ���.
	self.flags = NPC_FLAG_IMMORTAL;
	MILTENNW_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	AI_StopProcessInfos(self);
};


instance DIA_MILTENNW_TEACH(C_INFO)
{
	npc = pc_mage_nw;
	nr = 90;
	condition = dia_miltennw_teach_condition;
	information = dia_miltennw_teach_info;
	permanent = TRUE;
	description = "� ���� ������� ����� ����������.";
};


func int dia_miltennw_teach_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_miltennw_teach_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Teach_15_00");	//� ���� ������� ���-����� ����������.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(dia_miltennw_teach);
		Info_AddChoice(dia_miltennw_teach,DIALOG_BACK,dia_miltennw_teach_back);
		if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_miltennw_teach_windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_miltennw_teach_feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
		{
			Info_AddChoice(dia_miltennw_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_miltennw_teach_eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenNW_Teach_03_01");	//�� ��� ��� �� ������ ������� ����� �����. � ������ �� ���� ������� ����.
	};
};

func void dia_miltennw_teach_back()
{
	Info_ClearChoices(dia_miltennw_teach);
};

func void dia_miltennw_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_miltennw_teach_feuerball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_miltennw_teach_eispfeil()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};


instance DIA_MILTENNW_MANA(C_INFO)
{
	npc = pc_mage_nw;
	nr = 100;
	condition = dia_miltennw_mana_condition;
	information = dia_miltennw_mana_info;
	permanent = TRUE;
	description = "� ���� �������� ��� ���������� �����������.";
};


func int dia_miltennw_mana_condition()
{
	if((other.guild == GIL_KDF) && (other.attribute[ATR_MANA_MAX] < 100))
	{
		return TRUE;
	};
};

func void dia_miltennw_mana_info()
{
	AI_Output(other,self,"DIA_MiltenNW_Mana_15_00");	//� ���� �������� ���� ���������� �����������.
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 100)
	{
		AI_Output(self,other,"DIA_MiltenNW_Mana_03_00");	//���� ���������� ������� ������. ������� ������, ����� � ��� ��������� ��.
	};
	Info_ClearChoices(dia_miltennw_mana);
};

func void dia_miltennw_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,100);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};

func void dia_miltennw_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,100);
	Info_ClearChoices(dia_miltennw_mana);
	Info_AddChoice(dia_miltennw_mana,DIALOG_BACK,dia_miltennw_mana_back);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltennw_mana_1);
	Info_AddChoice(dia_miltennw_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltennw_mana_5);
};


instance DIA_MAGE_NW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_nw;
	nr = 900;
	condition = dia_mage_nw_pickpocket_condition;
	information = dia_mage_nw_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_mage_nw_pickpocket_condition()
{
	return c_beklauen(56,75);
};

func void dia_mage_nw_pickpocket_info()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_BACK,dia_mage_nw_pickpocket_back);
	Info_AddChoice(dia_mage_nw_pickpocket,DIALOG_PICKPOCKET,dia_mage_nw_pickpocket_doit);
};

func void dia_mage_nw_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

func void dia_mage_nw_pickpocket_back()
{
	Info_ClearChoices(dia_mage_nw_pickpocket);
};

