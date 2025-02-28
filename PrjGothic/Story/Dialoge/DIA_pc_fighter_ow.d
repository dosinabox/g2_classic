
instance DIA_GORNOW_EXIT(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 999;
	condition = dia_gornow_exit_condition;
	information = dia_gornow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornow_exit_condition()
{
	return TRUE;
};

func void dia_gornow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNOW_HELLO(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 2;
	condition = dia_gornow_hello_condition;
	information = dia_gornow_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gornow_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_gornow_hello_info()
{
	var C_NPC milten;
	milten = Hlp_GetNpc(pc_mage_ow);
	AI_Output(other,self,"DIA_GornOW_Hello_15_00");	//������ ������������� ����� - �� ��������!
	AI_Output(self,other,"DIA_GornOW_Hello_12_01");	//�� ��. ����� ���� ���� �������� ���� ������.
	AI_Output(self,other,"DIA_GornOW_Hello_12_02");	//�� � ������ �� ������, ��� ��� ������ ��, �������. � ��������� ��� ������ ����.
	AI_Output(other,self,"DIA_GornOW_Hello_15_03");	//(����������) ������ �������, ��� �� ��� ������� ����� � �� ������ �� ����� ���� ��������� ������� ����.
	AI_Output(self,other,"DIA_GornOW_Hello_12_04");	//��� �� �� �������� �� ����, � �� �� ��������� �� ���� ������ ����. �� ����� ���������� ������. ��� ������ ��� ��� �������� �������.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_GornOW_Add_12_00");	//�������, � ���� ���� ���-���, ��� ����� �� ����������� ����.
		AI_Output(self,other,"DIA_GornOW_Add_12_01");	//� ����� ��� ������� �����, � ������. ��������, �� ������� �����-�� �����������.
		b_giveinvitems(self,other,itar_sld_m,1);
		AI_Output(self,other,"DIA_GornOW_Add_12_02");	//��� ���� ��� ������� ����, �� ���� ����� ������� ...
		AI_Output(other,self,"DIA_GornOW_Add_15_03");	//�������! �������� � ������� ...
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_Hello_15_05");	//�����, �������� � �������.
	};
	AI_Output(self,other,"DIA_GornOW_Hello_12_06");	//�������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FREE");
	b_startotherroutine(milten,"GORNFREE");
	MIS_RESCUEGORN = LOG_SUCCESS;
	b_giveplayerxp(XP_RESCUEGORN);
};


instance DIA_GORNOW_METMILTEN(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 2;
	condition = dia_gornow_metmilten_condition;
	information = dia_gornow_metmilten_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gornow_metmilten_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (Npc_GetDistToWP(self,"OC_MAGE_LIBRARY_IN") <= 500) && Npc_IsInState(self,zs_talk) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gornow_metmilten_info()
{
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_00");	//�������� - ��� ����� ��� �������� �������. � �����, ����� ���������� �� ���� ������.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_01");	//��� �� ������ ����� ������?
	AI_Output(other,self,"DIA_GornOW_MetMilten_15_02");	//��� ���� ���� ����� ����������� �����.
	AI_Output(self,other,"DIA_GornOW_MetMilten_12_03");	//������. � ����� ������ ������ � ������� ������.
	if(other.guild != GIL_SLD)
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_04");	//� ���� �� �������?
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_05");	//� ������, �� ��� ���. � ���� ����� �������������� � ����.
	}
	else
	{
		AI_Output(other,self,"DIA_GornOW_MetMilten_15_06");	//����� ��� �� ����� �����. �� � ��� ����� ������ ���. ��� ������ ����� ����� ����� ����.
		AI_Output(self,other,"DIA_GornOW_MetMilten_12_07");	//��� � ������. �����, �������, ��� ��� ���.
	};
};


instance DIA_GORNOW_SEEYOU(C_INFO)
{
	npc = pc_fighter_ow;
	nr = 900;
	condition = dia_gornow_seeyou_condition;
	information = dia_gornow_seeyou_info;
	permanent = TRUE;
	description = "��� ��������.";
};


func int dia_gornow_seeyou_condition()
{
	if(Npc_KnowsInfo(other,dia_gornow_metmilten) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gornow_seeyou_info()
{
	AI_Output(other,self,"DIA_GornOW_SeeYou_15_00");	//��� ��������.
	AI_Output(self,other,"DIA_GornOW_SeeYou_12_01");	//��� �����.
	AI_StopProcessInfos(self);
};

