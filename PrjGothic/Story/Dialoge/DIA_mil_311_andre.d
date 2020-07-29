
instance DIA_ANDRE_EXIT(C_INFO)
{
	npc = mil_311_andre;
	nr = 999;
	condition = dia_andre_exit_condition;
	information = dia_andre_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_andre_exit_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		return TRUE;
	};
};

func void dia_andre_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_FIRSTEXIT(C_INFO)
{
	npc = mil_311_andre;
	nr = 999;
	condition = dia_andre_firstexit_condition;
	information = dia_andre_firstexit_info;
	permanent = FALSE;
	description = DIALOG_ENDE;
};


func int dia_andre_firstexit_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_andre_firstexit_info()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"START");
	b_startotherroutine(wulfgar,"START");
};


var int andre_steckbrief;

func void b_andre_steckbrief()
{
	AI_Output(self,other,"DIA_Andre_Add_08_00");	//���� �� ���� ����� ������ ���, ��� ������� �������������� ���������� � ������� � ����� ������������.
	AI_Output(self,other,"DIA_Andre_Add_08_01");	//�� ����� ������, ��� �������� �� ��� �������.
	AI_Output(self,other,"DIA_Andre_Add_08_02");	//��� ��� ��� ��� ������?
	AI_Output(other,self,"DIA_Andre_Add_15_03");	//� �� ����, ������ ��� ���� ����...
	AI_Output(self,other,"DIA_Andre_Add_08_04");	//�������, ���� ������ �� �����, ��� �� �������� ��� ������.
	AI_Output(self,other,"DIA_Andre_Add_08_05");	//��� �� ����� � ��������� ���� � ����������� ����������.
	AI_Output(self,other,"DIA_Andre_Add_08_06");	//����������� �� ���� �������� - ������ ���������� �� �������.
	AI_Output(self,other,"DIA_Andre_Add_08_07");	//� �������, ��� �� ����� �� ������ � ����� ������������!
	ANDRE_STECKBRIEF = TRUE;
};


var int andre_cantharfalle;

func void b_andre_cantharfalle()
{
	AI_Output(self,other,"B_Andre_CantharFalle_08_00");	//�� ��� �������� �������� ������. �� ������, ��� �� ������ ��������� �� �������.
	AI_Output(self,other,"B_Andre_CantharFalle_08_01");	//� �� ����, ������ �� ���, � ����������� �� ���������� ���� �� ����, �� �� ������ ������� ���� ������.
	b_removenpc(vlk_470_sarah);
	b_startotherroutine(canthar,"MARKTSTAND");
	AI_Teleport(canthar,"NW_CITY_SARAH");
	if((CANTHAR_SPERRE == FALSE) && (CANTHAR_PAY == FALSE))
	{
		CANTHAR_SPERRE = TRUE;
	};
	MIS_CANTHARS_KOMPROBRIEF = LOG_OBSOLETE;
	b_checklog();
	ANDRE_CANTHARFALLE = TRUE;
};


instance DIA_ANDRE_CANTHARFALLE(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_cantharfalle_condition;
	information = dia_andre_cantharfalle_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_cantharfalle_condition()
{
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		return TRUE;
	};
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_cantharfalle_info()
{
	if(ANDRE_STECKBRIEF == FALSE)
	{
		b_andre_steckbrief();
	};
	if((ANDRE_CANTHARFALLE == FALSE) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)))
	{
		b_andre_cantharfalle();
	};
};


var int andre_lastpetzcounter;
var int andre_lastpetzcrime;

instance DIA_ANDRE_PMSCHULDEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_pmschulden_condition;
	information = dia_andre_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (ANDRE_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= ANDRE_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_andre_pmschulden_info()
{
	var int diff;
	AI_Output(self,other,"DIA_Andre_PMSchulden_08_00");	//�� ������ ��������� �����?
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		b_andre_steckbrief();
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		b_andre_cantharfalle();
	};
	if(b_gettotalpetzcounter(self) > ANDRE_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_01");	//� ���� ��������� ��������, ���������� �� �� ��������� �����?!
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_02");	//��������� ������ ���� ������ ��������!
		if(ANDRE_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_03");	//� ������������ ����! ������ �����, ������� ���� �������� ���������, ������ ����������!
			AI_Output(other,self,"DIA_Andre_PMAdd_15_00");	//�������?
			diff = b_gettotalpetzcounter(self) - ANDRE_LASTPETZCOUNTER;
			if(diff > 0)
			{
				ANDRE_SCHULDEN = ANDRE_SCHULDEN + (diff * 50);
			};
			if(ANDRE_SCHULDEN > 1000)
			{
				ANDRE_SCHULDEN = 1000;
			};
			b_say_gold(self,other,ANDRE_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_04");	//�� ������� ����������� ����!
		};
	}
	else if(b_getgreatestpetzcrime(self) < ANDRE_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_05");	//���������� ����� �����������.
		if(ANDRE_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_06");	//���������� �� �������� ������, ��� �� ��� �������� ���� � ��������.
		};
		if((ANDRE_LASTPETZCRIME == CRIME_THEFT) || ((ANDRE_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_07");	//����� ������ �� ������, ����� �� ���-�� ����.
		};
		if((ANDRE_LASTPETZCRIME == CRIME_ATTACK) || ((ANDRE_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_08");	//������ ��� ���������� ����, ��� �� �������� ������� � �����.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_09");	//������, ��� ��� ��������� ������ ���� ��������� ����������������.
		};
		AI_Output(self,other,"DIA_Andre_PMSchulden_08_10");	//� �� ����, ��� ���������, �� � ������������ ����: �� ������� �������� ����!
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_11");	//��� �� �� �� ����, � ����� ����� � ���� ��� ���������.
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_12");	//������, ����� ������ �� ���� ������� �������!
			ANDRE_SCHULDEN = 0;
			ANDRE_LASTPETZCOUNTER = 0;
			ANDRE_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_13");	//� ����, ����� ���� ���� �������: ���� ��� ����� �������� ��������� ������ ����� ������.
			b_say_gold(self,other,ANDRE_SCHULDEN);
			AI_Output(self,other,"DIA_Andre_PMSchulden_08_14");	//��� �������?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_andre_pmschulden);
		Info_ClearChoices(dia_andre_petzmaster);
		Info_AddChoice(dia_andre_pmschulden,"� ���� ������������ ������.",dia_andre_petzmaster_paylater);
		Info_AddChoice(dia_andre_pmschulden,"������� ��� ���?",dia_andre_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
		{
			Info_AddChoice(dia_andre_pmschulden,"� ���� ��������� �����!",dia_andre_petzmaster_paynow);
		};
	};
};

func void dia_andre_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Andre_PMSchulden_HowMuchAgain_15_00");	//������� ��� ���?
	b_say_gold(self,other,ANDRE_SCHULDEN);
	Info_ClearChoices(dia_andre_pmschulden);
	Info_ClearChoices(dia_andre_petzmaster);
	Info_AddChoice(dia_andre_pmschulden,"� ���� ������������ ������.",dia_andre_petzmaster_paylater);
	Info_AddChoice(dia_andre_pmschulden,"������� ��� ���?",dia_andre_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
	{
		Info_AddChoice(dia_andre_pmschulden,"� ���� ��������� �����!",dia_andre_petzmaster_paynow);
	};
};


instance DIA_ANDRE_PETZMASTER(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_petzmaster_condition;
	information = dia_andre_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_andre_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > ANDRE_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_andre_petzmaster_info()
{
	ANDRE_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_00");	//�� ��� �������, ��� ��������� �����.
	};
	if((PABLO_ANDREMELDEN == TRUE) && !Npc_IsDead(pablo) && (ANDRE_STECKBRIEF == FALSE))
	{
		b_andre_steckbrief();
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY <= (Wld_GetDay() - 2)) && (ANDRE_CANTHARFALLE == FALSE))
	{
		b_andre_cantharfalle();
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_01");	//������, ��� �� ������ �� ��� ���� ��� ��� ����� �������.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_02");	//�������� - ��������� ������������!
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		ANDRE_SCHULDEN = ANDRE_SCHULDEN + 500;
		if((PETZCOUNTER_CITY_THEFT + PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_03");	//�� ������ ��� � ������ �����, ��� �� ��������.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_04");	//������ ��������� ������� ����� �� �����.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_05");	//� ����������� ������� �� �������� ����� � ������!
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_06");	//�� � �� ������������� � ���, ����� �������� ����. ���� �����, � ��� ����� ������ ������.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_07");	//�� ����� �� ���-�� ������ ��������� �����.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_08");	//�� ��� �� ����������� ���� ���������, �������� ����� - �����������, �� ������ ���� �������� ������������.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_09");	//������, ��� �� ������! ���� �������� � ���������! ���� ���������!
		if((PETZCOUNTER_CITY_ATTACK + PETZCOUNTER_CITY_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_10");	//�� ������ ��� � ������ ����� ������������, � ������� � ������.
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_11");	//� �� �������� ������ ��������� � ���� ������!
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_12");	//�� ������ ��������� �����, ����� �������� ���� ����.
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_13");	//���� �� �������� �� ������ ������� � ������ - ��� ����...
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_14");	//�� ����� �� ��������� �� ������� ��� ����������� ������, � ������ ��������� ����.
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Andre_PETZMASTER_08_15");	//� ��� ���� ���� ����������� �������?
		};
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_16");	//���� � ������ ��� ������ ����, ����� ��� ����� ������ ��, ��� �����.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_17");	//��� ��� ���� �������� ��������� ��������������� ����� - � ���� ����������� ����� ������.
		ANDRE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_18");	//� ������, ��� �� ������� ����.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_19");	//�� �� ���������, ��� � �� ���� �������� ��� ���� ������ ���.
		AI_Output(self,other,"DIA_Andre_PETZMASTER_08_20");	//���� �������� ��������� �����������!
		ANDRE_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Andre_PETZMASTER_15_21");	//�������?
	if(ANDRE_SCHULDEN > 1000)
	{
		ANDRE_SCHULDEN = 1000;
	};
	b_say_gold(self,other,ANDRE_SCHULDEN);
	Info_ClearChoices(dia_andre_pmschulden);
	Info_ClearChoices(dia_andre_petzmaster);
	Info_AddChoice(dia_andre_petzmaster,"� ���� ������������ ������.",dia_andre_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= ANDRE_SCHULDEN)
	{
		Info_AddChoice(dia_andre_petzmaster,"� ���� ��������� �����!",dia_andre_petzmaster_paynow);
	};
};

func void dia_andre_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayNow_15_00");	//� ���� ��������� �����!
	b_giveinvitems(other,self,itmi_gold,ANDRE_SCHULDEN);
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayNow_08_01");	//������! � ����������, ����� ��� � ������ ������ �� ���� - ��� ���� ���-�� ����������� ���� ���������.
	b_grantabsolution(LOC_CITY);
	ANDRE_SCHULDEN = 0;
	ANDRE_LASTPETZCOUNTER = 0;
	ANDRE_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_andre_petzmaster);
	Info_ClearChoices(dia_andre_pmschulden);
};

func void dia_andre_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Andre_PETZMASTER_PayLater_15_00");	//� ���� ������������ ������.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_01");	//����� ���������� ������� ����������� ����� ��� ����� �������.
	AI_Output(self,other,"DIA_Andre_PETZMASTER_PayLater_08_02");	//�� ������ ������������ ����: ���� �� ��� ���� ��������� ���� ����, �� ���� ����� ������ ���������.
	ANDRE_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	ANDRE_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_HALLO(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_hallo_condition;
	information = dia_andre_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_hallo_info()
{
	AI_Output(self,other,"DIA_Andre_Hallo_08_00");	//�� �������� � ����� �����, ���������! ��� ������� ���� �� ���?
};


instance DIA_ANDRE_MESSAGE(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_message_condition;
	information = dia_andre_message_info;
	permanent = FALSE;
	description = "� ���� ���� ������ ��������� ��� ����� ������.";
};


func int dia_andre_message_condition()
{
	if((KAPITEL < 3) && ((hero.guild == GIL_NONE) || (hero.guild == GIL_NOV)))
	{
		return TRUE;
	};
};

func void dia_andre_message_info()
{
	AI_Output(other,self,"DIA_Andre_Message_15_00");	//� ���� ���� ������ ��������� ��� ����� ������.
	AI_Output(self,other,"DIA_Andre_Message_08_01");	//��, �� ������ ����� ��� ��������������. ��� ��� ��� �����?
	Info_ClearChoices(dia_andre_message);
	Info_AddChoice(dia_andre_message,"��� � ���� ������� ������ ����� ������.",dia_andre_message_personal);
	Info_AddChoice(dia_andre_message,"����� �����, ����������� �������!",dia_andre_message_dragons);
	Info_AddChoice(dia_andre_message,"��� ������ ���������� ��������� - ����� ������.",dia_andre_message_eyeinnos);
};

func void b_andre_lordhagennichtzusprechen()
{
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_00");	//���� ����� ��������� ������ ��������� � ���, ��� ������ ���������.
	AI_Output(self,other,"B_Andre_LordHagenNichtZuSprechen_08_01");	//�� ������� ���� ������ ����������� ������� ����� �� ������� �����.
};

func void dia_andre_message_eyeinnos()
{
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_00");	//��� ������ ���������� ��������� - ����� ������.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_01");	//���� ������ - ������� �� ������ � �����. �� ��� ��� ������ �� ������.
	AI_Output(self,other,"DIA_Andre_Message_EyeInnos_08_02");	//���� ������������� ���������� ��������, ������� ��� ���, ������ ����� ������������������ ����� ������ ������ ����� ����� � ���.
	AI_Output(other,self,"DIA_Andre_Message_EyeInnos_15_03");	//��� ������ ��� ����� ���������� ������ � ������ �������.
	ANDRE_EYEINNOS = TRUE;
	b_andre_lordhagennichtzusprechen();
	Info_ClearChoices(dia_andre_message);
};

func void dia_andre_message_dragons()
{
	AI_Output(other,self,"DIA_Andre_Message_Dragons_15_00");	//����� �����, ������������� ���...
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_01");	//(���������) � ����, ��� ����� ����� ���������� ��� �������
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_02");	//�� �� �� ������ ��� �������, ��� �� ������ ��� ������ �������� ����� ������.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_03");	//�� ������� ���� ������, ���� �� ������ ������� ������� ��� �����, �������� ��� ������ ���������.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_04");	//� ������, ��� �� ���������� ���� � ��������� ��� ���.
	AI_Output(self,other,"DIA_Andre_Message_Dragons_08_05");	//��� ���-����, ����� ���� ����� ������� ���?
};

func void dia_andre_message_personal()
{
	AI_Output(other,self,"DIA_Andre_Message_Personal_15_00");	//��� � ���� ������� ������ ����� ������.
	AI_Output(self,other,"DIA_Andre_Message_Personal_08_01");	//��� ������. �� �� ������ ������ ����:
	b_andre_lordhagennichtzusprechen();
	Info_ClearChoices(dia_andre_message);
};


instance DIA_ANDRE_PALADINE(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_paladine_condition;
	information = dia_andre_paladine_info;
	permanent = FALSE;
	description = "��� �������� ������ � ������?";
};


func int dia_andre_paladine_condition()
{
	if((other.guild != GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_paladine_info()
{
	AI_Output(other,self,"DIA_Andre_Paladine_15_00");	//������ �������� ������� � �����?
	AI_Output(self,other,"DIA_Andre_Paladine_08_01");	//���� ����� �������� �������� ������.
	AI_Output(self,other,"DIA_Andre_Paladine_08_02");	//� ���� ������� ���� ������, ��� ��������� ������ �� ������ ������� ���������.
	AI_Output(self,other,"DIA_Andre_Paladine_08_03");	//���� �� � ��� �����������.
};


instance DIA_ANDRE_PALADINEAGAIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_paladineagain_condition;
	information = dia_andre_paladineagain_info;
	permanent = FALSE;
	description = "��� �������� ������ � ������?";
};


func int dia_andre_paladineagain_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_paladineagain_info()
{
	if(Npc_KnowsInfo(other,dia_andre_paladine))
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_00");	//��� �� ������� ���, ����� �������� ������� � �������?
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_PaladineAgain_15_01");	//��� �������� ������ � ������?
	};
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_02");	//������, ����� �� ������� � ��������� ������, �� ������������ ���������.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_03");	//� ������ � ���� �������� ����.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_04");	//�� ������� �� ��������� ������ ������. � ����������� ������� �������� ���� ������������.
	AI_Output(self,other,"DIA_Andre_PaladineAgain_08_05");	//������� ������ �� �������� ���� � ���������� �� �� �������. ��� ������ ���� ���� �� ������ ����� ������ � ������� �����.
	KNOWSPALADINS_ORE = TRUE;
};


instance DIA_ANDRE_ASKTOJOIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_asktojoin_condition;
	information = dia_andre_asktojoin_info;
	permanent = FALSE;
	description = "� ���� ��������� �� ������ � ���������!";
};


func int dia_andre_asktojoin_condition()
{
	if(hero.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_andre_asktojoin_info()
{
	AI_Output(other,self,"DIA_Andre_AskToJoin_15_00");	//� ���� ��������� �� ������ � ���������!
	if(Npc_KnowsInfo(other,dia_andre_message))
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_01");	//������. ��� ����� ����. � ���� �� ����������, ������ �� ����� �������������� � ���.
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_02");	//���� �� ��������� �� ������ � ���������, � ������ ���� �������� ��������� � ����� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_AskToJoin_08_03");	//��������� �������.
	};
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_04");	//������ � ���� ���� ������ ��������� � ��������� ������ ������� ����� ������.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_05");	//��� ����������� ���������, ��� � ���� ���� ����� ���������� ������ ��� ����������.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_06");	//�� ����� ����� ������� ������ ���� � ��������.
	AI_Output(self,other,"DIA_Andre_AskToJoin_08_07");	//�������, �� ������� ������ ����� ����������� ������. �� ����, ����� ��� ������� ����� ��� ���, �� ������ ���� ������.
	Log_CreateTopic(TOPIC_BECOMEMIL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMEMIL,LOG_RUNNING);
	b_logentry(TOPIC_BECOMEMIL,"������ ��� � ����� �������� � ���� ��������� ������, � ������ ����� ����������� ������.");
};


instance DIA_ANDRE_ABOUTMILIZ(C_INFO)
{
	npc = mil_311_andre;
	nr = 5;
	condition = dia_andre_aboutmiliz_condition;
	information = dia_andre_aboutmiliz_info;
	permanent = FALSE;
	description = "��� � ������ �� ���������� � ���������?";
};


func int dia_andre_aboutmiliz_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_andre_asktojoin))
	{
		return TRUE;
	};
};

func void dia_andre_aboutmiliz_info()
{
	AI_Output(other,self,"DIA_Andre_AboutMiliz_15_00");	//��� � ������ �� ���������� � ���������?
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_01");	//������� ��� ��������� ���� ������. ����������� ������� ��������� �� �������������� ������������� �� ������ � ��������.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_02");	//��� ������� � ���� �������� ������. ����� �� ������� ����� �� ���, ���� ����� ����� ����� ���� ������.
	AI_Output(self,other,"DIA_Andre_AboutMiliz_08_03");	//�� ��� ���� �����. ������ ���������, � ���� ���������� ���� ������� ����� ��������� ������ ������.
};


instance DIA_ANDRE_ALTERNATIVE(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_alternative_condition;
	information = dia_andre_alternative_info;
	permanent = FALSE;
	description = "� ��� ����� �������� ������� �������������� � ���?";
};


func int dia_andre_alternative_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_asktojoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_andre_alternative_info()
{
	AI_Output(other,self,"DIA_Andre_Alternative_15_00");	//� ��� ����� �������� ������� �������������� � ���?
	AI_Output(self,other,"DIA_Andre_Alternative_08_01");	//�-�-�. (������������) � ���� ������������� ��������� ���������, ��?
	AI_Output(self,other,"DIA_Andre_Alternative_08_02");	//������. ������. � ���� ���� ��������. ���� �� ������ �� ��� ����, � ������, ��� �� ������ �������� � ���������.
	AI_Output(self,other,"DIA_Andre_Alternative_08_03");	//� ����� �������: ������ �� �����!
};


instance DIA_ANDRE_GUILDOFTHIEVES(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_guildofthieves_condition;
	information = dia_andre_guildofthieves_info;
	permanent = FALSE;
	description = "� ��� ���� ��������?";
};


func int dia_andre_guildofthieves_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_alternative))
	{
		return TRUE;
	};
};

func void dia_andre_guildofthieves_info()
{
	AI_Output(other,self,"DIA_Andre_GuildOfThieves_15_00");	//��� � ���� �� ��������?
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_01");	//��������� ����� � ������ ��������� ������� ����� �����. � �� ����� �� ����� ������� �� ������ �� ���. ���� ��������� ����� ���������.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_02");	//��� �������� ����� ���� ����. � ������, ��� � ������ ��������� �������������� �����.
	AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_03");	//� �� ��������, ���� � �������� ��������� ������� �����. ����� �������� ���� ����� � ���������� ��.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_04");	//����� � ����� �������������, ��� �� ������ ������ � ��������� - �������, ��������� �� ��� ���.
		AI_Output(self,other,"DIA_Andre_GuildOfThieves_08_05");	//�� �� ������ �� ������ �������� � ����� ����������!
	};
	MIS_ANDRE_GUILDOFTHIEVES = LOG_RUNNING;
	b_logentry(TOPIC_BECOMEMIL,"���� ����� ������ ������ �������� � ���� ��������� ������ - ����� � ���������� ������� ����� ��������.");
};


instance DIA_ANDRE_WHERETHIEVES(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_wherethieves_condition;
	information = dia_andre_wherethieves_info;
	permanent = FALSE;
	description = "��� ��� ����� ������ ������ ���� �����?";
};


func int dia_andre_wherethieves_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_guildofthieves) && (MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_wherethieves_info()
{
	AI_Output(other,self,"DIA_Andre_WhereThieves_15_00");	//��� ��� ����� ������ ������ ���� �����?
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_01");	//���� �� � ���� ���, � �� ������ ��� ���!
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_02");	//���� ������� ����: �� ������� ����������� ����� ���� ���� �������� ������� � ������ �� �����. ��������� ������.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_03");	//����, ������� ���, �� ������� � ��������������, ��������, ���� �� ���� ������� ��������.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_04");	//�� �� ���������. ��������, ���� ��� ����� ������ ��������.
	AI_Output(self,other,"DIA_Andre_WhereThieves_08_05");	//�� ������ ������������ � �������� ��������. �� ���� ���������. ���� ���� ������, ��� �� ��������� �� ���������, �� �� ������� ������!
	b_logentry(TOPIC_BECOMEMIL,"���� � ���� ����� ������� �����, ��� ����� ������ �������������� � ����, ��� ������� � �������� ��������.");
};


instance DIA_ANDRE_WHATTODO(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_whattodo_condition;
	information = dia_andre_whattodo_info;
	permanent = FALSE;
	description = "��� ��� ������, ����� � ����� ���� �����?";
};


func int dia_andre_whattodo_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_guildofthieves) && (MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_whattodo_info()
{
	AI_Output(other,self,"DIA_Andre_WhatToDo_15_00");	//��� ��� ������, ����� � ����� ���� �����?
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_01");	//���� ���� �������� ������ ������� - �������� ���� ��� ���������, ����� ����� �������� �������.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_02");	//������ ����� �� ��� � ������. � � ����������, ����� ��� ����� ��������� �� ��������.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_03");	//��������� ������ ����� ��������� � ����� � � ���� �� ����� ����������� ��������� ��, ��� ����������.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_04");	//����� ����, �� ������� �����������, ������� � ����� ������� ����� ������� �� �������, ���� ���������� �������.
	AI_Output(self,other,"DIA_Andre_WhatToDo_08_05");	//������, ���� �� ������� ������ �������� - ��, ����� ����, ��������, �� ������� �������� ���.
	b_logentry(TOPIC_BECOMEMIL,"���� � ������ �����-������ ������ ������� ������� �����, � ������ �������� ��� ����� � ����� �����. � ����� ������������� ������� �����, � ������ ����� �� ������.");
};


instance DIA_ANDRE_AUSLIEFERUNG(C_INFO)
{
	npc = mil_311_andre;
	nr = 200;
	condition = dia_andre_auslieferung_condition;
	information = dia_andre_auslieferung_info;
	permanent = TRUE;
	description = "� ������ �������� ������� �� �����������.";
};


func int dia_andre_auslieferung_condition()
{
	if((RENGARU_AUSGELIEFERT == FALSE) || (HALVOR_AUSGELIEFERT == FALSE) || (NAGUR_AUSGELIEFERT == FALSE) || (MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_andre_auslieferung_info()
{
	AI_Output(other,self,"DIA_Andre_Auslieferung_15_00");	//� ������ �������� ������� �� �����������.
	Info_ClearChoices(dia_andre_auslieferung);
	Info_AddChoice(dia_andre_auslieferung,"� ����� ����� (�����)",dia_andre_auslieferung_back);
	if((RENGARU_INKNAST == TRUE) && (RENGARU_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"������� ����� � �������� �����.",dia_andre_auslieferung_rengaru);
	};
	if((BETRAYAL_HALVOR == TRUE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"������ ������� ��������.",dia_andre_auslieferung_halvor);
	};
	if((MIS_NAGUR_BOTE == LOG_RUNNING) && (NAGUR_AUSGELIEFERT == FALSE))
	{
		Info_AddChoice(dia_andre_auslieferung,"����� ���� ���������� ���������.",dia_andre_auslieferung_nagur);
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (MIS_CANTHARS_KOMPROBRIEF_DAY > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(dia_andre_auslieferung,"������ �������� ���������� �� ����!",dia_andre_auslieferung_canthar);
	};
	if((MIS_CANTHARS_KOMPROBRIEF == LOG_RUNNING) && (Npc_HasItems(sarah,itwr_canthars_komprobrief_mis) >= 1) && (MIS_CANTHARS_KOMPROBRIEF_DAY > (Wld_GetDay() - 2)))
	{
		Info_AddChoice(dia_andre_auslieferung,"���� ������� ������ �����.",dia_andre_auslieferung_sarah);
	};
};

func void dia_andre_auslieferung_back()
{
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_rengaru()
{
	AI_Teleport(rengaru,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Rengaru_15_00");	//������ ����� � �������� �����. �� ������� ��������, �� � ������ ���.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_01");	//������, ��� ���� ��� �������� ���. ������ �� �� ������ �������� � ��������������� �������.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Rengaru_08_02");	//��� ���� ������.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	RENGARU_AUSGELIEFERT = TRUE;
	MIS_THIEFGUILD_SUCKED = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
	b_startotherroutine(rengaru,"PRISON");
};

func void dia_andre_auslieferung_halvor()
{
	AI_Teleport(halvor,"NW_CITY_HABOUR_KASERN_HALVOR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Halvor_15_00");	//������ ������� ��������. �� ������� ������, ���������� ��������� � ���������.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_01");	//��� ���, ��� ���� ����������. ��� ���� ���������� ������� ���.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Halvor_08_02");	//� �� �����, ��� ��� ����� ������. � ����� ������� ���� ���� ������� ����� ������.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(halvor,"PRISON");
	MIS_THIEFGUILD_SUCKED = TRUE;
	HALVOR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_nagur()
{
	AI_Teleport(nagur,"NW_CITY_HABOUR_KASERN_NAGUR");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Nagur_15_00");	//����� ���� ���������� ���������. �� ������� ������������ ���� � �������� ������ ����������, ����� ����������� ����� � ����� �����.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_01");	//�� ������� ����������� ���������. � ���������� ������� �������� ��� �� �������.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Nagur_08_02");	//���, ������ �������. �� �� ��������.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(nagur,"PRISON");
	MIS_THIEFGUILD_SUCKED = TRUE;
	NAGUR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_canthar()
{
	AI_Teleport(canthar,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_00");	//�������� ������ �������� ���������� �� ����!
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_01");	//����? �������� ������� � �������� �������?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Canthar_15_02");	//� ������ ��� ��������� ���� ������, ������� ����������� ��, ��� ��� ���������� ������ �����.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Canthar_08_03");	//�������. � � �������� ������� ������� �� ����� �������. ������ �������, ��� �� ��� �� ��������.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(canthar,"KNAST");
	MIS_CANTHARS_KOMPROBRIEF = LOG_FAILED;
	b_checklog();
	CANTHAR_AUSGELIEFERT = TRUE;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};

func void dia_andre_auslieferung_sarah()
{
	AI_Teleport(sarah,"NW_CITY_HABOUR_KASERN_RENGARU");
	AI_Teleport(canthar,"NW_CITY_SARAH");
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_00");	//���� ������� ������ �����.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_01");	//����? �������� ������� � �������� �������? � ���� ���� ��������������?
	AI_Output(other,self,"DIA_Andre_Auslieferung_Sarah_15_02");	//� �� ������� ������, � �������� �������� ������ ���.
	AI_Output(self,other,"DIA_Andre_Auslieferung_Sarah_08_03");	//��� ���������� �� ���. � ������� ���������� ��.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD);
	b_startotherroutine(sarah,"KNAST");
	b_startotherroutine(canthar,"MARKTSTAND");
	SARAH_AUSGELIEFERT = TRUE;
	MIS_CANTHARS_KOMPROBRIEF = LOG_SUCCESS;
	b_giveplayerxp(XP_ANDRE_AUSLIEFERUNG);
	Info_ClearChoices(dia_andre_auslieferung);
};


instance DIA_ANDRE_DGRUNNING(C_INFO)
{
	npc = mil_311_andre;
	nr = 4;
	condition = dia_andre_dgrunning_condition;
	information = dia_andre_dgrunning_info;
	permanent = TRUE;
	description = "������ ������� �����...";
};


func int dia_andre_dgrunning_condition()
{
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_dgrunning_info()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_15_00");	//������ ������� �����...
	if(ANDRE_DIEBESGILDE_AUFGERAEUMT == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_08_01");	//�� ������ ������ �� ���� ����. � ������ ����� ����� � �����������.
		AI_Output(self,other,"DIA_Andre_DGRunning_08_02");	//������� ����� ������ �� ����� ��� ������������ �������� ������� ����� ������.
		MIS_ANDRE_GUILDOFTHIEVES = LOG_OBSOLETE;
		if(MIS_CASSIAKELCHE == LOG_RUNNING)
		{
			MIS_CASSIAKELCHE = LOG_OBSOLETE;
		};
		if(MIS_RAMIREZSEXTANT == LOG_RUNNING)
		{
			MIS_RAMIREZSEXTANT = LOG_OBSOLETE;
		};
		return;
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_08_03");	//��?
	Info_ClearChoices(dia_andre_dgrunning);
	Info_AddChoice(dia_andre_dgrunning,"� ������� ��� ����...",dia_andre_dgrunning_back);
	if(Npc_IsDead(cassia) && Npc_IsDead(jesper) && Npc_IsDead(ramirez))
	{
		Info_AddChoice(dia_andre_dgrunning,"� ���� �� ������������!",dia_andre_dgrunning_success);
	};
	if(((cassia.aivar[AIV_TALKEDTOPLAYER] == TRUE) || (jesper.aivar[AIV_TALKEDTOPLAYER] == TRUE) || (ramirez.aivar[AIV_TALKEDTOPLAYER] == TRUE)) && (DIEBESGILDE_VERRATEN == FALSE))
	{
		Info_AddChoice(dia_andre_dgrunning,"� ����� ������ ������� �����!",dia_andre_dgrunning_verrat);
	};
};

func void dia_andre_dgrunning_back()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_BACK_15_00");	//� ������� ��� ����...
	if(DIEBESGILDE_VERRATEN == TRUE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_01");	//������. � ��� ���� ��� ������� ������� �� ���������� ����� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_BACK_08_02");	//������! ����� ���� � �����.
	};
	Info_ClearChoices(dia_andre_dgrunning);
};

func void dia_andre_dgrunning_verrat()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_00");	//� ����� ������ ������� �����!
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_01");	//���?
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_02");	//� ����������� ��� �������.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_03");	//���? �� ���������� �����������...
	AI_Output(other,self,"DIA_Andre_DGRunning_Verrat_15_04");	//������, ��� �� �������� �� ���������� ����.
	AI_Output(self,other,"DIA_Andre_DGRunning_Verrat_08_05");	//�� ������������ ���� ������������?
	DIEBESGILDE_VERRATEN = TRUE;
	DG_GEFUNDEN = TRUE;
};

func void dia_andre_dgrunning_success()
{
	AI_Output(other,self,"DIA_Andre_DGRunning_Success_15_00");	//� ���� �� ������������!
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_01");	//�� ������ ������ ������� ������.
	DG_GEFUNDEN = TRUE;
	MIS_ANDRE_GUILDOFTHIEVES = LOG_SUCCESS;
	b_giveplayerxp(XP_GUILDOFTHIEVESPLATT);
	if(MIS_CASSIAKELCHE == LOG_RUNNING)
	{
		MIS_CASSIAKELCHE = LOG_OBSOLETE;
	};
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_02");	//���� �� ��� ��� ������ �������� � ���������, ��� ��� �����.
	}
	else if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_03");	//�� �������� ���� ������, ��� ��������� ����� ������ � ������ ������.
	};
	AI_Output(self,other,"DIA_Andre_DGRunning_Success_08_04");	//���� ���������� ������� �� ���� ��������. ���, ������.
	b_giveinvitems(self,other,itmi_gold,KOPFGELD * 3);
	Info_ClearChoices(dia_andre_dgrunning);
};


instance DIA_ANDRE_JOIN(C_INFO)
{
	npc = mil_311_andre;
	nr = 100;
	condition = dia_andre_join_condition;
	information = dia_andre_join_info;
	permanent = TRUE;
	description = "� ����� �������� � ���������!";
};


func int dia_andre_join_condition()
{
	if((hero.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_andre_asktojoin))
	{
		return TRUE;
	};
};

func void dia_andre_join_info()
{
	AI_Output(other,self,"DIA_Andre_JOIN_15_00");	//� ����� �������� � ���������!
	if((MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_01");	//� ������ ���� ����� � ����� ���� � ���������, ���� ���� �� � �� ��������� ����������� ����� ������.
		AI_Output(self,other,"DIA_Andre_JOIN_08_02");	//�� ������ �� ���� �� ������! ��� ������ ����� ����� ����� �� ���� ����������, ��� ������ ��� �������� �������������.
	}
	else if(PLAYER_ISAPPRENTICE > APP_NONE)
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_03");	//� �� ��������� ����������� ��������?
		if(PLAYER_ISAPPRENTICE == APP_HARAD)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_04");	//������ ���� ���� � �������.
			AI_Output(self,other,"DIA_Andre_JOIN_08_05");	//�����? � ���� ���. �� �������� �� ���. �� ��������� �������.
		};
		if(PLAYER_ISAPPRENTICE == APP_CONSTANTINO)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_06");	//� ������ ��������!
			AI_Output(self,other,"DIA_Andre_JOIN_08_07");	//� ���, � ���������, �� ��� �� ����� ������ �����. ��������, ���� ������ ������ ���������� ���.
			AI_Output(self,other,"DIA_Andre_JOIN_08_08");	//� ���� ��� ���� �� �������. �� ���� �������, ��� �� ��������� �������.
		};
		if(PLAYER_ISAPPRENTICE == APP_BOSPER)
		{
			AI_Output(other,self,"DIA_Andre_JOIN_15_09");	//������, ������-������, ���� ���� � �������.
			AI_Output(self,other,"DIA_Andre_JOIN_08_10");	//����� �� ��������� ������ ���-��� � ���, ��� ������ � ����? ��� ������, ������ ��� ��������� ���������� ��������� ������ �� ������ � ������.
			AI_Output(self,other,"DIA_Andre_JOIN_08_11");	//���, �����������, ����� ����, ������� ��������������� � ����� ���������.
			AI_Output(self,other,"DIA_Andre_JOIN_08_12");	//� ������ ��������� ������� � ���� ������.
		};
		AI_Output(self,other,"DIA_Andre_JOIN_08_13");	//���� �� ��������� �� ����, ����� �� ������ ������ ���������� � ���� ���������.
		if(MIS_ANDRE_GUILDOFTHIEVES == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Andre_JOIN_08_14");	//����� ����, ���� ������� �������� ����� �� ������� �����. � �� ������ ���� ������ �� ���� ������.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Andre_JOIN_08_15");	//����� ���� - �� �� ��� ��� �� ��������� ����� ������, � � ���� ���� ������.
		return;
	};
	AI_Output(self,other,"DIA_Andre_JOIN_08_16");	//�� ������ �������� � ���� ����, ���� ������. �� ���� ������� ������ ���� �������������.
	AI_Output(self,other,"DIA_Andre_JOIN_08_17");	//����� ����, ��� �� �������� ������� ���������, �� ��� �� ������� ������ ��� ����� ��� � ����� �� ����� �����.
	AI_Output(self,other,"DIA_Andre_JOIN_08_18");	//�� ����� ��������� ������ � ���� �� ������ � ������?
	Info_ClearChoices(dia_andre_join);
	Info_AddChoice(dia_andre_join,"� ���� �� ������...",dia_andre_join_no);
	Info_AddChoice(dia_andre_join,"� �����!",dia_andre_join_yes);
};

func void dia_andre_join_yes()
{
	AI_Output(other,self,"DIA_Andre_JOIN_Yes_15_00");	//� �����!
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_01");	//����� ��� ���� � ����. ����� ���������� � ���� ���������.
	Npc_SetTrueGuild(other,GIL_MIL);
	other.guild = GIL_MIL;
	Snd_Play("LEVELUP");
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_02");	//��� ���� �������.
	b_giveinvitems(self,other,itar_mil_l,1);
	AI_Output(self,other,"DIA_Andre_JOIN_Yes_08_03");	//���� �� � ��������� � ������������.
	SLD_AUFNAHME = LOG_OBSOLETE;
	KDF_AUFNAHME = LOG_OBSOLETE;
	MIL_AUFNAHME = LOG_SUCCESS;
	b_giveplayerxp(XP_BECOMEMILIZ);
	Info_ClearChoices(dia_andre_join);
};

func void dia_andre_join_no()
{
	AI_Output(other,self,"DIA_Andre_JOIN_No_15_00");	//� ���� �� ������...
	AI_Output(self,other,"DIA_Andre_JOIN_No_08_01");	//���� �� ��� ������������ � ����� �������, � �� ���� ������� ���� � ���������.
	Info_ClearChoices(dia_andre_join);
};


instance DIA_ANDRE_LORDHAGEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_lordhagen_condition;
	information = dia_andre_lordhagen_info;
	permanent = FALSE;
	description = "���� � ������ ������� ����� ������?";
};


func int dia_andre_lordhagen_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_lordhagen_info()
{
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_00");	//���� � ������ ������� ����� ������?
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_01");	//������ �� �������� ��� ������ � ���������. ��� ��������� ����. �� ���� ��������� ������ ���� ������������� ������.
	AI_Output(other,self,"DIA_Andre_LORDHAGEN_15_02");	//�� ��������, ��� ��� � ����...
	AI_Output(self,other,"DIA_Andre_LORDHAGEN_08_03");	//�����, ��� �� ������������ � ������ ���������. ���� ���� ��������������. ������ �� ������������� �� ������ ����, �� ��� ���������.
};


instance DIA_ANDRE_WAFFE(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_waffe_condition;
	information = dia_andre_waffe_info;
	permanent = FALSE;
	description = "� � ������ ������?";
};


func int dia_andre_waffe_condition()
{
	if((other.guild == GIL_MIL) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_andre_waffe_info()
{
	AI_Output(other,self,"DIA_Andre_Waffe_15_00");	//� � ������ ������?
	AI_Output(self,other,"DIA_Andre_Waffe_08_01");	//�������. ������ ���� ���������� ���. �� ���-�� � ����� ��� �� �����.
	AI_Output(self,other,"DIA_Andre_Waffe_08_02");	//�����, ��� �� ����������, � ������� ��� ����. ����� �� ������ ���� ������.
	AI_Output(self,other,"DIA_Andre_Waffe_08_03");	//� ���� �� ������ �������, ������ ������� ����� ����� � ����� ��������.
	MIS_ANDRE_PECK = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PECK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PECK,LOG_RUNNING);
	b_logentry(TOPIC_PECK,"��� ���-�� � ������. ���� � ������� ��� �����, � �������, � ����� �������� �� ���� ������.");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_FOUND_PECK(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_found_peck_condition;
	information = dia_andre_found_peck_info;
	permanent = FALSE;
	description = "��� ������� ����� ����.";
};


func int dia_andre_found_peck_condition()
{
	if(Npc_KnowsInfo(hero,dia_peck_found_peck) && (MIS_ANDRE_PECK == LOG_RUNNING) && (Npc_IsDead(peck) == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_found_peck_info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_15_00");	//��� ������� ����� ����.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_08_01");	//��, �� ��� �������� �� ���� ���� � ��������� � ���������� ����� ������������. ��� �� ����� ���?
	Info_ClearChoices(dia_andre_found_peck);
	Info_AddChoice(dia_andre_found_peck,"� �������� ��������� �� ���� � ������.",dia_andre_found_peck_somewhere);
	Info_AddChoice(dia_andre_found_peck,"� '������� ������'...",dia_andre_found_peck_redlight);
};

func void dia_andre_found_peck_somewhere()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_SOMEWHERE_15_00");	//� �������� ��������� �� ���� � ������.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_SOMEWHERE_08_01");	//������, � ������ ��� � ���� � ������ ������.
	MIS_ANDRE_PECK = LOG_OBSOLETE;
	b_giveplayerxp(XP_FOUNDPECK);
	Info_ClearChoices(dia_andre_found_peck);
};

func void dia_andre_found_peck_redlight()
{
	AI_Output(other,self,"DIA_Andre_FOUND_PECK_REDLIGHT_15_00");	//"�� ��� � ""������� ������""."
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_01");	//�� ���� �� ����������� � ��������� ������ ����, ����� ��������� ���� �����������.
	AI_Output(self,other,"DIA_Andre_FOUND_PECK_REDLIGHT_08_02");	//� �����, ��� ����� �������� ���������� � ���.
	b_giveplayerxp(XP_FOUNDPECK * 2);
	MIS_ANDRE_PECK = LOG_SUCCESS;
	Info_ClearChoices(dia_andre_found_peck);
};

func void b_andresold()
{
	AI_Output(self,other,"DIA_Andre_Sold_08_00");	//��� ���� ���������.
	b_giveinvitems(self,other,itmi_gold,ANDRE_SOLD);
};


instance DIA_ANDRE_FIRSTMISSION(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_firstmission_condition;
	information = dia_andre_firstmission_info;
	permanent = FALSE;
	description = "� ���� ���� ������� ��� ����?";
};


func int dia_andre_firstmission_condition()
{
	if(other.guild == GIL_MIL)
	{
		return TRUE;
	};
};

func void dia_andre_firstmission_info()
{
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_00");	//� ���� ���� ������� ��� ����?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_01");	//��������� ����� � ������ ��������� ����� ����� �������� �����.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_02");	//�� �� ����� ���������, ����� ��� ������ ����������� �� ������.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_03");	//� ��������� ������, ��� ����� ������ ������ ������ � �� ������ ��������, �� ������ ��� � ���, ����� ������� ������.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_04");	//��� �����������. �������� ������, ����� ��� ������ ��������� ��������� ����� ��� ���������.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_05");	//� ����������, ��� � ����� ����� ��������� ��������. �������, ��� ��� �������� ����� � �����.
	AI_Output(other,self,"DIA_Andre_FIRSTMISSION_15_06");	//��� � ���� �������?
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_07");	//������, ���� �� ����� �����, ������ � �������� ������, ��� ���-�� � ����� ��������� ����� ��� ���� �����.
	AI_Output(self,other,"DIA_Andre_FIRSTMISSION_08_08");	//����� ��� � ������� ���� ��� ���.
	MIS_ANDRE_WAREHOUSE = LOG_RUNNING;
	Log_CreateTopic(TOPIC_WAREHOUSE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WAREHOUSE,LOG_RUNNING);
	b_logentry(TOPIC_WAREHOUSE,"��� �������� ����� ������ � ������. ������ ��������� �� ���� � ������� ����. � ������ ����� ���� ��� � �������� ��� ����� �����.");
};


instance DIA_ANDRE_FOUND_STUFF(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_found_stuff_condition;
	information = dia_andre_found_stuff_info;
	permanent = TRUE;
	description = "������ ����...";
};


func int dia_andre_found_stuff_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_found_stuff_info()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_00");	//������ ����...
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_08_01");	//�� ����� ���?
	if((Npc_HasItems(other,itmi_herbpaket) > 0) || (MIS_CIPHER_PAKET == LOG_SUCCESS))
	{
		Info_ClearChoices(dia_andre_found_stuff);
		if(Npc_HasItems(other,itmi_herbpaket) > 0)
		{
			Info_AddChoice(dia_andre_found_stuff,"��, ��� ��.",dia_andre_found_stuff_ja);
		};
		Info_AddChoice(dia_andre_found_stuff,"� �������� �� � ����.",dia_andre_found_stuff_becken);
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_FOUND_STUFF_15_02");	//���� ���.
	};
};

func void dia_andre_found_stuff_ja()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Ja_15_00");	//��, ��� ��.
	b_giveinvitems(other,self,itmi_herbpaket,1);
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Ja_08_01");	//�������. �� ����� �������� ��� �����.
	b_andresold();
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	MIS_CIPHER_PAKET = LOG_FAILED;
	b_giveplayerxp(XP_WAREHOUSE_SUPER * 2);
	Info_ClearChoices(dia_andre_found_stuff);
};

func void dia_andre_found_stuff_becken()
{
	AI_Output(other,self,"DIA_Andre_FOUND_STUFF_Becken_15_00");	//� �������� �� � ����.
	AI_Output(self,other,"DIA_Andre_FOUND_STUFF_Becken_08_01");	//��? ��, �������, ��� ��� ������ �� ������ ������� � ������ ����.
	b_andresold();
	MIS_ANDRE_WAREHOUSE = LOG_SUCCESS;
	b_giveplayerxp(XP_WAREHOUSE_SUPER);
	Info_ClearChoices(dia_andre_found_stuff);
};


instance DIA_ANDRE_FIND_DEALER(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_find_dealer_condition;
	information = dia_andre_find_dealer_info;
	permanent = FALSE;
	description = "� ���� ���� ��� ������ ��� ����?";
};


func int dia_andre_find_dealer_condition()
{
	if((MIS_ANDRE_WAREHOUSE == LOG_SUCCESS) && (Npc_IsDead(borka) == FALSE))
	{
		return TRUE;
	};
};

func void dia_andre_find_dealer_info()
{
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_00");	//� ���� ���� ��� ������ ��� ����?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_01");	//�� ����� �������� ����� �� ������� - ��� ������.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_02");	//�� � ���� �����, ��� �������������� �� ����� �������.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_03");	//���, ������ ����, ���-�� � �������� ��������.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_04");	//���� �� ���� ������� ����� �������� � �����, �� ����� �� ��� ������.
	AI_Output(other,self,"DIA_Andre_FIND_DEALER_15_05");	//��� ������ ��� ����� �������?
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_06");	//����� �������� � ������� ��� ������� ���� ���� �����. ��� ����� ��������, �� ����� �� �� ������ ���������� ���.
	AI_Output(self,other,"DIA_Andre_FIND_DEALER_08_07");	//�������� � ��������. �� ������ ����� �������� �������. ��������, �� ������ ������ ����.
	MIS_ANDRE_REDLIGHT = LOG_RUNNING;
	b_startotherroutine(nadja,"SMOKE");
	Log_CreateTopic(TOPIC_REDLIGHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_REDLIGHT,LOG_RUNNING);
	b_logentry(TOPIC_REDLIGHT,"� ������ ����� ��������, ���������� �������� ����� � �������� ��������. � ������ ��������� ��� ������� ��� ������� �����. ������ ����� ������ ��� � ����.");
};


instance DIA_ANDRE_REDLIGHT_SUCCESS(C_INFO)
{
	npc = mil_311_andre;
	nr = 2;
	condition = dia_andre_redlight_success_condition;
	information = dia_andre_redlight_success_info;
	permanent = TRUE;
	description = "������ �����...";
};


func int dia_andre_redlight_success_condition()
{
	if(MIS_ANDRE_REDLIGHT == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_redlight_success_info()
{
	AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_00");	//������ �����...
	if((Npc_IsDead(borka) == TRUE) || (UNDERCOVER_FAILED == TRUE))
	{
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_01");	//� �� �����, ��� �� ������ ������ ���-�� ������ � �������� ��������.
		if(Npc_IsDead(borka) == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_02");	//������ �� ������, ����� ���� �������� �����.
		};
		if(NADJA_VICTIM == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_03");	//��� ������� �� �������� ������, ����, ������. ��������, ��� ������ ��������� ����������.
			b_removenpc(vlk_435_nadja);
		};
		if(UNDERCOVER_FAILED == TRUE)
		{
			AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_04");	//�� ��� ������������ ���������.
		};
		MIS_ANDRE_REDLIGHT = LOG_FAILED;
		b_checklog();
	}
	else if(BORKA_DEAL == 2)
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_05");	//� ����, ��� �������������� ����� � ������. ��� �����, �������� � ������� ������.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_06");	//�����? � ���� ���� ��������������?
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_07");	//�� ������ ��� �������� �����.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_08");	//�������, ����� ���������� ��� ���. � ������� ���������� ���������� ���.
		b_startotherroutine(borka,"PRISON");
		MIS_ANDRE_REDLIGHT = LOG_SUCCESS;
		b_giveplayerxp(XP_REDLIGHT);
		b_andresold();
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_REDLIGHT_SUCCESS_15_09");	//...� ��� ��� ������� ��� ����.
		AI_Output(self,other,"DIA_Andre_REDLIGHT_SUCCESS_08_10");	//������. �����, ��� �� ������ ��������� ����� �������� ��������� ������ � �����.
	};
};


instance DIA_ANDRE_HILFBAUERLOBART(C_INFO)
{
	npc = mil_311_andre;
	nr = 3;
	condition = dia_andre_hilfbauerlobart_condition;
	information = dia_andre_hilfbauerlobart_info;
	description = "� ���� ���� ��� ������� ��� ����?";
};


func int dia_andre_hilfbauerlobart_condition()
{
	if(MIS_ANDRE_WAREHOUSE == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_andre_hilfbauerlobart_info()
{
	AI_Output(other,self,"DIA_Andre_HILFBAUERLOBART_15_00");	//� ���� ���� ��� ������� ��� ����?
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_01");	//� ������� ������� �����-�� �������� �� ��� �����.
	AI_Output(self,other,"DIA_Andre_HILFBAUERLOBART_08_02");	//���� �� ������� ���, ��� ������� ��� ��������� � �������. ��� ��� ����������� ���� � ��������, ��� ��� �� ���.
	Log_CreateTopic(TOPIC_FELDRAEUBER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FELDRAEUBER,LOG_RUNNING);
	b_logentry(TOPIC_FELDRAEUBER,"����� �������� ���� �� ����� �������. � ����� ������ ������ ������� ������������ ������� �� �����.");
	MIS_ANDREHELPLOBART = LOG_RUNNING;
	Wld_InsertNpc(lobarts_giant_bug1,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(lobarts_giant_bug2,"NW_FARM1_FIELD_06");
	Wld_InsertNpc(lobarts_giant_bug3,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(lobarts_giant_bug4,"NW_FARM1_FIELD_05");
	Wld_InsertNpc(lobarts_giant_bug5,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(lobarts_giant_bug6,"NW_FARM1_FIELD_04");
	Wld_InsertNpc(lobarts_giant_bug7,"NW_FARM1_FIELD_03");
	b_startotherroutine(vino,"BUGSTHERE");
	b_startotherroutine(lobartsbauer1,"BUGSTHERE");
	b_startotherroutine(lobartsbauer2,"BUGSTHERE");
	AI_StopProcessInfos(self);
};


instance DIA_ANDRE_LOBART_SUCCESS(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_lobart_success_condition;
	information = dia_andre_lobart_success_info;
	description = "� ����� �������.";
};


func int dia_andre_lobart_success_condition()
{
	if(MIS_ANDREHELPLOBART == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_andre_lobart_success_info()
{
	AI_Output(other,self,"DIA_Andre_LOBART_SUCCESS_15_00");	//� ����� �������.
	AI_Output(self,other,"DIA_Andre_LOBART_SUCCESS_08_01");	//�����������. ���� ������ ����� ��������, �� ��������� ��������� ���� ������.
	b_giveplayerxp(XP_LOBARTBUGS);
	b_andresold();
};

func void b_andre_gotolordhagen()
{
	AI_Output(self,other,"DIA_Andre_Add_08_11");	//���� ����� ����������� ����� � ����.
};


instance DIA_ANDRE_BERICHTDRACHEN(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichtdrachen_condition;
	information = dia_andre_berichtdrachen_info;
	permanent = FALSE;
	description = "� ��� � ������ �������� � ����� ��������!";
};


func int dia_andre_berichtdrachen_condition()
{
	if((ENTEROW_KAPITEL2 == TRUE) && (MIS_OLDWORLD != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_andre_berichtdrachen_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_13");	//� ��� � ������ �������� � ����� ��������!
	if(Npc_HasItems(hero,itwr_paladinletter_mis) > 0)
	{
		AI_Output(other,self,"DIA_Andre_Add_15_14");	//� ���� ���� ������ �� ������������ �������, �������������� ��, ��� � ������.
	};
	AI_Output(self,other,"DIA_Andre_Add_08_10");	//��� ������������ ����� ������!
	b_andre_gotolordhagen();
};


instance DIA_ANDRE_BENNETINPRISON(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_bennetinprison_condition;
	information = dia_andre_bennetinprison_info;
	permanent = TRUE;
	description = "� ��� ������ �������, �������?";
};


func int dia_andre_bennetinprison_condition()
{
	if(MIS_RESCUEBENNET == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_andre_bennetinprison_info()
{
	AI_Output(other,self,"DIA_Andre_BennetInPrison_15_00");	//� ��� ������ �������, �������?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_08_01");	//�� ������ � ���� ����� ��������? �� ����� �� ��������, ��� ��� ����� �����.
	AI_Output(other,self,"DIA_Andre_BennetInPrison_Talk_15_00");	//���� � ���������� � ���?
	AI_Output(self,other,"DIA_Andre_BennetInPrison_Talk_08_01");	//�������. �� ���� �� ����������� ������ ��� ������, �� ��������� �� �������� ����� � ���.
};


instance DIA_ANDRE_CORNELIUS_LIAR(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_cornelius_liar_condition;
	information = dia_andre_cornelius_liar_info;
	permanent = TRUE;
	description = "� �����, ��������� ����.";
};


func int dia_andre_cornelius_liar_condition()
{
	if((CORNELIUS_THREATENBYMILSC == TRUE) && (CORNELIUSFLEE != TRUE))
	{
		return TRUE;
	};
};

func void dia_andre_cornelius_liar_info()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_15_00");	//� �����, ��������� ����.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_08_01");	//�� ������?
	Info_ClearChoices(dia_andre_cornelius_liar);
	Info_AddChoice(dia_andre_cornelius_liar,"���.",dia_andre_cornelius_liar_no);
	Info_AddChoice(dia_andre_cornelius_liar,"��.",dia_andre_cornelius_liar_yes);
};

func void dia_andre_cornelius_liar_no()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_No_15_00");	//���.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_01");	//����� �� ����� �������� � ����� ����������� �� ���� �����.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_02");	//��������� - ����������� �������. �� ����� ������� ���� ����� ����, ���� �������.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_No_08_03");	//���� � ���� ��� �������������, � ����� �� ���� ������ ����.
	Info_ClearChoices(dia_andre_cornelius_liar);
};

func void dia_andre_cornelius_liar_yes()
{
	AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_00");	//��.
	AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_01");	//��� �� �������������� � ���� ����?
	if(CORNELIUS_ISLIAR == TRUE)
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_02");	//� ������ ��� �������! ��� ���������. ���, ��� �� ������, ���� �����.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_03");	//���� ��� ������������� ���, �� ������ ���������� �������� �� ���� ����� ������.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_04");	//������ ��� ���� �������. �� ���������� � ���� ����.
	}
	else
	{
		AI_Output(other,self,"DIA_Andre_Cornelius_Liar_Yes_15_05");	//�-�-�, ��, � �����...
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_06");	//��� ����� ��������������, � �� �������������. ������� ��������������, � ����� � ����� ���-������ �������.
		AI_Output(self,other,"DIA_Andre_Cornelius_Liar_Yes_08_07");	//� �� ���� ������� ���� ����� ������������ �������� �����.
	};
	Info_ClearChoices(dia_andre_cornelius_liar);
};


instance DIA_ANDRE_PALADIN(C_INFO)
{
	npc = mil_311_andre;
	condition = dia_andre_paladin_condition;
	information = dia_andre_paladin_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_andre_paladin_condition()
{
	if(other.guild == GIL_PAL)
	{
		return TRUE;
	};
};

func void dia_andre_paladin_info()
{
	AI_Output(self,other,"DIA_Andre_Paladin_08_00");	//������ �� �������! ����������!
	AI_Output(self,other,"DIA_Andre_Paladin_08_01");	//� � ������ ������ ����, ��� �� �� ����������� ����� � ���������.
};


instance DIA_ANDRE_PERM(C_INFO)
{
	npc = mil_311_andre;
	nr = 100;
	condition = dia_andre_perm_condition;
	information = dia_andre_perm_info;
	permanent = TRUE;
	description = "��� ���������� � ������?";
};


func int dia_andre_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_andre_perm_info()
{
	AI_Output(other,self,"DIA_Andre_PERM_15_00");	//��� ���������� � ������?
	AI_Output(self,other,"DIA_Andre_PERM_08_01");	//��� ��� ���������.
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_02");	//�������� ���� �������.
	};
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Andre_PERM_08_03");	//� ����� ������� �� ������ ����������� ��������������� ����� ������. ���, �������� � ���.
	};
};


instance DIA_ANDRE_BERICHTDRACHENTOT(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichtdrachentot_condition;
	information = dia_andre_berichtdrachentot_info;
	permanent = FALSE;
	description = "� ���� ���� �������� � ������ ��������!";
};


func int dia_andre_berichtdrachentot_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_andre_berichtdrachentot_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_15");	//� ���� ���� �������� � ������ ��������!
	AI_Output(self,other,"DIA_Andre_Add_08_08");	//���� ��� ������, �� ������ ���������� �� ���� ����� ������.
	b_andre_gotolordhagen();
};


instance DIA_ANDRE_BERICHTTORAUF(C_INFO)
{
	npc = mil_311_andre;
	nr = 1;
	condition = dia_andre_berichttorauf_condition;
	information = dia_andre_berichttorauf_info;
	permanent = FALSE;
	description = "����� � ������ �������� ���������� ����!";
};


func int dia_andre_berichttorauf_condition()
{
	if((KAPITEL == 5) && (MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_andre_berichtdrachentot))
	{
		return TRUE;
	};
};

func void dia_andre_berichttorauf_info()
{
	AI_Output(other,self,"DIA_Andre_Add_15_16");	//����� � ������ �������� ���������� ����!
	AI_Output(self,other,"DIA_Andre_Add_08_09");	//���! ���� ����� ������ �������� �� ����.
	b_andre_gotolordhagen();
};

