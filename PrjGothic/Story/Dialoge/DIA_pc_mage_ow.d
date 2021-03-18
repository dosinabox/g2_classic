
instance DIA_MILTENOW_EXIT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 999;
	condition = dia_miltenow_exit_condition;
	information = dia_miltenow_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_miltenow_exit_condition()
{
	return TRUE;
};

func void dia_miltenow_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTENOW_HELLO(C_INFO)
{
	npc = pc_mage_ow;
	nr = TRUE;
	condition = dia_miltenow_hello_condition;
	information = dia_miltenow_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_miltenow_hello_condition()
{
	return TRUE;
};

func void dia_miltenow_hello_info()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_03_00");	//����������, ��� ��������! ��� ����� ��-�� �������!
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"��� ������ ����, ������.",dia_miltenow_hello_yes);
	Info_AddChoice(dia_miltenow_hello,"� ���� ����?",dia_miltenow_hello_no);
};

func void b_milten_gorndiegolester()
{
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_02");	//�� ������� �����, ����� � �������?
};

func void dia_miltenow_hello_yes()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_YES_15_00");	//��� ������ ����, ������. �� ��� ��� ����� ��� ����� �����?
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_01");	//�����. ����� ���� ��� ������ ������, � ������� � ��������� ����� ����.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_02");	//�� ����� ����� ����, ��� �������� ����� ����������� ����, ��� ���� � ������ ���� ���� ��������� ������ ���������.
	AI_Output(self,other,"DIA_MiltenOW_Hello_YES_03_03");	//������� ���� ������ �������� ��� ��� ��������� ������ ����������� ���������� ��������� ����������.
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"������� ��, � ����� ������.",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"��� ����� �� � ��� ��� �� �������.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_no()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_NO_15_00");	//� ������ ����� ��?
	AI_Output(self,other,"DIA_MiltenOW_Hello_NO_03_01");	//�� ����� ������ ������, ��?
	b_milten_gorndiegolester();
	Info_ClearChoices(dia_miltenow_hello);
	Info_AddChoice(dia_miltenow_hello,"��� ����� ������� ����?",dia_miltenow_hello_friends);
	Info_AddChoice(dia_miltenow_hello,"��� ����� �� � ��� ��� �� �������.",dia_miltenow_hello_forget);
};

func void dia_miltenow_hello_friends()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_00");	//������� ��, � ����� ������.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_01");	//��, ���� � ����� �� ���� ������. �� ��������� �������� �����, � ������.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_02");	//������ �����, ������� - � � ������� �� ����, ��� �� ������ ���������.
	if(Npc_KnowsInfo(other,dia_lester_hello))
	{
		AI_Output(other,self,"DIA_MiltenOW_Hello_Friends_15_03");	//� �������� ������� - �� ������ � ���������.
		AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_04");	//��, ���� �����-�� ������� �������.
	};
	AI_Output(self,other,"DIA_MiltenOW_Hello_Friends_03_05");	//��, � � ���� ��� ������ ��������.
	KNOWS_DIEGO = TRUE;
	Info_ClearChoices(dia_miltenow_hello);
};

func void dia_miltenow_hello_forget()
{
	AI_Output(other,self,"DIA_MiltenOW_Hello_Forget_15_00");	//��� ����� �� � ��� ��� �� �������.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_01");	//�� ������ �����, ��? ��� �, ������� ������� � ����� � �������� ���� ����� �������� ����.
	AI_Output(self,other,"DIA_MiltenOW_Hello_Forget_03_02");	//���� � ���� � ��� �������� ��������.
	Info_ClearChoices(dia_miltenow_hello);
};


instance DIA_MILTENOW_BERICHT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 3;
	condition = dia_miltenow_bericht_condition;
	information = dia_miltenow_bericht_info;
	permanent = FALSE;
	description = "��� ����� ������� ����?";
};


func int dia_miltenow_bericht_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_hello))
	{
		return TRUE;
	};
};

func void dia_miltenow_bericht_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Bericht_15_00");	//��� ����� ������� ����?
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_01");	//�������� ������ ����, ����� �������� ���������� ����.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_02");	//�� ��-�� ���� ���� ��������� �������� � ����� � ����������, ��� �������� ����� ������ � �����.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_03");	//���, ������� ������� - � �������� ����������� ����-�� �������... ������-�� ���, ��� ������������ �����. ���-��, ������ ����������� �� ���� ������.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_04");	//�� ��������� ������� ���� �� ����������� �������. ���������� ������� �������� � ��� �����.
	AI_Output(self,other,"DIA_MiltenOW_Bericht_03_05");	//�� ����� ������� ���� ��������������, ���� ��� ������� �������� ��� ���.
};


instance DIA_MILTENOW_ERZ(C_INFO)
{
	npc = pc_mage_ow;
	nr = 4;
	condition = dia_miltenow_erz_condition;
	information = dia_miltenow_erz_info;
	permanent = FALSE;
	description = "������� ���� ������� ������?";
};


func int dia_miltenow_erz_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_bericht))
	{
		return TRUE;
	};
};

func void dia_miltenow_erz_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Erz_15_00");	//������� ���� ������� ������?
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_01");	//������� ����?.. �� ������ �����! � ��� ��� ����� ��� ������ �� ����������.
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_02");	//� �� ��������, ���� ��� ��� ����� ������. � ��� ������� ������� � �������� ����!
	AI_Output(self,other,"DIA_MiltenOW_Erz_03_03");	//��� ���������� ���������� ������ ��������.
};


instance DIA_MILTENOW_WO(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_wo_condition;
	information = dia_miltenow_wo_info;
	permanent = FALSE;
	description = "� ��� ������ ���� � �����?";
};


func int dia_miltenow_wo_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_hello) && (KNOWS_DIEGO == TRUE))
	{
		return TRUE;
	};
};

func void dia_miltenow_wo_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Wo_Forget_15_00");	//� ��� ������ ���� � �����?
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_01");	//��, ���� ����� �����, � �������, �� ��, ��� ������������� ������.
	AI_Output(self,other,"DIA_MiltenOW_Wo_Forget_03_02");	//����� ���������� � ������ ����������. ������ �������� ���������, �� ��������� ���� �����.
	KNOWSABOUTGORN = TRUE;
	SEARCHFORDIEGO = LOG_RUNNING;
};


instance DIA_MILTENOW_GORN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_gorn_condition;
	information = dia_miltenow_gorn_info;
	permanent = FALSE;
	description = "������, ��������� �����!";
};


func int dia_miltenow_gorn_condition()
{
	if((KNOWSABOUTGORN == TRUE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_gorn_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_00");	//������, ��������� �����!
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_01");	//��... �������� ����������� � ���, ��� ���� - ���������� �����������.
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_02");	//�� ���� ��� �������, ������ ���������� �� ������ � �� ������ ������ ����� �������.
	AI_Output(other,self,"DIA_MiltenOW_Gorn_15_03");	//��, ����� ����...
	AI_Output(self,other,"DIA_MiltenOW_Gorn_03_04");	//����� ���� � �����.
	Log_CreateTopic(TOPIC_RESCUEGORN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEGORN,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEGORN,"����������� ������ ������� ����� � ������. ��������, � ��� ����� ������������ � ��� ������� �������� �������.");
};


instance DIA_MILTENOW_PREIS(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_preis_condition;
	information = dia_miltenow_preis_info;
	permanent = FALSE;
	description = "������ ����� 1000 ������� ����� �� �����.";
};


func int dia_miltenow_preis_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_preis_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Preis_15_00");	//������ ����� 1000 ������� ����� �� �����.
	AI_Output(self,other,"DIA_MiltenOW_Preis_03_01");	//����������� �����. � ���� ������������ 250 �����.
	b_giveinvitems(self,other,itmi_gold,250);
	b_logentry(TOPIC_RESCUEGORN,"������ ��� ��� 250 ������, ����� � �������� �� ������������ �����.");
};


instance DIA_MILTENOW_MEHR(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_mehr_condition;
	information = dia_miltenow_mehr_info;
	permanent = FALSE;
	description = "��� ����� ������ ������, ����� ������ ������� �����.";
};


func int dia_miltenow_mehr_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2) && (Npc_HasItems(other,itmi_gold) < 1000) && Npc_KnowsInfo(other,dia_miltenow_preis))
	{
		return TRUE;
	};
};

func void dia_miltenow_mehr_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mehr_15_00");	//��� ����� ������ ������, ����� ������ ������� �����.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_01");	//������ ��� ������... ��, ����� ��� �� ������, �� ��� ����� ���.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_02");	//�����, ���� ��������� ���-������ ������ ��� ����. ����� �������� ���.
	AI_Output(self,other,"DIA_MiltenOW_Mehr_03_03");	//� ������ ��� ������� - ���, �������� �������� �� � �������.
	b_giveinvitems(self,other,itwr_letterforgorn_mis,1);
	b_logentry(TOPIC_RESCUEGORN,"������ ��� ��� ������� ��� �����. ���� � ����� ���������� � ������, ��������, ���� ������ ��������, �� ��������� �� �� ���-������ ������� ������.");
};


instance DIA_MILTENOW_EQUIPMENT(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_equipment_condition;
	information = dia_miltenow_equipment_info;
	permanent = FALSE;
	description = "�� ������ ���������� ���� �����������?";
};


func int dia_miltenow_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_equipment) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_miltenow_equipment_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Equipmentt_15_00");	//�� ������ ���������� ���� �����������? ������ �������� ���� ����������� � �����.
	AI_Output(self,other,"DIA_MiltenOW_Equipment_03_01");	//� ��� �, ��-������, ������ ���? ������������, ��� � ���� ���� ����, - ��� ������ ������ ������.
	b_giveinvitems(self,other,itmi_runeblank,1);
};


instance DIA_MILTENOW_VERSTECK(C_INFO)
{
	npc = pc_mage_ow;
	nr = 1;
	condition = dia_miltenow_versteck_condition;
	information = dia_miltenow_versteck_info;
	permanent = FALSE;
	important = FALSE;
	description = "� ������� ����� �� �����...";
};


func int dia_miltenow_versteck_condition()
{
	if((GORNSTREASURE == TRUE) && (Npc_HasItems(other,itmi_gornstreasure_mis) <= 0) && (GORNS_BEUTEL == FALSE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_versteck_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_00");	//� ������� ����� �� �����. �� �������, ��� ��� ������ ��������� � ����� �����.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_01");	//(� �������) ������ ����� �����, �� ������ �������. ������ ��������� �� � ���������.
	AI_Output(other,self,"DIA_MiltenOW_Versteck_15_02");	//��� ��� ��������� ����?
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_03");	//��� ���������� �� ������ �����. ����� ������ ���� ������ �� ����.
	AI_Output(self,other,"DIA_MiltenOW_Versteck_03_04");	//��� ����� �������� - ��� ��� ���������� ������� ��� ��������� � �� ��������� �������� �����.
	b_logentry(TOPIC_RESCUEGORN,"������ ����� ������ ��������� ������ �� ������ �����. ������ ����� �������� ���-�� ���.");
};


instance DIA_MILTENOW_FREI(C_INFO)
{
	npc = pc_mage_ow;
	nr = 5;
	condition = dia_miltenow_frei_condition;
	information = dia_miltenow_frei_info;
	permanent = FALSE;
	description = "� ��������� �����.";
};


func int dia_miltenow_frei_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_frei_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Frei_15_00");	//� ��������� �����.
	AI_Output(self,other,"DIA_MiltenOW_Frei_03_01");	//������. ������ �� ����� �������� � ���, ��� ������ ������.
};


instance DIA_MILTENOW_LEHREN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 9;
	condition = dia_miltenow_lehren_condition;
	information = dia_miltenow_lehren_info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_miltenow_lehren_condition()
{
	if((other.guild == GIL_KDF) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_lehren_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Lehren_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_01");	//� ���� ������� ���� ����� �� ������� �����, ��� � ���� ������ �������� ���� ���������� �������.
	AI_Output(self,other,"DIA_MiltenOW_Lehren_03_02");	//���� �� ����� �������� ���� �������, � ���� ������� ����.
};


instance DIA_MILTENOW_TEACHCIRCLE2(C_INFO)
{
	npc = pc_mage_ow;
	nr = 91;
	condition = dia_miltenow_teachcircle2_condition;
	information = dia_miltenow_teachcircle2_info;
	permanent = TRUE;
	description = "����� ���� ������� ����� �����!";
};


func int dia_miltenow_teachcircle2_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (Npc_GetTalentSkill(other,NPC_TALENT_MAGE) < 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_teachcircle2_info()
{
	AI_Output(other,self,"DIA_Milten_Add_15_00");	//����� ���� ������� ����� �����!
	AI_Output(self,other,"DIA_Milten_Add_03_01");	//��� ������ ���������� �������� ������ ������.
	AI_Output(self,other,"DIA_Milten_Add_03_02");	//�� � �����, ��� � ����� ������ �� ����� ������� ����������...
	if(b_teachmagiccircle(self,other,2))
	{
		AI_Output(self,other,"DIA_Milten_Add_03_03");	//� �� ������, ��� ����� ��� ��� ����������� � ������������� �����...
		AI_Output(self,other,"DIA_Milten_Add_03_04");	//����� �� ������ ����. �-�... �� ������� ���� �����������, �� ���� ���� ��������� ����..
		AI_Output(self,other,"DIA_Milten_Add_03_05");	//� �����, �� ���������, � ��� ��� ���...
	};
};


instance DIA_MILTENOW_TEACH(C_INFO)
{
	npc = pc_mage_ow;
	nr = 90;
	condition = dia_miltenow_teach_condition;
	information = dia_miltenow_teach_info;
	permanent = TRUE;
	description = "� ���� ������� ����� ����������.";
};


func int dia_miltenow_teach_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_teach_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Teach_15_00");	//� ���� ������� ����� ����������.
	if(Npc_GetTalentSkill(other,NPC_TALENT_MAGE) >= 2)
	{
		Info_ClearChoices(dia_miltenow_teach);
		Info_AddChoice(dia_miltenow_teach,DIALOG_BACK,dia_miltenow_teach_back);
		if(PLAYER_TALENT_RUNES[SPL_WINDFIST] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_WINDFIST,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_miltenow_teach_windfist);
		};
		if(PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_INSTANTFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_miltenow_teach_feuerball);
		};
		if(PLAYER_TALENT_RUNES[SPL_ICEBOLT] == FALSE)
		{
			Info_AddChoice(dia_miltenow_teach,b_buildlearnstring(NAME_SPL_ICEBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_miltenow_teach_eispfeil);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_MiltenOW_Teach_03_01");	//�� ��� ��� �� ������ ������� ����� �����. � ������ �� ���� ������� ����.
	};
};

func void dia_miltenow_teach_back()
{
	Info_ClearChoices(dia_miltenow_teach);
};

func void dia_miltenow_teach_windfist()
{
	b_teachplayertalentrunes(self,other,SPL_WINDFIST);
};

func void dia_miltenow_teach_feuerball()
{
	b_teachplayertalentrunes(self,other,SPL_INSTANTFIREBALL);
};

func void dia_miltenow_teach_eispfeil()
{
	b_teachplayertalentrunes(self,other,SPL_ICEBOLT);
};


instance DIA_MILTENOW_MANA(C_INFO)
{
	npc = pc_mage_ow;
	nr = 100;
	condition = dia_miltenow_mana_condition;
	information = dia_miltenow_mana_info;
	permanent = TRUE;
	description = "� ���� �������� ��� ���������� �����������.";
};


func int dia_miltenow_mana_condition()
{
	if((other.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_miltenow_lehren) && (other.attribute[ATR_MANA_MAX] < 100) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_miltenow_mana_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Mana_15_00");	//� ���� �������� ��� ���������� �����������
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};

func void dia_miltenow_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 100)
	{
		AI_Output(self,other,"DIA_MiltenOW_Mana_03_00");	//���� ���������� ������� ������. ������� ������, ����� � ��� ��������� ��.
	};
	Info_ClearChoices(dia_miltenow_mana);
};

func void dia_miltenow_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,100);
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};

func void dia_miltenow_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,100);
	Info_ClearChoices(dia_miltenow_mana);
	Info_AddChoice(dia_miltenow_mana,DIALOG_BACK,dia_miltenow_mana_back);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_miltenow_mana_1);
	Info_AddChoice(dia_miltenow_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_miltenow_mana_5);
};


instance DIA_MILTENOW_PERM(C_INFO)
{
	npc = pc_mage_ow;
	nr = 101;
	condition = dia_miltenow_perm_condition;
	information = dia_miltenow_perm_info;
	permanent = TRUE;
	description = "� ����� � ���� ����� �����������?";
};


func int dia_miltenow_perm_condition()
{
	if((KAPITEL == 2) && (Npc_KnowsInfo(other,dia_miltenow_frei) == FALSE))
	{
		return TRUE;
	};
};

func void dia_miltenow_perm_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Perm_15_00");	//� ����� � ���� ����� �����������?
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_01");	//����������, � ������ ��� ��������� ���������� ����. �� ��� ����� ����� �������� ��� � ����.
	AI_Output(self,other,"DIA_MiltenOW_Perm_03_02");	//� ������ � �������������� �� �������� �������.
};


instance DIA_MILTENOW_PLAN(C_INFO)
{
	npc = pc_mage_ow;
	nr = 101;
	condition = dia_miltenow_plan_condition;
	information = dia_miltenow_plan_info;
	permanent = TRUE;
	description = "��� �� ���������� ������ ������?";
};


func int dia_miltenow_plan_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_miltenow_frei))
	{
		return TRUE;
	};
};

func void dia_miltenow_plan_info()
{
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_00");	//��� �� ���������� ������ ������?
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_01");	//� �������. ������� ��� �������, � ������, ����� ���� ��������, � ���� ����������� � ���� ������ � ���.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_02");	//������ �����, ����� ������� ����� � �������� �����.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_03");	//��, ���� �� ��� ��������.
	AI_Output(self,other,"DIA_MiltenOW_Plan_03_04");	//� �������, ��� ���� ����� ������, ����� ������ ������� �� ���� ������. �� ������� ������, ��� ����������, ���� ���� ������� ����� ������.
	AI_Output(other,self,"DIA_MiltenOW_Plan_15_05");	//��, ����� �������� �����������.
};


instance DIA_MILTENOW_PICKPOCKET(C_INFO)
{
	npc = pc_mage_ow;
	nr = 888;
	condition = dia_miltenow_pickpocket_condition;
	information = dia_miltenow_pickpocket_info;
	permanent = TRUE;
	description = "(������� ��� ����� ����� ������)";
};


func int dia_miltenow_pickpocket_condition()
{
	if((self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == TRUE) && (other.attribute[ATR_DEXTERITY] >= (80 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_miltenow_pickpocket_info()
{
	Info_ClearChoices(dia_miltenow_pickpocket);
	Info_AddChoice(dia_miltenow_pickpocket,DIALOG_BACK,dia_miltenow_pickpocket_back);
	Info_AddChoice(dia_miltenow_pickpocket,DIALOG_PICKPOCKET,dia_miltenow_pickpocket_doit);
};

func void dia_miltenow_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 80)
	{
		CreateInvItems(self,itpo_perm_mana,1);
		b_giveinvitems(self,other,itpo_perm_mana,1);
		b_givethiefxp();
		Info_ClearChoices(dia_miltenow_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_miltenow_pickpocket_back()
{
	Info_ClearChoices(dia_miltenow_pickpocket);
};

