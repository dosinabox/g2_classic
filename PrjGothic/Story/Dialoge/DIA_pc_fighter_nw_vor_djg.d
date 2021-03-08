
instance DIA_GORNNW_KAP3_EXIT(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 999;
	condition = dia_gornnw_kap3_exit_condition;
	information = dia_gornnw_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gornnw_kap3_exit_condition()
{
	return TRUE;
};

func void dia_gornnw_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GORNNW_HALLO(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 1;
	condition = dia_gornnw_hallo_condition;
	information = dia_gornnw_hallo_info;
	permanent = FALSE;
	description = "� ����� ��� � �������?";
};


func int dia_gornnw_hallo_condition()
{
	return TRUE;
};

func void dia_gornnw_hallo_info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_00");	//� ����� ��� � �������?
	if(MIS_RESCUEGORN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_01");	//�� ���� ����, ������.
		AI_Output(self,other,"DIA_GornNW_Add_12_02");	//� ������� �� ������ �����.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_GornNW_Add_12_03");	//������ ������� ����.
		AI_Output(self,other,"DIA_GornNW_Add_12_04");	//� ������� �� ������ �����.
	};
};


instance DIA_GORNNW_WHATNEXT(C_INFO)
{
	npc = pc_fighter_nw_vor_djg;
	nr = 1;
	condition = dia_gornnw_whatnext_condition;
	information = dia_gornnw_whatnext_info;
	permanent = TRUE;
	description = "��� �� ����������� ������ ������?";
};


func int dia_gornnw_whatnext_condition()
{
	return TRUE;
};

func void dia_gornnw_whatnext_info()
{
	AI_Output(other,self,"DIA_GornNW_Add_15_05");	//��� �� ����������� ������ ������?
	AI_Output(self,other,"DIA_GornNW_Add_12_06");	//������� � �������.
	AI_Output(other,self,"DIA_GornNW_Add_15_07");	//� �����?
	AI_Output(self,other,"DIA_GornNW_Add_12_08");	//��� �����... ��������, � ����� ������� � �������.
	AI_Output(self,other,"DIA_GornNW_Add_12_09");	//���-�� ���� ������ ������������� �� ������ - ����� ��� ����� ��������� � ��� �� ������ ��� ������� ��������������.
};

