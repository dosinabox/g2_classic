
instance DIA_MIL_309_STADTWACHE_EXIT(C_INFO)
{
	npc = mil_309_stadtwache;
	nr = 999;
	condition = dia_mil_309_stadtwache_exit_condition;
	information = dia_mil_309_stadtwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_mil_309_stadtwache_exit_condition()
{
	return TRUE;
};

func void dia_mil_309_stadtwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MIL_309_STADTWACHE_HALLO(C_INFO)
{
	npc = mil_309_stadtwache;
	nr = 2;
	condition = dia_mil_309_stadtwache_hallo_condition;
	information = dia_mil_309_stadtwache_hallo_info;
	permanent = TRUE;
	description = "� ��� ����?";
};


func int dia_mil_309_stadtwache_hallo_condition()
{
	return TRUE;
};

func void dia_mil_309_stadtwache_hallo_info()
{
	AI_Output(other,self,"DIA_Mil_309_Stadtwache_Hallo_15_00");	//� ��� ����?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_01");	//��� � �������. �� �� ������ ���� ���������.
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIL_309_NEWS < 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_02");	//��������. �� �� ����� ���������� ���� � �����.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_03");	//�� � ��� ���� �����, � ���������� ���������.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_04");	//������� �������� �� ����� ���� ������� - ��� ������ ������� ������� ��������.
		MIL_309_NEWS = 1;
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == FALSE) && (MIL_309_NEWS == 1))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_05");	//����������� ����, ������ ������, �������!
	};
	if((stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIL_309_NEWS < 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_06");	//��������, �� ������ ����� ���������� � ������. �� ��� �� ��������, ��� �� ������ ������ ����� ���, ��� ���� �����������������.
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_07");	//���� �� �� ��������������� ������������ ������, �� ��������� ���� ����� �����!
		MIL_309_NEWS = 2;
	}
	else if((stadtwache_310.aivar[AIV_PASSGATE] == TRUE) && (MIL_309_NEWS == 2))
	{
		AI_Output(self,other,"DIA_Mil_309_Stadtwache_Hallo_06_08");	//����� - �������!
	};
	AI_StopProcessInfos(self);
};

