
instance DIA_DRAGON_UNDEAD_EXIT(C_INFO)
{
	npc = dragon_undead;
	nr = 999;
	condition = dia_dragon_undead_exit_condition;
	information = dia_dragon_undead_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_undead_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_undead_exit_info()
{
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_UNDEAD_HELLO(C_INFO)
{
	npc = dragon_undead;
	nr = 5;
	condition = dia_dragon_undead_hello_condition;
	information = dia_dragon_undead_hello_info;
	important = TRUE;
};


func int dia_dragon_undead_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_undead_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_00");	//���� ���-���� ������� ����� ����. � ����� ���� ������ �������.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_15_01");	//�� �����. �� ���, ��� �� ��� ��� ����������.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_02");	//(������ �������) ��� �� ������ � ���� ����������?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_03");	//����� � �� ������ � ���� ������, ����� ������� ���� �� ��� ����?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_04");	//����� � �� �������� ����� � ���� �����������, ����� �����, ��� �� �� ��� �� �������� ��?
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_05");	//� ����� �������� ����, �� ������� ������� ���� �������, �� ������� ���� ��������� �� ����?
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_06");	//����� ���������� �������� ���� ������������� �������� ��� ����, ����� ������ ����, ����������� ���?
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_07");	//����� ��������� �� ������ ������� ���� ������������� �������� ��� ����, ����� ������ ����, ����������� ���?
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_20_08");	//��� �� �� �� �������������, �� �� ������ ��������� �� ���� ����.
	Info_AddChoice(dia_dragon_undead_hello,"������ �������.",dia_dragon_undead_hello_attack);
	Info_AddChoice(dia_dragon_undead_hello,"�� ����� ��������� �� ������ ����� ����������� �� ����� ������ ������������?",dia_dragon_undead_hello_auftraggeber);
	Info_AddChoice(dia_dragon_undead_hello,"����� �� �����?",dia_dragon_undead_hello_warum);
	Info_AddChoice(dia_dragon_undead_hello,"��� ��?",dia_dragon_undead_hello_wer);
	b_logentry(TOPIC_HALLENVONIRDORATH,"������ ��� ���� - ������-������. � ������ ����� ���, ������ ��� ����� �������� ���� ��������� ������.");
};

func void dia_dragon_undead_hello_wer()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_01");	//(�������) �� ��� �� ����� �������� ���� ������? ����� ������ ����, ������. �� �������, ��� �.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_02");	//� ���� ��� �����. ��� ��, ��� ��� ����� � � ����.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_03");	//���� ���������� ��� ���� ������������ ����. ����� ��� �� �������� �����, ������ ���� ����� �����.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_04");	//��� ������ - ����������� ����� ����.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_05");	//��� ��, ��� ���� ������ ������������ �������� � ������������� ��������.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_06");	//��� ��, ��� ���� ���� ����� ������ ������������ ���������, ������� �� ��������.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_07");	//��� ��, ��� ���� ������ - ������������� ���� � ������, ��� ����.
	};
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_08");	//����� �� �� �������� �����, ������� ��������� ���? ��. �� ������ ��� �.
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_09");	//(��������) ���. ����� �� ����� ����. ������� ������ �������...
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_10");	//������� ����, � �� ������������ ������ ��� ����. �� ���� ������� ������������� ���.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_wer_20_11");	//��� ��������������. ������ ����� ������� ���� ������.
};

func void dia_dragon_undead_hello_warum()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_warum_15_00");	//����� �� �����?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_01");	//��������������, ���������� ���, ����������� ���� ��������� ���� ��� � ���� ����������.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_warum_20_02");	//������ ����� ��������� ����� ����������� �����, ����� �, �������, ����� �����.
};

func void dia_dragon_undead_hello_auftraggeber()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_Auftraggeber_15_00");	//�� ����� ��������� �� ������ ����� ����������� �� ����� ������ ������������?
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_01");	//��� ������ - ������� ����. �� ������ ���. �� ������ ������� ��� ���.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_Auftraggeber_20_03");	//��� ����� ���������� ��-��� ����� � ��� ������ �� ����� � ������� ���� ��� �������� ����.
};

func void dia_dragon_undead_hello_attack()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_attack_15_00");	//������ �������. � ������ ���� ������� ��� ������, ��-��� �������� �� �����, ������.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_01");	//(�������) �� ��� �� ����� �������� ����. �����-�� ��������� �������� ���� �� ���������� ���� ����.
	AI_Output(self,other,"DIA_Dragon_Undead_Hello_attack_20_02");	//���� ����� ������� ��� ��������� ����� ������ � ���� ���.
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};

