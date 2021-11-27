
instance DIA_PEDRO_EXIT(C_INFO)
{
	npc = nov_600_pedro;
	nr = 999;
	condition = dia_pedro_exit_condition;
	information = dia_pedro_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pedro_exit_condition()
{
	return TRUE;
};

func void dia_pedro_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEDRO_WELCOME(C_INFO)
{
	npc = nov_600_pedro;
	nr = 1;
	condition = dia_pedro_welcome_condition;
	information = dia_pedro_welcome_info;
	important = TRUE;
};


func int dia_pedro_welcome_condition()
{
	return TRUE;
};

func void dia_pedro_welcome_info()
{
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_00");	//����� ���������� � ��������� ������, ���������.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_01");	//� ���� �����, �������� ����� ������ � ��������� ���� ����� ���������� ���������.
	AI_Output(self,other,"DIA_Pedro_WELCOME_09_02");	//��� �� ������?
};


instance DIA_PEDRO_WURST(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_wurst_condition;
	information = dia_pedro_wurst_info;
	permanent = FALSE;
	description = "���, ������ �������, ����!";
};


func int dia_pedro_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_pedro_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Pedro_Wurst_15_00");	//���, ������ �������, ����!
	AI_Output(self,other,"DIA_Pedro_Wurst_09_01");	//� ���, ��� �� ������� ��� ���. ������ ��� ��� ��������.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_02");	//�� ������ ���� ��� ��� ���� ��������?
	AI_Output(other,self,"DIA_Pedro_Wurst_15_03");	//������ �� ����, ����� �� �� ���� �� ������.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_04");	//��, ����� ���� �������� - ����� ���� �� ������� �����. � �� ���-��� �������� �� ��� - � ���� �����, ��� ������ �������� �������.
	AI_Output(self,other,"DIA_Pedro_Wurst_09_05");	//���� �� �������� �� �������, �� ��������� ���� ���� ���� �� ����������. ��� �������?
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
	Info_ClearChoices(dia_pedro_wurst);
	if(Npc_HasItems(other,itfo_schafswurst) >= 1)
	{
		Info_AddChoice(dia_pedro_wurst,"�����, ����� ��� ���� �������.",dia_pedro_wurst_ja);
	};
	Info_AddChoice(dia_pedro_wurst,"���, ������ �� ����.",dia_pedro_wurst_nein);
};

func void dia_pedro_wurst_ja()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_JA_15_00");	//�����, ����� ��� ���� �������.
	AI_Output(self,other,"DIA_Pedro_Wurst_JA_09_01");	//�������. �������� ������� ������ ����� � ������ �� ������ ������� �����.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	Info_ClearChoices(dia_pedro_wurst);
};

func void dia_pedro_wurst_nein()
{
	AI_Output(other,self,"DIA_Pedro_Wurst_NEIN_15_00");	//���, ������ �� ����.
	AI_Output(self,other,"DIA_Pedro_Wurst_NEIN_09_01");	//�� ������ ����������� ����� ��������, ��? ��, ����� ���������� ��� ����������...
	Info_ClearChoices(dia_pedro_wurst);
};


instance DIA_PEDRO_EINLASS(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_einlass_condition;
	information = dia_pedro_einlass_info;
	permanent = FALSE;
	description = "� ���� ����� � ���������.";
};


func int dia_pedro_einlass_condition()
{
	if(Npc_KnowsInfo(hero,dia_pedro_welcome))
	{
		return TRUE;
	};
};

func void dia_pedro_einlass_info()
{
	AI_Output(other,self,"DIA_Pedro_EINLASS_15_00");	//� ���� ����� � ���������.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_01");	//������ � ��������� ������ ������ ��� ���� ������.
	AI_Output(self,other,"DIA_Pedro_EINLASS_09_02");	//���� �� ������ ���������� ������, ��� � ������ �� ����������� �������. �� ������� ��� ���������� � ��������.
};


instance DIA_PEDRO_TEMPEL(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_tempel_condition;
	information = dia_pedro_tempel_info;
	permanent = FALSE;
	description = "��� ����� �������, ����� ���� ������� � ���������?";
};


func int dia_pedro_tempel_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_einlass) && (hero.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pedro_tempel_info()
{
	AI_Output(other,self,"DIA_Pedro_TEMPEL_15_00");	//��� ����� �������, ����� ���� ������� � ���������?
	if(other.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_01");	//����������� � ��������� ���������� ��� ���� - �� ��� ������ ���� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_02");	//���� �� ������ ���� �������� � �������� ������, �� ������ ����� � ��������� ������� ���������.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_03");	//����� ����, �� ������� ���������� ������ �� ������� ������ ����������. ��� ������ ���� ���� �...
		b_say_gold(self,other,SUMME_KLOSTER);
		AI_Output(other,self,"DIA_Pedro_TEMPEL_15_04");	//��� ����� ���� ������.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_05");	//��� ���� ����, ��� �� ��������� ����� ����� � �������� ����� ������. ����� �� ������ ������, ��� ���� ���������� ����������� ����� �������.
		AI_Output(self,other,"DIA_Pedro_TEMPEL_09_06");	//� ���������� ������� - ����� �� �� ������� ���������� �� ������ ������� ����� ������ ������.
		Log_CreateTopic(TOPIC_KLOSTER,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLOSTER,LOG_RUNNING);
		b_logentry(TOPIC_KLOSTER,"����� ����� ����������� ��������� ������, ��� ����� ���� � �������� ����� �������.");
	};
};


instance DIA_PEDRO_RULES(C_INFO)
{
	npc = nov_600_pedro;
	nr = 2;
	condition = dia_pedro_rules_condition;
	information = dia_pedro_rules_info;
	permanent = FALSE;
	description = "��� ��� �� �������, �� ������� �� ������?";
};


func int dia_pedro_rules_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_tempel))
	{
		return TRUE;
	};
};

func void dia_pedro_rules_info()
{
	AI_Output(other,self,"DIA_Pedro_Rules_15_00");	//��� ��� �� �������, �� ������� �� ������?
	AI_Output(self,other,"DIA_Pedro_Rules_09_01");	//����� - ��� ������ � ������. ������� �� ������� �� ���� � �� ��������� ������������.
	AI_Output(self,other,"DIA_Pedro_Rules_09_02");	//���� �� ��������� ������ ����� �� ����� ������ ��� �������� ���� �������������, ���� �������� ��������� �� ��� �����.
	AI_Output(self,other,"DIA_Pedro_Rules_09_03");	//����� ����� ��� ��������� � ����.
	AI_Output(self,other,"DIA_Pedro_Rules_09_04");	//������ �����������, �� ������ ��������� ���������� � �������� �� ���� ����� ����.
	AI_Output(other,self,"DIA_Pedro_Rules_15_05");	//�������.
	AI_Output(self,other,"DIA_Pedro_Rules_09_06");	//����� ����, ��������� ������ ��������� ������ � ��������� �� ����� ������.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_Rules_09_07");	//���� �� ����� ��������� ���� ��������, � � ���� ���� ���������� ������, �� ������ ������� ���� � ��������� � �������� ����������.
	};
};


instance DIA_PEDRO_AUFNAHME(C_INFO)
{
	npc = nov_600_pedro;
	condition = dia_pedro_aufnahme_condition;
	information = dia_pedro_aufnahme_info;
	permanent = TRUE;
	description = "� ���� ����� �����������.";
};


var int dia_pedro_aufnahme_noperm;

func int dia_pedro_aufnahme_condition()
{
	if(Npc_KnowsInfo(hero,dia_pedro_rules) && (DIA_PEDRO_AUFNAHME_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_pedro_aufnahme_info()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_15_00");	//� ���� ����� �����������.
	Npc_PerceiveAll(self);
	if(hero.guild != GIL_NONE)
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_01");	//�� ��� ������ ���� ����. ���� ����� ������ ��� ����.
		DIA_PEDRO_AUFNAHME_NOPERM = TRUE;
	}
	else if((hero.guild == GIL_NONE) && (Npc_HasItems(hero,itmi_gold) >= SUMME_KLOSTER) && Wld_DetectNpc(self,follow_sheep,NOFUNC,-1) && (Npc_GetDistToNpc(self,other) < 1000))
	{
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_03");	//� ����, �� ������ ����������� ����������. ���� �� ������������� ������� �����, �� ������ ����� �����������.
		AI_Output(self,hero,"DIA_Pedro_AUFNAHME_09_04");	//������, ���� �� ������� ��� �������, ���� ����� �� ����� - ������ �������, ���� �� ��� ����!
		Info_ClearChoices(dia_pedro_aufnahme);
		Info_AddChoice(dia_pedro_aufnahme,"� ��� ������� ������� ��� ����.",dia_pedro_aufnahme_no);
		Info_AddChoice(dia_pedro_aufnahme,"��, � ���� ��������� ���� ����� �������� ������.",dia_pedro_aufnahme_yes);
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_AUFNAHME_09_02");	//�� �� ������ ����������� ����������.
	};
};

func void dia_pedro_aufnahme_yes()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_00");	//��, � ���� ��������� ���� ����� �������� ������.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_01");	//����� ����� ����������, ����. � ��� ���� ���� ���� �� ������������ �����.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_02");	//� ���� ������ ������������� �������� ����� �������, �� ������ ��� ������� ��� ������ � ����� ������.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_03");	//������ �� ���������. ���� ��� ���� � ���� ����, ��� ������ �� ���� ������ ��������.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_04");	//����� �� ������� � ���������, ������� � �������. � ����� ������� �� ����� �������� �� ����.
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_YES_15_05");	//��� ����������� ������ �������?
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_YES_09_06");	//���� ��� ���. �������� � �������� ��������. �� ����������� ���� � ������� �� ����� ������.
	CreateInvItems(self,itke_innos_mis,1);
	b_giveinvitems(self,hero,itke_innos_mis,1);
	CreateInvItems(other,itar_nov_l,1);
	AI_EquipArmor(other,itar_nov_l);
	other.guild = GIL_NOV;
	Npc_SetTrueGuild(other,GIL_NOV);
	DIA_PEDRO_AUFNAHME_NOPERM = TRUE;
	NOV_AUFNAHME = LOG_SUCCESS;
	SLD_AUFNAHME = LOG_OBSOLETE;
	MIL_AUFNAHME = LOG_OBSOLETE;
	b_giveplayerxp(XP_AUFNAHMENOVIZE);
	Wld_AssignRoomToGuild("Kloster02",GIL_KDF);
	AI_StopProcessInfos(self);
};

func void dia_pedro_aufnahme_no()
{
	AI_Output(other,self,"DIA_Pedro_AUFNAHME_NO_15_00");	//� ��� ������� ������� ��� ����.
	AI_Output(self,other,"DIA_Pedro_AUFNAHME_NO_09_01");	//�����������, ����� ������ �����.
	Info_ClearChoices(dia_pedro_aufnahme);
};


instance DIA_PEDRO_MONASTERY(C_INFO)
{
	npc = nov_600_pedro;
	nr = 90;
	condition = dia_pedro_monastery_condition;
	information = dia_pedro_monastery_info;
	permanent = TRUE;
	description = "�������� ��� � ����� � ���������.";
};


func int dia_pedro_monastery_condition()
{
	return TRUE;
};

func void dia_pedro_monastery_info()
{
	AI_Output(other,self,"DIA_Pedro_Monastery_15_00");	//�������� ��� � ����� � ���������.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_01");	//�� ����� � ���������, ����� ������� ������. ��, ����������, ��������� ��������� ������ � ������� �������, ����� � ��� ���������� ����� �����������.
	AI_Output(self,other,"DIA_Pedro_Monastery_09_02");	//���� ������������� �� ����, � ����� ������� ��������� �����.
};


instance DIA_PEDRO_PICKPOCKET(C_INFO)
{
	npc = nov_600_pedro;
	nr = 900;
	condition = dia_pedro_pickpocket_condition;
	information = dia_pedro_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_pedro_pickpocket_condition()
{
	return c_beklauen(45,60);
};

func void dia_pedro_pickpocket_info()
{
	Info_ClearChoices(dia_pedro_pickpocket);
	Info_AddChoice(dia_pedro_pickpocket,DIALOG_BACK,dia_pedro_pickpocket_back);
	Info_AddChoice(dia_pedro_pickpocket,DIALOG_PICKPOCKET,dia_pedro_pickpocket_doit);
};

func void dia_pedro_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pedro_pickpocket);
};

func void dia_pedro_pickpocket_back()
{
	Info_ClearChoices(dia_pedro_pickpocket);
};

