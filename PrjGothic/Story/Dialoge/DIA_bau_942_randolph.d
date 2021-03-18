
instance DIA_RANDOLPH_EXIT(C_INFO)
{
	npc = bau_942_randolph;
	nr = 999;
	condition = dia_randolph_exit_condition;
	information = dia_randolph_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_randolph_exit_condition()
{
	return TRUE;
};

func void dia_randolph_exit_info()
{
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_SCHWERELUFT(C_INFO)
{
	npc = bau_942_randolph;
	nr = 4;
	condition = dia_randolph_schwereluft_condition;
	information = dia_randolph_schwereluft_info;
	permanent = FALSE;
	description = "��� � �������?";
};


func int dia_randolph_schwereluft_condition()
{
	if(!Npc_IsDead(alvares) && !Npc_IsDead(engardo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_schwereluft_info()
{
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_00");	//��� � �������?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_01");	//����... ��� ������ ���-������ ����� ������ �������� �����, �������� ����� ������... ��� ��� ���� ���������� - ��� ����� �� ��������.
	AI_Output(other,self,"DIA_Randolph_SchwereLuft_15_02");	//�� ������ ����������� � �������?
	AI_Output(self,other,"DIA_Randolph_SchwereLuft_06_03");	//� �� �������� � �������, ����� �������� �����. �� � ����� �� ��������� ������������� ��.
	AKILS_SLDSTILLTHERE = TRUE;
	Log_CreateTopic(TOPIC_AKILSSLDSTILLTHERE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AKILSSLDSTILLTHERE,LOG_RUNNING);
	b_logentry(TOPIC_AKILSSLDSTILLTHERE,"������� ����� �������� ��������.");
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_HALLO(C_INFO)
{
	npc = bau_942_randolph;
	nr = 4;
	condition = dia_randolph_hallo_condition;
	information = dia_randolph_hallo_info;
	permanent = FALSE;
	description = "��� � �������?";
};


func int dia_randolph_hallo_condition()
{
	if(Npc_IsDead(alvares) && Npc_IsDead(engardo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_hallo_info()
{
	AI_Output(other,self,"DIA_Randolph_HALLO_15_00");	//��� � �������?
	if(Npc_IsDead(akil) && Npc_IsDead(kati))
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_01");	//������, ����� ���� � ���� ����������� � ������� ������, � ���� ��������� ���� ������.
		Npc_ExchangeRoutine(self,"START");
		AI_ContinueRoutine(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_HALLO_06_02");	//��, � � �������. ���� �������� ���������� ��� ������ � ������ � ������ ����. ������, ��� ��� ���������.
	};
	AI_Output(self,other,"DIA_Randolph_HALLO_06_03");	//�� ���� � �� ��������� �� ������ - ��� ��� �� ���������� �������� ���� � �������.
};


instance DIA_RANDOLPH_BALTRAM(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_baltram_condition;
	information = dia_randolph_baltram_info;
	permanent = FALSE;
	description = "���� ������� ��������. � ������ ������� ����� ��� ����.";
};


func int dia_randolph_baltram_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (MIS_BALTRAM_SCOUTAKIL == LOG_RUNNING) && Npc_IsDead(akil) && Npc_IsDead(kati) && (LIEFERUNG_GEHOLT == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_baltram_info()
{
	AI_Output(other,self,"DIA_Randolph_Baltram_15_00");	//���� ������� ��������. � ������ ������� ����� ��� ����.
	AI_Output(self,other,"DIA_Randolph_Baltram_06_01");	//������. � ��� ��� ����������. ��� ���� �����.
	CreateInvItems(self,itmi_baltrampaket,1);
	b_giveinvitems(self,other,itmi_baltrampaket,1);
	LIEFERUNG_GEHOLT = TRUE;
};


instance DIA_RANDOLPH_GESCHICHTE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_geschichte_condition;
	information = dia_randolph_geschichte_info;
	permanent = FALSE;
	description = "�� ���� ���������, ��?";
};


func int dia_randolph_geschichte_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_geschichte_info()
{
	AI_Output(other,self,"DIA_Randolph_Geschichte_15_00");	//�� ���� ���������, ��?
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_01");	//� ������ � ����� ��������. �����-�� ������ �������� � ���������, ��� �� �������� ����� ����, ����� �������� ���������� ����.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_02");	//�� ����� � ������� ����, ��� ������� ���� �������� ������. � ��� ����������� ���� ����. ������� � ����� �������� � �����.
	AI_Output(self,other,"DIA_Randolph_Geschichte_06_03");	//����� ���� ��������� ��������� �������, � � ����� �������� �� �����. � ���� ���� ������ � ������, ������ ��� ������.
};


instance DIA_RANDOLPH_TAVERNE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 5;
	condition = dia_randolph_taverne_condition;
	information = dia_randolph_taverne_info;
	description = "�� ������� � �������?";
};


func int dia_randolph_taverne_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_hallo) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_taverne_info()
{
	AI_Output(other,self,"DIA_Randolph_TAVERNE_15_00");	//�� ������� � �������?
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_01");	//�����.
	AI_Output(self,other,"DIA_Randolph_TAVERNE_06_02");	//�� ������ � �� ���� ��������� ���� ������ ����.
};


instance DIA_RANDOLPH_WASISTINTAVERNE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 6;
	condition = dia_randolph_wasistintaverne_condition;
	information = dia_randolph_wasistintaverne_info;
	description = "� ��� ��� ����������, � �������?";
};


func int dia_randolph_wasistintaverne_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_taverne) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_wasistintaverne_info()
{
	AI_Output(other,self,"DIA_Randolph_WASISTINTAVERNE_15_00");	//� ��� ��� ����������, � �������?
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_01");	//��� �������� �������� ����.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_02");	//���� ����������� ���� � ������. ���, ��� ����� ������ ������ ���� - ���������.
	AI_Output(self,other,"DIA_Randolph_WASISTINTAVERNE_06_03");	//� ��������� ����� � ������ ����������, � ������ � ���� ������ �� �������� �����.
	Log_CreateTopic(TOPIC_WETTSAUFEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WETTSAUFEN,LOG_RUNNING);
	b_logentry(TOPIC_WETTSAUFEN,"� ������� ����� ��������� ����.");
};


instance DIA_RANDOLPH_GEGENWEN(C_INFO)
{
	npc = bau_942_randolph;
	nr = 7;
	condition = dia_randolph_gegenwen_condition;
	information = dia_randolph_gegenwen_info;
	description = "� ��� �� ������������?";
};


func int dia_randolph_gegenwen_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_wasistintaverne) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_gegenwen_info()
{
	AI_Output(other,self,"DIA_Randolph_GEGENWEN_15_00");	//� ��� �� ������������?
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_01");	//� �������, ���� ������ ������������. �� ������ �������� ����.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_02");	//�� � ���� ���� ����������, ��� ��� ������� ������ ��� ����� ����������� � ��� ���� ����.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_03");	//� �����, �� ������ ���� � ����� �������� �������. ��� ������!
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_04");	//���-������ ������ ��������� ���� � ��� ������� �� ����. ����� �� ����� ��������� �� � ��� ���� ������� �����.
	AI_Output(self,other,"DIA_Randolph_GEGENWEN_06_05");	//���� �� ������ � ���� ���� ������, ����� ��������� � ��� ��� ���.
	b_logentry(TOPIC_WETTSAUFEN,"�������� ��������� ��� � ������ � ���������� '��� ���� ��������'. � ��������� ������������ �����, ����� ��������� ���� � ������� ��� ���.");
	b_logentry(TOPIC_WETTSAUFEN,"�������� ����������� ������ � ������������ � ���������� '��� ���� ��������'. �������� ����� �� ��������� ������� ����� � ������� ������ �� ������� � �����.");
};


instance DIA_RANDOLPH_WASBRAUCHSTDU(C_INFO)
{
	npc = bau_942_randolph;
	nr = 8;
	condition = dia_randolph_wasbrauchstdu_condition;
	information = dia_randolph_wasbrauchstdu_info;
	description = "������� ����� ���� ����� ��� ����� ����������?";
};


func int dia_randolph_wasbrauchstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_gegenwen) && (MIS_RUKHAR_WETTKAMPF == LOG_RUNNING) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_wasbrauchstdu_info()
{
	AI_Output(other,self,"DIA_Randolph_WASBRAUCHSTDU_15_00");	//������� ����� ���� ����� ��� ����� ����������?
	AI_Output(self,other,"DIA_Randolph_WASBRAUCHSTDU_06_01");	//10 �������.
};


instance DIA_RANDOLPH_ICHGEBEDIRGELD(C_INFO)
{
	npc = bau_942_randolph;
	nr = 9;
	condition = dia_randolph_ichgebedirgeld_condition;
	information = dia_randolph_ichgebedirgeld_info;
	permanent = TRUE;
	description = "� ��� ���� ������, ����� �� �������� � �������.";
};


var int dia_randolph_ichgebedirgeld_noperm;

func int dia_randolph_ichgebedirgeld_condition()
{
	if(Npc_KnowsInfo(other,dia_randolph_wasbrauchstdu) && (DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == FALSE) && (KAPITEL < 4))
	{
		return TRUE;
	};
};

func void dia_randolph_ichgebedirgeld_info()
{
	AI_Output(other,self,"DIA_Randolph_ICHGEBEDIRGELD_15_00");	//� ��� ���� ������, ����� �� �������� � �������.
	if(b_giveinvitems(other,self,itmi_gold,10))
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_01");	//(�����������) ������? �������� �������. � ����� ����� �� ����.
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_02");	//���� � ����� ��������, � ���� ����� ���� �� � ����������. ��� ��������.
		b_logentry(TOPIC_WETTSAUFEN,"���� ���������. � ������ ��������� �� ���.");
		b_giveplayerxp(XP_RANDOLPH_WETTKAMPFSTART);
		DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM = TRUE;
		b_npcclearobsessionbydmt(self);
		MIS_RUKHAR_WETTKAMPF_DAY = Wld_GetDay();
		Npc_ExchangeRoutine(self,"Wettkampf");
		b_startotherroutine(orlan,"Wettkampf");
		b_startotherroutine(rukhar,"Wettkampf");
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_ICHGEBEDIRGELD_06_03");	//�� �����. � ���� ���� �����-�� ���.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_WETTKAMPFZUENDE(C_INFO)
{
	npc = bau_942_randolph;
	nr = 10;
	condition = dia_randolph_wettkampfzuende_condition;
	information = dia_randolph_wettkampfzuende_info;
	permanent = TRUE;
	description = "��������?";
};


func int dia_randolph_wettkampfzuende_condition()
{
	if((MIS_RUKHAR_WETTKAMPF == LOG_SUCCESS) && (KAPITEL < 4))
	{
		return TRUE;
	};
};


var int dia_randolph_wettkampfzuende_onetime;

func void dia_randolph_wettkampfzuende_info()
{
	AI_Output(other,self,"DIA_Randolph_WETTKAMPFZUENDE_15_00");	//��������?
	if(RUKHAR_WON_WETTKAMPF == TRUE)
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_01");	//�� ��, ����� ������ �� ���������. � � �� ���� ���������� �� ����. � ������ ����� � ��� �� ������, �������!
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_02");	//���� ������ �������. ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_03");	//���. � �������� ���� �������, ������.
		if(DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_04");	//���, �������, ����������. ������� ��� ��� �� ������. ���, ������ �� �����.
			CreateInvItems(self,itmi_gold,20);
			b_giveinvitems(self,other,itmi_gold,12);
			DIA_RANDOLPH_WETTKAMPFZUENDE_ONETIME = TRUE;
		};
		AI_Output(self,other,"DIA_Randolph_WETTKAMPFZUENDE_06_05");	//������, ����� �� ����� ��� ��������� ����� �����.
	};
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_PERM(C_INFO)
{
	npc = bau_942_randolph;
	nr = 30;
	condition = dia_randolph_perm_condition;
	information = dia_randolph_perm_info;
	permanent = TRUE;
	description = "�� � �������?";
};


func int dia_randolph_perm_condition()
{
	if((KAPITEL >= 4) && (NPCOBSESSEDBYDMT_RANDOLPH == FALSE))
	{
		return TRUE;
	};
};


var int dia_randolph_perm_gotmoney;

func void dia_randolph_perm_info()
{
	if(hero.guild == GIL_KDF)
	{
		b_npcobsessedbydmt(self);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_PERM_15_00");	//�� � �������?
		if(((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)) && (MIS_HEALRANDOLPH != LOG_SUCCESS))
		{
			if((DIA_SAGITTA_HEALRANDOLPH_GOTONE == FALSE) && (DIA_SAGITTA_HEALRANDOLPH_KNOWSPRICE == TRUE) && (DIA_RANDOLPH_PERM_GOTMONEY == FALSE))
			{
				AI_Output(other,self,"DIA_Randolph_PERM_15_01");	//�� ������ ����, �� ��� �����, � �� �����������, ��� ��� ��������� ����� �������?!
				AI_Output(other,self,"DIA_Randolph_PERM_15_02");	//������� ����� 300 ������� �� ����.
				AI_Output(self,other,"DIA_Randolph_PERM_06_03");	//� ���� ���� ���� ������ 150 �������. ����������. �� ������ ������ ���. ����������.
				CreateInvItems(self,itmi_gold,150);
				b_giveinvitems(self,other,itmi_gold,150);
				DIA_RANDOLPH_PERM_GOTMONEY = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Randolph_PERM_06_04");	//��� �����. ������ ���, ����� � �������� ����, ��� �������� ������� ����. ��� ����� ����� ������.
				AI_Output(self,other,"DIA_Randolph_PERM_06_05");	//�� ���� ���������, ������� ����� ������.
				AI_Output(self,other,"DIA_Randolph_PERM_06_06");	//�������, ������-������������, ��� �������� ��� ��� ����. �� � �� �����, ��� ������ ����� ��������� �� ��� ���. ��� ������� ����.
			};
			Log_CreateTopic(TOPIC_HEALRANDOLPH,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HEALRANDOLPH,LOG_RUNNING);
			b_logentry(TOPIC_HEALRANDOLPH,"��������, ������, ����� ������� ���� � ������ ���� � ������� �� ���������� �� ����������� ��������.");
			MIS_HEALRANDOLPH = LOG_RUNNING;
		}
		else
		{
			AI_Output(self,other,"DIA_Randolph_PERM_06_07");	//� ��� ��� �������� �������� � �����, �� ��� ��� ����� �����.
		};
	};
};


instance DIA_RANDOLPH_HEILUNG(C_INFO)
{
	npc = bau_942_randolph;
	nr = 55;
	condition = dia_randolph_heilung_condition;
	information = dia_randolph_heilung_info;
	permanent = TRUE;
	description = "�������� ������� ���� � ������, ��?";
};


func int dia_randolph_heilung_condition()
{
	if((NPCOBSESSEDBYDMT_RANDOLPH == TRUE) && (NPCOBSESSEDBYDMT == FALSE) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_randolph_heilung_info()
{
	AI_Output(other,self,"DIA_Randolph_Heilung_15_00");	//�������� ������� ���� � ������, ��?
	AI_Output(self,other,"DIA_Randolph_Heilung_06_01");	//� ������ ����� � ��� �� ������. ������ �� � ���� �����. �� ������ ��� ��������, ������.
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_SAGITTAHEAL(C_INFO)
{
	npc = bau_942_randolph;
	nr = 56;
	condition = dia_randolph_sagittaheal_condition;
	information = dia_randolph_sagittaheal_info;
	description = "�����. ��� �������� ���� ��������.";
};


func int dia_randolph_sagittaheal_condition()
{
	if((MIS_HEALRANDOLPH == LOG_RUNNING) && Npc_HasItems(other,itpo_healrandolph_mis))
	{
		return TRUE;
	};
};

func void dia_randolph_sagittaheal_info()
{
	AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_00");	//�����. ��� �������� ���� ��������.
	b_giveinvitems(other,self,itpo_healrandolph_mis,1);
	if(Npc_IsInState(self,zs_pick_fp))
	{
		b_useitem(self,itpo_healrandolph_mis);
	};
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_01");	//��! �������, ����. ������ � ����� ���� �� �������.
	AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_02");	//��� � ���� ��������� ���� �� ���?
	if(DIA_RANDOLPH_PERM_GOTMONEY == FALSE)
	{
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_03");	//� �����, ��� ��������� ����� ����� ������ ������ ��� ������ ����. �� �����, ��� ���, ��� � ���� ����.
		CreateInvItems(self,itmi_gold,150);
		b_giveinvitems(self,other,itmi_gold,150);
	}
	else
	{
		AI_Output(other,self,"DIA_Randolph_SAGITTAHEAL_15_04");	//� �������� �� ���� ���� �����. ���� ������ ��������� ����� ����� �� ����� �������������� ��� �������.
		AI_Output(self,other,"DIA_Randolph_SAGITTAHEAL_06_05");	//��, � ����� ������ ��� �������, ��� � �������� ������ ������������� ��������, ���� ��� �� �������?
	};
	MIS_HEALRANDOLPH = LOG_SUCCESS;
	b_giveplayerxp(XP_HEALRANDOLPH);
	b_npcclearobsessionbydmt(self);
};


instance DIA_RANDOLPH_PICKPOCKET(C_INFO)
{
	npc = bau_942_randolph;
	nr = 900;
	condition = dia_randolph_pickpocket_condition;
	information = dia_randolph_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_randolph_pickpocket_condition()
{
	return c_beklauen(58,2);
};

func void dia_randolph_pickpocket_info()
{
	Info_ClearChoices(dia_randolph_pickpocket);
	Info_AddChoice(dia_randolph_pickpocket,DIALOG_BACK,dia_randolph_pickpocket_back);
	Info_AddChoice(dia_randolph_pickpocket,DIALOG_PICKPOCKET,dia_randolph_pickpocket_doit);
};

func void dia_randolph_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_randolph_pickpocket);
};

func void dia_randolph_pickpocket_back()
{
	Info_ClearChoices(dia_randolph_pickpocket);
};

