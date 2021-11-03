
instance DIA_HILDA_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_exit_condition;
	information = dia_hilda_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_hilda_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_HALLO(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_hallo_condition;
	information = dia_hilda_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hilda_hallo_condition()
{
	if((MIS_LOBART_RUEBEN != LOG_SUCCESS) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_hallo_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_00");	//��, ���� ���� �����? ���������� �������� �� ����� ����. ����� �� ������ ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_Hallo_17_01");	//��, ��� ���?
	};
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_WASZUESSEN(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_waszuessen_condition;
	information = dia_hilda_waszuessen_info;
	permanent = TRUE;
	description = "�� ���� ��� ���-������ ������?";
};


func int dia_hilda_waszuessen_condition()
{
	if((Npc_KnowsInfo(other,dia_hilda_hallo) || (MIS_LOBART_RUEBEN == LOG_SUCCESS)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_waszuessen_info()
{
	var int rueben_tagnull;
	if(hero.guild == GIL_NONE)
	{
		AI_Output(other,self,"DIA_Hilda_WasZuEssen_15_00");	//�� ���� ��� ���-������ ������?
		if(MIS_LOBART_RUEBEN == LOG_SUCCESS)
		{
			if(!Npc_KnowsInfo(other,dia_hilda_pfannetoolate))
			{
				if(HILDA_STEW_DAY != Wld_GetDay())
				{
					b_giveinvitems(self,other,itfo_stew,1);
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_01");	//���, ������. �� ������� ������.
					HILDA_STEW_DAY = Wld_GetDay();
				}
				else if((Wld_GetDay() == 0) && (rueben_tagnull == FALSE))
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_02");	//�� �������� ������ ����� ������.
					b_giveinvitems(self,other,itfo_stew,1);
					HILDA_STEW_DAY = Wld_GetDay();
					rueben_tagnull = TRUE;
					Log_CreateTopic(TOPIC_BONUS,LOG_NOTE);
					b_logentry(TOPIC_BONUS,"� ���� �������� ������� ������� ���� � ������ ������ ����.");
				}
				else
				{
					AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_03");	//�� ������� ��� ������� ���� ������! ������ �������.
				};
			}
			else
			{
				AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_04");	//�� �� ���������� ������� ����� ������ �������. ��������!
				AI_StopProcessInfos(self);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_05");	//� ������ ������ ���, ��� �������� �����!
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_WasZuEssen_17_06");	//� �������, � ���� ���������� �����, ����� ������ ���� ��� � ������.
	};
};


instance DIA_HILDA_BRINGBEET(C_INFO)
{
	npc = bau_951_hilda;
	nr = 1;
	condition = dia_hilda_bringbeet_condition;
	information = dia_hilda_bringbeet_info;
	permanent = TRUE;
	description = "� ������ ���� ����...";
};


func int dia_hilda_bringbeet_condition()
{
	if((MIS_LOBART_RUEBENTOHILDA == LOG_RUNNING) && (Npc_HasItems(other,itpl_beet) >= 1) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_bringbeet_info()
{
	AI_Output(other,self,"DIA_Hilda_BringBeet_15_00");	//� ������ ���� ����...
	if(Npc_HasItems(other,itpl_beet) >= 20)
	{
		b_giveinvitems(other,self,itpl_beet,Npc_HasItems(other,itpl_beet));
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_01");	//�������! (�������) ����� ������ �������, ����� ��������� ����� ���������� �� ������!
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_02");	//��� �� �� ��� ����� �����... � ������, ��� ���� ������ ������������� ��������. ��� ���� ��������� ����� �����.
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_03");	//� �����, �� ���-������ ����������� �� ���� � �����. ����� � ����. ����� � ���� �������� ���������� ��� ����.
		MIS_LOBART_RUEBENTOHILDA = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_04");	//���?! ��� ���?
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_BringBeet_17_05");	//����� ������������.
		};
		AI_Output(self,other,"DIA_Hilda_BringBeet_17_06");	//��� � ���� � ������ ���. ��� ���� �������!
		AI_StopProcessInfos(self);
	};
};


instance DIA_HILDA_EINKAUFEN(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_einkaufen_condition;
	information = dia_hilda_einkaufen_info;
	permanent = FALSE;
	description = "��� ��� ������, � � ����� � ����� �������� ��� ����...";
};


func int dia_hilda_einkaufen_condition()
{
	if((MIS_LOBART_RUEBENTOHILDA == LOG_SUCCESS) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_einkaufen_info()
{
	AI_Output(other,self,"DIA_Hilda_Einkaufen_15_00");	//��� ��� ������, � � ����� � ����� �������� ��� ����...
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_Einkaufen_17_01");	//� ���� ����� ��������? ������ �������� ��������� ��� ������ �� �������, �������?!
	};
	b_giveinvitems(self,other,itmi_gold,20);
	MIS_HILDA_PFANNEKAUFEN = LOG_RUNNING;
	MIS_HILDA_PFANNEKAUFEN_DAY = b_getdayplus();
	Log_CreateTopic(TOPIC_HILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HILDA,LOG_RUNNING);
	b_logentry(TOPIC_HILDA,"������, ���� ������� �������, ����� � ����� ��� ��� � �������������� �������� ���������.");
};


instance DIA_HILDA_PFANNEGEHOLT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 2;
	condition = dia_hilda_pfannegeholt_condition;
	information = dia_hilda_pfannegeholt_info;
	permanent = FALSE;
	description = "��� ���� ����������.";
};


func int dia_hilda_pfannegeholt_condition()
{
	if((MIS_HILDA_PFANNEKAUFEN == LOG_RUNNING) && (Npc_HasItems(other,itmi_pan) > 0) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_pfannegeholt_info()
{
	AI_Output(other,self,"DIA_Hilda_PfanneGeholt_15_00");	//��� ���� ����������.
	b_giveinvitems(other,self,itmi_pan,1);
	AI_Output(self,other,"DIA_Hilda_PfanneGeholt_17_01");	//�������. ���������, ������� �� ���...
	MIS_HILDA_PFANNEKAUFEN = LOG_SUCCESS;
	b_giveplayerxp(XP_HILDAHOLPFANNE);
};


instance DIA_HILDA_PFANNETOOLATE(C_INFO)
{
	npc = bau_951_hilda;
	nr = 1;
	condition = dia_hilda_pfannetoolate_condition;
	information = dia_hilda_pfannetoolate_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hilda_pfannetoolate_condition()
{
	if((MIS_HILDA_PFANNEKAUFEN == LOG_RUNNING) && (MIS_HILDA_PFANNEKAUFEN_DAY <= (Wld_GetDay() - 1)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_hilda_pfannetoolate_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_00");	//� ���� ��� ������� �������� ���������� �����? ��� �� ������ � ����� ��������, ��, ����������?!
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_01");	//��� �� ������ ��� ��� �����? � ��� ��� ������, ��� � ���� ���� �� ���������?
	};
	if(Npc_HasItems(other,itmi_pan) > 0)
	{
		AI_Output(other,self,"DIA_Hilda_PfanneTooLate_15_02");	//������, � ������� �������������. ��� ���� ����������!
		b_giveinvitems(other,self,itmi_pan,1);
		AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_03");	//��-�, ����� �� �� ����! �� � ����� �� �� - ������ ����������!
		MIS_HILDA_PFANNEKAUFEN = LOG_SUCCESS;
		b_giveplayerxp(XP_HILDAHOLPFANNE / 2);
		AI_StopProcessInfos(self);
	}
	else
	{
		if(Npc_HasItems(other,itmi_gold) >= 20)
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_04");	//��! ��� ��� ��� � ����! ����� �� �����. �����!
			b_giveinvitems(other,self,itmi_gold,20);
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_05");	//�� � ����� �� �� - ������ ����������!
		}
		else
		{
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_06");	//� ���� ��� �����?! � ���� ���� 20 �������!
			AI_Output(self,other,"DIA_Hilda_PfanneTooLate_17_07");	//����� � ���� ����, ������� ���!
			b_memorizeplayercrime(self,other,CRIME_THEFT);
		};
		MIS_HILDA_PFANNEKAUFEN = LOG_FAILED;
		b_checklog();
		AI_StopProcessInfos(self);
	};
};


instance DIA_HILDA_KAP3_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap3_exit_condition;
	information = dia_hilda_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_hilda_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_KRANK(C_INFO)
{
	npc = bau_951_hilda;
	nr = 30;
	condition = dia_hilda_krank_condition;
	information = dia_hilda_krank_info;
	permanent = TRUE;
	description = "��� �� ���� ����������?";
};


func int dia_hilda_krank_condition()
{
	if((KAPITEL >= 3) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)) && (MIS_HEALHILDA != LOG_SUCCESS))
	{
		return TRUE;
	};
};


var int dia_hilda_krank_ontime;

func void dia_hilda_krank_info()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_15_00");	//��� �� ���� ����������?
	AI_Output(self,other,"DIA_Hilda_KRANK_17_01");	//�������������. � ���� ����� ��� ������� ���������.
	AI_Output(self,other,"DIA_Hilda_KRANK_17_02");	//��� �� ����� ������� � ���������� ������, �� � ������� ����� ��� �����.
	if(DIA_HILDA_KRANK_ONTIME == FALSE)
	{
		Info_ClearChoices(dia_hilda_krank);
		Info_AddChoice(dia_hilda_krank,"�����������. � ��� ����� ����.",dia_hilda_krank_besserung);
		Info_AddChoice(dia_hilda_krank,"���� � ���-������ ������?",dia_hilda_krank_helfen);
		DIA_HILDA_KRANK_ONTIME = TRUE;
	};
	MIS_HEALHILDA = LOG_RUNNING;
};

func void dia_hilda_krank_besserung()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_besserung_15_00");	//�����������. � ��� ����� ����.
	AI_Output(self,other,"DIA_Hilda_KRANK_besserung_17_01");	//�������� ���������, ��� ������ ��� ������ �����.
	AI_StopProcessInfos(self);
};

func void dia_hilda_krank_helfen()
{
	AI_Output(other,self,"DIA_Hilda_KRANK_helfen_15_00");	//���� � ���-������ ������?
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_01");	//���� �� �����������, ���� �� �� ��� ������� � ������� � �������� ��� ��������� �� ����.
	AI_Output(self,other,"DIA_Hilda_KRANK_helfen_17_02");	//�� �����, ��� ��� �����! ����� ��� �� �����.
	Log_CreateTopic(TOPIC_HEALHILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HEALHILDA,LOG_RUNNING);
	b_logentry(TOPIC_HEALHILDA,"���� ������� ������ ������, �� � ������� ���� ���������, ������� ����� �������� ��.");
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_HEILUNGBRINGEN(C_INFO)
{
	npc = bau_951_hilda;
	nr = 31;
	condition = dia_hilda_heilungbringen_condition;
	information = dia_hilda_heilungbringen_info;
	description = "� ������ ���� ���������.";
};


func int dia_hilda_heilungbringen_condition()
{
	if(Npc_HasItems(other,itpo_healhilda_mis))
	{
		return TRUE;
	};
};

func void dia_hilda_heilungbringen_info()
{
	AI_Output(other,self,"DIA_Hilda_HEILUNGBRINGEN_15_00");	//� ������ ���� ���������.
	b_giveinvitems(other,self,itpo_healhilda_mis,1);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_01");	//��. ���� �� ������ ����� �����, ��� ��, ���� ��������. �������� �������.
	b_useitem(self,itpo_healhilda_mis);
	AI_Output(self,other,"DIA_Hilda_HEILUNGBRINGEN_17_02");	//�������, ���� ���������� ����� ����� ����������.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	MIS_HEALHILDA = LOG_SUCCESS;
	b_giveplayerxp(XP_HEALHILDA);
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_DISTURB(C_INFO)
{
	npc = bau_951_hilda;
	nr = 32;
	condition = dia_hilda_disturb_condition;
	information = dia_hilda_disturb_info;
	permanent = TRUE;
	description = "��� ��?";
};


func int dia_hilda_disturb_condition()
{
	if((MIS_HEALHILDA == LOG_SUCCESS) || (((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (KAPITEL > 3)))
	{
		return TRUE;
	};
};

func void dia_hilda_disturb_info()
{
	if(MIS_HEALHILDA == LOG_SUCCESS)
	{
		AI_Output(other,self,"DIA_Hilda_DISTURB_15_00");	//��� ���� ��������?
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_01");	//��� �����, ������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Hilda_DISTURB_17_02");	//��� ��� �����.
	};
};


instance DIA_HILDA_KAP4_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap4_exit_condition;
	information = dia_hilda_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_hilda_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_KAP5_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap5_exit_condition;
	information = dia_hilda_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_hilda_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_KAP6_EXIT(C_INFO)
{
	npc = bau_951_hilda;
	nr = 999;
	condition = dia_hilda_kap6_exit_condition;
	information = dia_hilda_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hilda_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_hilda_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HILDA_PICKPOCKET(C_INFO)
{
	npc = bau_951_hilda;
	nr = 900;
	condition = dia_hilda_pickpocket_condition;
	information = dia_hilda_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40_FEMALE;
};


func int dia_hilda_pickpocket_condition()
{
	return c_beklauen(26,35);
};

func void dia_hilda_pickpocket_info()
{
	Info_ClearChoices(dia_hilda_pickpocket);
	Info_AddChoice(dia_hilda_pickpocket,DIALOG_BACK,dia_hilda_pickpocket_back);
	Info_AddChoice(dia_hilda_pickpocket,DIALOG_PICKPOCKET,dia_hilda_pickpocket_doit);
};

func void dia_hilda_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hilda_pickpocket);
};

func void dia_hilda_pickpocket_back()
{
	Info_ClearChoices(dia_hilda_pickpocket);
};

