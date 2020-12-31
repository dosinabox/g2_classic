
instance DIA_RENGARU_EXIT(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 999;
	condition = dia_rengaru_exit_condition;
	information = dia_rengaru_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rengaru_exit_condition()
{
	return TRUE;
};

func void dia_rengaru_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RENGARU_PICKPOCKET(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 900;
	condition = dia_rengaru_pickpocket_condition;
	information = dia_rengaru_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rengaru_pickpocket_condition()
{
	return c_beklauen(20,5);
};

func void dia_rengaru_pickpocket_info()
{
	Info_ClearChoices(dia_rengaru_pickpocket);
	Info_AddChoice(dia_rengaru_pickpocket,DIALOG_BACK,dia_rengaru_pickpocket_back);
	Info_AddChoice(dia_rengaru_pickpocket,DIALOG_PICKPOCKET,dia_rengaru_pickpocket_doit);
};

func void dia_rengaru_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rengaru_pickpocket);
};

func void dia_rengaru_pickpocket_back()
{
	Info_ClearChoices(dia_rengaru_pickpocket);
};


instance DIA_RENGARU_HAUAB(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_hauab_condition;
	information = dia_rengaru_hauab_info;
	permanent = TRUE;
	description = "��� �� ������� �����?";
};


func int dia_rengaru_hauab_condition()
{
	if((JORA_DIEB != LOG_RUNNING) && (Npc_KnowsInfo(other,dia_rengaru_gotyou) == FALSE))
	{
		return TRUE;
	};
};

func void dia_rengaru_hauab_info()
{
	AI_Output(other,self,"DIA_Rengaru_Hauab_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Rengaru_Hauab_07_01");	//� �� �������, ����� ���� �� ����� ����. ����������!
	AI_StopProcessInfos(self);
};


instance DIA_RENGARU_HALLODIEB(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_hallodieb_condition;
	information = dia_rengaru_hallodieb_info;
	permanent = FALSE;
	description = "����� �������, ��� �� ����� � ���� ������...";
};


func int dia_rengaru_hallodieb_condition()
{
	if(JORA_DIEB == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_rengaru_hallodieb_info()
{
	AI_Output(other,self,"DIA_Rengaru_HALLODIEB_15_00");	//����� �������, ��� �� ����� � ���� ������...
	AI_Output(self,other,"DIA_Rengaru_HALLODIEB_07_01");	//����! � �������� ������!
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunAway");
};


instance DIA_RENGARU_GOTYOU(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 3;
	condition = dia_rengaru_gotyou_condition;
	information = dia_rengaru_gotyou_info;
	permanent = FALSE;
	description = "������!";
};


func int dia_rengaru_gotyou_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_hallodieb))
	{
		return TRUE;
	};
};

func void dia_rengaru_gotyou_info()
{
	b_giveplayerxp(XP_RENGARUGOTTHIEF);
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_00");	//������!
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_07_01");	//��� ���� ����� �� ����?
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_02");	//�� ����� ������� � ����� ����� ���� ���, � �� ���� �����, ��� �� ������ ���.
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_15_03");	//������� � ������ ������� ����, ��� �� ������� ��� � ���...
	Info_ClearChoices(dia_rengaru_gotyou);
	Info_AddChoice(dia_rengaru_gotyou,"...� ���������� ���� �� �������������.",dia_rengaru_gotyou_anteil);
	Info_AddChoice(dia_rengaru_gotyou,"...���� ����� ������� ������ �����. � ����������.",dia_rengaru_gotyou_youthief);
	Info_AddChoice(dia_rengaru_gotyou,"...� ������ �� ���������� ���, ��� �� �����.",dia_rengaru_gotyou_whoareyou);
};

func void dia_rengaru_gotyou_youthief()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_YouThief_15_00");	//...���� ����� ������� ������ �����. � ����������.
	if(Npc_HasItems(self,itmi_gold) >= 1)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_01");	//��� ������, ������! �� ������ ������� ����. � ������ ������� �� ���� ���������� ����.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_02");	//� ���� ��� ��� ����� ������.
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Rengaru_GOTYOU_YouThief_07_03");	//�� ����� � ������ ���� ���? ���� ��� �� ���� �������!
		};
	};
	Info_ClearChoices(dia_rengaru_gotyou);
};

func void dia_rengaru_gotyou_anteil()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_15_00");	//...� ���������� ���� �� �������������.
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST) && (Npc_HasItems(self,itmi_gold) < 1))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_07_01");	//�� ��� ������ ���, ��� � ���� ����, ����� ����, ��� ������� ����! �����!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_15_02");	//������, ������, � ���� ��� ������. �����, �������� �������.
		Info_ClearChoices(dia_rengaru_gotyou);
		Info_AddChoice(dia_rengaru_gotyou,"���, �� ������ ��� ���!",dia_rengaru_gotyou_anteil_alles);
		Info_AddChoice(dia_rengaru_gotyou,"������, ����� ��� �������� �����.",dia_rengaru_gotyou_anteil_gehtklar);
	};
};

func void dia_rengaru_gotyou_anteil_alles()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_alles_15_00");	//���, �� ������ ��� ���!
	if(Npc_HasItems(self,itmi_gold) >= 2)
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_02");	//�� ������ ������� ����. �����, ������ ��� ������. � ������ ������ ���� � �����.
		b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold));
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_alles_07_03");	//� �� ����� ���� ������, �� � ���� ������ ������ ���.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_anteil_gehtklar()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_15_00");	//������, ����� ��� �������� �����.
	if(b_giveinvitems(self,other,itmi_gold,Npc_HasItems(self,itmi_gold) / 2))
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_01");	//��� ���� ��������! � ������ ������� ����!
		Info_ClearChoices(dia_rengaru_gotyou);
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_GOTYOU_Anteil_GehtKlar_07_02");	//� ��� �� �� ����� ������ ���� ��������, �� � ���� ������ ������ ���.
		Info_ClearChoices(dia_rengaru_gotyou);
	};
};

func void dia_rengaru_gotyou_whoareyou()
{
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_00");	//...� ������ �� ���������� ���, ��� �� �����.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_01");	//� ������ ������ �������, ���������� ������ ����� � �������.
	AI_Output(self,other,"DIA_Rengaru_GOTYOU_WhoAreYou_07_02");	//��� ��� ��� ������? � �� ���� ����� ������ � ������...
	AI_Output(other,self,"DIA_Rengaru_GOTYOU_WhoAreYou_15_03");	//...������, � �������. ������ �������.
};


instance DIA_RENGARU_INKNAST(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 4;
	condition = dia_rengaru_inknast_condition;
	information = dia_rengaru_inknast_info;
	permanent = FALSE;
	description = "� ������ ����� ���� ���������.";
};


func int dia_rengaru_inknast_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_gotyou))
	{
		return TRUE;
	};
};

func void dia_rengaru_inknast_info()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_15_00");	//� ������ ����� ���� ���������.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_07_01");	//��� ��� ���� �����? � ���� ������ �� ��������! ������� ����, �?!
	Info_AddChoice(dia_rengaru_inknast,"������ � ������ ��������� ����?",dia_rengaru_inknast_keinknast);
	Info_AddChoice(dia_rengaru_inknast,"� ����������, ����� ���� �������� �� �������.",dia_rengaru_inknast_knast);
	Info_AddChoice(dia_rengaru_inknast,"����������! � ����� ������ � ���� ����� �� �����!",dia_rengaru_inknast_hauab);
};

func void dia_rengaru_inknast_hauab()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_HauAb_15_00");	//����������! � ����� ������ � ���� ����� �� �����!
	AI_Output(self,other,"DIA_Rengaru_INKNAST_HauAb_07_01");	//�� �� ��������� �� ����! �������, ������!
	Npc_ExchangeRoutine(self,"Start");
	AI_StopProcessInfos(self);
	DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
};

func void dia_rengaru_inknast_knast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_Knast_15_00");	//� ����������, ����� ���� �������� �� �������.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_01");	//(������) � ��� ����� �� ����� �����. ���� ���� �������, ��� �� ������ ��� �������, �������� ��� ������.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_Knast_07_02");	//(��������������) �� ��������: ��� ������ ��� ���� ��� �� �������...
	RENGARU_INKNAST = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_rengaru_inknast_keinknast()
{
	AI_Output(other,self,"DIA_Rengaru_INKNAST_keinKnast_15_00");	//������ � ������ ��������� ����?
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_01");	//� ������ ������� �� �������� ����� � ������� ������ - � ������� ��������� � ����.
	AI_Output(self,other,"DIA_Rengaru_INKNAST_keinKnast_07_02");	//� ��� �� ��������� �������� �� ����. � �� ���� � �� ���� �������� ������. ������ ����.
};


instance DIA_RENGARU_LASTINFOKAP1(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 6;
	condition = dia_rengaru_lastinfokap1_condition;
	information = dia_rengaru_lastinfokap1_info;
	permanent = TRUE;
	description = "��� ����? � ���� ��� � �������?";
};


func int dia_rengaru_lastinfokap1_condition()
{
	if(Npc_KnowsInfo(other,dia_rengaru_inknast))
	{
		return TRUE;
	};
};

func void dia_rengaru_lastinfokap1_info()
{
	AI_Output(other,self,"DIA_Rengaru_LastInfoKap1_15_00");	//��� ����? � ���� ��� � �������?
	if(RENGARU_INKNAST == TRUE)
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_01");	//�����, �����, ��������. �����-������, �� ����������� �� ���. �������!
	}
	else
	{
		AI_Output(self,other,"DIA_Rengaru_LastInfoKap1_07_02");	//��� ��� ���� �����? � ������ ������ �� �����, ������!
	};
};


instance DIA_RENGARU_ZEICHEN(C_INFO)
{
	npc = vlk_492_rengaru;
	nr = 2;
	condition = dia_rengaru_zeichen_condition;
	information = dia_rengaru_zeichen_info;
	permanent = FALSE;
	description = "(�������� ������ �����)";
};


func int dia_rengaru_zeichen_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (RENGARU_INKNAST == FALSE) && Npc_KnowsInfo(other,dia_rengaru_gotyou))
	{
		return TRUE;
	};
};

func void dia_rengaru_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_00");	//��, �� ���� �� ���.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_01");	//� ����� ���� ���-���. ���� �� ������������� ������� � ���-������ ������ � ������, ���� �������� ��������� � ����������!
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_02");	//��� ����� ��������� � ���� �� �������� �� ����� �����. �� � ���� ���� ���� �����.
	AI_Output(self,other,"DIA_Rengaru_Zeichen_07_03");	//�������� ����� ������ ���� ������� ����� �����, ���������� ��� ���� ������. ��� �������� ��.
	other.attribute[ATR_DEXTERITY] = other.attribute[ATR_DEXTERITY] + 2;
	PrintScreen(PRINT_DEX2,-1,-1,FONT_SCREENSMALL,2);
	Snd_Play("LEVELUP");
};

