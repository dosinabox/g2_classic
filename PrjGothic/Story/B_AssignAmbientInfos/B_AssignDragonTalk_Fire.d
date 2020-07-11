
instance DIA_DRAGON_FIRE_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_fire_exit_condition;
	information = dia_dragon_fire_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_fire_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Fire_Exit_20_00");	//���� ������� ���� ����, � ���� �� ������ �� ��������� ����.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
};


instance DIA_DRAGON_FIRE_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_fire_hello_condition;
	information = dia_dragon_fire_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_fire_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_00");	//�������� �� ����, ��� ��� ��������� ����, ������� ������ ���� ����� �� ��, ����� ������ ������� ������ �������.
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_01");	//�� �������� ����� �������� ��� ������ ����������� �������.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_02");	//� ������ �� �����, ����� ������� ����. �����, ���� ��� ��������� ����� ����������.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_03");	//�� ������ �������, ��� ����� ������� ���� �� ���?
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_04");	//��-��-��. � ������ ���� ������� ���.
	AI_Output(other,self,"DIA_Dragon_Fire_Hello_15_05");	//�� ��� ������, ������. �� ���� ���� ������. �� �� ������ �������������� ���� ����. ������� �� ��� �������, ����� ���� ���� ����������� ������.
	AI_Output(self,other,"DIA_Dragon_Fire_Hello_20_06");	//(�����) ��-�. ����� ������� ���� ������ �������, ���� ��� ������. ���� ���� ����� �� ���������.
};


instance DIA_DRAGON_FIRE_WERBISTDU(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_werbistdu_condition;
	information = dia_dragon_fire_werbistdu_info;
	description = "��� ��?";
};


func int dia_dragon_fire_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_fire_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_fire_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_WerBistDu_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_01");	//���� ����� ��������, � ��� ���, ��� �� ������� ��� ���.
	AI_Output(self,other,"DIA_Dragon_Fire_WerBistDu_20_02");	//����� ���� �������� ���� �����, �� ������� � ����.
};


instance DIA_DRAGON_FIRE_HORT(C_INFO)
{
	nr = 5;
	condition = dia_dragon_fire_hort_condition;
	information = dia_dragon_fire_hort_info;
	description = "��� ���� ������������?";
};


func int dia_dragon_fire_hort_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_fire_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_fire_hort_info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_HORT_15_00");	//� ������� ������� ���� ������������, ��� �� ������ ���� ���������. � ��� ���� ������������?
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_01");	//� �����, ������� ����� ���������� ��� ����, ����� � ���������� �� �� �����.
	AI_Output(self,other,"DIA_Dragon_Fire_HORT_20_02");	//� ����� ���� ��������� ������ � ���� ������� ������, ���� ����������� ���������� ��������� ������ ���������� �������� ����� ����.
};

func void b_assigndragontalk_fire(var C_NPC slf)
{
	dia_dragon_fire_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_fire_hort.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

