
instance DIA_JORA_EXIT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 999;
	condition = dia_jora_exit_condition;
	information = dia_jora_exit_info;
	permanent = TRUE;
	description = "��� ����� ����!";
};


func int dia_jora_exit_condition()
{
	return TRUE;
};

func void dia_jora_exit_info()
{
	if(((JORA_DIEB == LOG_FAILED) || (JORA_DIEB == LOG_SUCCESS)) && (JORA_GOLD == LOG_RUNNING))
	{
		AI_Output(self,other,"DIA_Jora_EXIT_08_00");	//��! ��� ������ ���� �����?
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORA_SPERRE(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_sperre_condition;
	information = dia_jora_sperre_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_jora_sperre_condition()
{
	if((CANTHAR_SPERRE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_jora_sperre_info()
{
	AI_Output(self,other,"DIA_Jora_Sperre_08_00");	//�� ��������� �� �������. � ������ �� ���� ���� ���������!
	AI_StopProcessInfos(self);
};


instance DIA_JORA_WAREZ(C_INFO)
{
	npc = vlk_408_jora;
	nr = 700;
	condition = dia_jora_warez_condition;
	information = dia_jora_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = "������ ��� ���� ������.";
};


func int dia_jora_warez_condition()
{
	return TRUE;
};

func void dia_jora_warez_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Jora_WAREZ_15_00");	//������ ��� ���� ������.
};


instance DIA_JORA_GREET(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_greet_condition;
	information = dia_jora_greet_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jora_greet_condition()
{
	if(Npc_IsInState(self,zs_talk) && (CANTHAR_SPERRE == FALSE))
	{
		return TRUE;
	};
};

func void dia_jora_greet_info()
{
	AI_Output(self,other,"DIA_Jora_GREET_08_00");	//�� �������� � ����� �����, ���������. ���� ���� ���-�� ����� ��� ����� ����������, �� ��������� �� ������.
	AI_Output(self,other,"DIA_Jora_GREET_08_01");	//�� � ������������ ����: ���� �� ������ ����� ���-������, �� ��������, � ������ ������!
	AI_Output(other,self,"DIA_Jora_GREET_15_02");	//�������. � ���, ����� �� ����?
	AI_Output(self,other,"DIA_Jora_GREET_08_03");	//(������������) ��! �� ������ �� ������, ��� ���-������ ���� � ���� �������.
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"����� ������� ��������� ������� �� �������� �������.");
};


instance DIA_JORA_BESTOHLEN(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_bestohlen_condition;
	information = dia_jora_bestohlen_info;
	permanent = FALSE;
	description = "���-�� ������� ����?";
};


func int dia_jora_bestohlen_condition()
{
	return TRUE;
};

func void dia_jora_bestohlen_info()
{
	AI_Output(other,self,"DIA_Jora_Bestohlen_15_00");	//���-�� ������� ����?
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_01");	//� �� ���� �������� ���. ���� ������ ��� ��������� �����. ������������ ��� ������� - ���� ��� ������������� ��� ���.
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_02");	//�� ��� ��������� ���� ��������� �� �������� �������.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Bestohlen_08_03");	//� ������ ����� �� �������� � ������ ����� ���� �� �����. ����� ����������, ���� ������� ��������� ��� ������!
	};
	AI_Output(self,other,"DIA_Jora_Bestohlen_08_04");	//� ���������� ����� �� ���������, � ��� ������� ������!
};

func void b_jora_goldforclue()
{
	AI_Output(self,other,"DIA_Jora_Add_08_04");	//�������� - ���� �� ������� ������, ���������� ���� �������, � �������� ���� ���-���.
};


instance DIA_JORA_HOLDEINGOLD(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_holdeingold_condition;
	information = dia_jora_holdeingold_info;
	permanent = FALSE;
	description = "� ��� �� ������� ���� ��� ������.";
};


func int dia_jora_holdeingold_condition()
{
	if(Npc_KnowsInfo(other,dia_jora_bestohlen))
	{
		return TRUE;
	};
};

func void dia_jora_holdeingold_info()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_15_00");	//� ��� �� ������� ���� ��� ������.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_01");	//(�����������) ��? � ����� ���� ���?
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"� ���� �������� ����� ������ � �������� ��������������!",dia_jora_holdeingold_willbelohnung);
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		Info_AddChoice(dia_jora_holdeingold,"� ��� ������� � ������� �����!",dia_jora_holdeingold_ghdg);
	};
	if((other.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		Info_AddChoice(dia_jora_holdeingold,"��� �������... ��, �� ��� ��, ��������, ������ ��� ������� � ������� �������?",dia_jora_holdeingold_toov);
	};
};

func void dia_jora_holdeingold_toov()
{
	AI_Output(other,self,"DIA_Jora_Add_15_00");	//��� �������... ��, �� ��� ��, ��������, ������ ��� ������� � ������� �������?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_08_03");	//(�������) �� ��������� �� �� ������. � ���������, ��� � ����������� ��������� �� ���� �������.
	AI_Output(self,other,"DIA_Jora_Add_08_01");	//���� �� ������ ������� � ������� �������, �������� � �������� ���������� � ������ ����� ������.
};

func void dia_jora_holdeingold_ghdg()
{
	AI_Output(other,self,"DIA_Jora_Add_15_02");	//� ��� ������� � ������� �����!
	AI_Output(self,other,"DIA_Jora_Add_08_03");	//��� � ��� �� ������ ����.
	b_jora_goldforclue();
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"� ��������.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"������� ������ ���� � ���� ��������?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"������ �� �� ������ ������?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_willbelohnung()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_WillBelohnung_15_00");	//� ���� �������� ����� ������ � �������� ��������������!
	AI_Output(self,other,"DIA_Jora_HolDeinGold_WillBelohnung_08_01");	//������� ����� ��� ��� �������. � ��� �� ��������� � ����� ��������������!
	Info_ClearChoices(dia_jora_holdeingold);
	Info_AddChoice(dia_jora_holdeingold,"� ��������.",dia_jora_holdeingold_doit);
	Info_AddChoice(dia_jora_holdeingold,"������� ������ ���� � ���� ��������?",dia_jora_holdeingold_howmuch);
	Info_AddChoice(dia_jora_holdeingold,"������ �� �� ������ ������?",dia_jora_holdeingold_wache);
};

func void dia_jora_holdeingold_wache()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_Wache_15_00");	//������ �� �� ������ ������?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_01");	//������ ���������, ������ ���� ��� ������ � ��������.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_Wache_08_02");	//� ����� � �������, ��� ��� ������� ������, ��� � ���� �������!
};

func void dia_jora_holdeingold_howmuch()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_HowMuch_15_00");	//������� ������ ���� � ���� ��������?
	AI_Output(self,other,"DIA_Jora_HolDeinGold_HowMuch_08_01");	//50 ������� - ��� �������� ����� �� �������� ��������.
};

func void dia_jora_holdeingold_doit()
{
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_00");	//� ��������, ��� ����� �������.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_01");	//���� ���������! ���� �� ������ �������� ����� �������, �� ���� ������ ���������� ������.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_02");	//��������� ����� ���������� ����� ����������� �����������. � ��� ���, ��� �������� ������� � �����, ������ ������������� �� ����, ��� �������� � �����.
	AI_Output(self,other,"DIA_Jora_HolDeinGold_DoIt_08_03");	//��� ��� �������� ���-������...
	AI_Output(other,self,"DIA_Jora_HolDeinGold_DoIt_15_04");	//��������.
	JORA_DIEB = LOG_RUNNING;
	JORA_GOLD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_JORADIEB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORADIEB,LOG_RUNNING);
	Log_CreateTopic(TOPIC_JORA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JORA,LOG_RUNNING);
	b_logentry(TOPIC_JORA,"������ �� ����� ������� ������� �������� �����. �� ���� ���� ������������� �� �����.");
	b_logentry(TOPIC_JORA,"� ������ ������� ���������� ������ �����.");
	b_logentry(TOPIC_JORADIEB,"������� ������� �������� �����. ���� � ������ ���, ��� �� ��� ���������� �������.");
	Info_ClearChoices(dia_jora_holdeingold);
};


instance DIA_JORA_WEGENDIEB(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_wegendieb_condition;
	information = dia_jora_wegendieb_info;
	permanent = TRUE;
	description = "������ ����...";
};


func int dia_jora_wegendieb_condition()
{
	if(JORA_DIEB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jora_wegendieb_info()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_15_00");	//������ ����...
	AI_Output(self,other,"DIA_Jora_WegenDieb_08_01");	//��, ��� ������������ ����? �� ������ ���? � ��� ����� �����, �� ������ � ���� ��� ������?
	Info_ClearChoices(dia_jora_wegendieb);
	if(Npc_IsDead(rengaru))
	{
		Info_AddChoice(dia_jora_wegendieb,"��, � ��� ��������� ���������� ������.",dia_jora_wegendieb_tot);
	}
	else if(RENGARU_INKNAST == TRUE)
	{
		Info_AddChoice(dia_jora_wegendieb,"��, � ������ ���.",dia_jora_wegendieb_imknast);
	}
	else if(Npc_KnowsInfo(other,dia_rengaru_hallodieb))
	{
		Info_AddChoice(dia_jora_wegendieb,"�� ������ �� ����.",dia_jora_wegendieb_entkommen);
	};
	Info_AddChoice(dia_jora_wegendieb,"� ��� ��� ������� ��� ����!",dia_jora_wegendieb_continue);
};

func void dia_jora_wegendieb_continue()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Continue_15_00");	//� ��� ��� ������� ��� ����!
	AI_Output(self,other,"DIA_Jora_WegenDieb_Continue_08_01");	//�� ������ �������� ��� ��� ������ �����!
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_entkommen()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Entkommen_15_00");	//�� ������ �� ����.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Entkommen_08_01");	//� ��� ������? �� ���� ��� � �����?
	JORA_DIEB = LOG_FAILED;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_imknast()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_ImKnast_15_00");	//��, � ������ ���. ����� ������� ������� �� ��������, ��������...
	AI_Output(self,other,"DIA_Jora_WegenDieb_ImKnast_08_01");	//� ��� ������ ����� ������?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};

func void dia_jora_wegendieb_tot()
{
	AI_Output(other,self,"DIA_Jora_WegenDieb_Tot_15_00");	//��, � ��� ��������� ���������� ������.
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_01");	//��, ���� �� �� ������ �� ������ ������ ���������! ���������� ������ ����������!
	AI_Output(self,other,"DIA_Jora_WegenDieb_Tot_08_02");	//��� ��� ������?
	JORA_DIEB = LOG_SUCCESS;
	b_checklog();
	Info_ClearChoices(dia_jora_wegendieb);
};


instance DIA_JORA_BRINGGOLD(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_bringgold_condition;
	information = dia_jora_bringgold_info;
	permanent = TRUE;
	description = "��� 50 �������, ��� �� ����� � ����.";
};


func int dia_jora_bringgold_condition()
{
	if(((JORA_DIEB == LOG_FAILED) || (JORA_DIEB == LOG_SUCCESS)) && (JORA_GOLD == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_jora_bringgold_info()
{
	AI_Output(other,self,"DIA_Jora_BringGold_15_00");	//��� 50 �������, ��� �� ����� � ����.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_01");	//����� ������! ���� ��� ���������� � ���� ������.
		JORA_GOLD = LOG_SUCCESS;
		b_giveplayerxp(XP_JORA_GOLD);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BringGold_08_03");	//��, ����� �� ��� 50 �������! �� ���, ���� ��������� ���� ���������?
	};
};


var int jora_ghdghinweis;

instance DIA_JORA_GHDGINFO(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_ghdginfo_condition;
	information = dia_jora_ghdginfo_info;
	permanent = TRUE;
	description = "��� �� ������ � ������� �����?";
};


func int dia_jora_ghdginfo_condition()
{
	if((MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING) && Npc_KnowsInfo(other,dia_jora_bestohlen) && (JORA_GHDGHINWEIS == FALSE))
	{
		return TRUE;
	};
};

func void dia_jora_ghdginfo_info()
{
	AI_Output(other,self,"DIA_Jora_Add_15_05");	//��� �� ������ � ������� �����?
	if(JORA_GOLD != LOG_SUCCESS)
	{
		b_jora_goldforclue();
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_Add_08_06");	//������ - � ����� - �� �� ������ �� ������ �� ����, ���� ���, �������?
		AI_Output(self,other,"DIA_Jora_Add_08_07");	//� �������� ������ ��������� ��������� �����-�� ������ ��������.
		AI_Output(self,other,"DIA_Jora_Add_08_08");	//����� ����������, ��� ������ ���-�� ����� �� ����...
		AI_Output(self,other,"DIA_Jora_Add_08_09");	//���� �� ������ ��������� ���� �����, ���� ����� ���������� � ���.
		AI_Output(self,other,"DIA_Jora_Add_08_10");	//�� ������ ������������, ��� ����� �����-������ ������ ���������, ��������. �����, �� ������� �� ���.
		AI_Output(self,other,"DIA_Jora_Add_08_11");	//�� ���� ���������. � ����� ������ ����� �� ������.
		JORA_GHDGHINWEIS = TRUE;
	};
};


instance DIA_JORA_BELOHNUNG(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_belohnung_condition;
	information = dia_jora_belohnung_info;
	permanent = FALSE;
	description = "� ���� �������� ����� ������ � �������� ��������������!";
};


func int dia_jora_belohnung_condition()
{
	if(JORA_GOLD == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_jora_belohnung_info()
{
	AI_Output(other,self,"DIA_Jora_Belohnung_15_00");	//� ���� �������� ����� ������ � �������� ��������������!
	if(JORA_GHDGHINWEIS == TRUE)
	{
		AI_Output(self,other,"DIA_Jora_Add_08_12");	//�� � ��� ��� ���� ������ �����.
		AI_Output(self,other,"DIA_Jora_Add_08_13");	//����� ������ ������� � �������� ��������������.
	};
	AI_Output(self,other,"DIA_Jora_Add_08_14");	//� ���� ���� ����� ������, �� ���������� ����� � ������� ������� �� �� ������ � ����� �����.
	if(Npc_GetDistToWP(self,"NW_CITY_MERCHANT_PATH_38") <= 500)
	{
		AI_Output(self,other,"DIA_Jora_Belohnung_08_03");	//� ������ ������, ���� ���� �������...
	};
	AI_StopProcessInfos(self);
};


instance DIA_JORA_ALRIKSSCHWERT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 1;
	condition = dia_jora_alriksschwert_condition;
	information = dia_jora_alriksschwert_info;
	permanent = FALSE;
	description = "������ �������, ��� � ���� ��� ���...";
};


func int dia_jora_alriksschwert_condition()
{
	if(MIS_ALRIK_SWORD == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jora_alriksschwert_info()
{
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_00");	//������ �������, ��� � ���� ��� ���...
	AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_01");	//�� ������ � ���� ����� ���������, ��� ������ ��� ���� ������ �� ��������� ������� � ����� ����?
	AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_02");	//��, ��� ��.
	if(Npc_HasItems(self,itmw_alrikssword_mis) > 0)
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_03");	//��� ��� ��� ��� � ����.
		AI_Output(other,self,"DIA_Jora_AlriksSchwert_15_04");	//������� �� ������ �� ����?
		if(JORA_GOLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_05");	//�� - ��� ����...
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_06");	//�, �����! ������� ��� ���. ���� �� ����� ��� ������� ��� ������...
			b_giveinvitems(self,other,itmw_alrikssword_mis,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_07");	//�� - ������ ��� ���� - 50 ������� �����.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_AlriksSchwert_08_08");	//(�����������) � ���� ��� ������ ���! ���� ��� �����, ���� � ��� ������!
	};
};


instance DIA_JORA_BUYALRIKSSCHWERT(C_INFO)
{
	npc = vlk_408_jora;
	nr = 2;
	condition = dia_jora_buyalriksschwert_condition;
	information = dia_jora_buyalriksschwert_info;
	permanent = TRUE;
	description = "��� 50 ������� �����. ����� ��� ��� �������.";
};


func int dia_jora_buyalriksschwert_condition()
{
	if(Npc_KnowsInfo(other,dia_jora_alriksschwert) && (Npc_HasItems(self,itmw_alrikssword_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_jora_buyalriksschwert_info()
{
	AI_Output(other,self,"DIA_Jora_BUYAlriksSchwert_15_00");	//��� 50 ������� �����. ����� ��� ��� �������.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_04");	//���, ����� - (����������) ��� �������� ������.
		b_giveinvitems(self,other,itmw_alrikssword_mis,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_05");	//� ���� ������������ ������. �� �� �������� - � ���������� ���� ���� ���. ������ �����, ���� ������...
//		AI_Output(self,other,"DIA_Jora_BUYAlriksSchwert_08_03");	//You can always do that - for 50 gold pieces it's yours.	
	};
};


instance DIA_JORA_PICKPOCKET(C_INFO)
{
	npc = vlk_408_jora;
	nr = 900;
	condition = dia_jora_pickpocket_condition;
	information = dia_jora_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_jora_pickpocket_condition()
{
	return c_beklauen(31,45);
};

func void dia_jora_pickpocket_info()
{
	Info_ClearChoices(dia_jora_pickpocket);
	Info_AddChoice(dia_jora_pickpocket,DIALOG_BACK,dia_jora_pickpocket_back);
	Info_AddChoice(dia_jora_pickpocket,DIALOG_PICKPOCKET,dia_jora_pickpocket_doit);
};

func void dia_jora_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jora_pickpocket);
};

func void dia_jora_pickpocket_back()
{
	Info_ClearChoices(dia_jora_pickpocket);
};

