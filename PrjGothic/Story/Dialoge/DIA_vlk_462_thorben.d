
instance DIA_THORBEN_EXIT(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 999;
	condition = dia_thorben_exit_condition;
	information = dia_thorben_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_thorben_exit_condition()
{
	return TRUE;
};

func void dia_thorben_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_PICKPOCKET(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 900;
	condition = dia_thorben_pickpocket_condition;
	information = dia_thorben_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_thorben_pickpocket_condition()
{
	return c_beklauen(30,28);
};

func void dia_thorben_pickpocket_info()
{
	Info_ClearChoices(dia_thorben_pickpocket);
	Info_AddChoice(dia_thorben_pickpocket,DIALOG_BACK,dia_thorben_pickpocket_back);
	Info_AddChoice(dia_thorben_pickpocket,DIALOG_PICKPOCKET,dia_thorben_pickpocket_doit);
};

func void dia_thorben_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_thorben_pickpocket);
};

func void dia_thorben_pickpocket_back()
{
	Info_ClearChoices(dia_thorben_pickpocket);
};


instance DIA_THORBEN_ANGEPISST(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 1;
	condition = dia_thorben_angepisst_condition;
	information = dia_thorben_angepisst_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_thorben_angepisst_condition()
{
	if(Npc_IsDead(gritta) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_thorben_angepisst_info()
{
	AI_Output(self,other,"DIA_Thorben_angepisst_06_00");	//�� ���� ��� ������. � ������� �� ����� ����. ����� � ���� ����, ������!
	AI_StopProcessInfos(self);
};


instance DIA_THORBEN_HALLO(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_hallo_condition;
	information = dia_thorben_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_thorben_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_thorben_hallo_info()
{
	AI_Output(self,other,"DIA_Thorben_Hallo_06_00");	//��! ����� ����. �� ���� �� �� ��������, ��?
	AI_Output(self,other,"DIA_Thorben_Hallo_06_01");	//������ �� ������ ����� ��� �����������. ������� �������, ������ ���, � ������ ��� � ������� ��������.
	AI_Output(self,other,"DIA_Thorben_Hallo_06_02");	//����� ������ ���� ���� �������?
};


instance DIA_THORBEN_ARBEIT(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_arbeit_condition;
	information = dia_thorben_arbeit_info;
	permanent = FALSE;
	description = "� ��� ������.";
};


func int dia_thorben_arbeit_condition()
{
	return TRUE;
};

func void dia_thorben_arbeit_info()
{
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_00");	//� ��� ������.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_01");	//�� ���-������ ������ � ���������� ����?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_02");	//������������, ��� � ���� �������� �� ������, - ��� �����.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_03");	//� ��� ������ ������?
	AI_Output(other,self,"DIA_Thorben_Arbeit_15_04");	//�����...
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_05");	//������, �� � �� ���� ����� ����, ���� �� ������ �� ��������� � ���� �������.
	AI_Output(self,other,"DIA_Thorben_Arbeit_06_06");	//� � ���� ��� �����, ����� ������� �������.
	Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
	b_logentry(TOPIC_LEHRLING,"������ �� ������ ���� � �������.");
};


instance DIA_THORBEN_OTHERMASTERS(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_othermasters_condition;
	information = dia_thorben_othermasters_info;
	permanent = FALSE;
	description = "� ��� ���� � �������� � ������� � ������ �� ������ ������� ��������?";
};


func int dia_thorben_othermasters_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_thorben_othermasters_info()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_15_00");	//� ��� ���� � �������� � ������� � ������ �� ������ ������� ��������?
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_01");	//������, � ��� ���� ���������.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_02");	//�� ���� ����� ������� �������� ������������� �����.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_06_03");	//�����, �� �������� �������?
	Info_ClearChoices(dia_thorben_othermasters);
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		Info_AddChoice(dia_thorben_othermasters,"��, ���� �� ��� ������ � ����, � ��������� ������...",dia_thorben_othermasters_naja);
	};
	Info_AddChoice(dia_thorben_othermasters,"��. � ���������� ��������, ������ ������.",dia_thorben_othermasters_devoutly);
};

func void b_thorben_getblessings()
{
	AI_Output(self,other,"B_Thorben_GetBlessings_06_00");	//����� ��� � �������, ����� �������, ����� �� ���� ���� �������������.
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV) && (other.guild != GIL_PAL))
	{
		AI_Output(self,other,"B_Thorben_GetBlessings_06_01");	//�� ����� ��������� ����, ��� ����� ����� ������. �� ������ �������� � ��� �������������.
	};
	AI_Output(self,other,"B_Thorben_GetBlessings_06_02");	//� ����� �� �������� ������������� �����, � ���������� �� ����.
	MIS_THORBEN_GETBLESSINGS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_THORBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_THORBEN,LOG_RUNNING);
	b_logentry(TOPIC_THORBEN,"������ ���� ��� ���� ���������, ���� ���� ������� � ���� ������ ����� ��� ���� �������������.");
};

func void dia_thorben_othermasters_devoutly()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Devoutly_15_00");	//��. � ���������� ��������, ������ ������.
	b_thorben_getblessings();
	Info_ClearChoices(dia_thorben_othermasters);
};

func void dia_thorben_othermasters_naja()
{
	AI_Output(other,self,"DIA_Thorben_OtherMasters_Naja_15_00");	//��, ���� �� ��� ������ � ����, � ��������� ������...
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_01");	//�������!
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_02");	//�������, ������� ���������� �������� ��� ������������� �����, ������� �� ������� ����� ���������.
	AI_Output(self,other,"DIA_Thorben_OtherMasters_Naja_06_03");	//����� ����� � �������� ����� �����������.
	b_thorben_getblessings();
	Info_ClearChoices(dia_thorben_othermasters);
};


instance DIA_THORBEN_ZUSTIMMUNG(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 1;
	condition = dia_thorben_zustimmung_condition;
	information = dia_thorben_zustimmung_info;
	permanent = TRUE;
	description = "��� ������ ���������, ������?";
};


func int dia_thorben_zustimmung_condition()
{
	if((PLAYER_ISAPPRENTICE == APP_NONE) && (MIS_THORBEN_GETBLESSINGS == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_thorben_zustimmung_info()
{
	AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_00");	//��� ������ ���������, ������?
	AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_01");	//������ ��� ���� �������������?
	if(VATRAS_SEGEN == TRUE)
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_02");	//��.
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_03");	//� ������������� ����� ������ �� �������?
		if((DARON_SEGEN == TRUE) || (ISGAROTH_SEGEN == TRUE) || (other.guild == GIL_KDF))
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_04");	//��, �������.
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_05");	//����� �� �������� � ��� �������������. �� �����, ������ ���� �� ����� ���������, ������� ����� ��������, ��� �������!
			MIS_THORBEN_GETBLESSINGS = LOG_SUCCESS;
			b_giveplayerxp(XP_ZUSTIMMUNG);
			Log_CreateTopic(TOPIC_LEHRLING,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_LEHRLING,LOG_RUNNING);
			b_logentry(TOPIC_LEHRLING,"������ ���� ��� ���� ���������, ���� � ������ ����� ��������.");
		}
		else
		{
			AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_06");	//���. ��� ���...
			AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_07");	//�� ������ ��� �������. �� ������ ���������� �������� ������ � ������������� �����.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_Thorben_ZUSTIMMUNG_15_08");	//��� ���...
		AI_Output(self,other,"DIA_Thorben_ZUSTIMMUNG_06_09");	//����� � �� �������, ����� �� ����� ������ �� ���. �� ������ ��� �������.
	};
};


instance DIA_THORBEN_LOCKSMITH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_locksmith_condition;
	information = dia_thorben_locksmith_info;
	permanent = FALSE;
	description = "��� �� ������������ � ������?";
};


func int dia_thorben_locksmith_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_arbeit))
	{
		return TRUE;
	};
};

func void dia_thorben_locksmith_info()
{
	AI_Output(other,self,"DIA_Thorben_Locksmith_15_00");	//��� �� ������������ � ������?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_01");	//����� ����� � ������� ������� ��� �������� �����?
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_02");	//� ����� ���� ����������� �����. ���, �� ������� ����, � ���� ���� ������, ��� �� ����� �������, ������� �� �� ���� �� ��������.
	AI_Output(self,other,"DIA_Thorben_Locksmith_06_03");	//����� ��������� ����� ����� �������. � � �������� ����� ����� �����. �������� � ��������� �����!
};


instance DIA_THORBEN_SCHULDENBUCH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_schuldenbuch_condition;
	information = dia_thorben_schuldenbuch_info;
	permanent = FALSE;
	description = "� ���� ���� �������� ������...";
};


func int dia_thorben_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) > 0)
	{
		return TRUE;
	};
};

func void dia_thorben_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_00");	//� ���� ���� �������� ������...
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_01");	//(�������������) ��� �� ���� ���?
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_02");	//���� ������ ������������ �� ��� � ���� ���, � ��, ��� � ��� �������� ���� ���.
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_03");	//��� ��� ����!
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(other,self,"DIA_Thorben_Schuldenbuch_15_04");	//� ��� �� ����� ���� �� ����?
	AI_Output(self,other,"DIA_Thorben_Schuldenbuch_06_05");	//� ���� ��� �����. �� �� ������ ������������ �� ��� ��������� �������������.
	b_giveplayerxp(XP_SCHULDENBUCH);
};


instance DIA_THORBEN_PLEASETEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_pleaseteach_condition;
	information = dia_thorben_pleaseteach_info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ��������� ����� ���������?";
};


func int dia_thorben_pleaseteach_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_locksmith) && (THORBEN_TEACHPLAYER == FALSE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void dia_thorben_pleaseteach_info()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_00");	//�� ������ ������� ���� ��������� ����� ���������?
	if(Npc_HasItems(self,itwr_schuldenbuch) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_01");	//���� �� �� ��, � �� ������ ������ �� ����� ����� ����.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_02");	//� ����� ���� ����, ��� �� ������ �����.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else if(THORBEN_GOTGOLD == TRUE)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_03");	//�� ������ ��� 100 ������� �����. ��� ������� ���� � ����� �������.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_04");	//��� ����� ������, �� � �������� ��������� � ���� ���.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_05");	//���� � �� ����� ���� ������ � ��������� �����, �� �������� �� ���� ����� �����������.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_06");	//��� ��� ��� 100 �������, � � ����� ����.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"������� �� ��������?",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"�������. ��� 100 �������.",dia_thorben_pleaseteach_pay100);
	}
	else if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_07");	//�� �������� ���� ������ ������. ������, �� ������� �������. � ����� ���� ����, ��� �� ������ �����.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_08");	//������ � �� ���� ������� ��� ���������. � ����� ���� ������, � ��� ����� ������.
		AI_Output(other,self,"DIA_Thorben_PleaseTeach_15_09");	//������� �� ��������?
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_10");	//200 ������� �����.
		Info_ClearChoices(dia_thorben_pleaseteach);
		Info_AddChoice(dia_thorben_pleaseteach,"����� ����, �����...",dia_thorben_pleaseteach_later);
		Info_AddChoice(dia_thorben_pleaseteach,"�������. ��� 200 �������.",dia_thorben_pleaseteach_pay200);
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_11");	//���... � �� ����, ����� �� ���� ��������.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_12");	//�����, �� ������ ��������� ����� �� ���� ������������, ������� �������� � �����, ������ ����� ��������� ������� ������� �����.
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_06_13");	//� ������ �� ���� ����� ����, ���� �� ���� ������, ��� �� ������� �������.
	};
};

func void dia_thorben_pleaseteach_pay200()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay200_15_00");	//�������. ��� 200 �������.
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_01");	//��� ������ ����� ������� ���. �� ���������, ��� ������ �� ������ �����.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay200_06_02");	//� ���� ��� 200 �����. � ��� ����� ��� �����.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_pay100()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Pay100_15_00");	//�������. ��� 100 �������.
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_01");	//� ����� ������, �� ����� ������, ����� �� ������ �����.
		THORBEN_TEACHPLAYER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_PleaseTeach_Pay100_06_02");	//��, � ���� �� ��� 100 �����.
	};
	Info_ClearChoices(dia_thorben_pleaseteach);
};

func void dia_thorben_pleaseteach_later()
{
	AI_Output(other,self,"DIA_Thorben_PleaseTeach_Later_15_00");	//����� ����, �����...
	Info_ClearChoices(dia_thorben_pleaseteach);
};


instance DIA_THORBEN_TEACH(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 2;
	condition = dia_thorben_teach_condition;
	information = dia_thorben_teach_info;
	permanent = TRUE;
	description = b_buildlearnstring("����� ���� ��������� �����!",b_getlearncosttalent(other,NPC_TALENT_PICKLOCK));
};


func int dia_thorben_teach_condition()
{
	if((THORBEN_TEACHPLAYER == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == 0))
	{
		return TRUE;
	};
};

func void dia_thorben_teach_info()
{
	AI_Output(other,self,"DIA_Thorben_Teach_15_00");	//����� ���� ��������� �����!
	if(b_teachthieftalent(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other,"DIA_Thorben_Teach_06_01");	//���, ��� ���� ����� - ��� �������. ���� �� ������ ��������� ������������ �� ����� � ������ � �����, �� ������� ������� ���.
		AI_Output(self,other,"DIA_Thorben_Teach_06_02");	//�� ���� �� ������ ������� ������� ������� ������ ��� ������� ������ � ������������ �����������, ��� ���������.
		AI_Output(self,other,"DIA_Thorben_Teach_06_03");	//��� ����� ������� �� ������ �����������, ��� ������ ������� ���� �����������. ���, �������, � ���, ��� ���� ����� �����.
	};
};


instance DIA_THORBEN_TRADE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 3;
	condition = dia_thorben_trade_condition;
	information = dia_thorben_trade_info;
	permanent = TRUE;
	description = "�� ������ ������� ��� �������?";
	trade = TRUE;
};


func int dia_thorben_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_locksmith))
	{
		return TRUE;
	};
};

func void dia_thorben_trade_info()
{
	AI_Output(other,self,"DIA_Thorben_TRADE_15_00");	//�� ������ ������� ��� �������?
	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) > 0)
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_01");	//���� ��� ��������...
	}
	else
	{
		AI_Output(self,other,"DIA_Thorben_TRADE_06_02");	//������. �� ��� ����� �� ������� ����, ���� �� �� ��������� ������������ ���.
	};
	if((Npc_HasItems(self,itke_lockpick) == 0) && (KAPITEL > DIETRICHGEBEN))
	{
		CreateInvItems(self,itke_lockpick,5);
		DIETRICHGEBEN = DIETRICHGEBEN + 1;
	};
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"������� ������ ������� �������.");
};


instance DIA_THORBEN_PALADINE(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_thorben_paladine_condition;
	information = dia_thorben_paladine_info;
	permanent = FALSE;
	description = "��� �� ������ � ���������?";
};


func int dia_thorben_paladine_condition()
{
	if(other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_thorben_paladine_info()
{
	AI_Output(other,self,"DIA_Thorben_Paladine_15_00");	//��� �� ������ � ���������?
	AI_Output(self,other,"DIA_Thorben_Paladine_06_01");	//��������. ��� ������� �� ������� � �������� ��� ������ �����.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_02");	//� ��� ���, ��� ��������� � ������� �������� ������.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_03");	//����� ������ �� �����, ����� ��� �������.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_04");	//������ ��������� ��������� �����.
	AI_Output(self,other,"DIA_Thorben_Paladine_06_05");	//� � �����, ��� ��� �����, ����� �������� ��������� ��������.
};


instance DIA_THORBEN_BAUERNAUFSTAND(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 4;
	condition = dia_thorben_bauernaufstand_condition;
	information = dia_thorben_bauernaufstand_info;
	permanent = FALSE;
	description = "�� ������ ���-������ � ��������� ��������?";
};


func int dia_thorben_bauernaufstand_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_paladine) && (other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_thorben_bauernaufstand_info()
{
	AI_Output(other,self,"DIA_Thorben_Bauernaufstand_15_00");	//�� ������ ���-������ � ��������� ��������?
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_01");	//����� �����, ��� �������� ���� ����� ���������, ����� ��������� �� ����� ��� ����������� ������.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_02");	//��, ��������, ����� �������� ���� ���� ������ ��������� � ���������.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_03");	//�� � � ������ ����� ����� ����� ����� ���� �� ��������������.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_04");	//����� ����� ��������� ������ �� ������ ������. �� �� �����, ���� ��� �������� ��� ���.
	AI_Output(self,other,"DIA_Thorben_Bauernaufstand_06_05");	//���� �� ������ ������ ������, ����������� ��������� �� �������� �������. ��� ����� ����� ���������� �� �������, ��� �.
};


instance DIA_THORBEN_GRITTA(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_thorben_gritta_condition;
	information = dia_thorben_gritta_info;
	permanent = FALSE;
	description = "� ������ ������...";
};


func int dia_thorben_gritta_condition()
{
	if((MIS_MATTEO_GOLD == LOG_RUNNING) && !Npc_IsDead(gritta))
	{
		return TRUE;
	};
};

func void dia_thorben_gritta_info()
{
	AI_Output(other,self,"DIA_Thorben_Gritta_15_00");	//� ������ ������...
	AI_Output(self,other,"DIA_Thorben_Gritta_06_01");	//���� ����������? ����� ���� ���� �� ���? ��� ������ �����, ��?
	AI_Output(other,self,"DIA_Thorben_Gritta_15_02");	//��� ������ 100 ������� �������� ������.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_03");	//����� ���, ��� ��� �� ���! � ��� ���, ��� ��� ����� �� ����, �� ��� ���� ��������!
	AI_Output(self,other,"DIA_Thorben_Gritta_06_04");	//��� ��������� ����� ���� ��������� ������.
	AI_Output(self,other,"DIA_Thorben_Gritta_06_05");	//��� �������� ������ 200 ������� � ���������� ������, ����� ������������ � �� �������! � ��� ������ �����!
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 500)
	{
		AI_Output(self,other,"DIA_Thorben_Gritta_06_06");	//������ ������ ���� � ����.
	};
	AI_Output(self,other,"DIA_Thorben_Gritta_06_07");	//���, �������� � ���. �� � ����� ���� ������: � ��� ��� �� ����� ������� ������.
	if(Npc_HasItems(gritta,itmi_gold) >= 100)
	{
		AI_Output(other,self,"DIA_Thorben_Gritta_15_08");	//���������...
	};
};


instance DIA_THORBEN_GRITTAHATTEGOLD(C_INFO)
{
	npc = vlk_462_thorben;
	nr = 5;
	condition = dia_thorben_grittahattegold_condition;
	information = dia_thorben_grittahattegold_info;
	permanent = FALSE;
	description = "� ����� ���������� ���� 100 ������� �����.";
};


func int dia_thorben_grittahattegold_condition()
{
	if(Npc_KnowsInfo(other,dia_thorben_gritta) && (Npc_HasItems(gritta,itmi_gold) < 100) && !Npc_IsDead(gritta))
	{
		return TRUE;
	};
};

func void dia_thorben_grittahattegold_info()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_15_00");	//� ����� ���������� ���� 100 ������� �����.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_01");	//���? �� ��� ���� - ��� ���� ��� ������! ��� ����� ��� �� ����� �������.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_06_02");	//����� ��� ���! � ������ ������� ��������� ������. ������ ����� ���������!
	Info_ClearChoices(dia_thorben_grittahattegold);
	if(MIS_MATTEO_GOLD == LOG_SUCCESS)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"� ��� ����� ������ ������!",dia_thorben_grittahattegold_matteohates);
	}
	else
	{
		Info_AddChoice(dia_thorben_grittahattegold,"���. ������ ������� ���� ������ �����.",dia_thorben_grittahattegold_matteosollhaben);
	};
	if(Npc_HasItems(other,itmi_gold) >= 100)
	{
		Info_AddChoice(dia_thorben_grittahattegold,"��� ���� ������.",dia_thorben_grittahattegold_hereitis);
	};
};

func void b_thorben_deletepetzcrimegritta()
{
	if(GRITTA_GOLDGIVEN == FALSE)
	{
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_00");	//�, ��������� � ���� ��� ������, � ������, ��� ��� ������� ����� � ���������� � ������� ���� ����!
		AI_Output(self,other,"B_Thorben_DeletePetzCrimeGritta_06_01");	//� ������ ������� ���� ������.
		b_deletepetzcrime(gritta);
	};
};

func void dia_thorben_grittahattegold_matteohates()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_15_00");	//� ��� ����� ������ ������!
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoHatEs_06_01");	//����! ��, �����, ���� ���� ����. �� ������� ����, �� �� �������� ��� ������. �����, ��� ����� ������������� ���� �� ���.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_matteosollhaben()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_15_00");	//���. ������ ������� ���� ������ �����.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_01");	//�� ������ �������� ����. ����� �� ���������� ������������, ����� ���� ������� �� ������.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_MatteoSollHaben_06_02");	//��, �� ������� ����, �� ������������ � ������� ���� ����������. �����, ��� ����� ������������� ���� �� ���.
	b_thorben_deletepetzcrimegritta();
	Info_ClearChoices(dia_thorben_grittahattegold);
};

func void dia_thorben_grittahattegold_hereitis()
{
	AI_Output(other,self,"DIA_Thorben_GrittaHatteGold_HereItIs_15_00");	//��� ���� ������.
	b_giveinvitems(other,self,itmi_gold,100);
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_01");	//�������! ������, � ���� ���� ���� �� ����� �����, ������� � ������ ������.
	AI_Output(self,other,"DIA_Thorben_GrittaHatteGold_HereItIs_06_02");	//�� ���� ��������, ��� � ��� ������� �������� ����� ��� ������!
	b_thorben_deletepetzcrimegritta();
	THORBEN_GOTGOLD = TRUE;
	Info_ClearChoices(dia_thorben_grittahattegold);
};

