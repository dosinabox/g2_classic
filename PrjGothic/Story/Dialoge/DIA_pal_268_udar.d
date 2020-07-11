
instance DIA_UDAR_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_exit_condition;
	information = dia_udar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_exit_condition()
{
	if(KAPITEL < 4)
	{
		return TRUE;
	};
};

func void dia_udar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_HELLO(C_INFO)
{
	npc = pal_268_udar;
	nr = 2;
	condition = dia_udar_hello_condition;
	information = dia_udar_hello_info;
	important = TRUE;
};


func int dia_udar_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_udar_hello_info()
{
	AI_Output(self,other,"DIA_Udar_Hello_09_00");	//���� ������ �������, ����� �� ���������� ����. � ���� �� ��������� ����.
	AI_Output(other,self,"DIA_Udar_Hello_15_01");	//�����, ��������, � ������ ����������, ��� � ���� ����� ������ ����.
	AI_Output(self,other,"DIA_Udar_Hello_09_02");	//�� ����� ��������� �������. �������� � ���������, ���� ���� ���-������ �����.
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_YOUAREBEST(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_youarebest_condition;
	information = dia_udar_youarebest_info;
	permanent = FALSE;
	description = "� ������, ��� �� ������ ���������� ...";
};


func int dia_udar_youarebest_condition()
{
	if(Npc_KnowsInfo(other,dia_keroloth_udar))
	{
		return TRUE;
	};
};

func void dia_udar_youarebest_info()
{
	AI_Output(other,self,"DIA_Udar_YouAreBest_15_00");	//� ������, ��� �� ������ ���������� �� ���� ������.
	AI_Output(self,other,"DIA_Udar_YouAreBest_09_01");	//��, ���� ��� �������, ��������, ��� ������. ��� ���� �����?
};


instance DIA_UDAR_TEACHME(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_teachme_condition;
	information = dia_udar_teachme_info;
	permanent = FALSE;
	description = "����� ���� �������� �� ��������.";
};


func int dia_udar_teachme_condition()
{
	if(Npc_KnowsInfo(other,dia_udar_youarebest) && (UDAR_TEACHPLAYER != TRUE))
	{
		return TRUE;
	};
};

func void dia_udar_teachme_info()
{
	AI_Output(other,self,"DIA_Udar_Teacher_15_00");	//����� ���� �������� �� ��������.
	AI_Output(self,other,"DIA_Udar_Teacher_09_01");	//��������! ������ ����� ������ ���������� �������, �� ������� ����� ���������������.
};


instance DIA_UDAR_IMGOOD(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_imgood_condition;
	information = dia_udar_imgood_info;
	permanent = FALSE;
	description = "����� ������� ���������� - �.";
};


func int dia_udar_imgood_condition()
{
	if(Npc_KnowsInfo(other,dia_udar_youarebest))
	{
		return TRUE;
	};
};

func void dia_udar_imgood_info()
{
	AI_Output(other,self,"DIA_Udar_ImGood_15_00");	//����� ������� ���������� - �.
	AI_Output(self,other,"DIA_Udar_ImGood_09_01");	//(�������) ��, �� ����!
	AI_Output(self,other,"DIA_Udar_ImGood_09_02");	//��� �, ���� �� ������ ���������, � ���� ������.
	UDAR_TEACHPLAYER = TRUE;
	b_logentry(TOPIC_TEACHER_OC,"���� ����� ������� ���� ��������� �������� �� ��������.");
};


instance DIA_UDAR_TEACH(C_INFO)
{
	npc = pal_268_udar;
	nr = 3;
	condition = dia_udar_teach_condition;
	information = dia_udar_teach_info;
	permanent = TRUE;
	description = "� ���� ��������� � ����.";
};


func int dia_udar_teach_condition()
{
	if(UDAR_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_udar_teach_info()
{
	AI_Output(other,self,"DIA_Udar_Teach_15_00");	//� ���� ��������� � ����.
	AI_Output(self,other,"DIA_Udar_Teach_09_01");	//�����, �����!
	Info_ClearChoices(dia_udar_teach);
	Info_AddChoice(dia_udar_teach,DIALOG_BACK,dia_udar_teach_back);
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_udar_teach_crossbow_1);
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_udar_teach_crossbow_5);
};

func void dia_udar_teach_back()
{
	Info_ClearChoices(dia_udar_teach);
};

func void b_udar_teachnomore1()
{
	AI_Output(self,other,"B_Udar_TeachNoMore1_09_00");	//�� ��� ������ ������ - �� ������� � ��� ��� �������.
};

func void b_udar_teachnomore2()
{
	AI_Output(self,other,"B_Udar_TeachNoMore2_09_00");	//����� �������� �������� ���� �������, ���� ����� �������� ����� ����������� �������.
};

func void dia_udar_teach_crossbow_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,1,30);
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 30)
	{
		b_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_udar_teachnomore2();
		};
	};
	Info_ClearChoices(dia_udar_teach);
	Info_AddChoice(dia_udar_teach,DIALOG_BACK,dia_udar_teach_back);
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_udar_teach_crossbow_1);
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_udar_teach_crossbow_5);
};

func void dia_udar_teach_crossbow_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_CROSSBOW,5,30);
	if(other.hitchance[NPC_TALENT_CROSSBOW] >= 30)
	{
		b_udar_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_CROSSBOW) == 1)
		{
			b_udar_teachnomore2();
		};
	};
	Info_ClearChoices(dia_udar_teach);
	Info_AddChoice(dia_udar_teach,DIALOG_BACK,dia_udar_teach_back);
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW1,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW)),dia_udar_teach_crossbow_1);
	Info_AddChoice(dia_udar_teach,b_buildlearnstring(PRINT_LEARNCROSSBOW5,b_getlearncosttalent(other,NPC_TALENT_CROSSBOW) * 5),dia_udar_teach_crossbow_5);
};


instance DIA_UDAR_PERM(C_INFO)
{
	npc = pal_268_udar;
	nr = 11;
	condition = dia_udar_perm_condition;
	information = dia_udar_perm_info;
	permanent = FALSE;
	description = "��� ���� � �����?";
};


func int dia_udar_perm_condition()
{
	if(KAPITEL <= 3)
	{
		return TRUE;
	};
};

func void dia_udar_perm_info()
{
	AI_Output(other,self,"DIA_Udar_Perm_15_00");	//��� ���� � �����?
	AI_Output(self,other,"DIA_Udar_Perm_09_01");	//��������� �� ����� ������ ��������� ���� �����������, ��, � ��������, ��� �� ������ ����, ����� ���-������ ����������.
	AI_Output(self,other,"DIA_Udar_Perm_09_02");	//��� ���������������� ����������. ������ ��������� ���� �������� �����. ��� ����� ��������, ���� ���� �������� �� ������.
};


instance DIA_UDAR_RING(C_INFO)
{
	npc = pal_268_udar;
	nr = 11;
	condition = dia_udar_ring_condition;
	information = dia_udar_ring_info;
	permanent = FALSE;
	description = "���, � ������ ���� ������ �������� ...";
};


func int dia_udar_ring_condition()
{
	if(Npc_HasItems(other,itri_hp_01) >= 1)
	{
		return TRUE;
	};
};

func void dia_udar_ring_info()
{
	AI_Output(other,self,"DIA_Udar_Ring_15_00");	//���, � ������ ���� ������ ��������. ��� ����� �������� ����. ������� �������, ��� �� �����-������ �������� � ������� ��� ������ �����.
	AI_Output(self,other,"DIA_Udar_Ring_09_01");	//���? �� �� ������, ��� ��� �� ������? �� ������� ��� ������� �� ��������, ����������� � ���.
	AI_Output(self,other,"DIA_Udar_Ring_09_02");	//��������, ��� �� ����� ������� ��� �����? ���� ������ ���� ������, ��� � �����. ���� ������ ���� ������...
	b_giveinvitems(other,self,itri_hp_01,1);
	TENGRONRING = TRUE;
	b_giveplayerxp(XP_TENGRONRING);
};


instance DIA_UDAR_KAP4_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_kap4_exit_condition;
	information = dia_udar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_udar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_KAP4WIEDERDA(C_INFO)
{
	npc = pal_268_udar;
	nr = 40;
	condition = dia_udar_kap4wiederda_condition;
	information = dia_udar_kap4wiederda_info;
	important = TRUE;
};


func int dia_udar_kap4wiederda_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_udar_kap4wiederda_info()
{
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_00");	//������, ��� �� ������. ����� �������� ����� ��.
	if(hero.guild != GIL_DJG)
	{
		AI_Output(other,self,"DIA_Udar_Kap4WiederDa_15_01");	//��� ���������?
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_02");	//�������� �� �������� ��������� �� ����� ����� � ����������, ��� ����� ������ �������� � ���������.
		AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_03");	//�� � ����� ���� - ���� �� ����, ��� ��� ��������, ��� �� � ��������� ����� ���� ������� �������� ��������.
	};
	AI_Output(self,other,"DIA_Udar_Kap4WiederDa_09_04");	//������ �� ��� ��� ��������� � ��� �� �����, ��� ��� ������� ��������� ������ ������.
};


instance DIA_UDAR_SENGRATH(C_INFO)
{
	npc = pal_268_udar;
	nr = 41;
	condition = dia_udar_sengrath_condition;
	information = dia_udar_sengrath_info;
	description = "��-�����, �� ������ ������ ����� �� �����?";
};


func int dia_udar_sengrath_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_udar_kap4wiederda) && (SENGRATH_MISSING == TRUE))
	{
		return TRUE;
	};
};

func void dia_udar_sengrath_info()
{
	AI_Output(other,self,"DIA_Udar_Sengrath_15_00");	//��-�����, �� ������ ������ ����� �� �����?
	AI_Output(self,other,"DIA_Udar_Sengrath_09_01");	//������ ���. ������� ����� � ���� ����� � ������.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_02");	//�� ������� ���� �������, � ��� ���� ����.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_03");	//�� ������, ��� ���� �� ����� ������� ��� � ����������� � �������.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_04");	//������� ��������� � ������� � ���� �� ����������� � ��������� �����. � ��� ��� ��� ����� �� �����.
	AI_Output(self,other,"DIA_Udar_Sengrath_09_05");	//�� �������� � ���� �����!
	Log_CreateTopic(TOPIC_SENGRATH_MISSING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SENGRATH_MISSING,LOG_RUNNING);
	b_logentry(TOPIC_SENGRATH_MISSING,"����, �������� �����, ������� �� ������ �������� ��������. ��������� ��� �� ����� ��� ���-�� ������ �����, ��� ����������� � ������ �����, ����� ������� ���� �������.");
};


instance DIA_UDAR_SENGRATHGEFUNDEN(C_INFO)
{
	npc = pal_268_udar;
	nr = 42;
	condition = dia_udar_sengrathgefunden_condition;
	information = dia_udar_sengrathgefunden_info;
	description = "� ����� ��������.";
};


func int dia_udar_sengrathgefunden_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_udar_sengrath) && Npc_HasItems(other,itrw_sengrathsarmbrust_mis))
	{
		return TRUE;
	};
};

func void dia_udar_sengrathgefunden_info()
{
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_00");	//� ����� ��������.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_01");	//��? � ��� �� ��?
	AI_Output(other,self,"DIA_Udar_SENGRATHGEFUNDEN_15_02");	//�� �����. ��� ��� �������. �� ��� ��� ���.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_03");	//������ ����, �� ���� ������� ���� �������, �� ���� ��� �� ���������� ���.
	AI_Output(self,other,"DIA_Udar_SENGRATHGEFUNDEN_09_04");	//������ �����. � ����, ��� ��� �����. �� ��� ��� ��������.
	TOPIC_END_SENGRATH_MISSING = TRUE;
	b_giveplayerxp(XP_SENGRATHFOUND);
};


instance DIA_UDAR_BADFEELING(C_INFO)
{
	npc = pal_268_udar;
	nr = 50;
	condition = dia_udar_badfeeling_condition;
	information = dia_udar_badfeeling_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_udar_badfeeling_condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(other,dia_udar_sengrathgefunden) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_udar_badfeeling_info()
{
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_00");	//��� ���� ����� ���������������� ����� � ��� �����.
	}
	else if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_01");	//���� ����� ����������. ���-�� ����� �������� ��. � �������� ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Udar_BADFEELING_09_02");	//��� ����� �� �������� ��� ���.
	};
	Npc_SetRefuseTalk(self,30);
};


instance DIA_UDAR_KAP5_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_kap5_exit_condition;
	information = dia_udar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_udar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_KAP6_EXIT(C_INFO)
{
	npc = pal_268_udar;
	nr = 999;
	condition = dia_udar_kap6_exit_condition;
	information = dia_udar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_udar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_udar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_UDAR_PICKPOCKET(C_INFO)
{
	npc = pal_268_udar;
	nr = 900;
	condition = dia_udar_pickpocket_condition;
	information = dia_udar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_udar_pickpocket_condition()
{
	return c_beklauen(20,15);
};

func void dia_udar_pickpocket_info()
{
	Info_ClearChoices(dia_udar_pickpocket);
	Info_AddChoice(dia_udar_pickpocket,DIALOG_BACK,dia_udar_pickpocket_back);
	Info_AddChoice(dia_udar_pickpocket,DIALOG_PICKPOCKET,dia_udar_pickpocket_doit);
};

func void dia_udar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_udar_pickpocket);
};

func void dia_udar_pickpocket_back()
{
	Info_ClearChoices(dia_udar_pickpocket);
};

