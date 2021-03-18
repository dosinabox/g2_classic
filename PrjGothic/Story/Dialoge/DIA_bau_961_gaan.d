
instance DIA_GAAN_EXIT(C_INFO)
{
	npc = bau_961_gaan;
	nr = 999;
	condition = dia_gaan_exit_condition;
	information = dia_gaan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


var int dia_gaan_exit_onetime;

func int dia_gaan_exit_condition()
{
	return TRUE;
};

func void dia_gaan_exit_info()
{
	AI_StopProcessInfos(self);
	if(DIA_GAAN_EXIT_ONETIME == FALSE)
	{
		Npc_ExchangeRoutine(self,"Start");
		DIA_GAAN_EXIT_ONETIME = TRUE;
	};
};


instance DIA_GAAN_HALLO(C_INFO)
{
	npc = bau_961_gaan;
	nr = 3;
	condition = dia_gaan_hallo_condition;
	information = dia_gaan_hallo_info;
	description = "� ���� ����� ���������.";
};


func int dia_gaan_hallo_condition()
{
	return TRUE;
};

func void dia_gaan_hallo_info()
{
	AI_Output(other,self,"DIA_Gaan_HALLO_15_00");	//� ���� ����� ���������.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_01");	//��, ��� ����� ��������. �� ���� �� ������� �� ��� ���� �������, �� ������ ���������� ���� ������.
	AI_Output(self,other,"DIA_Gaan_HALLO_03_02");	//���� ���� ������ ����� �������� ����������� �� ����, ������, �� ��� �� ����� ������ ��������.
};


instance DIA_GAAN_WASMACHSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 4;
	condition = dia_gaan_wasmachstdu_condition;
	information = dia_gaan_wasmachstdu_info;
	description = "��� ��?";
};


func int dia_gaan_wasmachstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_hallo))
	{
		return TRUE;
	};
};

func void dia_gaan_wasmachstdu_info()
{
	AI_Output(other,self,"DIA_Gaan_WASMACHSTDU_15_00");	//��� ��?
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_01");	//���� ����� ����. � ������� � ������� �� �������, �������, ���������� ����� ������������� ����������.
	AI_Output(self,other,"DIA_Gaan_WASMACHSTDU_03_02");	//� ������� ������� ����� ������� �� �������, ������ �� ������.
};


instance DIA_GAAN_WALD(C_INFO)
{
	npc = bau_961_gaan;
	nr = 5;
	condition = dia_gaan_wald_condition;
	information = dia_gaan_wald_info;
	description = "��� ��� ����� ����� � ������ ��������?";
};


func int dia_gaan_wald_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_gaan_wald_info()
{
	AI_Output(other,self,"DIA_Gaan_WALD_15_00");	//��� ��� ����� ����� � ������ ��������?
	AI_Output(self,other,"DIA_Gaan_WALD_03_01");	//������� �� ����. � ����� ��� ������ ������ �������. �� ���, ��� ������� ������.
	AI_Output(self,other,"DIA_Gaan_WALD_03_02");	//����� �����, ���� �� ������� ���� �� �������, ��������� ������������ �������.
	AI_Output(self,other,"DIA_Gaan_WALD_03_03");	//�� ������ ����� ���� ����� ������� ������, ���� �� ������ ����� �������� ����. ������ ���� ������ � ����������.
	AI_Output(self,other,"DIA_Gaan_WALD_03_04");	//������, ����� ���� ������ �������, ����� ���� ����� ����������.
	AI_Output(self,other,"DIA_Gaan_WALD_03_05");	//��� ������ �� ������� ������ ���� � ������-������������.
};


instance DIA_GAAN_SAGITTA(C_INFO)
{
	npc = bau_961_gaan;
	nr = 7;
	condition = dia_gaan_sagitta_condition;
	information = dia_gaan_sagitta_info;
	description = "������-������������?";
};


func int dia_gaan_sagitta_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_wald))
	{
		return TRUE;
	};
};

func void dia_gaan_sagitta_info()
{
	AI_Output(other,self,"DIA_Gaan_SAGITTA_15_00");	//������-������������?
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_01");	//�� ����� �������. ��� ����� �������� � ������ �����, ������� ��� ������.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_02");	//����� ���������� �������.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_03");	//������ �� �������� ������ � ���, � ��� ������� ���������� � ��� �������.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_04");	//��, ���� �� ���������, �� ����� �� ������� ������ ������, ��� � �������, �� �� �����, ������ �������� ����.
	AI_Output(self,other,"DIA_Gaan_SAGITTA_03_05");	//�� ������� �� � ���� �� ������ ������.
};


instance DIA_GAAN_MONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 8;
	condition = dia_gaan_monster_condition;
	information = dia_gaan_monster_info;
	description = "� ��� �������� ���� ������� �����?";
};


func int dia_gaan_monster_condition()
{
	if((MIS_GAAN_SNAPPER == LOG_RUNNING) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_monster_info()
{
	AI_Output(other,self,"DIA_Gaan_MONSTER_15_00");	//� ��� �������� ���� ������� �����?
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_01");	//� ����� �� ����. � ������ ������ �������� � ������� ������. �� �����, ��� �� ����� �������.
	AI_Output(self,other,"DIA_Gaan_MONSTER_03_02");	//���� ����� ������ ���. ���� ����� ���-�� ������� ������ ����� ������.
};


instance DIA_GAAN_WASZAHLSTDU(C_INFO)
{
	npc = bau_961_gaan;
	nr = 9;
	condition = dia_gaan_waszahlstdu_condition;
	information = dia_gaan_waszahlstdu_info;
	description = "������� �� ���������, ���� � ���� ����� ����� ��� ����?";
};


func int dia_gaan_waszahlstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_monster) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_waszahlstdu_info()
{
	AI_Output(other,self,"DIA_Gaan_WASZAHLSTDU_15_00");	//������� �� ���������, ���� � ���� ����� ����� ��� ����?
	AI_Output(self,other,"DIA_Gaan_WASZAHLSTDU_03_01");	//� �� ����� ����, ��� ����� ����� �����, ���, ��� � ���� ����.
	b_say_gold(self,other,30);
	MIS_GAAN_DEAL = LOG_RUNNING;
};


instance DIA_GAAN_WOHERMONSTER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 10;
	condition = dia_gaan_wohermonster_condition;
	information = dia_gaan_wohermonster_info;
	description = "������ ������ ���� �������� �����?";
};


func int dia_gaan_wohermonster_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_monster) && (Npc_IsDead(gaans_snapper) == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_wohermonster_info()
{
	AI_Output(other,self,"DIA_Gaan_WOHERMONSTER_15_00");	//������ ������ ���� �������� �����?
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_01");	//������-�� ��������. ����� ����, �� ������ ��������. �� � �� ���� �����.
	AI_Output(self,other,"DIA_Gaan_WOHERMONSTER_03_02");	//� ������� �� ��� � ������ ��������.
};


instance DIA_GAAN_MONSTERTOT(C_INFO)
{
	npc = bau_961_gaan;
	nr = 11;
	condition = dia_gaan_monstertot_condition;
	information = dia_gaan_monstertot_info;
	important = TRUE;
};


func int dia_gaan_monstertot_condition()
{
	if(Npc_IsDead(gaans_snapper) == TRUE)
	{
		return TRUE;
	};
};

func void dia_gaan_monstertot_info()
{
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_00");	//���� ������� ����� �����, � �������.
	AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_01");	//������ � ����� ���� ��������� ��������.
	if(MIS_GAAN_DEAL == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Gaan_MONSTERTOT_03_02");	//��� ������, ��� � ������ ����.
		CreateInvItems(self,itmi_gold,30);
		b_giveinvitems(self,other,itmi_gold,30);
	};
	MIS_GAAN_SNAPPER = LOG_SUCCESS;
	b_giveplayerxp(XP_GAAN_WALDSNAPPER);
	AI_StopProcessInfos(self);
};


instance DIA_GAAN_ASKTEACHER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 10;
	condition = dia_gaan_askteacher_condition;
	information = dia_gaan_askteacher_info;
	description = "�� ������ ������� ���� ���������?";
};


func int dia_gaan_askteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_wasmachstdu))
	{
		return TRUE;
	};
};

func void dia_gaan_askteacher_info()
{
	AI_Output(other,self,"DIA_Gaan_AskTeacher_15_00");	//�� ������ ������� ���� ���������?
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_01");	//��� �������. �� 100 ������� ����� � ���� �������� ����, ��� ����������� ��������, ��� �� ������.
	AI_Output(self,other,"DIA_Gaan_AskTeacher_03_02");	//����� � ������ ������ ����� ������� ������� �� �����.
	Log_CreateTopic(TOPIC_TEACHER,LOG_NOTE);
	b_logentry(TOPIC_TEACHER,"���� ����� ������� ���� �������� ������ ��������.");
};


instance DIA_GAAN_PAYTEACHER(C_INFO)
{
	npc = bau_961_gaan;
	nr = 11;
	condition = dia_gaan_payteacher_condition;
	information = dia_gaan_payteacher_info;
	permanent = TRUE;
	description = "���. 100 ������� ����� �� ���� ���� �� ������������ ��������.";
};


var int dia_gaan_payteacher_noperm;

func int dia_gaan_payteacher_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_askteacher) && (DIA_GAAN_PAYTEACHER_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_gaan_payteacher_info()
{
	AI_Output(other,self,"DIA_Gaan_PayTeacher_15_00");	//���. 100 ������� ����� �� ���� ���� �� ������������ ��������.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_01");	//�������. ������, ������, ��� �� ������.
		GAAN_TEACHPLAYER = TRUE;
		DIA_GAAN_PAYTEACHER_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_PayTeacher_03_02");	//�������� �� ��� �����, ����� � ���� ����� ������.
	};
};


instance DIA_GAAN_TEACHHUNTING(C_INFO)
{
	npc = bau_961_gaan;
	nr = 12;
	condition = dia_gaan_teachhunting_condition;
	information = dia_gaan_teachhunting_info;
	permanent = TRUE;
	description = "���� �� ������ ������� ����?";
};


func int dia_gaan_teachhunting_condition()
{
	if(GAAN_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_gaan_teachhunting_info()
{
	AI_Output(other,self,"DIA_Gaan_TEACHHUNTING_15_00");	//���� �� ������ ������� ����?
	if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE) || ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS)))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_01");	//��� ������� �� ����, ��� �� ��� ������.
		Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_TEETH] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("�������� �����",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_gaan_teachhunting_teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_CLAWS] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("�������� ������",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_gaan_teachhunting_claws);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_FUR] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("������ ����",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_gaan_teachhunting_fur);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSTING] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("���� �������� ����",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_gaan_teachhunting_bfsting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWING] == FALSE)
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("������ �������� ����",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_gaan_teachhunting_bfwing);
		};
		if((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DRGSNAPPERHORN] == FALSE) && (MIS_GAAN_SNAPPER == LOG_SUCCESS))
		{
			Info_AddChoice(dia_gaan_teachhunting,b_buildlearnstring("��� ���������� ��������",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_gaan_teachhunting_drgsnapperhorn);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_03_02");	//� �� ���� ������� ���� ������, ��� �� ��� �� ������. ������.
	};
};

func void dia_gaan_teachhunting_back()
{
	Info_ClearChoices(dia_gaan_teachhunting);
};

func void dia_gaan_teachhunting_claws()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_CLAWS))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_00");	//����� �� ����� ������������ �� ������ �������. ����� ����� �������� ����� �����.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_01");	//���� ���� ������ ���� ������ ��������. ����� ����� �������� ����� ������� ������.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Claws_03_02");	//�������� ������ ������ �������� ����������� ����� �� �����.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_teeth()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_TEETH))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_00");	//����� ����� �������� ���� ���������. ������ ������� ����� ����� ������ ����� �� ��� ���������.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Teeth_03_01");	//����� ����� �������� �� �� ������ ������ ������.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_fur()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_FUR))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_00");	//����� ������� �����, ������ �������� ������ � ������ ������ ���.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_Fur_03_01");	//����� �����, �� ����� ������� ����� �����, �������� �� � ���������.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfsting()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFSTING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_00");	//� ���� ��� ���� ������ ����� �� �����.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFSting_03_01");	//���� ������ ���, ���� ���������� ����� ������, � �� ������� �������� ��� ��� ������ ����.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_bfwing()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_BFWING))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_00");	//����� ����� �������� ������ �������� ����, ������� �� ������ ������� ���� ��� ����� ����� � ����.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_BFWing_03_01");	//����� ���� ����� ����������, ����� �� ��������� ������ ����� �������. ��� �� ����� ������ ������, ���� �� ��������� ��.
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};

func void dia_gaan_teachhunting_drgsnapperhorn()
{
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_DRGSNAPPERHORN))
	{
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_00");	//������, ����� ���� �������� ������� �����, � ���� �������� ����, ��� �������� ��� ���.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_01");	//����� �������� ��� ������� � ��� ����� ��������� � ��������� ����������� ���.
		AI_Output(self,other,"DIA_Gaan_TEACHHUNTING_DrgSnapperHorn_03_02");	//���� �� �� ��������� �� ������, ����� ������� ��� ������ ����� � ������ �������.
		CreateInvItems(gaans_snapper,itat_drgsnapperhorn,1);
	};
	Info_ClearChoices(dia_gaan_teachhunting);
	Info_AddChoice(dia_gaan_teachhunting,DIALOG_BACK,dia_gaan_teachhunting_back);
};


instance DIA_GAAN_JAGD(C_INFO)
{
	npc = bau_961_gaan;
	nr = 80;
	condition = dia_gaan_jagd_condition;
	information = dia_gaan_jagd_info;
	permanent = TRUE;
	description = "��� �����?";
};


func int dia_gaan_jagd_condition()
{
	if(Npc_KnowsInfo(other,dia_gaan_wasmachstdu))
	{
		return TRUE;
	};
};

func void b_wasmachtjagd()
{
	AI_Output(other,self,"DIA_Gaan_JAGD_15_00");	//��� �����?
};

func void dia_gaan_jagd_info()
{
	b_wasmachtjagd();
	if(Npc_IsDead(gaans_snapper) == FALSE)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_01");	//��������� ��������, ������� ��� ������� �����, ���� ������� �����. ���� ���� ������ �����.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_02");	//��� ��� ��������� ���� �����-�� ��������� ����� ������ �����.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_03");	//�� �� ������ ������� ���, ��� ��������, �� ������ ���� ������.
		Log_CreateTopic(TOPIC_GAANSCHNAUBI,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_GAANSCHNAUBI,LOG_RUNNING);
		b_logentry(TOPIC_GAANSCHNAUBI,"���� ��������� ����� ���������� ������������ �������� ����. ���� � �� �������� ����� �����, �� �� ������ ���������.");
		MIS_GAAN_SNAPPER = LOG_RUNNING;
	}
	else if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_04");	//���� ���� ��� ���� � ����. � ��� ��������, ����� ������ ������� ����� ��� ��������� �����.
		AI_Output(self,other,"DIA_Gaan_JAGD_03_05");	//��������� ���������� ��� ������� � �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Gaan_JAGD_03_06");	//��� �� �� ��� ����������.
	};
};


instance DIA_GAAN_PICKPOCKET(C_INFO)
{
	npc = bau_961_gaan;
	nr = 900;
	condition = dia_gaan_pickpocket_condition;
	information = dia_gaan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gaan_pickpocket_condition()
{
	return c_beklauen(23,35);
};

func void dia_gaan_pickpocket_info()
{
	Info_ClearChoices(dia_gaan_pickpocket);
	Info_AddChoice(dia_gaan_pickpocket,DIALOG_BACK,dia_gaan_pickpocket_back);
	Info_AddChoice(dia_gaan_pickpocket,DIALOG_PICKPOCKET,dia_gaan_pickpocket_doit);
};

func void dia_gaan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gaan_pickpocket);
};

func void dia_gaan_pickpocket_back()
{
	Info_ClearChoices(dia_gaan_pickpocket);
};

