
instance DIA_GEROLD_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_exit_condition;
	information = dia_gerold_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_exit_condition()
{
	if(KAPITEL < 4)
	{
		return TRUE;
	};
};

func void dia_gerold_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_HALLO(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_hallo_condition;
	information = dia_gerold_hallo_info;
	permanent = FALSE;
	description = "��� �� ���������?";
};


func int dia_gerold_hallo_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_gerold_hallo_info()
{
	AI_Output(other,self,"DIA_Gerold_Hallo_15_00");	//��� �� ���������?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_01");	//�����������.
	AI_Output(other,self,"DIA_Gerold_Hallo_15_02");	//� ��� ���?
	AI_Output(self,other,"DIA_Gerold_Hallo_12_03");	//��������� ����������� � ������� ����. ��������� ������ - ������� ��� ���.
	AI_Output(self,other,"DIA_Gerold_Hallo_12_04");	//������ �������� ��� ��������� ��� ����.
};


instance DIA_GEROLD_JAIL(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_jail_condition;
	information = dia_gerold_jail_info;
	permanent = FALSE;
	description = "�� ���������� ���� � �������?";
};


func int dia_gerold_jail_condition()
{
	if((KAPITEL == 2) && Npc_KnowsInfo(other,dia_gerold_hallo) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_jail_info()
{
	AI_Output(other,self,"DIA_Gerold_Jail_15_00");	//�� ���������� ���� � �������?
	AI_Output(self,other,"DIA_Gerold_Jail_12_01");	//���. ����� �� ����� ������� � �������. ��� �������� ����. ����, ������� � ���� ���������.
	AI_Output(self,other,"DIA_Gerold_Jail_12_02");	//����� ��� �� �������, ���� �� ������ ������� � �������� ����� ��������. ����� �� ����.
	KNOWSABOUTGORN = TRUE;
};


instance DIA_GEROLD_AUSNAHME(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_ausnahme_condition;
	information = dia_gerold_ausnahme_info;
	permanent = FALSE;
	description = "�� �� ��� �� ������� ���������� ��� ����?";
};


func int dia_gerold_ausnahme_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_jail) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_ausnahme_info()
{
	AI_Output(other,self,"DIA_Gerold_Ausnahme_15_00");	//�� �� ��� �� ������� ���������� ��� ����?
	AI_Output(self,other,"DIA_Gerold_Ausnahme_12_01");	//���.
};


instance DIA_GEROLD_GOLD(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_gold_condition;
	information = dia_gerold_gold_info;
	permanent = FALSE;
	description = "� ��� ���� � ������� �������?";
};


func int dia_gerold_gold_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_ausnahme) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_gold_info()
{
	AI_Output(other,self,"DIA_Gerold_Gold_15_00");	//� ��� ���� � ������� �������?
	AI_Output(self,other,"DIA_Gerold_Gold_12_01");	//... �� ...
	AI_Output(self,other,"DIA_Gerold_Gold_12_02");	//���.
};


instance DIA_GEROLD_DEAL(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_deal_condition;
	information = dia_gerold_deal_info;
	permanent = FALSE;
	description = "� ���� ���� ������� ��� ������ �� �����������...";
};


func int dia_gerold_deal_condition()
{
	if((MIS_RESCUEGORN == LOG_RUNNING) && (Npc_HasItems(other,itwr_letterforgorn_mis) >= 1) && (KAPITEL == 2) && (GAROND_KERKERAUF == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_deal_info()
{
	AI_Output(other,self,"DIA_Gerold_Deal_15_00");	//� ���� ���� ������� ��� ������ �� �����������. �� ������ �������� ��?
	AI_Output(self,other,"DIA_Gerold_Deal_12_01");	//��... � ��������, � �� ���� ����������� ��� �����. ��� ���� ��� �������?
	AI_Output(other,self,"DIA_Gerold_Deal_15_02");	//��� �����.
	AI_Output(self,other,"DIA_Gerold_Deal_12_03");	//��� ����� ������ �����������. � �� �����, ��� ������ ����������. �� ���� ��� ��� ���� ��� �����, �� ������ ����� ������������.
	AI_Output(other,self,"DIA_Gerold_Deal_15_04");	//��� �� ������ �� ���?
	AI_Output(self,other,"DIA_Gerold_Deal_12_05");	//���� ����� ��������� ����� ����� ������ �������. � ���� ���������� ���.
	AI_Output(self,other,"DIA_Gerold_Deal_12_06");	//������� ��� ������� � ������� ������� ����� - � ������� �������� ����.
	AI_Output(self,other,"DIA_Gerold_Deal_12_07");	//������� ����, ����� ������ ��� ���... �� ����� ������ �������. � ����, � ���� ��������� ������� ��� ���. ��� ��� ������, ����� ������� ��������.
	b_logentry(TOPIC_RESCUEGORN,"���� � ������� �������� �������, ����, ���� � ���, �� �������� ������� �����.");
};


instance DIA_GEROLD_STUFF(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_stuff_condition;
	information = dia_gerold_stuff_info;
	permanent = TRUE;
	description = "� ������ ���� ���-���. ��� ���, ��� �� � ������.";
};


var int dia_gerold_stuff_permanent;

func int dia_gerold_stuff_condition()
{
	if((Npc_HasItems(other,itwr_letterforgorn_mis) >= 1) && Npc_KnowsInfo(other,dia_gerold_deal) && (KAPITEL == 2) && (DIA_GEROLD_STUFF_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_stuff_info()
{
	AI_Output(other,self,"DIA_Gerold_Stuff_15_00");	//� ������ ���� ���-���. ��� ���, ��� �� � ������.
	if(b_giveinvitems(other,self,itfo_honey,1) && b_giveinvitems(other,self,itfo_bread,1) && b_giveinvitems(other,self,itfo_wine,1) && b_giveinvitems(other,self,itfo_sausage,1))
	{
		AI_Output(self,other,"DIA_Gerold_Stuff_12_01");	//������, ��� ��������. ������� � ���� � �����?
		AI_Output(other,self,"DIA_Gerold_Stuff_15_02");	//��, ���. �� ������, ��� ��� �����.
		AI_Output(self,other,"DIA_Gerold_Stuff_12_03");	//������ ������, �� � ����� ������� ��� ������� ��.
		b_giveinvitems(other,self,itwr_letterforgorn_mis,1);
		DAYCONTACTGORN = Wld_GetDay();
		DIA_GEROLD_STUFF_PERMANENT = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"������� ������� ��, ��� �����, � �������� �������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_Stuff_12_04");	//������, ����� � ���� ����� ��, ��� � ������.
	};
};


instance DIA_GEROLD_ANTWORT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_antwort_condition;
	information = dia_gerold_antwort_info;
	permanent = TRUE;
	description = "���� ������� �������?";
};


var int dia_gerold_antwort_permanent;

func int dia_gerold_antwort_condition()
{
	if((DIA_GEROLD_STUFF_PERMANENT == TRUE) && (KAPITEL == 2) && (DIA_GEROLD_ANTWORT_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerold_antwort_info()
{
	AI_Output(other,self,"DIA_Gerold_Antwort_15_00");	//���� ������� �������?
	if(DAYCONTACTGORN < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Gerold_Antwort_12_01");	//��, � � ������ �������� ���� ��� �����:
		AI_Output(other,self,"DIA_Gerold_Antwort_15_02");	//�?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_03");	//��� ��������� � ����� �����.
		AI_Output(other,self,"DIA_Gerold_Antwort_15_04");	//�� ������ ���-������ ���?
		AI_Output(self,other,"DIA_Gerold_Antwort_12_05");	//���. ������� �� ����, ��� ��� ������. � �� ������?
		AI_Output(other,self,"DIA_Gerold_Antwort_15_06");	//��������. �� ���� �� ����� ������ ��������� ����� �� ����� ������.
		AI_Output(self,other,"DIA_Gerold_Antwort_12_07");	//��, ��������, �� ����.
		GORNSTREASURE = TRUE;
		DIA_GEROLD_ANTWORT_PERMANENT = TRUE;
		b_logentry(TOPIC_RESCUEGORN,"���� �������, ��� ��� ������ ��������� � ����� �����.");
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_GornsAnswer_12_08");	//��� ���. ����� �������.
	};
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_SETGORNFREE(C_INFO)
{
	npc = pal_261_gerold;
	nr = 2;
	condition = dia_gerold_setgornfree_condition;
	information = dia_gerold_setgornfree_info;
	permanent = FALSE;
	description = "�������� �����.";
};


func int dia_gerold_setgornfree_condition()
{
	if((GAROND_KERKERAUF == TRUE) && (KAPITEL == 2))
	{
		return TRUE;
	};
};

func void dia_gerold_setgornfree_info()
{
	AI_Output(other,self,"DIA_Gerold_SetGornFree_15_00");	//�������� �����. ��� ������ ������������ �������.
	AI_Output(self,other,"DIA_Gerold_SetGornFree_12_01");	//��� ��� �������� �� ����. ��� ����, �� ������ ����� ����.
	CreateInvItems(self,itke_prisonkey_mis,1);
	b_giveinvitems(self,other,itke_prisonkey_mis,1);
	b_logentry(TOPIC_RESCUEGORN,"������� ��� ��� ���� �� ������.");
};


instance DIA_GEROLD_PERM(C_INFO)
{
	npc = pal_261_gerold;
	nr = 900;
	condition = dia_gerold_perm_condition;
	information = dia_gerold_perm_info;
	permanent = TRUE;
	description = "�� �����-������ �����?";
};


func int dia_gerold_perm_condition()
{
	if((KAPITEL < 4) && Npc_KnowsInfo(other,dia_gerold_gold))
	{
		return TRUE;
	};
};

func void dia_gerold_perm_info()
{
	AI_Output(other,self,"DIA_Gerold_Perm_15_00");	//�� �����-������ �����?
	AI_Output(self,other,"DIA_Gerold_Perm_12_01");	//���. ��� ����� ������ ��� ���� ������� �� ����� �� �����.
};


instance DIA_GEROLD_KAP4_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap4_exit_condition;
	information = dia_gerold_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_gerold_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP4_ALLESRUHIG(C_INFO)
{
	npc = pal_261_gerold;
	nr = 30;
	condition = dia_gerold_kap4_allesruhig_condition;
	information = dia_gerold_kap4_allesruhig_info;
	description = "��� ����?";
};


func int dia_gerold_kap4_allesruhig_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_gerold_kap4_allesruhig_info()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_01");	//����, ��.
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_15_02");	//��?
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_03");	//� ���� ����� ��� ������ � ������������. ������ ����� ������ ���� �����.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_12_04");	//���� � �� ����� ���-������ ��������� ���, � ����� � ������ ����� ������ ������� �������.
	Info_ClearChoices(dia_gerold_kap4_allesruhig);
	Info_AddChoice(dia_gerold_kap4_allesruhig,"��� �� ��� ��������.",dia_gerold_kap4_allesruhig_nein);
	Info_AddChoice(dia_gerold_kap4_allesruhig,"��������, � ���� �������� ����.",dia_gerold_kap4_allesruhig_geben);
};

func void dia_gerold_kap4_allesruhig_geben()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_geben_15_00");	//��������, � ���� �������� ����.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_01");	//�� � ��� �����? ������ �� �����! ���� ���-������ ��� ������, � ���� ����� �������� ���� ����� ������, ���� �� ���������, � ��� �.
	if(Wld_IsTime(23,10,8,0) == FALSE)
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_02");	//�� ������� ���� � �����, ����� ��� ����� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_03");	//�������, ����� � ����, ���� ��������� �� ��������� �� ����� ���. � �� ���� ����� �� ������.
	};
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_04");	//� �����, � ��� ����� � ����� ������ ���. � ���� ����� ���� ���.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_geben_12_05");	//�� ������, ����� ��� �� ��������� �������� ����� ����� ��� �����-������ ����� ����� ����, �� �����?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Food");
	Log_CreateTopic(TOPIC_GEROLDGIVEFOOD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GEROLDGIVEFOOD,LOG_RUNNING);
	b_logentry(TOPIC_GEROLDGIVEFOOD,"������ ����� ������ ����. ��� ����� �������� �������� ���-������ ������, ���� �� � �������� �� ������� �����-������ ��������. � ������ ����������� � ��� � ���� �����, ����� ��� �����.");
	MIS_GEROLDGIVEFOOD = LOG_RUNNING;
};

func void dia_gerold_kap4_allesruhig_nein()
{
	AI_Output(other,self,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_15_00");	//��� �� ��� ��������.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_01");	//���� ����� ��������. ����-�� ����� ������ ��������� �� ������.
	AI_Output(self,other,"DIA_Gerold_KAP4_ALLESRUHIG_Nein_12_02");	//���� ���� �� � �� �������� ���, �� ������� ������� � ����� � ���� ���� ������������ ��������.
	AI_StopProcessInfos(self);
};


var int gerold_foodcounter;

instance DIA_GEROLD_FOOD(C_INFO)
{
	npc = pal_261_gerold;
	nr = 31;
	condition = dia_gerold_food_condition;
	information = dia_gerold_food_info;
	important = TRUE;
};


func int dia_gerold_food_condition()
{
	if((Npc_GetDistToWP(self,"OC_MAGE_IN") < 500) && (KAPITEL >= 4))
	{
		return TRUE;
	};
};

func void dia_gerold_morefood()
{
	Info_ClearChoices(dia_gerold_food);
	if(GEROLD_FOODCOUNTER > 8)
	{
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_00");	//����� ����������. ����� ����������! ������ � ���� ��������� ����� �� ����� ������ �����.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_01");	//��� ��� ������. � ��� ����� ������ �� ���� �� ���� ������ �����, � ���� ���, ����� ����, ����������.
		AI_Output(self,other,"DIA_Gerold_MoreFood_12_02");	//� ������ � ����� �����, ���� ����� �� ������ ���.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		MIS_GEROLDGIVEFOOD = LOG_SUCCESS;
		b_giveplayerxp(XP_GEROLDGIVEFOOD);
		CreateInvItems(self,itmi_gold,450);
		b_giveinvitems(self,other,itmi_gold,450);
	}
	else
	{
		if(GEROLD_FOODCOUNTER == 0)
		{
			Info_AddChoice(dia_gerold_food,"������ � ���� ������ ���.",dia_gerold_food_nichts);
		}
		else
		{
			Info_AddChoice(dia_gerold_food,"��� ���, ��� � ���� ����.",dia_gerold_food_kaese_nichtmehr);
			if(GEROLD_FOODCOUNTER < 5)
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_03");	//�������. ����� ����. � ��� � ���� ����?
			}
			else
			{
				AI_Output(self,other,"DIA_Gerold_MoreFood_12_04");	//��. ���, ���!
			};
		};
		if(Npc_HasItems(other,itfo_fishsoup) || Npc_HasItems(other,itfo_stew))
		{
			Info_AddChoice(dia_gerold_food,"(���� ���)",dia_gerold_food_suppe);
		};
		if(Npc_HasItems(other,itfomutton))
		{
			Info_AddChoice(dia_gerold_food,"(���� ����)",dia_gerold_food_fleisch);
		};
		if(Npc_HasItems(other,itfo_bacon))
		{
			Info_AddChoice(dia_gerold_food,"(���� ������)",dia_gerold_food_schinken);
		};
		if(Npc_HasItems(other,itfo_cheese))
		{
			Info_AddChoice(dia_gerold_food,"���� ���)",dia_gerold_food_kaese);
		};
		if(Npc_HasItems(other,itfo_sausage))
		{
			Info_AddChoice(dia_gerold_food,"���� �������)",dia_gerold_food_wurst);
		};
		GEROLD_FOODCOUNTER = GEROLD_FOODCOUNTER + 1;
	};
};

func void dia_gerold_food_info()
{
	AI_Output(self,other,"DIA_Gerold_FOOD_12_00");	//��� �� ���. � ���? � ���� ���� ���-������ ������?
	dia_gerold_morefood();
};

func void dia_gerold_food_nichts()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_nichts_15_00");	//������ � ���� ������ ���.
	AI_Output(self,other,"DIA_Gerold_FOOD_nichts_12_01");	//������� ���������� � ��� ������, � ����� ������ �������� ����?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
	Npc_ExchangeRoutine(self,"Start");
	MIS_GEROLDGIVEFOOD = LOG_FAILED;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_gerold_food_kaese_nichtmehr()
{
	var int xp_geroldgivefoodlow;
	var int teiler;
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_nichtmehr_15_00");	//��� ���, ��� � ���� ����.
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_01");	//� �, ��-������, ������ � ���? �����, ��� ��� �� �����, ��� ������. ���, ������ ������� ������ �� ���it.
	CreateInvItems(self,itmi_gold,50);
	b_giveinvitems(self,other,itmi_gold,50);
	AI_Output(self,other,"DIA_Gerold_FOOD_kaese_nichtmehr_12_02");	//������. � ������ ��� ����� ������������ �� ��� ����.
	AI_StopProcessInfos(self);
	if(GEROLD_FOODCOUNTER < 4)
	{
		teiler = 3;
	}
	else
	{
		teiler = 2;
	};
	xp_geroldgivefoodlow = XP_GEROLDGIVEFOOD / teiler;
	Npc_ExchangeRoutine(self,"Start");
	MIS_GEROLDGIVEFOOD = LOG_OBSOLETE;
	b_giveplayerxp(xp_geroldgivefoodlow);
};

func void dia_gerold_food_kaese()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_kaese_15_00");	//��� ������ ������� ����� ����?
	b_giveinvitems(other,self,itfo_cheese,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_wurst()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Wurst_15_00");	//����� �������?
	b_giveinvitems(other,self,itfo_sausage,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_schinken()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_schinken_15_00");	//� ���� ���� ���� ���� ������.
	b_giveinvitems(other,self,itfo_bacon,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_fleisch()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_fleisch_15_00");	//����� ����?
	b_giveinvitems(other,self,itfomutton,1);
	dia_gerold_morefood();
};

func void dia_gerold_food_suppe()
{
	AI_Output(other,self,"DIA_Gerold_FOOD_Suppe_15_00");	//������� ��� ��� ������ �� ��������, ���� ��� �� �������?
	if(b_giveinvitems(other,self,itfo_fishsoup,1))
	{
	}
	else
	{
		b_giveinvitems(other,self,itfo_stew,1);
	};
	dia_gerold_morefood();
};


instance DIA_GEROLD_PERM4(C_INFO)
{
	npc = pal_261_gerold;
	nr = 41;
	condition = dia_gerold_perm4_condition;
	information = dia_gerold_perm4_info;
	permanent = TRUE;
	description = "��� ��� �������?";
};


func int dia_gerold_perm4_condition()
{
	if(Npc_KnowsInfo(other,dia_gerold_kap4_allesruhig))
	{
		return TRUE;
	};
};

func void dia_gerold_perm4_info()
{
	AI_Output(other,self,"DIA_Gerold_PERM4_15_00");	//��� ��� �������?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_01");	//���� ���� ������� ��� �����, ���� ������ ������� �� ������� ���.
	}
	else if(MIS_GEROLDGIVEFOOD == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_02");	//��, ������ ����, ������. � ���� ������ �� �����. ������� ��� ���.
	}
	else if(MIS_GEROLDGIVEFOOD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_03");	//��. �� ��� ��, ������� �� ������.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_04");	//��� � �������, ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Gerold_PERM4_12_05");	//����������!
	};
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP5_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap5_exit_condition;
	information = dia_gerold_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_gerold_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_KAP6_EXIT(C_INFO)
{
	npc = pal_261_gerold;
	nr = 999;
	condition = dia_gerold_kap6_exit_condition;
	information = dia_gerold_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerold_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_gerold_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GEROLD_PICKPOCKET(C_INFO)
{
	npc = pal_261_gerold;
	nr = 900;
	condition = dia_gerold_pickpocket_condition;
	information = dia_gerold_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_gerold_pickpocket_condition()
{
	return c_beklauen(71,170);
};

func void dia_gerold_pickpocket_info()
{
	Info_ClearChoices(dia_gerold_pickpocket);
	Info_AddChoice(dia_gerold_pickpocket,DIALOG_BACK,dia_gerold_pickpocket_back);
	Info_AddChoice(dia_gerold_pickpocket,DIALOG_PICKPOCKET,dia_gerold_pickpocket_doit);
};

func void dia_gerold_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_gerold_pickpocket);
};

func void dia_gerold_pickpocket_back()
{
	Info_ClearChoices(dia_gerold_pickpocket);
};

