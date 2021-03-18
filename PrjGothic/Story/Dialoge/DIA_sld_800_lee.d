
instance DIA_LEE_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_exit_condition;
	information = dia_lee_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lee_exit_info()
{
	AI_StopProcessInfos(self);
};


var int lee_teleport;

func void b_lee_teleport()
{
	AI_Output(self,other,"DIA_Lee_Add_04_05");	//��. ������, ��� �� ������.
	AI_Output(other,self,"DIA_Lee_Add_15_06");	//��� ���������?
	AI_Output(self,other,"DIA_Lee_Add_04_07");	//� ����� ��� � ������ �������.
	b_giveinvitems(self,other,itru_teleportfarm,1);
	AI_Output(self,other,"DIA_Lee_Add_04_08");	//��� ���������� ����. � �����, ��� ����� � ����� ����� ��������� ���� ����, �� �����.
	AI_Output(self,other,"DIA_Lee_Add_04_09");	//� �������, ��� �� ������� ������������ ��.
	LEE_TELEPORT = TRUE;
};


var int lee_lastpetzcounter;
var int lee_lastpetzcrime;

instance DIA_LEE_PMSCHULDEN(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_pmschulden_condition;
	information = dia_lee_pmschulden_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_pmschulden_condition()
{
	if(Npc_IsInState(self,zs_talk) && (LEE_SCHULDEN > 0) && (b_getgreatestpetzcrime(self) <= LEE_LASTPETZCRIME))
	{
		return TRUE;
	};
};

func void dia_lee_pmschulden_info()
{
	var int diff;
	if((KAPITEL >= 3) && (LEE_TELEPORT == FALSE))
	{
		b_lee_teleport();
	};
	AI_Output(self,other,"DIA_Lee_PMSchulden_04_00");	//�� �����, ����� �������� ������ �����?
	if(b_gettotalpetzcounter(self) > LEE_LASTPETZCOUNTER)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_01");	//� ��� ������ ����, ��� �� ���� ������� �������� �����.
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_02");	//���� �����, ��� �� ����� ��������� ���� ������ ����� �����.
		if(LEE_SCHULDEN < 1000)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_03");	//�� � �����������, �� ������ ����� ������ �����.
			AI_Output(other,self,"DIA_Lee_PMAdd_15_00");	//�������?
			diff = b_gettotalpetzcounter(self) - LEE_LASTPETZCOUNTER;
			if(diff > 0)
			{
				LEE_SCHULDEN = LEE_SCHULDEN + (diff * 50);
			};
			if(LEE_SCHULDEN > 1000)
			{
				LEE_SCHULDEN = 1000;
			};
			b_say_gold(self,other,LEE_SCHULDEN);
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_04");	//� �����, �� �����.
		};
	}
	else if(b_getgreatestpetzcrime(self) < LEE_LASTPETZCRIME)
	{
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_05");	//������ ������� ������� ��� ����.
		if(LEE_LASTPETZCRIME == CRIME_MURDER)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_06");	//����������, �� �������� ������, ��� �����, ��� �� �������� ��������.
		};
		if((LEE_LASTPETZCRIME == CRIME_THEFT) || ((LEE_LASTPETZCRIME > CRIME_THEFT) && (b_getgreatestpetzcrime(self) < CRIME_THEFT)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_07");	//����� ������ �� ����� �����������, ��� �����, ��� �� �������.
		};
		if((LEE_LASTPETZCRIME == CRIME_ATTACK) || ((LEE_LASTPETZCRIME > CRIME_ATTACK) && (b_getgreatestpetzcrime(self) < CRIME_ATTACK)))
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_08");	//�� �������� ������, ��� ����� ��, ��� �� ����� ������ �� ��������.
		};
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_09");	//������, ��� ��� ��������� ������ ���� ������������ � �������.
		};
		AI_Output(self,other,"DIA_Lee_PMSchulden_04_10");	//�� ��, ����� ����, ��� ������ ���������� �� �������� �������.
		if(b_getgreatestpetzcrime(self) == CRIME_NONE)
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_11");	//��� �� �� �� ����, ���� ������ �� ����� �������.
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_12");	//�� ���� ���������� � �������.
			LEE_SCHULDEN = 0;
			LEE_LASTPETZCOUNTER = 0;
			LEE_LASTPETZCRIME = CRIME_NONE;
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_13");	//���� ����: �� ������, ��� �� �����, ��������� ����� ���������.
			b_say_gold(self,other,LEE_SCHULDEN);
			AI_Output(self,other,"DIA_Lee_PMSchulden_04_14");	//��� ��� ������ �����?
		};
	};
	if(b_getgreatestpetzcrime(self) != CRIME_NONE)
	{
		Info_ClearChoices(dia_lee_pmschulden);
		Info_ClearChoices(dia_lee_petzmaster);
		Info_AddChoice(dia_lee_pmschulden,"� ���� ��� ������� ������!",dia_lee_petzmaster_paylater);
		Info_AddChoice(dia_lee_pmschulden,"������� ��� �����?",dia_lee_pmschulden_howmuchagain);
		if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
		{
			Info_AddChoice(dia_lee_pmschulden,"� ���� ��������� �����!",dia_lee_petzmaster_paynow);
		};
	};
};

func void dia_lee_pmschulden_howmuchagain()
{
	AI_Output(other,self,"DIA_Lee_PMSchulden_HowMuchAgain_15_00");	//������� ��� �����?
	b_say_gold(self,other,LEE_SCHULDEN);
	Info_ClearChoices(dia_lee_pmschulden);
	Info_ClearChoices(dia_lee_petzmaster);
	Info_AddChoice(dia_lee_pmschulden,"� ���� ��� ������� ������!",dia_lee_petzmaster_paylater);
	Info_AddChoice(dia_lee_pmschulden,"������� ��� �����?",dia_lee_pmschulden_howmuchagain);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_pmschulden,"� ���� ��������� �����!",dia_lee_petzmaster_paynow);
	};
};


instance DIA_LEE_PETZMASTER(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_petzmaster_condition;
	information = dia_lee_petzmaster_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lee_petzmaster_condition()
{
	if(b_getgreatestpetzcrime(self) > LEE_LASTPETZCRIME)
	{
		return TRUE;
	};
};

func void dia_lee_petzmaster_info()
{
	if((KAPITEL >= 3) && (LEE_TELEPORT == FALSE))
	{
		b_lee_teleport();
	};
	LEE_SCHULDEN = 0;
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_00");	//������ ������� ���� ��������� ������� ����? (���������) ��� �� �������, �� �������� ���� ��������?
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_01");	//� ������ �� �����, ��� �� ��� ��� ���. �� ��� �� ������� ����... �, �����...
	};
	if(b_getgreatestpetzcrime(self) == CRIME_MURDER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_02");	//������, ��� �� ��� �� ������ �� ���, ���� ���� ���� �� ����� ������ ���������.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_03");	//�������� - ������ �����, � ������� ����� ���� ����� �������� �� ����, �� �� �� ������ ������ ��� ������� �����.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
		LEE_SCHULDEN = LEE_SCHULDEN + 500;
		if((PETZCOUNTER_FARM_THEFT + PETZCOUNTER_FARM_ATTACK + PETZCOUNTER_FARM_SHEEPKILLER) > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_04");	//�� ������ ��� � ������ ����� ������������� �����.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_05");	//� ���� ������ ���� ��������� �� ����� ������.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_06");	//��� ��������� ���� � ����������� �����, �������. ���� ������ �������, � ������ ���� �� ������� �� ��� ��� �����, ������ ����� ����� ������� ���������.
	};
	if(b_getgreatestpetzcrime(self) == CRIME_THEFT)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_07");	//������, ��� �� ������. � ������, ��� �� ���-�� �����.
		if(PETZCOUNTER_FARM_ATTACK > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_08");	//� ����� ��� �� ���������� ��������.
		};
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_09");	//� ���� ��������� ����.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_10");	//�� �� ������ ������ ��� ������� �������� �����. � ����� ������� ���� ����������, ����� � ��������� ������������ ��������.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_11");	//��� ��������: �� �������, �� �������� ���� ������, ��, �� ������� ����, �� ���� ���� ����� ����� ������.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_ATTACK)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_12");	//���� �� ����������� � ����� � ���������, ��� ����...
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_13");	//�� ���� �� ����� �������, ��� ����� ����� � �����. � �� ������� ������������ �������� �� ����.
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			AI_Output(self,other,"DIA_Lee_PETZMASTER_04_14");	//�� ������ ��� � ���, ��� �� �������� � ���������, ����� ���-�� ������� ����.
		};
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_15");	//�� ������ ��������� �����. ���� ������ ��������� � ������ �����, �� ��� ������������ ������ ������ ��������.
		LEE_SCHULDEN = b_gettotalpetzcounter(self) * 50;
	};
	if(b_getgreatestpetzcrime(self) == CRIME_SHEEPKILLER)
	{
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_16");	//���� ������� �� ����, ��� � ���� �������� ��� �����. ������� ��� ����.
		AI_Output(self,other,"DIA_Lee_PETZMASTER_04_17");	//���� �������� ��������� ��� �����������!
		LEE_SCHULDEN = 100;
	};
	AI_Output(other,self,"DIA_Lee_PETZMASTER_15_18");	//�������?
	if(LEE_SCHULDEN > 1000)
	{
		LEE_SCHULDEN = 1000;
	};
	b_say_gold(self,other,LEE_SCHULDEN);
	Info_ClearChoices(dia_lee_pmschulden);
	Info_ClearChoices(dia_lee_petzmaster);
	Info_AddChoice(dia_lee_petzmaster,"� ���� ��� ������� ������!",dia_lee_petzmaster_paylater);
	if(Npc_HasItems(other,itmi_gold) >= LEE_SCHULDEN)
	{
		Info_AddChoice(dia_lee_petzmaster,"� ���� ��������� �����!",dia_lee_petzmaster_paynow);
	};
};

func void dia_lee_petzmaster_paynow()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayNow_15_00");	//� ���� ��������� �����!
	b_giveinvitems(other,self,itmi_gold,LEE_SCHULDEN);
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayNow_04_01");	//������! � ��������, ����� ��� ������ ����� �� �����. ������ ������� ��� �������� �������.
	b_grantabsolution(LOC_FARM);
	LEE_SCHULDEN = 0;
	LEE_LASTPETZCOUNTER = 0;
	LEE_LASTPETZCRIME = CRIME_NONE;
	Info_ClearChoices(dia_lee_petzmaster);
	Info_ClearChoices(dia_lee_pmschulden);
};

func void dia_lee_petzmaster_paylater()
{
	AI_Output(other,self,"DIA_Lee_PETZMASTER_PayLater_15_00");	//� ���� ��� ������� ������!
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_01");	//����� ������ ��� � ��������.
	AI_Output(self,other,"DIA_Lee_PETZMASTER_PayLater_04_02");	//�� � �� �����, ��� �� ������� ������� ��� �����, �� �����. ���� ���� �������, ���� ��� ������ �� �����������.
	LEE_LASTPETZCOUNTER = b_gettotalpetzcounter(self);
	LEE_LASTPETZCRIME = b_getgreatestpetzcrime(self);
	AI_StopProcessInfos(self);
};


instance DIA_LEE_HALLO(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_hallo_condition;
	information = dia_lee_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_hallo_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_hallo_info()
{
	AI_Output(self,other,"DIA_Lee_Hallo_04_00");	//������ ������� ���� ��������� ������� ����? (���������) ��� �� ������� �����? � �����, �� �����!
	AI_Output(other,self,"DIA_Lee_Hallo_15_01");	//� ���� �� ��� �����?
	AI_Output(self,other,"DIA_Lee_Hallo_04_02");	//���� ������ ���, ��� ��� �� �������� ������.
	AI_Output(other,self,"DIA_Lee_Hallo_15_03");	//��, ��� ������������� ��� �.
	AI_Output(self,other,"DIA_Lee_Hallo_04_04");	//������� �� �� �������, ��� ������� ����� ������ ����� ����� �����. ��� ������� ���� ����? �� �� ����� �� ������ ���...
};


instance DIA_LEE_PALADINE(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_paladine_condition;
	information = dia_lee_paladine_info;
	permanent = FALSE;
	description = "��� ������ ���������� ���������� � ���������� � ������...";
};


func int dia_lee_paladine_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lee_paladine_info()
{
	AI_Output(other,self,"DIA_Lee_Paladine_15_00");	//��� ������ ���������� ���������� � ���������� � ������. �� �� ��� �� ������ ��� ��������� �� ���?
	AI_Output(self,other,"DIA_Lee_Paladine_04_01");	//(�����������) ����� � ���� ����� ���� ���� � ����������?
	AI_Output(other,self,"DIA_Lee_Paladine_15_02");	//��� ������ �������...
	AI_Output(self,other,"DIA_Lee_Paladine_04_03");	//� ���� ���� �����.
	AI_Output(other,self,"DIA_Lee_Paladine_15_04");	//(��������) ������� ��� ��� �������. �� �����, ����� � ��������� ������ ������, ���� ������.
	AI_Output(self,other,"DIA_Lee_Paladine_04_05");	//������, �� ��� ��� � ����� � ���� �����������. �������. � ���� ������ ��������� � ���������, ��?
	AI_Output(other,self,"DIA_Lee_Paladine_15_06");	//��������� � ����, ��.
	AI_Output(self,other,"DIA_Lee_Paladine_04_07");	//� ���� ������ ���� ��������� �� ���������. �� ������� �� ������ ����� ����� �� ���.
};


instance DIA_LEE_PALADINEHOW(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_paladinehow_condition;
	information = dia_lee_paladinehow_info;
	permanent = FALSE;
	description = "��� �� ������ ������ ��� ��������� �� ���������?";
};


func int dia_lee_paladinehow_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lee_paladine))
	{
		return TRUE;
	};
};

func void dia_lee_paladinehow_info()
{
	AI_Output(other,self,"DIA_Lee_PaladineHOW_15_00");	//��� �� ������ ������ ��� ��������� �� ���������?
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_01");	//������� ���. � ���� ���� ����. � �����, �� ��� ��� ��������� ��� ����...
	AI_Output(self,other,"DIA_Lee_PaladineHOW_04_02");	//� ����� ���� � ����������, � �� ������� ��� ������. �� ������� ������������ � ���!
};


instance DIA_LEE_LEESPLAN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_leesplan_condition;
	information = dia_lee_leesplan_info;
	permanent = FALSE;
	description = "� ��� �� ����� �����������?";
};


func int dia_lee_leesplan_condition()
{
	if(LEE_ISONBOARD == FALSE)
	{
		return TRUE;
	};
};

func void dia_lee_leesplan_info()
{
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_00");	//� ��� �� ����� �����������?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_01");	//��� ������: � ����� ��� ���������, ����� �� ��� ������ �������� � ����� �������.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_02");	//���� ����� ��� ��� ������ ��� �����, � ������ ���� �� � �������� ����������.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_03");	//�� ���� ������� - ����� �������, ��� ������ ����� �� ������. ������� ��������, �� �������� ����� �� ��������.
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_04");	//� ��� ������ �������� ����, ��� ������ ��� ������������, �����, �������, � ������ �� ����������� � ����.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_LeesPlan_04_05");	//����� ������, ��� ���� �������� �������������� ������ � ���.
	};
	AI_Output(other,self,"DIA_Lee_LeesPlan_15_06");	//��� �� ����������� �� ������ �������?
	AI_Output(self,other,"DIA_Lee_LeesPlan_04_07");	//�����������, �������� ����� ���� ����������� � ��������� ���� �� �������. �� ��� �������, ����� ������ �����.
};


instance DIA_LEE_WANNAJOIN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_wannajoin_condition;
	information = dia_lee_wannajoin_info;
	permanent = FALSE;
	description = "� ���� �������������� � ���!";
};


func int dia_lee_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lee_wannajoin_info()
{
	AI_Output(other,self,"DIA_Lee_WannaJoin_15_00");	//� ���� �������������� � ���!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_01");	//� ��������, ��� �� ������� ���! ��� ����� ����� ������ �������� ����.
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_02");	//�� ��������� ���������, ��� � �����, �� ���� �������� �����, ���� ��������!
	AI_Output(self,other,"DIA_Lee_WannaJoin_04_03");	//� ��������, �� ������ ���������� ����� ������. ��, ������ ���� ������� ��������, ������� ����� �������������, ��, � �����, ��� �� ����� ���������...
};


instance DIA_LEE_CLEARWHAT(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_clearwhat_condition;
	information = dia_lee_clearwhat_info;
	permanent = FALSE;
	description = "��� ����� '�������������' ������ ��� � ����� �������������� � ���?";
};


func int dia_lee_clearwhat_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lee_clearwhat_info()
{
	AI_Output(other,self,"DIA_Lee_ClearWhat_15_00");	//��� ����� '�������������' ������ ��� � ����� �������������� � ���?
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_01");	//��� �������� ����, ��������. �� ������ ���������� �� ����� ������ � ��� ���������.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_02");	//�����, ���� ��� � ����� ������. � ����� ������� ����, ������ ���� ����������� ��������� ����������, ��� �� ������ �������������� � ���.
	AI_Output(self,other,"DIA_Lee_ClearWhat_04_03");	//�� �� ���� � ����� ���� ��� �� ����� �������. �� ����� ��������������� ���...
	Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
	b_logentry(TOPIC_BECOMESLD,"����� ���� �������� � ���� ���������, � ������ �������� ��������� �����, ����� ����, ��� �������� ���������� ���������.");
};


instance DIA_LEE_OTHERSLD(C_INFO)
{
	npc = sld_800_lee;
	nr = 7;
	condition = dia_lee_othersld_condition;
	information = dia_lee_othersld_info;
	permanent = FALSE;
	description = "��� ��� ������� ��������� ������������� �� ����?";
};


func int dia_lee_othersld_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lee_othersld_info()
{
	AI_Output(other,self,"DIA_Lee_OtherSld_15_00");	//��� ��� ������� ��������� ������������� �� ����?
	AI_Output(self,other,"DIA_Lee_OtherSld_04_01");	//����� ��, ��� ��������� �� ����, ����� �� ������ ���������, � �� ������.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_02");	//�������� � ��������. �� ������ ��������� ����� �����. �� ���� ���� ���������.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_03");	//���� �� ������� ������ ���, �� �������� ������� ����� ������������ ��������.
	AI_Output(self,other,"DIA_Lee_OtherSld_04_04");	//�� ��������� ���� ��� ����, ��� ���� ����� �����.
	b_logentry(TOPIC_BECOMESLD,"����� ���� �������� � ���� ���������, � ������ ������ ��������� ������� � ��������� �������� ��������� ���������.");
};


var int lee_probeok;
var int lee_stimmenok;
var int lee_onarok;

instance DIA_LEE_JOINNOW(C_INFO)
{
	npc = sld_800_lee;
	nr = 8;
	condition = dia_lee_joinnow_condition;
	information = dia_lee_joinnow_info;
	permanent = TRUE;
	description = "� ����� �������������� � ���!";
};


func int dia_lee_joinnow_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lee_othersld) && (LEE_ONAROK == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_joinnow_info()
{
	AI_Output(other,self,"DIA_Lee_JoinNOW_15_00");	//� ����� �������������� � ���!
	if(LEE_PROBEOK == FALSE)
	{
		if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_01");	//������� �� ������ ������ ��������� �������.
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_02");	//��� �� ������ ��������� �������?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_03");	//��.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_04");	//��� ������.
			LEE_PROBEOK = TRUE;
		};
	};
	if((LEE_PROBEOK == TRUE) && (LEE_STIMMENOK == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_JoinNOW_04_05");	//� ��� ������� ������ ��������?
		if(TORLOF_GENUGSTIMMEN == FALSE)
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_06");	//� �� ������, ���������� �� ��������� �� ���� �������.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_07");	//����� �������� � ��������, �� ����� ��� ����, � ��� ������� �� ���� �����.
		}
		else
		{
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_08");	//����������� �� ��� �� ���� �������.
			LEE_STIMMENOK = TRUE;
		};
	};
	if((LEE_STIMMENOK == TRUE) && (LEE_ONAROK == FALSE))
	{
		if(ONAR_APPROVED == FALSE)
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_09");	//������, ����� ��� ����� � �����. � ��� ����������� � ���.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_10");	//�� �� ������ ������������ � ����� ��������� ���.
			LEE_SENDTOONAR = TRUE;
			b_logentry(TOPIC_BECOMESLD,"���, ��� ��� ����� ������ - ��� ��������� �����.");
		}
		else
		{
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_11");	//�� ��������� � ������?
			AI_Output(other,self,"DIA_Lee_JoinNOW_15_12");	//�� ����������.
			LEE_ONAROK = TRUE;
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_13");	//����� ����� ���������� � ���� ����, ��������!
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_14");	//���, ������ ��� ������ ��� �������!
			Npc_SetTrueGuild(other,GIL_SLD);
			other.guild = GIL_SLD;
			CreateInvItems(other,itar_sld_l,1);
			AI_EquipArmor(other,itar_sld_l);
			Snd_Play("LEVELUP");
			KDF_AUFNAHME = LOG_OBSOLETE;
			SLD_AUFNAHME = LOG_SUCCESS;
			MIL_AUFNAHME = LOG_OBSOLETE;
			b_giveplayerxp(XP_BECOMEMERCENARY);
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_15");	//� ���, ��� �� � ����.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_16");	//� ���� ��� ���� ������ ��������� ��� ����.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_17");	//��� ����� ��������� � ���������. ������ ����� ���� ��������� � ����.
			AI_Output(self,other,"DIA_Lee_JoinNOW_04_18");	//�� ��� ����� ����� ���� ����.
		};
	};
};


instance DIA_LEE_KEINSLD(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_keinsld_condition;
	information = dia_lee_keinsld_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_keinsld_condition()
{
	if(((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_NOV) || (other.guild == GIL_KDF)) && (LEE_ISONBOARD == FALSE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_lee_keinsld_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_00");	//� ����, �� �������� �� ������ � ���������.
	};
	if((other.guild == GIL_NOV) || (other.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lee_KeinSld_04_01");	//�� ��������� � ���������? (�������) � ����� ������, ������ �� �����.
	};
	AI_Output(self,other,"DIA_Lee_KeinSld_04_02");	//��� �, ������ �� �� ������� ����� ���������.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_03");	//�� ��� �����, ����� ����, �� ������� ������� ���-������ ��� ���� - ��� � ��� ����.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_04");	//���������. ��, ��� �� �� �� ���� � ����� ���� ����� ����������.
	AI_Output(self,other,"DIA_Lee_KeinSld_04_05");	//�� ���� � �� ����� ������� ���� ������ ������, �����?
};


instance DIA_LEE_TOHAGEN(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_tohagen_condition;
	information = dia_lee_tohagen_info;
	permanent = FALSE;
	description = "� ��� ��� ������ ��������� �� ���������?";
};


func int dia_lee_tohagen_condition()
{
	if(other.guild == GIL_SLD)
	{
		return TRUE;
	};
};

func void dia_lee_tohagen_info()
{
	AI_Output(other,self,"DIA_Lee_ToHagen_15_00");	//� ��� ��� ������ ��������� �� ���������?
	AI_Output(self,other,"DIA_Lee_ToHagen_04_01");	//����� ������. �� �������� �� ���� ����������� � ����.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_02");	//� ���� ����� ������, ������������ ���������, �� ������ ���� ������ � ����������� �����.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_03");	//� ����, � ��� �� ������ - � ���� ������������ �����. �� ������ ��� �����������. �� ������� ����, �� ��������� ����.
	AI_Output(self,other,"DIA_Lee_ToHagen_04_04");	//� ������� ��� ������ - �����.
	b_giveinvitems(self,other,itwr_passage_mis,1);
	AI_Output(self,other,"DIA_Lee_ToHagen_04_05");	//� ����� ������, ��� ������ ���� ��������� �������� ��������� � ������������ ���������.
	MIS_LEE_FRIEDENSANGEBOT = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FRIEDEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FRIEDEN,LOG_RUNNING);
	b_logentry(TOPIC_FRIEDEN,"�� ���������� ���� � ����� ������ � ������������ ����. ��� � ���� �������� ��������� � ���������.");
};


instance DIA_LEE_ANGEBOTSUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_angebotsuccess_condition;
	information = dia_lee_angebotsuccess_info;
	permanent = FALSE;
	description = "� ����� ����� ������ ���� ����������� � ����.";
};


func int dia_lee_angebotsuccess_condition()
{
	if(HAGEN_FRIEDENABGELEHNT == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_angebotsuccess_info()
{
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_00");	//� ����� ����� ������ ���� ����������� � ����.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_01");	//��� �� ������?
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_02");	//�� ������, ��� �� ����� �������� ����������� ����, �� �� ����� �����.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_03");	//��� ������� �����. ����������� ����� � ����������� ����� ������� ����������, ��� ��� �����.
	AI_Output(other,self,"DIA_Lee_AngebotSuccess_15_04");	//��� �� ����������� ������ ������?
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_05");	//� ������ ����� ������ ������ �������� ��� ������. ���� �����������, �� �������� �������. ��� ����� �������� �� ����.
	AI_Output(self,other,"DIA_Lee_AngebotSuccess_04_06");	//�������� ���� ������ �� ����� � ������� ���� ����� - ��� ���� �� �����������.
	MIS_LEE_FRIEDENSANGEBOT = LOG_SUCCESS;
};


instance DIA_LEE_BACKGROUND(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_background_condition;
	information = dia_lee_background_info;
	permanent = FALSE;
	description = "������ �� ��� ������� �� �������?";
};


func int dia_lee_background_condition()
{
	if(MIS_LEE_FRIEDENSANGEBOT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lee_background_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_10");	//������ �� ��� ������� �� �������?
	AI_Output(self,other,"DIA_Lee_Add_04_11");	//��� �� ������, � ��� ��������� � ����� ������.
	AI_Output(self,other,"DIA_Lee_Add_04_12");	//�� ��� ��������� ������� ����, ������ ��� � ���� ���-���, ���� �� ������ ��� �����.
	AI_Output(self,other,"DIA_Lee_Add_04_13");	//��� �������� ���� � ��� �������, � ������ �������� ���.
	AI_Output(self,other,"DIA_Lee_Add_04_14");	//� ���� ���� ����� ���������� �������, ����� ��� ��������.
	AI_Output(self,other,"DIA_Lee_Add_04_15");	//� ������ ���������.
	AI_Output(other,self,"DIA_Lee_Add_15_16");	//(���������) ������?
	AI_Output(self,other,"DIA_Lee_Add_04_17");	//(����������) ������! � ��� �����������. ��� ��� ������ �������� � ���, ��� ������� �� ����...
};


instance DIA_LEE_RESCUEGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_rescuegorn_condition;
	information = dia_lee_rescuegorn_info;
	permanent = FALSE;
	description = "� ��������� ����������� � ������ ��������.";
};


func int dia_lee_rescuegorn_condition()
{
	if(Npc_KnowsInfo(other,dia_lord_hagen_proof) && (KAPITEL < 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_rescuegorn_info()
{
	AI_Output(other,self,"DIA_Lee_RescueGorn_15_00");	//� ��������� ����������� � ������ ��������.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_01");	//� � �� ��������, ��� �� ����� ����������� �� ���� �����.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_02");	//���� �� ������������� � �������, ����� ��� �����. �������� ������ ��� ��� �� ��������.
	AI_Output(self,other,"DIA_Lee_RescueGorn_04_03");	//���� ������� �������, � �� �� ����� ���������� ��� �����, ��� ��� ���� � ���� �������� ���� ���������� �����, �� ������� ���.
	KNOWSABOUTGORN = TRUE;
};


instance DIA_LEE_SUCCESS(C_INFO)
{
	npc = sld_800_lee;
	nr = 2;
	condition = dia_lee_success_condition;
	information = dia_lee_success_info;
	permanent = FALSE;
	description = "� ��������� �����.";
};


func int dia_lee_success_condition()
{
	if((MIS_RESCUEGORN == LOG_SUCCESS) && (KAPITEL >= 3) && (other.guild == GIL_SLD))
	{
		return TRUE;
	};
};

func void dia_lee_success_info()
{
	AI_Output(other,self,"DIA_Lee_Success_15_00");	//� ��������� �����.
	AI_Output(self,other,"DIA_Lee_Success_04_01");	//��, �� ��� ��������� ��� �� ����. ������� ���������.
	AI_Output(self,other,"DIA_Lee_Success_04_02");	//�� ����� ������, ��� ������� � ��� ��� ����� ������ ������.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_ABOUTGORN(C_INFO)
{
	npc = sld_800_lee;
	nr = 5;
	condition = dia_lee_aboutgorn_condition;
	information = dia_lee_aboutgorn_info;
	permanent = FALSE;
	description = "���� ������ ���� ��� ���? ��� ��������� � ���?";
};


func int dia_lee_aboutgorn_condition()
{
	if((KAPITEL < 3) && (Npc_KnowsInfo(other,dia_lee_rescuegorn) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_aboutgorn_info()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_15_00");	//���� ������ ���� ��� ���? ��� ��������� � ���?
	AI_Output(self,other,"DIA_Lee_AboutGorn_04_01");	//�� ���� ������� ���, ��?
	Info_ClearChoices(dia_lee_aboutgorn);
	Info_AddChoice(dia_lee_aboutgorn,"��� ��������� ���������...",dia_lee_aboutgorn_who);
	Info_AddChoice(dia_lee_aboutgorn,"�������.",dia_lee_aboutgorn_yes);
};

func void dia_lee_aboutgorn_yes()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Yes_15_00");	//�������.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_01");	//��� ������� �������� � ��������� �����, � ������ �������� � ������� �����������.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_02");	//���� �� ������ � ������ �������� �� ������ ���������� � ������, � �� ��� �������� ���� ����� ������, ����� ���������� ���.
	AI_Output(self,other,"DIA_Lee_AboutGorn_Yes_04_03");	//�� ������ ��� ��������� �������������. �������.
	Info_ClearChoices(dia_lee_aboutgorn);
};

func void dia_lee_aboutgorn_who()
{
	AI_Output(other,self,"DIA_Lee_AboutGorn_Who_15_00");	//��� ��������� ���������...
	AI_Output(self,other,"DIA_Lee_AboutGorn_Who_04_01");	//�������, ������������, ������ ������ � ������� �������, �� ����� ���� ����� � ����� �������. ��� ���� � �������.
};


instance DIA_LEE_WEGENBULLCO(C_INFO)
{
	npc = sld_800_lee;
	nr = 6;
	condition = dia_lee_wegenbullco_condition;
	information = dia_lee_wegenbullco_info;
	permanent = FALSE;
	description = "� ����� ������ �� ��������� ���� ������ ��������� �����...";
};


func int dia_lee_wegenbullco_condition()
{
	if((KAPITEL < 4) && (MIS_PEPE_KILLWOLVES == LOG_SUCCESS) && (ONAR_WEGENPEPE == TRUE))
	{
		return TRUE;
	};
};

func void dia_lee_wegenbullco_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_00");	//� ����� ������ �� ��������� ���� ������ ��������� �����...
	AI_Output(self,other,"DIA_Lee_Add_04_01");	//��, �� ��������� �� ��� � ����� �������! � ���� � ��� ����� ������� �������.
	if((BULLCO_SCHARF == TRUE) && !Npc_IsDead(bullco))
	{
		AI_Output(other,self,"DIA_Lee_Add_15_02");	//� ���� ����. �����, ������, ����� �������� �� ���. �� �����, ����� � ������� �����...
		AI_Output(self,other,"DIA_Lee_Add_04_03");	//��, � ���? ������ �� ����.
		AI_Output(self,other,"DIA_Lee_Add_04_04");	//�� ������ ������� ���, ��� �� ������ ����� ���� ����������, ��� � ����� ��������� ���� �� ��� ���������...
	};
};


instance DIA_LEE_REPORT(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_report_condition;
	information = dia_lee_report_info;
	permanent = TRUE;
	description = "� ������ �� ������ ��������...";
};


func int dia_lee_report_condition()
{
	if((ENTEROW_KAPITEL2 == TRUE) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_lee_report_info()
{
	AI_Output(other,self,"DIA_Lee_Add_15_18");	//� ������ �� ������ ��������. �����, ����������� ���, ��� �������� ���������!
	AI_Output(self,other,"DIA_Lee_Add_04_19");	//��� ��� ������! ����� �������, ��� � ������ ����������� ����� � ��������... � �� ������� � ���...
	AI_Output(self,other,"DIA_Lee_Add_04_20");	//� ��� ������ ���������?
	AI_Output(other,self,"DIA_Lee_Add_15_21");	//��� ������� ������� ������.
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lee_Add_04_22");	//������! ����� ������ ���� ����� ����� ��������� �������� � ���� �����������...
		AI_Output(self,other,"DIA_Lee_Add_04_23");	//� ���� ���... (������) ����� �� ������ ������ ������ ��������� ������...
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_Add_04_24");	//������! �����, ��� �������� ����� ������ ����������� �� ������ ������ � ������ ��������...
		AI_Output(self,other,"DIA_Lee_Add_04_25");	//��� ������ ��������� ��������� �����, ��� �����.
	};
};


var int lee_give_sld_m;

instance DIA_LEE_ARMORM(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_armorm_condition;
	information = dia_lee_armorm_info;
	permanent = TRUE;
	description = "� ��� ������ �������� �������?";
};


func int dia_lee_armorm_condition()
{
	if((KAPITEL == 2) && (other.guild == GIL_SLD) && (LEE_GIVE_SLD_M == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_armorm_info()
{
	AI_Output(other,self,"DIA_Lee_ArmorM_15_00");	//� ��� ������ �������� �������?
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS) && (MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_01");	//�� �������� �������.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_02");	//� ���� ���� ��������� ������� ��� ����. �������, ���� �� ���������������.
		LEE_GIVE_SLD_M = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_ArmorM_04_03");	//������ ������� ������� �� �����, ������� ������ ���� ���� ��������� ��� ������-�����.
		AI_Output(self,other,"DIA_Lee_ArmorM_04_04");	//������� ���� ���� ������, � ����� �� ��������� � ��������� ��������!
	};
};


var int lee_sldmgiven;

instance DIA_LEE_BUYARMORM(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_buyarmorm_condition;
	information = dia_lee_buyarmorm_info;
	permanent = TRUE;
	description = "������ ������� ������� ��������. ������: ������ 45, ������ 45. ����: 500 ������";
};


func int dia_lee_buyarmorm_condition()
{
	if((LEE_GIVE_SLD_M == TRUE) && (LEE_SLDMGIVEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_buyarmorm_info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorM_15_00");	//��� ��� ��� �������.
	if(b_giveinvitems(other,self,itmi_gold,500))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_01");	//�����. ��� ����� ������� �������.
		CreateInvItems(other,itar_sld_m,1);
		AI_EquipArmor(other,itar_sld_m);
		LEE_SLDMGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorM_04_02");	//�� ��� �� �������! ������� � ���� ������� ������!
	};
};


instance DIA_LEE_KAP3_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap3_exit_condition;
	information = dia_lee_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lee_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_TELEPORT(C_INFO)
{
	npc = sld_800_lee;
	nr = 1;
	condition = dia_lee_teleport_condition;
	information = dia_lee_teleport_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lee_teleport_condition()
{
	if((KAPITEL >= 3) && Npc_IsInState(self,zs_talk) && (LEE_TELEPORT == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_teleport_info()
{
	b_lee_teleport();
};


instance DIA_LEE_ARMORH(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_armorh_condition;
	information = dia_lee_armorh_info;
	permanent = FALSE;
	description = "� ���� ���� ������� ������� ��� ����?";
};


func int dia_lee_armorh_condition()
{
	if((KAPITEL == 3) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lee_armorh_info()
{
	AI_Output(other,self,"DIA_Lee_ArmorH_15_00");	//� ���� ���� ������� ������� ��� ����?
	AI_Output(self,other,"DIA_Lee_ArmorH_04_01");	//�������.
};


var int lee_sldhgiven;

instance DIA_LEE_BUYARMORH(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_buyarmorh_condition;
	information = dia_lee_buyarmorh_info;
	permanent = TRUE;
	description = "������ ������� ������� ��������. ������: ������ 60, ������ 60. ����: 1000 ������";
};


func int dia_lee_buyarmorh_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_armorh) && (LEE_SLDHGIVEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_buyarmorh_info()
{
	AI_Output(other,self,"DIA_Lee_BuyArmorH_15_00");	//��� ��� ������� �������.
	if(b_giveinvitems(other,self,itmi_gold,1000))
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_01");	//�����. ��� ����� ������� �������. � ��� ����� ����.
		CreateInvItems(other,itar_sld_h,1);
		AI_EquipArmor(other,itar_sld_h);
		LEE_SLDHGIVEN = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_BuyArmorH_04_02");	//�� ������ �������. ������� ������!
	};
};


instance DIA_LEE_RICHTER(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richter_condition;
	information = dia_lee_richter_info;
	permanent = FALSE;
	description = "� ���� ��� ��� ��� ���� ������?";
};


func int dia_lee_richter_condition()
{
	if((KAPITEL >= 3) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)) && (Npc_IsDead(richter) == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_richter_info()
{
	AI_Output(other,self,"DIA_Lee_Richter_15_00");	//� ���� ��� ��� ��� ���� ������?
	AI_Output(self,other,"DIA_Lee_Richter_04_01");	//���� ��� ����, ��? ��-�����, � ���� � ��� ���� ������� �������. ���� �� ��� ���� �����?
	AI_Output(other,self,"DIA_Lee_Richter_15_02");	//��� �������. � �� �������, �������?
	AI_Output(self,other,"DIA_Lee_Richter_04_03");	//������. � ���� ���� ���-���. ��� ��� ��� ����.
	AI_Output(self,other,"DIA_Lee_Richter_04_04");	//� ������ ����������� � ������ � ������. � ��, �������, ��������� ������� ��� ���.
	AI_Output(self,other,"DIA_Lee_Richter_04_05");	//�� �������� � �� �������� ������� �� ��������� ���� � ��� ����.
	AI_Output(self,other,"DIA_Lee_Richter_04_06");	//��� ���� ����� ����������. ��� ��� ������ �����������. �� ������� � ����� � ���������� ��� ���� ������.
	AI_Output(self,other,"DIA_Lee_Richter_04_07");	//�� ������ ���������� ��������� ��� ������� � ��������� ������ ������� ������, ���� �� ������� ���-������, ���������������� ���.
	AI_Output(self,other,"DIA_Lee_Richter_04_08");	//��� ������ ���������� ������� ������� �������, ��� �� ���� ������� �� ������.
	AI_Output(self,other,"DIA_Lee_Richter_04_09");	//��� ��� ���-������, ��� � ����� ������������, ����� ��������� ��� ��� ����� ����� ���������. � ����, ����� �� ������ ������� ����� ���� �� ��������.
	AI_Output(self,other,"DIA_Lee_Richter_04_10");	//�� � �� ����, ����� �� ������ ���. ��� ��� ���� ������� ����. � ����, ����� �� �������, ���������?
	AI_Output(self,other,"DIA_Lee_Richter_04_11");	//��� �� �������, ����������?
	Log_CreateTopic(TOPIC_RICHTERLAKAI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RICHTERLAKAI,LOG_RUNNING);
	b_logentry(TOPIC_RICHTERLAKAI,"�� �����, ����� � ����� ��������������, ���������� ����� ��������. ��� �����, � ������ ���������� ���� ������ ����� � ������ ������� ���� �� �������.");
	MIS_LEE_JUDGERICHTER = LOG_RUNNING;
	Info_ClearChoices(dia_lee_richter);
	Info_AddChoice(dia_lee_richter,"� �� ���� ���������� ����.",dia_lee_richter_nein);
	Info_AddChoice(dia_lee_richter,"��� �������. �������?",dia_lee_richter_wieviel);
};

func void dia_lee_richter_wieviel()
{
	AI_Output(other,self,"DIA_Lee_Richter_wieviel_15_00");	//��� �������. �������?
	AI_Output(self,other,"DIA_Lee_Richter_wieviel_04_01");	//���� ������� ������� �� ����, ��� �� �������� ���. ��� ��� ����������.
	Info_ClearChoices(dia_lee_richter);
};

func void dia_lee_richter_nein()
{
	AI_Output(other,self,"DIA_Lee_Richter_nein_15_00");	//� �� ���� ���������� ����. � �� ���� ������������ ���� ������.
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_01");	//�� ��������� ���. ����� � ���, ��� ������ �� ������� ���� �� ������� � ������� �� ������. ��� �� ����� ���?
	AI_Output(self,other,"DIA_Lee_Richter_nein_04_02");	//��������, ��� ������, �� � �������, �� ������� ���������� �������.
	Info_ClearChoices(dia_lee_richter);
};


instance DIA_LEE_RICHTERBEWEISE(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_richterbeweise_condition;
	information = dia_lee_richterbeweise_info;
	description = "� ����� ���-���, ���������������� �����.";
};


func int dia_lee_richterbeweise_condition()
{
	if((KAPITEL >= 3) && (MIS_LEE_JUDGERICHTER == LOG_RUNNING) && Npc_HasItems(other,itwr_richterkomprobrief_mis) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lee_richterbeweise_info()
{
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_00");	//� ����� ���-���, ���������������� �����.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_01");	//������? � ��� ��?
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_02");	//�� ����� �����������, ����� �� �������� ����������� ��������.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_03");	//������ ����� ����� �� ��������� �� � ������ ���� ��� ������.
	AI_Output(other,self,"DIA_Lee_RichterBeweise_15_04");	//� ������ ���� � �������� �������������� ���������� ������ ����� ���� �����������.
	AI_Output(self,other,"DIA_Lee_RichterBeweise_04_05");	//������.
	b_giveinvitems(other,self,itwr_richterkomprobrief_mis,1);
	b_usefakescroll();
	if(Npc_IsDead(richter) == FALSE)
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_06");	//�������-��. ����� ������ ���� ����������, ����� ��������� ��� ��������. � ��������.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_07");	//� ����� ������ ��������� �� ���. ����� ���� �������.
		CreateInvItems(self,itmi_gold,500);
		b_giveinvitems(self,other,itmi_gold,500);
		MIS_LEE_JUDGERICHTER = LOG_SUCCESS;
		b_giveplayerxp(XP_JUDGERICHTER);
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_08");	//� �� ������ �� ���� ������, ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_09");	//��� ����������. �� ������ ������� ��� �����. ����� �����.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_10");	//�����-�� ����� ��������� ���. ��, ��. ���� ��� ����, � �����-��, ����������.
		AI_Output(self,other,"DIA_Lee_RichterBeweise_04_11");	//��� ��������� �����. ��� ������� ������ �������� �� �����.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		MIS_LEE_JUDGERICHTER = LOG_FAILED;
		b_giveplayerxp(XP_AMBIENT);
	};
};


instance DIA_LEE_TALKABOUTBENNET(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_talkaboutbennet_condition;
	information = dia_lee_talkaboutbennet_info;
	permanent = FALSE;
	description = "��� ������ �������?";
};


func int dia_lee_talkaboutbennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_lee_talkaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lee_TalkAboutBennet_15_00");	//��� ������ �������?
	AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_01");	//��� �� ��� ������. ��� ������� �������� ��� �� �������. ��� � ���.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Lee_TalkAboutBennet_04_02");	//��� ����� ��� �� ������� ������� � ����� ������ - ������ � ������ ���������� ��� � � ���������.
	};
};


instance DIA_LEE_DOABOUTBENNET(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_doaboutbennet_condition;
	information = dia_lee_doaboutbennet_info;
	permanent = FALSE;
	description = "��� �� ����������� ������� ��� �������?";
};


func int dia_lee_doaboutbennet_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_lee_talkaboutbennet))
	{
		return TRUE;
	};
};

func void dia_lee_doaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_00");	//��� �� ����������� ������� ��� �������?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_01");	//� ���� �� ����. ����� ������ ������ ���� ������ ��������� � ����� � ����� ���� ����� ������ �� ����� ������.
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_02");	//� �������, � ��� ������������ ����� ��� ����� ��������, �, ����� ����, ��� �� � ���� �����.
	AI_Output(other,self,"DIA_Lee_DoAboutBennet_15_03");	//�� ���� �� ����������� ������ ����� ����?
	AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_04");	//������� ���.
	b_logentry(TOPIC_RESCUEBENNET,"���� � �� ����� �������� ������������ ������� ���������� ������, �� ������ �� ����� �������������. ��� ���� ����� �� ��������� � ������� �� ����� � ����� ������, ����� ���������� �������.");
	if(!Npc_IsDead(lares))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_05");	//����� ��� ��� � ������ � �������� ��������, ��� ����� �������� �������.
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_06");	//� ���� � ��������� ��������� ���� ������. �������� ���������, ��� ������ �� ����������� ������� ����� ������� �� ���.
	};
	if(!Npc_IsDead(buster) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		AI_Output(self,other,"DIA_Lee_DoAboutBennet_04_07");	//��, ��. ���� �� �����... ������ ����� ��������� � �����. �� �� ������� ���, � ���. �����, ���� ����� ����� ���?
	};
};


instance DIA_LEE_CANHELPYOU(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_canhelpyou_condition;
	information = dia_lee_canhelpyou_info;
	permanent = FALSE;
	description = "���� � ���-������ ������ � ��������?";
};


func int dia_lee_canhelpyou_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_lee_doaboutbennet))
	{
		return TRUE;
	};
};

func void dia_lee_canhelpyou_info()
{
	AI_Output(other,self,"DIA_Lee_CanHelpYou_15_00");	//���� � ���-������ ������ � ��������?
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_01");	//�������, �� �����, ��� � ����� ���� ����� ������� �� � �������� ������.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_02");	//����� ���������, ������� ������� ����� � ��� �������.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_03");	//��� � �����, �����, ���� ������� ����� ������ �������� ������� ������.
	AI_Output(self,other,"DIA_Lee_CanHelpYou_04_04");	//�� �� ��������� ������ � ���� �����, � �� ����, ��� ����� ��� ������� ���������� ������ ��� ���������.
};


var int dia_lee_anynews_onetime;

instance DIA_LEE_ANYNEWS(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_anynews_condition;
	information = dia_lee_anynews_info;
	permanent = TRUE;
	description = "���� ������� � �������?";
};


func int dia_lee_anynews_condition()
{
	if((MIS_RESCUEBENNET != FALSE) && Npc_KnowsInfo(other,dia_lee_doaboutbennet) && (DIA_LEE_ANYNEWS_ONETIME == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_anynews_info()
{
	AI_Output(other,self,"DIA_Lee_AnyNews_15_00");	//���� ������� � �������?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_01");	//��, �� ������� ����, ������, ������, �� ������ ��������� �� ��� ��������.
		AI_Output(self,other,"DIA_Lee_AnyNews_04_02");	//�������� ������.
		if(DIA_LEE_ANYNEWS_ONETIME == FALSE)
		{
			b_giveplayerxp(XP_AMBIENT);
			DIA_LEE_ANYNEWS_ONETIME = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_AnyNews_04_03");	//���, �� ��� ��� ����� ������������.
	};
};


instance DIA_LEE_SYLVIO(C_INFO)
{
	npc = sld_800_lee;
	nr = 3;
	condition = dia_lee_sylvio_condition;
	information = dia_lee_sylvio_info;
	description = "��� ��������� �� ��������� �����?";
};


func int dia_lee_sylvio_condition()
{
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_sylvio_info()
{
	AI_Output(other,self,"DIA_Lee_SYLVIO_15_00");	//��� ��������� �� ��������� �����?
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_01");	//�������, �������, ��������� � �������� � ������ �������� � ���� � ��� ���� ����� �� ����� ������� � ���.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_02");	//�� ������� ��������� ������ ����� � ��� � ������ ��������. �� ������ �� �����, �����, ������ � ��� ���� ��������� ����.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_03");	//����������� �� �������� ������������� ����� ���� ������ ���� �������, �� ��� �� ������� ��������� �������, ������� ������� �� ��� �������.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_04");	//��� ����������� ���, ��� ��� ����������� � �������, � ����� �������.
	AI_Output(self,other,"DIA_Lee_SYLVIO_04_05");	//(����������) ��. ���������� ������, � ���� ���, ��� ������� ������� ���� � �����.
};


instance DIA_LEE_KAP4_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap4_exit_condition;
	information = dia_lee_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lee_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_CANTEACH(C_INFO)
{
	npc = sld_800_lee;
	nr = 10;
	condition = dia_lee_canteach_condition;
	information = dia_lee_canteach_info;
	permanent = TRUE;
	description = "�� ������ ������� ����?";
};


func int dia_lee_canteach_condition()
{
	if((KAPITEL >= 4) && (LEE_TEACHPLAYER == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_canteach_info()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_15_00");	//�� ������ ������� ����?
	AI_Output(self,other,"DIA_Lee_CanTeach_04_01");	//� ���� �������� ����, ��� ��������� ��������� �������.
	if(other.hitchance[NPC_TALENT_2H] < 60)
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_02");	//�� � ���� ��� ������� �� ��, ����� ����� ���� �������.
		AI_Output(self,other,"DIA_Lee_CanTeach_04_03");	//��� ������ �� ���������� ������������� ������, � � ����� ������������. � ���� ����� ������� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_CanTeach_04_04");	//� ������, ��� �� ����� �����. �� ����� ���������, ��� � ��� �� ���� ������� ���� �������-������ �������.
		AI_Output(self,other,"DIA_Lee_CanTeach_04_05");	//��� ���, ���� ������, � ���� ������������� ����. �������, �� ���������.
		AI_Output(other,self,"DIA_Lee_CanTeach_15_06");	//�������?
		AI_Output(self,other,"DIA_Lee_CanTeach_04_07");	//1000 ����� - � ������, ��� �� ������������.
		Info_ClearChoices(dia_lee_canteach);
		Info_AddChoice(dia_lee_canteach,"��� ������� ������ ��� ����.",dia_lee_canteach_no);
		if(Npc_HasItems(other,itmi_gold) >= 1000)
		{
			Info_AddChoice(dia_lee_canteach,"������������. ��� ������.",dia_lee_canteach_yes);
		};
	};
};

func void dia_lee_canteach_no()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_No_15_00");	//��� ������� ������ ��� ����.
	AI_Output(self,other,"DIA_Lee_CanTeach_No_04_01");	//������� �� ������. ������� ����� ������� ����������� �������.
	Info_ClearChoices(dia_lee_canteach);
};

func void dia_lee_canteach_yes()
{
	AI_Output(other,self,"DIA_Lee_CanTeach_Yes_15_00");	//������������. ��� ������.
	AI_Output(self,other,"DIA_Lee_CanTeach_Yes_04_01");	//������, ������ ���: � ���� ���� �����.
	b_giveinvitems(other,self,itmi_gold,1000);
	LEE_TEACHPLAYER = TRUE;
	Info_ClearChoices(dia_lee_canteach);
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"�� ����� ������� ���� ��������� ��������� � ��������� �������.");
};


instance DIA_LEE_TEACH(C_INFO)
{
	npc = sld_800_lee;
	nr = 10;
	condition = dia_lee_teach_condition;
	information = dia_lee_teach_info;
	permanent = TRUE;
	description = "������ ��������.";
};


func int dia_lee_teach_condition()
{
	if(LEE_TEACHPLAYER == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_teach_info()
{
	AI_Output(other,self,"DIA_Lee_Teach_15_00");	//������ ��������.
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_lee_teach_2h_5);
};

func void dia_lee_teach_back()
{
	Info_ClearChoices(dia_lee_teach);
};

func void dia_lee_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_00");	//������ �� ��������� ������ ��� ��������� �������.
		AI_Output(self,other,"DIA_DIA_Lee_Teach_2H_1_04_01");	//�� ������ �� ���������� � ��������.
	};
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_lee_teach_2h_5);
};

func void dia_lee_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,100);
	if(other.hitchance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_00");	//������ �� ��������� ������ ��� ��������� �������.
		AI_Output(self,other,"DIA_Lee_Teach_2H_5_04_01");	//�� ������ �� ���������� � ��������.
	};
	Info_ClearChoices(dia_lee_teach);
	Info_AddChoice(dia_lee_teach,DIALOG_BACK,dia_lee_teach_back);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_lee_teach_2h_1);
	Info_AddChoice(dia_lee_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_lee_teach_2h_5);
};


instance DIA_LEE_DRACHENEI(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_drachenei_condition;
	information = dia_lee_drachenei_info;
	description = "����-����� ������������ �������� ���� �� ����� �������.";
};


func int dia_lee_drachenei_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis))
	{
		return TRUE;
	};
};

func void dia_lee_drachenei_info()
{
	AI_Output(other,self,"DIA_Lee_DRACHENEI_15_00");	//����-����� ������������ �������� ���� �� ����� �������.
	b_giveplayerxp(XP_AMBIENT);
	AI_Output(self,other,"DIA_Lee_DRACHENEI_04_01");	//� ��� ������ ��� ������. ������ ����� ��������� ������.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(other,self,"DIA_Lee_DRACHENEI_15_02");	//� ��� ��� ������ � ����?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_03");	//������ ��. ��� ���?
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_04");	//����� ����, �� �������� ����� ����� ������� ������� ��� ��� ���-������.
		AI_Output(self,other,"DIA_Lee_DRACHENEI_04_05");	//������, ��� ����� �������. �������� �� ���� � ��������.
		b_logentry(TOPIC_DRACHENEIER,"�� �� �����, ��� ������ � ��������� �����. �� �������� ���� � ������� �������.");
	};
};


instance DIA_LEE_KAP4_PERM(C_INFO)
{
	npc = sld_800_lee;
	nr = 49;
	condition = dia_lee_kap4_perm_condition;
	information = dia_lee_kap4_perm_info;
	permanent = TRUE;
	description = "��� ���� ���� �� �����?";
};


func int dia_lee_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lee_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_00");	//��� ���� ���� �� �����?
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_01");	//��, � ��� ��� ��� ������� ������, ����� ����� �������� ��������.
	AI_Output(other,self,"DIA_Lee_KAP4_Perm_15_02");	//��-�����, ��� ���� �������.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_03");	//��, � ���������, � ��� �� ����� ������ ������. ����� ��� ���� � ���� �������� ������������, �� ������ ���������� �������� ��� � �� ����� �������.
	AI_Output(self,other,"DIA_Lee_KAP4_Perm_04_04");	//�� ��� ��� ��������. � ���������.
};


instance DIA_LEE_KAP5_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap5_exit_condition;
	information = dia_lee_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lee_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LEE_GETSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_getship_condition;
	information = dia_lee_getship_info;
	description = "�� �� ������, ��� ��� ��������� ������� ���������?";
};


func int dia_lee_getship_condition()
{
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		return TRUE;
	};
};

func void dia_lee_getship_info()
{
	AI_Output(other,self,"DIA_Lee_GetShip_15_00");	//�� �� ������, ��� ��� ��������� ������� ���������?
	AI_Output(self,other,"DIA_Lee_GetShip_04_01");	//�� �������, � ��� ��� ����� �� �����, ���� � ����? ���� ������� �������� �������, ��� ���������� � ����� � ������ �������.
	AI_Output(other,self,"DIA_Lee_GetShip_15_02");	//������ �� ���� ������ ������� �� �������.
	AI_Output(self,other,"DIA_Lee_GetShip_04_03");	//�������. ������� �� ���� ������.
	Log_CreateTopic(TOPIC_SHIP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SHIP,LOG_RUNNING);
	if((MIS_LEE_JUDGERICHTER == LOG_SUCCESS) && (Npc_IsDead(richter) == FALSE))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_04");	//�� �� ������, � ��� ����� ��� ��������. �� ������ ����� � ���� � �������� �� ���� ����������� ������, ������� �������� ��� ������� �� �������.
		MIS_RICHTERSPERMISSIONFORSHIP = LOG_RUNNING;
		b_logentry(TOPIC_SHIP,"�� ��������, ��� ������ ������ ������� �� ������� ��������� - �������� ������ � ��������������� ����������� �� �����. �� ��� �� �� ���� ����� ������ �� ����� ������ ����.");
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lee_GetShip_04_05");	//� ���� ���� ���������� ������ � �������������� ����������. ������ ���, ����������� ������ �������� ���� ������.
		b_logentry(TOPIC_SHIP,"��, ������� ��! �� �������� ���������� ������, ������� �������� ��� ������� �� ������� ���������.");
	};
	AI_Output(self,other,"DIA_Lee_GetShip_04_06");	//�� ��� �� ���. ����� ��������� ��������, ���� ����������� �������, ������� � ����� ���� ���.
	AI_Output(self,other,"DIA_Lee_GetShip_04_07");	//����� ��������� ����� ������� ������.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	Info_ClearChoices(dia_lee_getship);
	Info_AddChoice(dia_lee_getship,DIALOG_BACK,dia_lee_getship_back);
	Info_AddChoice(dia_lee_getship,"� ���� ��� ����� � �������?",dia_lee_getship_crew);
	if(Npc_IsDead(torlof) == FALSE)
	{
		Info_AddChoice(dia_lee_getship,"�� ������ ����-������, ��� ��� �� ��������� ��������?",dia_lee_getship_torlof);
	};
};

func void dia_lee_getship_torlof()
{
	AI_Output(other,self,"DIA_Lee_GetShip_torlof_15_00");	//�� ������ ����-������, ��� ��� �� ��������� ��������?
	AI_Output(self,other,"DIA_Lee_GetShip_torlof_04_01");	//��������� � ����, ������ ����� � ����. �� ����������� � ������� ����.
	b_logentry(TOPIC_CAPTAIN,"������ - ������ ������� ����. ��������, �� ������� ����� ���� ���������.");
};

func void dia_lee_getship_crew()
{
	AI_Output(other,self,"DIA_Lee_GetShip_crew_15_00");	//� ���� ��� ����� � �������?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_01");	//��� �� ������ ������ ���. �� � �� ���� ������ �����, ������� �������. �� ����� ������ �����, ������� ����� ��������?
	AI_Output(self,other,"DIA_Lee_GetShip_crew_04_02");	//���� ���� ����� ������ � �������, �������� ��������� �������. ����� ���� �� ���� �� �������.
	b_logentry(TOPIC_CREW,"��� �������� ���� �������, ����� �� ���� ��� ����� ������ ���. �� ��� �� �� ��� ����� - �������� ������ �����, ������� � ���� ��������. �, �������, ������ �������, ����� ����, ��� ��� ����� ���������.");
};

func void dia_lee_getship_back()
{
	Info_ClearChoices(dia_lee_getship);
};


instance DIA_LEE_GOTRICHTERSPERMISSIONFORSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_gotrichterspermissionforship_condition;
	information = dia_lee_gotrichterspermissionforship_info;
	description = "������ ���������.";
};


func int dia_lee_gotrichterspermissionforship_condition()
{
	if(MIS_RICHTERSPERMISSIONFORSHIP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_lee_gotrichterspermissionforship_info()
{
	AI_Output(other,self,"DIA_Lee_GotRichtersPermissionForShip_15_00");	//������ ���������. ������� ������ ���. ����� �������� ����� ������.
	AI_Output(self,other,"DIA_Lee_GotRichtersPermissionForShip_04_01");	//������. ������, ��� ���� �������� ����� ���� �������� ���� �� ����������.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LEE_STEALSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_stealship_condition;
	information = dia_lee_stealship_info;
	permanent = FALSE;
	description = "� ���� ������� �������.";
};


func int dia_lee_stealship_condition()
{
	if(Npc_KnowsInfo(other,dia_lee_getship) && (hero.guild == GIL_DJG) && (MIS_RICHTERSPERMISSIONFORSHIP == 0))
	{
		return TRUE;
	};
};

func void dia_lee_stealship_info()
{
	AI_Output(other,self,"DIA_Lee_StealShip_15_00");	//� ���� ������� �������.
	AI_Output(self,other,"DIA_Lee_StealShip_04_01");	//� ��� �� ����������� ������� ���?
	AI_Output(other,self,"DIA_Lee_StealShip_15_02");	//����� ������� - � ����� ����, ������ �� ���� ������ - � ������� ���!
	AI_Output(self,other,"DIA_Lee_StealShip_04_03");	//��-��. �����, �������, �� ������, ��� �������.
	CreateInvItems(self,itwr_forgedshipletter_mis,1);
	b_giveinvitems(self,other,itwr_forgedshipletter_mis,1);
};


instance DIA_LEE_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_knowwhereenemy_condition;
	information = dia_lee_knowwhereenemy_info;
	permanent = TRUE;
	description = "�� ������� �� ���� �� �������?";
};


func int dia_lee_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LEE_ISONBOARD == FALSE) && Npc_KnowsInfo(other,dia_lee_getship))
	{
		return TRUE;
	};
};

func void dia_lee_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_00");	//�� ������� �� ���� �� �������?
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_01");	//�� ������? �������. ��� �� �������� ����������� ��� � ��� �� ��������.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_04_02");	//����� ����, � ���� ������� ���� ��������� �������� ���������� � ��������� �������. ��� ����� ��������� ����� ��������.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"�� �� �������� ������� ������� �����. �� ��������� ��� ���� ���������. ��� ����� ������ ����� ������ ������� ������ �������� ��� ���� ���.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_15_03");	//��� ����� �� ������� ������ ������, �� � �������, ���� �������� �����-������ ��������.
	}
	else
	{
		Info_ClearChoices(dia_lee_knowwhereenemy);
		Info_AddChoice(dia_lee_knowwhereenemy,"� ��� ���� �����, ���� �� ��� ������������.",dia_lee_knowwhereenemy_no);
		Info_AddChoice(dia_lee_knowwhereenemy,"����� ���� ����!",dia_lee_knowwhereenemy_yes);
	};
};

func void dia_lee_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_00");	//����� ���� ����!
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_01");	//���? ����� ������?
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_Yes_15_02");	//��, � ����� ����������� � ����, � ���� �� ������� �� ����, ������� � ������. ���������� �� �������.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_Yes_04_03");	//� ��� ����� ���� ����� �������. � ���� ���.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	LEE_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lee_knowwhereenemy);
};

func void dia_lee_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lee_KnowWhereEnemy_No_15_00");	//� ��� ���� �����, ���� �� ��� ������������.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_01");	//�������, �� ������, ��� �������. �� �����, ��� ������� ������ ������� �� ������ ������� �����.
	AI_Output(self,other,"DIA_Lee_KnowWhereEnemy_No_04_02");	//(����������) ���� ��� ������ �� ������ ������� ����� �������.
	LEE_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_lee_knowwhereenemy);
};


instance DIA_LEE_LEAVEMYSHIP(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_leavemyship_condition;
	information = dia_lee_leavemyship_info;
	permanent = TRUE;
	description = "� ���-���� �� ���� ����� ���� � �����!";
};


func int dia_lee_leavemyship_condition()
{
	if((LEE_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lee_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lee_LeaveMyShip_15_00");	//� ���-���� �� ���� ����� ���� � �����!
	AI_Output(self,other,"DIA_Lee_LeaveMyShip_04_01");	//��� �������. �� ������, ��� ���� �����, ���� ���!
	LEE_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LEE_STILLNEEDYOU(C_INFO)
{
	npc = sld_800_lee;
	nr = 4;
	condition = dia_lee_stillneedyou_condition;
	information = dia_lee_stillneedyou_info;
	permanent = TRUE;
	description = "�� ��� ���-���� �����!";
};


func int dia_lee_stillneedyou_condition()
{
	if(((LEE_ISONBOARD == LOG_OBSOLETE) || (LEE_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lee_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lee_StillNeedYou_15_00");	//�� ��� ���-���� �����!
	if(LEE_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_01");	//� ����, ��� ����������� ����! �������� �� �������.
		LEE_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_02");	//������, � �� ����� �� ��! ������� �� ������, ����� � ������, ����� �������� ���� �����!
		AI_Output(self,other,"DIA_Lee_StillNeedYou_04_03");	//����� ���� ������� ������!
		AI_StopProcessInfos(self);
	};
};


instance DIA_LEE_KAP6_EXIT(C_INFO)
{
	npc = sld_800_lee;
	nr = 999;
	condition = dia_lee_kap6_exit_condition;
	information = dia_lee_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lee_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lee_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

