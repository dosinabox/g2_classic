
instance DIA_RICHTER_EXIT(C_INFO)
{
	npc = vlk_402_richter;
	nr = 999;
	condition = dia_richter_exit_condition;
	information = dia_richter_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_richter_exit_condition()
{
	return TRUE;
};

func void dia_richter_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_HELLO(C_INFO)
{
	npc = vlk_402_richter;
	nr = 4;
	condition = dia_richter_hello_condition;
	information = dia_richter_hello_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_richter_hello_condition()
{
	if(MIS_LEE_JUDGERICHTER == 0)
	{
		return TRUE;
	};
};

func void dia_richter_hello_info()
{
	AI_Output(other,self,"DIA_Richter_Hello_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Richter_Hello_10_01");	//��� ���� �� ���� �����? ��� �� ������ �����?
	AI_Output(other,self,"DIA_Richter_Hello_15_02");	//�, �-�...
	AI_Output(self,other,"DIA_Richter_Hello_10_03");	//�����, �� ������ ����� �� �����������?
	Info_ClearChoices(dia_richter_hello);
	Info_AddChoice(dia_richter_hello,"� ������ �� �����.",dia_richter_hello_dontthinkso);
	Info_AddChoice(dia_richter_hello,"����� � ���.",dia_richter_hello_maybe);
};

func void dia_richter_hello_dontthinkso()
{
	AI_Output(other,self,"DIA_Richter_Hello_DontThinkSo_15_00");	//� ������ �� �����.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_01");	//�������. ����� ����������, ��� ���-�� ����� ���� ������.
	AI_Output(self,other,"DIA_Richter_Hello_DontThinkSo_10_02");	//�����, ��� ��, ������� ��������, ������ ���� �� �����.
};

func void dia_richter_hello_maybe()
{
	AI_Output(other,self,"DIA_Richter_Hello_MayBe_15_00");	//����� � ���.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_01");	//�� ������ ��������?! �� ���� ������, � ��� �� ��������������?
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_02");	//�� ������� ����, �� ��� �� ���������� �� ��� ����� �����������.
	AI_Output(self,other,"DIA_Richter_Hello_MayBe_10_03");	//� ������ �������� � ���� ����!
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 800;
	condition = dia_richter_perm_condition;
	information = dia_richter_perm_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_richter_perm_condition()
{
	if((Npc_KnowsInfo(other,dia_richter_hello) || (MIS_LEE_JUDGERICHTER == LOG_RUNNING)) && (SCISTRICHTERSLAKAI == FALSE))
	{
		return TRUE;
	};
};

func void dia_richter_perm_info()
{
	AI_Output(other,self,"DIA_Richter_Perm_15_00");	//��� ����?
	if((MIS_LEE_JUDGERICHTER == LOG_RUNNING) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_01");	//���� ����� �������� ������, ������� �������, ���� � �� ������ ������.
		AI_Output(other,self,"DIA_Richter_Perm_15_02");	//����������. � ����� �� ��� ����, ����� ��������� ����. � ��� ������.
		AI_Output(self,other,"DIA_Richter_Perm_10_03");	//��. ��� �� ������ �������� �� ����. ���. ���, �������, ������ ����.
		AI_Output(self,other,"DIA_Richter_Perm_10_04");	//��, � ���� ���� ��������� ��������. �� � �� ����, ���� �� � �������� ����. ������� �� ������ ��������, ��� �� ���� ����� ����������.
		SCISTRICHTERSLAKAI = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Richter_Perm_10_05");	//����� � ��� �� ������, ��� �� ���� ����� � ����� ������� ���?
		AI_Output(other,self,"DIA_Richter_Perm_15_06");	//���, �� ������� ����, �� ��� ��������.
		AI_Output(self,other,"DIA_Richter_Perm_10_07");	//�� ������, � �������, �� ����, �������, ��� �����.
	};
};


instance DIA_RICHTER_RICHTERSLAKAI(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_richterslakai_condition;
	information = dia_richter_richterslakai_info;
	description = "������� ����.";
};


func int dia_richter_richterslakai_condition()
{
	if((Npc_KnowsInfo(other,dia_richter_hello) || (MIS_LEE_JUDGERICHTER != 0)) && (SCISTRICHTERSLAKAI == TRUE))
	{
		return TRUE;
	};
};

func void dia_richter_richterslakai_info()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_15_00");	//������� ����.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_01");	//�-�-�. ������. ������. ������� ��� ��������� ����� ����� ����. ��� ������ ��� ���-�� � �������� ���������.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_10_02");	//���� ���� ������� ���, � ������� ������ ����, ����� ������� ���� � �������������.
	Info_ClearChoices(dia_richter_richterslakai);
	Info_AddChoice(dia_richter_richterslakai,"� ������ ������� � �����? �� � ���� ����� �������.",dia_richter_richterslakai_nein);
	Info_AddChoice(dia_richter_richterslakai,"������.",dia_richter_richterslakai_ja);
	b_logentry(TOPIC_RICHTERLAKAI,"����� �� �������� ���. � ������ �������� ���� �������� ���. � ������ ������� ��������� ����� �� ������� ��������� ����� ���� � �������� ����� ���.");
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_RUNNING;
};

func void dia_richter_richterslakai_nein()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_nein_15_00");	//� ������ ������� � �����? �� � ���� ����� �������.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_nein_10_01");	//����� ���������� � �����. ������ ������� ��� ����� �������.
	AI_StopProcessInfos(self);
};

func void dia_richter_richterslakai_ja()
{
	AI_Output(other,self,"DIA_Richter_RichtersLakai_ja_15_00");	//������.
	AI_Output(self,other,"DIA_Richter_RichtersLakai_ja_10_01");	//�������. �� ����� - ���� ���� �������, � ������� �� ������ � ����.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killmorgahard_condition;
	information = dia_richter_killmorgahard_info;
	description = "��� ��������� ����� �����.";
};


func int dia_richter_killmorgahard_condition()
{
	if(Npc_HasItems(other,holy_hammer_mis) && (MIS_RICHTER_BRINGHOLYHAMMER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_richter_killmorgahard_info()
{
	AI_Output(other,self,"DIA_Richter_KillMorgahard_15_00");	//��� ��������� ����� �����.
	b_giveinvitems(other,self,holy_hammer_mis,1);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_01");	//� �������. ������, � ���� ������������� ��������� ���������. ��� ���� ��������������.
	CreateInvItems(self,itmi_gold,300);
	b_giveinvitems(self,other,itmi_gold,300);
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_02");	//�������. ��� ��� ��� ������ ������, � ���� ���� ��� ���� ��� ���� �������.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_03");	//��������� ���� �����, �� ������� ������ ������� ��������� �����������.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_04");	//��� ������ ���� ����������� � ����. ������ �����, �� ����������� � ����� ����� ��������.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_05");	//�� ������� ����� ���������. � ����, ����� �� ���� ���.
	AI_Output(self,other,"DIA_Richter_KillMorgahard_10_06");	//����������, ���� ��� �� ������� ����-������ ���.
	Wld_InsertNpc(bdt_1030_morgahard,"REICH");
	Wld_InsertNpc(bdt_1031_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1032_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1033_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1034_fluechtling,"REICH");
	Wld_InsertNpc(bdt_1035_fluechtling,"REICH");
	b_initnpcglobals();
	b_giveplayerxp(XP_BRINGHOLYHAMMER);
	MIS_RICHTER_BRINGHOLYHAMMER = LOG_SUCCESS;
	b_logentry(TOPIC_RICHTERLAKAI,"��������� ����������� ������� �� �����. � ������ ����� �� � ����������, � ����� ���������� �� ������� - ����������. ���, ����������������, ���������� � �����, ���-�� �� ����������� � ����� ����� ��������.");
	MIS_RICHTER_KILLMORGAHARD = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_KILLEDMORGAHARD(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahard_condition;
	information = dia_richter_killedmorgahard_info;
	description = "��������� �����.";
};


func int dia_richter_killedmorgahard_condition()
{
	if(Npc_IsDead(morgahard) && (MIS_RICHTER_KILLMORGAHARD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_richter_killedmorgahard_info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahard_15_00");	//��������� �����.
	AI_Output(self,other,"DIA_Richter_KilledMorgahard_10_01");	//��! �� �������� ������. ��� ���� �������.
	CreateInvItems(self,itmi_gold,400);
	b_giveinvitems(self,other,itmi_gold,400);
	b_giveplayerxp(XP_KILLMORGAHARD);
	b_logentry(TOPIC_RICHTERLAKAI,"�����, ������, �������� ������� � ������ ����������. �, �����, ��� �� ����� ��� ����. ��� �������� ���� - ���������� ������� ��.");
	MIS_RICHTER_KILLMORGAHARD = LOG_SUCCESS;
};


instance DIA_RICHTER_KILLEDMORGAHARDPERM(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_killedmorgahardperm_condition;
	information = dia_richter_killedmorgahardperm_info;
	permanent = TRUE;
	description = "���� � ��� ���-������ ������� ��� ����?";
};


func int dia_richter_killedmorgahardperm_condition()
{
	if((MIS_RICHTER_KILLMORGAHARD == LOG_SUCCESS) && (MIS_RICHTERSPERMISSIONFORSHIP == 0))
	{
		return TRUE;
	};
};

func void dia_richter_killedmorgahardperm_info()
{
	AI_Output(other,self,"DIA_Richter_KilledMorgahardPERM_15_00");	//���� � ��� ���-������ ������� ��� ����?
	AI_Output(self,other,"DIA_Richter_KilledMorgahardPERM_10_01");	//���� ���. ��������, �����.
};


instance DIA_RICHTER_PERMISSIONFORSHIP(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_permissionforship_condition;
	information = dia_richter_permissionforship_info;
	description = "��� ��� ���������� ������������� ���������� ������������� �������� ���������.";
};


func int dia_richter_permissionforship_condition()
{
	if(MIS_RICHTERSPERMISSIONFORSHIP == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_richter_permissionforship_info()
{
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_00");	//��� ��� ���������� ������������� ���������� ������������� �������� ���������.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_01");	//(�������) ��, ������ ����, �������� ���������. ��� �� ������, ����� � ������?
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_02");	//�� ��� ������. ���� �� ���� ��� ��� ������, ���� � ���� ���� ���������.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_03");	//(�����) ����� �� ����� ���� �������������! ��� ����� ��! � ������� ���� ������, ���������� ����� ������!
	AI_Output(other,self,"DIA_Richter_PermissionForShip_15_04");	//��������� ���� ����������� �� ������ �������. � ���� ���� ��������, �������������� ���.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_05");	//(�����) ��-�.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_06");	//�� ��������� �� ����. ���� ������ �� ������ ���� � ��� ������ ���.
	AI_Output(self,other,"DIA_Richter_PermissionForShip_10_07");	//��� ���� ������. � ������ ����������. � ��������� � ����� �����.
	CreateInvItems(self,itwr_forgedshipletter_mis,1);
	b_giveinvitems(self,other,itwr_forgedshipletter_mis,1);
	b_logentry(TOPIC_SHIP,"������ � ������������� ���������� ������ ��������� ��� ������� ��������� ��������. ���������, ��� ������ �� ��� ��.");
	MIS_RICHTERSPERMISSIONFORSHIP = LOG_SUCCESS;
	b_giveplayerxp(XP_RICHTERSPERMISSIONFORSHIP);
};


instance DIA_RICHTER_PERM2(C_INFO)
{
	npc = vlk_402_richter;
	nr = 2;
	condition = dia_richter_perm2_condition;
	information = dia_richter_perm2_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_richter_perm2_condition()
{
	if((MIS_RICHTERSPERMISSIONFORSHIP == LOG_SUCCESS) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_richter_perm2_info()
{
	AI_Output(self,other,"DIA_Richter_perm2_10_00");	//�������� � ���� ����.
	AI_StopProcessInfos(self);
};


instance DIA_RICHTER_PICKPOCKET(C_INFO)
{
	npc = vlk_402_richter;
	nr = 900;
	condition = dia_richter_pickpocket_condition;
	information = dia_richter_pickpocket_info;
	permanent = TRUE;
	description = "(������� ���� ���� ����� �����)";
};


func int dia_richter_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_richter) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_richter_pickpocket_info()
{
	Info_ClearChoices(dia_richter_pickpocket);
	Info_AddChoice(dia_richter_pickpocket,DIALOG_BACK,dia_richter_pickpocket_back);
	Info_AddChoice(dia_richter_pickpocket,DIALOG_PICKPOCKET,dia_richter_pickpocket_doit);
};

func void dia_richter_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_richter,1);
		b_givethiefxp();
		Info_ClearChoices(dia_richter_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_richter_pickpocket_back()
{
	Info_ClearChoices(dia_richter_pickpocket);
};

