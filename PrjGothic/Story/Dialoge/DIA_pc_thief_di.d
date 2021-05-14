
instance DIA_PC_THIEF_DI_EXIT(C_INFO)
{
	npc = pc_thief_di;
	nr = 999;
	condition = dia_pc_thief_di_exit_condition;
	information = dia_pc_thief_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pc_thief_di_exit_condition()
{
	return TRUE;
};

func void dia_pc_thief_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PC_THIEF_DI_HALLO(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_hallo_condition;
	information = dia_pc_thief_di_hallo_info;
	description = "�� �������.";
};


func int dia_pc_thief_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_pc_thief_di_hallo_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Hallo_15_00");	//�� �������.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_01");	//���� ������, ������, ��������� ������ �������� �� ��������.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_02");	//� �� ���� �� ����. �� ������ ������ ���� ����� ��� ���� ����������.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_03");	//� ��� ����� ������� ���� ������ - ��� ����� ��� ������ ��������� ���������� �������� � ������������.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_04");	//���� ����� ��������, ��� ���� ��� ��� ����� �������.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_05");	//�� ���� ������ �������, ��, ��������, ���������� �� �������-������.
	AI_Output(self,other,"DIA_PC_Thief_DI_Hallo_11_06");	//���� ���� ���������, ��� �� �� ������, ��� ������ ������, ������� �� ���. ��������, ��� ���� ������ ������ ����.
};


instance DIA_PC_THIEF_DI_RAT(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_rat_condition;
	information = dia_pc_thief_di_rat_info;
	permanent = TRUE;
	description = "��� ����� ���� �����.";
};


func int dia_pc_thief_di_rat_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_pc_thief_di_hallo))
	{
		return TRUE;
	};
};


var int dia_pc_thief_di_rat_onetime;
var int dia_pc_thief_di_rat_onetime2;

func void dia_pc_thief_di_rat_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_00");	//��� ����� ���� �����.
	if(Npc_IsDead(orkelite_antipaladinorkoberst_di) && (EVT_ORKOBERST_SWITCH_FOUND == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_01");	//� ���������� ����� ����� ���� ����-��������. � �� ���� ������������ ������ ������� ������ ���� �����.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_02");	//���� ������ ��������. �������� �� �������������. � �������, � ��� ��� ���-�� ����� ���������� �������. ������� ����� �� ������� ������� ������������.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_03");	//�����, ������� - ��� ����������� ������ ����� �������� � ������������ �������, ����� �������� ��������.
	}
	else if(Npc_IsDead(firedragonisland) && (EVT_DIBRIDGE_OPENED == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_04");	//� �������� � �������� � ������ ������� ����� ��������� � ��������� ������. ���� ���� ������, � � �� ����, ��� �������� ���.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_05");	//���. � �� �� �������� ������������ ������? ����� ����, �������� ����� ������������ ��� ������ ��������.
	}
	else if(Npc_IsDead(skeleton_lord_archol) && (Npc_KnowsInfo(other,dia_schwarzmagier_hello) == FALSE))
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_RAT_15_06");	//� �������� �� ����� ���� ������� ������ � �� ���������� �������.
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_07");	//������, �� � ������� �� ���� ���� � �������. ����� ���� �������� ���������� ���-�� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_08");	//������� �� ���, ���� � ���� ��������� ��������, ������� ��� ���� ����� ������ ���������.
		if((ORKSTURMDI == TRUE) && (DIA_PC_THIEF_DI_RAT_ONETIME2 == FALSE))
		{
			AI_Output(self,other,"DIA_PC_Thief_DI_RAT_11_09");	//��� ����. � �� ���������, ����� �� �� �������� ���� ���� ������, ��� ������ �����, � �������. � �������, ���� ���� ����� ��� ��������� ������, ������� ��� �������� �������� �����!
			b_giveplayerxp(XP_AMBIENT);
			DIA_PC_THIEF_DI_RAT_ONETIME2 = TRUE;
		};
	};
};


instance DIA_DIEGO_DI_TRADE(C_INFO)
{
	npc = pc_thief_di;
	nr = 12;
	condition = dia_diego_di_trade_condition;
	information = dia_diego_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "��� ����� ��������.";
};


func int dia_diego_di_trade_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_diego_di_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Diego_DI_TRADE_15_00");	//��� ����� ��������.
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(self,other,"DIA_Diego_DI_TRADE_11_01");	//��������, � ����� ������ ����.
};


instance DIA_PC_THIEF_DI_TRAINING_TALENTE(C_INFO)
{
	npc = pc_thief_di;
	nr = 10;
	condition = dia_pc_thief_di_training_talente_condition;
	information = dia_pc_thief_di_training_talente_info;
	permanent = TRUE;
	description = "����� ����.";
};


func int dia_pc_thief_di_training_talente_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_pc_thief_di_hallo))
	{
		return TRUE;
	};
};

func void dia_pc_thief_di_training_talente_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_Training_15_00");	//����� ����.
	AI_Output(self,other,"DIA_PC_Thief_DI_Training_11_01");	//��� ���� �����?
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"������������� �������",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_dex_1()
{
	if(b_teachattributepoints(self,other,ATR_DEXTERITY,1,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_1_11_00");	//���� ����� ����������� �����, ���� �� ������ ��������� �������� �� ����� ����.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"������������� �������",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_dex_5()
{
	if(b_teachattributepoints(self,other,ATR_DEXTERITY,5,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_DEX_5_11_00");	//����� �� ����������, ������ ����� � ���, ��� ����� ������������� ����. ��������� ������ ���� �����.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"������������� �������",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_combat_bow_1()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,1,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_1_11_00");	//��� ���������� ������� ���������� �������� ����������.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"������������� �������",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_combat_bow_5()
{
	if(b_teachfighttalentpercent(self,other,NPC_TALENT_BOW,5,100))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_Combat_BOW_5_11_00");	//����� ���� ���� �� �������, �� ����� ������������ �������� ������ ������.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"������������� �������",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_talente_picklock()
{
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_Training_PICKLOCK_11_00");	//����� ������, ��� �������. ������� ��� �� �� ������ ��� ����������� ������.
	};
	Info_ClearChoices(dia_pc_thief_di_training_talente);
	Info_AddChoice(dia_pc_thief_di_training_talente,DIALOG_BACK,dia_pc_thief_di_training_talente_back);
	if(Npc_GetTalentSkill(hero,NPC_TALENT_PICKLOCK) == FALSE)
	{
		Info_AddChoice(dia_pc_thief_di_training_talente,"������������� �������",dia_pc_thief_di_training_talente_picklock);
	};
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_pc_thief_di_training_dex_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_pc_thief_di_training_dex_5);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW1,b_getlearncosttalent(other,NPC_TALENT_BOW)),dia_pc_thief_di_training_combat_bow_1);
	Info_AddChoice(dia_pc_thief_di_training_talente,b_buildlearnstring(PRINT_LEARNBOW5,b_getlearncosttalent(other,NPC_TALENT_BOW) * 5),dia_pc_thief_di_training_combat_bow_5);
};

func void dia_pc_thief_di_training_talente_back()
{
	Info_ClearChoices(dia_pc_thief_di_training_talente);
};


instance DIA_PC_THIEF_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_thief_di;
	nr = 5;
	condition = dia_pc_thief_di_undeaddragondead_condition;
	information = dia_pc_thief_di_undeaddragondead_info;
	permanent = TRUE;
	description = "��� �������. ������ �� ����� ��������� ������.";
};


func int dia_pc_thief_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_pc_thief_di_undeaddragondead_onetime;

func void dia_pc_thief_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_00");	//��� �������. ������ �� ����� ��������� ������.
	if(Npc_GetDistToWP(self,"WP_UNDEAD_MIDDLE_01") < 4000)
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_01");	//�� ������ �������� �� ���. � ����� �� ����� ������ ����������.
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_02");	//��� ����, ���� ������, ������� ������ ���?
		AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_03");	//��� ������ �������, � �����.
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_04");	//(�������) ��, ���� �� ��� �������...
	}
	else
	{
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_05");	//�������.
	};
	if(DIA_PC_THIEF_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(other,self,"DIA_PC_Thief_DI_UndeadDragonDead_15_06");	//��� �� ����������� ������ ������?
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_07");	//������� ������. � �����, ������� ����� ��������� � �������.
		if((DIEBESGILDE_VERRATEN == TRUE) || (MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_DiegoDI_Add_11_00");	//��� ������ ��� ������� �����. ��� ��������� ����� ���������� �����������.
		};
		AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_09");	//���. ��, ���, ����� ����, � ������ �������� ������ �������. ��� ����� �������� ������. ������� ������.
	};
	AI_Output(self,other,"DIA_PC_Thief_DI_UndeadDragonDead_11_10");	//��� � ��������. ����� �� ��������� �����.
	AI_StopProcessInfos(self);
	if(DIA_PC_THIEF_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		if(LARES_ISONBOARD != LOG_SUCCESS)
		{
			Npc_ExchangeRoutine(self,"SittingShipDI");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	};
	DIA_PC_THIEF_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
};


instance DIA_THIEF_DI_PICKPOCKET(C_INFO)
{
	npc = pc_thief_di;
	nr = 900;
	condition = dia_thief_di_pickpocket_condition;
	information = dia_thief_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_thief_di_pickpocket_condition()
{
	return c_beklauen(120,600);
};

func void dia_thief_di_pickpocket_info()
{
	Info_ClearChoices(dia_thief_di_pickpocket);
	Info_AddChoice(dia_thief_di_pickpocket,DIALOG_BACK,dia_thief_di_pickpocket_back);
	Info_AddChoice(dia_thief_di_pickpocket,DIALOG_PICKPOCKET,dia_thief_di_pickpocket_doit);
};

func void dia_thief_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thief_di_pickpocket);
};

func void dia_thief_di_pickpocket_back()
{
	Info_ClearChoices(dia_thief_di_pickpocket);
};

