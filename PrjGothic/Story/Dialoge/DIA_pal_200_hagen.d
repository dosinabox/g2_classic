
instance DIA_HAGEN_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_hagen_exit_condition;
	information = dia_hagen_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hagen_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_hagen_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_lastpetzcounter;
var int hagen_lastpetzcrime;

instance DIA_HAGEN_PMSCHULDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_pmschulden_condition;
	information = dia_hagen_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (HAGEN_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= HAGEN_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_hagen_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Hagen_PMSchulden_04_00");	//������, ��� �� ������. �� ������ ��������� ����� ����� ������.
	if(b_gettotalpetzcounter(self) > HAGEN_LASTPETZCOUNTER)
	{
		diff = b_gettotalpetzcounter(self) - HAGEN_LASTPETZCOUNTER;
		if(diff > 0)
		{
			HAGEN_SCHULDEN = HAGEN_SCHULDEN + (diff * 50);
		};
		if(HAGEN_SCHULDEN > 1000)
		{
			HAGEN_SCHULDEN = 1000;
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_01");	//�� �� �����-�� �������� ���������� � ������� ������, ��?
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_02");	//������ ����� ������������ ��� ������ � ������.
		if(HAGEN_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_03");	//� �� ������ ���, ��� �� �� ���� �����!
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_04");	//�� ��������� ������������ �����.
			b_say_gold(self,other,HAGEN_SCHULDEN);
		};
	}
	else if(b_getgreatestpetzcrime(self) < HAGEN_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_05");	//������, �������� ����������.
		if(HAGEN_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_06");	//������ ��� ���������� ��������, ������������ �����!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_THEFT) || ((HAGEN_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_07");	//����� ������ �� ����� �����������, ��� �� �������!
		};
		if((HAGEN_LASTPETZCRIME == CRIME_ATTACK) || ((HAGEN_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_08");	//������ ��� ���������� ����� �����.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_09");	//��� ��������� ������ ���� ������ �� ������� �������������.
		};
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_10");	//� �� ����, ��� ��������� � ������, � �� ���� �����.
		AI_Output(self,other,"DIA_Hagen_PMSchulden_04_11");	//������ ����������, ����� � ���� �� ���� ������� �����.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_12");	//��� �� �� �� ����, � ����� �������� ���� �����������.
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_13");	//������, ����� ����� ������ �� �����������.
			HAGEN_SCHULDEN = 0;
			HAGEN_LASTPETZCOUNTER = 0;
			HAGEN_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_14");	//��, ��� �� �����, ��������� ����� � ������ ������.
			b_say_gold(self,other,HAGEN_SCHULDEN);
			AI_Output(self,other,"DIA_Hagen_PMSchulden_04_15");	//����, �� ������ �������?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_hagen_pmschulden);
		Info_ClearChoices(dia_hagen_petzmaster);
		Info_AddChoice(dia_hagen_pmschulden,"� ���� ��� ������� ������!",dia_hagen_petzmaster_paylater);
		Info_AddChoice(dia_hagen_pmschulden,"������� ��� �����?",dia_hagen_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
		{
			Info_AddChoice(dia_hagen_pmschulden,"� ���� ��������� �����!",dia_hagen_petzmaster_paynow);
		};
	};
};

func void dia_hagen_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Hagen_PMSchulden_HowMuchAgain_15_00");	//������� ��� �� ���� ���?
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_pmschulden,"� ���� ��� ������� ������!",dia_hagen_petzmaster_paylater);
	Info_AddChoice(dia_hagen_pmschulden,"������� ��� �����?",dia_hagen_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_pmschulden,"� ���� ��������� �����!",dia_hagen_petzmaster_paynow);
	};
};


instance DIA_HAGEN_PETZMASTER(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_hagen_petzmaster_condition;
	information = dia_hagen_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hagen_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > HAGEN_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_hagen_petzmaster_info()
{
	HAGEN_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_00");	//���� ����� ��������� ����. �� ������� ������ ������.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_01");	//�� ���� � ������ �� ���.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_02");	//�������� - ��������� ������������!
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		HAGEN_SCHULDEN = HAGEN_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_03");	//�� ������ ��� � ������ ����������.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_04");	//������ ��������� ������� ����� �� �����.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_05");	//�������� ����������� � ���� ������. �� �� ������ ����������� ���� ���������, �������� �����
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_06");	//�� ����������� � ���������!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_07");	//�� ������ ��� � ������ �������������, � ������� � ������.
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_08");	//��� ��������� ������� ������. �� ������ ��������� �����.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_09");	//�� �������� � �����. ����� ������� �� ������� �����.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_10");	//� ��� ��� ��� � �����?
		};
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_11");	//��������� ������� ������ - ��� ��������� ������� ������.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_12");	//�������������, �� ������ ��������� �� ���.
		HAGEN_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_13");	//�� ���� ���� ���� - � ������� ���� �� ������� � ���.
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_14");	//����� �� ������� ��� ���?!
		AI_Output(self,other,"DIA_Hagen_PETZMASTER_04_15");	//�� ������ ��������� �����������!
		HAGEN_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_15_16");	//�������?
	if(HAGEN_SCHULDEN > 1000)
	{
		HAGEN_SCHULDEN = 1000;
	};
	b_say_gold(self,other,HAGEN_SCHULDEN);
	Info_ClearChoices(dia_hagen_pmschulden);
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_AddChoice(dia_hagen_petzmaster,"� ���� ��� ������� ������!",dia_hagen_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= HAGEN_SCHULDEN)
	{
		Info_AddChoice(dia_hagen_petzmaster,"� ���� ��������� �����!",dia_hagen_petzmaster_paynow);
	};
};

func void dia_hagen_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayNow_15_00");	//� ���� ��������� �����!
	b_giveinvitems(other,self,itmi_gold,HAGEN_SCHULDEN);
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayNow_04_01");	//������! � ����������, ����� ��� � ������ ������ �� ����. ��� � ��������� ������� ����������� ���� ���������.
	b_grantabsolution(LOC_CITY);
	HAGEN_SCHULDEN = 0;
	HAGEN_LASTPETZCOUNTER = 0;
	HAGEN_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_hagen_petzmaster);
	Info_ClearChoices(dia_hagen_pmschulden);
};

func void dia_hagen_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Hagen_PETZMASTER_PayLater_15_00");	//� ���� ��� ������� ������!
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_01");	//����� ���������� � ���, ����� ��������� ��� ������ ��� ����� �������.
	AI_Output(self,other,"DIA_Hagen_PETZMASTER_PayLater_04_02");	//� � ������������ ����: ���� �� ��� ���� ��������� ���� ����, �� ������ �� �����������.
	HAGEN_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	HAGEN_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_HALLO(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_hallo_condition;
	information = dia_lord_hagen_hallo_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_lord_hagen_hallo_condition()
{
	if((hero.guild != GIL_NONE) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_hallo_info()
{
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_00");	//� ��� ������ � ����.
	if(Npc_KnowsInfo(other,dia_lothar_eyeinnos) || (ANDRE_EYEINNOS == TRUE))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_03");	//����� ����������, ��� �� ������ ���������� �� ����.
		AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_01");	//�� ���������, ������� ������� ���� ������.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_02");	//� ���� �����.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_03");	//������� ������, ���� ������ ������� ������ � ����������������� ��������.
	AI_Output(self,other,"DIA_Lord_Hagen_Hallo_04_04");	//� ����� ������� �������. ������� �� ����� ��� ����� �������. � ������ �����, ����� �� �����.
};


instance DIA_LORD_HAGEN_FRIEDEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_frieden_condition;
	information = dia_lord_hagen_frieden_info;
	permanent = FALSE;
	description = "� ������ ����������� ���� �� ���������!";
};


func int dia_lord_hagen_frieden_condition()
{
	if((MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) && (Npc_HasItems(other,itwr_passage_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_frieden_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Frieden_15_00");	//� ������ ����������� ���� �� ���������!
	b_giveinvitems(other,self,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_01");	//(��������������) ��... ������!
	b_usefakescroll();
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_02");	//� ���� �������� ��. ��� ����� �������� �� ���������������, ��� ������� �� ��� ���������� � �������������� ������� � �������.
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_03");	//� ������ ��� ����������� ���������. � ����� �������� ��� ����������� - �� ������ ���!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_04");	//��� �� �������� ��� �����, �������. ����������� �� ��� - ����������� ���������� � ����������� ���������!
	AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_05");	//� �� �� ��� �� ������� ��. ������ ��� � �������� ��.
	HAGEN_FRIEDENABGELEHNT = TRUE;
	if(!Npc_KnowsInfo(other,dia_lord_hagen_armee))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Frieden_04_06");	//��� ���?
	};
	b_logentry(TOPIC_FRIEDEN,"���� ����� ����� �������� �������� ��, �� �� ������ ���������.");
};


instance DIA_LORD_HAGEN_ARMEE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_armee_condition;
	information = dia_lord_hagen_armee_info;
	permanent = FALSE;
	description = "���� ��� ���������� ����� ������ ������. � ������ ��������.";
};


func int dia_lord_hagen_armee_condition()
{
	if((!MIS_LEE_FRIEDENSANGEBOT == LOG_RUNNING) || (HAGEN_FRIEDENABGELEHNT == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_armee_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_00");	//���� ��� ���������� ����� ������ ������. � ������ ��������.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_01");	//� ������ ��������? �� ��������� ���� ����������. �� ��� ����� �������� ��������, ��� ������ ����������� ������.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_02");	//�� �� ���� ������� �� ���� �� �������� ������� �������� �� ����� ���.
	if(Npc_KnowsInfo(other,dia_lord_hagen_frieden))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_03");	//���, ���, ����� ������, ����� � �������, ��� ��� ���������� ��������� ���� � ����������?
		AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_04");	//���.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_05");	//(�����������) ��� ��� ��� �� �����?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_06");	//����� ��������, ������� ������� ������ ���� ���� ������������.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_07");	//��������? �������� ��������� ��������, �������� �� ������ ��� ����� �����.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_08");	//����� ��� - ������ � ������ ������ ����, ��� �� ��������?
	AI_Output(other,self,"DIA_Lord_Hagen_Armee_15_09");	//������ �� � ���, ������ �� �� ��� ������. ������ � ���, ������ �� �� ���� ��������� �� �������� ��� � ������, ���� � ������ ������.
	AI_Output(self,other,"DIA_Lord_Hagen_Armee_04_10");	//���� � �� ������ �������������, � �� ���� ��������� ���� ������� ��� ����� ����.
};


instance DIA_LORD_HAGEN_PROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_proof_condition;
	information = dia_lord_hagen_proof_info;
	permanent = FALSE;
	description = "�� ���� �� ������, ����� � ������ ���� ��������������?";
};


func int dia_lord_hagen_proof_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_proof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_00");	//�� ���� �� ������, ����� � ������ ���� ��������������?
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_01");	//������. ������ ����� ������ � ������ ��������. ����� �� ������ ���, ����� ���� ����������, � ����� �� ������� ��, �������� � ����������� ��������.
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_02");	//���� �� ���-�� ����� ���� ����� �������� ���.
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_03");	//���� �� ���������� ���� �����, � ���� ����� ������ ����.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_04");	//������ �� ���, ��� �� ������ ��� ���� ������?
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_05");	//���� ������... ������. ������� ��� ��������������, � � �����������, ����� ���� ���� ��������� ������ ���� ������.
	AI_Output(other,self,"DIA_Lord_Hagen_Proof_15_06");	//�� ���� � ���� �������, ��� �� ��� �����?
	AI_Output(self,other,"DIA_Lord_Hagen_Proof_04_07");	//������, ��� ��� � ������������� ��� ���.
};


instance DIA_LORD_HAGEN_AUGE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_auge_condition;
	information = dia_lord_hagen_auge_info;
	permanent = FALSE;
	description = "��� �� ������ � ����� ������?";
};


func int dia_lord_hagen_auge_condition()
{
	return TRUE;
};

func void dia_lord_hagen_auge_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_00");	//��� �� ������ � ����� ������?
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_01");	//��� ������������ ��������. (���������) � ������� ������������ �� ����������� � ����� � ���������.
	AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_02");	//������ ������� ����� �������, ��� ��� ����� ������ ������ ��������� ������.
	if(other.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Auge_15_03");	//� � ���� ��������� ������!
		AI_Output(self,other,"DIA_Lord_Hagen_Auge_04_04");	//�����, ��������, �� ������������� ������� �������� ���� ������.
	};
};


instance DIA_LORD_HAGEN_PASS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_pass_condition;
	information = dia_lord_hagen_pass_info;
	permanent = FALSE;
	description = "��� � ������ ����� ������?";
};


func int dia_lord_hagen_pass_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_proof) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_pass_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Pass_15_00");	//��� � ������ ����� ������?
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_01");	//� ��� ���� ���� �� ����� �������. ������ ���� ������ �������� ������, ��� ���������� ����� ����� �����.
	AI_Output(self,other,"DIA_Lord_Hagen_Pass_04_02");	//�� ������� ���� �����.
	AI_StopProcessInfos(self);
	MIS_OLDWORLD = LOG_RUNNING;
	b_kapitelwechsel(2,NEWWORLD_ZEN);
	CreateInvItems(self,itke_pass_mis,1);
	b_giveinvitems(self,other,itke_pass_mis,1);
	Log_CreateTopic(TOPIC_MISOLDWORLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MISOLDWORLD,LOG_RUNNING);
	b_logentry(TOPIC_MISOLDWORLD,"���� ����� �����, ����� � ������ ��� �������������� ������������� ����� ���. � ������ ����������� � ������ �������� � ���������� � ����������� ��������.");
	b_startotherroutine(fernando,"WAIT");
};


instance DIA_LORD_HAGEN_KHORINIS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_khorinis_condition;
	information = dia_lord_hagen_khorinis_info;
	permanent = FALSE;
	description = "����� �� ������ � �������?";
};


func int dia_lord_hagen_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_armee) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_khorinis_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Khorinis_15_00");	//����� �� ������ � �������?
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_01");	//�� ��������� ������ ������� �����������. ������� ��� ������� ��������������� �� ������ ������.
	AI_Output(self,other,"DIA_Lord_Hagen_Khorinis_04_02");	//� ������� ����, ��� �� ��������� ���������� � ������ ��������. ��� ������� ������� ������ ����������� �����.
};


instance DIA_LORD_HAGEN_MINENTAL(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_minental_condition;
	information = dia_lord_hagen_minental_info;
	permanent = TRUE;
	description = "� ��� ���� ���� ������ � ������ ��������?";
};


func int dia_lord_hagen_minental_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_khorinis) && (KNOWSPALADINS_ORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_minental_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_00");	//� ��� ���� ���� ������ � ������ ��������?
	if(!Npc_KnowsInfo(other,dia_lord_hagen_proof))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_01");	//� �� ���� ������ ������������ ���� �� ����!
	}
	else
	{
		if(Npc_KnowsInfo(other,dia_garond_needproof))
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_02");	//�� ��� ���. �� ������ �����.
		}
		else
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_03");	//������, ��� ��� �� ��� ����� ����� ����, � ��� �� �������� ����.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_04");	//�������� ����� - ���������� ����. ��� ����� ������ ����� ���� �����.
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_05");	//��� ������������ ���������� ������ �� ���������� ���� � ����������� ����� ��� �� ������� ����� ������ ������� ������ �����.
		if(other.guild != GIL_SLD)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_06");	//� ����� � ���������� �����, ����������� �� �������, - ���������, � ������� � ��� ��� ���� ������.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_07");	//��� ������ ��� ������� ����� �������� �����, �� ���������� �����, �� �������.
		KNOWSPALADINS_ORE = TRUE;
		AI_Output(other,self,"DIA_Lord_Hagen_Minental_15_08");	//������, ����� ������ ����� ���� �����, ��?
		AI_Output(self,other,"DIA_Lord_Hagen_Minental_04_09");	//� � ��� ������ ���� ������� �����.
	};
};


instance DIA_HAGEN_CANTEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_hagen_canteach_condition;
	information = dia_hagen_canteach_info;
	permanent = FALSE;
	description = "� ��� �������-�������.";
};


func int dia_hagen_canteach_condition()
{
	if((LORDHAGEN_TEACH2H == FALSE) && (other.guild == GIL_PAL) && (other.hitchance[NPC_TALENT_2H] >= 90) && (other.hitchance[NPC_TALENT_2H] < 100))
	{
		return TRUE;
	};
};

func void dia_hagen_canteach_info()
{
	AI_Output(other,self,"DIA_Hagen_CanTeach_15_00");	//� ��� �������-�������.
	AI_Output(self,other,"DIA_Hagen_CanTeach_04_01");	//��? ������, ��� �� ����� ���.
	LORDHAGEN_TEACH2H = TRUE;
	b_logentry(TOPIC_CITYTEACHER,"���� ����� ����� ������� ���� ��������� ��������� �������.");
};


instance DIA_HAGEN_TEACH(C_INFO)
{
	npc = pal_200_hagen;
	nr = 100;
	condition = dia_hagen_teach_condition;
	information = dia_hagen_teach_info;
	permanent = TRUE;
	description = "��������� � ��������! (������� ��� ��������� �������)";
};


var int dia_hagen_teach_permanent;

func int dia_hagen_teach_condition()
{
	if((LORDHAGEN_TEACH2H == TRUE) && (DIA_HAGEN_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_hagen_teach_info()
{
	AI_Output(other,self,"DIA_Hagen_Teach_15_00");	//��������� � ��������!
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_back()
{
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Hagen_Teach_04_00");	//�� ���� ������������ ��������. ��� ������ ������ ����� ����.
		AI_Output(self,other,"DIA_Hagen_Teach_04_01");	//�� ����� ���� ���� � ������� ���������� �������� �������-�������.
		DIA_HAGEN_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_hagen_teach);
};

func void dia_hagen_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_hagen_teach_2h_5);
};

func void dia_hagen_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(dia_hagen_teach);
	Info_AddChoice(dia_hagen_teach,DIALOG_BACK,dia_hagen_teach_back);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_hagen_teach_2h_1);
	Info_AddChoice(dia_hagen_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_hagen_teach_2h_5);
};


instance DIA_LORD_HAGEN_KNIGHT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 990;
	condition = dia_lord_hagen_knight_condition;
	information = dia_lord_hagen_knight_info;
	permanent = TRUE;
	description = "� ���� ��������� �� ������ � �����.";
};


func int dia_lord_hagen_knight_condition()
{
	if(hero.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_knight_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_15_00");	//� ���� ��������� �� ������ � �����.
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_01");	//������, �� �������, ��� � ���� ���� ��������, ���� � ������, ����� ������� ������.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_02");	//���� ���� ��������������� � ���, ��� � ���� ������ ������.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_03");	//���� ������ ���� �������, ��� ����� � �������� ������ ����.
		Info_ClearChoices(dia_lord_hagen_knight);
		Info_AddChoice(dia_lord_hagen_knight,"� ��� �� ������ ������.",dia_lord_hagen_knight_no);
		Info_AddChoice(dia_lord_hagen_knight,"� �����!",dia_lord_hagen_knight_yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_04");	//����� ������ ������ �������� ��������� ��������� ���� �������� ������.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_05");	//������ ����� ����������� � ������������ ����� ����� ���� ������� � �����.
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_04_06");	//���� �� ������ ����� ����� ���������, �� ������ ��������, ��� ������� �����.
	};
	HAGEN_GAVEINFOKNIGHT = TRUE;
};

func void dia_lord_hagen_knight_no()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_No_15_00");	//� ��� �� ������ ������.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_No_04_01");	//����� ��� � �������� ���� ������ �� ��������. �����������, ����� ������ �����.
	Info_ClearChoices(dia_lord_hagen_knight);
};

func void dia_lord_hagen_knight_yes()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_00");	//� �����!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_01");	//(������������) ����� ��� ���� � ����!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_02");	//(������������) ����� ����� �������� �� ���� ���� � ������ ���� ����� �� ��� ������.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_03");	//(������������) �� ���������, ��� ���� ���� �� �������� �� ����� � ����� ����������� ������?
	AI_Output(other,self,"DIA_Lord_Hagen_Knight_Yes_15_04");	//�������!
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_05");	//����� ������ �� ������������ � ������ ��������.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_06");	//� ��������� ���� � ����� ������.
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_07");	//� ��� ���� ������ � ������� ������. ���� �� � ���������, ������!
	CreateInvItems(self,itar_pal_m,1);
	b_giveinvitems(self,other,itar_pal_m,1);
	if(other.hitchance[NPC_TALENT_2H] >= other.hitchance[NPC_TALENT_1H])
	{
		CreateInvItems(self,itmw_2h_pal_sword,1);
		b_giveinvitems(self,other,itmw_2h_pal_sword,1);
	}
	else
	{
		CreateInvItems(self,itmw_1h_pal_sword,1);
		b_giveinvitems(self,other,itmw_1h_pal_sword,1);
	};
	AI_UnequipArmor(other);
	AI_EquipArmor(other,itar_pal_m);
	AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_08");	//� ����� ������� ��������� ������ ����� �� ������ ����� ������ � ���������.
	if(Npc_IsDead(albrecht) == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Knight_Yes_04_09");	//�������� ������ ���� �����, ��� � �������� � ���.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_02");	//�, ������� ��, ���� ������� � ������� ����� ������ ������ ������� ��� ����.
	hero.guild = GIL_PAL;
	Npc_SetTrueGuild(other,GIL_PAL);
	Info_ClearChoices(dia_lord_hagen_knight);
};


instance DIA_LORD_HAGEN_WHATPROOF(C_INFO)
{
	npc = pal_200_hagen;
	nr = 991;
	condition = dia_lord_hagen_whatproof_condition;
	information = dia_lord_hagen_whatproof_info;
	permanent = FALSE;
	description = "��� � ���� ��������, ��� �������?";
};


func int dia_lord_hagen_whatproof_condition()
{
	if((HAGEN_GAVEINFOKNIGHT == TRUE) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_whatproof_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_00");	//��� � ���� ��������, ��� �������?
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_01");	//���� ���� �������, ������� �� ��� ���.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_02");	//�� ��������� �� ������� � �������������� �� ��� ������.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_03");	//�� ��������� ������ ������� � ��� ������������, ������� ������ ���������� ����� ������.
	AI_Output(other,self,"DIA_Lord_Hagen_WhatProof_15_04");	//� �������.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_05");	//�� ������ �� ���������! ���� ����� - ���� �����, � ���� ����� - �����.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_06");	//������� ���� � ��� � ������ ������ �� �����, � ������ �� ��� �������� ���� ����� �� ������ ������ ������ ����� �� ����.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_07");	//��� �� ��� ���� ��������� ���� ���� ������. ���� �� �������� ���������, �� ��������� ������ ����� ������ ���������.
	AI_Output(self,other,"DIA_Lord_Hagen_WhatProof_04_08");	//������ ���, ��� ������� �������� ���, ������� ���� ���������.
};


instance DIA_LORD_HAGEN_KAP3_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap3_exit_condition;
	information = dia_lord_hagen_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hagen_knowseyekaputt;

instance DIA_LORD_HAGEN_KAP3U4_PERM(C_INFO)
{
	npc = pal_200_hagen;
	nr = 998;
	condition = dia_lord_hagen_kap3u4_perm_condition;
	information = dia_lord_hagen_kap3u4_perm_info;
	permanent = TRUE;
	description = "��� ��������?";
};


func int dia_lord_hagen_kap3u4_perm_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap3u4_perm_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_KAP3U4_PERM_15_00");	//��� ��������?
	if(MIS_OLDWORLD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_04");	//� ������ ����� ������ ������ ��� ����������.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_05");	//�� ������ ������� ���-�� � ���������.
		if(HAGEN_KNOWSEYEKAPUTT == FALSE)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_Add_04_06");	//(���� ��� ���) ��������, ���� ������ ����� ������ ��� ����...
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_01");	//� � ��� ����� �����. � ������, � �� ��������.
		AI_Output(self,other,"DIA_Lord_Hagen_KAP3U4_PERM_04_02");	//��-�� ���� ���� �������� ������, ��� � ������ ������, � ��� ����� ����� �������� �� ������ � ����.
	};
};


instance DIA_LORD_HAGEN_EYEBROKEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 1;
	condition = dia_lord_hagen_eyebroken_condition;
	information = dia_lord_hagen_eyebroken_info;
	permanent = FALSE;
	description = "���� � ����, �� �� ���������.";
};


func int dia_lord_hagen_eyebroken_condition()
{
	if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_eyebroken_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_07");	//���� � ����, �� �� ���������.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_08");	//���? �, �����! ��� �� �������? ��� ����� ���� ����!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_09");	//�������� � ���������! ������ ���� ������ ������������ ���.
	HAGEN_KNOWSEYEKAPUTT = TRUE;
};


instance DIA_LORD_HAGEN_BACKINTOWN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 2;
	condition = dia_lord_hagen_backintown_condition;
	information = dia_lord_hagen_backintown_info;
	permanent = FALSE;
	description = "� ������ ���� ������� �� �������.";
};


func int dia_lord_hagen_backintown_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) >= 1) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_backintown_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_00");	//� ������ ���� ������� �� �������. ���, �� �������� ��� ������ ��� ����.
	b_giveinvitems(other,self,itwr_paladinletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_01");	//���� �������� ����, ��� � ��������. �� ������ ��� � �������� � ������ ��������.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_02");	//�������� ������� � ����� ������ ��������, ���������� ������.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_03");	//��� �������� ����� ����� � ������������� ��������� � ������ ����� ���� ����.
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_04");	//�, ������ ��������, ��� ������ ����� �� ���� ����� ������ �����. ��� ����� ����.
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_05");	//� ������ ����� ������ ������ ��� ����������. �� ������ ������ ��� ���. ����� ���������� ����...
	AI_Output(other,self,"DIA_Lord_Hagen_BACKINTOWN_15_06");	//��� �� ��������� ��� �������������. ��� ����� ��� ����.
	if((other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_07");	//��, �������. � ����� ���� �����. ������ ��� ������. ��� ������� ����� ����� ������������ �����.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_BACKINTOWN_04_08");	//�������� � ���������, ������ ����� ����, � ������ ��� ��� ������ � ������������. �� ����������� ���� ������ � ����� ������.
	CreateInvItems(self,itwr_permissiontowearinnoseye_mis,1);
	b_giveinvitems(self,other,itwr_permissiontowearinnoseye_mis,1);
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_00");	//� ��� ����, ������ ��� �� ������...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_01");	//������ ��� ���� � ���� ���� �������������. ��� ������ ���� � �����, ����� �� ����� ��������.
	b_giveinvitems(self,other,itru_teleportseaport,1);
	MIS_INNOSEYESTOLEN = TRUE;
	MIS_OLDWORLD = LOG_SUCCESS;
	b_logentry(TOPIC_INNOSEYE,"���� ����� ��� ��� ������. ��� �������� ������� �������� � ��������� ������ ��� ���� ������.");
	Wld_InsertNpc(vlk_4250_jorgen,"NW_MONASTERY_BRIDGE_01");
	Wld_InsertNpc(bdt_1050_landstreicher,"NW_TROLLAREA_NOVCHASE_01");
	Wld_InsertNpc(bdt_1051_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	Wld_InsertNpc(bdt_1052_wegelagerer,"NW_TROLLAREA_RITUALFOREST_09");
	b_killnpc(bdt_1020_bandit_l);
	Wld_InsertNpc(dmt_1200_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1202_dementor,"NW_TROLLAREA_RITUAL_01");
	Wld_InsertNpc(dmt_1204_dementor,"NW_TROLLAREA_RITUAL_03");
	Wld_InsertNpc(dmt_1206_dementor,"NW_TROLLAREA_RITUAL_05");
	Wld_InsertNpc(dmt_1207_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1209_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1210_dementor,"NW_TROLLAREA_RITUALPATH_01");
	Wld_InsertNpc(dmt_1211_dementor,"NW_TROLLAREA_RITUALPATH_01");
	b_startotherroutine(pedro,"Tot");
	if(Npc_IsDead(miltennw))
	{
		Wld_InsertNpc(pc_mage_nw,"NW_MONASTERY_ENTRY_01");
		b_startotherroutine(miltennw,"START");
	};
	Wld_InsertNpc(nov_650_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_650_toternovize);
	Wld_InsertNpc(nov_651_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_651_toternovize);
	Wld_InsertNpc(nov_652_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_652_toternovize);
	Wld_InsertNpc(nov_653_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_653_toternovize);
	Wld_InsertNpc(nov_654_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_654_toternovize);
	Wld_InsertNpc(nov_655_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_655_toternovize);
	Wld_InsertNpc(nov_656_toternovize,"NW_TROLLAREA_RITUALPATH_01");
	b_killnpc(nov_656_toternovize);
	TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_BROKEN;
	Wld_InsertItem(itmi_innoseye_broken_mis,"FP_TROLLAREA_RITUAL_ITEM");
};


var int hagen_einmalbennet;

instance DIA_LORD_HAGEN_RESCUEBENNET(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_rescuebennet_condition;
	information = dia_lord_hagen_rescuebennet_info;
	permanent = TRUE;
	description = "��� ����� ���������� � ����� � �������.";
};


func int dia_lord_hagen_rescuebennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (CORNELIUS_ISLIAR == FALSE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_rescuebennet_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_15_00");	//��� ����� ���������� � ����� � �������.
	if(HAGEN_EINMALBENNET == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_04_01");	//�� ���� ������� ���� ������ �� ���� �����.
		HAGEN_EINMALBENNET = TRUE;
	};
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
	Info_AddChoice(dia_lord_hagen_rescuebennet,DIALOG_BACK,dia_lord_hagen_rescuebennet_back);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"������ �� ��� ������, ��� ������ ������ ������?",dia_lord_hagen_rescuebennet_whysure);
	Info_AddChoice(dia_lord_hagen_rescuebennet,"� ����, ��� ������ ���������.",dia_lord_hagen_rescuebennet_innoscent);
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (HAGEN_KNOWSEYEKAPUTT == TRUE))
	{
		Info_AddChoice(dia_lord_hagen_rescuebennet,"������ ��� �� ������ ��� �������� ���� ������.",dia_lord_hagen_rescuebennet_hilfe);
	};
};

func void dia_lord_hagen_rescuebennet_hilfe()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_16");	//������ ��� �� ������ ��� �������� ���� ������.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_17");	//���� ���� �� �� ��� ������� ������ ������ �� �����...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_18");	//�� ���� ��������. �� ��� �� ����� ������!
};

func void dia_lord_hagen_rescuebennet_back()
{
	Info_ClearChoices(dia_lord_hagen_rescuebennet);
};

func void dia_lord_hagen_rescuebennet_whysure()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_WhySure_15_00");	//������ �� ��� ������, ��� ������ ������ ������?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_01");	//� ��� ���� ���������.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_WhySure_04_02");	//��� ������, ��� ������� �������� � ���������� ����� ��������.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Witness_15_00");	//��� ���� ���������?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_01");	//���������, ��������� �����������, �����, ��� ��������� ��������.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_02");	//��� �������� �������� � �������, � ���� ��� ������� ��������. �� ����� ������, ��� ����������� ��������������.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Witness_04_03");	//���� ������� ����� ������� �� ������.
	if(RECUEBENNET_KNOWSCORNELIUS == FALSE)
	{
		b_logentry(TOPIC_RESCUEBENNET,"���������, ��������� �����������, �������� ����������. �� ����������, ��� ��� ���������� ��������.");
		RECUEBENNET_KNOWSCORNELIUS = TRUE;
	};
};

func void dia_lord_hagen_rescuebennet_innoscent()
{
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_00");	//� ����, ��� ������ ���������.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_01");	//�������������� ������. �� �������.
	AI_Output(other,self,"DIA_Lord_Hagen_RescueBennet_Innoscent_15_02");	//� ��� ���� �������������� �������?
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_03");	//������� �����. �� ���������� ��������� ���������.
	AI_Output(self,other,"DIA_Lord_Hagen_RescueBennet_Innoscent_04_04");	//���� �� �� ������ ����������� �������������� ����, ��� ��������� ������, ���� ����� ������������ ����.
};


instance DIA_LORD_HAGEN_CORNELIUS(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_cornelius_condition;
	information = dia_lord_hagen_cornelius_info;
	permanent = TRUE;
	description = "��������� ������.";
};


func int dia_lord_hagen_cornelius_condition()
{
	if((Npc_HasItems(other,itwr_corneliustagebuch_mis) >= 1) && (CORNELIUS_ISLIAR == TRUE) && (MIS_RESCUEBENNET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_cornelius_info()
{
	if(!Npc_IsDead(cornelius) && (CORNELIUSFLEE == FALSE))
	{
		AI_Teleport(cornelius,"NW_CITY_HABOUR_KASERN_BORKA");
	};
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_00");	//��������� ������.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_01");	//������ ���� ��� ��������?
	AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_02");	//���, � ���� ��� �������. ��� � ���.
	b_giveinvitems(other,self,itwr_corneliustagebuch_mis,1);
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_03");	//(� ������) ��, ������� �����!
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_04");	//����� ����� ����� ������������� ��� �� �������� ������ �������.
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_05");	//�������, ������ ��� ������� � ��������, � ������������...
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_06");	//...��� � ������������ ������� ��������� ��� ��������� � �� �������� ������������.
	b_startotherroutine(bennet,"START");
	b_startotherroutine(hodges,"START");
	AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_07");	//��������� ������ ���� ���������� ������� ��� ����� �� ����������������.
	if(Npc_IsDead(cornelius) == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_08");	//������ �� ������������. ��������� �����.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_09");	//������, �� ��� ����� ����������� ���������. �������.
	}
	else if(CORNELIUSFLEE == TRUE)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_Cornelius_15_10");	//�� ������.
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_11");	//���� ��� ������, �� ���������. � ����� �� �������� ���.
		b_startotherroutine(cornelius,"FLED");
	}
	else
	{
		b_startotherroutine(cornelius,"PRISON");
	};
	MIS_RESCUEBENNET = LOG_SUCCESS;
	b_giveplayerxp(XP_RESCUEBENNET);
	if(hero.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Cornelius_04_12");	//���� ���� ������ ��� �� ���������.
	};
};


instance DIA_LORD_HAGEN_AUGEAMSTART(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_augeamstart_condition;
	information = dia_lord_hagen_augeamstart_info;
	permanent = FALSE;
	description = "� ����� ����!";
};


func int dia_lord_hagen_augeamstart_condition()
{
	if((KAPITEL <= 4) && (MIS_READYFORCHAPTER4 == TRUE))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_augeamstart_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_10");	//� ����� ����!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_11");	//(������������) �� ������ ����!
	if(HAGEN_KNOWSEYEKAPUTT == TRUE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_12");	//� �� ����������� ���!
	};
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_13");	//������ �� ��������� ������!
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_14");	//� ������ ������������ � ���� � ����� ���� �������� � ������ ��������!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_15");	//��� � ������� � �������� ��� � ��� �������!
};


instance DIA_LORD_HAGEN_KAP4_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap4_exit_condition;
	information = dia_lord_hagen_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ANTIPALADINE(C_INFO)
{
	npc = pal_200_hagen;
	nr = 3;
	condition = dia_lord_hagen_antipaladine_condition;
	information = dia_lord_hagen_antipaladine_info;
	permanent = TRUE;
	description = "������� ����� ����� �������� �� ���� �����.";
};


func int dia_lord_hagen_antipaladine_condition()
{
	if(((TALKEDTO_ANTIPALADIN == TRUE) || Npc_HasItems(other,itri_orcelitering)) && (HAGEN_SAWORCRING == FALSE) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int hagen_saworcring;

func void dia_lord_hagen_antipaladine_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_00");	//������� ����� ����� �������� �� ���� �����.
	Log_CreateTopic(TOPIC_ORCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCELITE,LOG_RUNNING);
	b_logentry(TOPIC_ORCELITE,"� ��������� ����� ������ � �������������� ����� ������������� �����.");
	if((TALKEDTO_ANTIPALADIN == TRUE) && (MIS_KILLORKOBERST == 0))
	{
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_01");	//������ � ���� ����� ����������?
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_02");	//� ������� � ����� �� ���. ���� ��� ����� �����������.
	};
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_03");	//����. ��� ���� �� ����������� � ������������� ��������� �����.
	AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_04");	//��������, �����-�� �� ���������� ����������� � ����������� �����.
	if(Npc_HasItems(other,itri_orcelitering))
	{
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_05");	//��� �� ����������. � ���� ��� ������ � ����� ������ �� ���.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_06");	//������.
		b_giveinvitems(other,self,itri_orcelitering,1);
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_07");	//���. ��� ������������� ���������.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_08");	//��� ���� �� ����. ������, ���� ��������� ��-�� ����� ���������� � ��������� � �������� ����.
		AI_Output(other,self,"DIA_Lord_Hagen_ANTIPALADINE_15_09");	//� �� �����, ����� �� ���� �����. � ��������, ��� �� ������������ � ����� ��������� ������.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_10");	//��? ������, ��� ��������� ���-�� ���. ��� �� ������ �� �����, ����� �� ������ � �������� �������� ���� �������� ���������.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_11");	//�� ��� ����� ����� ������� ������������, �������, ������� �� �������������� ����.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_12");	//���� ��� �������� ����� �������, �� ������ ��� ����� ��������.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_13");	//� ���� ����� �������, ������. ��� � ���� ���� ������� �����, ����� ������� � ���������� ������.
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_14");	//������� ��� �� ������. ��� ����� ��������� ���� �� �����.
		b_logentry(TOPIC_ORCELITE,"� ���� �������� ������ ������ ������������ ����� � �������� ��������������. �� �����, ����� � ������ ��� ��� ������ �������������, ������� � �����.");
		if((Npc_IsDead(ingmar) == FALSE) && (MIS_KILLORKOBERST == 0))
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_15");	//�������� � ��������. �� ����� ���� ���� ��������� ����������� ������� �� �������� � �������� �����.
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_16");	//������� ����� ����� - ��� �������������. ��� ����� ����������� ����� � ���� ����.
			b_logentry(TOPIC_ORCELITE,"������ ����� ����� ����� �� ������� ������ �����.");
		};
		HAGEN_SAWORCRING = TRUE;
		b_giveplayerxp(XP_PAL_ORCRING);
	}
	else
	{
		if(MIS_KILLORKOBERST == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_17");	//������ ������ �����, ��� �� ���� ���������� �����, ������������ ��� ����.
		};
		AI_Output(self,other,"DIA_Lord_Hagen_ANTIPALADINE_04_18");	//��� ����� ������������ ��������������, ����� � ��� ������� ����.
		b_logentry(TOPIC_ORCELITE,"����� ������������ ������ ���. �� ������� ������������� ����, ��� ������� ����� ����� �������� �� �������������� �����. ��, ���� �� �������, ���� �� �� ����� ���� ��-�������.");
	};
};


instance DIA_LORD_HAGEN_RINGEBRINGEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_ringebringen_condition;
	information = dia_lord_hagen_ringebringen_info;
	permanent = TRUE;
	description = "� ���� ��� ���-��� �������� � ������������� �����.";
};


func int dia_lord_hagen_ringebringen_condition()
{
	if((HAGEN_SAWORCRING == TRUE) && (Npc_HasItems(other,itri_orcelitering) >= 1) && (hero.guild == GIL_PAL))
	{
		return TRUE;
	};
};


var int orkringcounter;

func void dia_lord_hagen_ringebringen_info()
{
	var int ringcount;
	var int xp_pal_orcrings;
	var int orcringgeld;
	var int hagensringoffer;
	AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_00");	//� ���� ��� ���-��� �������� � ������������� �����.
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_01");	//�����������.
	hagensringoffer = 150;
	ringcount = Npc_HasItems(other,itri_orcelitering);
	if(ringcount == 1)
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_02");	//� ���� ���� ���� ��� ���� ������ �����.
		b_giveplayerxp(XP_PAL_ORCRING);
		b_giveinvitems(other,self,itri_orcelitering,1);
		ORKRINGCOUNTER = ORKRINGCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Lord_Hagen_RINGEBRINGEN_15_03");	//� ���� ���� ���� ��� ��������� ����� �����.
		b_giveinvitems(other,self,itri_orcelitering,ringcount);
		xp_pal_orcrings = ringcount * XP_PAL_ORCRING;
		ORKRINGCOUNTER = ORKRINGCOUNTER + ringcount;
		b_giveplayerxp(xp_pal_orcrings);
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_04");	//� ������� �����. ��� �������!
	if(ORKRINGCOUNTER <= 10)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_05");	//��������, ��� �� ��� ������������ ����� ����������.
	}
	else if(ORKRINGCOUNTER <= 20)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_06");	//�� ����� �� �������� �� �� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_07");	//� ��������, ���� �� ��� �� ������������.
		AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_08");	//�� ������ ��������� ��� �� ������, �� � �����, ���� ��� �������� ������� ����.
		TOPIC_END_ORCELITE = TRUE;
	};
	AI_Output(self,other,"DIA_Lord_Hagen_RINGEBRINGEN_04_09");	//���. ������ ��� ������, ���� ���� �� ���� ������� ����������.
	orcringgeld = ringcount * hagensringoffer;
	CreateInvItems(self,itmi_gold,orcringgeld);
	b_giveinvitems(self,other,itmi_gold,orcringgeld);
};


instance DIA_LORD_HAGEN_KAP5_EXIT(C_INFO)
{
	npc = pal_200_hagen;
	nr = 999;
	condition = dia_lord_hagen_kap5_exit_condition;
	information = dia_lord_hagen_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lord_hagen_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LORD_HAGEN_ALLDRAGONSDEAD(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_alldragonsdead_condition;
	information = dia_lord_hagen_alldragonsdead_info;
	permanent = FALSE;
	description = "������� ������.";
};


func int dia_lord_hagen_alldragonsdead_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_00");	//������� ������.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_19");	//� ����, ��� ����� ���� ���� ����, ����� �������� ��������!
	AI_Output(self,other,"DIA_Lord_Hagen_AllDragonsDead_04_02");	//��� ��� � �����?
	AI_Output(other,self,"DIA_Lord_Hagen_AllDragonsDead_15_03");	//���� ��� ��� �������� ����� � ������ ��������. ������ �� ������ �������� �����, ���� ����� �� �����.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_20");	//(� ������) ����!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_21");	//���� ������ �� �������� ���������� � ���������, � ������ ����� ���������� � ���� ����.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_22");	//����� ����� �� ��������� ����! ������ �� ����!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_23");	//� ��� ����� ������ ����� �����. �� ��������� ���������.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_24");	//�� ��� ���������� ����. � ������� ������ ����������� ������ �� �������.
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_25");	//����� ������ ���� ����������, �����, �������, ����������� � ����� ������!
	MIS_SCVISITSHIP = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"ShipFree");
};


instance DIA_LORD_HAGEN_NEEDSHIP(C_INFO)
{
	npc = pal_200_hagen;
	nr = 4;
	condition = dia_lord_hagen_needship_condition;
	information = dia_lord_hagen_needship_info;
	permanent = FALSE;
	description = "��� ����� �������.";
};


func int dia_lord_hagen_needship_condition()
{
	if(ITWR_SCREADSHALLSOFIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_lord_hagen_needship_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_00");	//��� ����� �������.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_01");	//�� ����� ���� �����, ������.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_02");	//(�������) � ����� ��� ���� �� �� ������ ����, �������. ��...
	};
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_03");	//� ���� ���� ��� ��������, �� ������ ��� � �������.
	AI_Output(other,self,"DIA_Lord_Hagen_NeedShip_15_04");	//��� ������ �������, �������� � ������?
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_05");	//�� ����������� ���, � �����. �� ������ ���������� ���� �� ���� �������.
	AI_Output(self,other,"DIA_Lord_Hagen_NeedShip_04_06");	//����� �� �������� � ����, �� ������ ���������� �� ��� �����.
};


instance DIA_LORD_HAGEN_GATEOPEN(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_gateopen_condition;
	information = dia_lord_hagen_gateopen_info;
	permanent = FALSE;
	description = "���� ��������� � ����� � ������ ��������!";
};


func int dia_lord_hagen_gateopen_condition()
{
	if((MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_gateopen_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_29");	//���� ��������� � ����� � ������ ��������!
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_30");	//�, �����! ��� ������ ��� ���������?
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_31");	//������-�� ������ ��������� ���������...
	AI_Output(self,other,"DIA_Lord_Hagen_Add_04_32");	//������-��?! �� ��� ��� ��������... � ����� ��������� ���� ���������!
};


instance DIA_LORD_HAGEN_PERM5(C_INFO)
{
	npc = pal_200_hagen;
	nr = 5;
	condition = dia_lord_hagen_perm5_condition;
	information = dia_lord_hagen_perm5_info;
	permanent = TRUE;
	description = "���� �� �����?";
};


func int dia_lord_hagen_perm5_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_alldragonsdead))
	{
		return TRUE;
	};
};

func void dia_lord_hagen_perm5_info()
{
	AI_Output(other,self,"DIA_Lord_Hagen_Add_15_33");	//���� �� �����?
	if(MIS_OCGATEOPEN == FALSE)
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_26");	//�� ��� ��� ���� ���� �� ����������� � ���������. ��� ������ �� ����� � ���, �� ����� �� �������� � ����!
	}
	else
	{
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_27");	//������, ����� ����� ���� �������, ��� ����� ������ ��������.
		AI_Output(self,other,"DIA_Lord_Hagen_Add_04_28");	//�� ��� �� �������� ��� �������.
	};
};

