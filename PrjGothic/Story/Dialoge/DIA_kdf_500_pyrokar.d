
instance DIA_PYROKAR_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_exit_condition;
	information = dia_pyrokar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_WELCOME(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_welcome_condition;
	information = dia_pyrokar_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pyrokar_welcome_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_welcome_info()
{
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_00");	//����, � ��� ����� ���������. � �������, �� ��� ������� ������� � ������� �������.
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_01");	//(������ �����������) �� �� ������, ��� ��� � �������� ���� ������ ��������� ���� ����������� �������� ���� ������.
};


instance DIA_PYROKAR_HAGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_hagen_condition;
	information = dia_pyrokar_hagen_info;
	permanent = FALSE;
	description = "� ������ ���������� � ����������. ��� ������.";
};


func int dia_pyrokar_hagen_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_pyrokar_hagen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_00");	//� ������ ���������� � ����������. ��� ������.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_01");	//�� ������ ���, � ��� �� ����������� �������� � ����?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_02");	//� ���� ��� ��� ������ ���������.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_03");	//��� ��� �� ���������?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_04");	//����� ��� ���������� � ������ ��������. �� ����������� �������! �� ������ ���������� ��, ���� ��� ��� ��������.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_05");	//��. �� ������ �������� ���� �����, ���������. ����� ������ �����, �� ����� ���� �����, ��� �� ����� ������ ����� �����.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_06");	//� ����, ���� ����� ������� ����� ����������� �������� ����� ������������ ����������.
	if(Npc_KnowsInfo(other,dia_pyrokar_auge))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_07");	//�� ������ �� ����� �������� ���� �� ������ - �� ������ ����.
		AI_StopProcessInfos(self);
	};
};


instance DIA_PYROKAR_AUGE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_auge_condition;
	information = dia_pyrokar_auge_info;
	permanent = FALSE;
	description = "� ��� ���� ������.";
};


func int dia_pyrokar_auge_condition()
{
	if((KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_auge_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_00");	//� ��� ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_01");	//�����, ��� ��������, ��� �� ����� �� ������ ����� ���� ��������� ������, �� ����� � ������ ��� - �����.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_02");	//���� ������ ��� �������� ������ ������� - ������ ���, ��� ������� ������������ ��� �����, �������� ������ ���.
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_03");	//� ��� �� ����� �� �����������.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_04");	//����������� ���������� ��������� �������� - �� �������.
	b_logentry(TOPIC_INNOSEYE,"� �� �����, ��� ��� ����� ��� ��������, �� ������� �� ������ ���� �����������, ����� �� �������� ��� ������ ���������.");
	if(Npc_KnowsInfo(other,dia_pyrokar_hagen))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_05");	//��� �, �� ������ �� ����� �������� ���� �� ������ - �� ������ ����.
		AI_StopProcessInfos(self);
	};
};


instance DIA_PYROKAR_GOAWAY(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_goaway_condition;
	information = dia_pyrokar_goaway_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pyrokar_goaway_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(hero,dia_pyrokar_hagen) && Npc_KnowsInfo(hero,dia_pyrokar_auge) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_goaway_info()
{
	AI_Output(self,other,"DIA_Pyrokar_GOAWAY_11_00");	//(�����������) �������� - �����������, ������� ���� ��� ��������� ���������. ��� ��� �����.
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_FIRE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_fire_condition;
	information = dia_pyrokar_fire_info;
	permanent = FALSE;
	description = "� ���� ������ ��������� �����.";
};


func int dia_pyrokar_fire_condition()
{
	if((KNOWS_FIRE_CONTEST == TRUE) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_pyrokar_hagen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_fire_info()
{
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_00");	//� ���� ������ ��������� �����.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_01");	//(���������) ��� �� ������ �... �� ������ ������ ��������� �����?
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_02");	//��, � �������� �� ����� ����, ������� ������...
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_03");	//(����� ���������) �� ����� ����� ����. �� ����� ������, ��� ��������� ����������� ������� ��� ����������� ����� ���������. �� ������ ������������ ���� �������.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_04");	//� ���� ������ ��� ��������� - � � ������ ���.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_05");	//(��������������) ���� �� ������������� �����������, ������ ����� ���������� ���� ����� ���������.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_06");	//� ��������� �� ����������� ��������� �����.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_07");	//� ����� ������ - ��� ���� � ����. ����� �� ������ �����, ������ �� ����� ������� ������ ���� ���� �������, ������� �� ������ ������ ���������.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_08");	//�� �������� ����� ��� ����� �����.
	b_logentry(TOPIC_FIRECONTEST,"� ���������� � �������� ������ ��������� �����. ������ � ������ ��������� ��� ������� ������� ������.");
};


instance DIA_PYROKAR_TEST(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_test_condition;
	information = dia_pyrokar_test_info;
	permanent = FALSE;
	description = "� ����� ������ ���� ���������, ������.";
};


func int dia_pyrokar_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire) && (MIS_SCHNITZELJAGD == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_test_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_00");	//� ����� ������ ���������, ������.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_01");	//� ������ ������ ������ ������, �������� �� �� ���. �� ������ ���������� ���� �� ���������, ��� � ��������� ����������.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_02");	//��������� ������. (��������) ��, ��������, ������, ��� ������ ���� �� ����������� ������ ������ ��� ���������.
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_03");	//�������. � ��� ��� ���������?
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_04");	//����� � ����� �������� ������ ����� �����������, ������� ������ ������������� ����� ���������: ����, ������ � ����. ��� ��� ���������� � �������.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_05");	//(���������) �� ������ �� ����! ������ ����� ����� ���������: '������ ������ ������ � ������� ��, ��� �������� ������� � ����� ����'.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_06");	//���� ����������� ���� ����.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_07");	//��� ���, ��� �� ����� ������� ����.
	Log_CreateTopic(TOPIC_SCHNITZELJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCHNITZELJAGD,LOG_RUNNING);
	b_logentry(TOPIC_SCHNITZELJAGD,"������� ���� ��� ��������� ������. ��� �� �� ����� ���������, ��� ������ ������ ��������� ���������� ����, ������ � ����.");
	b_logentry(TOPIC_SCHNITZELJAGD,"� ������ ��������� ������ ������ � '�������� ��, ��� �������� ������� � ����� ����'. ����� �� ��� ��� ����.");
	CreateInvItems(self,itke_magicchest,1);
	b_giveinvitems(self,other,itke_magicchest,1);
	b_startotherroutine(igaraz,"CONTEST");
	AI_Teleport(igaraz,"NW_TAVERNE_BIGFARM_05");
	CreateInvItems(igaraz,itke_magicchest,1);
	igaraz.aivar[AIV_DROPDEADANDKILL] = TRUE;
	igaraz.aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_startotherroutine(nov607,"EXCHANGE");
	b_startotherroutine(agon,"GOLEMDEAD");
	AI_Teleport(agon,"NW_MAGECAVE_RUNE");
	CreateInvItems(agon,itke_magicchest,1);
	agon.aivar[AIV_DROPDEADANDKILL] = TRUE;
	agon.aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_startotherroutine(ulf,"SUCHE");
	AI_Teleport(ulf,"NW_TROLLAREA_PATH_42");
	CreateInvItems(ulf,itke_magicchest,1);
	ulf.aivar[AIV_DROPDEADANDKILL] = TRUE;
	ulf.aivar[AIV_NEWSOVERRIDE] = TRUE;
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_RUNNING(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 20;
	condition = dia_pyrokar_running_condition;
	information = dia_pyrokar_running_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pyrokar_running_condition()
{
//	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && Mob_HasItems("MAGICCHEST",itmi_runeblank))
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		if(!Npc_HasItems(other,itmi_runeblank) && !Npc_HasItems(other,itru_firebolt))
		{
			return TRUE;
		};
	};
};

func void dia_pyrokar_running_info()
{
	var int randomizer;
	randomizer = Hlp_Random(3);
	if(randomizer == 0)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_00");	//���� �� �� �������� ��� ���������, ��� ������ ������� ����.
	}
	else if(randomizer == 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_01");	//���� �� �����? ���, ������� ���������!
	}
	else if(randomizer == 2)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_02");	//������ ����� ����������� ���� ������� ����� ������. ���� ��� �� �������, ���������?
	};
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_SUCCESS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_success_condition;
	information = dia_pyrokar_success_info;
	permanent = FALSE;
	description = "� ����� ������ ������.";
};


func int dia_pyrokar_success_condition()
{
//	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (hero.guild == GIL_NOV) && !Mob_HasItems("MAGICCHEST",itmi_runeblank) && ((Npc_HasItems(other,itmi_runeblank) >= 1) || (Npc_HasItems(other,itru_firebolt) >= 1)))
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		if(Npc_HasItems(other,itmi_runeblank) || Npc_HasItems(other,itru_firebolt))
		{
			return TRUE;
		};
	};
};

func void dia_pyrokar_success_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_00");	//� ����� ������ ������.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_01");	//(�����������) ��... ������ ���?! �� �������� ������ � ����� ������� ������...
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_02");	//... � ����� ����� ������� ���� ��� ��������, ��� ��� ������� ���� ����� �������.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_03");	//� ������ ����������? ��� ������ �����? ��� �� ��������� ����?
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_04");	//��� �� ������. � �����, �� ���� �� ������� ������ ��� ���������.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_05");	//��� �, � ����� ������, �� ���������, ��� �� ������ ��� ���������. � ���� ������ ������ ������ ����.
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	b_giveplayerxp(XP_SCHNITZELJAGD);
};


instance DIA_PYROKAR_TODO(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_todo_condition;
	information = dia_pyrokar_todo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pyrokar_todo_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && ((MIS_RUNE != LOG_SUCCESS) || (MIS_GOLEM != LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_todo_info()
{
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_00");	//�� ������ ���������, �������� ������� ���� �.
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_01");	//��...
	if(MIS_RUNE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_02");	//... ���� ��� ���������� ������ ��������� �������.
	};
	if(MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_03");	//... ���� ��� ���������� ��������� ������� ����������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_MAGICAN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_magican_condition;
	information = dia_pyrokar_magican_info;
	permanent = FALSE;
	description = "������ � ���� ������ � ������� �����?";
};


func int dia_pyrokar_magican_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && (MIS_RUNE == LOG_SUCCESS) && (MIS_GOLEM == LOG_SUCCESS) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_magican_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MAGICAN_15_00");	//������ � ���� ������ � ������� �����?
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_01");	//�� ������ ���. �� ������ ��������� �����. �� � ������ ������ ���� �������, ��� �� ���������� � ����.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_02");	//(����������) �� ����� �������, ��� �� ���������� ��������� ��� ������, ����� ����� ��������� ������ ������.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_03");	//����, ���� �� ����� ������� ������ ����, �� ������ ������ � ���� ����.
};


instance DIA_PYROKAR_OATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_oath_condition;
	information = dia_pyrokar_oath_info;
	permanent = FALSE;
	description = "� ����� �������� � ���� ����.";
};


func int dia_pyrokar_oath_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_magican) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_oath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_00");	//� ����� �������� � ���� ����.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_01");	//������, ����� ������� ������ ����.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_02");	//(������������) ��������� �� ��, ����� ����� ������ �����������, ��� ���� � ���������� ����...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_03");	//... ��� � ����� ������� � �� ����� ���� ��� ����� ���� ����� ����� � �����...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_04");	//... �� ��� ��� ���� ���� ���� � ���� �� ������ ����� � ���� ��������� �������� � ����� ����� ����� �� �������?
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_05");	//�������.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_06");	//��������� ����� ���� ������, �� ������������� � ���������� ����.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_07");	//���� ��� ���� � ���� ���� ������ ��.
	CreateInvItems(hero,itar_kdf_l,1);
	AI_EquipArmor(hero,itar_kdf_l);
	other.guild = GIL_KDF;
	Npc_SetTrueGuild(other,GIL_KDF);
	FIRE_CONTEST = TRUE;
	Snd_Play("LEVELUP");
	KDF_AUFNAHME = LOG_SUCCESS;
	SLD_AUFNAHME = LOG_OBSOLETE;
	MIL_AUFNAHME = LOG_OBSOLETE;
	b_giveplayerxp(XP_BECOMEMAGE);
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_08");	//������, ����� �� ��� ������ � ���� ����, �� ������ ���������� � ������ �������, ����������������� ���������.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_09");	//��� ����� ����� ��������� �����, ��� �� ��������� ��������. ��� ��� �� ������ ������ ������������ � �������.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_10");	//�� �������, ��� �� ��������� ��� ����� ����������.
};


instance DIA_PYROKAR_LERNEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_lernen_condition;
	information = dia_pyrokar_lernen_info;
	permanent = FALSE;
	description = "��� � ���� ������� ������?";
};


func int dia_pyrokar_lernen_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_pyrokar_lernen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Lernen_15_00");	//��� � ���� ������� ������?
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_01");	//������ �����, ������ �� ������ ����� ������� ����� �����. ��� ����� ���� ������ ��� ������.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_02");	//��� ���� �� ������ ����������� � ����� ������ �����, ��� ����� �������� ������������ �� ������� ��������.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_03");	//�� ������� ������ ������� ���������� � ����� ������� � ���������. ������ �� ��� ���������������� � ������������ �������.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_04");	//������, ��������, ������ ������, � ������ ������ ���� ����� ����.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_05");	//����� �� ����� ������ � ����� ����, ��� ������. ������ ����� ������� ���� ������ ��������� ����������� - � �� ������ ���� � ������ �����.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_06");	//�� ������ �� ��� ����� ����� ���� ������ �������� - ���� �� ������ ������ ��������� ���.
	Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTEACHER,"������ ������ �������� ���� � ������ ����� �����.");
	b_logentry(TOPIC_KLOSTERTEACHER,"���� ������ ������� �������� ������.");
	b_logentry(TOPIC_KLOSTERTEACHER,"���� ������ ����� ��������� ���� � ����� ����.");
	b_logentry(TOPIC_KLOSTERTEACHER,"���� ������ ����� ��������� ���� � ����� ���� � �����.");
	b_logentry(TOPIC_KLOSTERTEACHER,"���� ������ ������� ��������� ��������� ������.");
};


instance DIA_PYROKAR_WUNSCH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wunsch_condition;
	information = dia_pyrokar_wunsch_info;
	permanent = FALSE;
	description = "� ����� �� ��������� ���������...";
};


func int dia_pyrokar_wunsch_condition()
{
	if((other.guild == GIL_KDF) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_pyrokar_wunsch_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_15_00");	//� ����� �� ��������� ���������...
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_01");	//����� �������� � ���� ����, ������ ��� �������� ������ �� ������ ���.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_02");	//����, ����� �� ����� ���� ������ ��� � �������� ����?
	Info_ClearChoices(dia_pyrokar_wunsch);
	Info_AddChoice(dia_pyrokar_wunsch,"�������.",dia_pyrokar_wunsch_nothing);
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"������� ���������� ���� ���������� ������������ ���.",dia_pyrokar_wunsch_babo);
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"������� ���������� ������� �������� ������ � ����������.",dia_pyrokar_wunsch_opolos);
	};
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"������� ���������� ������� �������� � ���������.",dia_pyrokar_wunsch_dyrian);
	};
};

func void dia_pyrokar_wunsch_nothing()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Nothing_15_00");	//�������.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Nothing_11_01");	//(���������) �� ����� ���. ����� ��� ������������ �� ������� ����.
	b_startotherroutine(dyrian,"NOFAVOUR");
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_dyrian()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Dyrian_15_00");	//������� ���������� ������� �������� � ���������.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01");	//�� ����� ���.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02");	//����� ���������� ����� ��������� �������� � ���������, � �� ������ ����� ���������, ������� ������ ��������.
	b_giveplayerxp(XP_HELPDYRIAN);
	b_startotherroutine(dyrian,"FAVOUR");
	MIS_HELPDYRIAN = LOG_SUCCESS;
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_babo()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Babo_15_00");	//������� ���������� ���� ���������� ������������ ���.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_01");	//�� ����� ���.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_02");	//� ���� �������, ��������� ���� ����� �������� �� ������������ ���.
	b_giveplayerxp(XP_HELPBABO);
	b_startotherroutine(babo,"FAVOUR");
	b_startotherroutine(dyrian,"NOFAVOUR");
	MIS_HELPBABO = LOG_SUCCESS;
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_opolos()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Opolos_15_00");	//������� ���������� ������� �������� ������ � ����������.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_01");	//�� ����� ���.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_02");	//� ���� ������� ���������� ������� ����� ��������� ������� ������� ������.
	b_giveplayerxp(XP_HELPOPOLOS);
	b_startotherroutine(opolos,"FAVOUR");
	b_startotherroutine(dyrian,"NOFAVOUR");
	MIS_HELPOPOLOS = LOG_SUCCESS;
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};


instance DIA_PYROKAR_NACHRICHT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_nachricht_condition;
	information = dia_pyrokar_nachricht_info;
	permanent = FALSE;
	description = "� ������ ������� �� ����� ������.";
};


func int dia_pyrokar_nachricht_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pyrokar_nachricht_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_00");	//� ������ ������� �� ����� ������. �� ����� �������� �������������� ����������� �������� � ����� ���.
	if(ENTEROW_KAPITEL2 == FALSE)
	{
		AI_Teleport(sergio,"NW_MONASTERY_PLACE_09");
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_01");	//������� � ������ ����������� � ������ �������� � ��������� ��� ��� ��������������.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_02");	//������. �� ��������� ���� ������. ������� ������ ���������� ���� � �������.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_03");	//�� ������ ���� �����.
		SERGIO_FOLLOW = TRUE;
		AI_StopProcessInfos(self);
		b_startotherroutine(sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_04");	//� ����������� � ������ ��������.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_05");	//������. ��� ��� �� ��� ������ ���� � ������, ���� �� ����� ������.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_06");	//������� ��� ������� ����� ������ - �� ������ ���� �����.
	};
};


instance DIA_PYROKAR_TEACH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 4;
	condition = dia_pyrokar_teach_condition;
	information = dia_pyrokar_teach_info;
	permanent = TRUE;
	description = "����� ���� ���������� ����� �����.";
};


func int dia_pyrokar_teach_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_teach_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_15_00");	//����� ���� ���������� ����� �����.
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		if(b_teachmagiccircle(self,other,6))
		{
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_01");	//����� ������� ������ � ��� ���, ��� �� ������ ���� � �����. ������ ��������� � ��� ���, �� ����� ��� ���.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_02");	//�� ��������� ������. � ���� ����������� ��� ���� ����, ����� �������� � ���� �����.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_03");	//� �������� ����, �, ���������. �� ������� � ������ ���� - �� ��������� �� � ����� ���� � �������� ����.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_04");	//������ �� ������ ������ ������� ����� ���������� ����� �� ����, ���� �� ���� �������.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_05");	//�� - � ��� ����. ��� ������������ ��������� �����, ����� �������� ����.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_06");	//�� ������� ��� ������ �� ����, ����� ��� �������� ���� �� ������.
			AI_Output(other,self,"DIA_Pyrokar_TEACH_15_07");	//��, �� ����� ������� ������� ���� �� ������ �������� �����.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_08");	//� �� ��������� ������.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_09");	//������ �� ������ ��� �������������, � ���������!
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_10");	//�����, ���� ������ � ����� ������, ���������� ����� ��������, ������ ���������� �����.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_11");	//��� ��� ��������, ���� � �������� ��������� �� ����, ������� �� ������������ ���.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_11_12");	//����� ��� ����� ��� �� ������. ����� �� �������� ���� ������ �� ����, ������� ����� ������� ����, � ����� ����.
	};
};


instance DIA_PYROKAR_SPELLS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_spells_condition;
	information = dia_pyrokar_spells_info;
	permanent = TRUE;
	description = "����� ���� (�������� ���)";
};


func int dia_pyrokar_spells_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};

func void dia_pyrokar_spells_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Pyrokar_SPELLS_15_00");	//����� ����.
	Info_ClearChoices(dia_pyrokar_spells);
	Info_AddChoice(dia_pyrokar_spells,DIALOG_BACK,dia_pyrokar_spells_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_pyrokar_spells_firerain);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_pyrokar_spells_breathofdeath);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_pyrokar_spells_massdeath);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_pyrokar_spells_shrink);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_SPELLS_11_01");	//��� ������ ������ ����� ����.
	};
};

func void dia_pyrokar_spells_back()
{
	Info_ClearChoices(dia_pyrokar_spells);
};

func void dia_pyrokar_spells_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void dia_pyrokar_spells_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void dia_pyrokar_spells_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void dia_pyrokar_spells_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};


instance DIA_PYROKAR_PARLAN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 99;
	condition = dia_pyrokar_parlan_condition;
	information = dia_pyrokar_parlan_info;
	permanent = FALSE;
	description = "���� ������� ������.";
};


func int dia_pyrokar_parlan_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV) || (hero.guild == GIL_PAL)) && (PARLAN_SENDS == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_parlan_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Parlan_15_00");	//���� ������� ������. � ���� �������� ��� ���������� �����������
	AI_Output(self,other,"DIA_Pyrokar_Parlan_11_01");	//��� �, �� ������ �����, � ���� ���� �������. � ����� �������, �� ������ ������� � ����.
};


instance DIA_PYROKAR_TEACH_MANA(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 99;
	condition = dia_pyrokar_teach_mana_condition;
	information = dia_pyrokar_teach_mana_info;
	permanent = TRUE;
	description = "� ���� �������� ��� ���������� �����������.";
};


func int dia_pyrokar_teach_mana_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV) || (hero.guild == GIL_PAL)) && Npc_KnowsInfo(hero,dia_pyrokar_parlan) && (other.attribute[ATR_MANA_MAX] <= 250))
	{
		return TRUE;
	};
};

func void dia_pyrokar_teach_mana_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_MANA_15_00");	//� ���� �������� ��� ���������� �����������.
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};

func void dia_pyrokar_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 250)
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_MANA_11_00");	//� ��������, ��� ���������� ������� ����� ����� ����, �� ���� �������. ���� � �� ���� �������� ����, ��� �������� �� ��� ������.
	};
	Info_ClearChoices(dia_pyrokar_teach_mana);
};

func void dia_pyrokar_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,250);
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};

func void dia_pyrokar_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,250);
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};


instance DIA_PYROKAR_PERM(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 900;
	condition = dia_pyrokar_perm_condition;
	information = dia_pyrokar_perm_info;
	permanent = TRUE;
	description = "(�������������)";
};


func int dia_pyrokar_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_pyrokar_perm_info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_00");	//���������� ����, ������.
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_01");	//��� ������ �������������? ��� ��� �� �������� ��.
	};
	if((KAPITEL == 5) && (MIS_PYROKARCLEARDEMONTOWER == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_02");	//�� ���������� ������� ���� ��������� ����� ������ ������ ��������� �����. �� �������� � ����� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_03");	//�� ������� ����� ����� ����� � ����� �� ���� ���������� �����, �� ������� ���� ������� ������.
	};
};


instance DIA_PYROKAR_KAP3_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap3_exit_condition;
	information = dia_pyrokar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_BACKFROMOW(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_backfromow_condition;
	information = dia_pyrokar_backfromow_info;
	description = "� ������ �� ������ ������ ��������.";
};


func int dia_pyrokar_backfromow_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_backfromow_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_00");	//� ������ �� ������ ������ ��������.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_01");	//��� �� ������ ��������?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_02");	//���� ����������� ��� ����� �� ����� � ��������.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_03");	//�� ��� ������ ��� �� ������� - �� ��� ������ ������������ ����� ����?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_04");	//�����, � ������� ���� ������ � ������, �� ����� ������������� ����������� ������.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_05");	//��� ���������� ������, � ���� ������ ��� �������.
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_06");	//�� ���� ������ ���� � ������ �����.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_07");	//� ����. ��� ������. ����������� ������� �� �����������. ����������� ��. ��� ���������� �������� �����.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_08");	//������ ���������, �� ������ �� ������ ����� �����. ������ �����, � ��������� ������� �� ����� ������. ��� ��� ���� ���������.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_RUNNING);
		b_logentry(TOPIC_DEMENTOREN,"������� ��������� ��� �� ������, ����� � ������ �����. ��� ����������� �������. �� ����������� ����, ��� ��� ����� ������� ���� ���������. ���� ��� ����������, � ������ ���������� ������������ � ���������.");
	};
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_09");	//� �������� ������� �������� ���� ��������. ��� ��������� ����� ������� ����� ������ ��� ��������, ��� �������� ��� ������ �����.
		PYROKARTOLDKARRASTORESEARCHDMT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"������� �������� ������� ������������� ������, ��������� �� ������.");
	};
	AI_Output(self,other,"DIA_Pyrokar_Add_11_00");	//��� - ��� ���� ������ ��������� ���� ����� � ���������, ���� ���� ����������� ������.
	b_giveinvitems(self,other,itru_teleportmonastery,1);
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_10");	//�����, �� ������ ��������������, ����� ��� ���� �������� �����.
};


instance DIA_PYROKAR_GIVEINNOSEYE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 31;
	condition = dia_pyrokar_giveinnoseye_condition;
	information = dia_pyrokar_giveinnoseye_info;
	description = "� ������, ����� ������� ���� ������.";
};


func int dia_pyrokar_giveinnoseye_condition()
{
	if((KAPITEL == 3) && Npc_HasItems(other,itwr_permissiontowearinnoseye_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_giveinnoseye_info()
{
	AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_15_00");	//� ������, ����� ������� ���� ������.
	b_giveinvitems(other,self,itwr_permissiontowearinnoseye_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_01");	//� ����, �� ������� ���������� ����� �� ����� ������ ������ ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_02");	//�� �����, ��� �������� ������������ ����. �� ����� �������� ����������� ����� �����.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_03");	//���� ������ ��� ����� ������� �� ���� ��������� ����.
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_giveinnoseye,"��� ��� ��������� ����� ������� ��������, ������?",dia_pyrokar_giveinnoseye_wer);
	}
	else
	{
		Info_AddChoice(dia_pyrokar_giveinnoseye,"��� ������ ���?",dia_pyrokar_giveinnoseye_wer);
	};
};

func void dia_pyrokar_giveinnoseye_wer()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_00");	//��� ��� ��������� ����� ������� ��������, ������?
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_01");	//��� ������ ���?
	};
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_02");	//��� �������, � ������ ��������� �����. ������ ����� ����� ������, ��� ��� ��������� �� ���� �����, ����� ������� ��������� � ����� ���� ���������.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_03");	//�� � ��� ��� ��� ����� ��-�������. ���� ������ ��������� � �������� �� ������ �����, � ������ ���� � �� ������ �������.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_04");	//��� ����� �������� ������, ��� �� ������ �� ������ ������ ����������, � �� ���������� ��������� �� ����� ���.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_05");	//���� �� ����� ����� ������ ��������������, �������� �� ��������� ���� ���� ����, ���������� ������� ���� ���� � ������ ��� � ��������� ����������� ������. ��� �����.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_06");	//���� ������� ��, ������ ��� ����� ������� ��������� ���� ���.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_07");	//����� ������ ���� ������ ����� � ���� ����� ��������� ����� � ����� ����.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_08");	//� �����, ��� �� ������ ������� ����� ������� �������� �������, �� �������� � ��������� ������� ���������, �������� ��� ���������� ������� ����.
	pedro.flags = 0;
	PEDRO_TRAITOR = TRUE;
	b_logentry(TOPIC_INNOSEYE,"����������. ���� � ������ ����-�� ���������. � �������, ��� ������ �� ��������� ��������� ������-�� ���������� ������� ����, � ������ ��� �������� ������� �� ���������� ����� � ���������, ��� �� ��� �� ������ ���� ����-������.");
	b_logentry(TOPIC_TRAITORPEDRO,"��������� ����� ����� ���� ������ �� ���������. ��� � �������, ���� ���� ������ �� ���� ��� �����, ����� ����� ����� ���������.");
};


instance DIA_PYROKAR_NOVIZENCHASE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 34;
	condition = dia_pyrokar_novizenchase_condition;
	information = dia_pyrokar_novizenchase_info;
	description = "���� ������� ���� ���?";
};


func int dia_pyrokar_novizenchase_condition()
{
	if((KAPITEL == 3) && (PEDRO_TRAITOR == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_novizenchase_info()
{
	AI_Output(other,self,"DIA_Pyrokar_NOVIZENCHASE_15_00");	//���� ������� ���� ���?
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_01");	//����� ���� ��������� �����������, ���������� ���������� ���, � ����������� � �������� ������.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_02");	//������ ���������� ��������� �� ��� � ������, ����� ������� ���� �����, �� ��� �������� �����.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_03");	//���� �� ������ ������� ��, �� ����������, ���� ����� �� ���� ������������.
	MIS_NOVIZENCHASE = LOG_RUNNING;
};


instance DIA_PYROKAR_FOUNDINNOSEYE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 35;
	condition = dia_pyrokar_foundinnoseye_condition;
	information = dia_pyrokar_foundinnoseye_info;
	description = "� ����� ���� ������.";
};


func int dia_pyrokar_foundinnoseye_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_foundinnoseye_info()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_00");	//� ����� ���� ������. �� ���������.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_01");	//��... ����� �� ����� ����. ��� ���������?
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_02");	//��� ���������� � ���� ���� ��������� ������ ��������������� ����. ��� ����������, ��� � ������ ������� ������.
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_03");	//��� ��������� �������� ����� �� ���������� � ����� ���������� � ������� ����.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_04");	//�� �������� � ���� �����! ��� ���������� ��� ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_05");	//���� � ����� ������ �������� �� ��� � �����������, ��� ��� �������� ����� �����.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	MIS_NOVIZENCHASE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_foundinnoseye);
	Info_AddChoice(dia_pyrokar_foundinnoseye,"��� �� ������ ����� �������?",dia_pyrokar_foundinnoseye_was);
};

func void dia_pyrokar_foundinnoseye_was()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_15_00");	//��� �� ������ ����� �������?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_01");	//���� ���� ����� �����. �� ��� ��, ���� ������� �������� ����������� ��������� ������ ��� ����.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_02");	//�� ������ �������� ���� � ������������ ��� ����� ����. �� ����� �������� ������ ���.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_03");	//� ���� ����������� ���� �� ����, ��� ������ ���� ���� ���. ��� ������ �����, �� ���������� � ��������� ��������� � ����� �����.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_04");	//��� � �����, � �������, ���� ����. � ���� ������� ��������, ������ �� �����, ��� ����� ������. ������ ���� ���, � ����������.
	Info_AddChoice(dia_pyrokar_foundinnoseye,DIALOG_BACK,dia_pyrokar_foundinnoseye_weiter);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_foundinnoseye,"������ ������?",dia_pyrokar_foundinnoseye_was_vatras);
	};
	Info_AddChoice(dia_pyrokar_foundinnoseye,"��� ����� ���� ������?",dia_pyrokar_foundinnoseye_sonnenkreis);
	b_logentry(TOPIC_INNOSEYE,"������� �����, ����� � ������� � ���� ���� �������, ������������ � ������, ������ � ���, ��� ����� ������� � ������������ ������.");
	MIS_PYROKAR_GOTOVATRASINNOSEYE = LOG_RUNNING;
};

func void dia_pyrokar_foundinnoseye_was_vatras()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00");	//������ ������?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01");	//���������� ������� ���� ���� �� ���� ���� ����� ��������� ��� �������, ����.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02");	//������ ����� �������. ������ ������ ����� ���� ����� �������� ��� ���������� � ���� ������� ���.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03");	//��� ���, ��� ���� ����� �����.
};

func void dia_pyrokar_foundinnoseye_sonnenkreis()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00");	//��� ����� ���� ������?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01");	//������ ��� ��� ���� � ���������� ��������� ������������ � ����� ����� �� ����� �������������, ����� �������� ������ ������ �����.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02");	//��� ����� ����������� ��������� ����� ������.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03");	//� ���� ������� ���� ����� ����� �� ����������, ��� ��� ���� ����� ��������. � ��� �� ��� ���������.
};

func void dia_pyrokar_foundinnoseye_weiter()
{
	Info_ClearChoices(dia_pyrokar_foundinnoseye);
};


instance DIA_PYROKAR_SPOKETOVATRAS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_spoketovatras_condition;
	information = dia_pyrokar_spoketovatras_info;
	description = "� ������� � ��������.";
};


func int dia_pyrokar_spoketovatras_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_spoketovatras_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_00");	//� ������� � ��������.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_01");	//��, ������. ��� ��?
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_02");	//�� ������� ������ � ����� ������, ����� �������� ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_03");	//���� ��� ������, ��, ����� ����, � ��� ��� �� ���� �������.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_04");	//������ �����, ����� ������� � �� ������� ��� � ����.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_05");	//���? ������� ���� ����� ���? �� ���� ��� �� ��������.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_06");	//��������. ��� �� ��� �������. ������ ����������.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_07");	//������ � ����� ���� �������. � ����� �� �����. ������ �� ����� ���� ����.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_08");	//������ ��� �����, ��� ���� ������� �� � ����� � ����� ������?
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_09");	//� �� ���� �������� ��������. � �� �����, ��� �� ��� ��������� � ���.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_10");	//������, �� � �� ���� ������ ������� ��� ����� ��������.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_PYROKAR_XARDASVERTRAUEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_xardasvertrauen_condition;
	information = dia_pyrokar_xardasvertrauen_info;
	description = "��� ���� ������ �� ���������. ������ �� ������ �������� ���� ������.";
};


func int dia_pyrokar_xardasvertrauen_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_spoketovatras) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_xardasvertrauen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_00");	//��� ���� ������ �� ���������. ������ �� ������ �������� ���� ������.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_01");	//�� ������ ���������� ��������.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_02");	//� ������ �� ���� ��������, �� �������? � ���� ��� �� ��������� ��������������, ��� ������� �� �������� ������ ���. � �� ���� ������� ���.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_03");	//� ��� ���� � ������� ���� ��������������?
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_04");	//�����, ��� ����������. ��� ������ ���� ���-��, ��� ������������� �������� ����.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_05");	//��� �������� ��������, �� � ���� ������� �������� ������ ����, ��� �� ������ ����� ���������� �� ���� �����������.
	b_logentry(TOPIC_INNOSEYE,"�������� ����� � ����� �������, ����� �� ������ � ��������. � ������ �������� � ���������, ��� ��������� �������� ������� ������� � ������� � ����� ������.");
	PYROKAR_DENIESINNOSEYERITUAL = TRUE;
};


instance DIA_PYROKAR_BUCHZURUECK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_buchzurueck_condition;
	information = dia_pyrokar_buchzurueck_info;
	description = "� ������ ��� ����� �� ��������.";
};


func int dia_pyrokar_buchzurueck_condition()
{
	if(Npc_HasItems(other,itwr_xardasbookforpyrokar_mis) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchzurueck_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_00");	//� ������ ��� ����� �� ��������.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_01");	//��� ���� ��� �������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_02");	//������.
	b_giveinvitems(other,self,itwr_xardasbookforpyrokar_mis,1);
	Npc_RemoveInvItems(self,itwr_xardasbookforpyrokar_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_03");	//(���������) �� ��� ����������! �� ������ ���� �������� ������������� � ���, ��� �� ������ ��� ��� ���?
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_04");	//����. ���.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_05");	//(�������) ��� �������, ����� ���������� ��� �� ����� ��������� ����.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_06");	//�� ��� ������, ��� �� ������ ��������, � ������ � �����, ��� ������� ��� ��� ����� ����, ��� ������� � ���.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_07");	//��� �� ������ �������������� �� �������?
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_08");	//��, � ����������� � ���� ������, ��, �������, �� ������, ��� � �������� � ������ ���������� ��������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_09");	//�� ����� ����, � ��������� ��������� ����� ������ ���������, ��� �� ������ ��� ����� ������� ������ ���. �� ���� ��� ��, �����������, ����� ������� ������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_10");	//�������� � ����� ������.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"THRONE",-1);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	b_logentry(TOPIC_INNOSEYE,"�������, �������, ���������� ����������� � ����� ������.");
	PYROKAR_GOESTORITUALINNOSEYE = TRUE;
};


instance DIA_PYROKAR_PRERITUAL(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_preritual_condition;
	information = dia_pyrokar_preritual_info;
	permanent = TRUE;
	description = "�� �������, �� ������� ������������ ����?";
};


func int dia_pyrokar_preritual_condition()
{
	if((PYROKAR_GOESTORITUALINNOSEYE == TRUE) && (MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_preritual_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PRERITUAL_15_00");	//�� �������, �� ������� ������������ ����?
	AI_Output(self,other,"DIA_Pyrokar_PRERITUAL_11_01");	//������ �������. ������� - ������.
};


instance DIA_PYROKAR_AUGEGEHEILT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_augegeheilt_condition;
	information = dia_pyrokar_augegeheilt_info;
	description = "�� ������� ���. ���� ������ �������.";
};


func int dia_pyrokar_augegeheilt_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_augegeheilt_info()
{
	AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_00");	//�� ������� ���. ���� ������ �������.
	AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_01");	//� ����� �� �����, ��� ��� ��������.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_02");	//��, ������.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_03");	//�� ��� ������������ �������, ��� ����� � ���������� � ������ ����� ����� ����.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_04");	//� ����� ��� �� ��������� ������ ������ � ������ ������������ ��� ����� �� ����� �����. ������ �� ���� �� ������ ����� ����.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_05");	//���� ��� ��������� ���� � ������������ � ���� � ��� �������, ����� � �����, ���� ���.
		CreateInvItem(hero,itar_kdf_h);
		AI_EquipArmor(hero,itar_kdf_h);
		HEROGIL_KDF2 = TRUE;
	};
};


instance DIA_PYROKAR_KAP3_READY(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_kap3_ready_condition;
	information = dia_pyrokar_kap3_ready_info;
	description = "��� ��� �������� ������� �����?";
};


func int dia_pyrokar_kap3_ready_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_pyrokar_augegeheilt))
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap3_ready_info()
{
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_00");	//��� ��� �������� ������� �����?
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_01");	//�� ����� ���� ����� �� ����������� ����. ��� � �������� ��������. ���, ������ ����.
	CreateInvItems(self,itmi_innoseye_mis,1);
	b_giveinvitems(self,other,itmi_innoseye_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_02");	//�����, ��� ���� ����� ������� ���������� � ��������, ������ ��� �� ������� ��������� ���.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_01");	//���� ����� �������� �������� �������� � �����, � �������� ������.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_02");	//����� ����, �� ���� ������ �� �� ����.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_05");	//������, ��� ���� �� �����. ���� �������� ����� ��������� ��� ���������� ��������.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_06");	//��� ����� ���� ����������� �������� �� ������ �������, ������� ����� ���������� � ������ �� ������������ �����.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_07");	//������ ����� �� ������� ������������ � ���������� �������.
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_08");	//�������. � ������� ���.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_09");	//������ � ���� ���� ��� �����������. ��� ��. � ���� �� ��� ����� �������.
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	PrintScreen(PRINT_LEARNALCHEMYINNOSEYE,-1,-1,FONT_SCREEN,2);
	TOPIC_END_INNOSEYE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	CreateInvItems(gorax,itmi_runeblank,1);
	Log_CreateTopic(TOPIC_DRACHENJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD,LOG_RUNNING);
	b_logentry(TOPIC_DRACHENJAGD,"������ � ����� � ������� � ���������. ���� ������ ������� ��� ���������� ��. �� ������ ��� �������� � ����� � ���������, � ������ �� ������ ������ ���. � ������ ���������� � ���������, ������ ��� �������� ��������. �������� ������� � ���, ��� ���� ������ ���� ���� ������ ���, ����� � ������������ � ����� �� ���. ����� ������������ ���� ����� �������, ��� ���������� ������ ������� � ������ ��������. � ������ ���������� ����������� ������ � �������� �� ���������� ������ �� ������������ �����, ������ ��� ������������� ������� �������.");
	MIS_READYFORCHAPTER4 = TRUE;
	b_npc_isalivecheck(NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_PYROKAR_BUCHDERBESSENEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 39;
	condition = dia_pyrokar_buchderbessenen_condition;
	information = dia_pyrokar_buchderbessenen_info;
	description = "� ����� �������� ��������.";
};


func int dia_pyrokar_buchderbessenen_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_backfromow) && Npc_HasItems(other,itwr_dementorobsessionbook_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchderbessenen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_00");	//� ����� �������� ��������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_01");	//��? ��� ��� �� ��������?
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_02");	//� �� ������. � �����, �� ������ �����, ��� ������ � ���.
	b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_03");	//��������, ��� ����� ��������� ����. � ���, ��� �� ������ ��� ���. ��� ���� �����.
	b_giveplayerxp(XP_AMBIENT);
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_04");	//� �������, ��� �� �� ������������. ��� � ����� ��� ��� ����� ���������.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_05");	//� ����������, ��� ��� ���������� ������.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_06");	//��� ���������� ���, ����� �������������� ���������� ���� ����� �����.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_07");	//���, ��������, ���������� ����� ���, ��� ��� ��������� ��������, � ��� �����.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_08");	//��������. � ��� ���� ��� ���������� ������. ��� ������� ���� �����, ���������� � ���� ������.
		CreateInvItems(self,itwr_pyrokarsobsessionlist,1);
		b_giveinvitems(self,other,itwr_pyrokarsobsessionlist,1);
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_09");	//����� ���� ����� � ������� ��� �� �����. � ��������� �� ���.
		if(Npc_IsDead(karras) == FALSE)
		{
			AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_10");	//�� ������� �� ������ �������� ���� �� ���� �� ��� �������. �����, ��� ������� ��� � ��� �������������.
		};
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_11");	//� �� ������ ������, ����������� ���������� �� ��������������. �� ��� �� ����� ��������� �� ����.
		b_logentry(TOPIC_DEMENTOREN,"������� �����, ����� �������� ��������� �� ������ �����. �� ��� ��� ������ ����, ���� ������ ��������� ������� ����������. � ���� ������ �������� ������� ����� ��������� ����� �����.");
	};
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_12");	//�� ����������� � ������, ����� ��� �������� �����.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_13");	//���� �� ��� �� �������, ��� �� � ��������� �������������� �� ����, ����������� �� ��� ��� ����� ������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_14");	//������ �����, � ���������, ���� ���� ����� ���� �������.
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_15");	//� �� �� ���������� ���� ��� ������� ������?
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_16");	//������ ��������. ������ ����� ����� ���-������ �� ����.
		PYROKAR_ASKKARRASABOUTDMTAMULETT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"������ ������ ������ ��� ����� ������ �� ���������� ���� ������.");
	};
};


instance DIA_PYROKAR_SCOBSESSED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 70;
	condition = dia_pyrokar_scobsessed_condition;
	information = dia_pyrokar_scobsessed_info;
	permanent = TRUE;
	description = "(�������� �����������)";
};


func int dia_pyrokar_scobsessed_condition()
{
	if(SC_ISOBSESSED == TRUE)
	{
		return TRUE;
	};
};


var int got_healobsession_day;

func void dia_pyrokar_scobsessed_info()
{
	if(((GOT_HEALOBSESSION_DAY <= (Wld_GetDay() - 2)) || (GOT_HEALOBSESSION_DAY == 0)) && (Npc_HasItems(other,itpo_healobsession_mis) == FALSE))
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_00");	//������ ����, ������, ��� � �������.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_01");	//�� ����� ���! ������ ��� �����. ��� ������� ���� �� ������ ��������.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_02");	//�� ������� ���� ����� �� ���� �������.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_03");	//�������� �� ��� ����� � ����������� ������� ������� �����.
			if(SC_OBSESSIONTIMES > 3)
			{
				AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_04");	//�� � ������������� ���� - ���� �� ������ �������� � �� ���� ������� �����, ����� ������� ���, ��� �������� ��� �� �����. ������ ����� �� ����.
			};
			CreateInvItems(self,itpo_healobsession_mis,2);
			b_giveinvitems(self,other,itpo_healobsession_mis,2);
			GOT_HEALOBSESSION_DAY = Wld_GetDay();
		}
		else
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_05");	//� �����, � �������. �� ������ �������� ����?
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_06");	//��� ������� ���������� ������ �������� � ����� ���������, ��� ���. 300 �������.
			Info_ClearChoices(dia_pyrokar_scobsessed);
			Info_AddChoice(dia_pyrokar_scobsessed,"��� ������� �����.",dia_pyrokar_scobsessed_nein);
			Info_AddChoice(dia_pyrokar_scobsessed,"�������. ��� ������.",dia_pyrokar_scobsessed_ok);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_07");	//�� �� ������ ��� ������� ���������� �����. �������� �� ���, ������ ���� ���� ������������� ����������� ������.
	};
};

func void dia_pyrokar_scobsessed_ok()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_ok_15_00");	//�������. ��� ������.
	if(b_giveinvitems(other,self,itmi_gold,300))
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_01");	//���, ����� ���. �� ������� ���� ����� �� ���� �������.
		CreateInvItems(self,itpo_healobsession_mis,2);
		b_giveinvitems(self,other,itpo_healobsession_mis,2);
		GOT_HEALOBSESSION_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_02");	//������� ��� ������, � � ����� ������ ����.
	};
	Info_ClearChoices(dia_pyrokar_scobsessed);
};

func void dia_pyrokar_scobsessed_nein()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_nein_15_00");	//��� ������� �����.
	Info_ClearChoices(dia_pyrokar_scobsessed);
};


instance DIA_PYROKAR_ALMANACHBRINGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 5;
	condition = dia_pyrokar_almanachbringen_condition;
	information = dia_pyrokar_almanachbringen_info;
	permanent = TRUE;
	description = "� ���� ���������� ��� ���-��� �� ���� ���������.";
};


func int dia_pyrokar_almanachbringen_condition()
{
	if((KAPITEL >= 3) && (Npc_HasItems(other,itwr_dementorobsessionbook_mis) >= 1) && (hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pyrokar_buchderbessenen))
	{
		return TRUE;
	};
};


var int almanachcounter;
var int dia_pyrokar_almanachbringen_onetime;

func void dia_pyrokar_almanachbringen_info()
{
	var int almanachcount;
	var int xp_kdf_bringalmanachs;
	var int almanachgeld;
	var int pyrokarsalmanachoffer;
	AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_00");	//� ���� ���������� ��� ���-��� �� ���� ���������.
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_01");	//������, ����.
	pyrokarsalmanachoffer = 400;
	almanachcount = Npc_HasItems(other,itwr_dementorobsessionbook_mis);
	if(almanachcount == 1)
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_02");	//� ����� ��� ���� ��������.
		b_giveplayerxp(XP_KDF_BRINGALMANACH);
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
		ALMANACHCOUNTER = ALMANACHCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_03");	//� ����� ��� ��������� ���� ������.
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,almanachcount);
		xp_kdf_bringalmanachs = almanachcount * XP_KDF_BRINGALMANACH;
		ALMANACHCOUNTER = ALMANACHCOUNTER + almanachcount;
		b_giveplayerxp(xp_kdf_bringalmanachs);
	};
	if(ALMANACHCOUNTER <= 5)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_04");	//��� ������. �����, �������, ��� ��� ������ �� ���. ��������� ������.
	}
	else if(ALMANACHCOUNTER <= 8)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_05");	//������ �� ��� ��� �������. �� � �� �����, ��� �� ������ �� ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_06");	//�� ��� ������ ����� ���� ���� ��������� ����.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_07");	//� ���� �������, ���� ���� ������� ����� ���.
	};
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_08");	//���, ������. ��� ��� �� ���������, ������� ������� ���� ������������� ���.
	if(DIA_PYROKAR_ALMANACHBRINGEN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_09");	//� �� ������� ����� �� ������� ����������� � ��� ���������� ������.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_10");	//��������, ��� ���������� ��������� ��� � �������, ��� ����� ���� ��� �� ������� � ���������.
		DIA_PYROKAR_ALMANACHBRINGEN_ONETIME = TRUE;
	};
	almanachgeld = almanachcount * pyrokarsalmanachoffer;
	CreateInvItems(self,itmi_gold,almanachgeld);
	b_giveinvitems(self,other,itmi_gold,almanachgeld);
};


instance DIA_PYROKAR_KAP4_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap4_exit_condition;
	information = dia_pyrokar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_KAP5_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap5_exit_condition;
	information = dia_pyrokar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_DRACHENTOT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_drachentot_condition;
	information = dia_pyrokar_drachentot_info;
	description = "��� ������� ������.";
};


func int dia_pyrokar_drachentot_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_drachentot_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DRACHENTOT_15_00");	//��� ������� ������.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_01");	//��� �������� ������� �������. �� ��� ���������� �� ������ ���� ���������, ������� ������� �����������.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_02");	//������ ��� ��� �� ����. ������ ��������. � ����� ��� ������ � ������ ��������� � ���, ��� �� ��������� ��������� ����, �� ����������� ���� �����������.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_03");	//����������� �������� ������� ����� ��������� ����, �� ����� ������������. ��� ����� ������� ��� ��� � ������.
};


instance DIA_PYROKAR_DERMEISTER(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_dermeister_condition;
	information = dia_pyrokar_dermeister_info;
	description = "� ������� � ���������.";
};


func int dia_pyrokar_dermeister_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_dermeister_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_00");	//� ������� � ���������.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_01");	//��� ��� �������?
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_02");	//��� ��� ����� �������� � ���� �� ������� � � ���, ��� �� ��������� � �������� ��������.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_03");	//�� �������� � ���� �����. ������ ���� ����������� ���� ���� � ������ ���������� ����� ������������ � ��� ���.
};


instance DIA_PYROKAR_WASISTIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wasistirdorath_condition;
	information = dia_pyrokar_wasistirdorath_info;
	description = "��� ����� ��� ������� ��������?";
};


func int dia_pyrokar_wasistirdorath_condition()
{
	if((KAPITEL == 5) && Npc_KnowsInfo(other,dia_pyrokar_dermeister))
	{
		return TRUE;
	};
};

func void dia_pyrokar_wasistirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_00");	//��� ����� ��� ������� ��������?
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_01");	//��������� ���� ������ ���� �������. ����� �� ����� ������� �� ������. �� ����, ��������, ����� ������� ���� �� ����.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_02");	//����� 40 ��� ����� �������� � �������� ����� ����� �������� �������� ���� ����������.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_03");	//������������ ������ ���� ������� ������ ���, ����� �������� ��� �������������� ���������� � ������.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_04");	//����� ������ ���� ����� ���� ��������� ������ ������������� �� ��������� � ������ ������� � ���������.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_05");	//���� �� �������� ���������� � ���������� ��� �����, ����� �������� ����� �� ��� ��������...
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_06");	//... �� ����� ���� ��� ��� ������ ����, ��� ������ ������������.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_07");	//(����������) �����������. ����� ����. ��, �����.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_08");	//�� ������. �������� ���������. ������� �������� ������������� ������������ ���� ����, � ������ ����� ����� �������� ����� ������.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_09");	//�������, ������� �� ������ ����� ���� ����, � � �����, ��� ����� ���� ��������� � ����� ������� ������.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_10");	//���������.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"�������� ��������, ������� �������� - ��� ������� ���� ������ ���� �������. � ������ ����� ���� ����.");
};


instance DIA_PYROKAR_BUCHIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 54;
	condition = dia_pyrokar_buchirdorath_condition;
	information = dia_pyrokar_buchirdorath_info;
	description = "����� ��������, ������� ������� ���������� - ��� ���?";
};


func int dia_pyrokar_buchirdorath_condition()
{
	if((KAPITEL == 5) && (ITWR_HALLSOFIRDORATHISOPEN == FALSE) && Npc_KnowsInfo(other,dia_pyrokar_wasistirdorath))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_00");	//����� ��������, ������� ������� ���������� - ��� ���?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_01");	//� ������, ��� �� �������� ���. ��, �����, ��� ����� ����������� ��� ����.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_02");	//��� ������� ��� ������ �����. � ����� �� � ���� �� ����� ��������, �� ������� �� �� �������� ������� �� - ��� ������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_03");	//���� ��������� ������� ������ � ���� ������� �����.
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_04");	//���� � ������� ��� �����?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_05");	//���� ���� ������. �� � ����������� ���� �� ����, ��� ���� ������� ��������� ���, ��� ��������� ��������� ���������� ���� ������ ���������.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_06");	//�� ��� �� �� ������ ����������, ������� �� ����� �������������� ����.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"����� �������� '������� ��������' ��������� � ������ �������� ���������. �� �������� �������. ���� �� ������ ������� ��� �����. ��� ������� �� ��� ������ ����� � ��� �������� � ���� ��������.");
	PYROKAR_LETYOUPASSTALAMON = TRUE;
};


instance DIA_PYROKAR_IRDORATHBOOKOPEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_irdorathbookopen_condition;
	information = dia_pyrokar_irdorathbookopen_info;
	description = "� ���� ������� ����� ��������.";
};


func int dia_pyrokar_irdorathbookopen_condition()
{
	if((ITWR_HALLSOFIRDORATHISOPEN == TRUE) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_irdorathbookopen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_15_00");	//� ���� ������� ����� ��������.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_11_01");	//���?! ��� � ���� ��� ����������? ��� ��� ������ ���� � ���!
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"������� ��������� ��� ������.",dia_pyrokar_irdorathbookopen_xardas);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"������ ������ �����, � �����.",dia_pyrokar_irdorathbookopen_glueck);
};

func void dia_pyrokar_irdorathbookopen_glueck()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00");	//������ ������ �����, � �����.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01");	//�� ������ ������. �����!
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02");	//���� ���� � �� ���� ������� ��� �����, � ����� �������� ���-�� ����� ���� � ������� ��������� ��...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03");	//... ��� ������� ���� �� �������� �����������...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04");	//�����. ��� ��� ��, ��������, ������������, ��� ���� ������� ��� �����, �� �, �������, ������� ���� ������� �� � ����. �� ������� ����, ���� �� �� ��������� ���� ������.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};

func void dia_pyrokar_irdorathbookopen_xardas()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00");	//������� ��������� ��� ������.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01");	//��, ��� ��� ���. ��� ���������. ��� �������� ������ ���������, ��� �������� ������� �������� �� ������� ���� ����.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02");	//� ������������� ����. �� ���������� �� ������ ����� ������� �������. �� ������ �������� �� ����.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};


instance DIA_PYROKAR_GEHEIMEBIBLIOTHEK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_geheimebibliothek_condition;
	information = dia_pyrokar_geheimebibliothek_info;
	description = "� ���� ����� ����������� ��������� ����������.";
};


func int dia_pyrokar_geheimebibliothek_condition()
{
	if((ITWR_SCREADSHALLSOFIRDORATH == TRUE) && (KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE) && Npc_KnowsInfo(other,dia_pyrokar_irdorathbookopen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_geheimebibliothek_info()
{
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00");	//� ���� ����� ����������� ��������� ����������.
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01");	//� ��� ��� ��?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02");	//� ����������, ����������� ��� ����� �������. ���� ��� �� � ��� �� �������?
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03");	//���. ��� ��� ���������� ������ ����, �� ������?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04");	//�������. �� ������ �� ������ � ���. ���.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"������� ������ �� ����� � ������ ����������. ������, ������ ������� ����� � ���.");
};


instance DIA_PYROKAR_SCKNOWSWAYTOIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_scknowswaytoirdorath_condition;
	information = dia_pyrokar_scknowswaytoirdorath_info;
	description = "� ����, ��� ����� ������ ������� ��������.";
};


func int dia_pyrokar_scknowswaytoirdorath_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && Npc_KnowsInfo(other,dia_pyrokar_irdorathbookopen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_scknowswaytoirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00");	//� ����, ��� ����� ������ ������� ��������.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01");	//���� ���� ��������� �� �������. � ����� ������� �����, ������� ������� ����.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02");	//��� �����������. ����� ���� ����������� ������� � �������, ����� ��������� �� ����� �����
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03");	//�� �����, ��� �� ������ ������ �������������, ���� ������ ���������� ���������� ��������.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04");	//��� ��� ����� �������?
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05");	//���� ������� ������ �������� �� �����, ������� �� ������ ��������.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06");	//�������� �� ������ �������� � ������� � ���, ��� ����� ���� ������� ���� �� ���� �������.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07");	//���� ���, ���������, ����������� ���. ��, � ���������, � �� ���� �������� �� ������ �������� �� ���������.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08");	//���� �������� �������� ���� �� ��������� ����� ����.
};


instance DIA_PYROKAR_SCWILLJORGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_scwilljorgen_condition;
	information = dia_pyrokar_scwilljorgen_info;
	description = "������ - ������� �����.";
};


func int dia_pyrokar_scwilljorgen_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_home) && Npc_KnowsInfo(other,dia_pyrokar_scknowswaytoirdorath) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_scwilljorgen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_00");	//������ - ������� �����. �� ��� �� ������ ��� ��������� �� ������� �������.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_01");	//�����, ��� ����� �� ��� �� ������.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_02");	//�� ���������� �������� � ����� ���������. �� �� �� ������ �������������� ������ � �� ������ ����.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_03");	//������ ������ ������� ��������� ���� ������, � ����� �� ������ ������� ���, ���� ���������.
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_04");	//������� ������� ��� ������?
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_05");	//�� � ������ �� ���� ���� ����� ���� ���������. ���� �������� �������� ���������� ������� �� �� ��� ������.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_06");	//������� � �� ���� ��������� ���, ���� �� �� ���������� ��� ������ � ����� �����.
};


instance DIA_PYROKAR_MACHDTFREI(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_machdtfrei_condition;
	information = dia_pyrokar_machdtfrei_info;
	description = "� ��� ����� �������, ����� � ��� ������� ������� � ����� ������?";
};


func int dia_pyrokar_machdtfrei_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_scwilljorgen) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_machdtfrei_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MACHDTFREI_15_00");	//� ��� ����� �������, ����� � ��� ������� ������� � ����� ������?
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_01");	//���. �������������, ���� ���-���, ��� �� ��� �� ������� ��� ����. ���� ������� ��������� � ��������� ����� �� ������ ���� � ����.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_02");	//��� �������� ��������� ��, ��� ��������� ��������� ���� � ��� ����� �������� �������� ����.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_03");	//����� ����� ������� ������� ����� � ����, ��������� ������, � ������ �������� ����, �������� ��� ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_04");	//������ ����� ��� ��� �� �������. ���, ������� ��� ��� ���������� � �������� ��� ����������.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_05");	//����� �� ������� ������� �������.
	MIS_PYROKARCLEARDEMONTOWER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PYROKARCLEARDEMONTOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PYROKARCLEARDEMONTOWER,LOG_RUNNING);
	b_logentry(TOPIC_PYROKARCLEARDEMONTOWER,"�������� ���� �������� � ������ ��������. ���� � �������� ��������, ��� ��� ����������, � ���� ����� � ����� �������.");
};


instance DIA_PYROKAR_DTCLEARED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_dtcleared_condition;
	information = dia_pyrokar_dtcleared_info;
	description = "����� �������� ������ ������ �� ����� ����������.";
};


func int dia_pyrokar_dtcleared_condition()
{
	if(Npc_IsDead(xardas_dt_demon1) && Npc_IsDead(xardas_dt_demon2) && Npc_IsDead(xardas_dt_demon3) && Npc_IsDead(xardas_dt_demon4) && Npc_IsDead(xardas_dt_demon5) && Npc_IsDead(xardas_dt_demonlord) && (MIS_PYROKARCLEARDEMONTOWER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_pyrokar_dtcleared_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DTCLEARED_15_00");	//����� �������� ������ ������ �� ����� ����������.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_01");	//��� ��� ��� ����... ���, �������, � �� ���� ���� �����.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_02");	//���� ������ ���� ��� ��� �����, ������ ������� ��� �� ���������.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_03");	//�� ������ ���� �����.
	MIS_PYROKARCLEARDEMONTOWER = LOG_SUCCESS;
	b_giveplayerxp(XP_PYROKARCLEARDEMONTOWER);
};


var int pyro_gives_aura;

instance DIA_PYROKAR_AMULETTOFDEATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 57;
	condition = dia_pyrokar_amulettofdeath_condition;
	information = dia_pyrokar_amulettofdeath_info;
	permanent = TRUE;
	description = "� ����������� ����������� ��������� ���� ������.";
};


func int dia_pyrokar_amulettofdeath_condition()
{
	if((PLAYERGETSAMULETTOFDEATH == TRUE) && (PYRO_GIVES_AURA == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_amulettofdeath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_15_00");	//� ����������� ����������� ��������� ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_11_01");	//���� ������ - ��� ������, ������� ����� ������ ������ ���������� ���� ���� ������ � �������.
	Info_ClearChoices(dia_pyrokar_amulettofdeath);
	Info_AddChoice(dia_pyrokar_amulettofdeath,DIALOG_BACK,dia_pyrokar_amulettofdeath_back);
	Info_AddChoice(dia_pyrokar_amulettofdeath,"���� � ����� ���?",dia_pyrokar_amulettofdeath_canhaveit);
	Info_AddChoice(dia_pyrokar_amulettofdeath,"��� ������ ���� ������?",dia_pyrokar_amulettofdeath_amulett);
};

func void dia_pyrokar_amulettofdeath_back()
{
	Info_ClearChoices(dia_pyrokar_amulettofdeath);
};

func void dia_pyrokar_amulettofdeath_canhaveit()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00");	//���� � ����� ���?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01");	//���? ��� �� � ��� ����������� ������?
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02");	//��������� ������ ��������.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03");	//��, �������. � ��� ���� ���� ������, �� ��������� � ��� �������.
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04");	//��, �������.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05");	//� �� ����, ����� ��� ����� �������� �������� ��� ����� � ������-������ ��������.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06");	//��������� ��� �������, � �� ������ ���� �����.
	CreateInvItems(self,itam_amulettofdeath_mis,1);
	b_giveinvitems(self,other,itam_amulettofdeath_mis,1);
	PYRO_GIVES_AURA = TRUE;
};

func void dia_pyrokar_amulettofdeath_amulett()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00");	//��� ������ ���� ������?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01");	//�������, ��� ����� ��������� ������� ��� � ������� ������������.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02");	//�� �������� ������ ��������� �� ���� ����� �����.
};


instance DIA_PYROKAR_POTIONOFDEATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 57;
	condition = dia_pyrokar_potionofdeath_condition;
	information = dia_pyrokar_potionofdeath_info;
	permanent = TRUE;
	description = "��� ����� ����� ������?";
};


func int dia_pyrokar_potionofdeath_condition()
{
	if(Npc_HasItems(other,itpo_potionofdeath_01_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_potionofdeath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_15_00");	//��� ����� ����� ������?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_11_01");	//����� ������ - ��� �� ����� ��� ������ ������� ������. � ��� ���������, ��� � ������ ������ ����������� ����� ����� ������� � ��������.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,"�������.",dia_pyrokar_potionofdeath_aha);
	Info_AddChoice(dia_pyrokar_potionofdeath,"� ����� ��� �����.",dia_pyrokar_potionofdeath_potion);
};

func void dia_pyrokar_potionofdeath_aha()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Aha_15_00");	//�������.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01");	//� �� ����, ��������� �� �� ��� ����������� ����� ��������, �� � ����� ����������, ��� ������ ����� ����� �������� ��� ������ ������� ������.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_potion()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_00");	//� ����� ��� �����.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01");	//����� �� ����� ����! �� ���� �������� � ���!
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_02");	//� ��� ����?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03");	//���� ��� ������������� ��������� ����� ������, ��...
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_04");	//(���������) ���� ��.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05");	//�� �������� ����. ���� ��� ������������� ��������� ����� ������, �� �� �������� ������� ������ ������ �����.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,DIALOG_BACK,dia_pyrokar_potionofdeath_back);
	Info_AddChoice(dia_pyrokar_potionofdeath,"��� ��� ����� ��� ����� ������?",dia_pyrokar_potionofdeath_teardrops);
	Info_AddChoice(dia_pyrokar_potionofdeath,"��� �� ������ � ���� ��� '�������'?",dia_pyrokar_potionofdeath_weapon);
};

func void dia_pyrokar_potionofdeath_back()
{
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_teardrops()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00");	//��� ��� ����� ��� ����� ������?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01");	//����� ����� �������, ��� ��� �������� ��������� � ��������, ����� ����������� ������, ����� ��������� ���������, ��� ������ ���� ������.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02");	//����� ������� �� ���� ��� � ����� � ��� ���. �� ���� �����, ��� ������ ��� ���� ����������� �������, � ������ �� 13 ���.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03");	//����� � ����.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04");	//����, �������� ��� ����� � ������������� ��, �������� ������������������ ���� � ������� ���. ��� ���������� �������� ������, ���������, � �������� ������� ���.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05");	//��� ����� ������� ������� �������� ����. ��� ����� ������ �� ����, �������� � ��������. �� ��� ���� ������-�����, � ������ ��� ����� 250 ��� � ��� ���, ��� ��������� ��� ������ ����� ������.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_weapon()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_00");	//��� �� ������ � ���� ��� �������?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01");	//������� ������, ��� ��� ������������ ���� ����������, ����� ������ ����� ������� ����� ������������������ ����.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02");	//�� ���� �������� ���������, � ��� �������� ����� ���� ��������.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03");	//���������� ����������� ������� ������� ���� ����� �������� ������ ��������� ������ ������.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_04");	//�������.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05");	//�� ��� ����� ����� ����� ��������� ��������� � ������. ������ ����� ������ ������ ����� ���� ��.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06");	//������ ������� - ���� �������� ������ ������� - ������� ����������� ������.
	Npc_RemoveInvItems(hero,itpo_potionofdeath_01_mis,1);
	CreateInvItems(hero,itpo_potionofdeath_02_mis,1);
};


instance DIA_PYROKAR_KAP6_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap6_exit_condition;
	information = dia_pyrokar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_PICKPOCKET(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 900;
	condition = dia_pyrokar_pickpocket_condition;
	information = dia_pyrokar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_pyrokar_pickpocket_condition()
{
	return c_beklauen(108,550);
};

func void dia_pyrokar_pickpocket_info()
{
	Info_ClearChoices(dia_pyrokar_pickpocket);
	Info_AddChoice(dia_pyrokar_pickpocket,DIALOG_BACK,dia_pyrokar_pickpocket_back);
	Info_AddChoice(dia_pyrokar_pickpocket,DIALOG_PICKPOCKET,dia_pyrokar_pickpocket_doit);
};

func void dia_pyrokar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pyrokar_pickpocket);
};

func void dia_pyrokar_pickpocket_back()
{
	Info_ClearChoices(dia_pyrokar_pickpocket);
};

