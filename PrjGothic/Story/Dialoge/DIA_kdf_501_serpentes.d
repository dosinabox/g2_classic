
instance DIA_SERPENTES_KAP1_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap1_exit_condition;
	information = dia_serpentes_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap1_exit_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_NOTALK(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_notalk_condition;
	information = dia_serpentes_notalk_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_serpentes_notalk_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_notalk_info()
{
	AI_Output(self,other,"DIA_Serpentes_NOTALK_10_00");	//(��������) �� ������������� ���������� �� ���, ���������? ����������� � ����� ������.
	Info_ClearChoices(dia_serpentes_notalk);
	Info_AddChoice(dia_serpentes_notalk,"��� ����� ���� (�����)",dia_serpentes_notalk_exit);
	Info_AddChoice(dia_serpentes_notalk,"� ���� ���� ��� ���� ������...",dia_serpentes_notalk_question);
};

func void dia_serpentes_notalk_question()
{
	AI_Output(other,self,"DIA_Serpentes_NOTALK_QUESTION_15_00");	//� ���� ���� ��� ���� ������...
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_01");	//(� ������) ������, �� �� ���������. � �����, ����� �������� � �����, � ����� ���. ��� �� � ���� ���������?
	AI_Output(self,other,"DIA_Serpentes_NOTALK_QUESTION_10_02");	//� ������ ����������� � ������!
	AI_StopProcessInfos(self);
};

func void dia_serpentes_notalk_exit()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_GOAWAY(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_goaway_condition;
	information = dia_serpentes_goaway_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_serpentes_goaway_condition()
{
	if(Npc_KnowsInfo(hero,dia_serpentes_notalk) && Npc_IsInState(self,zs_talk) && !Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_goaway_info()
{
	AI_Output(self,other,"DIA_Serpentes_GOAWAY_10_00");	//���� ����������� ����� ������� �� ������ � ���������� ��������, �� ����� � ����� �������, ���������!
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_YOURSTORY(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 24;
	condition = dia_serpentes_yourstory_condition;
	information = dia_serpentes_yourstory_info;
	permanent = FALSE;
	description = "� ������, ��� �� ������ ��������� �����.";
};


func int dia_serpentes_yourstory_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulthar_test) && (other.guild == GIL_NOV) && (Npc_KnowsInfo(hero,dia_pyrokar_magican) == FALSE) && (MIS_GOLEM != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_serpentes_yourstory_info()
{
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_00");	//� ������, ��� �� ������ ��������� �����.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_01");	//�� ���� �������� ��� ����������� � �������� ���� �� ����. ��� ���������, ��� �������� ������ ��� ���������, ������.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_02");	//(��������������) ���� �� ����� �������� ������ ��� ���������. ���� ��� ����. ����� ����� � ���������, �, ��������, ����� ��������� ��� �� ������ ������.
	AI_Output(other,self,"DIA_Serpentes_YOURSTORY_15_03");	//� ���� ������ ��� ���������.
	AI_Output(self,other,"DIA_Serpentes_YOURSTORY_10_04");	//���� ������ ���� ������, �� ��������. �� ���� ��� - �� �� ������.
};


instance DIA_SERPENTES_TEST(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_test_condition;
	information = dia_serpentes_test_info;
	permanent = FALSE;
	description = "� ����� ������ ���� ���������, ������.";
};


func int dia_serpentes_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_test_info()
{
	AI_Output(other,self,"DIA_Serpentes_TEST_15_00");	//� ����� ������ ���� ���������, ������.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_01");	//����, �� ������ ������������� ����� ���������. ������ ����� ������������ ���������� ������� �����. �� �������� - ��� �� ���, ��� ���� �����������.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_02");	//���������� �� �� ����, ����� ������ ��� ���������? � ��� � ���� ������ ��������� ��� ���������, ��� ��������� ����?
	AI_Output(self,other,"DIA_Serpentes_TEST_10_03");	//���� ���, �� ��������� �� ��� ����� ������.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_04");	//� ������ ������: � ����� ������, ����� ����, ��� ������� �� ��� ������ - ����� ����, ��� �����-�� ��� ������.
	AI_Output(self,other,"DIA_Serpentes_TEST_10_05");	//������ ����, ���� ������ ������� - �������� ������ � ����� ������, ������� � ����������� ������ - � �������� ���.
	MIS_GOLEM = LOG_RUNNING;
	Log_CreateTopic(TOPIC_GOLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GOLEM,LOG_RUNNING);
	b_logentry(TOPIC_GOLEM,"��������� ��� ��� ���������. �� �����, ����� � '����� ��� ����, ��� �����-�� ��� ������', ����� �����, � ������� ���.");
};


instance DIA_SERPENTES_NOIDEA(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_noidea_condition;
	information = dia_serpentes_noidea_info;
	permanent = FALSE;
	description = "� ����� ������? ��� �� �������� ��� ������ ����?";
};


func int dia_serpentes_noidea_condition()
{
	if((MIS_GOLEM == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_noidea_info()
{
	AI_Output(other,self,"DIA_Serpentes_NOIDEA_15_00");	//� ����� ������? ��� �� �������� ��� ������ ����?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_01");	//� ������ ���� ���. (� ��������) ��� ��� ��������� ������� ���� ������� �������?
	AI_Output(self,other,"DIA_Serpentes_NOIDEA_10_02");	//������ �� �������, ��� �������� ������ ��������� ����� - � ������ �� ���� �������� �� ���� �������.
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_NOHELP(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 10;
	condition = dia_serpentes_nohelp_condition;
	information = dia_serpentes_nohelp_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_serpentes_nohelp_condition()
{
	if(Npc_KnowsInfo(hero,dia_serpentes_noidea) && (Npc_IsDead(magic_golem) == FALSE) && (MIS_GOLEM == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && ((Npc_KnowsInfo(other,dia_ulthar_test) == FALSE) || Npc_KnowsInfo(other,dia_serpentes_yourstory)))
	{
		return TRUE;
	};
};

func void dia_serpentes_nohelp_info()
{
	AI_Output(self,other,"DIA_Serpentes_NOHELP_10_00");	//(� ����������) ��� � �������� ���� ������, ���������!
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_SUCCESS(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 3;
	condition = dia_serpentes_success_condition;
	information = dia_serpentes_success_info;
	permanent = FALSE;
	description = "� ������� ������.";
};


func int dia_serpentes_success_condition()
{
	if(Npc_IsDead(magicgolem) && (MIS_GOLEM == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_serpentes_success_info()
{
	var C_NPC garwig;
	garwig = Hlp_GetNpc(nov_608_garwig);
	AI_Output(other,self,"DIA_Serpentes_SUCCESS_15_00");	//� ������� ������.
	AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_01");	//���? �� ������������� ������ ���? �� ��� ������ ������ �� ������� �� �� ���� ���������� ����� ������.
	if(Npc_IsDead(garwig))
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_02");	//(� ��������) �� �� ����� ����! ��� �� ���� �������!
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_03");	//�� �������� ��������� �� �������� ����� ������!!!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_KILL,0);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_04");	//(� ����������) ��� �� �����, � ������ ��������, ��� �� �������� �������, ������� � ��� ����.
	};
	if(Npc_HasItems(other,holy_hammer_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Serpentes_SUCCESS_10_05");	//� ����� �����, ���� � ������ ���� �����.
		Npc_RemoveInvItems(other,holy_hammer_mis,1);
		Wld_InsertItem(holy_hammer_mis,"FP_HAMMER");
	};
	MIS_GOLEM = LOG_SUCCESS;
	b_giveplayerxp(XP_GOLEM);
};


instance DIA_SERPENTES_PERM(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 99;
	condition = dia_serpentes_perm_condition;
	information = dia_serpentes_perm_info;
	permanent = TRUE;
	description = "�� ������ ���-�� ��� ������� ���?";
};


func int dia_serpentes_perm_condition()
{
	if((KAPITEL >= 3) || Npc_KnowsInfo(other,dia_serpentes_success))
	{
		return TRUE;
	};
};

func void dia_serpentes_perm_info()
{
	AI_Output(other,self,"DIA_Serpentes_PERM_15_00");	//�� ������ ���-�� ��� ������� ���?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_01");	//���. ���� ���, ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_PERM_10_02");	//��������. �� ������, ��� ���� ����� ������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP2_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap2_exit_condition;
	information = dia_serpentes_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP3_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap3_exit_condition;
	information = dia_serpentes_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_MINENANTEILE(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 30;
	condition = dia_serpentes_minenanteile_condition;
	information = dia_serpentes_minenanteile_info;
	important = TRUE;
};


func int dia_serpentes_minenanteile_condition()
{
	if((PEDRO_TRAITOR == TRUE) && ((hero.guild == GIL_KDF) || (hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (KAPITEL >= 3))
	{
		return TRUE;
	};
};

func void dia_serpentes_minenanteile_info()
{
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_00");	//�� ��� ������. � ���� ���� ��� ���� ������� ��� ����.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteile_15_01");	//(��������) ��� ���?
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_02");	//������, ����� �� ������������ � �������� ����, �� ����� ������ ��������� �����������, ������������� ������ ���������.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_03");	//������� ���������� �� ������ ��������� ����� - ��� �����, ��� �� ������, �������� ��������� ���������� � ������� ������������� ����������.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_04");	//��������� ������, � ������� ��� �������� ����� ����, ��������� ��������� ��������, � � ���� ����� ����������� ��� � ��������.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"� ���� � ��� ��� ����� �������. ����� ����-������ ���.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"��� �� ��� ��������?",dia_serpentes_minenanteile_was);
		Info_AddChoice(dia_serpentes_minenanteile,"����� ��� �� ������ ���������?",dia_serpentes_minenanteile_miliz);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteile_10_05");	//������� ����� ���� ��� �� ����� ������ ��� � ���� �������.
		Info_ClearChoices(dia_serpentes_minenanteile);
		Info_AddChoice(dia_serpentes_minenanteile,"� ���� � ��� ��� ����� �������. ����� ����-������ ���.",dia_serpentes_minenanteile_nein);
		Info_AddChoice(dia_serpentes_minenanteile,"���� � ������ �����?",dia_serpentes_minenanteile_killsld);
	};
};

func void dia_serpentes_minenanteile_miliz()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_miliz_15_00");	//����� ��� �� ������ ���������?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_miliz_10_01");	//��������� �������� ������ �� �����. ��� ���� ����� ����� ������ ������ �����������.
};

func void dia_serpentes_minenanteile_nein()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_nein_15_00");	//� ���� � ��� ��� ����� �������. ����� ����-������ ���.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_01");	//(�������) ��� �������������. ���� ������� �� ������� ������ ������ �����, ���� �� �� ������� ��������� ������ ��� ��������.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_nein_10_02");	//� �������� ���� �������. �������, ������ ����� �� ���������� - ����� �� ����� �������.
	AI_StopProcessInfos(self);
};

func void dia_serpentes_minenanteile_was()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_15_00");	//�� ��� ��� ���?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_01");	//���-�� � ������ ������� ��������� ����� ���� ������ �������������� �������.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_02");	//��� ������ ��������� ���������� � �� ����� ������� ��������. �� ��� ��, ��� ����� ������� �������� � ������������ ����� �����, ��� �� �� ����� ��������� ���� � ������� ��������.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_03");	//���� �������� ���������������� ����� ����� �� ����� �������� ������������ ���������� � ������ � �������� ���������, � ��� ��� ������� ������� ���� ���������� ����� ��������� �� ���.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_04");	//����� ����� ��������� � ������� ��� ����. � ����� ������� ������� �� �� �������� ������� � ����������.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_10_05");	//��� ���� ������ ����� �������������, ����� ������ ���� ���������.
	Info_AddChoice(dia_serpentes_minenanteile,"� �������� ��������� ���� ������.",dia_serpentes_minenanteile_was_ja);
};

func void dia_serpentes_minenanteile_was_ja()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_00");	//� �������� ��������� ���� ������.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_01");	//��� ����. ����� �� ������ ������������� � ����� ����������, �����, ����� ��� �� ������, ��� �� ����� ������ ��� �����.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_02");	//� �����, ��� ������� ������� ��, �� ��������� ��������� ����� � ����� ����, ���� ������, ��� �� ���������� �� ��������� ������, ���������?
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_ja_15_03");	//��.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_ja_10_04");	//����� �� ������. � ����� ���� ������, ����.
	Info_ClearChoices(dia_serpentes_minenanteile);
	MIS_SERPENTES_MINENANTEIL_KDF = LOG_RUNNING;
	if(Npc_IsDead(salandril) == FALSE)
	{
		CreateInvItems(salandril,itwr_minenanteil_mis,2);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 2;
	};
	if(Npc_IsDead(vlk_416_matteo) == FALSE)
	{
		CreateInvItems(vlk_416_matteo,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_413_bosper) == FALSE)
	{
		CreateInvItems(vlk_413_bosper,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_409_zuris) == FALSE)
	{
		CreateInvItems(vlk_409_zuris,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(bau_911_elena) == FALSE)
	{
		CreateInvItems(bau_911_elena,itwr_minenanteil_mis,2);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 2;
	};
	if(Npc_IsDead(bau_970_orlan) == FALSE)
	{
		CreateInvItems(bau_970_orlan,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_407_hakon) == FALSE)
	{
		CreateInvItems(vlk_407_hakon,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(bau_936_rosi) == FALSE)
	{
		CreateInvItems(bau_936_rosi,itwr_minenanteil_mis,1);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 1;
	};
	if(Npc_IsDead(vlk_468_canthar) == FALSE)
	{
		CreateInvItems(vlk_468_canthar,itwr_minenanteil_mis,3);
		SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER + 3;
	};
	SALANDRILVERTEILTEMINENANTEIL = SALANDRILMINENANTEIL_MAINCOUNTER;
	Log_CreateTopic(TOPIC_MINENANTEILE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MINENANTEILE,LOG_RUNNING);
	b_logentry(TOPIC_MINENANTEILE,"���-�� ������� ��������� ����� ����� � ����������� ����� ���������� ��������. � ������ ����� ����, ��� ������� ��� ����� ���������. ��������� ����� ���������� ��� ��� ���������� ���������.");
};

func void dia_serpentes_minenanteile_killsld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_Kill_15_00");	//���� � ������ �����?
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_01");	//�, �����. ������, ������� ��. ��� ���� ������� ���������, ��, ������ ������.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_02");	//���������, ������� �� �������� ��������, ������� � ��������� ������������ � ��� ����� �������� �� ���.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_03");	//������ �� ������������ ������� � ��������� ��� ����. ������� ��� ����.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_Kill_10_04");	//��� �� �������� ���, ���� �� �������. �� ��, ������� ��, ������ ������������.
	Info_AddChoice(dia_serpentes_minenanteile,"����� ��� �� ������ ���������?",dia_serpentes_minenanteile_miliz);
	Info_AddChoice(dia_serpentes_minenanteile,"��� �������. � ������ ���.",dia_serpentes_minenanteile_was_jasld);
};


var int mis_serpentes_bringsalandril_sld;

func void dia_serpentes_minenanteile_was_jasld()
{
	AI_Output(other,self,"DIA_Serpentes_MinenAnteile_was_jaSLD_15_00");	//��� �������. � ������ ���.
	AI_Output(self,other,"DIA_Serpentes_MinenAnteile_was_jaSLD_10_01");	//������. �� ������� �������� �� ���� ������� ����� ��������� ����.
	MIS_SERPENTES_BRINGSALANDRIL_SLD = LOG_RUNNING;
	Info_ClearChoices(dia_serpentes_minenanteile);
	Log_CreateTopic(TOPIC_MINENANTEILE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MINENANTEILE,LOG_RUNNING);
	b_logentry(TOPIC_MINENANTEILE,"� ������ ��������� ����������, �������� �� ������� ����� ��������, � ��������� ��� ����. ��� �� �������� ����������, ��� �� ��� ��������, ���� ��� ������ ������ �� ���.");
};


instance DIA_SERPENTES_MINENANTEILEBRINGEN(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 2;
	condition = dia_serpentes_minenanteilebringen_condition;
	information = dia_serpentes_minenanteilebringen_info;
	permanent = TRUE;
	description = "������ ���������� �����...";
};


func int dia_serpentes_minenanteilebringen_condition()
{
	if((MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_HasItems(other,itwr_minenanteil_mis) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};


var int serpentesminenanteilcounter;

func void dia_serpentes_minenanteilebringen_info()
{
	var int serpentesminenanteilcount;
	var int xp_bringserpentesminenanteils;
	var int serpentesminenanteiloffer;
	var int serpentesminenanteilgeld;
	var string minenanteiltext;
	var string minenanteilleft;
	serpentesminenanteilcount = Npc_HasItems(other,itwr_minenanteil_mis);
	serpentesminenanteiloffer = 200;
	if(serpentesminenanteilcount == 1)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_00");	//� ���� ����� ����� ����.
		b_giveplayerxp(XP_BRINGSERPENTESMINENANTEIL);
		b_giveinvitems(other,self,itwr_minenanteil_mis,1);
		SERPENTESMINENANTEILCOUNTER = SERPENTESMINENANTEILCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_01");	//� ���� ����� ��������� ����� ����.
		b_giveinvitems(other,self,itwr_minenanteil_mis,serpentesminenanteilcount);
		xp_bringserpentesminenanteils = serpentesminenanteilcount * XP_BRINGSERPENTESMINENANTEIL;
		SERPENTESMINENANTEILCOUNTER = SERPENTESMINENANTEILCOUNTER + serpentesminenanteilcount;
		b_giveplayerxp(xp_bringserpentesminenanteils);
	};
	SALANDRILMINENANTEIL_MAINCOUNTER = SALANDRILMINENANTEIL_MAINCOUNTER - serpentesminenanteilcount;
	minenanteilleft = IntToString(SALANDRILMINENANTEIL_MAINCOUNTER);
	minenanteiltext = ConcatStrings(minenanteilleft,PRINT_NUMBERLEFT);
	AI_PrintScreen(minenanteiltext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,4);
	if(SERPENTESMINENANTEILCOUNTER < SALANDRILVERTEILTEMINENANTEIL)
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_02");	//����� ������. �� ������ ������ �� ��������� ��� �����. ��� ������ ��� ����� �����. ������� �� ��� ���.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_03");	//���. ��� ������������ ���� �������.
	}
	else if(SERPENTESMINENANTEILCOUNTER == SALANDRILVERTEILTEMINENANTEIL)
	{
		AI_Output(other,self,"DIA_Serpentes_MinenAnteileBringen_15_04");	//��� ��� �����, ��� ��� �������.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_05");	//�������. �� �������� �������.
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_06");	//������ ���� �������� ������. �� ������� ���� ������ �� ����, ������� ��� ������ ������� ����.
		CreateInvItems(self,itam_prot_mage_01,1);
		b_giveinvitems(self,other,itam_prot_mage_01,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Serpentes_MinenAnteileBringen_10_07");	//��� ������������� ��������� �����, ��?
	};
	serpentesminenanteilgeld = serpentesminenanteilcount * serpentesminenanteiloffer;
	CreateInvItems(self,itmi_gold,serpentesminenanteilgeld);
	b_giveinvitems(self,other,itmi_gold,serpentesminenanteilgeld);
};


instance DIA_SERPENTES_GOTSALANDRIL(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 32;
	condition = dia_serpentes_gotsalandril_condition;
	information = dia_serpentes_gotsalandril_info;
	description = "� ����, ��� ���� ��� ����� � ���������.";
};


func int dia_serpentes_gotsalandril_condition()
{
	if((SC_KNOWSPROSPEKTORSALANDRIL == TRUE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_serpentes_gotsalandril_info()
{
	AI_Output(other,self,"DIA_Serpentes_GOTSalandril_15_00");	//� ����, ��� ���� ��� ����� � ���������. ��� ���������, ������� �� �������� �������� ������.
	AI_Output(self,other,"DIA_Serpentes_GOTSalandril_10_01");	//����� ������� ��� ����. ��� ����, ��� �������� � ���.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_SERPENTES_SALANDRILHERE(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 33;
	condition = dia_serpentes_salandrilhere_condition;
	information = dia_serpentes_salandrilhere_info;
	description = "��������� �����, � ���������.";
};


func int dia_serpentes_salandrilhere_condition()
{
	if(Npc_GetDistToWP(salandril,"ALTAR") < 10000)
	{
		if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
		{
			return TRUE;
		}
		else if(Npc_KnowsInfo(other,dia_serpentes_gotsalandril) && (hero.guild == GIL_KDF))
		{
			return TRUE;
		};
	};
	return FALSE;
};

func void dia_serpentes_salandrilhere_info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilHERE_15_00");	//��������� �����, � ���������.
	AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_01");	//�������. �� ���������� � ��� �����.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Serpentes_SalandrilHERE_10_02");	//��� ���� �������. � ������ �� ����� �� ����, �������?
		CreateInvItems(self,itmi_gold,400);
		b_giveinvitems(self,other,itmi_gold,400);
	};
	TOPIC_END_MINENANTEILE = TRUE;
	b_giveplayerxp(XP_SALANDRILINKLOSTER);
};


instance DIA_SERPENTES_SALANDRILDEAD(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 33;
	condition = dia_serpentes_salandrildead_condition;
	information = dia_serpentes_salandrildead_info;
	description = "��������� �����.";
};


func int dia_serpentes_salandrildead_condition()
{
	if((Npc_KnowsInfo(other,dia_serpentes_gotsalandril) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (MIS_SERPENTES_BRINGSALANDRIL_SLD == LOG_RUNNING))) && Npc_IsDead(salandril))
	{
		return TRUE;
	};
};

func void dia_serpentes_salandrildead_info()
{
	AI_Output(other,self,"DIA_Serpentes_SalandrilDEAD_15_00");	//��������� �����.
	AI_Output(self,other,"DIA_Serpentes_SalandrilDEAD_10_01");	//��� �, ������, ��� ���� �� �������� ��������������. �� �������� ����� ��� ��� ������ �����.
	TOPIC_END_MINENANTEILE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_SERPENTES_KAP4_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap4_exit_condition;
	information = dia_serpentes_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_KAP5_EXIT(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 999;
	condition = dia_serpentes_kap5_exit_condition;
	information = dia_serpentes_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_serpentes_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_serpentes_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SERPENTES_PICKPOCKET(C_INFO)
{
	npc = kdf_501_serpentes;
	nr = 900;
	condition = dia_serpentes_pickpocket_condition;
	information = dia_serpentes_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_serpentes_pickpocket_condition()
{
	return c_beklauen(86,380);
};

func void dia_serpentes_pickpocket_info()
{
	Info_ClearChoices(dia_serpentes_pickpocket);
	Info_AddChoice(dia_serpentes_pickpocket,DIALOG_BACK,dia_serpentes_pickpocket_back);
	Info_AddChoice(dia_serpentes_pickpocket,DIALOG_PICKPOCKET,dia_serpentes_pickpocket_doit);
};

func void dia_serpentes_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_serpentes_pickpocket);
};

func void dia_serpentes_pickpocket_back()
{
	Info_ClearChoices(dia_serpentes_pickpocket);
};

