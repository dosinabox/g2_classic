
instance DIA_JAN_EXIT(C_INFO)
{
	npc = djg_714_jan;
	nr = 999;
	condition = dia_jan_exit_condition;
	information = dia_jan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jan_exit_condition()
{
	return TRUE;
};

func void dia_jan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JAN_HELLO(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_hello_condition;
	information = dia_jan_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jan_hello_condition()
{
	if((KAPITEL >= 4) && Npc_IsInState(self,zs_talk) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_hello_info()
{
	AI_Output(self,other,"DIA_Jan_Hello_10_00");	//� ����� ����� ������� ���� ����?!
	AI_Output(self,other,"DIA_Jan_Hello_10_01");	//� �����, ����� ��� ���� ������������� �������� ��������� ������. �� ����� ������ ��� ����� ���������� ������������ ��������� � ����� �����.
};


instance DIA_JAN_DRAGONS(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_dragons_condition;
	information = dia_jan_dragons_info;
	permanent = FALSE;
	description = "�� ����� � ��������!";
};


func int dia_jan_dragons_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (MIS_JANBECOMESSMITH == FALSE) && (KAPITEL == 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_dragons_info()
{
	AI_Output(other,self,"DIA_Jan_Dragons_15_00");	//�� ����� � ��������!
	AI_Output(self,other,"DIA_Jan_Dragons_10_01");	//(� ��������) ��� �� � ��� ������?! ������ ���? � ������, � �� ����.
	AI_Output(self,other,"DIA_Jan_Dragons_10_02");	//� ����� ������. � ��������� �� ���� ������.
	AI_Output(other,self,"DIA_Jan_Dragons_15_03");	//����� ������ �� �� ������ �� ���� �����������?
	AI_Output(self,other,"DIA_Jan_Dragons_10_04");	//�������� �� ���������� ���� � �������. ���� � ������� � ���, ���� ������ �� �������.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_Dragons_10_05");	//�� ���� ���� �� ���. �����, ��������� �� ���� ��������?
	};
	Info_ClearChoices(dia_jan_dragons);
	Info_AddChoice(dia_jan_dragons,"��� ����� ����.",dia_jan_dragons_shithappen);
	Info_AddChoice(dia_jan_dragons,"� ��� � ������ �� ��, ��� ������ ����?",dia_jan_dragons_reward);
	Info_AddChoice(dia_jan_dragons,"� �������� ������ ����.",dia_jan_dragons_helpyou);
};

func void dia_jan_dragons_helpyou()
{
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_00");	//� �������� ������ ����.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_01");	//��� ���� ��� �������? ��������� �������� ������ �� � ���� ��� �� ����������.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_02");	//����� �� ��������� �������� ���.
	AI_Output(other,self,"DIA_JAN_Dragons_HelpYou_15_03");	//� ������ ���, ��� �����.
	AI_Output(self,other,"DIA_JAN_Dragons_HelpYou_10_04");	//����������� ���� �� ����, ��� �� ��������� ����.
	Log_CreateTopic(TOPIC_JANBECOMESSMITH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JANBECOMESSMITH,LOG_RUNNING);
	b_logentry(TOPIC_JANBECOMESSMITH,"������� �� �������� ��, ����������� � ����� ������ ��������, ����� �������� � �������. �� ��������� ��������� ��� ���.");
	MIS_JANBECOMESSMITH = LOG_RUNNING;
	Info_ClearChoices(dia_jan_dragons);
};

func void dia_jan_dragons_reward()
{
	AI_Output(other,self,"DIA_JAN_Dragons_Reward_15_00");	//� ��� ��� �����, ���� � ������ ����?
	AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_01");	//� ���� ������ ���. �����������, � ���� ������� ���� ����-������.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_JAN_Dragons_Reward_10_02");	//� ���� ������, ��� ������� ������, ���������� �� ���������� ����, ��� �������.
	};
	JAN_TEACHPLAYER = TRUE;
};

func void dia_jan_dragons_shithappen()
{
	AI_Output(other,self,"DIA_JAN_Dragons_ShitHappen_15_00");	//��� ����� ����.
	AI_Output(self,other,"DIA_JAN_Dragons_ShitHappen_10_01");	//��� ������ ������. � �� ���� �������� ���� ����� � �� ���� �������� � �������.
	Info_ClearChoices(dia_jan_dragons);
};


instance DIA_JAN_HOME(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_home_condition;
	information = dia_jan_home_info;
	permanent = FALSE;
	description = "������ ��?";
};


func int dia_jan_home_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (KAPITEL >= 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_home_info()
{
	AI_Output(other,self,"DIA_Jan_Home_15_00");	//������ �� ������?
	AI_Output(self,other,"DIA_Jan_Home_10_01");	//� ������������� � ������ � ���. � �� ����������� � ��� ������, ����� �����������, ������� �� ��������.
	AI_Output(self,other,"DIA_Jan_Home_10_02");	//�� ������� ����� �������. ����� �������! �� ��������� �� ���� ��� �� ����� ��������������.
};


instance DIA_JAN_OLDCAMP(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_oldcamp_condition;
	information = dia_jan_oldcamp_info;
	permanent = TRUE;
	description = "��� ��������� � �����?";
};


func int dia_jan_oldcamp_condition()
{
	if(Npc_KnowsInfo(other,dia_jan_hello) && (KAPITEL == 4) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_oldcamp_info()
{
	AI_Output(other,self,"DIA_Jan_OldCamp_15_00");	//� ��� ��������� � �����?
	AI_Output(self,other,"DIA_Jan_OldCamp_10_01");	//������, ��������� � ������. ��, �������, ���� ����� �������, ��� ��������� ��� �����.
};


instance DIA_JAN_PARCIVAL(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_parcival_condition;
	information = dia_jan_parcival_info;
	permanent = FALSE;
	description = "� ��������� � ����������.";
};


func int dia_jan_parcival_condition()
{
	if((MIS_JANBECOMESSMITH != LOG_SUCCESS) && Npc_KnowsInfo(other,dia_parcival_jan) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_parcival_info()
{
	AI_Output(other,self,"DIA_Jan_Parcival_15_00");	//� ��������� � ����������.
	AI_Output(self,other,"DIA_Jan_Parcival_10_01");	//�?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_02");	//�� �� �������� ���, ��������� �� ��������.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_Parcival_15_03");	//�� �� �������� ���, ��������� �� ��������.
	};
	AI_Output(self,other,"DIA_Jan_Parcival_10_04");	//����. � ��� ���� ��������.
	AI_Output(self,other,"DIA_Jan_Parcival_10_05");	//��� �, ������, �������� ���������. ������ ������ ����� ������ ��� ������.
};


instance DIA_JAN_JANISSMITH(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_janissmith_condition;
	information = dia_jan_janissmith_info;
	permanent = FALSE;
	description = "������ �� �����, ��� ���� ���� ������.";
};


func int dia_jan_janissmith_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_janissmith_info()
{
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_00");	//������ �� �����, ��� ���� ���� ������.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_01");	//�� ������ ���? ��� ���� �������?
	AI_Output(other,self,"DIA_Jan_JanIsSmith_15_02");	//��� �������� ���������� �� ����, ��� ��� �� ��������� ����.
	AI_Output(self,other,"DIA_Jan_JanIsSmith_10_03");	//�� ��������. � ��� ���, ��� ����� ���� ��������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SMITH");
};


instance DIA_JAN_SELLWEAPONS(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_sellweapons_condition;
	information = dia_jan_sellweapons_info;
	permanent = FALSE;
	description = "�� �������� ������?";
};


func int dia_jan_sellweapons_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (JAN_TEACHPLAYER == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_sellweapons_info()
{
	AI_Output(other,self,"DIA_Jan_SellWeapons_15_00");	//�� �������� ������?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_01");	//�� �� ���. ����� ����� ���� �������� ������� ���� � ������� �� �������� ��-��� ����? ���, ������ �� ����!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellWeapons_10_02");	//��� ��, ���� �� ��� � ���� ����. �� ������� � ������ ���������� ������� ��������� � �����.
	};
	AI_Output(self,other,"DIA_Jan_SellWeapons_10_03");	//�� � ���� �������� ����, ��� ������ ������� ������.
	JAN_TEACHPLAYER = TRUE;
};


instance JAN_TRAINING_TALENTE(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = jan_training_talente_condition;
	information = jan_training_talente_info;
	permanent = TRUE;
	description = "����� ���� ���������� ����.";
};


func int jan_training_talente_condition()
{
	if((JAN_TEACHPLAYER == TRUE) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void jan_training_talente_info()
{
	AI_Output(other,self,"DIA_Jan_TeachPlayer_15_00");	//����� ���� ���������� ����.
	AI_Output(self,other,"DIA_Jan_TeachPlayer_10_01");	//��� ������ �� ������ ��������� ������?
	Info_ClearChoices(jan_training_talente);
	Info_AddChoice(jan_training_talente,DIALOG_BACK,jan_training_smith_back);
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		Info_AddChoice(jan_training_talente,b_buildlearnstring("��������� ���������� ����",b_getlearncosttalent(other,NPC_TALENT_SMITH)),jan_training_smith_common);
	};
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == TRUE)
	{
		if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH)),jan_training_smith_1hspecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH)),jan_training_smith_2hspecial1);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH)),jan_training_smith_1hspecial2);
		};
		if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == FALSE) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
		{
			Info_AddChoice(jan_training_talente,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH)),jan_training_smith_2hspecial2);
		};
	};
};

func void jan_training_smith_back()
{
	Info_ClearChoices(jan_training_talente);
};

func void jan_training_smith_common()
{
	b_teachplayertalentsmith(self,other,WEAPON_COMMON);
};

func void jan_training_smith_1hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_01);
};

func void jan_training_smith_2hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_01);
};

func void jan_training_smith_1hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_02);
};

func void jan_training_smith_2hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_02);
};


var int dia_jan_sellarmor_permanent;

instance DIA_JAN_SELLARMOR(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_sellarmor_condition;
	information = dia_jan_sellarmor_info;
	permanent = TRUE;
	description = "���� � ������ � ���� �������?";
};


func int dia_jan_sellarmor_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE) && (DIA_JAN_SELLARMOR_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_sellarmor_info()
{
	AI_Output(other,self,"DIA_Jan_SellArmor_15_00");	//���� � ������ � ���� �������?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_01");	//��� ������� �� ���� �� � ����� ��������� � ����, ��� � ���� ������ ����. ������ �� ����.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_02");	//���, ������� ��������� � ��������? ������ �� ���� - ���� ����� ���������� � ��������. � �� ���� ������� ������� ��� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_SellArmor_10_03");	//���� �� ��� � ���� ����, � �� ������ �� ����. ��, � ���������, � ���� �� ���.
		Info_ClearChoices(dia_jan_sellarmor);
		Info_AddChoice(dia_jan_sellarmor,"�����, ������ �� ���������.",dia_jan_sellarmor_sorry);
		Info_AddChoice(dia_jan_sellarmor,"�� ������ ���������� ���-������ ��� ����?",dia_jan_sellarmor_buildone);
	};
};

func void dia_jan_sellarmor_sorry()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_Sorry_15_00");	//�����, ������ �� ���������.
	AI_Output(self,other,"DIA_JAN_SellArmor_Sorry_10_01");	//��, ���� ��� �� ���-������ ����������, ��� ��� �����.
	Info_ClearChoices(dia_jan_sellarmor);
};

func void dia_jan_sellarmor_buildone()
{
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_00");	//�� ������ ���������� ���-������ ��� ����?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_01");	//��, ���� �� ������ ���-������ �������, �� ������ �������� ��� ����������� ���������.
	AI_Output(other,self,"DIA_JAN_SellArmor_BuildOne_15_02");	//� ��� �����?
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_03");	//�� ������ ��������� � ���������, ��? ������� ��� �������� ������� - �� ��� � ����� ������� ���-������ ��� ����.
	AI_Output(self,other,"DIA_JAN_SellArmor_BuildOne_10_04");	//20 ������ ������ ���� ����������.
	DIA_JAN_SELLARMOR_PERMANENT = TRUE;
	Info_ClearChoices(dia_jan_sellarmor);
};


var int jan_sells_armor;

instance DIA_JAN_DRAGONSCALES(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_dragonscales_condition;
	information = dia_jan_dragonscales_info;
	permanent = TRUE;
	description = "� ������ �������� �������.";
};


func int dia_jan_dragonscales_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_jan_janissmith) && (MIS_OCGATEOPEN == FALSE) && (DIA_JAN_SELLARMOR_PERMANENT == TRUE) && (JAN_SELLS_ARMOR == FALSE) && (Npc_HasItems(other,itat_dragonscale) >= 1))
	{
		return TRUE;
	};
};

func void dia_jan_dragonscales_info()
{
	AI_Output(other,self,"DIA_JAN_Dragonscales_15_00");	//� ������ �������� �������.
	if(Npc_HasItems(other,itat_dragonscale) >= 20)
	{
		b_giveinvitems(other,self,itat_dragonscale,20);
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_01");	//������. �����, �� ����� ���-������ ���������.
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_02");	//������ ������ � �������� ���� ����� �������.
		JAN_SELLS_ARMOR = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_Dragonscales_10_03");	//��� ����� 20 ��������� ������, ����� � �� ����� ������� ���� �������.
	};
};


var int djg_armor_is_offered;
var int dia_jan_armorready_noperm;

instance DIA_JAN_ARMORREADY(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_armorready_condition;
	information = dia_jan_armorready_info;
	permanent = TRUE;
	description = "������� ������?";
};


func int dia_jan_armorready_condition()
{
	if((MIS_OCGATEOPEN == FALSE) && (JAN_SELLS_ARMOR != FALSE) && (DIA_JAN_ARMORREADY_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_jan_armorready_info()
{
	AI_Output(other,self,"DIA_JAN_ArmorReady_15_00");	//������� ������?
	if(JAN_SELLS_ARMOR == Wld_GetDay())
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_01");	//���� ��� ���. ������ ������.
	}
	else
	{
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_02");	//��. ��� ��������� ������������ ���������. �� ������ ������ ��, ���� ������.
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_03");	//��� ���� ������ ����. 12,000 ������� �����.
		AI_Output(other,self,"DIA_JAN_ArmorReady_15_04");	//���!? � ��� ����� �����, ��� � ������ ��� ����
		AI_Output(self,other,"DIA_JAN_ArmorReady_10_05");	//�� �� ���� ���. ��� �� ���� ����� ������������ �� �����. �� ������, �� ����.
		DJG_ARMOR_IS_OFFERED = TRUE;
		DIA_JAN_ARMORREADY_NOPERM = TRUE;
	};
};


var int jan_dia_jan_djg_armor_m_permanent;

instance DIA_JAN_DJG_ARMOR_M(C_INFO)
{
	npc = djg_714_jan;
	nr = 4;
	condition = dia_jan_djg_armor_m_condition;
	information = dia_jan_djg_armor_m_info;
	permanent = TRUE;
	description = "������� ������� �������� �� ��������: ������: ������ 80, ������ 80. (12000 ������)";
};


func int dia_jan_djg_armor_m_condition()
{
	if((JAN_DIA_JAN_DJG_ARMOR_M_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && (DJG_ARMOR_IS_OFFERED == TRUE))
	{
		return TRUE;
	};
};

func void dia_jan_djg_armor_m_info()
{
	AI_Output(other,self,"DIA_Jan_DJG_ARMOR_M_15_00");	//� ���� ������ ��� �������.
	if(Npc_HasItems(other,itmi_gold) >= 12000)
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_01");	//�� �������, ��� ����� ����� �����.
		b_giveinvitems(other,self,itmi_gold,12000);
		CreateInvItems(self,itar_djg_m,1);
		b_giveinvitems(self,other,itar_djg_m,1);
		JAN_DIA_JAN_DJG_ARMOR_M_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DJG_ARMOR_M_10_02");	//� ���� ������������ ������.
	};
};


instance DIA_JAN_DRAGONPLETTBERICHT(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_dragonplettbericht_condition;
	information = dia_jan_dragonplettbericht_info;
	description = "������ ��������...";
};


var int dia_jan_dragonplettbericht_noperm;

func int dia_jan_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_jan_dragons) && (DIA_JAN_DRAGONPLETTBERICHT_NOPERM == FALSE) && (MIS_OCGATEOPEN == FALSE) && (MIS_KILLEDDRAGONS != 0))
	{
		return TRUE;
	};
};

func void dia_jan_dragonplettbericht_info()
{
	if(MIS_KILLEDDRAGONS == 1)
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_00");	//� ���� �������.
	}
	else if((MIS_KILLEDDRAGONS == 2) || (MIS_KILLEDDRAGONS == 3))
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_01");	//� ���� ��������� ��������.
	}
	else
	{
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_02");	//� ���� ���� ��������.
	};
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_03");	//� ���? �� ���� ������� �� ��������, ����� ���?
		AI_Output(other,self,"DIA_Jan_DragonPlettBericht_15_04");	//� �� ����� ���?
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_05");	//��, �������, �� ���� ������, �� ��� ��� �� ���������.
	};
	AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_06");	//� ��� ������� ����, ��� ������ �������� ������ ������, ��� ������� ��������.
	if((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD))
	{
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_07");	//�������, ���� ���-���, ��� ����� �������������� ����.
		AI_Output(self,other,"DIA_Jan_DragonPlettBericht_10_08");	//���� �� �� ������ ��� ��������� �����, � �� ������ �������� �� ���.
		JAN_WANTSDRAGONBLOOD = TRUE;
	};
};


instance DIA_JAN_DRAGONBLOOD(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_dragonblood_condition;
	information = dia_jan_dragonblood_info;
	permanent = TRUE;
	description = "� ������ ���� �������� �����.";
};


func int dia_jan_dragonblood_condition()
{
	if((JAN_WANTSDRAGONBLOOD == TRUE) && (MIS_OCGATEOPEN == FALSE) && Npc_HasItems(other,itat_dragonblood) && ((hero.guild != GIL_DJG) && (hero.guild != GIL_SLD)))
	{
		return TRUE;
	};
};

func void dia_jan_dragonblood_info()
{
	AI_Output(other,self,"DIA_Jan_DragonBlood_15_00");	//� ������ ���� �������� �����.
	AI_Output(self,other,"DIA_Jan_DragonBlood_10_01");	//�������. ������� ��� ��� �����, ��� �������.
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(���)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(���� ��������)",dia_jan_dragonblood_1);
	};
};

func void dia_jan_dragonblood_back()
{
	Info_ClearChoices(dia_jan_dragonblood);
};

func void dia_jan_dragonblood_1()
{
	var int dragonbloodcount;
	var int dragonbloodgeld;
	var int xp_djg_bringdragonbloods;
	var string bloodtext;
	var string bloodleft;
	dragonbloodcount = 1;
	b_giveinvitems(other,self,itat_dragonblood,dragonbloodcount);
	xp_djg_bringdragonbloods = dragonbloodcount * XP_AMBIENTKAP4;
	b_giveplayerxp(xp_djg_bringdragonbloods);
	dragonbloodgeld = dragonbloodcount * VALUE_DRAGONBLOOD;
	CreateInvItems(self,itmi_gold,dragonbloodgeld);
	b_giveinvitems(self,other,itmi_gold,dragonbloodgeld);
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(���)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(���� ��������)",dia_jan_dragonblood_1);
	};
	bloodleft = IntToString(Npc_HasItems(other,itat_dragonblood));
	bloodtext = ConcatStrings(bloodleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(bloodtext,-1,-1,FONT_SCREENSMALL,3);
};

func void dia_jan_dragonblood_all()
{
	var int dragonbloodcount;
	var int dragonbloodgeld;
	var int xp_djg_bringdragonbloods;
	var string bloodtext;
	var string bloodleft;
	dragonbloodcount = Npc_HasItems(other,itat_dragonblood);
	b_giveinvitems(other,self,itat_dragonblood,dragonbloodcount);
	xp_djg_bringdragonbloods = dragonbloodcount * XP_AMBIENTKAP4;
	b_giveplayerxp(xp_djg_bringdragonbloods);
	dragonbloodgeld = dragonbloodcount * VALUE_DRAGONBLOOD;
	CreateInvItems(self,itmi_gold,dragonbloodgeld);
	b_giveinvitems(self,other,itmi_gold,dragonbloodgeld);
	Info_ClearChoices(dia_jan_dragonblood);
	Info_AddChoice(dia_jan_dragonblood,DIALOG_BACK,dia_jan_dragonblood_back);
	if(Npc_HasItems(other,itat_dragonblood) >= 1)
	{
		Info_AddChoice(dia_jan_dragonblood,"(���)",dia_jan_dragonblood_all);
		Info_AddChoice(dia_jan_dragonblood,"(���� ��������)",dia_jan_dragonblood_1);
	};
	bloodleft = IntToString(Npc_HasItems(other,itat_dragonblood));
	bloodtext = ConcatStrings(bloodleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(bloodtext,-1,-1,FONT_SCREENSMALL,3);
};


instance DIA_JAN_NACHOCGATEOPEN(C_INFO)
{
	npc = djg_714_jan;
	nr = 3;
	condition = dia_jan_nachocgateopen_condition;
	information = dia_jan_nachocgateopen_info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int dia_jan_nachocgateopen_condition()
{
	if(MIS_OCGATEOPEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_jan_nachocgateopen_info()
{
	AI_Output(other,self,"DIA_Jan_NACHOCGATEOPEN_15_00");	//��� � �������?
	AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_01");	//��������� ������ �� ����!
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_02");	//����� ��� ������ ������� ������? ��, ��������, �� �� ��� �� ��������!
	}
	else
	{
		AI_Output(self,other,"DIA_Jan_NACHOCGATEOPEN_10_03");	//��� ��� ��� ��� ������ ����� � ������� ������. ������! ��� ����� �� ������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_JAN_PICKPOCKET(C_INFO)
{
	npc = djg_714_jan;
	nr = 900;
	condition = dia_jan_pickpocket_condition;
	information = dia_jan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_jan_pickpocket_condition()
{
	return c_beklauen(37,95);
};

func void dia_jan_pickpocket_info()
{
	Info_ClearChoices(dia_jan_pickpocket);
	Info_AddChoice(dia_jan_pickpocket,DIALOG_BACK,dia_jan_pickpocket_back);
	Info_AddChoice(dia_jan_pickpocket,DIALOG_PICKPOCKET,dia_jan_pickpocket_doit);
};

func void dia_jan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jan_pickpocket);
};

func void dia_jan_pickpocket_back()
{
	Info_ClearChoices(dia_jan_pickpocket);
};

