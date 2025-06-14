
instance DIA_NAME_BANDIT_EXIT(C_INFO)
{
	npc = bdt_1025_bandit_h;
	nr = 999;
	condition = dia_name_bandit_exit_condition;
	information = dia_name_bandit_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_name_bandit_exit_condition()
{
	return TRUE;
};

func void dia_name_bandit_exit_info()
{
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,"NW_FOREST_CAVE1_IN_01");
	AI_StopProcessInfos(self);
};


instance DIA_NAME_BANDIT_SCHAFBLEIBTHIER(C_INFO)
{
	npc = bdt_1025_bandit_h;
	nr = 30;
	condition = dia_name_bandit_schafbleibthier_condition;
	information = dia_name_bandit_schafbleibthier_info;
	important = TRUE;
};


func int dia_name_bandit_schafbleibthier_condition()
{
	return TRUE;
};

func void dia_name_bandit_schafbleibthier_info()
{
	AI_Output(self,other,"DIA_NAME_BANDIT_SCHAFBLEIBTHIER_09_00");	//�� ��, ������! �� ������ ���� �������� �� �� �����, �?
	if(MIS_AKIL_SCHAFDIEBE == 0)
	{
		AI_Output(other,self,"DIA_NAME_BANDIT_SCHAFBLEIBTHIER_15_01");	//�����? ����� �����?
		AI_Output(self,other,"DIA_NAME_BANDIT_SCHAFBLEIBTHIER_09_02");	//��� ������. � ������ ����������. ����� ���� ������ ������.
	};
};


instance DIA_NAME_BANDIT_SCHAFKLAU(C_INFO)
{
	npc = bdt_1025_bandit_h;
	nr = 30;
	condition = dia_name_bandit_schafklau_condition;
	information = dia_name_bandit_schafklau_info;
	important = TRUE;
};


func int dia_name_bandit_schafklau_condition()
{
	if(Npc_GetDistToWP(hero,"NW_FOREST_CAVE1_IN_01") < (hero.aivar[AIV_LASTDISTTOWP] - 50))
	{
		return TRUE;
	};
};

func void dia_name_bandit_schafklau_info()
{
	AI_Output(self,other,"DIA_NAME_BANDIT_SchafKlau_09_00");	//��! � � ����� ������.
	Info_AddChoice(dia_name_bandit_schafklau,DIALOG_ENDE,dia_name_bandit_schafklau_weiter);
};

func void dia_name_bandit_schafklau_weiter()
{
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	bdt_1025_bandit_h.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	bdt_1026_bandit_h.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};


instance DIA_NAME_BANDIT_RUECKDASSCHAFRAUS(C_INFO)
{
	npc = bdt_1025_bandit_h;
	nr = 30;
	condition = dia_name_bandit_rueckdasschafraus_condition;
	information = dia_name_bandit_rueckdasschafraus_info;
	permanent = TRUE;
	description = "�� ������ ���� � ������� �����.";
};


func int dia_name_bandit_rueckdasschafraus_condition()
{
	if((MIS_AKIL_SCHAFDIEBE == LOG_RUNNING) && (DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NOPERM == FALSE))
	{
		return TRUE;
	};
};


var int dia_name_bandit_rueckdasschafraus_noperm;

func void dia_name_bandit_rueckdasschafraus_info()
{
	AI_Output(other,self,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_15_00");	//�� ������ ���� � ������� �����.
	AI_Output(self,other,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_09_01");	//� ���? ��� �� ������ ������?
	Info_ClearChoices(dia_name_bandit_rueckdasschafraus);
	Info_AddChoice(dia_name_bandit_rueckdasschafraus,"������. � ����� ��� ��� ����� ����?",dia_name_bandit_rueckdasschafraus_nichts);
	Info_AddChoice(dia_name_bandit_rueckdasschafraus,"����� ��� ��� ����, ��� � ���� ��������.",dia_name_bandit_rueckdasschafraus_schaf);
};

func void dia_name_bandit_rueckdasschafraus_schaf()
{
	AI_Output(other,self,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf_15_00");	//����� ��� ��� ����, ��� � ���� ��������.
	AI_Output(self,other,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_schaf_09_01");	//����� ��������, ��������. ������ ���� �������� ��������.
	AI_StopProcessInfos(self);
	DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_NOPERM = TRUE;
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	bdt_1025_bandit_h.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	bdt_1026_bandit_h.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

func void dia_name_bandit_rueckdasschafraus_nichts()
{
	AI_Output(other,self,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts_15_00");	//������. � ����� ��� ��� ����� ����?
	AI_Output(self,other,"DIA_NAME_BANDIT_RUECKDASSCHAFRAUS_nichts_09_01");	//����� �� ����� � ���� �� ������. ����������!
	hero.aivar[AIV_LASTDISTTOWP] = Npc_GetDistToWP(hero,"NW_FOREST_CAVE1_IN_01");
	AI_StopProcessInfos(self);
};

