
instance DIA_ULF_EXIT(C_INFO)
{
	npc = nov_602_ulf;
	nr = 999;
	condition = dia_ulf_exit_condition;
	information = dia_ulf_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ulf_exit_condition()
{
	return TRUE;
};

func void dia_ulf_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ULF_HALLO(C_INFO)
{
	npc = nov_602_ulf;
	nr = 2;
	condition = dia_ulf_hallo_condition;
	information = dia_ulf_hallo_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_ulf_hallo_condition()
{
	if((hero.guild != GIL_NOV) && (hero.guild != GIL_KDF) && (MIS_SCHNITZELJAGD == FALSE))
	{
		return TRUE;
	};
};

func void dia_ulf_hallo_info()
{
	AI_Output(other,self,"DIA_Ulf_Hallo_15_00");	//��� �� ������� �����?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_01");	//���� ���� ��������� ��� �����, � �������� ������� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Ulf_Hallo_03_02");	//� ��������� � ���������. � �������� ������� �����, � ����� ���������.
	};
	AI_Output(self,other,"DIA_Ulf_Hallo_03_03");	//� �������� ���� ������������ ������ ���� �� ���������.
};


instance DIA_ULF_WIRTE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_wirte_condition;
	information = dia_ulf_wirte_info;
	permanent = FALSE;
	description = "��� ��� ���� ������������?";
};


func int dia_ulf_wirte_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_wirte_info()
{
	AI_Output(other,self,"DIA_Ulf_Wirte_15_00");	//��� ��� ���� ������������?
	AI_Output(self,other,"DIA_Ulf_Wirte_03_01");	//���� �� ��� - ��� ���� ������ ������� �� ���������.
	AI_Output(self,other,"DIA_Ulf_Wirte_03_02");	//����� ��� ������� - ������ ������� �� �������� �������, � ������ - �������� ���� � �������� ������.
};


instance DIA_ULF_KLOSTER(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_kloster_condition;
	information = dia_ulf_kloster_info;
	permanent = FALSE;
	description = "��� �� ������ ���������� ��� � ���������?";
};


func int dia_ulf_kloster_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_ulf_kloster_info()
{
	AI_Output(other,self,"DIA_Ulf_Kloster_15_00");	//��� �� ������ ���������� ��� � ���������?
	AI_Output(self,other,"DIA_Ulf_Kloster_03_01");	//��, ����������, ���� ����������� � �������� ������ � �������� ��������� ���� ��� ������������ �����.
	AI_Output(self,other,"DIA_Ulf_Kloster_03_02");	//�� ������ �� ��� ��, ��� �� ������ ������, � ������� ���� � �������� � �����.
};


instance DIA_ULF_BRINGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 4;
	condition = dia_ulf_bringen_condition;
	information = dia_ulf_bringen_info;
	permanent = FALSE;
	description = "������ ���� � ���������.";
};


func int dia_ulf_bringen_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_hallo) && (hero.guild != GIL_KDF) && (hero.guild != GIL_NOV) && (hero.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_ulf_bringen_info()
{
	AI_Output(other,self,"DIA_Ulf_Bringen_15_00");	//������ ���� � ���������.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_01");	//������ �� ����. �� ������, ������� ��������� ������� ������ ����������� ��� �� ����?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_02");	//����� � ����� ��� ���� ���� �������� �����, ������ � ��������, � ���, ��� ��� ������ �� ����� ���� �����.
	AI_Output(self,other,"DIA_Ulf_Bringen_03_03");	//����� ����, ���� ��� ����� �� ������ � ���������.
	AI_Output(other,self,"DIA_Ulf_Bringen_15_04");	//������?
	AI_Output(self,other,"DIA_Ulf_Bringen_03_05");	//���� � ��������� �������� ������ �����, ��������� � �����������.
};


instance DIA_ULF_AUFNAHME(C_INFO)
{
	npc = nov_602_ulf;
	nr = 3;
	condition = dia_ulf_aufnahme_condition;
	information = dia_ulf_aufnahme_info;
	permanent = FALSE;
	description = "��� ��� ����� �����������?";
};


func int dia_ulf_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_bringen) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_aufnahme_info()
{
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_00");	//��� ��� ����� �����������?
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_01");	//���� ������� ��������� �������� �������...
	AI_Output(other,self,"DIA_Ulf_Aufnahme_15_02");	//��! ������ ����� ���, ������ �������.
	AI_Output(self,other,"DIA_Ulf_Aufnahme_03_03");	//�� ������ �������� ����. ���� �...
	b_say_gold(self,other,SUMME_KLOSTER);
	Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
	b_logentry(TOPIC_KLOSTER,"����� ����� ����������� ��������� ������, ��� ����� ���� � 1000 ������� �����.");
};


instance DIA_ULF_GOLD(C_INFO)
{
	npc = nov_602_ulf;
	nr = 8;
	condition = dia_ulf_gold_condition;
	information = dia_ulf_gold_info;
	permanent = FALSE;
	description = "��� ��� ��������� ����� �������� �����?";
};


func int dia_ulf_gold_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_gold_info()
{
	AI_Output(other,self,"DIA_Ulf_Gold_15_00");	//��� ��� ��������� ����� �������� �����?
	AI_Output(self,other,"DIA_Ulf_Gold_03_01");	//��� ��� ��������, ��� �� �� ������ ������, ��� ��� �� ��������� �� ����, ���� ������ ����� ���������� ��.
};


instance DIA_ULF_SCHAF(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_schaf_condition;
	information = dia_ulf_schaf_info;
	permanent = FALSE;
	description = "��� � ���� ����� ����?";
};


func int dia_ulf_schaf_condition()
{
	if(Npc_KnowsInfo(hero,dia_ulf_aufnahme) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_ulf_schaf_info()
{
	AI_Output(other,self,"DIA_Ulf_Schaf_15_00");	//��� � ���� ����� ����?
	AI_Output(self,other,"DIA_Ulf_Schaf_03_01");	//� ��������, ������� ��. �� �� �� �������� �� �����.
	b_logentry(TOPIC_KLOSTER,"� ���� ��������� ���� � ��������.");
};


instance DIA_ULF_SUCHE(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_suche_condition;
	information = dia_ulf_suche_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_suche_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000) && !Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		return TRUE;
	};
};

func void dia_ulf_suche_info()
{
	AI_Output(self,other,"DIA_Ulf_Suche_03_00");	//��, �� ������ �������?
	AI_Output(other,self,"DIA_Ulf_Suche_15_01");	//�� ��� ������.
	AI_Output(self,other,"DIA_Ulf_Suche_03_02");	//�����. � ��� ��� ����� ��������, ������ ��������� ����, ����� ��-�� ���� ����� ����� � ������ ���, ��� � ��� ������.
	AI_Output(self,other,"DIA_Ulf_Suche_03_03");	//��� �� ��� ��������? ���� ������ �����������. � ��� ������� ���� ����?
	AI_Output(other,self,"DIA_Ulf_Suche_15_04");	//� ���������� ����������� ��������� �����.
	AI_Output(self,other,"DIA_Ulf_Suche_03_05");	//��� ����������! ������, �������� � ���� ������ �� ���������. ��� ������, ��� �� ���� ������ ������ '��, ��� �������� ������� � ����� ����'?
	AI_Output(other,self,"DIA_Ulf_Suche_15_06");	//������ �� ���.
};


instance DIA_ULF_RAUSGEFUNDEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_rausgefunden_condition;
	information = dia_ulf_rausgefunden_info;
	permanent = FALSE;
	description = "�� ��� ������ �� �����";
};


func int dia_ulf_rausgefunden_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_42") <= 1000) && !Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		return TRUE;
	};
};

func void dia_ulf_rausgefunden_info()
{
	AI_Output(other,self,"DIA_Ulf_Rausgefunden_15_00");	//�� ��� ������ �� �����
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_01");	//��, � ������� ���� �� ������ - �� � ������� ���.
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_02");	//� ��� ������?.. ��� ��� �������? ������ ������ ������. �� � �� ������� ��� ������� � �����...
	AI_Output(self,other,"DIA_Ulf_Rausgefunden_03_03");	//��� ��� � �������� ���� ������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_ULF_FOLGEN(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_folgen_condition;
	information = dia_ulf_folgen_info;
	permanent = FALSE;
	description = "��, �� ���, ����� �� ����?";
};


func int dia_ulf_folgen_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden) && !Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		return TRUE;
	};
};

func void dia_ulf_folgen_info()
{
	AI_Output(other,self,"DIA_Ulf_Folgen_15_00");	//��, �� ���, ����� �� ����?
	AI_Output(self,other,"DIA_Ulf_Folgen_03_01");	//����. ������ � �������� ��� � ��� �� �����������, ��� � ��.
	AI_StopProcessInfos(self);
};


instance DIA_ULF_STOP(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_stop_condition;
	information = dia_ulf_stop_info;
	permanent = FALSE;
	description = "������ ������ �� ����!";
};


func int dia_ulf_stop_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_folgen) && !Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		return TRUE;
	};
};

func void dia_ulf_stop_info()
{
	AI_Output(other,self,"DIA_Ulf_Stop_15_00");	//������ ������ �� ����!
	AI_Output(self,other,"DIA_Ulf_Stop_03_01");	//� �� ��� �� �����. ��, ����������, ���� ���� ��� ������� - � ����� ������ �������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"SUCHE");
};


instance DIA_ULF_ABRECHNUNG(C_INFO)
{
	npc = nov_602_ulf;
	nr = 1;
	condition = dia_ulf_abrechnung_condition;
	information = dia_ulf_abrechnung_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_abrechnung_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) >= 1))
	{
		return TRUE;
	};
};

func void dia_ulf_abrechnung_info()
{
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_00");	//�� ����� �����������. � ����� ���������. � ����, ��� ������� ����� ����� ������ �� ���.
	AI_Output(other,self,"DIA_Ulf_Abrechnung_15_01");	//�� - �� ����� �����...
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_02");	//� ���� ��� ������. ����� ���������� �� �� ���.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_03");	//� ������ ����� �����. ����� ����� ��� ������ ������. � ������ � ������ ��, ��� ������ ������������ ���.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_03_04");	//�� ������ ������� ��������� �����?
	Info_ClearChoices(dia_ulf_abrechnung);
	Info_AddChoice(dia_ulf_abrechnung,"��������, � �� ���� ������� ����.",dia_ulf_abrechnung_lass);
	Info_AddChoice(dia_ulf_abrechnung,"��, ��������, ���-�� �� ��������� - ��� ����� ��������� � ���������.",dia_ulf_abrechnung_schnell);
	Info_AddChoice(dia_ulf_abrechnung,"� ���� ��� ������ ��������?",dia_ulf_abrechnung_rauch);
};

func void dia_ulf_abrechnung_lass()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Lass_15_00");	//��������, � �� ���� ������� ����.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Lass_03_01");	//����. �� �� ������, ��� � ���� ��� �� ������� ����� ������ ����! ��������!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_schnell()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Schnell_15_00");	//��, ��������, ���-�� �� ���������... ��� ����� ��������� � ���������.
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Schnell_03_01");	//���� ������ ������ �� ����� ����!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};

func void dia_ulf_abrechnung_rauch()
{
	AI_Output(other,self,"DIA_Ulf_Abrechnung_Rauch_15_00");	//� ���� ��� ������ ��������?
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_01");	//���� �������. ��� ��� � ���� ���-��� ����.
	b_giveinvitems(self,other,itmi_joint,1);
	b_useitem(other,itmi_joint);
	AI_Output(self,other,"DIA_Ulf_Abrechnung_Rauch_03_02");	//�����, �������.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_ULF_TROLL(C_INFO)
{
	npc = nov_602_ulf;
	nr = 9;
	condition = dia_ulf_troll_condition;
	information = dia_ulf_troll_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_ulf_troll_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_ulf_rausgefunden) && ((Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_14") <= 1000) || (Npc_GetDistToWP(self,"NW_TROLLAREA_PATH_15") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_ulf_troll_info()
{
	AI_Output(self,other,"DIA_Ulf_Troll_03_00");	//��, �� ������������� �������, ��� �� ���� ���������� �������? ������ ����� �� �����.
	AI_Output(self,other,"DIA_Ulf_Troll_03_01");	//� �����, ��� ����� ���� � ������ �������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WAIT");
};


instance DIA_ULF_PICKPOCKET(C_INFO)
{
	npc = nov_602_ulf;
	nr = 900;
	condition = dia_ulf_pickpocket_condition;
	information = dia_ulf_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_ulf_pickpocket_condition()
{
	return c_beklauen(34,50);
};

func void dia_ulf_pickpocket_info()
{
	Info_ClearChoices(dia_ulf_pickpocket);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_BACK,dia_ulf_pickpocket_back);
	Info_AddChoice(dia_ulf_pickpocket,DIALOG_PICKPOCKET,dia_ulf_pickpocket_doit);
};

func void dia_ulf_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ulf_pickpocket);
};

func void dia_ulf_pickpocket_back()
{
	Info_ClearChoices(dia_ulf_pickpocket);
};

