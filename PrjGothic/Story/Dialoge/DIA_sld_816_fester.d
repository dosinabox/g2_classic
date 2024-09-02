
instance DIA_FESTER_EXIT(C_INFO)
{
	npc = sld_816_fester;
	nr = 999;
	condition = dia_fester_exit_condition;
	information = dia_fester_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_fester_exit_condition()
{
	return TRUE;
};

func void dia_fester_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_FESTER_HELLO(C_INFO)
{
	npc = sld_816_fester;
	nr = 1;
	condition = dia_fester_hello_condition;
	information = dia_fester_hello_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_fester_hello_condition()
{
	return TRUE;
};

func void dia_fester_hello_info()
{
	AI_Output(other,self,"DIA_Fester_Hello_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Fester_Hello_08_01");	//� ��������� � ���...
};


instance DIA_FESTER_AUFTRAG(C_INFO)
{
	npc = sld_816_fester;
	nr = 2;
	condition = dia_fester_auftrag_condition;
	information = dia_fester_auftrag_info;
	permanent = FALSE;
	description = "�����?";
};


func int dia_fester_auftrag_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_hello))
	{
		return TRUE;
	};
};

func void dia_fester_auftrag_info()
{
	AI_Output(other,self,"DIA_Fester_Auftrag_15_00");	//�����?
	AI_Output(self,other,"DIA_Fester_Auftrag_08_01");	//��������� ����� � �������� ��� ������ � �������� ���������.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_02");	//���������� �������� ��� ����� ���� �����.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_03");	//� ���� ������ ���� �� ����� ����� ������� ��������. ��� �� ������ ��������� ��� ������.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_04");	//� � ���� ���� ��� ����. ������ �� �����, ����� � ����� ��������� ������ ���� ������.
	AI_Output(self,other,"DIA_Fester_Auftrag_08_05");	//� ��������� �������� ��� ������ ������, ������� ��� ������ ��� ���...
};


instance DIA_FESTER_YOUFIGHT(C_INFO)
{
	npc = sld_816_fester;
	nr = 3;
	condition = dia_fester_youfight_condition;
	information = dia_fester_youfight_info;
	permanent = FALSE;
	description = "�� ������� ����?";
};


func int dia_fester_youfight_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_hello) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_youfight_info()
{
	AI_Output(other,self,"DIA_Fester_YouFight_15_00");	//�� ������� ����?
	AI_Output(self,other,"DIA_Fester_YouFight_08_01");	//� ������� ���� ���������� � �����, � ��� ��� ������ ��� �����! � ������ �� �����������?
};


instance DIA_FESTER_WONEST(C_INFO)
{
	npc = sld_816_fester;
	nr = 4;
	condition = dia_fester_wonest_condition;
	information = dia_fester_wonest_info;
	permanent = FALSE;
	description = "��� ��� ������?";
};


func int dia_fester_wonest_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_auftrag) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_wonest_info()
{
	AI_Output(other,self,"DIA_Fester_WoNest_15_00");	//��� ��� ������?
	AI_Output(self,other,"DIA_Fester_WoNest_08_01");	//� ������ ���� ��� ���, ��� � ��� ������� �����.
};


var int fester_choice;
const int FC_GOLD = 0;
const int FC_JOIN = 1;

instance DIA_FESTER_TOGETHER(C_INFO)
{
	npc = sld_816_fester;
	nr = 5;
	condition = dia_fester_together_condition;
	information = dia_fester_together_info;
	permanent = FALSE;
	description = "�� ����� �� ��������� ��� ������ ������...";
};


func int dia_fester_together_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_auftrag))
	{
		return TRUE;
	};
};

func void dia_fester_together_info()
{
	AI_Output(other,self,"DIA_Fester_Together_15_00");	//�� ����� �� ��������� ��� ������ ������...
	AI_Output(self,other,"DIA_Fester_Together_08_01");	//�� ������ ������ ���? ������?
	Info_ClearChoices(dia_fester_together);
	Info_AddChoice(dia_fester_together,"� ���� �������� �� ��� ������!",dia_fester_together_gold);
	if(hero.guild == GIL_NONE)
	{
		Info_AddChoice(dia_fester_together,"� ���� �������������� � ���!",dia_fester_together_join);
	};
};

func void dia_fester_together_join()
{
	AI_Output(other,self,"DIA_Fester_Together_Join_15_00");	//� ���� �������������� � ���!
	AI_Output(self,other,"DIA_Fester_Together_Join_08_01");	//��, ����� �����. �� ������ ��������, ��� �� ������� ����...
	AI_Output(self,other,"DIA_Fester_Together_Join_08_02");	//(������) ������, ����� ����������� � ����� ������� ������.
	FESTER_CHOICE = FC_JOIN;
	Info_ClearChoices(dia_fester_together);
};

func void dia_fester_together_gold()
{
	AI_Output(other,self,"DIA_Fester_Together_Gold_15_00");	//� ���� �������� �� ��� ������!
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_01");	//(�������) �� �� �������! �� ������ ��������������� ���� ����������, ��?
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_02");	//�� ����, ���� � ������� ����, ���� ���������� � ��������?
	AI_Output(self,other,"DIA_Fester_Together_Gold_08_03");	//������. � ���� ��������� ���� 50 ������� - ��� ���, ��� � ���� ����.
	FESTER_CHOICE = FC_GOLD;
	Info_ClearChoices(dia_fester_together);
};


var int fester_losgeh_day;

instance DIA_FESTER_TOGETHERNOW(C_INFO)
{
	npc = sld_816_fester;
	nr = 6;
	condition = dia_fester_togethernow_condition;
	information = dia_fester_togethernow_info;
	permanent = TRUE;
	description = "����� ��������� ������!";
};


func int dia_fester_togethernow_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_KnowsInfo(other,dia_fester_together) && (MIS_FESTER_KILLBUGS == FALSE))
	{
		return TRUE;
	};
};

func void dia_fester_togethernow_info()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_15_00");	//����� ��������� ������!
	if(Wld_IsTime(20,30,6,0))
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_01");	//� �������? ���, ��� ����� ��������� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_02");	//����� ������? � �����, ���� ������� ��������� ���������� �������?
		AI_Output(self,other,"DIA_Fester_TogetherNOW_08_03");	//�� ��� �� ������� ������� �� �����...
		Info_ClearChoices(dia_fester_togethernow);
		Info_AddChoice(dia_fester_togethernow,"������, ����� �������� ��� �������...",dia_fester_togethernow_later);
		Info_AddChoice(dia_fester_togethernow,"������ �����������, ��� ������, �� �����.",dia_fester_togethernow_now);
	};
};

func void dia_fester_togethernow_now()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Now_15_00");	//������ �����������, ��� ������, �� �����.
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Now_08_01");	//������, ����� ���������, �� ��� �� ��������.
	Npc_ExchangeRoutine(self,"GUIDE");
	FESTER_LOSGEH_DAY = b_getdayplus();
	MIS_FESTER_KILLBUGS = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FESTERRAUBER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FESTERRAUBER,LOG_RUNNING);
	b_logentry(TOPIC_FESTERRAUBER,"� ��������� ��������� ������ ������� �������� ������ � ��������.");
	Info_ClearChoices(dia_fester_togethernow);
	AI_StopProcessInfos(self);
};

func void dia_fester_togethernow_later()
{
	AI_Output(other,self,"DIA_Fester_TogetherNOW_Later_15_00");	//������, ����� �������� ��� �������...
	AI_Output(self,other,"DIA_Fester_TogetherNOW_Later_08_01");	//�� ������, ��� ����� ����...
	Info_ClearChoices(dia_fester_togethernow);
};


instance DIA_FESTER_INCAVE(C_INFO)
{
	npc = sld_816_fester;
	nr = 7;
	condition = dia_fester_incave_condition;
	information = dia_fester_incave_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_fester_incave_condition()
{
	if((MIS_FESTER_KILLBUGS == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_BIGFARM_FELDREUBER4") <= 500))
	{
		self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
		return TRUE;
	};
};

func void dia_fester_incave_info()
{
	if(Wld_GetDay() > FESTER_LOSGEH_DAY)
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_00");	//��� �� ������, ���� ���� ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_InCave_08_01");	//��� ��� ���� ��� �������� ������� ��������. ����� ��������.
	};
	AI_Output(self,other,"DIA_Fester_InCave_08_02");	//������, ��� ��� ������� ����� ����������.
	AI_Output(self,other,"DIA_Fester_InCave_08_03");	//������ �����!
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
};


instance DIA_FESTER_WASMITABMACHUNG(C_INFO)
{
	npc = sld_816_fester;
	nr = 8;
	condition = dia_fester_wasmitabmachung_condition;
	information = dia_fester_wasmitabmachung_info;
	permanent = FALSE;
	description = "��� ������ ������ ����������?";
};


func int dia_fester_wasmitabmachung_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_incave))
	{
		return TRUE;
	};
};

func void dia_fester_wasmitabmachung_info()
{
	AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_00");	//��� ������ ������ ����������?
	if(FESTERS_GIANT_BUG_KILLED == 0)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_01");	//�� ������? �� �� ������ ������ �� �����.
	}
	else if(FESTER_CHOICE == FC_JOIN)
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_02");	//� ��� �� ������ ���� �������� � ���� ����, �� � �� ���� ������ �����.
		AI_Output(other,self,"DIA_Fester_WasMitAbmachung_15_03");	//������?
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_04");	//���� � ����� ����-������, ��� �� ����� ���, ��� ����� ��� ����� �������.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_05");	//�� ���������, ��� ����� ����������� ���� �� ������������?
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_06");	//���� �� �������, ������. �� � ������, �� ������� ����-������ ���, ��� ������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_07");	//�� - �� ����� ��������������� ���� ����������. � ������ � ������������ �����.
		AI_Output(self,other,"DIA_Fester_WasMitAbmachung_08_08");	//�������� ��������� �� ��� ���� � ����������: �� ������� ����. � ��� ���-�� �� ������, ����� ���?
	};
	MIS_FESTER_KILLBUGS = LOG_SUCCESS;
	b_checklog();
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGFARM01_RIGHTFIELD_02_MONSTER");
	Wld_InsertNpc(giant_bug,"NW_BIGMILL_FIELD_MONSTER_04");
	Wld_InsertNpc(giant_bug,"NW_BIGMILL_FIELD_MONSTER_04");
};


var int fester_duell_day;
var int fester_fightverarscht;
var int fester_fightsylvio;

instance DIA_FESTER_PERMPRUEGEL(C_INFO)
{
	npc = sld_816_fester;
	nr = 9;
	condition = dia_fester_permpruegel_condition;
	information = dia_fester_permpruegel_info;
	permanent = TRUE;
	description = "� �����, ���� �� �������� ��� ���� ������.";
};


func int dia_fester_permpruegel_condition()
{
	if(Npc_KnowsInfo(other,dia_fester_wasmitabmachung) || Npc_KnowsInfo(other,dia_jarvis_missionko) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE))
	{
		return TRUE;
	};
};

func void dia_fester_permpruegel_info()
{
	var int random;
	AI_Output(other,self,"DIA_Fester_PERMPruegel_15_00");	//� �����, ���� �� �������� ��� ���� ������.
	if(FESTER_DUELL_DAY < Wld_GetDay())
	{
		random = Hlp_Random(11);
		CreateInvItems(self,itmi_gold,random);
		FESTER_DUELL_DAY = Wld_GetDay();
	};
	if(Npc_KnowsInfo(other,dia_fester_wasmitabmachung) && (FESTER_FIGHTVERARSCHT == FALSE))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_01");	//��� �� ��������, ����� ���� ����������.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_02");	//� ���� �����, � ���� �����!
		FESTER_FIGHTVERARSCHT = TRUE;
	}
	else if(Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_03");	//���� �� ������ ����������� � �������.
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_04");	//�� ���� �� ���������� ��, ��? ����� �� ������ �������!
		FESTER_FIGHTSYLVIO = TRUE;
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_05");	//������ ����� ���� �� ���� ����?
		AI_Output(other,self,"DIA_Fester_PERMPruegel_15_06");	//��� ����� ������� ����������, ��� �� ������ �������� � �����!
	}
	else
	{
		AI_Output(self,other,"DIA_Fester_PERMPruegel_08_07");	//���� ��� ����, ��?
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_FESTER_PICKPOCKET(C_INFO)
{
	npc = sld_816_fester;
	nr = 900;
	condition = dia_fester_pickpocket_condition;
	information = dia_fester_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_fester_pickpocket_condition()
{
	return c_beklauen(27,45);
};

func void dia_fester_pickpocket_info()
{
	Info_ClearChoices(dia_fester_pickpocket);
	Info_AddChoice(dia_fester_pickpocket,DIALOG_BACK,dia_fester_pickpocket_back);
	Info_AddChoice(dia_fester_pickpocket,DIALOG_PICKPOCKET,dia_fester_pickpocket_doit);
};

func void dia_fester_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_fester_pickpocket);
};

func void dia_fester_pickpocket_back()
{
	Info_ClearChoices(dia_fester_pickpocket);
};

