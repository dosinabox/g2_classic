
instance DIA_IGARANZ_KAP1_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap1_exit_condition;
	information = dia_igaraz_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_HELLO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_hello_condition;
	information = dia_igaraz_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_igaraz_hello_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_FIRE_CONTEST == FALSE))
	{
		return TRUE;
	};
};

func void dia_igaraz_hello_info()
{
	if(other.guild == GIL_NOV)
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_00");	//��� � ���� ������� ��� ����, ����?
	}
	else
	{
		AI_Output(self,other,"DIA_Igaranz_Hello_13_01");	//��� � ���� ������� ��� ����?
	};
};


instance DIA_IGARAZ_WURST(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_wurst_condition;
	information = dia_igaraz_wurst_info;
	permanent = FALSE;
	description = "� ��������� �������������� �������.";
};


func int dia_igaraz_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_igaraz_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_Igaraz_Wurst_15_00");	//� ������ �������.
	AI_Output(self,other,"DIA_Igaraz_Wurst_13_01");	//�� ��������� �� �������, ��? ������, ����� ����� ���� ��� �������.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
};


instance DIA_IGARANZ_NOTWORK(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 3;
	condition = dia_igaraz_notwork_condition;
	information = dia_igaraz_notwork_info;
	permanent = FALSE;
	description = "������ �� �� ���������?";
};


func int dia_igaraz_notwork_condition()
{
	if((Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_notwork_info()
{
	AI_Output(other,self,"DIA_Igaranz_NotWork_15_00");	//������ �� �� ���������?
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_01");	//��� ��������� ������� ������ ������. � �������� ��� ��������.
	AI_Output(self,other,"DIA_Igaranz_NotWork_13_02");	//������� �� ������� ���� - � ����� � ������ ��������� ������ � ����� � ���� ����.
};


instance DIA_IGARANZ_CHOOSEN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_choosen_condition;
	information = dia_igaraz_choosen_info;
	permanent = TRUE;
	description = "��� ����� ���������?";
};


func int dia_igaraz_choosen_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_notwork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_choosen_info()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_15_00");	//��� ����� ���������?
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_01");	//��� ����������, ������� ����� ��������� ������ ��������� ������.
	AI_Output(self,other,"DIA_Igaranz_Choosen_13_02");	//���, ��� �������� ���, ����������� � ���� ����� ����.
	Info_ClearChoices(dia_igaranz_choosen);
	Info_AddChoice(dia_igaranz_choosen,DIALOG_BACK,dia_igaranz_choosen_back);
	Info_AddChoice(dia_igaranz_choosen,"��� ����� ��������� ������?",dia_igaranz_choosen_testofmagic);
	Info_AddChoice(dia_igaranz_choosen,"��� � ���� ����� ���������?",dia_igaranz_choosen_howchoosen);
};

func void dia_igaranz_choosen_back()
{
	Info_ClearChoices(dia_igaranz_choosen);
};

func void dia_igaranz_choosen_testofmagic()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_TestOfMagic_15_00");	//��� ����� ��������� ������?
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_01");	//��� ���������, �������� ������ ����� ���������� ���� ��������� �����������.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_02");	//��� �������, ��� ���������� �������� ����������� ���� � ����������������� ����������.
	AI_Output(self,other,"DIA_Igaranz_Choosen_TestOfMagic_13_03");	//��� ��������� ���������� ��������� � ��� ������� - �� ������ ���� �� ��� ����� ������� ��������� ���.
};

func void dia_igaranz_choosen_howchoosen()
{
	AI_Output(other,self,"DIA_Igaranz_Choosen_HowChoosen_15_00");	//��� � ���� ����� ���������?
	AI_Output(self,other,"DIA_Igaranz_Choosen_HowChoosen_13_01");	//�� �� ������ ������ �� ���. ����� ��������� �������� ����� �����������, � ������ ����� ��������� ��� ����.
};


instance DIA_IGARANZ_STUDYINNOS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_studyinnos_condition;
	information = dia_igaraz_studyinnos_info;
	permanent = FALSE;
	description = "��� � ���� ������ ������� �������?";
};


func int dia_igaraz_studyinnos_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_notwork) && (Npc_GetDistToWP(self,"NW_MONASTERY_GRASS_01") <= 500) && (PARLAN_ERLAUBNIS == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_studyinnos_info()
{
	AI_Output(other,self,"DIA_Igaranz_StudyInnos_15_00");	//��� � ���� ������ ������� �������?
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_01");	//�� ������ �������� ������ � ����������.
	AI_Output(self,other,"DIA_Igaranz_StudyInnos_13_02");	//������ ������ ������ ���� ���� ����, ������ ����� �� ��������� ��� ��� �������.
};


instance DIA_IGARAZ_IMTHEMAN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_imtheman_condition;
	information = dia_igaraz_imtheman_info;
	important = TRUE;
};


func int dia_igaraz_imtheman_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_imtheman_info()
{
	AI_Output(self,other,"DIA_Igaraz_IMTHEMAN_13_00");	//(�����) ��� ����������. ����� ������ ���� � ����� ������� � ��������� ������.
};


instance DIA_IGARAZ_METOO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 19;
	condition = dia_igaraz_metoo_condition;
	information = dia_igaraz_metoo_info;
	permanent = FALSE;
	description = "� ���� - � ���������� ����������� ��������� �����.";
};


var int dia_igaraz_metoo_noperm;

func int dia_igaraz_metoo_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_igaraz_metoo_info()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_15_00");	//� ���� - � ���������� ����������� ��������� �����.
	AI_Output(self,other,"DIA_Igaraz_METOO_13_01");	//��� �� ����������? �� ���� �������� ������, ���� �����������.
	AI_Output(other,self,"DIA_Igaraz_METOO_15_02");	//��� ��� ������� ����� �������� �����, �, ��������, ������� � ��� ����...
	AI_Output(self,other,"DIA_Igaraz_METOO_13_03");	//����� ������������ ���� - � � ������ ��� ���������!
	Info_ClearChoices(dia_igaraz_metoo);
	Info_AddChoice(dia_igaraz_metoo,DIALOG_BACK,dia_igaraz_metoo_back);
	Info_AddChoice(dia_igaraz_metoo,"�����, ��� ����� ����������� ������...",dia_igaraz_metoo_help);
	Info_AddChoice(dia_igaraz_metoo,"� ���, ��� ������ �� �����?",dia_igaraz_metoo_tell);
	Info_AddChoice(dia_igaraz_metoo,"�� �� ����� ����� ��� �����?",dia_igaraz_metoo_agon);
};

func void dia_igaraz_metoo_back()
{
	Info_ClearChoices(dia_igaraz_metoo);
};

func void dia_igaraz_metoo_tell()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_TELL_15_00");	//� ���, ��� ������ �� �����?
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_01");	//��� ��� � ���� ��� ����� ������� ������, �, �������, ����� ����:
	AI_Output(self,other,"DIA_Igaraz_METOO_TELL_13_02");	//���� �� ������� ������ ����� ���� - �� ��� ������ �� �������.
};

func void dia_igaraz_metoo_help()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_HELP_15_00");	//�����, ��� ����� ����������� ������...
	AI_Output(self,other,"DIA_Igaraz_METOO_HELP_13_01");	//������ �� ����. � ������� ��� ������� ����. �� ��� ������ ������ ������.
};

func void dia_igaraz_metoo_agon()
{
	AI_Output(other,self,"DIA_Igaraz_METOO_AGON_15_00");	//�� �� ����� ����� ��� �����?
	AI_Output(self,other,"DIA_Igaraz_METOO_AGON_13_01");	//�� ����������� � �������. � ����� � ������, � ��� ���� ����� ������ - �� ����, � �� ����.
};


instance DIA_IGARAZ_ADD(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 23;
	condition = dia_igaraz_add_condition;
	information = dia_igaraz_add_info;
	permanent = FALSE;
	description = "�� ������ ���-������ � '����� �����'?";
};


func int dia_igaraz_add_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_05") <= 3500) && (MIS_GOLEM == LOG_RUNNING) && (Npc_IsDead(magic_golem) == FALSE) && (Npc_KnowsInfo(other,dia_igaraz_stein) == FALSE) && Npc_KnowsInfo(other,dia_igaraz_metoo))
	{
		return TRUE;
	};
};

func void dia_igaraz_add_info()
{
	AI_Output(other,self,"DIA_Igaraz_Add_15_00");	//�� ������ ���-������ � '����� �����'?
	AI_Output(self,other,"DIA_Igaraz_Add_13_01");	//(��������) ���! ���� ��� ������� ���������?
	AI_Output(other,self,"DIA_Igaraz_Add_15_02");	//��, � ���?
	AI_Output(self,other,"DIA_Igaraz_Add_13_03");	//�, �������, �����������, ��� �� ���� � ����...
	AI_Output(self,other,"DIA_Igaraz_Add_13_04");	//�� ������ �� ������, ��� �������� ��� ���������...
	AI_Output(other,self,"DIA_Igaraz_Add_15_05");	//��� ��� ����� ��� ����� �����?
	AI_Output(self,other,"DIA_Igaraz_Add_13_06");	//������ ��� �� ���� ��������. ������ ��������� ����� �� ������� ����.
	AI_Output(self,other,"DIA_Igaraz_Add_13_07");	//��������� ���� �� �������� � ����. ��� ������ ���� ���-�� ���.
	AI_Output(self,other,"DIA_Igaraz_Add_13_08");	//���� �� ������� �� ����� - ������, �� ����� ������� ������.
	AI_Output(self,other,"DIA_Igaraz_Add_13_09");	//(�������) ���� ���� ������ ������� ���� ������...
	AI_Output(self,other,"DIA_Igaraz_Add_13_10");	//��� ��� ��� � ���� ������� ����... (� ���������) ��� ���� ��� �� ������ ���� ���� ���������!
};


instance DIA_IGARAZ_PRUEFUNG(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 22;
	condition = dia_igaraz_pruefung_condition;
	information = dia_igaraz_pruefung_info;
	description = "������� ���-������ �����?";
};


func int dia_igaraz_pruefung_condition()
{
	if((other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) < 1) && Npc_KnowsInfo(other,dia_igaraz_metoo))
	{
		return TRUE;
	};
};

func void dia_igaraz_pruefung_info()
{
	AI_Output(other,self,"DIA_Igaraz_Pruefung_15_00");	//������� ���-������ �����?
	AI_Output(self,other,"DIA_Igaraz_Pruefung_13_01");	//���� ���, �� � ��������� ������.
	AI_StopProcessInfos(self);
	if(IGARAZ_WAIT == FALSE)
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"CONTESTWAIT");
		IGARAZ_WAIT = TRUE;
	};
};


instance DIA_IGARAZ_STEIN(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 1;
	condition = dia_igaraz_stein_condition;
	information = dia_igaraz_stein_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_igaraz_stein_condition()
{
	if((Npc_GetDistToWP(self,"NW_TAVERNE_TROLLAREA_66") <= 3500) && (other.guild == GIL_NOV) && (Npc_HasItems(other,itmi_runeblank) >= 1))
	{
		return TRUE;
	};
};

func void dia_igaraz_stein_info()
{
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_00");	//��, �������. ��� ����� ����������...
	AI_Output(other,self,"DIA_Igaraz_Seufz_15_01");	//� ��� �� �����...
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_02");	//� ���� ����� ��������� ����� ���. ����� ������������ ���� � � ������ ������ ���.
	if(Npc_KnowsInfo(other,dia_ulf_abrechnung))
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_03");	//���-�� � ��� ��� ������.
	}
	else
	{
		AI_Output(other,self,"DIA_Igaraz_Seufz_15_04");	//�� �� ������, ��� ������� ���.
	};
	AI_Output(self,other,"DIA_Igaraz_Seufz_13_05");	//������ �������. ��� ����� ��, ��� �� �����. � ���� ������ ����� �������!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_KILL,0);
};


instance DIA_IGARANZ_KAP2_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap2_exit_condition;
	information = dia_igaraz_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_KAP3_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap3_exit_condition;
	information = dia_igaraz_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_TALKABOUTBABO(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_talkaboutbabo_condition;
	information = dia_igaraz_talkaboutbabo_info;
	permanent = FALSE;
	description = "��� ����� ���������� � ����.";
};


func int dia_igaraz_talkaboutbabo_condition()
{
	if(MIS_BABOSDOCS == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_igaraz_talkaboutbabo_info()
{
	AI_Output(other,self,"DIA_Igaranz_TalkAboutBabo_15_00");	//��� ����� ���������� � ����.
	AI_Output(self,other,"DIA_Igaranz_TalkAboutBabo_13_01");	//(���������) ��, � ��� ����?
};


instance DIA_IGARANZ_BABOSBELONGINGS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosbelongings_condition;
	information = dia_igaraz_babosbelongings_info;
	permanent = FALSE;
	description = "� ���� ���� ���-��� ������������� ����.";
};


func int dia_igaraz_babosbelongings_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_talkaboutbabo))
	{
		return TRUE;
	};
};

func void dia_igaraz_babosbelongings_info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_00");	//� ���� ���� ���-��� ������������� ����.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_01");	//� ��� �� ��� ����� ����?
	AI_Output(other,self,"DIA_Igaranz_BabosBelongings_15_02");	//��������� ������� ������. ���� ����� �� �������� �� �����.
	AI_Output(self,other,"DIA_Igaranz_BabosBelongings_13_03");	//(����������) ��? ���� ��! ���� �����������. �������� ��������, � ��������� �� �������� �� � ����. ������, ��� ������ ������������ ���������.
};


instance DIA_IGARANZ_WHEREDOCS(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_wheredocs_condition;
	information = dia_igaraz_wheredocs_info;
	permanent = FALSE;
	description = "��� ��� ������?";
};


func int dia_igaraz_wheredocs_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_wheredocs_info()
{
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_00");	//��� ��� ������?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_01");	//(������) ��, ������� ��, � �� ����� �� ��� ����. �����, ����� �� ���� ������.
	AI_Output(other,self,"DIA_Igaranz_WhereDocs_15_02");	//��� ���?
	AI_Output(self,other,"DIA_Igaranz_WhereDocs_13_03");	//� ����� �� � �������. � ���� �� ���� ���� ������� �� ��������.
};


instance DIA_IGARANZ_BABOSJOB(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_babosjob_condition;
	information = dia_igaraz_babosjob_info;
	permanent = FALSE;
	description = "��� ���� ������ ������ ��� ����?";
};


func int dia_igaraz_babosjob_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_babosjob_info()
{
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_00");	//��� ���� ������ ������ ��� ����?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_01");	//���� �� � ����, ��� ���� ������� ������� � ����� ��-�� ���������� ������ �������� �����, � �� ����� �����������, ����� ���-������ ������ ����� ��� ����� � ������������ ����.
	AI_Output(other,self,"DIA_Igaranz_BabosJob_15_02");	//�� ������ ���������� �������� �����?
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_03");	//�������. ��� ��� ��� ������ �� ��������� ��-�� �������, ���� �� ������ � ������ ������� �����.
	AI_Output(self,other,"DIA_Igaranz_BabosJob_13_04");	//�� ����� �� ������ ���������� �� ����. �� ���� ������������ ������������.
};


instance DIA_IGARANZ_PRICE(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_price_condition;
	information = dia_igaraz_price_info;
	permanent = FALSE;
	description = "������� �� ������ �� ��� ������?";
};


func int dia_igaraz_price_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_babosbelongings))
	{
		return TRUE;
	};
};

func void dia_igaraz_price_info()
{
	AI_Output(other,self,"DIA_Igaranz_Price_15_00");	//������� �� ������ �� ��� ������?
	AI_Output(self,other,"DIA_Igaranz_Price_13_01");	//(�������) ��, ������-�� ������, ��� ����������� ��������. ����� ����� ����� ��������� ���-������ ��������.
	AI_Output(self,other,"DIA_Igaranz_Price_13_02");	//�� � ���� ��� ������� ��������� ����� ������� ��-�� ���������� �������.
	AI_Output(self,other,"DIA_Igaranz_Price_13_03");	//300 �����, � �� ������ ������ � ����� �������� ���, ��� ��������.
};


instance DIA_IGARANZ_BUYIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 31;
	condition = dia_igaraz_buyit_condition;
	information = dia_igaraz_buyit_info;
	permanent = FALSE;
	description = "� ���� ������ ��� ������.";
};


func int dia_igaraz_buyit_condition()
{
	if(Npc_KnowsInfo(other,dia_igaranz_price) && (Npc_HasItems(other,itmi_gold) >= 300))
	{
		return TRUE;
	};
};

func void dia_igaraz_buyit_info()
{
	AI_Output(other,self,"DIA_Igaranz_BuyIt_15_00");	//� ���� ������ ��� ������.
	AI_Output(self,other,"DIA_Igaranz_BuyIt_13_01");	//��������, � ������ �� ���� ����������. � ��� ���� ���� �� ����� �������. � ��� ��� ����� ������ ������ ���.
	b_giveinvitems(other,self,itmi_gold,300);
	b_giveinvitems(self,other,itke_igarazchest_mis,1);
};


instance DIA_IGARAZ_PICKPOCKET(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 900;
	condition = dia_igaraz_pickpocket_condition;
	information = dia_igaraz_pickpocket_info;
	permanent = TRUE;
	description = "(������� ���� ���� ����� �����)";
};


func int dia_igaraz_pickpocket_condition()
{
	if((MIS_BABOSDOCS == LOG_RUNNING) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_igarazchest_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (40 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_igaraz_pickpocket_info()
{
	Info_ClearChoices(dia_igaraz_pickpocket);
	Info_AddChoice(dia_igaraz_pickpocket,DIALOG_BACK,dia_igaraz_pickpocket_back);
	Info_AddChoice(dia_igaraz_pickpocket,DIALOG_PICKPOCKET,dia_igaraz_pickpocket_doit);
};

func void dia_igaraz_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 40)
	{
		b_giveinvitems(self,other,itke_igarazchest_mis,1);
		b_givethiefxp();
		Info_ClearChoices(dia_igaraz_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_igaraz_pickpocket_back()
{
	Info_ClearChoices(dia_igaraz_pickpocket);
};


instance DIA_IGARANZ_KAP4_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap4_exit_condition;
	information = dia_igaraz_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_KAP5_EXIT(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 999;
	condition = dia_igaraz_kap5_exit_condition;
	information = dia_igaraz_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_igaraz_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_igaraz_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_IGARANZ_PERM(C_INFO)
{
	npc = nov_601_igaraz;
	nr = 2;
	condition = dia_igaraz_perm_condition;
	information = dia_igaraz_perm_info;
	permanent = FALSE;
	description = "� ���� ���� ���-������ ���������� ��� ����?";
};


func int dia_igaraz_perm_condition()
{
	if((KAPITEL >= 3) && (other.guild != GIL_KDF) && (MIS_BABOSDOCS != LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_igaraz_perm_info()
{
	AI_Output(other,self,"DIA_Igaranz_Perm_15_00");	//� ���� ���� ���-������ ���������� ��� ����?
	AI_Output(self,other,"DIA_Igaranz_Perm_13_01");	//���... ���.
	AI_StopProcessInfos(self);
};

