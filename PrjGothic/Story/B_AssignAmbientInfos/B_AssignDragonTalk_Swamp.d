
instance DIA_DRAGON_SWAMP_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_swamp_exit_condition;
	information = dia_dragon_swamp_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_swamp_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Swamp_Exit_20_00");	//���� ����� �������. ���� ����� ���������� �����, �������.
	self.flags = 0;
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	if(DJG_SWAMPPARTY_GOGOGO == TRUE)
	{
		if((DJG_SWAMPPARTY == TRUE) && (Npc_IsDead(djg_cipher) == FALSE))
		{
			b_startotherroutine(djg_rod,"SwampDragon");
		};
		b_startotherroutine(djg_cipher,"SwampDragon");
	};
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
};


instance DIA_DRAGON_SWAMP_HELLO(C_INFO)
{
	nr = 5;
	condition = dia_dragon_swamp_hello_condition;
	information = dia_dragon_swamp_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_swamp_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_00");	//���� ����, ���� �� �������� ��� ���� ��� ������!
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_01");	//��. ���� ������, ������, ��������.
	};
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_02");	//������ �� ��� ��������� ����. � ���� �� ����.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_03");	//������ �������. ���� ������� ����� �� ������ ����, ������� ���������� ������.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_04");	//����� ��� ��, ��� � ���� �����, ��� � ������ ���� � ����� �� �����.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_05");	//��-��-��. �� ������ �������� ���, ������ �����? ������ ���� �� ���� �������, ������ ��� �� ��������� ���� �� ������ ������ ����� ������.
	AI_Output(other,self,"DIA_Dragon_Swamp_Hello_15_06");	//� ��������� ������, � �� ���� ��� ����. � ���� ��� ������. �� ������ ����������� ���� ����, ��� �� ������ ���������.
	AI_Output(self,other,"DIA_Dragon_Swamp_Hello_20_07");	//(�����) ��-�. ������, ��� ���� ����� �� ����.
};


instance DIA_DRAGON_SWAMP_WERBISTDU(C_INFO)
{
	nr = 6;
	condition = dia_dragon_swamp_werbistdu_condition;
	information = dia_dragon_swamp_werbistdu_info;
	description = "��� ��?";
};


func int dia_dragon_swamp_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_swamp_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WERBISTDU_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Dragon_Swamp_WERBISTDU_20_01");	//���� ����� ���������. � ����� ����� ���� ��������� ������� ������� ��� ������, �� �������� �� ������.
};


instance DIA_DRAGON_SWAMP_WOSINDDIEANDEREN(C_INFO)
{
	nr = 7;
	condition = dia_dragon_swamp_wosinddieanderen_condition;
	information = dia_dragon_swamp_wosinddieanderen_info;
	description = "��� ��� ����� ��������� �� ���, ������������� ��������?";
};


func int dia_dragon_swamp_wosinddieanderen_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_swamp_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_swamp_wosinddieanderen_info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00");	//��� ��� ����� ��������� �� ���, ������������� ��������?
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01");	//������, �� ������� ������� ���, ������������ ����������� ����� ����.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02");	//������ �� ��� �������� �� ���� ����� ����.
	AI_Output(self,other,"DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03");	//��� ������ � �� ������� ���������.
};

func void b_assigndragontalk_swamp(var C_NPC slf)
{
	dia_dragon_swamp_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_swamp_wosinddieanderen.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

