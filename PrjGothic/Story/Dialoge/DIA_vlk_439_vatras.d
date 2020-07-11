
var int vatras_schickeleuteweg;

instance DIA_VATRAS_EXIT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 999;
	condition = dia_vatras_exit_condition;
	information = dia_vatras_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vatras_exit_condition()
{
	return TRUE;
};

func void dia_vatras_exit_info()
{
	AI_StopProcessInfos(self);
	if(VATRAS_SCHICKELEUTEWEG == TRUE)
	{
		b_startotherroutine(vlk_455_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_454_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_428_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_450_buerger,"VATRASAWAY");
		b_startotherroutine(vlk_426_buergerin,"VATRASAWAY");
		b_startotherroutine(vlk_421_valentino,"VATRASAWAY");
		VATRAS_SCHICKELEUTEWEG = FALSE;
	};
};


instance DIA_VATRAS_PICKPOCKET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 900;
	condition = dia_vatras_pickpocket_condition;
	information = dia_vatras_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_vatras_pickpocket_condition()
{
	return c_beklauen(91,250);
};

func void dia_vatras_pickpocket_info()
{
	Info_ClearChoices(dia_vatras_pickpocket);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_BACK,dia_vatras_pickpocket_back);
	Info_AddChoice(dia_vatras_pickpocket,DIALOG_PICKPOCKET,dia_vatras_pickpocket_doit);
};

func void dia_vatras_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_vatras_pickpocket);
};

func void dia_vatras_pickpocket_back()
{
	Info_ClearChoices(dia_vatras_pickpocket);
};


instance DIA_VATRAS_GREET(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_greet_condition;
	information = dia_vatras_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_vatras_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_greet_info()
{
	AI_Output(self,other,"DIA_Vatras_GREET_05_00");	//�� �������� � ����� ������.
	AI_Output(other,self,"DIA_Vatras_GREET_15_01");	//��� ��?
	AI_Output(self,other,"DIA_Vatras_GREET_05_02");	//� ������, ����� �������, ������ ���������� ������������� � �������.
	AI_Output(self,other,"DIA_Vatras_GREET_05_03");	//��� � ���� ������� ��� ����?
};


instance DIA_VATRAS_INFLUENCE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 2;
	condition = dia_vatras_influence_condition;
	information = dia_vatras_influence_info;
	permanent = FALSE;
	description = "� ����� ������ �������������.";
};


func int dia_vatras_influence_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (PLAYER_ISAPPRENTICE == APP_NONE) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_vatras_influence_info()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_00");	//� ����� ������ �������������.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_01");	//������ � ������ ���� ���� ��� �������������, ���������?
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_02");	//� ���� ����� �������� ������ �� �������� � ������ ����� ������.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_03");	//� ���� ���� ���� �������������, ���������, �� � ������ �� ���� � ����. �������� ��� � ����.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_04");	//��� �� ������ �����?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_05");	//��, �� ������ ���������� ���, ������ �� ������ � ����� �� ������ � ���� �����.
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_15_06");	//� ���� ������ ��������� ��� ����� ���������.
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_05_07");	//��� �� ���������?
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"������ ������� ...",dia_vatras_influence_first_truth);
	Info_AddChoice(dia_vatras_influence,"����� ���������� ������� ����!",dia_vatras_influence_first_lie);
};

func void dia_vatras_influence_first_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_15_00");	//���� �� �������������, ���������� �������� �����, ������� ���������. ��� ����� ������������ ��������� ���� ������.
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_01");	//���� ��� ������������� ������, ������ �� ����� ����� �������. ��� ������ ���� ���?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_TRUTH_05_02");	//(���������) �������? �� �������� � ���������, ������� �� ���������� ������� ����������� ������ � ��������. ������ �� ������ ���?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"��, � ���-�� ������ �� ����...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_vatras_influence,"��� ������ �� ���� ��� ������� ...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = TRUE;
};

func void dia_vatras_influence_first_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_FIRST_LIE_15_00");	//����� ���������� ������� ����!
	if(VATRAS_FIRST == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_01");	//(�������) ���. � ��� ������ ���� ���?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_FIRST_LIE_05_02");	//������� ����, ��... ������ �� ������ ���?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"��, � ���-�� ������ �� ����...",dia_vatras_influence_second_lie);
	Info_AddChoice(dia_vatras_influence,"��� ������ �� ���� ��� ������� ...",dia_vatras_influence_second_truth);
	VATRAS_FIRST = 2;
};

func void dia_vatras_influence_second_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_15_00");	//��� ������ �� ���� ��� �������. �� ������ ���� ������������ ���������.
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_01");	//� ���� ����� �������� ��� ������� � ��������������� ������� �����. � �� ������ ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_TRUTH_05_02");	//���������... ��� �� ���... (���������) � �� ������ ����? � ��� �� �� ����� �����?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"� �������� ����������� � ��� ...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_vatras_influence,"� ������ ����������� ...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = TRUE;
};

func void dia_vatras_influence_second_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_SECOND_LIE_15_00");	//��, � ���-�� ������ �� ����...
	if(VATRAS_SECOND == 2)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_01");	//(�����������) �� ���� �� �������, ������ �� ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_SECOND_LIE_05_02");	//���. � ������� �� ������� ���� ���� ������ ����. ��� �� ����� ������?
	};
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"� �������� ����������� � ���...",dia_vatras_influence_third_lie);
	Info_AddChoice(dia_vatras_influence,"� ������ ����������� ...",dia_vatras_influence_third_truth);
	VATRAS_SECOND = 2;
};

func void dia_vatras_influence_third_truth()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_TRUTH_15_00");	//� ������ ����������� ������� ��������.
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"��� �� ���� ��� ���� �������������?",dia_vatras_influence_repeat);
	VATRAS_THIRD = TRUE;
};

func void dia_vatras_influence_third_lie()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_THIRD_LIE_15_00");	//� �������� ����������� � ���...
	Info_ClearChoices(dia_vatras_influence);
	Info_AddChoice(dia_vatras_influence,"��� �� ���� ��� ���� �������������?",dia_vatras_influence_repeat);
	VATRAS_THIRD = 2;
};

func void dia_vatras_influence_repeat()
{
	AI_Output(other,self,"DIA_Vatras_INFLUENCE_REPEAT_15_00");	//��� �� ���� ��� ���� �������������?
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_01");	//������, ����� ���������:
	if(VATRAS_THIRD == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_02");	//�� ������ �����������...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_03");	//�� �������� ����������� � ���...
	};
	if(VATRAS_SECOND == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_04");	//...�������� ������ ��������� �������...
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_05");	//...������� ������ �����...
	};
	if(VATRAS_FIRST == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_06");	//...� ���, ��� ������ �������, ����� ��������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_07");	//...��� ����� ���������� ������� ����.
	};
	AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_08");	//� �� ������, ����� �������� ��� ���������...
	if((VATRAS_FIRST == TRUE) && (VATRAS_SECOND == TRUE) && (VATRAS_THIRD == TRUE))
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_09");	//��� ��� ������ �������� �������������, �� � �� �����, ��� �� ������ ���.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_10");	//������� � �������� ������������, ��� ���� ������ ����������.
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_11");	//������ � �������������� �������, ��� ���!
		Snd_Play("LEVELUP");
		b_giveplayerxp(XP_VATRASTRUTH);
		VATRAS_SEGEN = TRUE;
		b_logentry(TOPIC_THORBEN,"��� ���� ������ ����������� ����.");
	}
	else if(VATRAS_CHANCE == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_Add_05_00");	//��� �������, ��� �� �� ��� �������� ���.
		AI_Output(self,other,"DIA_Vatras_Add_05_01");	//���� �� ����������, ��� � �������� ����-������ � ���, ��� �� ��������� ���, �� ������� ��� ������� ����.
		AI_Output(self,other,"DIA_Vatras_Add_05_02");	//� �������� ������� ��� �������, ������� �������� ���, ��� ���� �����������.
		if(Wld_IsTime(5,5,20,10))
		{
			AI_Output(other,self,"DIA_Vatras_Add_15_03");	//� ��� ������ �����, ������� �����?
			AI_Output(self,other,"DIA_Vatras_Add_05_04");	//��� �������� ������ �������� ����, ��� � ���������� ��. ��� ��� �� ����������.
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_05");	//������ � ������. ��� ��� �� ���������?
		VATRAS_CHANCE = TRUE;
		Info_ClearChoices(dia_vatras_influence);
		Info_AddChoice(dia_vatras_influence,"������ ������� ...",dia_vatras_influence_first_truth);
		Info_AddChoice(dia_vatras_influence,"����� ���������� ������� ����!",dia_vatras_influence_first_lie);
	}
	else if(VATRAS_CHANCE == TRUE)
	{
		AI_Output(self,other,"DIA_Vatras_INFLUENCE_REPEAT_05_13");	//� ��� ���� ��� ����� ������� ��� ������, �� ��, ��-��������, �� ������ �����. � �� ��� ���� ����� �������������.
	};
};


instance DIA_VATRAS_WOKDF(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 3;
	condition = dia_vatras_wokdf_condition;
	information = dia_vatras_wokdf_info;
	permanent = FALSE;
	description = "��� ��� ����� ����� ������?";
};


func int dia_vatras_wokdf_condition()
{
	if((VATRAS_SEGEN == TRUE) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_vatras_wokdf_info()
{
	AI_Output(other,self,"DIA_Vatras_WoKdF_15_00");	//��� ��� ����� ����� ������?
	AI_Output(self,other,"DIA_Vatras_WoKdF_05_01");	//�������� �������� ��� �� �������� �������. �� ������� ��� ������������� ���������.
};


instance DIA_VATRAS_SPENDE(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 3;
	condition = dia_vatras_spende_condition;
	information = dia_vatras_spende_info;
	permanent = TRUE;
	description = "� ���� ������� ������������� �������!";
};


func int dia_vatras_spende_condition()
{
	return TRUE;
};

func void dia_vatras_spende_info()
{
	AI_Output(other,self,"DIA_Vatras_Spende_15_00");	//� ���� ������� ������������� �������!
	AI_Output(self,other,"DIA_Vatras_Spende_05_01");	//������������� ������ ������� ������ ����� ������, ������� �� ��� ���������, ��� ���.
	AI_Output(self,other,"DIA_Vatras_Spende_05_02");	//������� �� ������ ������������?
	Info_ClearChoices(dia_vatras_spende);
	Info_AddChoice(dia_vatras_spende,"��� ������ ����� ����������...",dia_vatras_spende_back);
	if(Npc_HasItems(other,itmi_gold) >= 50)
	{
		Info_AddChoice(dia_vatras_spende,"� ���� ���� 50 ������� �����...",dia_vatras_spende_50);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_vatras_spende,"� ���� ���� 100 ������� �����...",dia_vatras_spende_100);
	};
};

func void dia_vatras_spende_back()
{
	AI_Output(other,self,"DIA_Vatras_Spende_BACK_15_00");	//��� ������ ����� ����������...
	AI_Output(self,other,"DIA_Vatras_Spende_BACK_05_01");	//��� �� ��������, �� ������ �������� ���� ������ ��������� �����, ��� ���.
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_50()
{
	AI_Output(other,self,"DIA_Vatras_Spende_50_15_00");	//� ���� ���� 50 ������� �����...
	AI_Output(self,other,"DIA_Vatras_Spende_50_05_01");	//� ��������� ���� �� ����� �������, ��� ���. ���� ������ ����� ������� �����������.
	b_giveinvitems(other,self,itmi_gold,50);
	Info_ClearChoices(dia_vatras_spende);
};

func void dia_vatras_spende_100()
{
	AI_Output(other,self,"DIA_Vatras_Spende_100_15_00");	//� ���� ���� 100 ������� �����...
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_01");	//� ������������ ���� �� ����� ������� �� ���� ������������ ���!
	Snd_Play("LEVELUP");
	AI_Output(self,other,"DIA_Vatras_Spende_100_05_02");	//�� ����� ����, �� �������� �� �����, ������������ ��������!
	b_giveinvitems(other,self,itmi_gold,100);
	VATRAS_SEGEN = TRUE;
	Info_ClearChoices(dia_vatras_spende);
	if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
	{
		b_logentry(TOPIC_THORBEN,"��� ���� ������ ����������� ����.");
	};
};


instance DIA_VATRAS_CANTEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 5;
	condition = dia_vatras_canteach_condition;
	information = dia_vatras_canteach_info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ����-������ �� ������� �����?";
};


func int dia_vatras_canteach_condition()
{
	return TRUE;
};

func void dia_vatras_canteach_info()
{
	AI_Output(other,self,"DIA_Vatras_CanTeach_15_00");	//�� ������ ������� ���� ����-������ �� ������� �����?
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_01");	//������ ��������� ������ � ��������� ������� ��������� ������������ ������ ���.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_02");	//�� ������� �������� ����� ����� ������������ ������ ��� ������ �������.
	AI_Output(self,other,"DIA_Vatras_CanTeach_05_03");	//� ���� �������� ����, ��� ���������� � ��������� ���� ���������� �����������.
	VATRAS_TEACHMANA = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"��� ���� ������ ����� ������ ��� �������� ��� ���������� �����������.");
};


instance DIA_VATRAS_TEACH(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 100;
	condition = dia_vatras_teach_condition;
	information = dia_vatras_teach_info;
	permanent = TRUE;
	description = "� ���� �������� ��� ���������� �����������.";
};


func int dia_vatras_teach_condition()
{
	if(VATRAS_TEACHMANA == TRUE)
	{
		return TRUE;
	};
};

func void dia_vatras_teach_info()
{
	AI_Output(other,self,"DIA_Vatras_Teach_15_00");	//� ���� �������� ��� ���������� �����������.
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 50)
	{
		AI_Output(self,other,"DIA_Vatras_Teach_05_00");	//���� ���������� ������� ����� ������� ������, ����� � ��� ��� �������� ��.
	};
	Info_ClearChoices(dia_vatras_teach);
};

func void dia_vatras_teach_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,50);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};

func void dia_vatras_teach_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,50);
	Info_ClearChoices(dia_vatras_teach);
	Info_AddChoice(dia_vatras_teach,DIALOG_BACK,dia_vatras_teach_back);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_vatras_teach_1);
	Info_AddChoice(dia_vatras_teach,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_vatras_teach_5);
};


instance DIA_VATRAS_GODS(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 98;
	condition = dia_vatras_gods_condition;
	information = dia_vatras_gods_info;
	permanent = TRUE;
	description = "�������� ��� � �����.";
};


func int dia_vatras_gods_condition()
{
	return TRUE;
};

func void dia_vatras_gods_info()
{
	AI_Output(other,self,"DIA_Vatras_GODS_15_00");	//�������� ��� � �����.
	AI_Output(self,other,"DIA_Vatras_GODS_05_01");	//��� ������ �� ������ �����?
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"�������� ��� �� ������.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"�������� ��� �� �������.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"�������� ��� � �������.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_back()
{
	Info_ClearChoices(dia_vatras_gods);
};

func void dia_vatras_gods_innos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_INNOS_15_00");	//�������� ��� �� ������.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_01");	//������. (�����������) ����� - ������ � ���������� �� �����. �� ������ ������ � ���.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_02");	//�� ���������� ������ � ����� - ��� ����� ������������. �� ���� ����� � ����������.
	AI_Output(self,other,"DIA_Vatras_GODS_INNOS_05_03");	//��� ����� - ���� ����, � �������� - ��� �����.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"�������� ��� �� ������.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"�������� ��� �� �������.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"�������� ��� � �������.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_adanos()
{
	AI_Output(other,self,"DIA_Vatras_GODS_ADANOS_15_00");	//�������� ��� �� �������.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_01");	//������ - ��� ������. �� - ���� ����������, ����� ���������� ����� ������� � ��������.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_02");	//�� ���������� ����� ���������. ��� ��� - ���� �� ���� �������, ����� � ������.
	AI_Output(self,other,"DIA_Vatras_GODS_ADANOS_05_03");	//��� ����� - ���� ����. � ���� ����� � ���� �������.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"�������� ��� �� ������.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"�������� ��� �� �������.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"�������� ��� � �������.",dia_vatras_gods_beliar);
};

func void dia_vatras_gods_beliar()
{
	AI_Output(other,self,"DIA_Vatras_GODS_BELIAR_15_00");	//�������� ��� � �������.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_01");	//������ - ��� ������ ��� ������, ���������� � ����� ���������������.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_02");	//�� ����� ������ ����� � �������, �� ������ ����� �� ������ ������� ����� ����� �����.
	AI_Output(self,other,"DIA_Vatras_GODS_BELIAR_05_03");	//������ �������� ���� ������� ���� �������, ������ �� ������ �������� ���� ����� ������.
	Info_ClearChoices(dia_vatras_gods);
	Info_AddChoice(dia_vatras_gods,DIALOG_BACK,dia_vatras_gods_back);
	Info_AddChoice(dia_vatras_gods,"�������� ��� �� ������.",dia_vatras_gods_innos);
	Info_AddChoice(dia_vatras_gods,"�������� ��� �� �������.",dia_vatras_gods_adanos);
	Info_AddChoice(dia_vatras_gods,"�������� ��� � �������.",dia_vatras_gods_beliar);
};


instance DIA_VATRAS_HEAL(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 99;
	condition = dia_vatras_heal_condition;
	information = dia_vatras_heal_info;
	permanent = TRUE;
	description = "�� ������ �������� ����?";
};


func int dia_vatras_heal_condition()
{
	return TRUE;
};

func void dia_vatras_heal_info()
{
	AI_Output(other,self,"DIA_Vatras_HEAL_15_00");	//�� ������ �������� ����?
	if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_01");	//(������������) ������, ���������� ��� ����. �������� ��� �� ��� � ������ � ���� ���� ����� �����.
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
	}
	else
	{
		AI_Output(self,other,"DIA_Vatras_HEAL_05_02");	//������ �� �� ���������� � ����� ���������.
	};
};

func void b_sayvatrasgo()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_13");	//������. ��� ��� �� � ������� ��������.
};


instance DIA_VATRAS_MISSION(C_INFO)
{
	npc = vlk_439_vatras;
	condition = dia_vatras_mission_condition;
	information = dia_vatras_mission_info;
	important = TRUE;
};


func int dia_vatras_mission_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_vatras_mission_info()
{
	AI_Output(self,other,"DIA_Vatras_Add_05_10");	//� ���� ���� ��������� ��� ������� ��������. �� �������� ������� ����� ����������.
	AI_Output(self,other,"DIA_Vatras_MISSION_05_01");	//���� �� ��������� ��� ������� ��� ����, �� ������ ������� ��������������.
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"����� ���� ������� �������� �� ����������, ������!",dia_vatras_mission_no);
	Info_AddChoice(dia_vatras_mission,"� ������ ���.",dia_vatras_mission_yes);
};

func void dia_vatras_mission_yes()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_YES_15_00");	//� ������ ���.
	AI_Output(self,other,"DIA_Vatras_Add_05_11");	//������, ����� ������� ��� ��������� � ������ ���� �� ���� ������� � ������������.
	AI_Output(self,other,"DIA_Vatras_Add_05_12");	//� ����� �� ��������� ���������, � ���������� ���� ��������������� �������.
	b_giveinvitems(self,hero,itwr_vatrasmessage,1);
	MIS_VATRAS_MESSAGE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BOTSCHAFT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BOTSCHAFT,LOG_RUNNING);
	b_logentry(TOPIC_BOTSCHAFT,"������ ��� ��� ������� ��� ������� ��������. �� ��������� � ������� ���������� �� ���������.");
	Info_ClearChoices(dia_vatras_mission);
	Info_AddChoice(dia_vatras_mission,"� ������ ���������� �����.",dia_vatras_mission_light);
	Info_AddChoice(dia_vatras_mission,"� ������� �������� ����������.",dia_vatras_mission_heal);
	Info_AddChoice(dia_vatras_mission,"��� ��� ������� ������.",dia_vatras_mission_ice);
};

func void dia_vatras_mission_no()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_NO_15_00");	//����� ���� ������� �������� �� ����������, ������!
	MIS_VATRAS_MESSAGE = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_heal()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_HEAL_15_00");	//� ������� �������� ����������.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_lightheal,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_ice()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_ICE_15_00");	//��� ��� ������� ������.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_icebolt,1);
	Info_ClearChoices(dia_vatras_mission);
};

func void dia_vatras_mission_light()
{
	AI_Output(other,self,"DIA_Vatras_MISSION_LIGHT_15_00");	//� ������ ���������� �����.
	b_sayvatrasgo();
	b_giveinvitems(self,hero,itsc_light,1);
	Info_ClearChoices(dia_vatras_mission);
};


instance DIA_VATRAS_MESSAGE_SUCCESS(C_INFO)
{
	npc = vlk_439_vatras;
	condition = dia_vatras_message_success_condition;
	information = dia_vatras_message_success_info;
	description = "� �������� ���� ���������.";
};


func int dia_vatras_message_success_condition()
{
	if((MIS_VATRAS_MESSAGE == LOG_RUNNING) && (VATRAS_RETURN == TRUE))
	{
		return TRUE;
	};
};

func void dia_vatras_message_success_info()
{
	AI_Output(other,self,"DIA_Vatras_MESSAGE_SUCCESS_15_00");	//� �������� ���� ���������.
	AI_Output(self,other,"DIA_Vatras_Add_05_14");	//����� ��� �������������. � ���� �������.
	MIS_VATRAS_MESSAGE = LOG_SUCCESS;
	b_giveplayerxp(XP_VATRAS_MESSAGE);
	Info_ClearChoices(dia_vatras_message_success);
	Info_AddChoice(dia_vatras_message_success,"1 ������� ������",dia_vatras_message_success_plant);
	Info_AddChoice(dia_vatras_message_success,"������ ��������",dia_vatras_message_success_ring);
	Info_AddChoice(dia_vatras_message_success,"1 ����� ����",dia_vatras_message_success_ore);
};

func void dia_vatras_message_success_plant()
{
	b_giveinvitems(self,hero,itpl_perm_herb,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ring()
{
	b_giveinvitems(self,hero,itri_dex_01,1);
	Info_ClearChoices(dia_vatras_message_success);
};

func void dia_vatras_message_success_ore()
{
	b_giveinvitems(self,hero,itmi_nugget,1);
	Info_ClearChoices(dia_vatras_message_success);
};


const int KURZ = 0;
const int LANG = 1;
var int vatras_einmallangweg;

func void b_vatras_geheweg(var int dauer)
{
	if(VATRAS_EINMALLANGWEG == TRUE)
	{
		return;
	};
	if((Npc_GetDistToWP(self,"NW_CITY_MERCHANT_TEMPLE_FRONT") <= 500) && Npc_WasInState(self,zs_preach_vatras))
	{
		b_stoplookat(self);
		AI_AlignToWP(self);
		AI_Output(self,other,"DIA_Vatras_Add_05_06");	//���������� ���� ����! � ����� � ������ �����.
		if(dauer == KURZ)
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_07");	//��� �� ������ ����� �������. � ����� � �������, � �������� ��� ��������� ���� �������.
		}
		else
		{
			AI_Output(self,other,"DIA_Vatras_Add_05_08");	//� �� ����, ������� �� �. ���� �� �� ������ ����� ���������, �������� ��� ������� � ��������.
			VATRAS_EINMALLANGWEG = TRUE;
		};
		AI_Output(self,other,"DIA_Vatras_Add_05_09");	//�� �������� � ���� ������!
		b_turntonpc(self,other);
	};
	VATRAS_SCHICKELEUTEWEG = TRUE;
};


instance DIA_VATRAS_INNOSEYEKAPUTT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 32;
	condition = dia_vatras_innoseyekaputt_condition;
	information = dia_vatras_innoseyekaputt_info;
	description = "���� ������ ���������.";
};


func int dia_vatras_innoseyekaputt_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_vatras_innoseyekaputt_info()
{
	if(MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_00");	//���� ������� �������.
	}
	else if(MIS_XARDAS_GOTOVATRASINNOSEYE == LOG_RUNNING)
	{
		AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_01");	//���� ������� �������.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_15_02");	//���� ������ ���������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_03");	//� ����. � ��� ����� �� ���� �� ������ ����� ����������� ����������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_04");	//������ ������������ ���� ������ ����� ����, ����� ���������� ����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_05_05");	//� �� ������ ��� ����������� ����� �����.
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Info_AddChoice(dia_vatras_innoseyekaputt,"� ���� ������ ������� ���������������� ������.",dia_vatras_innoseyekaputt_schnellenachrichten);
	if((hero.guild == GIL_KDF) && (MIS_PYROKAR_GOTOVATRASINNOSEYE == LOG_RUNNING))
	{
		Info_AddChoice(dia_vatras_innoseyekaputt,"������ ������� ������ ���� ������ � ����?",dia_vatras_innoseyekaputt_warumdu);
	};
	Info_AddChoice(dia_vatras_innoseyekaputt,"��� ������ ����� � ������?",dia_vatras_innoseyekaputt_auge);
};

func void dia_vatras_innoseyekaputt_auge()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_15_00");	//��� ������ ����� � ������?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_01");	//�� ������ ������������ ���. �� ���, �����, ����� ��������� �������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_02");	//������ ������� �� ��� �����. �������� ������ ������ ���� �������� �������� ��.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_03");	//�� �������� �� � ����. ���� ������ ������� ����������� ������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_05_04");	//�� ����� � ���������. ����, ������, ������ ����, ��� �������� ���.
	Info_AddChoice(dia_vatras_innoseyekaputt,"��� ��� ����� �������, ���������� �������� ������?",dia_vatras_innoseyekaputt_auge_schmied);
	Info_AddChoice(dia_vatras_innoseyekaputt,"��� ����� ������������ ���� �����?",dia_vatras_innoseyekaputt_auge_stein);
};

func void dia_vatras_innoseyekaputt_auge_stein()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_15_00");	//��� ����� ������������ ���� �����?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_01");	//� ���� ������ ���� ������. ���� ���� �������� ������� ������ ���� �������� ������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_02");	//������ �������������� ������ ��������� � ����� ����������� ����� ������ ��� ��� �����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_03");	//������ �������� ������� � ���, ��� �� ������ �������� � ��� ����� ������ �������������� ������� �� ���� ����� �����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_05_04");	//����� ����, ��� ����� ������� ���������� ����� �������� �����. � �����, ���������� �� ����� 3-� ��������.
	Info_AddChoice(dia_vatras_innoseyekaputt,"��� ����� ���� ����� ����� ������� ��������������� �����?",dia_vatras_innoseyekaputt_auge_stein_wer);
	Info_AddChoice(dia_vatras_innoseyekaputt,"��� ��� ����� �������� �����?",dia_vatras_innoseyekaputt_auge_stein_kraut);
};

func void dia_vatras_innoseyekaputt_auge_stein_kraut()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_15_00");	//��� ��� ����� �������� �����?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_01");	//� ������ � ������ ������� �������, ������� � ����. ����������������, ��� ������� ����� �����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Kraut_05_02");	//�� ����� �� ������ �������� ������� � ������� ������.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_15_00");	//��� ����� ���� ����� ����� ������� ��������������� �����?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_01");	//� ���� ������������ ���� ������� �����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_02");	//�������, ������ ��� ����, ��� �� ���������� ������������ �� ������������� ���� ������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_05_03");	//�� ��� �������, ��� �� �������� � ������ ���������� ��������. ��� ������ ���� ���-��, ��� ������� ������ ������.
	Info_AddChoice(dia_vatras_innoseyekaputt,"������ ������? � ��� ������ ��������?",dia_vatras_innoseyekaputt_auge_stein_wer_xardas);
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_15_00");	//������ ������? � ��� ������ ��������?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_01");	//�����. ��� ����� ���������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_02");	//�� � ����� ���� ������ - ��� �� ��������� ��� ����� � ���� �����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_Stein_Wer_Xardas_05_03");	//����������� ��������� ���� ��������, ����� �� �������, ��� ������ �������� ���� �� ���� � ���������.
	Info_AddChoice(dia_vatras_innoseyekaputt,"� ������ ����.",dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter);
};

func void dia_vatras_innoseyekaputt_auge_schmied()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_15_00");	//��� ��� ����� �������, ���������� �������� ������ �����?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_Auge_schmied_05_01");	//����������� ������ � ���, ��� ����� ������������� �������������.
};

func void dia_vatras_innoseyekaputt_warumdu()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_15_00");	//������ ������� ������ ���� ������ � ����?
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_01");	//� ����������, ��� ���� ��� ������ ���-�� �������� ������ ���� ���������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_02");	//������� ������ ������ ���� ����� ���������� � ���������������, ��� ��� ����� ��������� � ������������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_03");	//���, ��� ���� ���������������� �� ������ ����� ���� ���� ����������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_04");	//� ������ �����, ��� �� �������������� ���������� �� �����������, ������� ������ ������� ���.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_warumdu_05_05");	//���������� ������, ��� ����� �� ���������, ���� �� � ������ ��� ����������.
};

func void dia_vatras_innoseyekaputt_schnellenachrichten()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_15_00");	//� ���� ������ ������� ���������������� ������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_schnelleNachrichten_05_01");	//��� ������� ������, �� ���� ���� �� ����� �����.
};

func void dia_vatras_innoseyekaputt_auge_stein_wer_xardas_weiter()
{
	AI_Output(other,self,"DIA_Vatras_INNOSEYEKAPUTT_weiter_15_00");	//� ������ ����.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_01");	//� ���� ������ ������������ � ����, ����� ����������� ��������� � ����� ������.
	AI_Output(self,other,"DIA_Vatras_INNOSEYEKAPUTT_weiter_05_02");	//����� �������� � �������� ����. � �� ������ �������� �������� �����. � ��������� �� ����.
	b_logentry(TOPIC_INNOSEYE,"������ ����� �������� ������ � ����� ������, ����� ������������ ����. � ������ ������� �������� � �������� ������� � ��� �������. �����, � ������ ����� �������, ������� ����� �������� ������������ ������ �������.");
	MIS_RITUALINNOSEYEREPAIR = LOG_RUNNING;
	Info_ClearChoices(dia_vatras_innoseyekaputt);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYEREPAIR");
	b_vatras_geheweg(KURZ);
	dmt_1201.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1202.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1203.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1204.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1205.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1206.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1207.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1208.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1209.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1210.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	dmt_1211.aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_startotherroutine(dmt_1201,"AfterRitual");
	b_startotherroutine(dmt_1202,"AfterRitual");
	b_startotherroutine(dmt_1203,"AfterRitual");
	b_startotherroutine(dmt_1204,"AfterRitual");
	b_startotherroutine(dmt_1205,"AfterRitual");
	b_startotherroutine(dmt_1206,"AfterRitual");
	b_startotherroutine(dmt_1207,"AfterRitual");
	b_startotherroutine(dmt_1208,"AfterRitual");
	b_startotherroutine(dmt_1209,"AfterRitual");
	b_startotherroutine(dmt_1210,"AfterRitual");
	b_startotherroutine(dmt_1211,"AfterRitual");
};


instance DIA_VATRAS_RITUALINNOSEYEREPAIR(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_ritualinnoseyerepair_condition;
	information = dia_vatras_ritualinnoseyerepair_info;
	permanent = TRUE;
	description = "��� ������� ���� � ������ ������?";
};


func int dia_vatras_ritualinnoseyerepair_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_vatras_ritualinnoseyerepair_info()
{
	AI_Output(other,self,"DIA_Vatras_RitualInnosEyeRepair_15_00");	//��� ������� ���� � ������ ������?
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_01");	//�����: ������ ������ ��������� � ����� ������ ������ � ��������� � ��������� ����������� ����.
	AI_Output(self,other,"DIA_Vatras_RitualInnosEyeRepair_05_02");	//� �� ������ �������� ���� � ����������������� �������.
};


instance DIA_VATRAS_BEGINN(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 31;
	condition = dia_vatras_beginn_condition;
	information = dia_vatras_beginn_info;
	description = "� ������ ���, ��� �� ������ ���.";
};


func int dia_vatras_beginn_condition()
{
	if((KAPITEL == 3) && (Npc_GetDistToWP(self,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(xardas,"NW_TROLLAREA_RITUAL_02") < 2000) && (Npc_GetDistToWP(pyrokar,"NW_TROLLAREA_RITUAL_02") < 2000) && Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_vatras_beginn_info()
{
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_00");	//� ������ ���, ��� �� ������ ���. ��� ���������� ����.
	b_giveplayerxp(XP_RITUALINNOSEYERUNS);
	b_giveinvitems(other,self,itmi_innoseye_broken_mis,1);
	Npc_RemoveInvItem(self,itmi_innoseye_broken_mis);
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_01");	//��, ������ ��� ������ ��� ���������� �������.
	AI_Output(other,self,"DIA_Vatras_BEGINN_15_02");	//��� ������ �������� �����?
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_03");	//��, ��. �� ������ 3 ������ �������� �����?
	if(b_giveinvitems(other,self,itpl_swampherb,3))
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_04");	//��. ��. ��� 3 ��������.
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_05");	//�����������.
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(other,self,"DIA_Vatras_BEGINN_15_06");	//���, ���� ���, ���!
		AI_Output(self,other,"DIA_Vatras_BEGINN_05_07");	//������. ����� ��� �������� �������� ��� ���.
	};
	AI_Output(self,other,"DIA_Vatras_BEGINN_05_08");	//�� ������ ���������, �� ������ ������ � �������, ����� �� ����� ������ ���������. �� ����������� ���� ����!
	Info_ClearChoices(dia_vatras_beginn);
	Info_AddChoice(dia_vatras_beginn,DIALOG_ENDE,dia_vatras_beginn_los);
};

func void dia_vatras_beginn_los()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RITUALINNOSEYE");
	b_startotherroutine(xardas,"RITUALINNOSEYE");
	b_startotherroutine(pyrokar,"RITUALINNOSEYE");
	Npc_SetRefuseTalk(self,60);
	RITUALINNOSEYERUNS = LOG_RUNNING;
};


instance DIA_VATRAS_AUGEGEHEILT(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_augegeheilt_condition;
	information = dia_vatras_augegeheilt_info;
	important = TRUE;
};


func int dia_vatras_augegeheilt_condition()
{
	if((KAPITEL == 3) && (RITUALINNOSEYERUNS == LOG_RUNNING) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_augegeheilt_info()
{
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_00");	//�� ���������. ��� ������� ��������� ���� ����� � ������������ ����.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_01");	//����� ������� �������� ����, ��� ������������ ��� �����.
	AI_Output(self,other,"DIA_Vatras_AUGEGEHEILT_05_02");	//�������, � ��� ����� ����, ����� �� ��������� ���� ������. ������.
	b_logentry(TOPIC_INNOSEYE,"���� ��� ������������. ������� ������ ��� ���, � ���������� ����� �� ��������.");
	AI_StopProcessInfos(self);
	RITUALINNOSEYERUNS = LOG_SUCCESS;
	MIS_RITUALINNOSEYEREPAIR = LOG_SUCCESS;
	b_startotherroutine(pyrokar,"RitualInnosEyeRepair");
	b_startotherroutine(xardas,"RitualInnosEyeRepair");
	b_startotherroutine(vlk_455_buerger,"START");
	b_startotherroutine(vlk_454_buerger,"START");
	b_startotherroutine(vlk_428_buergerin,"START");
	b_startotherroutine(vlk_450_buerger,"START");
	b_startotherroutine(vlk_426_buergerin,"START");
	b_startotherroutine(vlk_421_valentino,"START");
};


instance DIA_VATRAS_PERMKAP3(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 33;
	condition = dia_vatras_permkap3_condition;
	information = dia_vatras_permkap3_info;
	description = "�������, ��� ����� ������������ ���� ������.";
};


func int dia_vatras_permkap3_condition()
{
	if(MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_vatras_permkap3_info()
{
	AI_Output(other,self,"DIA_Vatras_PERMKAP3_15_00");	//�������, ��� ����� ������������ ���� ������.
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_01");	//������ ������ ����� �������������. ����� ������� ��� ���� ���� �������.
	if(MIS_READYFORCHAPTER4 == FALSE)
	{
		AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_02");	//�������� � ���������, �� �������� ���, ��� ���� ����� �����.
	};
	AI_Output(self,other,"DIA_Vatras_PERMKAP3_05_03");	//�������, ������� ���� ����� ����� � ����������, ��� ���.
};


instance DIA_VATRAS_HILDAKRANK(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 34;
	condition = dia_vatras_hildakrank_condition;
	information = dia_vatras_hildakrank_info;
	description = "���� �������, ������, ������.";
};


func int dia_vatras_hildakrank_condition()
{
	if((MIS_HEALHILDA == LOG_RUNNING) && Npc_KnowsInfo(other,dia_vatras_greet))
	{
		return TRUE;
	};
};

func void dia_vatras_hildakrank_info()
{
	AI_Output(other,self,"DIA_Vatras_HILDAKRANK_15_00");	//���� �������, ������, ������.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_01");	//���? �����? ��� ������ ������� ������ ������ ���������� � ����.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_02");	//��� ���� ������� ����, � �� � ���� ������ �� �����. ������, � ��� �� ���������, ������� �������� ���������.
	AI_Output(self,other,"DIA_Vatras_HILDAKRANK_05_03");	//��, ������, ��� ��� ����� �� �����, �� ��� �� ������� �� ���.
	CreateInvItems(self,itpo_healhilda_mis,1);
	b_giveinvitems(self,other,itpo_healhilda_mis,1);
};


instance DIA_VATRAS_OBSESSION(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 35;
	condition = dia_vatras_obsession_condition;
	information = dia_vatras_obsession_info;
	description = "� ������ ���������� �������.";
};


func int dia_vatras_obsession_condition()
{
	if((SC_ISOBSESSED == TRUE) && (SC_OBSESSIONTIMES < 1))
	{
		return TRUE;
	};
};

func void dia_vatras_obsession_info()
{
	AI_Output(other,self,"DIA_Vatras_OBSESSION_15_00");	//� ������ ���������� �������.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_01");	//��, � ��������� �� ������. �� ������� ����� ����������� ����������� ������� ������� ������.
	AI_Output(self,other,"DIA_Vatras_OBSESSION_05_02");	//���, ��� � ���� - ��� �������� ���� ����, �� ������ ��������� ����� �������� ���� ����. �������� � ���������. �� ������� ����.
};


instance DIA_VATRAS_ALLDRAGONSDEAD(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 59;
	condition = dia_vatras_alldragonsdead_condition;
	information = dia_vatras_alldragonsdead_info;
	description = "������� ������ �� ����� ����� ����.";
};


func int dia_vatras_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_vatras_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_00");	//������� ������ �� ����� ����� ����.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_01");	//� ����, ��� �� ��������� � ������ �������. ������ ����� ������� ��������� ��� ���� ���� �������.
	AI_Output(other,self,"DIA_Vatras_AllDragonsDead_15_02");	//� ����.
	AI_Output(self,other,"DIA_Vatras_AllDragonsDead_05_03");	//����� ����� ���� ���������� ������� � ������� �� ���, ���� ���� ����� ������. � ������ ���� � ����� ���� ������, �������? ������ ������������� ����.
};


instance DIA_VATRAS_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_knowwhereenemy_condition;
	information = dia_vatras_knowwhereenemy_info;
	permanent = TRUE;
	description = "� ����, ��� ��������� ��� ����.";
};


func int dia_vatras_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (VATRAS_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_00");	//� ����, ��� ��������� ��� ����.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_01");	//����� �� ����� ������ ������� � ������ ��� � ��� ������, ���� �� ��� �� ������ � ���.
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_02");	//�� ������ ������������ ����?
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_03");	//� ����� ����� �� ����. ��, � ������� �� ��� ��� ������ � ����� ������, ��� ����.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"��� ��� �� �������, ������ ��������� ��� ������������ ���� � ���� �����������. �������, ���������� ��� �������� � ������ ����� ��������� ����� �������� ��� ����.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_15_04");	//� ���� ������ � ��� ��� ������� ����� ������. �����, ��� �� �������� ����� ��� ����.
		AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_05_05");	//��� �������� �����. � ���� �����������.
	}
	else
	{
		Info_ClearChoices(dia_vatras_knowwhereenemy);
		Info_AddChoice(dia_vatras_knowwhereenemy,"��� ����� ��� �������� �� ����.",dia_vatras_knowwhereenemy_no);
		Info_AddChoice(dia_vatras_knowwhereenemy,"� ����� �� �����, ��� �� ������ �� ���� �������.",dia_vatras_knowwhereenemy_yes);
	};
};

func void dia_vatras_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_Yes_15_00");	//� ����� �� �����, ��� �� ������ �� ���� �������. ���������� � ������.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_Yes_05_01");	//������ �� ����� ����� ����������. �����, ���� ���, ���� �� �������.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	b_vatras_geheweg(LANG);
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};

func void dia_vatras_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Vatras_KnowWhereEnemy_No_15_00");	//��� ����� ��� �������� �� ����.
	AI_Output(self,other,"DIA_Vatras_KnowWhereEnemy_No_05_01");	//��� ������. ����������� �� ���, ���� �����������.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_vatras_knowwhereenemy);
};


instance DIA_VATRAS_LEAVEMYSHIP(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_leavemyship_condition;
	information = dia_vatras_leavemyship_info;
	permanent = TRUE;
	description = "���� ����� �������� �����. �� ����� ������.";
};


func int dia_vatras_leavemyship_condition()
{
	if((VATRAS_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_vatras_leavemyship_info()
{
	AI_Output(other,self,"DIA_Vatras_LeaveMyShip_15_00");	//���� ����� �������� �����. �� ����� ������.
	AI_Output(self,other,"DIA_Vatras_LeaveMyShip_05_01");	//��������, �� ����. � ��� �� � ����� ������������ ����, ���� �� ����� ��������. �� ������ ���.
	VATRAS_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"PRAY");
};


instance DIA_VATRAS_STILLNEEDYOU(C_INFO)
{
	npc = vlk_439_vatras;
	nr = 55;
	condition = dia_vatras_stillneedyou_condition;
	information = dia_vatras_stillneedyou_info;
	permanent = TRUE;
	description = "�������� ������ �� ��������� ������.";
};


func int dia_vatras_stillneedyou_condition()
{
	if(((VATRAS_ISONBOARD == LOG_OBSOLETE) || (VATRAS_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_vatras_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Vatras_StillNeedYou_15_00");	//�������� ������ �� ��������� ������.
	AI_Output(self,other,"DIA_Vatras_StillNeedYou_05_01");	//������ �������. �������, �� ������ ��� �� ����������.
	self.flags = NPC_FLAG_IMMORTAL;
	VATRAS_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	b_vatras_geheweg(LANG);
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};

