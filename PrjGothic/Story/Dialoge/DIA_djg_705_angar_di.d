
instance DIA_ANGAR_DI_EXIT(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 999;
	condition = dia_angar_di_exit_condition;
	information = dia_angar_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_angar_di_exit_condition()
{
	return TRUE;
};

func void dia_angar_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_DI_HALLO(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 10;
	condition = dia_angar_di_hallo_condition;
	information = dia_angar_di_hallo_info;
	permanent = TRUE;
	description = "��� ��?";
};


func int dia_angar_di_hallo_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_angar_di_hallo_info()
{
	AI_Output(other,self,"DIA_Angar_DI_HALLO_15_00");	//��� ��?
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_01");	//�������� ���� ����� ������ ������������.
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_02");	//����. ��� �����-������ ������ ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_DI_HALLO_04_03");	//�� �������� ��� ���. ����� ���������� ������.
	};
};


instance DIA_ANGAR_DI_ORKS(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 5;
	condition = dia_angar_di_orks_condition;
	information = dia_angar_di_orks_info;
	important = TRUE;
};


func int dia_angar_di_orks_condition()
{
	if((ORKSTURMDI == TRUE) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_di_orks_info()
{
	AI_Output(self,other,"DIA_Angar_DI_ORKS_04_00");	//����, ���� ������, ����� ������������. ��������� ����� ����� ����� ������ ��� ������.
	AI_Output(other,self,"DIA_Angar_DI_ORKS_15_01");	//� �����, ��� ����.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_04_02");	//����� ������������.
	Info_ClearChoices(dia_angar_di_orks);
	Info_AddChoice(dia_angar_di_orks,"����������.",dia_angar_di_orks_no);
	Info_AddChoice(dia_angar_di_orks,"��� ������ ��� � �������� �������.",dia_angar_di_orks_follow);
};

func void dia_angar_di_orks_follow()
{
	AI_Output(other,self,"DIA_Angar_DI_ORKS_follow_15_00");	//��� ������ ��� � �������� �������.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_follow_04_01");	//������. �� �� ������� ������. ������!
	AI_StopProcessInfos(self);
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"FollowDI");
	ANGAR_DI_PARTY = LOG_RUNNING;
};

func void dia_angar_di_orks_no()
{
	AI_Output(other,self,"DIA_Angar_DI_ORKS_no_15_00");	//����������.
	AI_Output(self,other,"DIA_Angar_DI_ORKS_no_04_01");	//���� ����� ��������. � � ����� ���-��� ����� � ���.
	AI_StopProcessInfos(self);
};


instance DIA_ANGAR_DI_FOLLOW(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 5;
	condition = dia_angar_di_follow_condition;
	information = dia_angar_di_follow_info;
	permanent = TRUE;
	description = "��������� �� �����.";
};


func int dia_angar_di_follow_condition()
{
	if(ANGAR_DI_PARTY == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_angar_di_follow_info()
{
	AI_Output(other,self,"DIA_Angar_DI_FOLLOW_15_00");	//��������� �� �����.
	if(Npc_GetDistToWP(self,"SKELETTE") < 4000)
	{
		AI_Output(other,self,"DIA_Angar_DI_FOLLOW_15_01");	//�� ��������� � ��� ����������.
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_02");	//�����.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		ANGAR_DI_PARTY = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else
	{
		AI_Output(self,other,"DIA_Angar_DI_FOLLOW_04_03");	//�������.
		AI_StopProcessInfos(self);
		if(Npc_GetDistToWP(self,"SHIP") < 10000)
		{
			Npc_ExchangeRoutine(self,"Start");
		}
		else if(Npc_IsDead(firedragonisland))
		{
			Npc_ExchangeRoutine(self,"FireDragonIsland");
		}
		else if(Npc_IsDead(orkelite_antipaladinorkoberst_di))
		{
			Npc_ExchangeRoutine(self,"ORKOBERST_DI");
		}
		else if(Npc_IsDead(troll_di))
		{
			Npc_ExchangeRoutine(self,"Troll_DI");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	};
	ANGAR_DI_PARTY = LOG_OBSOLETE;
};


instance DIA_ANGAR_DI_FOLLOWAGAIN(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 5;
	condition = dia_angar_di_followagain_condition;
	information = dia_angar_di_followagain_info;
	permanent = TRUE;
	description = "��� �� ����.";
};


func int dia_angar_di_followagain_condition()
{
	if(ANGAR_DI_PARTY == LOG_OBSOLETE)
	{
		return TRUE;
	};
};

func void dia_angar_di_followagain_info()
{
	AI_Output(other,self,"DIA_Angar_DI_FOLLOWAGAIN_15_00");	//��� �� ����.
	AI_Output(self,other,"DIA_Angar_DI_FOLLOWAGAIN_04_01");	//�� ����� ������.
	ANGAR_DI_PARTY = LOG_RUNNING;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowDI");
};


instance DIA_ANGAR_DI_FOLLOWSTOP(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 5;
	condition = dia_angar_di_followstop_condition;
	information = dia_angar_di_followstop_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_angar_di_followstop_condition()
{
	if((ANGAR_DI_PARTY == LOG_RUNNING) && (((Npc_GetDistToWP(self,"DI_DRACONIANAREA_FIREDRAGON") < 3000) && (Npc_IsDead(firedragonisland) == FALSE)) || (Npc_GetDistToWP(self,"SKELETTE") < 3000)))
	{
		return TRUE;
	};
};

func void dia_angar_di_followstop_info()
{
	AI_Output(self,other,"DIA_Angar_DI_FOLLOWSTOP_04_00");	//����! ��� �������� ���� ������ ���� � ���!
};


instance DIA_ANGAR_DI_UNDEADDRGDEAD(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 2;
	condition = dia_angar_di_undeaddrgdead_condition;
	information = dia_angar_di_undeaddrgdead_info;
	description = "��� �������.";
};


func int dia_angar_di_undeaddrgdead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};

func void dia_angar_di_undeaddrgdead_info()
{
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_00");	//��� �������.
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_01");	//����� ��, �������, ���������� ������?
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_02");	//��. ���� ��������.
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_03");	//����� �� ����� ������ �������. ��� � �������� � ����� ���, ����� �� �������� �����.
	if(SC_KNOWSMADPSI == TRUE)
	{
		AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_04");	//�������, ������ ������ �� ������ ����� ����� �� �������� � �����.
		AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_05");	//��� ����� ����. ������ ���� ����� ������. ��� ���� ���� ���� �� ����������. ��� �����?
	};
	AI_Output(other,self,"DIA_Angar_DI_UNDEADDRGDEAD_15_06");	//��� �� ������ ������ ������?
	AI_Output(self,other,"DIA_Angar_DI_UNDEADDRGDEAD_04_07");	//����� ����, � ����� ���-������ � ����� ��������. � ����� �� ��������.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_ANGAR_DI_PICKPOCKET(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 900;
	condition = dia_angar_di_pickpocket_condition;
	information = dia_angar_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_angar_di_pickpocket_condition()
{
	return c_beklauen(47,45);
};

func void dia_angar_di_pickpocket_info()
{
	Info_ClearChoices(dia_angar_di_pickpocket);
	Info_AddChoice(dia_angar_di_pickpocket,DIALOG_BACK,dia_angar_di_pickpocket_back);
	Info_AddChoice(dia_angar_di_pickpocket,DIALOG_PICKPOCKET,dia_angar_di_pickpocket_doit);
};

func void dia_angar_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_angar_di_pickpocket);
};

func void dia_angar_di_pickpocket_back()
{
	Info_ClearChoices(dia_angar_di_pickpocket);
};


instance DIA_ANGAR_DI_FOUNDAMULETT(C_INFO)
{
	npc = djg_705_angar_di;
	nr = 7;
	condition = dia_angar_di_foundamulett_condition;
	information = dia_angar_di_foundamulett_info;
	description = "� ����� ���� ������.";
};


func int dia_angar_di_foundamulett_condition()
{
	if(Npc_HasItems(other,itam_mana_angar_mis) && Npc_KnowsInfo(other,dia_angar_wiekommstduhierher) && (DJG_ANGARGOTAMULETT == FALSE))
	{
		return TRUE;
	};
};

func void dia_angar_di_foundamulett_info()
{
	b_angarsamulettabgeben();
};

