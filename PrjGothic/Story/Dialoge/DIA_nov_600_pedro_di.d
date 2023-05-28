
instance DIA_PEDRO_DI_EXIT(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 999;
	condition = dia_pedro_di_exit_condition;
	information = dia_pedro_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pedro_di_exit_condition()
{
	return TRUE;
};

func void dia_pedro_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEDRO_DI_YOU(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 2;
	condition = dia_pedro_di_you_condition;
	information = dia_pedro_di_you_info;
	description = "���������!";
};


func int dia_pedro_di_you_condition()
{
	return TRUE;
};

func void dia_pedro_di_you_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_00");	//���������! �������-�� � ����� ����.
	SCFOUNDPEDRO = TRUE;
	b_checklog();
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_01");	//�� ������ �� ���������, ��� � ������ ����, ������ ��� � �������.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_02");	//������ �� ���, ���������, ������� ���� ���� �������, � �������� � �������� ����, ����� ������ ��. �� ��� ����, ������ ������, � ������ ����������!
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_03");	//�� ���� ��������� ��������, ��� � �������� � ����� �����, �� ������. �� ����� ��� ������ ������.
	};
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_04");	//� ������ ����� ���� �� �����.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_05");	//�������. ������. �� ���� �������� ����������. � ������� �� �� ������ ��������� �� ����� ����.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_06");	//�� �� �������������, ����� ��� � ������ �� ��������� ��������� ����. ��� ��������� ���� ����� � ��� ������. � �� ���� ���������� �� ����.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_07");	//��������� ����� ���������� ���� ��������� ����. �� ��������� ��� ����. ������. � �� �������. �� ������ �������� ���.
	Info_ClearChoices(dia_pedro_di_you);
	Info_AddChoice(dia_pedro_di_you,"�����������, ��� �� ������.",dia_pedro_di_you_verschon);
	Info_AddChoice(dia_pedro_di_you,"� ������� ������ �� ����. � ���� ����.",dia_pedro_di_you_tot);
	Info_AddChoice(dia_pedro_di_you,"������ ���� �� ���� �������, �� ������� � ������ �������� ����.",dia_pedro_di_you_grund);
	if(MIS_GORAX_KILLPEDRO == LOG_RUNNING)
	{
		Info_AddChoice(dia_pedro_di_you,"��������� ��� ��� ������ ����� ����.",dia_pedro_di_you_serpentes);
	};
};

func void dia_pedro_di_you_grund()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_grund_15_00");	//������ ���� �� ���� �������, �� ������� � ������ �������� ����.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_grund_09_01");	//(��������) ������ ���� � �����. � ���� ���������� ���-���, ��� ������� ���� ��������� ������. �� ������ ��������� ����.
};


var int pedrodi_flee;

func void dia_pedro_di_you_tot()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_tot_15_00");	//� ������� ������ �� ����. � ���� ����.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_tot_09_01");	//������ ����� ������...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	b_attack(self,other,AR_NONE,1);
	PEDRODI_FLEE = LOG_RUNNING;
};

func void dia_pedro_di_you_serpentes()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_Serpentes_15_00");	//��������� ��� ��� ������ ����� ����. ��� ������ ��������. � � ������ ��, ��� ��� ���������.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_Serpentes_09_01");	//(��������) ����������, ���. �� �� ������ ������� ���. � ���� ����� ����������� ����. �� ������� ���.
	b_giveplayerxp(XP_PEDRO_SERPENTESMISSION);
	MIS_GORAX_KILLPEDRO = LOG_SUCCESS;
};

func void dia_pedro_di_you_verschon()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_verschon_15_00");	//�����������, ��� �� ������.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_verschon_09_01");	//(����������) ��, �������. � �������� ���� ���, ��� �� ������ �����. �� ��� ����� �������. �� ������ ������� ���� � ����� ���������� �������, �������?
	Info_ClearChoices(dia_pedro_di_you);
	Info_AddChoice(dia_pedro_di_you,"� ������� ������ �� ����. � ���� ����.",dia_pedro_di_you_tot);
	Info_AddChoice(dia_pedro_di_you,"������. ��� �� ����, � ������ ���� �� �������.",dia_pedro_di_you_followship);
};


var int mis_pedro_di_followship;

func void dia_pedro_di_you_followship()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_FollowShip_15_00");	//������. ��� �� ����, � ������ ���� �� �������.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_FollowShip_09_01");	//�������. �� �� ��������� �� ����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_PEDRO_DI_FOLLOWSHIP = LOG_RUNNING;
};


instance DIA_PEDRO_DI_ARRIVEDATSHIP(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 4;
	condition = dia_pedro_di_arrivedatship_condition;
	information = dia_pedro_di_arrivedatship_info;
	description = "������!";
};


func int dia_pedro_di_arrivedatship_condition()
{
	if((Npc_GetDistToWP(self,"SHIP") < 6000) && (MIS_PEDRO_DI_FOLLOWSHIP == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_pedro_di_arrivedatship_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_00");	//������!
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_01");	//����������� ������� � ����. �� ��������� �������.
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_02");	//������ �������. �����������, ��� � ������ ������?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_03");	//��, �������. � ���� ��� ������?
	Info_ClearChoices(dia_pedro_di_arrivedatship);
	Info_AddChoice(dia_pedro_di_arrivedatship,"� ������� ����������.",dia_pedro_di_arrivedatship_back);
	Info_AddChoice(dia_pedro_di_arrivedatship,"��� ��� ������� ������ ����� �������?",dia_pedro_di_arrivedatship_innere);
	Info_AddChoice(dia_pedro_di_arrivedatship,"� ����� ��� ������� �������� ���� ������?",dia_pedro_di_arrivedatship_monster);
	Info_AddChoice(dia_pedro_di_arrivedatship,"��� ��� ������ ����� ���������� �����?",dia_pedro_di_arrivedatship_orkoberst);
};

func void dia_pedro_di_arrivedatship_orkoberst()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00");	//��� ��� ������ ����� ���������� �����?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01");	//�� ����� � ���� ��������� ����� ������� �����-���� ������� ��� ������ �����.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02");	//� ��� ���, ��� � ������ ����, �� ���������� ���� � �������������� ���������� ��������� �� ��������.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03");	//�������, � �� ��� ���������� ��� �����. ������ ��� ����� �� ����, ���� ������? � ��������� ����.
	if(Npc_IsDead(orkelite_antipaladinorkoberst_di))
	{
		Info_AddChoice(dia_pedro_di_arrivedatship,"��������� ����� �����.",dia_pedro_di_arrivedatship_obersttot);
	};
};

func void dia_pedro_di_arrivedatship_monster()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Monster_15_00");	//� ����� ��� ������� �������� ���� ������?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_01");	//���� ����� ����� ������� �����-������, ������ � ������. ������ ��� ����� � ����� ����� ������� ����.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_02");	//��� ���� ����� ����� �� ���� ������, �� � �����, ��� ��������� �������� ������.
};

func void dia_pedro_di_arrivedatship_innere()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Innere_15_00");	//��� ��� ������� ������ ����� �������?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_01");	//� ������� ���� ���������� ����� ���� ��������� ������.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_02");	//���� ������ ����� ���� ������ ���, ����� ������ ���������. � �����, ��� �� ��������.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_03");	//���� �� ������� �������� ��������, ����������� ������, ������� �� ������ ����� �����.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_04");	//�-�-�. ��� �������, �� ������� ����������� ����� �����, � ����� ������, �� � ����� �� �����.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_05");	//� ����� �������� ���������� ��������� ������, ������� ������� � ����.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_06");	//��� ��������� ���� ������, � �� ����.
};

func void dia_pedro_di_arrivedatship_obersttot()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00");	//��������� ����� �����.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01");	//�����? ����� ������. � ������� �� ������ ��� ������� ����.
};

func void dia_pedro_di_arrivedatship_back()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Back_15_00");	//� ������� ����������. ���, ����� ���� ����� �� ���� �������. � ��� ��� ���-��� ����� �������.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Back_09_01");	//�� �������� � ����� ���� ������. � ���� �������� �� ����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_PEDRO_DI_PERM(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 5;
	condition = dia_pedro_di_perm_condition;
	information = dia_pedro_di_perm_info;
	permanent = TRUE;
	description = "�����?";
};


var int pedrodi_talknomore;

func int dia_pedro_di_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_di_you) && (PEDRODI_TALKNOMORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pedro_di_perm_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_PERM_15_00");	//�����?
	if(Npc_GetDistToWP(self,"SHIP_DECK_05") < 1000)
	{
		if(PEDRODI_FLEE == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_01");	//������, � ������� ���� �������?
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_02");	//������ ����, ����������. � ���� ������ ����� ����� ���� � �� ����� �� �����.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_03");	//�-�-�.
			b_giveplayerxp(XP_AMBIENT);
			PEDRODI_FLEE = LOG_SUCCESS;
		}
		else if(Npc_IsDead(dragon_undead))
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_04");	//� ��������� �������.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_05");	//����� �������. ����� �� ����� ������ � ����.
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_06");	//�������. � ��� ���� �� �����. ��������� ����.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PEDRODI_TALKNOMORE = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_07");	//��� � �������. �������.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_DI_PERM_09_08");	//����������, �� ������ ����!
		AI_StopProcessInfos(self);
	};
};

