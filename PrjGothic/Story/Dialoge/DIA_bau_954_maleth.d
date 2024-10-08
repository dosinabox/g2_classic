
instance DIA_MALETH_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_exit_condition;
	information = dia_maleth_exit_info;
	permanent = TRUE;
	description = "��� ����� ����!";
};


func int dia_maleth_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_maleth_exit_info()
{
	AI_StopProcessInfos(self);
	if(MALETH_ERSTERWOLF == FALSE)
	{
		Wld_InsertNpc(ywolf,"NW_FARM1_PATH_CITY_SHEEP_06");
		MALETH_ERSTERWOLF = TRUE;
	};
};


instance DIA_MALETH_HALLO(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_hallo_condition;
	information = dia_maleth_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_maleth_hallo_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_maleth_hallo_info()
{
	AI_Output(self,other,"DIA_Maleth_Hallo_08_00");	//������, ���������!
	if(hero.guild == GIL_NONE)
	{
		if(Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_01");	//� �����, ��� �� ��������� � ���.
		};
		AI_Output(self,other,"DIA_Maleth_Hallo_08_02");	//���� �������, ��� �� �� ������ ��� ������ �����.
		AI_Output(self,other,"DIA_Maleth_Hallo_08_03");	//�� �� ������� ���� �� ������� ����������. � � ���� � ��� �������� ��������!
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_04");	//�� ��������� ��������� ����������.
		}
		else
		{
			AI_Output(self,other,"DIA_Maleth_Hallo_08_05");	//�� �������� ��������� ����������, ����� ������ ��� �������� �����.
			AI_Output(self,other,"DIA_Maleth_Hallo_08_06");	//�� � ������ �� ����� �� ��������!
		};
	};
	AI_Output(self,other,"DIA_Maleth_Hallo_08_07");	//(�����������) ��� ���� ����� �����?
};


instance DIA_MALETH_BANDITS(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_bandits_condition;
	information = dia_maleth_bandits_info;
	permanent = FALSE;
	description = "�� ���� ������ ������� � �����.";
};


func int dia_maleth_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_bdt_1013_bandit_where) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_bandits_info()
{
	AI_Output(other,self,"DIA_Maleth_BANDITS_15_00");	//�� ���� ������ ������� � �����.
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_01");	//��� ������� �������! ���, ��������, �� �� �������, ��� ����� � ��� ���� ������� �����!
	AI_Output(self,other,"DIA_Maleth_BANDITS_08_02");	//���� ��� ����� �������. ����� ���� ������� ���� �� ��� �����.
};


instance DIA_MALETH_BANDITSDEAD(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsdead_condition;
	information = dia_maleth_banditsdead_info;
	permanent = FALSE;
	description = "��� ������� ������ �� ����� ���������� ���...";
};


func int dia_maleth_banditsdead_condition()
{
	var C_NPC b13;
	var C_NPC b14;
	var C_NPC b15;
	b13 = Hlp_GetNpc(bdt_1013_bandit_l);
	b14 = Hlp_GetNpc(bdt_1014_bandit_l);
	b15 = Hlp_GetNpc(bdt_1015_bandit_l);
	if((Npc_IsDead(b13) || Npc_KnowsInfo(other,dia_1013_bandit_frommaleth)) && Npc_IsDead(b14) && Npc_IsDead(b15) && Npc_KnowsInfo(other,dia_maleth_bandits))
	{
		return TRUE;
	};
};

func void dia_maleth_banditsdead_info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_00");	//��� ������� ������ �� ����� ���������� ���...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_01");	//������? ��� ������?
	AI_Output(other,self,"DIA_Maleth_BanditsDEAD_15_02");	//��� �� �� ���� ������...
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_03");	//����� ������! ��� - ����� �������, �� � ����, ����� �� ������ ���!
	b_giveinvitems(self,other,itfo_wine,3);
	MIS_MALETH_BANDITS = LOG_SUCCESS;
	b_giveplayerxp(XP_MALETHKILLBANDITS);
	AI_Output(self,other,"DIA_Maleth_BanditsDEAD_08_04");	//� �������� ��������� �� ����!
};


instance DIA_MALETH_BANDITSALIVE(C_INFO)
{
	npc = bau_954_maleth;
	nr = 1;
	condition = dia_maleth_banditsalive_condition;
	information = dia_maleth_banditsalive_info;
	permanent = FALSE;
	description = "� ����, ��� �������� ��� �������...";
};


func int dia_maleth_banditsalive_condition()
{
	var C_NPC b13;
	var C_NPC b14;
	var C_NPC b15;
	b13 = Hlp_GetNpc(bdt_1013_bandit_l);
	b14 = Hlp_GetNpc(bdt_1014_bandit_l);
	b15 = Hlp_GetNpc(bdt_1015_bandit_l);
	if((!Npc_IsDead(b13) || !Npc_IsDead(b14) || !Npc_IsDead(b15)) && Npc_KnowsInfo(other,dia_maleth_bandits) && (MIS_MALETH_BANDITS != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_maleth_banditsalive_info()
{
	AI_Output(other,self,"DIA_Maleth_BanditsALIVE_15_00");	//� ����, ��� �������� ��� �������...
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_01");	//�� ������ ������� �� ���? � � ����� ���� �� �����! ��� ������� ������!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_02");	//����� ����, ��� ����� ������������� �� ������!
	AI_Output(self,other,"DIA_Maleth_BanditsALIVE_08_03");	//�� ���� �� �������, ��� ������ �������� ��� �� ���� ��������, ��� �� ���� ����� ����� ����� ���������� ����.
	MIS_MALETH_BANDITS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_MALETH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETH,LOG_RUNNING);
	b_logentry(TOPIC_MALETH,"���� � �������� ��������, ������������ �� ������� �� ����� �������� � ����� �������, ��� ��������� ����� ����� ����� ���������� ���.");
};


instance DIA_MALETH_TOTHECITY(C_INFO)
{
	npc = bau_954_maleth;
	nr = 2;
	condition = dia_maleth_tothecity_condition;
	information = dia_maleth_tothecity_info;
	permanent = FALSE;
	description = "� ��� � �����.";
};


func int dia_maleth_tothecity_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_hallo) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_tothecity_info()
{
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_00");	//� ��� � �����.
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_01");	//�������� ��, ��� �� ���������, ���� �������� ��������� ������, ����� ������� � �����.
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_02");	//� �� ������ �����, ��� ��� ����� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_03");	//��� ����� �������� ���� - ���� �� ������� �� ��, ��� ��� ����� ��������...
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_04");	//� ��� ���?
	AI_Output(self,other,"DIA_Maleth_ToTheCity_08_05");	//��, ��������, ��� �� � ����� ������� � ����� � ���������� �������.
	Log_CreateTopic(TOPIC_CITY,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CITY,LOG_RUNNING);
	b_logentry(TOPIC_CITY,"����� ������� � �����, � ���� ������� ���������� � �����, ��� � ��� � ����� ������� � ���� �������� �������.");
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other,"DIA_Maleth_ToTheCity_08_06");	//�� ��� ���� �� �������. �� �� ����� �� �������.
		b_logentry(TOPIC_CITY,"�������, � ������ ���� ����� �� �������.");
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_07");	//�������.
};


instance DIA_MALETH_EQUIPMENT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 3;
	condition = dia_maleth_equipment_condition;
	information = dia_maleth_equipment_info;
	permanent = FALSE;
	description = "��� ����� ����������!";
};


func int dia_maleth_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_hallo) && (KAPITEL < 3) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_equipment_info()
{
	AI_Output(other,self,"DIA_Maleth_Equipment_15_00");	//��� ����� ����������!
	AI_Output(self,other,"DIA_Maleth_Equipment_08_01");	//���� �����������. �� � ������ ����� ����: � ��� ��� ������, ��� �� ����� �� ����������!
	if(!Npc_IsDead(lobart))
	{
		AI_Output(self,other,"DIA_Maleth_Equipment_08_02");	//����, ���� �� ������ ���������, ������ ������� ���� ���-���.
		AI_Output(self,other,"DIA_Maleth_Equipment_08_03");	//��, ��� �� ������ ����� � ���� � ��������, ��� �� � ���� �����-������ ������.
	};
};


instance DIA_MALETH_LOBART(C_INFO)
{
	npc = bau_954_maleth;
	nr = 3;
	condition = dia_maleth_lobart_condition;
	information = dia_maleth_lobart_info;
	permanent = FALSE;
	description = "��� ��� ����� �������?";
};


func int dia_maleth_lobart_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_equipment) && !Npc_IsDead(lobart) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_maleth_lobart_info()
{
	AI_Output(other,self,"DIA_Maleth_LOBART_15_00");	//��� ��� ����� �������?
	AI_Output(self,other,"DIA_Maleth_LOBART_08_01");	//�� �����, ������� ��! ��� ���� ��� �����!
	AI_Output(self,other,"DIA_Maleth_LOBART_08_02");	//� �� ������� ������ ���! �� ����� � ��������� � ����� ��� ����� ������������.
};


instance DIA_MALETH_KAP3_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap3_exit_condition;
	information = dia_maleth_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_maleth_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_PROBLEME(C_INFO)
{
	npc = bau_954_maleth;
	nr = 30;
	condition = dia_maleth_probleme_condition;
	information = dia_maleth_probleme_info;
	description = "������ ������ � ��������� �����?";
};


func int dia_maleth_probleme_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_maleth_probleme_info()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_15_00");	//������ ������ � ��������� �����?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_01");	//������ ��� �� ������ � �����.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_08_02");	//���� �� ������� �������� � ������ ����, �� �������, ��� ������.
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"��� ���� ����?",dia_maleth_probleme_schafe);
	Info_AddChoice(dia_maleth_probleme,"���� � ������ ����� � ��� ��� �� ������������?",dia_maleth_probleme_beidir);
};

func void dia_maleth_probleme_beidir()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_beidir_15_00");	//���� � ������ ����� � ��� ��� �� ������������?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_beidir_08_01");	//��. ��� ���� ����� ��������� ���� �����. ��� �������� ���, ��� ����� �������� �� ���.
};

func void dia_maleth_probleme_schafe()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_15_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_08_01");	//(���) ��� ����� ��� ���� ����������. � ���� ���� ��������.
	Info_AddChoice(dia_maleth_probleme,"��� ��������? �� ��� �� ������ �� ����?",dia_maleth_probleme_schafe_probleme);
};

func void dia_maleth_probleme_schafe_probleme()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_15_00");	//��� ��������? �� ��� �� ������ �� ����?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_01");	//(�����) �� ������� � ��������� ������ ��� ���? ����� ������ ���-������ � ����� ��������� � ������ �����.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_02");	//(���) ��, ������� ��������, ������� ������ �� �����: ��� ���������� ������ ������ ����� � ���� �������.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_08_03");	//��, �������������� ���� �� ���������, ������ ���-������ ������� � ����� ������� � ������ �����.
	};
	Info_ClearChoices(dia_maleth_probleme);
	Info_AddChoice(dia_maleth_probleme,DIALOG_BACK,dia_maleth_probleme_back);
	Info_AddChoice(dia_maleth_probleme,"��, ������� �� ���������, ��������.",dia_maleth_probleme_schafe_probleme_drohen);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(dia_maleth_probleme,"��� � ���� �� ��������?",dia_maleth_probleme_schafe_probleme_geldher_auftrag);
	};
};

func void dia_maleth_probleme_schafe_probleme_geldher_auftrag()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00");	//��� � ���� �� ��������?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01");	//����� ����� ��� ����������� �����, ��� ���� ������ ��� ��������� ������ �����.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02");	//� ������ �� �����. � ���� ������, ��� ��� ����� � ��� ��� ������.
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03");	//� ��-�� ����� �� ��� ������?
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04");	//���� ����� ��������, ��� �� �� ���� ����� ������.
	Log_CreateTopic(TOPIC_MALETHSGEHSTOCK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MALETHSGEHSTOCK,LOG_RUNNING);
	b_logentry(TOPIC_MALETHSGEHSTOCK,"����� ������� � ������� � ������� ���� �����. ��������� � ���� ���, �� ������� �� ������ ������ �� ����� �������. ��������, � ����� �� ���-������ ����������.");
	Info_ClearChoices(dia_maleth_probleme);
};

func void dia_maleth_probleme_schafe_probleme_drohen()
{
	AI_Output(other,self,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00");	//��, ������� �� ���������, ��������.
	AI_Output(self,other,"DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01");	//�� ������ � ������, ��� �������. ����� ����� ���� ����.
};

func void dia_maleth_probleme_back()
{
	Info_ClearChoices(dia_maleth_probleme);
};


instance DIA_MALETH_GEHSTOCK(C_INFO)
{
	npc = bau_954_maleth;
	nr = 33;
	condition = dia_maleth_gehstock_condition;
	information = dia_maleth_gehstock_info;
	description = "� �����, ��� ���� �����.";
};


func int dia_maleth_gehstock_condition()
{
	if(Npc_HasItems(other,itmw_malethsgehstock_mis) && Npc_KnowsInfo(other,dia_maleth_probleme))
	{
		return TRUE;
	};
};

func void dia_maleth_gehstock_info()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_00");	//� �����, ��� ���� �����.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_01");	//��� ����������! �...
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_02");	//���������. ������� ������� �� ����.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_03");	//��... � ���� ����� ������ ���.
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_15_04");	//����� �������� ���-������ ���.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_05");	//������. ��� ������ �����? ����� � �����, ��� ���� ��������� ������� � ����������� ������� ������.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_08_06");	//���� � ����� ����, ��� ��� ������ ���� ���������, � ������ ��� ����� �����?
	TOPIC_END_MALETHSGEHSTOCK = TRUE;
	b_giveplayerxp(XP_FOUNDMALETHSGEHSTOCK);
	Info_ClearChoices(dia_maleth_gehstock);
	Info_AddChoice(dia_maleth_gehstock,"������, ��� ��� �� ���������. � ���� �������� ������ �� ����.",dia_maleth_gehstock_gold);
	Info_AddChoice(dia_maleth_gehstock,"������.",dia_maleth_gehstock_ok);
};

func void dia_maleth_gehstock_ok()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_ok_15_00");	//������.
	b_giveinvitems(other,self,itmw_malethsgehstock_mis,1);
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_01");	//�����. ������ ��� �� �����, ��� � ���� ����. ��� �� ������� ������.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_ok_08_02");	//� ������ ����� �� ��������� ������� ���-������.
	b_logentry(TOPIC_MALETHSGEHSTOCK,"����� ��������� ���, ��� � ����, � ������ �� ����� �������, ��������� ������� ������ ��������.");
	CreateInvItems(bdt_1024_malethsbandit,itmi_malethsbanditgold,1);
	Info_ClearChoices(dia_maleth_gehstock);
	AI_StopProcessInfos(self);
};

func void dia_maleth_gehstock_gold()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_gold_15_00");	//������, ��� ��� �� ���������. � ���� �������� ������ �� ����.
	AI_Output(self,other,"DIA_Maleth_GEHSTOCK_gold_08_01");	//��� ���, ��� � ���� ����. ����� ������ ���� ����������.
	CreateInvItems(self,itmi_gold,35);
	b_giveinvitems(self,other,itmi_gold,35);
	b_giveinvitems(other,self,itmw_malethsgehstock_mis,1);
	Info_ClearChoices(dia_maleth_gehstock);
};


instance DIA_MALETH_PERM3(C_INFO)
{
	npc = bau_954_maleth;
	nr = 33;
	condition = dia_maleth_perm3_condition;
	information = dia_maleth_perm3_info;
	permanent = TRUE;
	description = "������, �� �����������.";
};


func int dia_maleth_perm3_condition()
{
	if(Npc_KnowsInfo(other,dia_maleth_probleme) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_maleth_perm3_info()
{
	AI_Output(other,self,"DIA_Maleth_PERM3_15_00");	//������, �� �����������.
	AI_Output(self,other,"DIA_Maleth_PERM3_08_01");	//(�������) ����������.
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP4_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap4_exit_condition;
	information = dia_maleth_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_maleth_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP5_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap5_exit_condition;
	information = dia_maleth_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_maleth_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_KAP6_EXIT(C_INFO)
{
	npc = bau_954_maleth;
	nr = 999;
	condition = dia_maleth_kap6_exit_condition;
	information = dia_maleth_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_maleth_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_maleth_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MALETH_PICKPOCKET(C_INFO)
{
	npc = bau_954_maleth;
	nr = 900;
	condition = dia_maleth_pickpocket_condition;
	information = dia_maleth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_maleth_pickpocket_condition()
{
	return c_beklauen(10,10);
};

func void dia_maleth_pickpocket_info()
{
	Info_ClearChoices(dia_maleth_pickpocket);
	Info_AddChoice(dia_maleth_pickpocket,DIALOG_BACK,dia_maleth_pickpocket_back);
	Info_AddChoice(dia_maleth_pickpocket,DIALOG_PICKPOCKET,dia_maleth_pickpocket_doit);
};

func void dia_maleth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_maleth_pickpocket);
};

func void dia_maleth_pickpocket_back()
{
	Info_ClearChoices(dia_maleth_pickpocket);
};

