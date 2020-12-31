
instance DIA_RAMIREZ_EXIT(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 999;
	condition = dia_ramirez_exit_condition;
	information = dia_ramirez_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ramirez_exit_condition()
{
	return TRUE;
};

func void dia_ramirez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RAMIREZ_PICKPOCKET(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 900;
	condition = dia_ramirez_pickpocket_condition;
	information = dia_ramirez_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_ramirez_pickpocket_condition()
{
	return c_beklauen(90,300);
};

func void dia_ramirez_pickpocket_info()
{
	Info_ClearChoices(dia_ramirez_pickpocket);
	Info_AddChoice(dia_ramirez_pickpocket,DIALOG_BACK,dia_ramirez_pickpocket_back);
	Info_AddChoice(dia_ramirez_pickpocket,DIALOG_PICKPOCKET,dia_ramirez_pickpocket_doit);
};

func void dia_ramirez_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ramirez_pickpocket);
};

func void dia_ramirez_pickpocket_back()
{
	Info_ClearChoices(dia_ramirez_pickpocket);
};


instance DIA_RAMIREZ_ZEICHEN(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_zeichen_condition;
	information = dia_ramirez_zeichen_info;
	permanent = FALSE;
	description = "(�������� ������ �����)";
};


func int dia_ramirez_zeichen_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_ramirez_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Ramirez_Zeichen_14_00");	//���, ���, ���� � ����. (������) � ��������.
};


instance DIA_RAMIREZ_HALLO(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_hallo_condition;
	information = dia_ramirez_hallo_info;
	permanent = TRUE;
	important = TRUE;
};


var int dia_ramirez_hallo_permanent;

func int dia_ramirez_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_RAMIREZ_HALLO_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_ramirez_hallo_info()
{
	if((self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (JOIN_THIEFS == FALSE))
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_00");	//�� ���, ����������? ��-�����, ��� �� ����� ���������� ����� ��� ����.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_01");	//���� ����� � ����� ���-������ ��������, ���� ����� �� ������ �� ������. ��� ��� ���� ���������. (������� �������)
	};
	if(JOIN_THIEFS == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_02");	//����, �� � ����. ��� �, ����� � ����� ���� ������ - �� ���� ���������.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_03");	//��, � ��� ���� - ���� �� ���������� ��� �� ��� �������, � ��� �� ���������.
		AI_Output(self,other,"DIA_Ramirez_Hallo_14_04");	//�� �����, �����, �� ���� �� ���. ���. �� ������ � �� ������.
		DIA_RAMIREZ_HALLO_PERMANENT = TRUE;
	};
	DG_GEFUNDEN = TRUE;
};


instance DIA_RAMIREZ_BEUTE(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 3;
	condition = dia_ramirez_beute_condition;
	information = dia_ramirez_beute_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ramirez_beute_condition()
{
	if((Mob_HasItems("THIEF_CHEST_01",itmi_gold) < 50) || (Mob_HasItems("THIEF_CHEST_02",itmi_gold) < 100) || (Mob_HasItems("THIEF_CHEST_02",itmi_silvercup) == FALSE) || (Mob_HasItems("THIEF_CHEST_03",itmi_gold) < 75))
	{
		return TRUE;
	};
};

func void dia_ramirez_beute_info()
{
	AI_Output(self,other,"DIA_Ramirez_Beute_14_00");	//��������, �� ���, ��������� ��� ��������? �� ��������� ������� ����� �������... �� ���, ��������� ������ � ���?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_01");	//�� ����� �������������� ��� ��-�� ���� �����.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_02");	//� ���� �������, ��� ������, ��� ���� ����� - ��� ���, ��� ��� ������� ���������? ��� ���, ��� ������� ����� �������� ����� ����������?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_03");	//��� ������, ��� ���� ��������� �������� �����?
	AI_Output(other,self,"DIA_Ramirez_Beute_15_04");	//��, � ���� �� ���� � ��� ��������. � ��� �� ������� ���� ���������?
	AI_Output(self,other,"DIA_Ramirez_Beute_14_05");	//� ����� �������� �����.
	AI_Output(other,self,"DIA_Ramirez_Beute_15_06");	//�������.
	AI_Output(self,other,"DIA_Ramirez_Beute_14_07");	//������, �� ������ �������� ���� ��� ������. �� � ���� ������������� �� �����. ��� ��� �� ������� ��������� ���� ����.
};


instance DIA_RAMIREZ_BEZAHLEN(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 9;
	condition = dia_ramirez_bezahlen_condition;
	information = dia_ramirez_bezahlen_info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ����-������?";
};


var int dia_ramirez_bezahlen_permanent;

func int dia_ramirez_bezahlen_condition()
{
	if((JOIN_THIEFS == TRUE) && (DIA_RAMIREZ_BEZAHLEN_PERMANENT == FALSE) && Npc_KnowsInfo(other,dia_cassia_lernen))
	{
		return TRUE;
	};
};

func void dia_ramirez_bezahlen_info()
{
	if(MIS_THIEFGUILD_SUCKED == FALSE)
	{
		RAMIREZ_COST = 150;
	}
	else
	{
		RAMIREZ_COST = 300;
	};
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_15_00");	//�� ������ ������� ���� ����-������?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_01");	//��� ������ ���� �����. �� ��� ������ �� �������� ���.
		if(other.attribute[ATR_DEXTERITY] < 100)
		{
			AI_Output(self,other,"DIA_Ramirez_Add_14_00");	//������ ���� �������� ������ �������� ���� ��������...
		};
		DIA_RAMIREZ_BEZAHLEN_PERMANENT = TRUE;
		Info_ClearChoices(dia_ramirez_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_14_02");	//� ���� �������� ����, ��� ������������ ���������. ��� ����� ������ ����...
		b_say_gold(self,other,RAMIREZ_COST);
		Info_ClearChoices(dia_ramirez_bezahlen);
		Info_AddChoice(dia_ramirez_bezahlen,"����� ����, ����� ...(�����)",dia_ramirez_bezahlen_spaeter);
		Info_AddChoice(dia_ramirez_bezahlen,"������, � ����� ���������...",dia_ramirez_bezahlen_okay);
	};
};

func void dia_ramirez_bezahlen_spaeter()
{
	Info_ClearChoices(dia_ramirez_bezahlen);
};

func void dia_ramirez_bezahlen_okay()
{
	AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_00");	//������, � ����� ���������...
	if(b_giveinvitems(other,self,itmi_gold,RAMIREZ_COST))
	{
		AI_Output(other,self,"DIA_Ramirez_Bezahlen_Okay_15_01");	//...��� ������.
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_02");	//�������. � � ����� �������.
		RAMIREZ_TEACHPLAYER = TRUE;
		DIA_RAMIREZ_BEZAHLEN_PERMANENT = TRUE;
		Info_ClearChoices(dia_ramirez_bezahlen);
	}
	else
	{
		AI_Output(self,other,"DIA_Ramirez_Bezahlen_Okay_14_03");	//�����������, ����� ����������� ������.
		Info_ClearChoices(dia_ramirez_bezahlen);
	};
};


instance DIA_RAMIREZ_TEACH(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 99;
	condition = dia_ramirez_teach_condition;
	information = dia_ramirez_teach_info;
	permanent = TRUE;
	description = "����� ���� ��������� �����!";
};


func int dia_ramirez_teach_condition()
{
	if((RAMIREZ_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE))
	{
		return TRUE;
	};
};

func void dia_ramirez_teach_info()
{
	AI_Output(other,self,"DIA_Ramirez_Teach_15_00");	//����� ���� ������������ ���������!
	if(RAMIREZ_ZWEIMAL == FALSE)
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_06");	//�������� ������ - ��� ������ ���������.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_01");	//��� ����� ����� �������������� �������� � ��������. � ���� ������� �������.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_02");	//��������� �������, �������, ������� �� ������ �����, ������� ����� ������� ������ ���������� ������.
		RAMIREZ_ZWEIMAL = TRUE;
	};
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Ramirez_Teach_14_03");	//����, ������ ����� ������, � ����������� ������� ����� � ������.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_04");	//���� �� ������ ������������ �� ������� ������ ��� ������� ������, ��� ���������.
		AI_Output(self,other,"DIA_Ramirez_Teach_14_05");	//�� ��� ����� ������� �� ������ �����������, ��� ����� ���� ����� ����������� � ���� ��������� ������������.
	};
};


instance DIA_RAMIREZ_VIERTEL(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 8;
	condition = dia_ramirez_viertel_condition;
	information = dia_ramirez_viertel_info;
	permanent = FALSE;
	description = "��� �� �������������� ��� ����������� ���� ����?";
};


func int dia_ramirez_viertel_condition()
{
	if(KNOWS_SECRETSIGN == TRUE)
	{
		return TRUE;
	};
};

func void dia_ramirez_viertel_info()
{
	AI_Output(other,self,"DIA_Ramirez_Viertel_15_00");	//��� �� �������������� ��� ����������� ���� ����?
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_01");	//� ������� ����� ������, ������� ��.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_02");	//�� ���� �� ������ ���������� � �����-�� ���, ����� ��������� ����, ����� ��� ���� - �� ����������� ��������� ������.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_03");	//��� ����������� ����� ��� ����. � ���� ������ �� ��� - �����. ��� ���������� ������ ������.
	AI_Output(self,other,"DIA_Ramirez_Viertel_14_04");	//��� ������ ����� ��������, �� ���� �� ��� ���������, ���� ������ �� � ��� �� ����� ����� �����������.
};


instance DIA_RAMIREZ_SEXTANT(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_sextant_condition;
	information = dia_ramirez_sextant_info;
	permanent = FALSE;
	description = "� ���� ���� ������ ��� ����?";
};


func int dia_ramirez_sextant_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (MIS_CASSIARING == LOG_SUCCESS) && (KAPITEL >= 2))
	{
		return TRUE;
	};
};

func void dia_ramirez_sextant_info()
{
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_00");	//� ���� ���� ������ ��� ����?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_01");	//���... ���� ������, ������� � ����� �� ����������. �� � ����� �� ���� ����� ��.
	AI_Output(other,self,"DIA_Ramirez_Sextant_15_02");	//��� �� ����� �� ��������?
	AI_Output(self,other,"DIA_Ramirez_Sextant_14_03");	//��������. ������� ��� �������� - � ������� �� ���� ������� ����.
	Log_CreateTopic(TOPIC_RAMIREZSEXTANT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RAMIREZSEXTANT,LOG_RUNNING);
	b_logentry(TOPIC_RAMIREZSEXTANT,"������� �����, ����� � ������ ��� ��������.");
	MIS_RAMIREZSEXTANT = LOG_RUNNING;
};


instance DIA_RAMIREZ_SUCCESS(C_INFO)
{
	npc = vlk_445_ramirez;
	nr = 2;
	condition = dia_ramirez_success_condition;
	information = dia_ramirez_success_info;
	permanent = FALSE;
	description = "� ������ ���� ��������.";
};


func int dia_ramirez_success_condition()
{
	if(Npc_KnowsInfo(other,dia_ramirez_sextant) && (Npc_HasItems(other,itmi_sextant) > 0))
	{
		return TRUE;
	};
};

func void dia_ramirez_success_info()
{
	AI_Output(other,self,"DIA_Ramirez_Success_15_00");	//� ������ ���� ��������.
	b_giveinvitems(other,self,itmi_sextant,1);
	AI_Output(self,other,"DIA_Ramirez_Success_14_01");	//����������. ���� ������� ����� ���!
	AI_Output(self,other,"DIA_Ramirez_Success_14_02");	//���, �����, �� �������� ��� ������.
	b_giveinvitems(self,other,itmi_gold,VALUE_SEXTANT / 2);
	RAMIREZ_SEXTANT = TRUE;
	MIS_RAMIREZSEXTANT = LOG_SUCCESS;
	b_giveplayerxp(XP_RAMIREZSEXTANT);
};

