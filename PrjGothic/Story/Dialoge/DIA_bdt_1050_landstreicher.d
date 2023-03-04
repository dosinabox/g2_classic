
instance DIA_LANDSTREICHER_EXIT(C_INFO)
{
	npc = bdt_1050_landstreicher;
	nr = 999;
	condition = dia_landstreicher_exit_condition;
	information = dia_landstreicher_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_landstreicher_exit_condition()
{
	return TRUE;
};

func void dia_landstreicher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LANDSTREICHER_HALLO(C_INFO)
{
	npc = bdt_1050_landstreicher;
	nr = 5;
	condition = dia_landstreicher_hallo_condition;
	information = dia_landstreicher_hallo_info;
	important = TRUE;
};


func int dia_landstreicher_hallo_condition()
{
	return TRUE;
};

func void dia_landstreicher_hallo_info()
{
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_00");	//��� ����������?
	AI_Output(other,self,"DIA_Landstreicher_HALLO_15_01");	//��� �� ������ � ����?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_09_02");	//�� ��� ������ �����, ��� �������, ��� ����� ��������� �������� �����.
	Info_ClearChoices(dia_landstreicher_hallo);
	Info_AddChoice(dia_landstreicher_hallo,"��� ����� ����.",dia_landstreicher_hallo_weg);
	Info_AddChoice(dia_landstreicher_hallo,"� ���� ������ �������?",dia_landstreicher_hallo_wo);
	Info_AddChoice(dia_landstreicher_hallo,"� ��� ��� ���?",dia_landstreicher_hallo_wer);
};

func void dia_landstreicher_hallo_wo()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wo_15_00");	//� ���� ������ �������?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wo_09_01");	//��� ����. �����, ��� ��� ����� �������.
};

func void dia_landstreicher_hallo_wer()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_15_00");	//� ��� ��� ���?
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_01");	//�� ��� ����� �� ������ �� ���� ���������� ����������� �� ���������.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_02");	//������ ��������, ��� ������, ��, ��-�����, � ���� ������ �� ��� � ������� � �������.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_09_03");	//������ �������� �� �� �������� �������. � �� �� ����� ���� ��������� �� ����� ����� � ����� ������. (�������)
		Info_AddChoice(dia_landstreicher_hallo,"���������� ����. � ��� ��� ����������� � ���������.",dia_landstreicher_hallo_wer_vorsicht);
	};
};

func void dia_landstreicher_hallo_wer_vorsicht()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_15_00");	//���������� ����. � ��� ��� ����������� � ���������.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_01");	//(�������) �� ��, �������. ��� ��������� ���-���.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_09_02");	//������ �������. ������ � �����. �� ������� �������, �� ���� ����������� ����.
	Info_AddChoice(dia_landstreicher_hallo,"���-������ ������ ������� ���� ������� �������.",dia_landstreicher_hallo_wer_vorsicht_manieren);
};

func void dia_landstreicher_hallo_wer_vorsicht_manieren()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_15_00");	//���-������ ������ ������� ���� ������� �������.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_01");	//�����, �� ��������. �� ���� �� ��� �� ������ ���������, �� �����.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_wer_vorsicht_Manieren_09_02");	//������ ���, �� ��� ��, ����������, ��������.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_landstreicher_hallo_weg()
{
	AI_Output(other,self,"DIA_Landstreicher_HALLO_weg_15_00");	//��� ����� ����.
	AI_Output(self,other,"DIA_Landstreicher_HALLO_weg_09_01");	//��. ��� �������.
	AI_StopProcessInfos(self);
};


instance DIA_LANDSTREICHER_WASMACHSTDU(C_INFO)
{
	npc = bdt_1050_landstreicher;
	nr = 6;
	condition = dia_landstreicher_wasmachstdu_condition;
	information = dia_landstreicher_wasmachstdu_info;
	permanent = TRUE;
	description = "��� �� ������� �����?";
};


func int dia_landstreicher_wasmachstdu_condition()
{
	return TRUE;
};

func void dia_landstreicher_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Landstreicher_WASMACHSTDU_15_00");	//��� �� ������� �����?
	if(Npc_KnowsInfo(other,dia_landstreicher_hallo))
	{
		AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_01");	//�� ������� ������� ����� ��������, ���������.
	};
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_02");	//������ ������ ��������, � ������� �� ������� ������, � � �������� ���� ��� ���� �����.
	AI_Output(self,other,"DIA_Landstreicher_WASMACHSTDU_09_03");	//� � ��������� ������, ��� �� ���� ����.
	AI_StopProcessInfos(self);
};

