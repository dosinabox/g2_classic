
instance DIA_BRUTUS_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_exit_condition;
	information = dia_brutus_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_brutus_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_AFTER_FIGHT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 1;
	condition = dia_brutus_after_fight_condition;
	information = dia_brutus_after_fight_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_brutus_after_fight_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE) && Npc_IsInState(self,zs_talk) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_after_fight_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_00");	//� ���� ��� ��� ���� �� �����?
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_01");	//��, � ����, �� ������! � �� ����� �� ��������� � ����� � ���.
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
		AI_Output(other,self,"DIA_Brutus_AFTER_FIGHT_15_02");	//��� �������, �� ��� ��� ����� ���������.
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_03");	//� � ���� �� ��� ���� � ������ ����. �����, ������, ��� �������� �����, ��������� ��������� ��������� ���� ������ ������.
		if(BRUTUS_EINMALIG == FALSE)
		{
			AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_04");	//��� ��� ����� ������� ���� ������ �� ����. ����� ��� �������� ������ � ������ ��������������!
			CreateInvItems(self,itpo_health_01,1);
			b_giveinvitems(self,hero,itpo_health_01,1);
			BRUTUS_EINMALIG = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_AFTER_FIGHT_06_05");	//� ������ �� ���� ������ ������� �����. �� ����� � ������� �����, � �� �� � ����������.
	};
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
};


instance DIA_BRUTUS_PRISONER(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_prisoner_condition;
	information = dia_brutus_prisoner_info;
	description = "��� �� ����������� �����?";
};


func int dia_brutus_prisoner_condition()
{
	if(NPCOBSESSEDBYDMT_BRUTUS == FALSE)
	{
		return TRUE;
	};
};

func void dia_brutus_prisoner_info()
{
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_00");	//��� �� ����������� �����?
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_01");	//��� ���������? � �������� ������. � ��� ��, ��� �������� �������� �������.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_02");	//����� � ������������ �� ������������. � ��� ��� ��� ���� ������, ���� ���� ������.
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_03");	//�� ��� ��������� ������ - ���������� �� ��������. � ������ ���, � ���� ������� ����������� ���� ������.
	AI_Output(other,self,"DIA_Brutus_PRISONER_15_04");	//������ ������ ����...
	AI_Output(self,other,"DIA_Brutus_PRISONER_06_05");	//�� ���� ��������� ��������, ��� ������ ����� �� ��������, ��� ����� �������� ������ �������.
	if((MIS_RESCUEGORN != LOG_SUCCESS) && (KAPITEL < 3))
	{
		AI_Output(self,other,"DIA_Brutus_PRISONER_06_06");	//� � ����� ����� ���� �� ����������.
		KNOWSABOUTGORN = TRUE;
	};
};


instance DIA_BRUTUS_PERM(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 90;
	condition = dia_brutus_perm_condition;
	information = dia_brutus_perm_info;
	permanent = TRUE;
	description = "���� ���-������ ���������?";
};


func int dia_brutus_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_prisoner) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_perm_info()
{
	AI_Output(other,self,"DIA_Brutus_PERM_15_00");	//���� ���-������ ���������?
	AI_Output(self,other,"DIA_Brutus_PERM_06_01");	//��� ��������. ����� ����������� ��� - ��� ������, ���� ����� ���� �� ������ ��������� ���������� �����. ����� ����.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_KASSE(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_kasse_condition;
	information = dia_brutus_kasse_info;
	permanent = FALSE;
	description = "�� �� ��� �� ������������� ����?";
};


func int dia_brutus_kasse_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_prisoner) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_kasse_info()
{
	AI_Output(other,self,"DIA_Brutus_Kasse_15_00");	//�� �� ��� �� ������������� ����?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_01");	//�������. � ���� ������ ���� ����� �������, �� ��� ����� �� ���������.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_02");	//������� �� ������?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_03");	//����... �� ���� ������� ������ �����, ��? ��� ��� � ���������.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_04");	//��� ��������, ���, ������ �� ����� ��������� ����� �����. ��� ������!
	AI_Output(self,other,"DIA_Brutus_Kasse_06_05");	//�� �� ������� �� � ������� ������. �� ������ � ����� ���������� ����� �����.
	AI_Output(other,self,"DIA_Brutus_Kasse_15_06");	//��� �� �����?
	AI_Output(self,other,"DIA_Brutus_Kasse_06_07");	//��, � ��� ��� ��������, ��� �� ������� ����, ������� ��... �-�... ������� �� ��� ��� �����.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_08");	//��� ���� ��������� �����. � ������� ���� 200 ������� �����, � ����� ������ ��������� �������.
	AI_Output(self,other,"DIA_Brutus_Kasse_06_09");	//���� �� ������� ��� ��� ������, ������������� ������ �������� ����. � ����� � ���� ����� ������� ����.
	Log_CreateTopic(TOPICBRUTUSKASSE,LOG_MISSION);
	Log_SetTopicStatus(TOPICBRUTUSKASSE,LOG_RUNNING);
	b_logentry(TOPICBRUTUSKASSE,"������� ������� ��� ������� � 200 �������� �������� � ���-������ ���������������. ���� � ����� ��� 200 ������� �����, �� ������� ��� ����� �������.");
};


instance DIA_BRUTUS_DEN(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_den_condition;
	information = dia_brutus_den_info;
	permanent = FALSE;
	description = "�� ������, ���� ���������� ���� ���?";
};


func int dia_brutus_den_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_kasse) && (KAPITEL < 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_den_info()
{
	AI_Output(other,self,"DIA_Brutus_Den_15_00");	//�� ������, ���� ���������� ���� ���?
	AI_Output(self,other,"DIA_Brutus_Den_06_01");	//��� ����� ������ ������, ��� � �������. � �����, �� ��� ���������� ���������� ����� ������.
	AI_Output(other,self,"DIA_Brutus_Den_15_02");	//�������. ������������� ����������.
	AI_Output(self,other,"DIA_Brutus_Den_06_03");	//� ��� � ��� ���� �������? � ������� �� ����, ���� �� ����������.
	b_logentry(TOPICBRUTUSKASSE,"��� ��� ���������� ���������� ����� ������.");
};


instance DIA_BRUTUS_GOLD(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 2;
	condition = dia_brutus_gold_condition;
	information = dia_brutus_gold_info;
	permanent = TRUE;
	description = "� ���� ���� ���-��� ��� ����. (���� 200 �����).";
};


func int dia_brutus_gold_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_kasse) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (BRUTUS_TEACHSTR == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_gold_info()
{
	AI_Output(other,self,"DIA_Brutus_Gold_15_00");	//� ���� ���� ���-��� ��� ����.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_01");	//�����������. ������ � ���� ������������� ����, ���� ������.
		BRUTUS_TEACHSTR = TRUE;
		Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
		b_logentry(TOPIC_TEACHER_OC,"������ ����� ������ ��� ����� �������.");
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_Gold_06_02");	//��������, ������ ������� ��� 200 �����. ���� �� ����������, ��� �� �������� ��, ������ �� ��� ���� ������.
	};
};


instance DIA_BRUTUS_TEACH(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 7;
	condition = dia_brutus_teach_condition;
	information = dia_brutus_teach_info;
	permanent = TRUE;
	description = "� ���� ����� �������.";
};


func int dia_brutus_teach_condition()
{
	if((BRUTUS_TEACHSTR == TRUE) && (other.attribute[ATR_STRENGTH] < 75) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_teach_info()
{
	AI_Output(other,self,"DIA_Brutus_Teach_15_00");	//� ���� ����� �������.
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_brutus_teach_str_5);
};

func void dia_brutus_teach_back()
{
	Info_ClearChoices(dia_brutus_teach);
};

func void dia_brutus_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,75);
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_brutus_teach_str_5);
};

func void dia_brutus_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,75);
	Info_ClearChoices(dia_brutus_teach);
	Info_AddChoice(dia_brutus_teach,DIALOG_BACK,dia_brutus_teach_back);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_brutus_teach_str_1);
	Info_AddChoice(dia_brutus_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_brutus_teach_str_5);
};


instance DIA_BRUTUS_KAP3_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap3_exit_condition;
	information = dia_brutus_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_brutus_kap3_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_DUSCHONWIEDER(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 30;
	condition = dia_brutus_duschonwieder_condition;
	information = dia_brutus_duschonwieder_info;
	permanent = TRUE;
	description = "����� ����-������ �������?";
};


func int dia_brutus_duschonwieder_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_prisoner) && (KAPITEL == 3) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_duschonwieder_info()
{
	AI_Output(other,self,"DIA_Brutus_DUSCHONWIEDER_15_00");	//����� ����-������ �������?
	AI_Output(self,other,"DIA_Brutus_DUSCHONWIEDER_06_01");	//�� �� ������, � �����?! ������ �������.
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_KAP4_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap4_exit_condition;
	information = dia_brutus_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_brutus_kap4_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_WARUMNICHTARBBEIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 40;
	condition = dia_brutus_warumnichtarbbeit_condition;
	information = dia_brutus_warumnichtarbbeit_info;
	description = "������ �� �� ���������?";
};


func int dia_brutus_warumnichtarbbeit_condition()
{
	if(Npc_KnowsInfo(hero,dia_brutus_prisoner) && (KAPITEL >= 4) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_warumnichtarbbeit_info()
{
	AI_Output(other,self,"DIA_Brutus_WARUMNICHTARBBEIT_15_00");	//������ �� �� ���������?
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_01");	//(���������) ��� ������!
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_02");	//�� �� ���������� � ��� �������? ��� ������� ������ ���� ��� �������.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_03");	//� �� ����, ��� ��� ��� ������, �� ���� ���� �� ����� � ���� ������� �����.
	AI_Output(self,other,"DIA_Brutus_WARUMNICHTARBBEIT_06_04");	//� �������� ���� ������. � ������ �����, ��� �����.
	Log_CreateTopic(TOPIC_BRUTUSMEATBUGS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BRUTUSMEATBUGS,LOG_RUNNING);
	b_logentry(TOPIC_BRUTUSMEATBUGS,"������, ����� �����, �������, ��� �� ���������� ������ ����� � ��� �������, � ���� ������� �� ����. � �� ������� ��� ����� ������� ������.");
};


instance DIA_BRUTUS_MEATBUGSWEG(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 31;
	condition = dia_brutus_meatbugsweg_condition;
	information = dia_brutus_meatbugsweg_info;
	description = "� ������� ������ ���������.";
};


func int dia_brutus_meatbugsweg_condition()
{
	if(Npc_KnowsInfo(other,dia_brutus_warumnichtarbbeit) && Npc_IsDead(meatbug_brutus1) && Npc_IsDead(meatbug_brutus2) && Npc_IsDead(meatbug_brutus3) && Npc_IsDead(meatbug_brutus4) && (KAPITEL >= 4) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE) && (MIS_OCGATEOPEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_meatbugsweg_info()
{
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_00");	//� ������� ������ ���������. �� ������ ���������� ���������� ���� ������ ��� ����� ��� ��� �� ��� ���������.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_01");	//�� ������������� ������, ��� �� ������ �� ���� �������� �� ��������?
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_02");	//���������.
	AI_Output(self,other,"DIA_Brutus_MEATBUGSWEG_06_03");	//������. ���, ������ ��� ������ � ���� ���� �������������.
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
	AI_Output(other,self,"DIA_Brutus_MEATBUGSWEG_15_04");	//��, �� ��������� ���� �������.
	TOPIC_END_BRUTUSMEATBUGS = TRUE;
	b_giveplayerxp(XP_BRUTUSMEATBUGS);
	b_npcclearobsessionbydmt(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BRUTUS_PERM4(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 32;
	condition = dia_brutus_perm4_condition;
	information = dia_brutus_perm4_info;
	permanent = TRUE;
	description = "��� � �������?";
};


func int dia_brutus_perm4_condition()
{
	if((Npc_KnowsInfo(other,dia_brutus_meatbugsweg) || (MIS_OCGATEOPEN == TRUE)) && (NPCOBSESSEDBYDMT_BRUTUS == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_perm4_info()
{
	AI_Output(other,self,"DIA_Brutus_PERM4_15_00");	//��� � �������?
	if((MIS_OCGATEOPEN == TRUE) || ((hero.guild == GIL_KDF) && (KAPITEL >= 5)))
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Brutus_PERM4_06_01");	//(������������) �� ������, ��� �� ����� ������� ������ ���������?
		AI_Output(other,self,"DIA_Brutus_PERM4_15_02");	//��... ������, ��� ���� ����� ����.
		AI_Output(self,other,"DIA_Brutus_PERM4_06_03");	//(�����) �����?
		b_npcclearobsessionbydmt(self);
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,zs_flee,0,"");
	};
};


instance DIA_BRUTUS_BESSEN(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 55;
	condition = dia_brutus_bessen_condition;
	information = dia_brutus_bessen_info;
	permanent = TRUE;
	description = "�� �� �������!";
};


func int dia_brutus_bessen_condition()
{
	if((NPCOBSESSEDBYDMT_BRUTUS == TRUE) && (NPCOBSESSEDBYDMT == FALSE))
	{
		return TRUE;
	};
};

func void dia_brutus_bessen_info()
{
	AI_Output(other,self,"DIA_Brutus_BESSEN_15_00");	//�� �� �������!
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_01");	//����������� � ���������, ����� ��� ������� ����.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_02");	//��� ����� �� ����� ������. ��������!
		b_npcclearobsessionbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Brutus_BESSEN_15_03");	//���-������ ������ ������ ������� �� ����� ������.
		AI_Output(self,other,"DIA_Brutus_BESSEN_06_04");	//(�����) ����!
		b_npcclearobsessionbydmt(self);
		Npc_SetTarget(self,other);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		AI_StartState(self,zs_flee,0,"");
	};
};


instance DIA_BRUTUS_KAP5_EXIT(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 999;
	condition = dia_brutus_kap5_exit_condition;
	information = dia_brutus_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_brutus_kap5_exit_condition()
{
	if(KAPITEL >= 5)
	{
		return TRUE;
	};
};

func void dia_brutus_kap5_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_BRUTUS_PICKPOCKET(C_INFO)
{
	npc = vlk_4100_brutus;
	nr = 900;
	condition = dia_brutus_pickpocket_condition;
	information = dia_brutus_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_brutus_pickpocket_condition()
{
	return c_beklauen(14,35);
};

func void dia_brutus_pickpocket_info()
{
	Info_ClearChoices(dia_brutus_pickpocket);
	Info_AddChoice(dia_brutus_pickpocket,DIALOG_BACK,dia_brutus_pickpocket_back);
	Info_AddChoice(dia_brutus_pickpocket,DIALOG_PICKPOCKET,dia_brutus_pickpocket_doit);
};

func void dia_brutus_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_brutus_pickpocket);
};

func void dia_brutus_pickpocket_back()
{
	Info_ClearChoices(dia_brutus_pickpocket);
};

