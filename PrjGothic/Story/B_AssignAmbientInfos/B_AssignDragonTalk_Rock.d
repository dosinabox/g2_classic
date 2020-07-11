
instance DIA_DRAGON_ROCK_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_rock_exit_condition;
	information = dia_dragon_rock_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_rock_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_rock_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Rock_Exit_20_00");	//�� ������ �������. ���� ��������� ���� �������. ���� ������� ���� ����. ����������� �������.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_ROCK_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_rock_hello_condition;
	information = dia_dragon_rock_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_rock_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_rock_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_00");	//��� ���� ������������� ����������� ��������� ���������� �� ��� �����. ��, ����, ����� ������. ����� ������������ � ����� ������.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Rock_Hello_15_01");	//������-��, ������������� �������������.
	};
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_02");	//� ����� ���� ������������ � ������� �� ������.
	AI_Output(other,self,"DIA_Dragon_Rock_Add_15_00");	//�� ��� ������. �� ���� ���� ������. �� ������ ������������ ��� � �������� �� ��� �������.
	AI_Output(self,other,"DIA_Dragon_Rock_Hello_20_04");	//(�����) ��-�. ������� ���� �������.
};


instance DIA_DRAGON_ROCK_WERBISTDU(C_INFO)
{
	nr = 6;
	condition = dia_dragon_rock_werbistdu_condition;
	information = dia_dragon_rock_werbistdu_info;
	description = "��� ��?";
};


func int dia_dragon_rock_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_rock_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_rock_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_WERBISTDU_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Dragon_Rock_WERBISTDU_20_01");	//���� ����� ��������, � � ��������-�������� ���� ������� � ���� �����, ����� �������� �� ����.
};


instance DIA_DRAGON_ROCK_HIERARCHIE(C_INFO)
{
	nr = 7;
	condition = dia_dragon_rock_hierarchie_condition;
	information = dia_dragon_rock_hierarchie_info;
	description = "��� ����� ������� �� ���, ��������?";
};


func int dia_dragon_rock_hierarchie_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_rock_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_rock_hierarchie_info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_HIERARCHIE_15_00");	//��� ����� ������� �� ���, ��������?
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_01");	//�� ������� ���� ���� �� ������ ����� ����. �������� �������� � ������.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_02");	//�����, �������� ������ ������, ������ ����� ���� ���������, ������� ��� �������. �� ��� ����� ���������� � ��������� ���� �������, ���� �� ��������� ������� ������.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_03");	//�����, ������� ������ ����������, ������ ���������, ����� ����������� ��� ���� � ��������� ��������� ��� �����. � ��� ��� ���� ������ ������ �� �������.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_04");	//����� ����� ����� � �������� ����� ����� ����. � ��� ����� �������� ��� ����� ��������, �� �������� �� ����� ������, ����� �����.
	AI_Output(self,other,"DIA_Dragon_Rock_HIERARCHIE_20_05");	//��� ��� ������ ��������� � ����������. �� ������ � ����, ������� ����� ������� ��� �����, ��� ������������ � ������ ������� �� ����, ��� ����� ���� �� ��������.
};

func void b_assigndragontalk_rock(var C_NPC slf)
{
	dia_dragon_rock_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_rock_hierarchie.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

