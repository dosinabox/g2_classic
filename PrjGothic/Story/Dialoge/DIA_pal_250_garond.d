
instance DIA_GAROND_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_exit_condition;
	information = dia_garond_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_garond_exit_info()
{
	AI_StopProcessInfos(self);
};


var int garond_lastpetzcounter;
var int garond_lastpetzcrime;

instance DIA_GAROND_PMSCHULDEN(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_pmschulden_condition;
	information = dia_garond_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (GAROND_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= GAROND_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_garond_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Garond_PMSchulden_10_00");	//�� ������ �� ����� ���������, ���� �� �� ��������� �����.
	if(b_gettotalpetzcounter(self) > GAROND_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_01");	//� �� ������, �������� ��� ��������� ���������.
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_02");	//������� � ����, ������, ������ �����������.
		if(GAROND_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_03");	//�� � �������, ��� �� �������� ��������� ����� �� ���! �������� ��� ���� �����������, ��� �����...
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_04");	//� ����� ����������� �����. ���� ����� ������ ����������...
		};
		diff = b_gettotalpetzcounter(self) - GAROND_LASTPETZCOUNTER;
		if(diff > 0)
		{
			GAROND_SCHULDEN = GAROND_SCHULDEN + (diff * 50);
		};
		if(GAROND_SCHULDEN > 1000)
		{
			GAROND_SCHULDEN = 1000;
		};
		b_say_gold(self,other,GAROND_SCHULDEN);
	}
	else if(b_getgreatestpetzcrime(self) < GAROND_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_05");	//���������� ����� �����������.
		if(GAROND_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_06");	//������ ������ ����� �� �������� ���� � ��������.
		};
		if((GAROND_LASTPETZCRIME == CRIME_THEFT) || ((GAROND_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_07");	//����� �� ������, ��� �����, ��� �� �������.
		};
		if((GAROND_LASTPETZCRIME == CRIME_ATTACK) || ((GAROND_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_08");	//������ ��� ����������, ������������, ��� �� ���������� � �����.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_09");	//������, ��� ��������� ������ ���� �����.
		};
		AI_Output(self,other,"DIA_Garond_PMSchulden_10_10");	//� ������� �� ����, ��� ��� ���������, �� ������������ ����: �� ������ ������� ������!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_11");	//� ������ ������� ���������� ���� �� ������.
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_12");	//� ������ � �� ���� ������� � ���, ��� �� ����� ����� � �����!
			GAROND_SCHULDEN = 0;
			GAROND_LASTPETZCOUNTER = 0;
			GAROND_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_13");	//� ���� ������� �� ������ ��������: ���� ��� ����� �������� ��������� ����� � ������ ������.
			b_say_gold(self,other,GAROND_SCHULDEN);
			AI_Output(self,other,"DIA_Garond_PMSchulden_10_14");	//��� ��� ������ �����?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_garond_pmschulden);
		Info_ClearChoices(dia_garond_petzmaster);
		Info_AddChoice(dia_garond_pmschulden,"� ���� ��� ������� ������!",dia_garond_petzmaster_paylater);
		Info_AddChoice(dia_garond_pmschulden,"������� ��� �����?",dia_garond_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
		{
			Info_AddChoice(dia_garond_pmschulden,"� ���� ��������� �����!",dia_garond_petzmaster_paynow);
		};
	};
};

func void dia_garond_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Garond_PMSchulden_HowMuchAgain_15_00");	//������� ��� ����?
	b_say_gold(self,other,GAROND_SCHULDEN);
	Info_ClearChoices(dia_garond_pmschulden);
	Info_ClearChoices(dia_garond_petzmaster);
	Info_AddChoice(dia_garond_pmschulden,"� ���� ��� ������� ������!",dia_garond_petzmaster_paylater);
	Info_AddChoice(dia_garond_pmschulden,"������� ��� �����?",dia_garond_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_pmschulden,"� ���� ��������� �����!",dia_garond_petzmaster_paynow);
	};
};


instance DIA_GAROND_PETZMASTER(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_petzmaster_condition;
	information = dia_garond_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_garond_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > GAROND_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_garond_petzmaster_info()
{
	GAROND_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_00");	//��� ��� �� ����� ����� � �����.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_01");	//� ��������� ����: ������� ��� ��� ����� ������������, ������ ��� �� ������� �� ��� � ��������?
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_02");	//��� ������ ������� ��� ����� �� �������.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_03");	//� ���� �� ����� ������ ������� - � ������ � ���� ����� �� ������ ����� ������!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		GAROND_SCHULDEN = GAROND_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_04");	//�� ������ ��� ��� ���� ���������, � ��� ���� ��������.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_05");	//������� ��� ��������� ���� ���-���. �� ����� ��� � ����� �������.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_06");	//� � ���� �� ����� ������ �������. ������� ����.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_07");	//���� ���� ������� ����� ����-������, ������ ����� �� ������ �����. � ������ ��� ����� ���� �� ��������.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_08");	//� �������� �������� �� ���� ����� - � ��� ������ ��������� ��������� ����� ����.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_09");	//����� �����, ��� �� ����� � ����� �����.
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_10");	//�� ������ ��� ��� ���� ������, ��� ��� ��������.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_11");	//���� ��� ������ �� ���� �� ���������������. ��, ������, �� ��������� ���� ����������� ��������.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_12");	//���� �������� ��������� ����� � �������� ����������� �� ���� ������������!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_13");	//� �� �����, ����� ����� ���� ����� ��������� �����.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Garond_PETZMASTER_10_14");	//� �� ���� ������ � ����� ��� ������ �� �������.
		};
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_15");	//���� �������� ��������� �� ��� �����!
		GAROND_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_16");	//�� �������� ����� ����?! ��� ������������ �������������.
		AI_Output(self,other,"DIA_Garond_PETZMASTER_10_17");	//���� �������� ��������� �� ��� ����.
		GAROND_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Garond_PETZMASTER_15_18");	//�������?
	if(GAROND_SCHULDEN > 1000)
	{
		GAROND_SCHULDEN = 1000;
	};
	b_say_gold(self,other,GAROND_SCHULDEN);
	Info_ClearChoices(dia_garond_pmschulden);
	Info_ClearChoices(dia_garond_petzmaster);
	Info_AddChoice(dia_garond_petzmaster,"� ���� ��� ������� ������!",dia_garond_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= GAROND_SCHULDEN)
	{
		Info_AddChoice(dia_garond_petzmaster,"� ���� ��������� �����!",dia_garond_petzmaster_paynow);
	};
};

func void dia_garond_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayNow_15_00");	//� ���� ��������� �����!
	b_giveinvitems(other,self,itmi_gold,GAROND_SCHULDEN);
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayNow_10_01");	//������, � ����� �� ���� ����� ������, ����� ������� ��������� ��. �� ����� ������ ����� �� �����������!
	b_grantabsolution(LOC_OLDCAMP);
	GAROND_SCHULDEN = 0;
	GAROND_LASTPETZCOUNTER = 0;
	GAROND_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_garond_petzmaster);
	Info_ClearChoices(dia_garond_pmschulden);
};

func void dia_garond_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Garond_PETZMASTER_PayLater_15_00");	//� ���� ��� ������� ������!
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_01");	//����� ���������� ��������� ��� ������ ��� ����� �������.
	AI_Output(self,other,"DIA_Garond_PETZMASTER_PayLater_10_02");	//� � ������������ ����: ���� �� ������ ��������� �������� ������������ � � �������, ���� ���������!
	GAROND_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	GAROND_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_HELLO(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_hello_condition;
	information = dia_garond_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_garond_hello_condition()
{
	if((KAPITEL == 2) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_garond_hello_info()
{
	AI_Output(self,other,"DIA_Garond_Hello_10_00");	//������ �� ������? �� �� �� ����������, � �� �� ���� �� ���� �����. ��� ��� �� ��?
	AI_Output(other,self,"DIA_Garond_Hello_15_01");	//� ������ ����� ������.
	AI_Output(self,other,"DIA_Garond_Hello_10_02");	//����� ������...? �� ������������� ������ ���?! �, ����� ����������!
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_03");	//����� �� ������ ���� ����, ���?
	}
	else if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_04");	//����� ������ �� ����������, ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Hello_10_05");	//� ����� ���� ������, ����� �������� ����������� ����� ����? ��� �� ������� �����?
	};
};


instance DIA_GAROND_NEEDPROOF(C_INFO)
{
	npc = pal_250_garond;
	nr = 1;
	condition = dia_garond_needproof_condition;
	information = dia_garond_needproof_info;
	description = "� ������ �� ����� ������.";
};


func int dia_garond_needproof_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_hello) && (MIS_OLDWORLD == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_needproof_info()
{
	AI_Output(other,self,"DIA_Garond_NeedProof_15_00");	//� ������ �� ����� ������. �� �����, ����� � ���������� ��� �������������� ����������� ����� ��������.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_01");	//��� �� ������, ����� �������� ��� �������������� � ��������� �����?
	AI_Output(other,self,"DIA_Garond_NeedProof_15_02");	//��, ������ �� ��� � � �����������.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_03");	//��� ��� ����� ��������������? �� ����� �������� ��. �� � �� ���� ��������� ���� ����� � ����� ������, �� ����������� ��� ���������� � ����.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_04");	//�������� - ���� ����� ������ ������ ��� � �������� ����� � � ���, ������� ���� ������� ��� ������.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_05");	//������, � ��� �� ������, ����� � ������?
	AI_Output(self,other,"DIA_Garond_NeedProof_10_06");	//� ��� �����, � ������, ��� ������ ����������. �� � ��� �� ������� �� ��� �� ������ ����� ����.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_07");	//������ ��� ��� ����� � ������ ���, ������� ���� ��� ������.
	AI_Output(self,other,"DIA_Garond_NeedProof_10_08");	//����� �����, � ��� ���� ������, ������� �� �������� ����� ������.
	AI_Output(other,self,"DIA_Garond_NeedProof_15_09");	//��, ������ - ������, � ���� ��� ������.
	MIS_SCOUTMINE = LOG_RUNNING;
	b_startotherroutine(jergan,"FAJETH");
	b_logentry(TOPIC_MISOLDWORLD,"������ ��� ����������� ������ �������� ���� �����, �� �����, ����� � �������� ��� ������ ���������� � ������� ���, ������� ���� ������� �� ������.");
	Log_CreateTopic(TOPIC_SCOUTMINE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCOUTMINE,LOG_RUNNING);
	b_logentry(TOPIC_SCOUTMINE,"����������� ������ ��� ��� ���������. �� �������� ��� ������ ���������� �������� ���������� ����. � �� ��� ��� ��� �� ���������.");
	b_logentry(TOPIC_SCOUTMINE,"� ������ ����� ��� ��� ������ ���������� � ��������, ������� ���� ������� �� ������.");
};


instance DIA_GAROND_WHY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_why_condition;
	information = dia_garond_why_info;
	permanent = FALSE;
	description = "�� ������ ������ �?";
};


func int dia_garond_why_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_why_info()
{
	AI_Output(other,self,"DIA_Garond_Why_15_00");	//�� ������ ������ �?
	AI_Output(self,other,"DIA_Garond_Why_10_01");	//������ ��� �� ������ ��� ����������� ����� ���� �����. ��� ����� ������ ��� ������� ���� �����.
	AI_Output(self,other,"DIA_Garond_Why_10_02");	//���� ���� ���� ��� ��� ������� ���������� ��� ����������� - ������, �� ��� ������ ����� ��������� ��� ���� ������.
};


instance DIA_GAROND_EQUIPMENT(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_equipment_condition;
	information = dia_garond_equipment_info;
	permanent = FALSE;
	description = "��� ����� ����������.";
};


func int dia_garond_equipment_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && ((other.guild == GIL_KDF) || (other.guild == GIL_MIL)))
	{
		return TRUE;
	};
};

func void dia_garond_equipment_info()
{
	AI_Output(other,self,"DIA_Garond_Equipment_15_00");	//��� ����� ����������.
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_01");	//�������� � ����� �������� �����, � �����. �� ����������� � ����� �����.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Garond_Equipment_10_02");	//�������� �� ���� � ��������. �� ������ ���� ��� �����������.
		Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
		b_logentry(TOPIC_TRADER_OC,"������ ������� ������ � �����.");
	};
};


instance DIA_GAROND_ZAHLEN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_zahlen_condition;
	information = dia_garond_zahlen_info;
	permanent = FALSE;
	description = "������� �� ��������� ��� �� ��� ������?";
};


func int dia_garond_zahlen_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_garond_zahlen_info()
{
	AI_Output(other,self,"DIA_Garond_zahlen_15_00");	//������� �� ��������� ��� �� ��� ������?
	AI_Output(self,other,"DIA_Garond_zahlen_10_01");	//(�������) � �� �������� � ����, ����������.
	AI_Output(self,other,"DIA_Garond_zahlen_10_02");	//��, �����, ������, � ���� ��� ������. � ������� ���� 500 �������, ���� �� ��������� ��� �������.
};


instance DIA_GAROND_WO(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_wo_condition;
	information = dia_garond_wo_info;
	permanent = FALSE;
	description = "��� ��� ����� ��� �����?";
};


func int dia_garond_wo_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_wo_info()
{
	AI_Output(other,self,"DIA_Garond_Wo_15_00");	//��� ��� ����� ��� �����?
	AI_Output(self,other,"DIA_Garond_Wo_10_01");	//���, ������ ��� �����. �� ��� �������� ��� �������, ��� ��������� �����.
	CreateInvItems(self,itwr_map_oldworld_oremines_mis,1);
	b_giveinvitems(self,other,itwr_map_oldworld_oremines_mis,1);
	AI_Output(self,other,"DIA_Garond_Wo_10_02");	//���� � ���� ���� ��� �������, �������� � ���������. �� ��������� ���, ��� ���� ����� ����� � ����������.
	b_logentry(TOPIC_SCOUTMINE,"������� ��������� ����� ���� ��� ���������� � ����������.");
};

func void b_garond_orecounter3()
{
	AI_Output(self,other,"B_Garond_OreCounter3_10_00");	//����! ��� ��� ����������? ������� ��� ������ ������, ����� ������� ��� � ���� �����?!
	AI_Output(self,other,"B_Garond_OreCounter3_10_01");	//��� ���� ����� ��� ������, � � ��� �����, ��� � ��� ����, �� �� ����� ���������� ���� ������ ����, �� ������ ��� �� �����!
	AI_Output(self,other,"B_Garond_OreCounter3_10_02");	//��� ���������� �������� �� ������.
};


instance DIA_GAROND_FAJETH(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_fajeth_condition;
	information = dia_garond_fajeth_info;
	permanent = FALSE;
	description = "� ��������� � ��������.";
};


func int dia_garond_fajeth_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (FAJETH_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_fajeth_info()
{
	AI_Output(other,self,"DIA_Garond_Fajeth_15_00");	//� ��������� � ��������.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_01");	//��� �� ����� ������� ���?
	AI_Output(other,self,"DIA_Garond_Fajeth_15_02");	//��� ���� ������ ��� ����� ����.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_03");	//���... ��� �����? ��� �� ����� ��� ����� - ��� ����� ��� �����.
	AI_Output(other,self,"DIA_Garond_Fajeth_15_04");	//�� �����, ����� � ������� ���� - ��� ����� ��� ����.
	AI_Output(self,other,"DIA_Garond_Fajeth_10_05");	//���? � ������ ������� ��� ����� �� ������ ������? �� ����� ������ �� ����.
	ORE_COUNTER = ORE_COUNTER + 1;
	b_giveplayerxp(XP_FAJETH_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_SILVESTRO(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_silvestro_condition;
	information = dia_garond_silvestro_info;
	permanent = FALSE;
	description = "������ ����� ����������...";
};


func int dia_garond_silvestro_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (SILVESTRO_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_silvestro_info()
{
	AI_Output(other,self,"DIA_Garond_Silvestro_15_00");	//������ ����� ����������...
	AI_Output(self,other,"DIA_Garond_Silvestro_10_01");	//�� ����� ���? �� ������� � ���?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_02");	//���, ��� ��������� � �����, ������. ���������� ����������.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_03");	//� ��� ������ ����? �� ������, ������� ��� ������?
	AI_Output(other,self,"DIA_Garond_Silvestro_15_04");	//�� ������� �������� ��������� ������. ��� � ������ - �� ���� �� ����� � �����.
	AI_Output(self,other,"DIA_Garond_Silvestro_10_05");	//����! ��� ���� ������� ���� - �� ������� ����� ���������� � �� �����.
	ORE_COUNTER = ORE_COUNTER + 1;
	b_giveplayerxp(XP_SILVESTRO_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_MARCOS(C_INFO)
{
	npc = pal_250_garond;
	nr = 2;
	condition = dia_garond_marcos_condition;
	information = dia_garond_marcos_info;
	permanent = FALSE;
	description = "� �������� �������.";
};


func int dia_garond_marcos_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (MARCOS_ORE == TRUE))
	{
		return TRUE;
	};
};

func void dia_garond_marcos_info()
{
	AI_Output(other,self,"DIA_Garond_Marcos_15_00");	//� �������� �������.
	AI_Output(self,other,"DIA_Garond_Marcos_10_01");	//�? ��� �� ����� ��������? ������� ���� �� ����� ��� ���?
	AI_Output(other,self,"DIA_Garond_Marcos_15_02");	//������ �����. �� ������� �����, ����� ����������� ���� � ���������� �����.
	AI_Output(other,self,"DIA_Garond_Marcos_15_03");	//������ �� �������� ��� ����� � ��������� ������ �� ��������� �����. �� ������ �������� ������������.
	AI_Output(self,other,"DIA_Garond_Marcos_10_04");	//���? ����� ������ ����� - � �� ������� �����? ����, ��� ��� ��� �����.
	AI_Output(self,other,"DIA_Garond_Marcos_10_05");	//� ��� ����� ��� ����?.. ��� �, �����, � ����� � ���� ���� �������.
	marcos_guard1.flags = 0;
	marcos_guard2.flags = 0;
	AI_Teleport(marcos_guard1,"OW_STAND_GUARDS");
	AI_Teleport(marcos_guard1,"OW_STAND_GUARDS");
	b_startotherroutine(marcos_guard1,"MARCOS");
	b_startotherroutine(marcos_guard2,"MARCOS");
	ORE_COUNTER = ORE_COUNTER + 1;
	MIS_MARCOS_JUNGS = LOG_SUCCESS;
	b_giveplayerxp(XP_MARCOS_ORE);
	if(ORE_COUNTER >= 3)
	{
		b_garond_orecounter3();
	};
};


instance DIA_GAROND_SUCCESS(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_success_condition;
	information = dia_garond_success_info;
	permanent = FALSE;
	description = "��� ������ ������ ��� ����� ������?";
};


func int dia_garond_success_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (ORE_COUNTER >= 3))
	{
		return TRUE;
	};
};

func void dia_garond_success_info()
{
	AI_Output(other,self,"DIA_Garond_Success_15_00");	//��� ������ ������ ��� ����� ������?
	AI_Output(self,other,"DIA_Garond_Success_10_01");	//� ����� ��������� � ��� ���� ������ ������ ���� - � �� �������� � ��� ���� ������ ������� �����.
	AI_Output(self,other,"DIA_Garond_Success_10_02");	//�� �������� ���� ������. ���� ����� ������ �������� �� ����. ��� ������ �������� - ����� ��������� ���.
	CreateInvItems(self,itwr_paladinletter_mis,1);
	b_giveinvitems(self,other,itwr_paladinletter_mis,1);
	KNOWSPALADINS_ORE = TRUE;
	b_logentry(TOPIC_MISOLDWORLD,"����������� ������ ��� ��� ������. ��� ������ ���� ���������� ��� ������������� ���� ����. � ���� ������� ��� ����� ������.");
	MIS_SCOUTMINE = LOG_SUCCESS;
	b_giveplayerxp(XP_SCOUTMINE);
	MIS_READYFORCHAPTER3 = TRUE;
	b_npc_isalivecheck(OLDWORLD_ZEN);
};


instance DIA_GAROND_SLD(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_sld_condition;
	information = dia_garond_sld_info;
	permanent = FALSE;
	description = "��� ������ ������?";
};


func int dia_garond_sld_condition()
{
	if((MIS_SCOUTMINE == LOG_SUCCESS) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_garond_sld_info()
{
	AI_Output(other,self,"DIA_Garond_SLD_15_00");	//��� ������ ������?
	AI_Output(self,other,"DIA_Garond_SLD_10_01");	//��, ��, �����. � ������ ���� ������� ������. ��� ���� �������.
	b_giveinvitems(self,other,itmi_gold,500);
};


instance DIA_GAROND_RUNNING(C_INFO)
{
	npc = pal_250_garond;
	nr = 10;
	condition = dia_garond_running_condition;
	information = dia_garond_running_info;
	permanent = TRUE;
	description = "��� ��������?";
};


func int dia_garond_running_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL == 2) && (ORE_COUNTER < 3))
	{
		return TRUE;
	};
};

func void dia_garond_running_info()
{
	AI_Output(other,self,"DIA_Garond_Running_15_00");	//��� ����������?
	if(ORE_COUNTER == 2)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_01");	//������ � ��� ������ �������� � ��������� ����� - � �������, ��� ��� ����� ������� �������.
	}
	else if(ORE_COUNTER == 1)
	{
		AI_Output(self,other,"DIA_Garond_Running_10_02");	//��� ����� ������� � ���� ������ ������. � ��� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Running_10_03");	//�� ������ ����� ���� �����. ��� ����� ����� ������� � ���, ��� ������� ���� � ������� ����.
	};
};


instance DIA_GAROND_GORN(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_gorn_condition;
	information = dia_garond_gorn_info;
	permanent = FALSE;
	description = "� ����, ����� �� ��������� �����.";
};


func int dia_garond_gorn_condition()
{
	if(Npc_KnowsInfo(other,dia_miltenow_gorn) && (KAPITEL == 2) && Npc_KnowsInfo(other,dia_garond_needproof))
	{
		return TRUE;
	};
};

func void dia_garond_gorn_info()
{
	AI_Output(other,self,"DIA_Garond_Gorn_15_00");	//� ����, ����� �� ��������� �����.
	AI_Output(self,other,"DIA_Garond_Gorn_10_01");	//� �� ���� ��������� ���. �� �������� ������� ����� ������������ � ������ ����������� �� ���.
	AI_Output(other,self,"DIA_Garond_Gorn_15_02");	//���� � ��������� ����� �� ����?
	AI_Output(self,other,"DIA_Garond_Gorn_10_03");	//��� �������� - �� ��������� ���� ����� ��������. � ���� �������� �� ����� 1000 �������.
	AI_Output(other,self,"DIA_Garond_Gorn_15_04");	//��� �������� �����.
	AI_Output(self,other,"DIA_Garond_Gorn_10_05");	//���� ����� ���� �� ���������. ������� ��� ��� ������, � � �������� ���.
	MIS_RESCUEGORN = LOG_RUNNING;
	b_logentry(TOPIC_RESCUEGORN,"������ ������� ������ ������� ����� �� ������������ �����.");
};


instance DIA_GAROND_PAY(C_INFO)
{
	npc = pal_250_garond;
	nr = 4;
	condition = dia_garond_pay_condition;
	information = dia_garond_pay_info;
	permanent = TRUE;
	description = "� ���� ������ ������� �����. (��������� 1000 �����)";
};


func int dia_garond_pay_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_garond_pay_info()
{
	AI_Output(other,self,"DIA_Garond_Pay_15_00");	//� ���� ������ ����� �������.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_01");	//������. �� ������ ����� � �������� � ������� ���, ��� � ���������� ���������� �����.
		GAROND_KERKERAUF = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"� �������� �������. ������ � ���� ���������� ����� �� �������. �������� ������� �� ����� ��������������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_Pay_10_02");	//����� ������� ��� 1000 ������� �����.
	};
};


instance DIA_GAROND_PERM2(C_INFO)
{
	npc = pal_250_garond;
	nr = 9;
	condition = dia_garond_perm2_condition;
	information = dia_garond_perm2_info;
	permanent = TRUE;
	description = "��� �� ���������� ������ ������?";
};


func int dia_garond_perm2_condition()
{
	if(Npc_KnowsInfo(other,dia_garond_success) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_garond_perm2_info()
{
	AI_Output(other,self,"DIA_Garond_Perm2_15_00");	//��� �� ���������� ������ ������?
	AI_Output(self,other,"DIA_Garond_Perm2_10_01");	//� ��� ��� ������������. �� - ��� ������������ �������, ��� ���� ����� ������� ��� ������������.
	AI_Output(self,other,"DIA_Garond_Perm2_10_02");	//�� �� �� ����� ����� � ����� �������� ������, ����� �� �� ������� ��� ��� ����� ��������� � ���� ������� ���.
};


instance DIA_GAROND_KAP3_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap3_exit_condition;
	information = dia_garond_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_garond_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_WASGIBTSNEUES(C_INFO)
{
	npc = pal_250_garond;
	nr = 30;
	condition = dia_garond_wasgibtsneues_condition;
	information = dia_garond_wasgibtsneues_info;
	permanent = TRUE;
	description = "��� ������?";
};


func int dia_garond_wasgibtsneues_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_garond_wasgibtsneues_info()
{
	AI_Output(other,self,"DIA_Garond_WASGIBTSNEUES_15_00");	//��� ������?
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_01");	//����. ��� �� ��� ����������? ��� ����� ������������!
	AI_Output(self,other,"DIA_Garond_WASGIBTSNEUES_10_02");	//���� ������ ������� �����. �� ��� �� ����� ��������� ������� - ��� ����� ������� ������������!
};


instance DIA_GAROND_KAP4_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap4_exit_condition;
	information = dia_garond_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_garond_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_BACKINKAP4(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_backinkap4_condition;
	information = dia_garond_backinkap4_info;
	permanent = FALSE;
	description = "� ��������.";
};


func int dia_garond_backinkap4_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_garond_backinkap4_info()
{
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_00");	//� ��������.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_01");	//� ��� ��� ����. � ��� ������ ������������?
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_02");	//���� ����� ��������, ��� ������ �� ���� ����������. ������� ����� ���������.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_03");	//���� ��� �� �������. ��� ����� ������. ���� ��� ��������� � ���������. ��� �� ������������ �����.
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_04");	//��� ���� ��������, � � ��� ������������� ��������.
	AI_Output(other,self,"DIA_Garond_BACKINKAP4_15_05");	//������� ���������.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_06");	//�� ������ � ���� ���� � ����� ������, ��������� �� ��������, ��� ��? ��, �������, ������ ������ ���, �� ��� ������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_07");	//�� ������ � ���� ��������� �� ��������? ���, �������, ����� ������ ���, �� �� ������� ����.
	};
	AI_Output(self,other,"DIA_Garond_BACKINKAP4_10_08");	//���� ����� �� ������� � ��������� ����� ����� �����, � ������ �� ���� �������������.
	b_initnpcglobals();
	AI_Teleport(djg_angar,"OW_DJG_WATCH_STONEHENGE_01");
	b_startotherroutine(djg_angar,"Start");
	DJG_ANGAR_SENTTOSTONES = TRUE;
	b_startotherroutine(kjorn,"START");
	b_startotherroutine(godar,"START");
	b_startotherroutine(hokurn,"START");
	b_startotherroutine(pc_fighter_djg,"START");
	b_startotherroutine(kurgan,"START");
	if(DJG_BIFFPARTY == FALSE)
	{
		b_startotherroutine(biff,"START");
	};
};


instance DIA_GAROND_DRAGONPLETTBERICHT(C_INFO)
{
	npc = pal_250_garond;
	nr = 11;
	condition = dia_garond_dragonplettbericht_condition;
	information = dia_garond_dragonplettbericht_info;
	permanent = TRUE;
	description = "������ �������� ...";
};


var int dia_garond_dragonplettbericht_noperm;

func int dia_garond_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_garond_backinkap4) && (DIA_GAROND_DRAGONPLETTBERICHT_NOPERM == FALSE))
	{
		return TRUE;
	};
};


var int garond_dragoncounter;
var int garond_swampdragonkilled_onetime;
var int garond_rockdragonkilled_onetime;
var int garond_firedragonkilled_onetime;
var int garond_icedragonkilled_onetime;
var int garond_oricexperte_onetime;

func void dia_garond_dragonplettbericht_info()
{
	var int currentdragoncount;
	var int drachengeld;
	var int xp_localgarond;
	b_logentry(TOPIC_DRACHENJAGD,"������� �� ����� ������ ������ ������������, ��� ������� ���� � ���������, ���� ��� �������, ��� �� ��� ���������.");
	if(GAROND_DRAGONCOUNTER < MIS_KILLEDDRAGONS)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_00");	//� ���� ���� ������� � ��������.
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_01");	//����������.
		currentdragoncount = 0;
		if(Npc_IsDead(swampdragon) && (GAROND_SWAMPDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_02");	//� ���� ������� � ������ � ������� ������.
			GAROND_SWAMPDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(rockdragon) && (GAROND_ROCKDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_03");	//������ � �������� ��������, � ��� ������, �����.
			GAROND_ROCKDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(firedragon) && (GAROND_FIREDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_04");	//�������� ������ �� ������� �� ��� ������ �� ����� ���������� ���.
			GAROND_FIREDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		if(Npc_IsDead(icedragon) && (GAROND_ICEDRAGONKILLED_ONETIME == FALSE))
		{
			AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_05");	//� ��� � �������� ������� ������ � ����������� � ��������, ��������� ���.
			GAROND_ICEDRAGONKILLED_ONETIME = TRUE;
			currentdragoncount = currentdragoncount + 1;
		};
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_06");	//��� ������� �������. ���. ������ ��� ������. �������, ��� ������� ���� �������� ���� ����������.
		drachengeld = currentdragoncount * GAROND_KILLEDDRAGONGELD;
		xp_localgarond = currentdragoncount * XP_GAROND_KILLEDDRAGON;
		b_giveplayerxp(xp_localgarond);
		CreateInvItems(self,itmi_gold,drachengeld);
		b_giveinvitems(self,other,itmi_gold,drachengeld);
		GAROND_DRAGONCOUNTER = MIS_KILLEDDRAGONS;
		if(MIS_ALLDRAGONSDEAD == TRUE)
		{
			DIA_GAROND_DRAGONPLETTBERICHT_NOPERM = TRUE;
		};
	};
	if((GAROND_ORICEXPERTE_ONETIME == FALSE) && (Npc_IsDead(oric) == FALSE) && (MIS_ALLDRAGONSDEAD == FALSE))
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_07");	//�� ������ ��� ���-������ ���������� � ��������?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_08");	//��� ����� ���������� ������� ������. ����� ��� ��������-������� ���� ��������� ���� �� ����.
		b_logentry(TOPIC_DRACHENJAGD,"� ������� �������, ����������� �� ���������, �����, �������� ���� �������� ���������� ��� ����.");
		GAROND_ORICEXPERTE_ONETIME = TRUE;
	}
	else if(MIS_ALLDRAGONSDEAD == FALSE)
	{
		AI_Output(other,self,"DIA_Garond_DragonPlettBericht_15_09");	//��������� ����� ���� ��� ��������� ��������?
		AI_Output(self,other,"DIA_Garond_DragonPlettBericht_10_10");	//�� �������, ���. � ��������� ������ ��� �������� �������.
	};
};


instance DIA_GAROND_ALLDRAGONDEAD(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_alldragondead_condition;
	information = dia_garond_alldragondead_info;
	permanent = FALSE;
	description = "��� ������� ������.";
};


func int dia_garond_alldragondead_condition()
{
	if((MIS_ALLDRAGONSDEAD == TRUE) && (DIA_GAROND_DRAGONPLETTBERICHT_NOPERM == TRUE) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_garond_alldragondead_info()
{
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_00");	//��� ������� ������.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_01");	//(�����������) ���? �� ���� ��� ������� ������ ������?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_02");	//���. ������� �� ������������.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_03");	//����� �� ������� ���� �������������� �����?
	AI_Output(other,self,"DIA_Garond_AllDragonDead_15_04");	//��, ��� ���, �� � ��� ����� ���� ���� ������. �� ������ ���������� � ��� ����.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_05");	//�, � ���������, ����� �� ���� ���� ������. � ������ �������� ����, � ��� ��������� ����, ������, ���� ��� ��� �����.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_06");	//���� �������� ������� ��� ������.
	AI_Output(self,other,"DIA_Garond_AllDragonDead_10_07");	//�� ������� ���� �����.
};


instance DIA_GAROND_JANBECOMESMITH(C_INFO)
{
	npc = pal_250_garond;
	nr = 12;
	condition = dia_garond_janbecomesmith_condition;
	information = dia_garond_janbecomesmith_info;
	permanent = TRUE;
	description = "� ���� ���������� � �������.";
};


func int dia_garond_janbecomesmith_condition()
{
	if((MIS_JANBECOMESSMITH == LOG_RUNNING) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_garond_janbecomesmith_info()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_00");	//� ���� ���������� � �������.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_01");	//����� �������? �� �����.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_02");	//�� ��� ��������? ����� ������ ������� ���...
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_03");	//���, � ������ � ���.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_04");	//�� ������� �� ��������, ��� � �, � ������� ������.
	}
	else
	{
		AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_05");	//����� �� ��������� �� ��������. �� ������.
	};
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_06");	//��� ������. ��� ���������� ������ ������, ����.
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_07");	//�� ����� �� ���������� � �������.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_08");	//�������. ��� �� �������, � ���� �������� ���?
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_15_09");	//��.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_10");	//���� �� ��� ������, �� �� ������ ���������� �� ����.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_10_11");	//���� ��-�� ���� ��������� ��������, �� ��� �������� ��. ��������?
	Info_ClearChoices(dia_garond_janbecomesmith);
	Info_AddChoice(dia_garond_janbecomesmith,"� ������� ��� ����.",dia_garond_janbecomesmith_no);
	Info_AddChoice(dia_garond_janbecomesmith,"� ������� �� ���.",dia_garond_janbecomesmith_yes);
};

func void dia_garond_janbecomesmith_no()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_No_15_00");	//� ������� ��� ����.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_01");	//��� � ���� �������� ���, ���� ���� �� ������������ � ���?
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_No_10_02");	//���� �� ���� ����� �� ������ ����������, ���� �� �� �������� ������� �� �������� � �������.
	Info_ClearChoices(dia_garond_janbecomesmith);
};

func void dia_garond_janbecomesmith_yes()
{
	AI_Output(other,self,"DIA_Garond_JanBecomeSmith_Yes_15_00");	//� ������� �� ���.
	AI_Output(self,other,"DIA_Garond_JanBecomeSmith_Yes_10_01");	//������. �� ����� �������� � �������. ��, ������� ��, �� ������ ������������ ���� ����� ������.
	Info_ClearChoices(dia_garond_janbecomesmith);
	MIS_JANBECOMESSMITH = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_GAROND_KAP5_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap5_exit_condition;
	information = dia_garond_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_garond_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GAROND_PERM5(C_INFO)
{
	npc = pal_250_garond;
	nr = 59;
	condition = dia_garond_perm5_condition;
	information = dia_garond_perm5_info;
	permanent = TRUE;
	description = "��� ��������?";
};


func int dia_garond_perm5_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_garond_perm5_info()
{
	AI_Output(other,self,"DIA_Garond_PERM5_15_00");	//��� ����������?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_01");	//��� �� ������! �����-�� ������� ������� ��������� ������� ������. ������ �� �������� ������ ��� ������.
		AI_Output(self,other,"DIA_Garond_PERM5_10_02");	//��, �������� � �� ����� ���������...
	}
	else
	{
		AI_Output(self,other,"DIA_Garond_PERM5_10_03");	//�� ��� ����� ������ ��� ����, ���� ����� �� �������� ��� ����� ������.
	};
};


instance DIA_GAROND_KAP6_EXIT(C_INFO)
{
	npc = pal_250_garond;
	nr = 999;
	condition = dia_garond_kap6_exit_condition;
	information = dia_garond_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_garond_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_garond_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

