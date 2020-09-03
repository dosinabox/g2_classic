
instance DIA_GUNNAR_EXIT(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 999;
	condition = dia_gunnar_exit_condition;
	information = dia_gunnar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gunnar_exit_condition()
{
	return TRUE;
};

func void dia_gunnar_exit_info()
{
	AI_StopProcessInfos(self);
};


var int gunnar_hallogesagt;

instance DIA_GUNNAR_HALLO(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 1;
	condition = dia_gunnar_hallo_condition;
	information = dia_gunnar_hallo_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_gunnar_hallo_condition()
{
	return TRUE;
};

func void dia_gunnar_hallo_info()
{
	AI_Output(other,self,"DIA_Gunnar_Hallo_15_00");	//��� ����?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_01");	//� ��� ���, ��� ���� �������, ��� �������� ���������, ����� ��� ����� ���������.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_02");	//���� �����, � �������� ������ �� ������� �������� ����� �� ����, ������ �������� �����.
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_03");	//��� ������� �������� ��������...
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_04");	//��� �� ������ ���� �������, ��?
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_05");	//�� �������� � ����� �����!
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Gunnar_Hallo_10_06");	//����� �� ������ ����� �� ������.
	};
	GUNNAR_HALLOGESAGT = TRUE;
};


instance DIA_GUNNAR_EVERYWHERE(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 2;
	condition = dia_gunnar_everywhere_condition;
	information = dia_gunnar_everywhere_info;
	permanent = FALSE;
	description = "�������� �������� ��������?";
};


func int dia_gunnar_everywhere_condition()
{
	if(GUNNAR_HALLOGESAGT == TRUE)
	{
		return TRUE;
	};
};

func void dia_gunnar_everywhere_info()
{
	AI_Output(other,self,"DIA_Gunnar_Everywhere_15_00");	//�������� �������� ��������?
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_01");	//����������� �� ��� ������ �� �������.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_02");	//��� ���� ������ ��������� ������ � ���, ��� ���, ��������, ��������� �� �����.
	AI_Output(self,other,"DIA_Gunnar_Everywhere_10_03");	//� � ����� ����������, ��� ��������� �������� � ��� ���� ������ ����, ����� �������� ���������� ���!
};


instance DIA_GUNNAR_SOUTH(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 3;
	condition = dia_gunnar_south_condition;
	information = dia_gunnar_south_info;
	permanent = TRUE;
	description = "��� �� ������ � ��������� � ���?";
};


func int dia_gunnar_south_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_south_info()
{
	AI_Output(other,self,"DIA_Gunnar_South_15_00");	//��� �� ������ � ��������� � ���?
	AI_Output(self,other,"DIA_Gunnar_South_10_01");	//��������. ��������� ��� ��������, ��� ��������� ��� �� �����.
	AI_Output(self,other,"DIA_Gunnar_South_10_02");	//�� ���� - �������. �����, ��������, ����� � ��� ��������� ������ �������� �� ����...
};


instance DIA_GUNNAR_COLONY(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 4;
	condition = dia_gunnar_colony_condition;
	information = dia_gunnar_colony_info;
	permanent = TRUE;
	description = "� ��� ������ �� �������?";
};


func int dia_gunnar_colony_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_colony_info()
{
	AI_Output(other,self,"DIA_Gunnar_Colony_15_00");	//� ��� ������ �� �������?
	AI_Output(self,other,"DIA_Gunnar_Colony_10_01");	//�� � ��� ����. ������, ����, �������, ����� � ���-��� ���.
};


instance DIA_GUNNAR_BANDITS(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 5;
	condition = dia_gunnar_bandits_condition;
	information = dia_gunnar_bandits_info;
	permanent = TRUE;
	description = "� ��� ��� �� �������, � ������� �� ��������?";
};


func int dia_gunnar_bandits_condition()
{
	if(Npc_KnowsInfo(other,dia_gunnar_everywhere))
	{
		return TRUE;
	};
};

func void dia_gunnar_bandits_info()
{
	AI_Output(other,self,"DIA_Gunnar_Bandits_15_00");	//� ��� ��� �� �������, � ������� �� ��������?
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_01");	//�, ��� � ������ ���. ���� ������, � �� ������ ������ � ����.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_02");	//� ��� �� ���� ������ ��������� ���� � ������������ �������. ��� �������� �����-�� �������.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_03");	//��� ���� ���������� �� �������, ��� � ����������� ��������� �����.
	AI_Output(self,other,"DIA_Gunnar_Bandits_10_04");	//������������ ������� - ��� ��� ������ ����������� ����������. ��� ������� ����, ��� �������� ������� ������.
};


instance DIA_GUNNAR_PICKPOCKET(C_INFO)
{
	npc = bau_902_gunnar;
	nr = 900;
	condition = dia_gunnar_pickpocket_condition;
	information = dia_gunnar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_gunnar_pickpocket_condition()
{
	return c_beklauen(45,70);
};

func void dia_gunnar_pickpocket_info()
{
	Info_ClearChoices(dia_gunnar_pickpocket);
	Info_AddChoice(dia_gunnar_pickpocket,DIALOG_BACK,dia_gunnar_pickpocket_back);
	Info_AddChoice(dia_gunnar_pickpocket,DIALOG_PICKPOCKET,dia_gunnar_pickpocket_doit);
};

func void dia_gunnar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gunnar_pickpocket);
};

func void dia_gunnar_pickpocket_back()
{
	Info_ClearChoices(dia_gunnar_pickpocket);
};

