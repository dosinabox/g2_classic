
instance DIA_CASSIA_EXIT(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 999;
	condition = dia_cassia_exit_condition;
	information = dia_cassia_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cassia_exit_condition()
{
	return TRUE;
};

func void dia_cassia_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_PICKME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 900;
	condition = dia_cassia_pickme_condition;
	information = dia_cassia_pickme_info;
	permanent = TRUE;
	description = PICKPOCKET_100_FEMALE;
};


func int dia_cassia_pickme_condition()
{
	return c_beklauen(100,400);
};

func void dia_cassia_pickme_info()
{
	Info_ClearChoices(dia_cassia_pickme);
	Info_AddChoice(dia_cassia_pickme,DIALOG_BACK,dia_cassia_pickme_back);
	Info_AddChoice(dia_cassia_pickme,DIALOG_PICKPOCKET,dia_cassia_pickme_doit);
};

func void dia_cassia_pickme_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cassia_pickme);
};

func void dia_cassia_pickme_back()
{
	Info_ClearChoices(dia_cassia_pickme);
};


instance DIA_CASSIA_GILDE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_gilde_condition;
	information = dia_cassia_gilde_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_gilde_condition()
{
	if((CASSIA_GILDENCHECK == TRUE) && (JOIN_THIEFS == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_cassia_gilde_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_00");	//� ����, �� ���� ���������� ������ � �������.
		AI_Output(self,other,"DIA_Cassia_Gilde_16_01");	//�� ��, ��� �� ������ ������� ������, ��� ��� �������� �� �����. �� ���� �� ���. � � �������, ��� �� ��� ���� ���������.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Cassia_Gilde_16_02");	//��� �� ������ ��������� ������ ������? �������. �� �� ������ ����� ���� �� ��� - �������, �� ������� ��� �� ��������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_CASSIA_ABGELAUFEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgelaufen_condition;
	information = dia_cassia_abgelaufen_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_abgelaufen_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CASSIA_FRIST == TRUE) && (CASSIA_DAY < (b_getdayplus() - 2)))
	{
		return TRUE;
	};
};

func void dia_cassia_abgelaufen_info()
{
	AI_Output(self,other,"DIA_Cassia_Abgelaufen_16_00");	//���� ���� �����. ���� �� ��������� ������������.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_CASSIA_NEWS(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 1;
	condition = dia_cassia_news_condition;
	information = dia_cassia_news_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_cassia_news_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_news_info()
{
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_News_16_00");	//� ����, �� ������� ��� �������. � ������.
		AI_Output(other,self,"DIA_Cassia_News_15_01");	//������, ������. ������ ����� ���, ����� � �����?
		AI_Output(self,other,"DIA_Cassia_News_16_02");	//�� ������� ���� �������� ���, ��� �������� ������� ������ �� ����� ������.
		AI_Output(self,other,"DIA_Cassia_News_16_03");	//� �� ����� ���� ���� ����. �� ������ �������������� � ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_News_16_04");	//������ ����������, ��� ����� ������ ����. ������ ���������� ����. �� � �� ������ ����� ������.
		AI_Output(other,self,"DIA_Cassia_News_15_05");	//��� ��� �� ����?
		AI_Output(self,other,"DIA_Cassia_News_16_06");	//�� ������, ����� �� ���� �� ��, ��� ���� ������ �� ����� ������. ��� ������ �� ������� ������.
		AI_Output(self,other,"DIA_Cassia_News_16_07");	//���� ����������� �����, ������, ��������� ����� �����������...
		AI_Output(other,self,"DIA_Cassia_News_15_08");	//... ��� �� ������ ���������� ���?
		AI_Output(self,other,"DIA_Cassia_News_16_09");	//�� ������ �������������� � ���.
	};
	if((Npc_GetTrueGuild(other) == GIL_NONE) || (Npc_GetTrueGuild(other) == GIL_NOV))
	{
		CASSIA_GILDENCHECK = TRUE;
	};
	DG_GEFUNDEN = TRUE;
};


instance DIA_CASSIA_MEHR(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_mehr_condition;
	information = dia_cassia_mehr_info;
	permanent = FALSE;
	description = "�������� ��� � ����� �����������.";
};


func int dia_cassia_mehr_condition()
{
	return TRUE;
};

func void dia_cassia_mehr_info()
{
	AI_Output(other,self,"DIA_Cassia_mehr_15_00");	//�������� ��� � ����� �����������.
	AI_Output(self,other,"DIA_Cassia_mehr_16_01");	//�������� ������������� ���. �� ����� �� �����, ��� ��������� ���� �������.
	AI_Output(self,other,"DIA_Cassia_mehr_16_02");	//�� ��������, ��� ������ �����, ��� ����������� ����������, ��������, ��� ��� �������, � � ��� ���������� �������.
	AI_Output(self,other,"DIA_Cassia_mehr_16_03");	//� ���� ��� �� ������ ���, �� ����� �������� ��������.
};


instance DIA_CASSIA_VORTEIL(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_vorteil_condition;
	information = dia_cassia_vorteil_info;
	permanent = FALSE;
	description = "� ����� ��� ������ �� ������������� � ���?";
};


func int dia_cassia_vorteil_condition()
{
	return TRUE;
};

func void dia_cassia_vorteil_info()
{
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_00");	//� ����� ��� ������ �� ������������� � ���?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_01");	//�� ������ ��������� � ��� ������ ������� - �������, ������� �������� ���� ���� � �������.
	AI_Output(other,self,"DIA_Cassia_Vorteil_15_02");	//�� ��� ����� ��� �������� ���������� �����, ��?
	AI_Output(self,other,"DIA_Cassia_Vorteil_16_03");	//(���� �������) ���. ���� ������ ����� �������������� ����� ������. ��� � ���.
};


instance DIA_CASSIA_LERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 4;
	condition = dia_cassia_lernen_condition;
	information = dia_cassia_lernen_info;
	permanent = FALSE;
	description = "���� � ���� ��������� � ���?";
};


func int dia_cassia_lernen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_lernen_info()
{
	AI_Output(other,self,"DIA_Cassia_Lernen_15_00");	//���� � ���� ��������� � ���?
	AI_Output(self,other,"DIA_Cassia_Lernen_16_01");	//������� ����� ������� ���� ������������� ��������.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_02");	//������� - ����������� ��������� �����������. �� ���� ����� �� ������ ����� ��� ���������.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_03");	//� � ���� ������� ���� ���������� ���������.
	AI_Output(self,other,"DIA_Cassia_Lernen_16_04");	//����� � ���� ������ ���� ����� ����� ������. ������ �������� - ���� � ��������� ������������.
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"������ ����� ������� ���� ���������� ��������� � ������ ��� ����� ����� ������.");
	b_logentry(TOPIC_CITYTEACHER,"������� ����� ������� ���� ������������ ���������.");
	b_logentry(TOPIC_CITYTEACHER,"������� ����� ������� ���� ��������.");
};


instance DIA_CASSIA_REGELN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 3;
	condition = dia_cassia_regeln_condition;
	information = dia_cassia_regeln_info;
	permanent = FALSE;
	description = "��� � ��� �� �������?";
};


func int dia_cassia_regeln_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_vorteil))
	{
		return TRUE;
	};
};

func void dia_cassia_regeln_info()
{
	AI_Output(other,self,"DIA_Cassia_Regeln_15_00");	//��� � ��� �� �������?
	AI_Output(self,other,"DIA_Cassia_Regeln_16_02");	//������ �������: ������ �� ����� � ���. �������.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_03");	//������: �� ���������.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_04");	//������: ���� �� �������� ������ �����, ����� ������� �� ����-������, �� ����� ����.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_05");	//� ��������� - ��������� �������: ���, ��� ����� �������������� � ���, ������ �������� ����������� ����� ���������.
};


instance DIA_CASSIA_ERWISCHEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_erwischen_condition;
	information = dia_cassia_erwischen_info;
	permanent = FALSE;
	description = "��� �����, ���� ���� �������?";
};


func int dia_cassia_erwischen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_erwischen_info()
{
	AI_Output(other,self,"DIA_Cassia_Erwischen_15_00");	//��� �����, ���� ���� �������?
	AI_Output(self,other,"DIA_Cassia_Erwischen_16_01");	//������ �� ���������, ������?
};


instance DIA_CASSIA_BEWEISEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_beweisen_condition;
	information = dia_cassia_beweisen_info;
	permanent = TRUE;
	description = "��� ��� �������� ����������� ���� ���������?";
};


var int dia_cassia_beweisen_permanent;

func int dia_cassia_beweisen_condition()
{
	if(Npc_KnowsInfo(other,dia_cassia_regeln) && (DIA_CASSIA_BEWEISEN_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_beweisen_info()
{
	AI_Output(other,self,"DIA_Cassia_beweisen_15_00");	//��� ��� �������� ����������� ���� ���������?
	if(JOIN_THIEFS == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_01");	//��� �� �������������� � ��� ��� ���?
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_beweisen_16_02");	//� ����� �������� �������� - �����������, ���� ���������� ������.
		AI_Output(self,other,"DIA_Cassia_beweisen_16_03");	//�� ��� ��� ������ �� � ����. � ����, ����� ��� �������� ��� ����.
		MIS_CASSIARING = LOG_RUNNING;
		DIA_CASSIA_BEWEISEN_PERMANENT = TRUE;
		Log_CreateTopic(TOPIC_CASSIARING,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIARING,LOG_RUNNING);
		b_logentry(TOPIC_CASSIARING,"������ �����, ����� � ������ �� ������ �����������.");
	};
};


instance DIA_CASSIA_BEITRETEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_beitreten_condition;
	information = dia_cassia_beitreten_info;
	permanent = FALSE;
	description = "������, � � ����.";
};


func int dia_cassia_beitreten_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_beitreten_info()
{
	AI_Output(other,self,"DIA_Cassia_Beitreten_15_00");	//������, � � ����.
	AI_Output(self,other,"DIA_Cassia_Beitreten_16_01");	//�������. ���� ����� ���� ����������� �������� ����. � ���� �� �������� ����-������ ��������� � ��� - ������ ����������.
	JOIN_THIEFS = TRUE;
};


instance DIA_CASSIA_ABLEHNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 9;
	condition = dia_cassia_ablehnen_condition;
	information = dia_cassia_ablehnen_info;
	permanent = FALSE;
	description = "� ��� ���� � �� ���� �������������� � ���?..";
};


func int dia_cassia_ablehnen_condition()
{
	if((JOIN_THIEFS == FALSE) && Npc_KnowsInfo(other,dia_cassia_regeln))
	{
		return TRUE;
	};
};

func void dia_cassia_ablehnen_info()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_15_00");	//� ��� ���� � �� ���� �������������� � ���?..
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_01");	//�� ������� ����, ������� ������ ���� ��� � �����, �� �� ������ ����.
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_02");	//(��������) � ���� �� �����, ����� ������� ���. �� ������ ��������� �� ����.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"������, � � ����.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"��� ����� ����� �� �����������.",dia_cassia_ablehnen_frist);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Ablehnen_16_03");	//� ����� ������, � ���� ����.
		Info_ClearChoices(dia_cassia_ablehnen);
		Info_AddChoice(dia_cassia_ablehnen,"������, � � ����.",dia_cassia_ablehnen_okay);
		Info_AddChoice(dia_cassia_ablehnen,"��, ����� �������� ���� �����.",dia_cassia_ablehnen_kill);
	};
};

func void dia_cassia_ablehnen_okay()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Okay_15_00");	//������, � � ����.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_01");	//(���������) �� ������ ������ �������. ���� �� ������� �������� ����������� ����� ���������, �� ������� ������� � ���� ����.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Okay_16_02");	//���� �� �� ������ ������� �������� ��������� ������ - ���������� - ��� ���� �����������.
	JOIN_THIEFS = TRUE;
	Info_ClearChoices(dia_cassia_ablehnen);
};

func void dia_cassia_ablehnen_kill()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Kill_15_00");	//��, ����� �������� ���� �����.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Kill_16_01");	//����. � ������, �� �����.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_cassia_ablehnen_frist()
{
	AI_Output(other,self,"DIA_Cassia_Ablehnen_Frist_15_00");	//��� ����� ����� �� �����������.
	AI_Output(self,other,"DIA_Cassia_Ablehnen_Frist_16_01");	//����������. � ��� ���� ��� ��� �� �������� ����� �������. ����� �����, ���� ����� �� ���������� �����.
	CASSIA_DAY = b_getdayplus();
	CASSIA_FRIST = TRUE;
	Info_ClearChoices(dia_cassia_ablehnen);
};


instance DIA_CASSIA_BEVORLERNEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 5;
	condition = dia_cassia_bevorlernen_condition;
	information = dia_cassia_bevorlernen_info;
	permanent = TRUE;
	description = "�� ������ ������� ����?";
};


func int dia_cassia_bevorlernen_condition()
{
	if((JOIN_THIEFS == TRUE) && Npc_KnowsInfo(other,dia_cassia_lernen) && ((CASSIA_TEACHPICKPOCKET == FALSE) || (CASSIA_TEACHDEX == FALSE)))
	{
		return TRUE;
	};
};

func void dia_cassia_bevorlernen_info()
{
	AI_Output(other,self,"DIA_Cassia_BevorLernen_15_00");	//�� ������ ������� ����?
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_01");	//�������, ��� �������. ������ ����� ���, ����� ������ �����.
		CASSIA_TEACHPICKPOCKET = TRUE;
		CASSIA_TEACHDEX = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_16_02");	//�������. ��������� ��������� � �������� ��������� ���� �� 100 ������� �����.
		Info_ClearChoices(dia_cassia_bevorlernen);
		Info_AddChoice(dia_cassia_bevorlernen,"����� ����, �����... (�����)",dia_cassia_bevorlernen_spaeter);
		if(CASSIA_TEACHPICKPOCKET == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"� ���� ��������� ���������� ��������� (��������� 100 �������).",dia_cassia_bevorlernen_pickpocket);
		};
		if(CASSIA_TEACHDEX == FALSE)
		{
			Info_AddChoice(dia_cassia_bevorlernen,"� ���� ����� ����� ������ (��������� 100 �������).",dia_cassia_bevorlernen_dex);
		};
	};
};

func void dia_cassia_bevorlernen_spaeter()
{
	Info_ClearChoices(dia_cassia_bevorlernen);
};

func void dia_cassia_bevorlernen_dex()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_DEX_15_00");	//� ���� ����� ����� ������. ��� ������.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_DEX_16_01");	//�� ����� ������, ����� �� ������ �����.
		CASSIA_TEACHDEX = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_DIA_Cassia_BevorLernen_DEX_16_02");	//�����������, ����� � ���� ����� ������.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};

func void dia_cassia_bevorlernen_pickpocket()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(other,self,"DIA_Cassia_BevorLernen_Pickpocket_15_00");	//� ���� ��������� ���������� ���������. ��� ������.
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_01");	//�� ����� ������, ����� �� ������ �����.
		CASSIA_TEACHPICKPOCKET = TRUE;
		Info_ClearChoices(dia_cassia_bevorlernen);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_BevorLernen_Pickpocket_16_02");	//�����������, ����� � ���� ����� ������.
		Info_ClearChoices(dia_cassia_bevorlernen);
	};
};


instance DIA_CASSIA_TEACH(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 12;
	condition = dia_cassia_teach_condition;
	information = dia_cassia_teach_info;
	permanent = TRUE;
	description = "� ���� ����� ����� ������.";
};


func int dia_cassia_teach_condition()
{
	if(CASSIA_TEACHDEX == TRUE)
	{
		return TRUE;
	};
};

func void dia_cassia_teach_info()
{
	AI_Output(other,self,"DIA_Cassia_TEACH_15_00");	//� ���� ����� ����� ������.
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};

func void dia_cassia_teach_back()
{
	Info_ClearChoices(dia_cassia_teach);
};

func void dia_cassia_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,90);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};

func void dia_cassia_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,90);
	Info_ClearChoices(dia_cassia_teach);
	Info_AddChoice(dia_cassia_teach,DIALOG_BACK,dia_cassia_teach_back);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_cassia_teach_1);
	Info_AddChoice(dia_cassia_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_cassia_teach_5);
};


instance DIA_CASSIA_PICKPOCKET(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 10;
	condition = dia_cassia_pickpocket_condition;
	information = dia_cassia_pickpocket_info;
	permanent = TRUE;
	description = "����� ���� ���������� ��������� (5 ����� ��������)";
};


func int dia_cassia_pickpocket_condition()
{
	if((CASSIA_TEACHPICKPOCKET == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE))
	{
		return TRUE;
	};
};

func void dia_cassia_pickpocket_info()
{
	AI_Output(other,self,"DIA_Cassia_Pickpocket_15_00");	//����� ���� ���������� ���������.
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKPOCKET))
	{
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_01");	//���� �� ������ ��������� ���-������ �������, ������� ���. ������ ����� �������� � ���, ��������.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_02");	//� ����� ������ �������������, ����� ���. ������� �������� �� ���������������� �������, ������������� ��� ������� ������ �� ���. �, ����� �������, ��������� �������, ��������� �� ���������.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_03");	//��������� ������� ��������� �������� - ��� ������ �� �� �� �����, ��� ������� � ����������� ��������. ����� �� ����.
		AI_Output(self,other,"DIA_Cassia_Pickpocket_16_04");	//���� �� �������, �� ������� �� ������ ��������. �, ������� �����: ������ �������� ������������.
	};
};


instance DIA_CASSIA_AUFNAHME(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_aufnahme_condition;
	information = dia_cassia_aufnahme_info;
	permanent = FALSE;
	description = "� ������ ������ �����������.";
};


func int dia_cassia_aufnahme_condition()
{
	if((MIS_CASSIARING == LOG_RUNNING) && (Npc_HasItems(other,itri_prot_point_01_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_cassia_aufnahme_info()
{
	AI_Output(other,self,"DIA_Cassia_Aufnahme_15_00");	//� ������ ������ �����������.
	b_giveinvitems(other,self,itri_prot_point_01_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_01");	//����������. �� ������ ������������� ����. ������ �� ���� �� ���.
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_02");	//������ ���� ����. �� ��������� ����� � �����. (���������) ������ ���� �� �������� ������ ��� ����� ����.
	b_giveinvitems(self,other,itke_thiefguildkey_hotel_mis,1);
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_03");	//����� ����, �� ������ �����, ��� � ��� ���� ��������� ����. ������ �����.
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Cassia_Aufnahme_16_04");	//��� �����. ����� �� �������� � ����������� ������ � ������� ���� ����, ��� ������, ��� �� ���� �� ���.
	MIS_CASSIARING = LOG_SUCCESS;
	b_giveplayerxp(XP_CASSIARING);
	KNOWS_SECRETSIGN = TRUE;
	Log_CreateTopic(TOPIC_DIEBESGILDE,LOG_NOTE);
	b_logentry(TOPIC_DIEBESGILDE,"� ��� ������ � ������� �����.");
	b_logentry(TOPIC_DIEBESGILDE,"� ���� ���� �����. ���� � ������ ��� ������ �����, ��� ������, ��� � ���� �� ���.");
};


instance DIA_CASSIA_VERSTECK(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_versteck_condition;
	information = dia_cassia_versteck_info;
	permanent = FALSE;
	description = "� ��� �� ������� ������������?";
};


func int dia_cassia_versteck_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && Npc_KnowsInfo(other,dia_ramirez_beute))
	{
		return TRUE;
	};
};

func void dia_cassia_versteck_info()
{
	AI_Output(other,self,"DIA_Cassia_Versteck_15_00");	//� ��� �� ������� ������������?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_01");	//�� �������, � ���� ��� ��� ������ ��� � ������?
	AI_Output(self,other,"DIA_Cassia_Versteck_16_02");	//� ���� ����� ���������� ������������ ������ ��������� ���������. ����� - ������ ������ �������� �� � ���.
};


instance DIA_CASSIA_BLUTKELCHE(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_blutkelche_condition;
	information = dia_cassia_blutkelche_info;
	permanent = FALSE;
	description = "� ���� ���� ������ ��� ����?";
};


func int dia_cassia_blutkelche_condition()
{
	if((MIS_CASSIARING == LOG_SUCCESS) && (MIS_CASSIAKELCHE != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_cassia_blutkelche_info()
{
	AI_Output(other,self,"DIA_Cassia_Blutkelche_15_00");	//� ���� ���� ������ ��� ����?
	if(PETZCOUNTER_CITY_THEFT > 0)
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_01");	//���, ���� �� �������������� � ������ �� ���������.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_02");	//���������� ��� �������� - ������� ����� ��� �������� �� ����������. ���� �� �������, ��� �� ��� ��������, ���� �� ���� �������� ������ �� ����.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_03");	//��. ���� ���������� ��������� ������. ����� �� �����.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_04");	//������ ����� �������� �� ���-�� �� ����� ����� �� ����� �������� - �� ��� ����� ��� �������� �������� ����� ����� ����� �����. ��� ������ ��� ���������� �������� �����.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_05");	//������ �� ������ ��� �� ���� �� �������� ����� - �� ��� �����, ��������� ������, ����� ����� ���������.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_06");	//��� ��� �����?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_07");	//��� �����, � ������ - ��� ������� ������� �������� �� �������� ��������.
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_08");	//������� �� ���. � ��� �������� � ������ ���������� ��� ���.
		AI_Output(other,self,"DIA_Cassia_Blutkelche_15_09");	//� ��� ��� � ����� �����?
		AI_Output(self,other,"DIA_Cassia_Blutkelche_16_10");	//���� �������� �� ������, ���� �� ������� ������� ���-������ �� ���� ������������.
		MIS_CASSIAKELCHE = LOG_RUNNING;
		Log_CreateTopic(TOPIC_CASSIAKELCHE,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_CASSIAKELCHE,LOG_RUNNING);
		b_logentry(TOPIC_CASSIAKELCHE,"������ �����, ����� � ������ �� ����� �������� ������. ��-��������, ��� ��������� � ������.");
	};
};


instance DIA_CASSIA_ABGEBEN(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_abgeben_condition;
	information = dia_cassia_abgeben_info;
	permanent = TRUE;
	description = "������ �������� ������...";
};


func int dia_cassia_abgeben_condition()
{
	if(MIS_CASSIAKELCHE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_cassia_abgeben_info()
{
	AI_Output(other,self,"DIA_Cassia_abgeben_15_00");	//������ �������� ������...
	if(b_giveinvitems(other,self,itmi_bloodcup_mis,6))
	{
		AI_Output(other,self,"DIA_Cassia_abgeben_15_01");	//� ���� ���� ��� ����� ������.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_02");	//�������� ������. � � ��� �������� ��������� ����������.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_03");	//�� ������ �������� ���� �������. �������, ��� ������ ��� ��� ����.
		AI_Output(self,other,"DIA_Cassia_abgeben_16_04");	//��� ������ ������ ���� ����������, �� �� ������ ������� � ����, ����� ��������. �� � ������ ����� - �� ���� ������� ����� ��� ����� �����... (���������)
		MIS_CASSIAKELCHE = LOG_SUCCESS;
		b_giveplayerxp(XP_CASSIABLUTKELCHE);
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_abgeben_16_05");	//� ���� ������� ��� ����� ������ ��� ������. ������� ��� ��� �����.
	};
};


instance DIA_CASSIA_BELOHNUNG(C_INFO)
{
	npc = vlk_447_cassia;
	nr = 2;
	condition = dia_cassia_belohnung_condition;
	information = dia_cassia_belohnung_info;
	permanent = FALSE;
	description = "� ������ �� ����� ��������.";
};


func int dia_cassia_belohnung_condition()
{
	if(MIS_CASSIAKELCHE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_cassia_belohnung_info()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_00");	//� ������ �� ����� ��������.
	AI_Output(self,other,"DIA_Cassia_Belohnung_16_01");	//��� �� ���������?
	Info_ClearChoices(dia_cassia_belohnung);
	Info_AddChoice(dia_cassia_belohnung,"400 �������.",dia_cassia_belohnung_gold);
	Info_AddChoice(dia_cassia_belohnung,"4 �������� ��������",dia_cassia_belohnung_trank);
	Info_AddChoice(dia_cassia_belohnung,"������ �������� ����",dia_cassia_belohnung_ring);
};

func void dia_cassia_belohnung_gold()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_02");	//��� ��� ������.
	b_giveinvitems(self,other,itmi_gold,400);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_trank()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_03");	//��� ��� �����.
	b_giveinvitems(self,other,itpo_health_03,4);
	Info_ClearChoices(dia_cassia_belohnung);
};

func void dia_cassia_belohnung_ring()
{
	AI_Output(other,self,"DIA_Cassia_Belohnung_15_04");	//��� ��� ������.
	b_giveinvitems(self,other,itri_prot_edge_01,1);
	Info_ClearChoices(dia_cassia_belohnung);
};

