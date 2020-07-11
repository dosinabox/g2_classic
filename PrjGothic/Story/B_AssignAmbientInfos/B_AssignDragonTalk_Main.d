
instance DIA_DRAGONTALK_MAIN_1(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_1_condition;
	information = dia_dragontalk_main_1_info;
	permanent = FALSE;
	description = "��� ��������� ���� ��������� �����?";
};


func int dia_dragontalk_main_1_condition()
{
	if(MIS_KILLEDDRAGONS == 0)
	{
		return TRUE;
	};
};

func void dia_dragontalk_main_1_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_1_15_00");	//����� ���. ��� ��������� ���� ��������� �����? �� ������ ������ �� ���, ����� ����� ���� � ������?
	AI_Output(self,other,"DIA_DragonTalk_Main_1_20_01");	//���� ������ ���� � ���� ����, ������ �����������, ��������� ������� �� ����.
	Info_AddChoice(dia_dragontalk_main_1,"��� ��� ��������� �������� ������ ��������?",dia_dragontalk_main_1_reden);
	Info_AddChoice(dia_dragontalk_main_1,"��� ��� ����� �������, ����� ������� ����?",dia_dragontalk_main_1_verbannen);
	DRAGONTALK_EXIT_FREE = TRUE;
};

func void dia_dragontalk_main_1_verbannen()
{
	AI_Output(other,self,"DIA_DragonTalk_MAIN_1_verbannen_15_00");	//���, �� ��� ������ ������ � �������, ����� ������� ��� �� ������� �����?
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_01");	//(�������) ������ ��� �� ������� �����������, �� ������� ������ ������ ����� ������ ��������� �����.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_02");	//������ ����� �� �������� ���� ��� ����� �� ����� ����������� ����.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_03");	//������ ���� ����� ��������� ��� ���� � �������� ���� ���� �������� ����.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_04");	//�� � ����� ������, ��� ���������� ����� ���������� ��� ����, ����� �� ������ �����
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_05");	//��� ��� ��������, ��� �� ������ ���� �������� �� �������.
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_06");	//������� �� ������� ����� ��������� � ���� ���, ����� ���������� ����������� ������ ���� �����.
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_07");	//�� ��� ��������, ������ �����������.
		Log_CreateTopic(TOPIC_DRACHENEIER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DRACHENEIER,LOG_RUNNING);
		b_logentry(TOPIC_DRACHENEIER,"���� �� �������� ����������� ���-�� �� '��������' � ����������� ��� �������� �����. �����, ��� ����� ��������� ���� ������� �� ���� ����.");
	}
	else
	{
		AI_Output(self,other,"DIA_DragonTalk_MAIN_1_verbannen_20_08");	//���� ������� ���� ����������. ������ ������ ��� �����, ������� �� ���� ��� ���.
	};
};

func void dia_dragontalk_main_1_reden()
{
	AI_Output(other,self,"DIA_DragonTalk_MAIN_1_reden_15_00");	//��� ��� ��������� �������� ������ ��������?
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_reden_20_01");	//������ ��� ������ ����� ������ ������������ ���� �����.
	AI_Output(self,other,"DIA_DragonTalk_MAIN_1_reden_20_02");	//�� ���� �� ������� ������ ���� ����� ������.
};


instance DIA_DRAGONTALK_MAIN_2(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_2_condition;
	information = dia_dragontalk_main_2_info;
	permanent = FALSE;
	description = "��� ������ ��� ����?";
};


func int dia_dragontalk_main_2_condition()
{
	if(MIS_KILLEDDRAGONS == 1)
	{
		return TRUE;
	};
};

func void dia_dragontalk_main_2_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_2_15_00");	//��� ������� �� ����������? ��� ������ ��� ����?
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_01");	//���� ������� � ��������� �������������� �������� ��� ������ ����� ����. ����� ����� �� ������ �������������� ���.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_02");	//��� ������� ���� ��� ����������� ���� �� ������� �������. ���� ���� ���������� � ������������ ��� ������� ���������.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_03");	//�� �������� ���, �����, � ����� ������� ���� �����.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_04");	//� ��� ���� �� �� ����� ��� ���������� ��� ������������� ����.
	AI_Output(self,other,"DIA_DragonTalk_Main_2_20_05");	//������ ������ � �������� ���� ������������ ���� �� ����� � ���������� �� ��� �������������� ��������� ������ ����� ����.
	b_logentry(TOPIC_DRACHENJAGD,"������� �� ������� ���� ����. ��� ������ ����������, � ������� �� ����� �������� ������ ����� �������� ����������. ���������� ������, ����� ���������� ��� � ��� �����... ������� ����.");
	DRAGONTALK_EXIT_FREE = TRUE;
};


instance DIA_DRAGONTALK_MAIN_3(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_3_condition;
	information = dia_dragontalk_main_3_info;
	permanent = FALSE;
	description = "��� � ���� �������� ������ �������?";
};


func int dia_dragontalk_main_3_condition()
{
	if(MIS_KILLEDDRAGONS == 2)
	{
		return TRUE;
	};
};

func void dia_dragontalk_main_3_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_00");	//��� � ���� �������� ������ �������?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_01");	//�� �������� � ����������� ��������. ���� � ���� ������ �������� ����������� � ��� �����, �� ������ ��������� � ����������� �������.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_02");	//� ��� �� ������ ��� ����� ��������. ����� ���������� �� ��������, ��� � �� ���� ����� ���.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_03");	//����, ������: ��� � ������ �������?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_04");	//����� ������������� ����� �������, ���� ����������� ����, ������� �� ������� �� ������� ����������.
	AI_Output(other,self,"DIA_DragonTalk_Main_3_15_05");	//� ��� ��� �� ����?
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_06");	//�� ������ ������ ������ �������, ������� ����������� � ����� ������ ����, � ������ �� �� ����.
	if((other.guild == GIL_PAL) || (other.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_01");	//���� ����������� ���, ��������������� ����� �����.
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_02");	//���� ����������� ����, ��������� ������ ��� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Dragons_Add_20_00");	//���� ����������� ������, ������� ������� ������ ��� ����.
	};
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_08");	//�� ����� ������� ������� �� ���� - �� ������ ����� ������� ���������, ������� ������ ����� �� ����� �� ������.
	AI_Output(self,other,"DIA_DragonTalk_Main_3_20_09");	//����� � ������ ����� �� ������ ���������� ����������� � ��������.
	DRAGONTALK_EXIT_FREE = TRUE;
};


instance DIA_DRAGONTALK_MAIN_4(C_INFO)
{
	nr = 10;
	condition = dia_dragontalk_main_4_condition;
	information = dia_dragontalk_main_4_info;
	permanent = FALSE;
	description = "��� ��� ����� ������ �������?";
};


func int dia_dragontalk_main_4_condition()
{
	if(MIS_KILLEDDRAGONS == 3)
	{
		return TRUE;
	};
};

func void dia_dragontalk_main_4_info()
{
	AI_Output(other,self,"DIA_DragonTalk_Main_4_15_00");	//��� ��� ����� ������ �������?
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_01");	//�� ��������� � ����� ������ � �������� ����� �������� �������� � ������� ��� ���� ������.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_02");	//���� �� �� ������ ���������� � ���� ���� �������, �������� �� �����������, �� ����� ����� ��� � �������� ��������� � ...
	AI_Output(other,self,"DIA_DragonTalk_Main_4_15_03");	//����� ������� ������. ������ ����� ���, ��� ��������� ��� ��������� ������� ��������.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_04");	//��-��-��. �� ����������� ����, ������ �����������. �� ����� ��� ���������, � ������ ����������� �� ���, � ������ �� �� ������ ���� ������������ ���������� ����� ������.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_05");	//���� ����� ������� ������ �� ������ ��� ����, �� ���� ����� ����������� � ����� ����� � ��������� ��, ����� ���� ��������� ���������� �� �������� ������.
	AI_Output(self,other,"DIA_DragonTalk_Main_4_20_06");	//��� ���, ��������, �� ��� �� ����� �������� �� ���� ���� �� ������� ������.
	Log_CreateTopic(TOPIC_BUCHHALLENVONIRDORATH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BUCHHALLENVONIRDORATH,LOG_RUNNING);
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"�������, ��� ���������� �������� ����� ��������� � �������� ����� ��������� �������� ��������. ���... ��� ���-�� ��������. � ��� � ����� � ���?");
	b_npc_isalivecheck(OLDWORLD_ZEN);
	DRAGONTALK_EXIT_FREE = TRUE;
};

func void b_assigndragontalk_main(var C_NPC slf)
{
	dia_dragontalk_main_1.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_2.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_3.npc = Hlp_GetInstanceID(slf);
	dia_dragontalk_main_4.npc = Hlp_GetInstanceID(slf);
};

