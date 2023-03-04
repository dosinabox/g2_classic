
instance DIA_VATRAS_DI_EXIT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 999;
	condition = dia_vatras_di_exit_condition;
	information = dia_vatras_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vatras_di_exit_condition()
{
	return TRUE;
};

func void dia_vatras_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VATRAS_DI_HEAL(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_heal_condition;
	information = dia_vatras_di_heal_info;
	permanent = TRUE;
	description = "������ ����.";
};


func int dia_vatras_di_heal_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_di_heal_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_HEAL_15_00");	//������ ����.
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_01");	//(������������) ������, ���������� ��� ����. ��� ������������� ������������ ������ ����.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_HEAL_05_02");	//���� ���� ������ �� ��������� � �������.
	};
};


instance DIA_VATRAS_DI_TRADE(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 12;
	condition = dia_vatras_di_trade_condition;
	information = dia_vatras_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "�� ������ ������� ��� ���-������?";
};


func int dia_vatras_di_trade_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_di_trade_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_TRADE_15_00");	//�� ������ ������� ��� ���-������?
	b_givetradeinv(self);
	AI_Output(self,other,"DIA_Vatras_DI_TRADE_05_01");	//� ��� �� ����������?
};


instance DIA_VATRAS_DI_OBSESSION(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 35;
	condition = dia_vatras_di_obsession_condition;
	information = dia_vatras_di_obsession_info;
	permanent = TRUE;
	description = "������ ���. � �������!";
};


func int dia_vatras_di_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};


var int dia_vatras_di_obsession_info_onetime;

func void dia_vatras_di_obsession_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_OBSESSION_15_00");	//������ ���. � �������!
	if(GOT_HEALOBSESSION_DAY <= (Wld_GetDay() - 2))
	{
		if(dia_vatras_di_obsession_info_onetime <= 1)
		{
			CreateInvItems(self,itpo_healobsession_mis,1);
			dia_vatras_di_obsession_info_onetime = dia_vatras_di_obsession_info_onetime + 1;
		};
		if(Npc_HasItems(self,itpo_healobsession_mis))
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_01");	//������ ��� ����� ������������. ������� ��� ��� ��������� ���� �������� ��������� �� ���� �������.
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_02");	//������ �����: ��� ����������� �� ���������� ���� �� ������ �������� ����������.
			b_giveinvitems(self,other,itpo_healobsession_mis,1);
			GOT_HEALOBSESSION_DAY = Wld_GetDay();
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_03");	//������ �������� ��������. ��� ����� ����, ���� ���. � ������ ����� �� ���� ������ ����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_OBSESSION_05_04");	//� �� ������ �� ���� ���� ���� ���� ��� ���� ������� � ����� �������� �����. ����������� �����, ���� ���.
	};
};


instance DIA_VATRAS_DI_RAT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_rat_condition;
	information = dia_vatras_di_rat_info;
	description = "����� ����� �� ������ ���� ���?";
};


func int dia_vatras_di_rat_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && (SC_ISOBSESSED == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_di_rat_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_RAT_15_00");	//����� ����� �� ������ ���� ���?
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_01");	//������� �������� �� ������. �����, ��� �� ������ ������ ����� ������� ���� ��������� ���� �����, ����� �� ���������.
	if(Npc_HasItems(other,itam_prot_blackeye_mis))
	{
		AI_Output(other,self,"DIA_Vatras_DI_RAT_15_02");	//�� ��������, � ���� ���� ������ ������ ���.
	};
	AI_Output(self,other,"DIA_Vatras_DI_RAT_05_03");	//���� ��� �� ���-�� ���������� � �����, ������� �� ���. � ��������, ��� ����� �������.
};


instance DIA_VATRAS_DI_PEDROTOT(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 3;
	condition = dia_vatras_di_pedrotot_condition;
	information = dia_vatras_di_pedrotot_info;
	description = "� ����� ��������� �����.";
};


func int dia_vatras_di_pedrotot_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_di_you))
	{
		return TRUE;
	};
};


var int dia_vatras_di_pedrotot_vatrassucked;

func void dia_vatras_di_pedrotot_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_00");	//� ����� ��������� �����.
	b_giveplayerxp(XP_AMBIENT);
	if((MIS_GORAX_KILLPEDRO == LOG_SUCCESS) && Npc_IsDead(pedro_di))
	{
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_01");	//�� �����.
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_02");	//� ������ �����������. � �� ������ ����� �� ����.
		AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_03");	//��� �� ������ � ����?
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_04");	//� ���� � ����� �������������� ���������� � �����������. � ������� �������� ���, ��� ��� �������� � ����.
		DIA_VATRAS_DI_PEDROTOT_VATRASSUCKED = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_05");	//����� ������� ��� ����, �� �������. �� ��������� ��� ������� ��������.
		if(Npc_IsDead(pedro_di))
		{
			AI_Output(other,self,"DIA_Vatras_DI_PEDROTOT_15_06");	//��� ����� ������� ������. �� �����.
			AI_Output(self,other,"DIA_Vatras_DI_PEDROTOT_05_07");	//(���������) ��. ����� �������. � ���� �������� �� ��� ������ ����.
		}
		else
		{
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_VATRAS_DI_VATRASSUCKED(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 1;
	condition = dia_vatras_di_vatrassucked_condition;
	information = dia_vatras_di_vatrassucked_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_vatras_di_vatrassucked_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_VATRAS_DI_PEDROTOT_VATRASSUCKED == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_di_vatrassucked_info()
{
	AI_Output(self,other,"DIA_Vatras_DI_VatrasSucked_05_00");	//�������� � ���� ����, ������. �� ������ ������ �� ������������ �� ��� ������.
	AI_StopProcessInfos(self);
};


instance DIA_VATRAS_DI_TALENTE(C_INFO)
{
	npc = vlk_439_vatras_di;
	condition = dia_vatras_di_talente_condition;
	information = dia_vatras_di_talente_info;
	permanent = TRUE;
	description = "����� ���� ����, ��� ������ ���.";
};


func int dia_vatras_di_talente_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_vatras_di_talente_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_Talente_15_00");	//����� ���� �����.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_05_01");	//� ������ ���, ��� � ���� �����.
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_vatras_di_talente,"����� �����",dia_vatras_di_talente_circles);
	};
	Info_AddChoice(dia_vatras_di_talente,"������� - ��������� ������������� �����",dia_vatras_di_talente_alchimie);
};

func void dia_vatras_di_talente_circles()
{
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 1)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("1-� ���� �����",b_getlearncosttalent(other,NPC_TALENT_MAGE)),dia_vatras_di_talente_circle_1);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 1)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("2-� ���� �����",b_getlearncosttalent(other,NPC_TALENT_MAGE)),dia_vatras_di_talente_circle_2);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 2)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("3-� ���� �����",b_getlearncosttalent(other,NPC_TALENT_MAGE)),dia_vatras_di_talente_circle_3);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 3)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("4-� ���� �����",b_getlearncosttalent(other,NPC_TALENT_MAGE)),dia_vatras_di_talente_circle_4);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("5-� ���� �����",b_getlearncosttalent(other,NPC_TALENT_MAGE)),dia_vatras_di_talente_circle_5);
	};
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("6-� ���� �����",b_getlearncosttalent(other,NPC_TALENT_MAGE)),dia_vatras_di_talente_circle_6);
	};
};

func void dia_vatras_di_talente_alchimie()
{
	Info_ClearChoices(dia_vatras_di_talente);
	Info_AddChoice(dia_vatras_di_talente,DIALOG_BACK,dia_vatras_di_talente_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("�������� ��������",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_vatras_di_talente_potion_health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("�������� ��������",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_vatras_di_talente_potion_health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("�������� �������",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_vatras_di_talente_potion_health_03);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == FALSE)
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("�������� ����",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_vatras_di_talente_potion_mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("�������� ����",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_vatras_di_talente_potion_mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_02] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("������� ����",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_vatras_di_talente_potion_mana_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_SPEED] == FALSE) && ((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_01] == TRUE)))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("����� ���������",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_vatras_di_talente_potion_speed);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] == FALSE) && ((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE)))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("������� ����",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_vatras_di_talente_potion_perm_str);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] == FALSE) && ((PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE) || (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE)))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("������� ��������",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_vatras_di_talente_potion_perm_dex);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_MANA_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("������� ����",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_vatras_di_talente_potion_perm_mana);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] == TRUE))
	{
		Info_AddChoice(dia_vatras_di_talente,b_buildlearnstring("������� �����",b_getlearncosttalent(other,NPC_TALENT_ALCHEMY)),dia_vatras_di_talente_potion_perm_health);
	};
};

func void dia_vatras_di_talente_circle_1()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,1);
};

func void dia_vatras_di_talente_circle_2()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,2);
};

func void dia_vatras_di_talente_circle_3()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,3);
};

func void dia_vatras_di_talente_circle_4()
{
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,4);
};

func void dia_vatras_di_talente_circle_5()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_5_05_00");	//������ �� ��� ������ �����. ��������� ����������, ��������� �����, �� �����.
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,5);
};

func void dia_vatras_di_talente_circle_6()
{
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_00");	//�� ������ ����� ������� ������ � �����.
	AI_Output(self,other,"DIA_Vatras_DI_Talente_Circle_6_05_01");	//����� ���� ���� ���������� �����, � ���� ������������ �������� ����� ��� �������� ���������. ��� �� ������ ������� ���� ����.
	Info_ClearChoices(dia_vatras_di_talente);
	b_teachmagiccircle(self,other,6);
};

func void dia_vatras_di_talente_potion_health_01()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_01);
};

func void dia_vatras_di_talente_potion_health_02()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_02);
};

func void dia_vatras_di_talente_potion_health_03()
{
	b_teachplayertalentalchemy(self,other,POTION_HEALTH_03);
};

func void dia_vatras_di_talente_potion_mana_01()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_01);
};

func void dia_vatras_di_talente_potion_mana_02()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_02);
};

func void dia_vatras_di_talente_potion_mana_03()
{
	b_teachplayertalentalchemy(self,other,POTION_MANA_03);
};

func void dia_vatras_di_talente_potion_speed()
{
	b_teachplayertalentalchemy(self,other,POTION_SPEED);
};

func void dia_vatras_di_talente_potion_perm_str()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_STR);
};

func void dia_vatras_di_talente_potion_perm_dex()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_DEX);
};

func void dia_vatras_di_talente_potion_perm_mana()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_MANA);
};

func void dia_vatras_di_talente_potion_perm_health()
{
	b_teachplayertalentalchemy(self,other,POTION_PERM_HEALTH);
};

func void dia_vatras_di_talente_back()
{
	Info_ClearChoices(dia_vatras_di_talente);
};


instance DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_dementorobsessionbook_condition;
	information = dia_vatras_di_dementorobsessionbook_info;
	permanent = TRUE;
	description = "� ������ �������� ���������.";
};


func int dia_vatras_di_dementorobsessionbook_condition()
{
	if(Npc_HasItems(other,itwr_dementorobsessionbook_mis))
	{
		return TRUE;
	};
};


var int dia_vatras_di_dementorobsessionbook_onetime;

func void dia_vatras_di_dementorobsessionbook_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_DementorObsessionBook_15_00");	//� ������ �������� ���������
	if(DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_01");	//��. � �����, ����� ����� �����, ���� � ������ ��� � ��������� � ��������. ����, �������, ��� ������� ��������� ������.
		DIA_VATRAS_DI_DEMENTOROBSESSIONBOOK_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_DI_DementorObsessionBook_05_02");	//� ���� ���� ���? ������� ��� ���, ��� �������.
	};
	b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_VATRAS_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = vlk_439_vatras_di;
	nr = 99;
	condition = dia_vatras_di_undeaddragondead_condition;
	information = dia_vatras_di_undeaddragondead_info;
	permanent = TRUE;
	description = "� ������ ���.";
};


func int dia_vatras_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_vatras_di_undeaddragondead_onetime;

func void dia_vatras_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_00");	//� ������ ���.
	if(DIA_VATRAS_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_01");	//� ����, � �������� ���.
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_02");	//�� ����� ���� �������, �� �������� �� ����� �� ���������.
		if(hero.guild == GIL_DJG)
		{
			AI_Output(other,self,"DIA_Vatras_DI_UndeadDragonDead_15_03");	//���� � ������ �����������, ��� � ���, � �����, ���� ��� ���� ������ � �����, �������� ����� ������� �� ����� ����?
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_04");	//�����, ��� ��� ��� ����� ���� ������ � ������ ����� ����� �� ����.
		};
		AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_05");	//��� ������ ������� ������ ���������� � ���� ���. ��� ����� ������� �� ��������.
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_06");	//��� ���� ����� �� ������ �������� ���.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_15");	//������ ���� ������ ����� ����� �������� ������ � ������ ������� ������!
		AI_Output(other,self,"DIA_Vatras_Add_15_16");	//����� �� �� ����� ���.
		AI_Output(self,other,"DIA_Vatras_Add_05_17");	//(������) �� ��� � ������ - ���� ������.
		DIA_VATRAS_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
	};
	AI_Output(self,other,"DIA_Vatras_DI_UndeadDragonDead_05_09");	//����� ��������, ����� �� �������� ����� ��� ����� �������. ��������������� ��� ����� ���� �������.
};

