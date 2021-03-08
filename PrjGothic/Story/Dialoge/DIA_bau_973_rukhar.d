
instance DIA_RUKHAR_EXIT(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 999;
	condition = dia_rukhar_exit_condition;
	information = dia_rukhar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rukhar_exit_condition()
{
	return TRUE;
};

func void dia_rukhar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_HALLO(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 4;
	condition = dia_rukhar_hallo_condition;
	information = dia_rukhar_hallo_info;
	description = "��� ����� ����?";
};


func int dia_rukhar_hallo_condition()
{
	return TRUE;
};

func void dia_rukhar_hallo_info()
{
	AI_Output(other,self,"DIA_Rukhar_HALLO_15_00");	//��� ����� ����?
	AI_Output(self,other,"DIA_Rukhar_HALLO_12_01");	//�� ����� ������, �� � ���� ����� �� ���������� �������� ��������������.
};


instance DIA_RUKHAR_WASMACHSTDU(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 5;
	condition = dia_rukhar_wasmachstdu_condition;
	information = dia_rukhar_wasmachstdu_info;
	description = "��� �� ������� �����?";
};


func int dia_rukhar_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_hallo))
	{
		return TRUE;
	};
};

func void dia_rukhar_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Rukhar_WASMACHSTDU_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_01");	//��� ��������� ������ ����� �������� ��� ��� �� ����� �����.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_02");	//�� ������� � �����, ��� ������ ��� �� ������� � ������ ������.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_03");	//������ � ��� ���� ������. ���, ��� ����������� ���, ��������� � ���� �������. � ������ ��� ������ �� �����.
	AI_Output(self,other,"DIA_Rukhar_WASMACHSTDU_12_04");	//�� ������ ������������� �� ����?
	Log_CreateTopic(TOPIC_WETTSAUFEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WETTSAUFEN,LOG_RUNNING);
	b_logentry(TOPIC_WETTSAUFEN,"� ������� ����� ��������� ����.");
};


instance DIA_RUKHAR_WETTKAMPF(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_wettkampf_condition;
	information = dia_rukhar_wettkampf_info;
	description = "� ��� ��� �� ����������?";
};


func int dia_rukhar_wettkampf_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rukhar_wettkampf_info()
{
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_00");	//� ��� ��� �� ����������?
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_01");	//� ������� ��� '��� �� ���'.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_02");	//������� ����� ������.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_03");	//�� �� ������� ���������� �� ������ ����� ������������� ����, ������� ���������� ���� ������ �����.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_04");	//������ ������ ����� ������� �� ���, ���, ����� ���� ������� �����, ���� �� ����������� ����� ����.
	AI_Output(self,other,"DIA_Rukhar_WETTKAMPF_12_05");	//���������� ���, ��� ������ ������ ��������� �� �����. ����������� ���������� ���� � ������. ��? ��� ���� ���?
	AI_Output(other,self,"DIA_Rukhar_WETTKAMPF_15_06");	//����� ���� �����, ����� � �� ���� ��� ����������.
};


instance DIA_RUKHAR_HOLERANDOLPH(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_holerandolph_condition;
	information = dia_rukhar_holerandolph_info;
	description = "���� � ��������� �� ����-������ ���?";
};


func int dia_rukhar_holerandolph_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wettkampf))
	{
		return TRUE;
	};
};

func void dia_rukhar_holerandolph_info()
{
	AI_Output(other,self,"DIA_Rukhar_HOLERANDOLPH_15_00");	//���� � ��������� �� ����-������ ���?
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_01");	//�������. ���� �� ������� ����-������, � ���� ������ �������� ���������� �� ���� ������, � ����� ���� ������.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_02");	//��� ������ ���������� ������ � ������. ���������� �������� ���. ������ ������ ������� ������ �� ������� ������ ��������.
	AI_Output(self,other,"DIA_Rukhar_HOLERANDOLPH_12_03");	//������� ��� ����-������, ��� ��������� ���������� �� ���� ������, � � ����� ���� ������.
	b_logentry(TOPIC_WETTSAUFEN,"����� �������� ��� ���� ��� �� ���. ���, �������, ��� ��� �� ���������. � ����� ����-������ ��� ��� ����. ����� ������� ������, �� �� ����.");
};


instance DIA_RUKHAR_RANDOLPHWILL(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_randolphwill_condition;
	information = dia_rukhar_randolphwill_info;
	permanent = TRUE;
	description = "� ����� ��������, ������� ����� ��������� � �����.";
};


var int dia_rukhar_randolphwill_noperm;

func int dia_rukhar_randolphwill_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_gegenwen) && Npc_KnowsInfo(other,dia_rukhar_holerandolph) && (DIA_RUKHAR_RANDOLPHWILL_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_rukhar_randolphwill_info()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_00");	//� ����� ��������, ������� ����� ��������� � �����.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_01");	//��� ���?
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_15_02");	//��������.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_03");	//�� ��. �������� �������? ������. ������ �� � ���.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_04");	//������ ����� �������� �� ���, � ������ ������.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_05");	//�� ������ ��������� ��� ��� ��� �� ������ ��� ����� 2 ���. ��� �����? �����, ���� �������, � �� ������ �����������.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_12_06");	//������ ���� ������?
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"����.",dia_rukhar_randolphwill_nix);
	Info_AddChoice(dia_rukhar_randolphwill,"100.",dia_rukhar_randolphwill_100);
	Info_AddChoice(dia_rukhar_randolphwill,"50.",dia_rukhar_randolphwill_50);
	Info_AddChoice(dia_rukhar_randolphwill,"20.",dia_rukhar_randolphwill_20);
	Info_AddChoice(dia_rukhar_randolphwill,"10 �������.",dia_rukhar_randolphwill_10);
};

func void dia_rukhar_randolphwill_annehmen()
{
	Info_ClearChoices(dia_rukhar_randolphwill);
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_annehmen_12_00");	//� ������ ���� ������ � ������� �� � ����, ���� ���������� �� ����� ��������, ������?
	DIA_RUKHAR_RANDOLPHWILL_NOPERM = TRUE;
};

func void dia_rukhar_randolphwill_mehr()
{
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"����.",dia_rukhar_randolphwill_nix);
	Info_AddChoice(dia_rukhar_randolphwill,"100.",dia_rukhar_randolphwill_100);
	Info_AddChoice(dia_rukhar_randolphwill,"50.",dia_rukhar_randolphwill_50);
	Info_AddChoice(dia_rukhar_randolphwill,"20.",dia_rukhar_randolphwill_20);
	Info_AddChoice(dia_rukhar_randolphwill,"10 �������.",dia_rukhar_randolphwill_10);
};

func void dia_rukhar_randolphwill_nix()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_nix_15_00");	//����.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_nix_12_01");	//����� ��� ����� ������ � ����������.
	AI_StopProcessInfos(self);
};

func void dia_rukhar_randolphwill_10()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_10_15_00");	//10 �������.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_10_12_01");	//�� �����, ��, ������ ����, ������. ��� ��������� ������� �� ������� ����.
	RUKHAR_EINSATZ = 10;
	RUKHAR_GEWINN = 20;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(������� ������ ������)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(������� ������)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_20()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_20_15_00");	//20.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_20_12_01");	//���� �� ������ ������� ������, �� ����� �� ��� ��-�����������.
	RUKHAR_EINSATZ = 20;
	RUKHAR_GEWINN = 40;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(������� ������ ������)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(������� ������)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_50()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_50_15_00");	//50.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_50_12_01");	//�� �����. ������.
	RUKHAR_EINSATZ = 50;
	RUKHAR_GEWINN = 100;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(������� ������ ������)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(������� ������)",dia_rukhar_randolphwill_annehmen);
};

func void dia_rukhar_randolphwill_100()
{
	AI_Output(other,self,"DIA_Rukhar_RANDOLPHWILL_100_15_00");	//100.
	AI_Output(self,other,"DIA_Rukhar_RANDOLPHWILL_100_12_01");	//��� ��� ��� ��� ��������.
	RUKHAR_EINSATZ = 100;
	RUKHAR_GEWINN = 200;
	Info_ClearChoices(dia_rukhar_randolphwill);
	Info_AddChoice(dia_rukhar_randolphwill,"(������� ������ ������)",dia_rukhar_randolphwill_mehr);
	Info_AddChoice(dia_rukhar_randolphwill,"(������� ������)",dia_rukhar_randolphwill_annehmen);
};


instance DIA_RUKHAR_ICHSEHEDICH(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_ichsehedich_condition;
	information = dia_rukhar_ichsehedich_info;
	permanent = TRUE;
	description = "��� ��� ������.";
};


var int dia_rukhar_ichsehedich_noperm;

func int dia_rukhar_ichsehedich_condition()
{
	if((DIA_RUKHAR_ICHSEHEDICH_NOPERM == FALSE) && (DIA_RUKHAR_RANDOLPHWILL_NOPERM == TRUE) && (RUKHAR_EINSATZ != 0))
	{
		return TRUE;
	};
};

func void dia_rukhar_ichsehedich_info()
{
	AI_Output(other,self,"DIA_Rukhar_ICHSEHEDICH_15_00");	//��� ��� ������.
	if(b_giveinvitems(other,self,itmi_gold,RUKHAR_EINSATZ))
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_01");	//������. �� ������ �� ����, ������� ��������� ���������, �������?
		DIA_RUKHAR_ICHSEHEDICH_NOPERM = TRUE;
		MIS_RUKHAR_WETTKAMPF = LOG_RUNNING;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_ICHSEHEDICH_12_02");	//����� ������. �����������, ����� � ���� ����� ������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_GELDZURUECK(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_geldzurueck_condition;
	information = dia_rukhar_geldzurueck_info;
	permanent = TRUE;
	description = "� ���� �������� ���� ������ �����.";
};


func int dia_rukhar_geldzurueck_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (RUKHAR_WON_WETTKAMPF == TRUE))
	{
		return TRUE;
	};
};

func void dia_rukhar_geldzurueck_info()
{
	AI_Output(other,self,"DIA_Rukhar_GELDZURUECK_15_00");	//� ���� �������� ���� ������ �����.
	AI_Output(self,other,"DIA_Rukhar_GELDZURUECK_12_01");	//������� ���� - ��� ���� �����, ��������. ���� ��������� �������� �� ���� ������.
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_HAENSELN(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 3;
	condition = dia_rukhar_haenseln_condition;
	information = dia_rukhar_haenseln_info;
	permanent = TRUE;
	description = "������, �� ������� ������, ��� ������ ����������.";
};


func int dia_rukhar_haenseln_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (RUKHAR_WON_WETTKAMPF == FALSE))
	{
		return TRUE;
	};
};


var int dia_rukhar_haenseln_nureimalgeld;

func void dia_rukhar_haenseln_info()
{
	AI_Output(other,self,"DIA_Rukhar_HAENSELN_15_00");	//������, �� ������� ������, ��� ������ ����������.
	if(DIA_RUKHAR_HAENSELN_NUREIMALGELD == FALSE)
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_01");	//��� ���� ������, � ������ � �� ����� �� �����.
		b_giveplayerxp(XP_RUKHAR_LOST);
		IntToFloat(RUKHAR_GEWINN);
		CreateInvItems(self,itmi_gold,RUKHAR_GEWINN);
		b_giveinvitems(self,other,itmi_gold,RUKHAR_GEWINN);
		DIA_RUKHAR_HAENSELN_NUREIMALGELD = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Rukhar_HAENSELN_12_02");	//� ��� ���������� � �����.
	};
	AI_StopProcessInfos(self);
};


instance DIA_RUKHAR_PERM(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 7;
	condition = dia_rukhar_perm_condition;
	information = dia_rukhar_perm_info;
	permanent = TRUE;
	description = "������ ����������� �� ���������?";
};


func int dia_rukhar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_rukhar_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_rukhar_perm_info()
{
	AI_Output(other,self,"DIA_Rukhar_Perm_15_00");	//������ ����������� �� ���������?
	AI_Output(self,other,"DIA_Rukhar_Perm_12_01");	//������ ������, � ��� �� � ���. ����� ������ ��� �� ������������.
};


instance DIA_RUKHAR_PICKPOCKET(C_INFO)
{
	npc = bau_973_rukhar;
	nr = 900;
	condition = dia_rukhar_pickpocket_condition;
	information = dia_rukhar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_rukhar_pickpocket_condition()
{
	return c_beklauen(26,30);
};

func void dia_rukhar_pickpocket_info()
{
	Info_ClearChoices(dia_rukhar_pickpocket);
	Info_AddChoice(dia_rukhar_pickpocket,DIALOG_BACK,dia_rukhar_pickpocket_back);
	Info_AddChoice(dia_rukhar_pickpocket,DIALOG_PICKPOCKET,dia_rukhar_pickpocket_doit);
};

func void dia_rukhar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rukhar_pickpocket);
};

func void dia_rukhar_pickpocket_back()
{
	Info_ClearChoices(dia_rukhar_pickpocket);
};

