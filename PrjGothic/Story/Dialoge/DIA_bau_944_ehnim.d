
instance DIA_EHNIM_EXIT(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 999;
	condition = dia_ehnim_exit_condition;
	information = dia_ehnim_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ehnim_exit_condition()
{
	return TRUE;
};

func void dia_ehnim_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_HALLO(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 3;
	condition = dia_ehnim_hallo_condition;
	information = dia_ehnim_hallo_info;
	description = "��� ��?";
};


func int dia_ehnim_hallo_condition()
{
	return TRUE;
};

func void dia_ehnim_hallo_info()
{
	AI_Output(other,self,"DIA_Ehnim_HALLO_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_01");	//���� ����� ����. � ������� �����.
	if(Hlp_IsValidNpc(egill) && !c_npcisdown(egill))
	{
		AI_Output(self,other,"DIA_Ehnim_HALLO_12_02");	//� ��������� ��� ��� - ��� ���� �����.
	};
	AI_Output(self,other,"DIA_Ehnim_HALLO_12_03");	//�� �������� �����, �� ����� �����, ��� ��������� ���.
};


instance DIA_EHNIM_FELDARBEIT(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 4;
	condition = dia_ehnim_feldarbeit_condition;
	information = dia_ehnim_feldarbeit_info;
	description = "��� ���� ������ � ����?";
};


func int dia_ehnim_feldarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_hallo))
	{
		return TRUE;
	};
};

func void dia_ehnim_feldarbeit_info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDARBEIT_15_00");	//��� ���� ������?
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_01");	//�� ������ ������? ��� ���� ��� ���� ������. ���� �� � ������ � ����.
	AI_Output(self,other,"DIA_Ehnim_FELDARBEIT_12_02");	//����� ������ ���� ����������, ����� ������� ������� �� ���������� � ���� ���������. ��� ������ ����, ���� �������� �� �������.
};


instance DIA_EHNIM_FELDRAEUBER(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 5;
	condition = dia_ehnim_feldraeuber_condition;
	information = dia_ehnim_feldraeuber_info;
	description = "������ �� ������ �� ������� � ����� �������� ���������?";
};


func int dia_ehnim_feldraeuber_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_feldarbeit))
	{
		return TRUE;
	};
};

func void dia_ehnim_feldraeuber_info()
{
	AI_Output(other,self,"DIA_Ehnim_FELDRAEUBER_15_00");	//������ �� ������ �� ������� � ����� �������� ���������?
	AI_Output(self,other,"DIA_Ehnim_FELDRAEUBER_12_01");	//� ���� �� �������, ��� ��� ������ �� �����. �� �������� � ���, ��� �� ����� ������ �������� �����.
};


instance DIA_EHNIM_STREIT1(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 6;
	condition = dia_ehnim_streit1_condition;
	information = dia_ehnim_streit1_info;
	description = "���� ���� ������ ��� �� �� �����.";
};


func int dia_ehnim_streit1_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_feldraeuber) && Npc_KnowsInfo(other,dia_ehnim_feldraeuber) && (Npc_KnowsInfo(other,dia_egill_streit2) == FALSE) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit1_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT1_15_00");	//���� ���� ������ ��� �� �� �����.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_01");	//���? ���� ����? �� �� ������ ��������, ��� ������ ��� ����� ���� �� ����������� � ����� �����.
	AI_Output(self,other,"DIA_Ehnim_STREIT1_12_02");	//��� �� ����� ����� ����� ����.
};


instance DIA_EHNIM_STREIT3(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 7;
	condition = dia_ehnim_streit3_condition;
	information = dia_ehnim_streit3_info;
	description = "���� ���� ������, ��� �� �������.";
};


func int dia_ehnim_streit3_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_streit2) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit3_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT3_15_00");	//���� ���� ������, ��� �� �������.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_01");	//���? � ���� ������������� ������� �������� ������� ���?
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_02");	//��� ����� ������� �� ����� ������, � �� ��� �������� ����� ��������� ��� ����.
	AI_Output(self,other,"DIA_Ehnim_STREIT3_12_03");	//���, � ����� ��� ���.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_STREIT5(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 8;
	condition = dia_ehnim_streit5_condition;
	information = dia_ehnim_streit5_info;
	permanent = TRUE;
	description = "� �����, ��� ����� ����� ������ ������.";
};


var int dia_ehnim_streit5_noperm;

func int dia_ehnim_streit5_condition()
{
	if(Npc_KnowsInfo(other,dia_egill_streit4) && (Hlp_IsValidNpc(egill) && !c_npcisdown(egill)) && (DIA_EHNIM_STREIT5_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_ehnim_streit5_info()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_15_00");	//� �����, ��� ����� ����� ������ ������.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_01");	//���� ������� �� ��������� �� ����� ����, � ����?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_12_02");	//� ��� ����� �����. ���� ��� ���.
	Info_ClearChoices(dia_ehnim_streit5);
	Info_AddChoice(dia_ehnim_streit5,"�����, ��� ������. � � �����.",dia_ehnim_streit5_gehen);
	Info_AddChoice(dia_ehnim_streit5,"������ �� �� ������� ��� ��� ���?",dia_ehnim_streit5_attack);
};

func void dia_ehnim_streit5_attack()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_Attack_15_00");	//������ �� �� ������� ��� ��� ���?
	AI_Output(self,other,"DIA_Ehnim_STREIT5_Attack_12_01");	//������ ����� � ������ ��� .
	AI_StopProcessInfos(self);
	DIA_EHNIM_STREIT5_NOPERM = TRUE;
	b_attack(self,egill,AR_NONE,1);
	b_giveplayerxp(XP_EGILLEHNIMSTREIT);
};

func void dia_ehnim_streit5_gehen()
{
	AI_Output(other,self,"DIA_Ehnim_STREIT5_gehen_15_00");	//�����, ��� ������. � � �����.
	AI_Output(self,other,"DIA_Ehnim_STREIT5_gehen_12_01");	//��, ����� ������.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PERMKAP1(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_permkap1_condition;
	information = dia_ehnim_permkap1_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ehnim_permkap1_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && Npc_IsInState(self,zs_talk) && ((KAPITEL < 3) || (hero.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_ehnim_permkap1_info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP1_12_00");	//���� ���� ����, ��� �� ��������? � �����, ���� ����� ����.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_MOLERATFETT(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_moleratfett_condition;
	information = dia_ehnim_moleratfett_info;
	important = TRUE;
};


func int dia_ehnim_moleratfett_condition()
{
	if((DIA_EHNIM_STREIT5_NOPERM == TRUE) && (KAPITEL >= 3) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_ehnim_moleratfett_info()
{
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_00");	//�� ��� ��� �����?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_01");	//�� ��. ��� ��� ���������?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_02");	//�� ���� ����. ������ �� ����. �����, �� �� ��� ������� �� ����� �������?
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_15_03");	//����� ����. � ���?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_12_04");	//��, ������ ������. � ������ ����� ���������� � ���� � ��� ���������.
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"� ���� ������ ��� ������� �� ���.",dia_ehnim_moleratfett_nein);
	Info_AddChoice(dia_ehnim_moleratfett,"���������? ����� ���������?",dia_ehnim_moleratfett_was);
	if(Npc_IsDead(vino))
	{
		Info_AddChoice(dia_ehnim_moleratfett,"���� �����.",dia_ehnim_moleratfett_tot);
	};
};

func void dia_ehnim_moleratfett_tot()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_tot_15_00");	//���� �����.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_tot_12_01");	//� ����. ����-�� �����.
};

func void dia_ehnim_moleratfett_was()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_15_00");	//���������? ����� ���������?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_01");	//��. ���, ��������, �� ������ �������� �� ����. ���� ������ ��� �������� ��������� � ����� ������ ���������� �������.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_02");	//�� �����, ��� ����� ��� � �����������. � ����, ���������� �� �����, ���� ������� ��������� ���������.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_03");	//��������� ���� �����, �� �������� ���� ���� ��� ���-������, ����� ������� �������� �������, ������������� ���.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_12_04");	//��������� ����� ��� �����, � ��� ���������. ������� ���������, � �� �� ����� ������� �������.
	if(FOUNDVINOSKELLEREI == FALSE)
	{
		Log_CreateTopic(TOPIC_FOUNDVINOSKELLEREI,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_FOUNDVINOSKELLEREI,LOG_RUNNING);
		b_logentry(TOPIC_FOUNDVINOSKELLEREI,"���� ��������� ���, ��� ���� �������� ��������� ������������ ����� � ���� ����� ����� �����. �� ��������, ����������� �����, ���������, � �������� ��� ����� ������ ������ ���������� ����� ����������.");
		Info_AddChoice(dia_ehnim_moleratfett,"�? �� ������ ������?",dia_ehnim_moleratfett_was_fett);
	};
};

func void dia_ehnim_moleratfett_was_fett()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_15_00");	//�? �� ������ ������?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_12_01");	//��, �������. ����� ������. ��� ����������. ����������� ����, ����� � ����. �� ���������� ���� ��� ������ ����������� �����.
	Info_AddChoice(dia_ehnim_moleratfett,"������ ��� ����� ����.",dia_ehnim_moleratfett_was_fett_habenwill);
};


var int ehnim_moleratfettoffer;

func void dia_ehnim_moleratfett_was_fett_habenwill()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00");	//������ ��� ����� ����.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01");	//��� ��������� ���� ��������, ��������. �� ����� ����� ����������� � ���� ����� ������.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02");	//�������?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03");	//���. 100 �������?
	EHNIM_MOLERATFETTOFFER = 100;
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"��� ������� �����.",dia_ehnim_moleratfett_was_fett_habenwill_zuviel);
	Info_AddChoice(dia_ehnim_moleratfett,"������������.",dia_ehnim_moleratfett_was_fett_habenwill_ja);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_ja()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00");	//������������.
	if(b_giveinvitems(other,self,itmi_gold,EHNIM_MOLERATFETTOFFER))
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01");	//������. ���, �����.
		if(Npc_HasItems(self,itmi_moleratlubric_mis))
		{
			b_giveinvitems(self,other,itmi_moleratlubric_mis,1);
			if(Npc_IsDead(vino) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02");	//(���� ��� ���) ��. ���� ����� ���� �� ���.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03");	//����, � ���� �� ��� ����������? ��� �� ������. ������. ������, � ���� �� �� ��������. ���, ������ ���� ������ ����� .
			b_giveinvitems(self,other,itmi_gold,EHNIM_MOLERATFETTOFFER);
			if(Npc_IsDead(egill) == FALSE)
			{
				AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04");	//����� ����������, ��� �������� ����� �����. ��� �������.
				AI_StopProcessInfos(self);
				b_attack(self,egill,AR_NONE,1);
			};
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05");	//���, ������-�� �� ���������. ������� �� ��������������� � ������, � ����� �����������, ��� � ���� ���� ��� �����! �����, � �� ���� ���� ������!
	};
	AI_StopProcessInfos(self);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_zuviel()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00");	//��� ������� �����.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01");	//������, ������. 70 �������. �� ��� ��� ��������� ����.
	EHNIM_MOLERATFETTOFFER = 70;
	Info_ClearChoices(dia_ehnim_moleratfett);
	Info_AddChoice(dia_ehnim_moleratfett,"��� ��� ����� ������� �����.",dia_ehnim_moleratfett_was_fett_habenwill_zuviel_immernoch);
	Info_AddChoice(dia_ehnim_moleratfett,"������������.",dia_ehnim_moleratfett_was_fett_habenwill_ja);
};

func void dia_ehnim_moleratfett_was_fett_habenwill_zuviel_immernoch()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_immernoch_15_00");	//��� ��� ����� ������� �����.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_immernoch_12_01");	//(�������) ����� ������ �� ����. ������.
	AI_StopProcessInfos(self);
};

func void dia_ehnim_moleratfett_nein()
{
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_nein_15_00");	//� ���� ������ ��� ������� �� ���.
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_nein_12_01");	//����� �� ���� ��������� ����, ������.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PERMKAP3(C_INFO)
{
	npc = bau_944_ehnim;
	condition = dia_ehnim_permkap3_condition;
	information = dia_ehnim_permkap3_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ehnim_permkap3_condition()
{
	if(Npc_KnowsInfo(other,dia_ehnim_moleratfett) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ehnim_permkap3_info()
{
	AI_Output(self,other,"DIA_Ehnim_PERMKAP3_12_00");	//� ���� ��� ������� �� ����.
	AI_StopProcessInfos(self);
};


instance DIA_EHNIM_PICKPOCKET(C_INFO)
{
	npc = bau_944_ehnim;
	nr = 900;
	condition = dia_ehnim_pickpocket_condition;
	information = dia_ehnim_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_ehnim_pickpocket_condition()
{
	return c_beklauen(76,35);
};

func void dia_ehnim_pickpocket_info()
{
	Info_ClearChoices(dia_ehnim_pickpocket);
	Info_AddChoice(dia_ehnim_pickpocket,DIALOG_BACK,dia_ehnim_pickpocket_back);
	Info_AddChoice(dia_ehnim_pickpocket,DIALOG_PICKPOCKET,dia_ehnim_pickpocket_doit);
};

func void dia_ehnim_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ehnim_pickpocket);
};

func void dia_ehnim_pickpocket_back()
{
	Info_ClearChoices(dia_ehnim_pickpocket);
};

