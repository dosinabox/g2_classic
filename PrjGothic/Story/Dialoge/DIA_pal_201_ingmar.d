
instance DIA_INGMAR_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_exit_condition;
	information = dia_ingmar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_ingmar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_HALLO(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 2;
	condition = dia_ingmar_hallo_condition;
	information = dia_ingmar_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


var int dia_ingmar_hallo_permanent;

func int dia_ingmar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_INGMAR_HALLO_PERMANENT == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_ingmar_hallo_info()
{
	if((ENTEROW_KAPITEL2 == FALSE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_00");	//�������� ���������� ���� ����������, ������ �������� - ������� �����.
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_01");	//���������� � ����� ����������, ������ ��� ������������ ����.
	}
	else if((MIS_OLDWORLD == LOG_SUCCESS) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_02");	//���������� � ������ �������� ����� �������� ����. �� �� ����������� ����, ����� ���������� ��� ��������� � �������� ����� ������ ������ ������ � �����.
		DIA_INGMAR_HALLO_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_Hallo_06_03");	//� �����, �� ������ ���������� � ������ �������. ��� ��� �� � ����.
	};
};


instance DIA_INGMAR_KRIEG(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 99;
	condition = dia_ingmar_krieg_condition;
	information = dia_ingmar_krieg_info;
	permanent = FALSE;
	description = "��� ���� �� ��������?";
};


func int dia_ingmar_krieg_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_ingmar_krieg_info()
{
	AI_Output(other,self,"DIA_Ingmar_Krieg_15_00");	//��� ���� �� ��������?
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_01");	//����� ��� �� ��������, ���� ����������� ������ ��� ������ �����.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_02");	//�� ������ ������ ����� ���������� �� �����, �� ���, ������� �������������� ���� �����.
	AI_Output(self,other,"DIA_Ingmar_Krieg_06_03");	//��� ��������� ��� �������� � ��� ����, � ������� � ����� ������ �� ����������� �������.
};


instance DIA_INGMAR_CANTEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 100;
	condition = dia_ingmar_canteach_condition;
	information = dia_ingmar_canteach_info;
	permanent = TRUE;
	description = "�� ������ ������� ����?";
};


func int dia_ingmar_canteach_condition()
{
	if(INGMAR_TEACHSTR == FALSE)
	{
		return TRUE;
	};
};

func void dia_ingmar_canteach_info()
{
	AI_Output(other,self,"DIA_Ingmar_CanTeach_15_00");	//�� ������ ������� ���� ����-������?
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_01");	//� ���� ������� ���� ��� ����� �������, ����� �� ��� ����������� ����������� ����� �������.
		INGMAR_TEACHSTR = TRUE;
		b_logentry(TOPIC_CITYTEACHER,"������� ������ ����� ������ ��� ����� �������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Ingmar_CanTeach_06_02");	//� ������ ������ �������������� ������ ������.
	};
};


instance DIA_INGMAR_TEACH(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 6;
	condition = dia_ingmar_teach_condition;
	information = dia_ingmar_teach_info;
	permanent = TRUE;
	description = "� ���� ����� �������.";
};


func int dia_ingmar_teach_condition()
{
	if(INGMAR_TEACHSTR == TRUE)
	{
		return TRUE;
	};
};

func void dia_ingmar_teach_info()
{
	AI_Output(other,self,"DIA_Ingmar_Teach_15_00");	//� ���� ����� �������.
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};

func void dia_ingmar_teach_back()
{
	if(other.attribute[ATR_STRENGTH] >= 90)
	{
		AI_Output(self,other,"DIA_Ingmar_Teach_06_00");	//�� � ��� ����� ��� ������. ��� ������ ����� ����.
	};
	Info_ClearChoices(dia_ingmar_teach);
};

func void dia_ingmar_teach_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,90);
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};

func void dia_ingmar_teach_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,90);
	Info_ClearChoices(dia_ingmar_teach);
	Info_AddChoice(dia_ingmar_teach,DIALOG_BACK,dia_ingmar_teach_back);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ingmar_teach_1);
	Info_AddChoice(dia_ingmar_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ingmar_teach_5);
};


instance DIA_INGMAR_KAP3_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap3_exit_condition;
	information = dia_ingmar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_KAP4_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap4_exit_condition;
	information = dia_ingmar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_ORKELITE(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 40;
	condition = dia_ingmar_orkelite_condition;
	information = dia_ingmar_orkelite_info;
	description = "���� ������� ������������� �����������.";
};


func int dia_ingmar_orkelite_condition()
{
	if(((TALKEDTO_ANTIPALADIN == TRUE) || Npc_HasItems(other,itri_orcelitering) || (HAGEN_SAWORCRING == TRUE)) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_ingmar_orkelite_info()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_00");	//���� ������� ������������� �����������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_01");	//�� ��? ��� �, ��� ����� ���������. � ������ ���� ��� ��������?
	if(TALKEDTO_ANTIPALADIN == TRUE)
	{
		AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_02");	//� ������� � ����.
	};
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_15_03");	//�� ������ ��������� � ���� ���������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_06_04");	//���. ��� �� ������ �� �������� ��������� �����.
	Info_ClearChoices(dia_ingmar_orkelite);
	Info_AddChoice(dia_ingmar_orkelite,"���� ����� ����� ������ �������� ��� �� ���.",dia_ingmar_orkelite_loswerden);
	Info_AddChoice(dia_ingmar_orkelite,"��� ��� ������ ������?",dia_ingmar_orkelite_wastun);
	Info_AddChoice(dia_ingmar_orkelite,"��� ��� ������?",dia_ingmar_orkelite_wieso);
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"������ ��� ����� ������������� �������� �� ������� ������ �����.");
	MIS_KILLORKOBERST = LOG_RUNNING;
};

func void dia_ingmar_orkelite_loswerden()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_loswerden_15_00");	//���� ����� ����� ������ �������� ��� �� ���.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_loswerden_06_01");	//���� �� �������, ���� �� � ��� ���� ����� ��������� ����������. � ����� ����-������ ��������� �����������.
	Info_ClearChoices(dia_ingmar_orkelite);
};

func void dia_ingmar_orkelite_wieso()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wieso_15_00");	//��� ��� ������?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_01");	//���� ��, ��� �� ��������, ������, ��� ��������, ��� ��� �������� �������� ��� �������, ������ ���� ������ ������� �������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_02");	//������ ������ ���� ����� ����������� ���� ������������. ������ ����� ����� ��������� ����� ��� ������ ������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_03");	//�� ��� ���� �������. �� ������ - ���� �� ��������� ���������, � ������ �������� �������� �������-������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wieso_06_04");	//������� ����� ������ ����������� � ����-������ �� ���, �� ���������� ����� ���� �� ����� ��� �� 30 ������.
	b_logentry(TOPIC_ORCELITE,"������ ������, ���-�� � ����� ������������� �����.");
};

func void dia_ingmar_orkelite_wastun()
{
	AI_Output(other,self,"DIA_Ingmar_ORKELITE_wasTun_15_00");	//��� ��� ������ ������?
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_01");	//����� ��� ����������� � ����� ����������, ��� ������ ������������ ������, ������������� ������� �� ������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_02");	//���� ������������������ ������������ ���������� ���� ����-�������� � ����� �� �����, ������ ���������� ���� ������ � ���.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_03");	//���� �� �� ������ ��������� �� ����� ������������� �����, �� �������� �� �������� ������������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_04");	//������������ ����� ������ ������������ ���������� � ���������������� �������� �� ����� ������. � �� ����������� �������� ��� ������ ���-������ ���������� �� ������.
	AI_Output(self,other,"DIA_Ingmar_ORKELITE_wasTun_06_05");	//��������� ����� ���� �������� � ����� �������. ����� ����, ���� ����������� ������ ������ ������ ������?
	b_logentry(TOPIC_ORCELITE,"�������� �������, � ������ ����� ���������� ����� � ������ ���-�� ���������� �� ����� �������. ������ �����, ����� � ����� � ���� ���.");
	Info_ClearChoices(dia_ingmar_orkelite);
};


instance DIA_INGMAR_HAUPTQUARTIER(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 41;
	condition = dia_ingmar_hauptquartier_condition;
	information = dia_ingmar_hauptquartier_info;
	permanent = FALSE;
	description = "� ���� ����� ����-�������� �����.";
};


func int dia_ingmar_hauptquartier_condition()
{
	if(Npc_IsDead(orkelite_antipaladinorkoberst) && Npc_KnowsInfo(other,dia_ingmar_orkelite))
	{
		return TRUE;
	};
};

func void dia_ingmar_hauptquartier_info()
{
	AI_Output(other,self,"DIA_Ingmar_HAUPTQUARTIER_15_00");	//� ���� ����� ����-�������� �����. �� ������������ ���.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_01");	//��� �������� �������. ������ ���� ��������� ����� ����� ��������� � �������������.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_02");	//��� �������. ���� �� � ��� ���� �������� ������� ����� ����, �� ����� �������� ����� ����� ���� �� �� �����������.
	AI_Output(self,other,"DIA_Ingmar_HAUPTQUARTIER_06_03");	//���. ������ ��� ������. �������, ��� ������� ���� ������ ������� ����������.
	b_giveplayerxp(XP_KILLEDORKOBERST);
	CreateInvItems(self,itmi_gold,300);
	b_giveinvitems(self,other,itmi_gold,300);
	MIS_KILLORKOBERST = LOG_SUCCESS;
};


instance DIA_INGMAR_KAP5_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap5_exit_condition;
	information = dia_ingmar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_KAP6_EXIT(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 999;
	condition = dia_ingmar_kap6_exit_condition;
	information = dia_ingmar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ingmar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_ingmar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_INGMAR_PICKPOCKET(C_INFO)
{
	npc = pal_201_ingmar;
	nr = 900;
	condition = dia_ingmar_pickpocket_condition;
	information = dia_ingmar_pickpocket_info;
	permanent = TRUE;
	description = "(������� ���� ������ ����������� ����������)";
};


func int dia_ingmar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (105 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_ingmar_pickpocket_info()
{
	Info_ClearChoices(dia_ingmar_pickpocket);
	Info_AddChoice(dia_ingmar_pickpocket,DIALOG_BACK,dia_ingmar_pickpocket_back);
	Info_AddChoice(dia_ingmar_pickpocket,DIALOG_PICKPOCKET,dia_ingmar_pickpocket_doit);
};

func void dia_ingmar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 105)
	{
		b_giveinvitems(self,other,itwr_manowar,1);
		b_givethiefxp();
		Info_ClearChoices(dia_ingmar_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_ingmar_pickpocket_back()
{
	Info_ClearChoices(dia_ingmar_pickpocket);
};

