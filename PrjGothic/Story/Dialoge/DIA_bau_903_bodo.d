
instance DIA_BODO_EXIT(C_INFO)
{
	npc = bau_903_bodo;
	nr = 999;
	condition = dia_bodo_exit_condition;
	information = dia_bodo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bodo_exit_condition()
{
	return TRUE;
};

func void dia_bodo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BODO_HALLO(C_INFO)
{
	npc = bau_903_bodo;
	nr = 1;
	condition = dia_bodo_hallo_condition;
	information = dia_bodo_hallo_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_bodo_hallo_condition()
{
	return TRUE;
};

func void dia_bodo_hallo_info()
{
	AI_Output(other,self,"DIA_Bodo_Hallo_15_00");	//��� ����?
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_01");	//��������� ���������� ������ ����� �����. ������, ����� �� ����� ������� ��������, ��� �� ��������� ���� ���������� �����.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_02");	//������, ��������, ������, ��� ����� ��������� ���� ���. �� �� ������ �� ����� ������� ���!
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_03");	//������. ���� ������� ���������, ����� �� ������� ������.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_04");	//������. �� �������� � ����� �����.
	};
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Bodo_Hallo_12_05");	//����������� ������ �� ����� �� ���� �����.
		AI_Output(self,other,"DIA_Bodo_Hallo_12_06");	//������ �����, �������� �� ��������� ���������� � �����, �� ������������ ���� �� ���� �� ��������.
	};
};


instance DIA_BODO_BAUERNAUFSTAND(C_INFO)
{
	npc = bau_903_bodo;
	nr = 2;
	condition = dia_bodo_bauernaufstand_condition;
	information = dia_bodo_bauernaufstand_info;
	permanent = FALSE;
	description = "� ������ ������� � ��������� ��������!";
};


func int dia_bodo_bauernaufstand_condition()
{
	return TRUE;
};

func void dia_bodo_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Bodo_Bauernaufstand_15_00");	//� ������ ������� � ��������� ��������!
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_01");	//����. �� �� ������ ������ ������. ������ �������� ��, ��� ���������� ������� ������.
	AI_Output(self,other,"DIA_Bodo_Bauernaufstand_12_02");	//�������� ������, ��� ����� ������������ �� ������ ��������. �� ���� ������ �� ���������� ������ ������ � ��������, ��� ������ ���� ���� �����.
};


instance DIA_BODO_BETT(C_INFO)
{
	npc = bau_903_bodo;
	nr = 3;
	condition = dia_bodo_bett_condition;
	information = dia_bodo_bett_info;
	permanent = FALSE;
	description = "���� � ���-������ ����� ���������?";
};


func int dia_bodo_bett_condition()
{
	return TRUE;
};

func void dia_bodo_bett_info()
{
	AI_Output(other,self,"DIA_Bodo_Bett_15_00");	//���� � ���-������ ����� ���������?
	AI_Output(self,other,"DIA_Bodo_Bett_12_01");	//���� �� �����, ��� ����� �������, ��� � �����. �� ������ �� ������ �� ������ �� ������� ��������.
	AI_Output(self,other,"DIA_Bodo_Bett_12_02");	//���� ������, ����� ��� �� ������� ���, ��������, �� ��� �� �������� �������, �� ���������� �� �����. � ���� �������� ����� ������ ���, ��� ��������.
};


instance DIA_BODO_CIPHER(C_INFO)
{
	npc = bau_903_bodo;
	nr = 4;
	condition = dia_bodo_cipher_condition;
	information = dia_bodo_cipher_info;
	permanent = FALSE;
	description = "����� ������ ���, ��� ���-�� ����� � ���� ��� �������� �����...";
};


func int dia_bodo_cipher_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) || (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_bodo_cipher_info()
{
	AI_Output(other,self,"DIA_Bodo_Cipher_15_00");	//����� ������ ���, ��� ���-�� ����� � ���� ��� �������� �����...
	AI_Output(self,other,"DIA_Bodo_Cipher_12_01");	//�?
	AI_Output(other,self,"DIA_Bodo_Cipher_15_02");	//�� ������, ��� ��� ������ ��.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_03");	//��, ��� ������ ���� ������ ��� ����� ��� ������� �� ����.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_04");	//� �������� ���� � ��� ����������� ����������� ��������� �����, ������ ���, ������, ��� ����� ������ ��� �����.
	AI_Output(self,other,"DIA_Bodo_Cipher_12_05");	//�� � ������ �� ���� ��������. � �������� ��������� ���, � �� � ����� ������� ���, ��� ����� ����� ����� ����.
};


instance DIA_BODO_WEEDORELSE(C_INFO)
{
	npc = bau_903_bodo;
	nr = 5;
	condition = dia_bodo_weedorelse_condition;
	information = dia_bodo_weedorelse_info;
	permanent = FALSE;
	description = "����� ��� ��� ����� ���...";
};


func int dia_bodo_weedorelse_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bodo_cipher))
	{
		return TRUE;
	};
};

func void dia_bodo_weedorelse_info()
{
	AI_Output(other,self,"DIA_Bodo_WeedOrElse_15_00");	//����� ��� ��� ����� ���...
	AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_01");	//��������, ���, ��� � ���� ���� - ��� ���� ����� �� �������� �����. ������ ��� � ������ ���� � �����.
	b_giveinvitems(self,other,itmi_joint,1);
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_02");	//�� ������, ��� �������� ����� �������� ���, �?
		AI_Output(self,other,"DIA_Bodo_WeedOrElse_12_03");	//��� ��� ���� �� ������� ������� �����-������ ��������!
	};
};


instance DIA_BODO_WEEDPERM(C_INFO)
{
	npc = bau_903_bodo;
	nr = 6;
	condition = dia_bodo_weedperm_condition;
	information = dia_bodo_weedperm_info;
	permanent = TRUE;
	description = "� �� ���� �� ������ ������ �����. ����� ��� ��� �����!";
};


func int dia_bodo_weedperm_condition()
{
	if((MIS_CIPHER_BRINGWEED == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bodo_weedorelse))
	{
		return TRUE;
	};
};

func void dia_bodo_weedperm_info()
{
	AI_Output(other,self,"DIA_Bodo_WeedPERM_15_00");	//� �� ���� �� ������ ������ �����. ����� ��� ��� �����!
	AI_Output(self,other,"DIA_Bodo_WeedPERM_12_01");	//� ���� �� ���. ������.
};


instance DIA_BODO_PICKPOCKET(C_INFO)
{
	npc = bau_903_bodo;
	nr = 900;
	condition = dia_bodo_pickpocket_condition;
	information = dia_bodo_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bodo_pickpocket_condition()
{
	return c_beklauen(30,60);
};

func void dia_bodo_pickpocket_info()
{
	Info_ClearChoices(dia_bodo_pickpocket);
	Info_AddChoice(dia_bodo_pickpocket,DIALOG_BACK,dia_bodo_pickpocket_back);
	Info_AddChoice(dia_bodo_pickpocket,DIALOG_PICKPOCKET,dia_bodo_pickpocket_doit);
};

func void dia_bodo_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bodo_pickpocket);
};

func void dia_bodo_pickpocket_back()
{
	Info_ClearChoices(dia_bodo_pickpocket);
};

