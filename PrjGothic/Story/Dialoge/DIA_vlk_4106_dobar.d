
instance DIA_DOBAR_EXIT(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 999;
	condition = dia_dobar_exit_condition;
	information = dia_dobar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dobar_exit_condition()
{
	return TRUE;
};

func void dia_dobar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DOBAR_HALLO(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 2;
	condition = dia_dobar_hallo_condition;
	information = dia_dobar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dobar_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_dobar_hallo_info()
{
	AI_Output(self,other,"DIA_Dobar_HALLO_08_00");	//(��������������) ��� ���� �����?
};


instance DIA_DOBAR_TALENT(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 3;
	condition = dia_dobar_talent_condition;
	information = dia_dobar_talent_info;
	permanent = FALSE;
	description = "� ������� ���� ��������� ����.";
};


func int dia_dobar_talent_condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		return TRUE;
	};
};

func void dia_dobar_talent_info()
{
	AI_Output(other,self,"DIA_Dobar_Talent_15_00");	//� ������� ���� ��������� ����.
	AI_Output(self,other,"DIA_Dobar_Talent_08_01");	//������... � ���?
};


instance DIA_DOBAR_SCHMIEDE(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 3;
	condition = dia_dobar_schmiede_condition;
	information = dia_dobar_schmiede_info;
	permanent = FALSE;
	description = "���� � ��������������� ����� ��������?";
};


func int dia_dobar_schmiede_condition()
{
	if(Npc_KnowsInfo(other,dia_dobar_talent))
	{
		return TRUE;
	};
};

func void dia_dobar_schmiede_info()
{
	AI_Output(other,self,"DIA_Dobar_Schmiede_15_00");	//���� � ��������������� ����� ��������?
	AI_Output(self,other,"DIA_Dobar_Schmiede_08_01");	//� ���� ����� ������. �� ����� ������ ������ ���� �����. ����� ������� �������.
	AI_Output(self,other,"DIA_Dobar_Schmiede_08_02");	//����� ������ � � ������ �����, � �� ������� �������� ����������.
};


instance DIA_DOBAR_BEIBRINGEN(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 2;
	condition = dia_dobar_beibringen_condition;
	information = dia_dobar_beibringen_info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_dobar_beibringen_condition()
{
	if(Npc_KnowsInfo(other,dia_dobar_talent))
	{
		return TRUE;
	};
};

func void dia_dobar_beibringen_info()
{
	AI_Output(other,self,"DIA_Dobar_beibringen_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_Dobar_beibringen_08_01");	//�� ��� ������ ������. � ���� �������� ����, ��� �������� ���� ������.
	AI_Output(self,other,"DIA_Dobar_beibringen_08_02");	//� �� ������� ������ ����� ����������� ������.
	DOBAR_LEARNSMITH = TRUE;
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"����� ����� ������� ���� ������ ������� ������.");
};


instance DIA_DOBAR_TEACH(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 3;
	condition = dia_dobar_teach_condition;
	information = dia_dobar_teach_info;
	description = b_buildlearnstring("������ ���, ��� �������� ������� ���!",b_getlearncosttalent(other,NPC_TALENT_SMITH));
	permanent = TRUE;
};


func int dia_dobar_teach_condition()
{
	if((DOBAR_LEARNSMITH == TRUE) && (PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE))
	{
		return TRUE;
	};
};

func void dia_dobar_teach_info()
{
	AI_Output(other,self,"DIA_Dobar_Teach_15_00");	//������ ���, ��� �������� ������� ���!
	if(b_teachplayertalentsmith(self,hero,WEAPON_1H_SPECIAL_01))
	{
		AI_Output(self,other,"DIA_Dobar_Teach_08_01");	//�������� �����, ����� ��� ���������� ��������� �� ���� �����, ��� ����� ������� ��� �� ��������.
		AI_Output(self,other,"DIA_Dobar_Teach_08_02");	//���� �� ������ ������� ���, ��������� ����� ������ ����� ������� � ������.
		AI_Output(self,other,"DIA_Dobar_Teach_08_03");	//��� ���, ��� ���� ����� �����. ���� ���� ����� ����� �����, �������� � �������.
	};
};


instance DIA_DOBAR_WAFFE(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 80;
	condition = dia_dobar_waffe_condition;
	information = dia_dobar_waffe_info;
	permanent = FALSE;
	description = "�� ������ ������� ������ ��� ����?";
};


func int dia_dobar_waffe_condition()
{
	return TRUE;
};

func void dia_dobar_waffe_info()
{
	AI_Output(other,self,"DIA_Dobar_Waffe_15_00");	//�� ������ ������� ������ ��� ����?
	AI_Output(self,other,"DIA_Dobar_Waffe_08_01");	//� ���� ��� ������� �� ���. ������ ������������� ���� ������� - � ������ ��� ���, � ������ ����������.
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"������ ������� ������� � �����.");
};


instance DIA_DOBAR_NEWS(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 900;
	condition = dia_dobar_news_condition;
	information = dia_dobar_news_info;
	permanent = TRUE;
	description = "��� ������?";
};


func int dia_dobar_news_condition()
{
	return TRUE;
};

func void dia_dobar_news_info()
{
	AI_Output(other,self,"DIA_Dobar_NEWS_15_00");	//��� ������?
	if(DOBAR_EINMALIG == FALSE)
	{
		AI_Output(self,other,"DIA_Dobar_NEWS_08_01");	//� ��� ������ ��� ������� �����. � ��� ���, ��� �� ������� ����, � �� ������ �� �������.
		AI_Output(self,other,"DIA_Dobar_NEWS_08_02");	//��� ������ ��� ����� ����������. �� ��� ������� ���� ��������� �����!
		if(Npc_IsDead(parlaf) == FALSE)
		{
			b_turntonpc(self,parlaf);
			AI_Output(self,other,"DIA_Dobar_NEWS_08_03");	//(�����) ��, ������ - ��������� ��� ���� ������� - ���� ��������� ������� ����������!
			b_turntonpc(self,other);
		};
		DOBAR_EINMALIG = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dobar_NEWS_08_04");	//����� �� ���� � �����. ���� �� �� ��������� �� �������� ����, ������ ������������ �� �������.
	};
};


instance DIA_DOBAR_PICKPOCKET(C_INFO)
{
	npc = vlk_4106_dobar;
	nr = 900;
	condition = dia_dobar_pickpocket_condition;
	information = dia_dobar_pickpocket_info;
	permanent = TRUE;
	description = "(������� ��� ����� ���� ����� ������)";
};


func int dia_dobar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itmi_nugget) >= 1) && (other.attribute[ATR_DEXTERITY] >= (79 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_dobar_pickpocket_info()
{
	Info_ClearChoices(dia_dobar_pickpocket);
	Info_AddChoice(dia_dobar_pickpocket,DIALOG_BACK,dia_dobar_pickpocket_back);
	Info_AddChoice(dia_dobar_pickpocket,DIALOG_PICKPOCKET,dia_dobar_pickpocket_doit);
};

func void dia_dobar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 79)
	{
		b_giveinvitems(self,other,itmi_nugget,1);
		b_givethiefxp();
		Info_ClearChoices(dia_dobar_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_dobar_pickpocket_back()
{
	Info_ClearChoices(dia_dobar_pickpocket);
};

