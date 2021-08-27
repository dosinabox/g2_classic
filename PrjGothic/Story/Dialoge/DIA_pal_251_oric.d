
instance DIA_ORIC_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_exit_condition;
	information = dia_oric_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_oric_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_HALLO(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_hallo_condition;
	information = dia_oric_hallo_info;
	permanent = FALSE;
	description = "������ ���� �����������?";
};


func int dia_oric_hallo_condition()
{
	return TRUE;
};

func void dia_oric_hallo_info()
{
	AI_Output(other,self,"DIA_Oric_HALLO_15_00");	//������ ���� �����������?
	AI_Output(self,other,"DIA_Oric_HALLO_11_01");	//� ������-������� ������, � � ��������� ����� ���������� ��������������� ������������ �������.
	AI_Output(self,other,"DIA_Oric_HALLO_11_02");	//�� ��������� ��������, ���������� �����, � �����. ��� ��������� ���� ���� ���� �� ���� ���.
	AI_Output(self,other,"DIA_Oric_HALLO_11_03");	//��� ��� ����, ����� ��� ���������� ����������� �������. � �� �������� �����. ������� ������� - �� �������� �����.
};


instance DIA_ORIC_BRUDER(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_bruder_condition;
	information = dia_oric_bruder_info;
	permanent = FALSE;
	description = "� ���� ���� �������� ��� ����.";
};


func int dia_oric_bruder_condition()
{
	if(Npc_KnowsInfo(other,dia_jergan_burg) && Npc_KnowsInfo(other,dia_oric_hallo))
	{
		return TRUE;
	};
};

func void dia_oric_bruder_info()
{
	AI_Output(other,self,"DIA_Oric_Bruder_15_00");	//� ���� ���� �������� ��� ����.
	AI_Output(self,other,"DIA_Oric_Bruder_11_01");	//��� �� ��������?
	AI_Output(other,self,"DIA_Oric_Bruder_15_02");	//���� ���� �����. �� ����� � �������.
	AI_Output(self,other,"DIA_Oric_Bruder_11_03");	//(��������)... ��� ����...
	AI_Output(self,other,"DIA_Oric_Bruder_11_04");	//����� ���������� ���� ������� ����������. �� �� ����� ��� ��� �����...
	AI_Output(self,other,"DIA_Oric_Bruder_11_05");	//��� ������� - ������, ���������� ��� ������. � ���� ������ ����� ���� � ��������.
	ORICBRUDER = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORIC_SCOUTMINE(C_INFO)
{
	npc = pal_251_oric;
	nr = 1;
	condition = dia_oric_scoutmine_condition;
	information = dia_oric_scoutmine_info;
	permanent = FALSE;
	description = "� ����������� � ������.";
};


func int dia_oric_scoutmine_condition()
{
	if((MIS_SCOUTMINE == LOG_RUNNING) && (KAPITEL < 3) && Npc_KnowsInfo(other,dia_oric_hallo) && ((FAJETH_ORE == FALSE) || (MARCOS_ORE == FALSE) || (SILVESTRO_ORE == FALSE)))
	{
		return TRUE;
	};
};

func void dia_oric_scoutmine_info()
{
	AI_Output(other,self,"DIA_Oric_ScoutMine_15_00");	//� ����������� � ������.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_01");	//���� ���������. ��� �������� ������. ������ �����, ����� ���������. ��� ����������� ��� ��� ������.
	AI_Output(self,other,"DIA_Oric_ScoutMine_11_02");	//���� ���� ����� ������ ����������, �������� � ����������.
};


instance DIA_ORIC_PERM(C_INFO)
{
	npc = pal_251_oric;
	nr = 99;
	condition = dia_oric_perm_condition;
	information = dia_oric_perm_info;
	permanent = TRUE;
	description = "��� ��������?";
};


func int dia_oric_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_oric_hallo) && (KAPITEL <= 3))
	{
		return TRUE;
	};
};

func void dia_oric_perm_info()
{
	AI_Output(other,self,"DIA_Oric_Perm_15_00");	//��� ����������?
	if(MIS_SCOUTMINE == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_01");	//�� ������ ����� ���������� � ��������, ������� � ��� ����. � ��� ����� �����, ��� � ����� �� ������ �������� ��� ������.
	}
	else if(MIS_SCOUTMINE == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_02");	//�������� ���������� �� �������. �� �� �� ��������. ����� ������ � ����. �� ������� ��� �� ���� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_Perm_11_03");	//���� ��������� ����� ������� � ��� �������.
		AI_Output(self,other,"DIA_Oric_Perm_11_04");	//�� ����� ���. ���, �������� � �������� - �� ��� �������� ����.
	};
};


instance DIA_ORIC_KAP3_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap3_exit_condition;
	information = dia_oric_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_oric_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_KAP4_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap4_exit_condition;
	information = dia_oric_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_oric_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_IAMBACK(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_iamback_condition;
	information = dia_oric_iamback_info;
	description = "� ��� ��������.";
};


func int dia_oric_iamback_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_hallo))
	{
		return TRUE;
	};
};

func void dia_oric_iamback_info()
{
	AI_Output(other,self,"DIA_Oric_IAmBack_15_00");	//� ��� ��������.
	AI_Output(self,other,"DIA_Oric_IAmBack_11_01");	//� ��� �� ��������, ��� �� ��� �����-������ ������ ���� ����� ����, ��� ���������, ����� �� ��� ����� ��������� ���� �����.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_02");	//� ����������� ���� �� ����� ������ ������.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_IAmBack_11_03");	//� ����, �� ���� �����. ��� ��������.
	};
	AI_Output(self,other,"DIA_Oric_IAmBack_11_04");	//��������, ���� ��������� - ������ ����.
};


instance DIA_ORIC_CANHELP(C_INFO)
{
	npc = pal_251_oric;
	nr = 4;
	condition = dia_oric_canhelp_condition;
	information = dia_oric_canhelp_info;
	description = "���� � ���-������ ������?";
};


func int dia_oric_canhelp_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback) && (MIS_KILLHOSHPAK == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_canhelp_info()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_15_00");	//���� � ���-������ ������?
	AI_Output(self,other,"DIA_Oric_CanHelp_11_01");	//� ��������� ������, ������, �� ������� ���, ��� ���� ��������.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_02");	//�������, ���� ���-���. ���-��� ����� ������, ��� �� ��� �� ������� ��� ��� �� ��������� ���� ����.
	AI_Output(self,other,"DIA_Oric_CanHelp_11_03");	//�� ��������� �������� ���� ������.
	Info_ClearChoices(dia_oric_canhelp);
	Info_AddChoice(dia_oric_canhelp,"� �����, ���� ����� �������� ����-������ ���.",dia_oric_canhelp_notyourman);
	Info_AddChoice(dia_oric_canhelp,"��� �� ������ ������� ����?",dia_oric_canhelp_whatyoumean);
};

func void dia_oric_canhelp_notyourman()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_NotYourMan_15_00");	//� �����, ���� ����� �������� ����-������ ���.
	AI_Output(self,other,"DIA_Oric_CanHelp_NotYourMan_11_01");	//� �� ���� �������� �� ������ �������� - �� ���� ������������ �������.
};

func void dia_oric_canhelp_whatyoumean()
{
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_00");	//��� �� ������ ������� ����?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_01");	//�� ����� ������ �� �� �������������. ��� ����� ���-���.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_02");	//�� ���� �� ����� ����������� ������� �����.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_03");	//� ������ � ���� ��� ����?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_04");	//���� ���.
	if(!Npc_IsDead(hosh_pak))
	{
		AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_05");	//�� ������!?
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_06");	//�� ������������, ���� �� ����� �������� ��� ����� ����. ��� ��������� ������ ����� �����.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_07");	//��� ������� ������� ���� �� ����, ������. �� �� ��� ������ ����� ��������� ��� ����� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_08");	//�� ���� ������ ������ ���, ����� ���? ��, �����...
	};
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_09");	//������� ���-���� ��������� �� ������� ������, �� ����� � ��� ������.
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_10");	//�� ���� ����� �� ���� ����.
	Info_ClearChoices(dia_oric_canhelp);
	ORIKTOLDMISSIONCHAPTER4 = TRUE;
};


instance DIA_ORIC_NEEDSTUFF(C_INFO)
{
	npc = pal_251_oric;
	nr = 6;
	condition = dia_oric_needstuff_condition;
	information = dia_oric_needstuff_info;
	description = "��� ����� ����������.";
};


func int dia_oric_needstuff_condition()
{
	if(ORIKTOLDMISSIONCHAPTER4 == TRUE)
	{
		return TRUE;
	};
};

func void dia_oric_needstuff_info()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_15_00");	//��� ����� ����������.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_01");	//� ��� ���� ��� ��������, ��� �� ����� �� ���������� � �����.
	AI_Output(self,other,"DIA_Oric_NeedStuff_11_02");	//��, � ���� ���������� ���� ��� ���.
	Info_ClearChoices(dia_oric_needstuff);
	Info_AddChoice(dia_oric_needstuff,"(������� ������� ��������)",dia_oric_needstuff_dexterity);
	Info_AddChoice(dia_oric_needstuff,"(������� ������� ����)",dia_oric_needstuff_strength);
	Info_AddChoice(dia_oric_needstuff,"(������� 3 �������� ����)",dia_oric_needstuff_mana);
	Info_AddChoice(dia_oric_needstuff,"(������� 3 �������� ��������)",dia_oric_needstuff_health);
};

func void dia_oric_needstuff_health()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Health_15_00");	//� ������ ��� �������� �����.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Health_11_01");	//������� �����. �������, ��� ������� ����.
	CreateInvItems(self,itpo_health_03,3);
	b_giveinvitems(self,other,itpo_health_03,3);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_mana()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Mana_15_00");	//� ������ ��� ����� ����.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Mana_11_01");	//�������, ��� ������� ����. �� ������ ���� �����.
	CreateInvItems(self,itpo_mana_03,3);
	b_giveinvitems(self,other,itpo_mana_03,3);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_strength()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Strength_15_00");	//� ������ ������� ����.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Strength_11_01");	//���, �� ��������� ���������� ����. � ����� ���� �����.
	CreateInvItems(self,itpo_perm_str,1);
	b_giveinvitems(self,other,itpo_perm_str,1);
	Info_ClearChoices(dia_oric_needstuff);
};

func void dia_oric_needstuff_dexterity()
{
	AI_Output(other,self,"DIA_Oric_NeedStuff_Dexterity_15_00");	//� ������ ������� ��������.
	AI_Output(self,other,"DIA_Oric_NeedStuff_Dexterity_11_01");	//����� ������ ���� ������ ����� ����� � ����. ���, �����.
	CreateInvItems(self,itpo_perm_dex,1);
	b_giveinvitems(self,other,itpo_perm_dex,1);
	Info_ClearChoices(dia_oric_needstuff);
};


instance DIA_ORIC_NOMURDER(C_INFO)
{
	npc = pal_251_oric;
	nr = 7;
	condition = dia_oric_nomurder_condition;
	information = dia_oric_nomurder_info;
	description = "� �� ���� ������� ���-���� ����� ������ �������.";
};


func int dia_oric_nomurder_condition()
{
	if((ORIKTOLDMISSIONCHAPTER4 == TRUE) && (MIS_KILLHOSHPAK == FALSE) && !Npc_IsDead(hosh_pak))
	{
		return TRUE;
	};
};

func void dia_oric_nomurder_info()
{
	AI_Output(other,self,"DIA_Oric_NoMurder_15_00");	//� �� ���� ������� ���-���� ����� ������ �������.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_01");	//�� ���� �� ������������� ����, ��������� ������ ���� ���������?
	AI_Output(self,other,"DIA_Oric_NoMurder_11_02");	//��� �������� ������������� ���� �����. ���� ������ ��� �� ������.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_03");	//���� �� �� ������ ��������� ��� ���� �� �������, ���� ��������� � ����� ��� ���� �����������.
	AI_Output(self,other,"DIA_Oric_NoMurder_11_04");	//���, ���� ���� �� �����, ������ ������.
};


instance DIA_ORIC_WILLHELP(C_INFO)
{
	npc = pal_251_oric;
	nr = 5;
	condition = dia_oric_willhelp_condition;
	information = dia_oric_willhelp_info;
	permanent = FALSE;
	description = "������. � ���� ���-����.";
};


func int dia_oric_willhelp_condition()
{
	if((ORIKTOLDMISSIONCHAPTER4 == TRUE) && (MIS_KILLHOSHPAK == FALSE) && !Npc_IsDead(hosh_pak))
	{
		return TRUE;
	};
};

func void dia_oric_willhelp_info()
{
	AI_Output(other,self,"DIA_Oric_WillHelp_15_00");	//������. � ���� ���-����.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_01");	//� ��� ������� ���.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_02");	//������� ���-���� ��������� �� ��������� �����. ��, ������ ����, ��� ����� ��� ������.
	AI_Output(self,other,"DIA_Oric_WillHelp_11_03");	//���� ���� ����� ���������� �� ������, ������� � ����� �����. � ���� �������� ����.
	Log_CreateTopic(TOPIC_KILLHOSHPAK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLHOSHPAK,LOG_RUNNING);
	b_logentry(TOPIC_KILLHOSHPAK,"���� �����, ����� � ���� ������ ����� ���-����. ��� ������� ��������� �� ��������� ����� �������� �� ������ ����� �����.");
	MIS_KILLHOSHPAK = LOG_RUNNING;
};


instance DIA_ORIC_HOSHDEAD(C_INFO)
{
	npc = pal_251_oric;
	nr = 8;
	condition = dia_oric_hoshdead_condition;
	information = dia_oric_hoshdead_info;
	permanent = FALSE;
	description = "���-��� �����!";
};


func int dia_oric_hoshdead_condition()
{
	if(Npc_IsDead(hosh_pak))
	{
		if(MIS_KILLHOSHPAK == LOG_RUNNING)
		{
			return TRUE;
		};
		if(ORIKTOLDMISSIONCHAPTER4 == TRUE)
		{
			return TRUE;
		};
	};
};

func void dia_oric_hoshdead_info()
{
	AI_Output(other,self,"DIA_Oric_HoshDead_15_00");	//���-��� �����!
	AI_Output(self,other,"DIA_Oric_HoshDead_11_01");	//�������, ��� ����������� ������ ���� � ����� �����. ����� ����, � ��� ��� ��� ���� �����-�� �����.
	AI_Output(self,other,"DIA_Oric_HoshDead_11_02");	//� �����, ��� �������� ��� �������� ���������, �� ������� ����, �� ������.
	MIS_KILLHOSHPAK = LOG_SUCCESS;
	b_giveplayerxp(XP_KILLHOSH_PAK);
};


instance DIA_ORIC_ANYNEWS(C_INFO)
{
	npc = pal_251_oric;
	nr = 9;
	condition = dia_oric_anynews_condition;
	information = dia_oric_anynews_info;
	permanent = TRUE;
	description = "���� �������?";
};


func int dia_oric_anynews_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback))
	{
		return TRUE;
	};
};

func void dia_oric_anynews_info()
{
	AI_Output(other,self,"DIA_Oric_AnyNews_15_00");	//���� �������?
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_01");	//�� ������ � ����, ����� ����, ��� ���� ��������� � �����?
	}
	else if(Npc_KnowsInfo(other,dia_garond_alldragondead))
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_02");	//��. �� ��� �����. ���������� ���� �������� ����� - ��� �������� ����������� ������. � ��������!
	}
	else if(MIS_KILLHOSHPAK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_03");	//����, ������, ������ �� ����� ������� ���-����.
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_AnyNews_11_04");	//����� ���������� ��� ������ � ������. ��� ��� �� ��������.
	};
};


instance DIA_ORIC_DRAGONPLETTBERICHT(C_INFO)
{
	npc = pal_251_oric;
	nr = 3;
	condition = dia_oric_dragonplettbericht_condition;
	information = dia_oric_dragonplettbericht_info;
	permanent = TRUE;
	description = "��� ����� ���������� � ��������.";
};


func int dia_oric_dragonplettbericht_condition()
{
	if((KAPITEL >= 4) && Npc_KnowsInfo(other,dia_oric_iamback) && (MIS_ALLDRAGONSDEAD == FALSE))
	{
		return TRUE;
	};
};


var int oric_swampdragoninfo_onetime;
var int oric_rockdragoninfo_onetime;
var int oric_firedragoninfo_onetime;
var int oric_icedragoninfo_onetime;
var int oric_dragoncounter;
var int oric_firstquestion;

func void dia_oric_dragonplettbericht_info()
{
	AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_00");	//��� ����� ���������� � ��������.
	if(MIS_KILLEDDRAGONS == 1)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_01");	//� ��� ���� ������ �� ���. �� ������ ������� ���, ��� ����� ������ ������?
	}
	else if(MIS_KILLEDDRAGONS != 0)
	{
		AI_Output(other,self,"DIA_Oric_DragonPlettBericht_15_02");	//� ���� ���� �������, ��� � ���� ����� �� ���� ��������. �����, � ���-�� �������?
	};
	if(((ORIC_DRAGONCOUNTER < MIS_KILLEDDRAGONS) || (ORIC_FIRSTQUESTION == FALSE)) && ((ORIC_SWAMPDRAGONINFO_ONETIME == FALSE) || (ORIC_ROCKDRAGONINFO_ONETIME == FALSE) || (ORIC_FIREDRAGONINFO_ONETIME == FALSE) || (ORIC_ICEDRAGONINFO_ONETIME == FALSE)))
	{
		if((Npc_IsDead(swampdragon) == FALSE) && (ORIC_SWAMPDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_03");	//��������� ���� ����� � ������ �� ������ ����� ��������� ������� ������. ��� �������� �������������, ��� ���� �� �������?
			b_logentry(TOPIC_DRACHENJAGD,"���� ��� ��� ����� � �����������: �� ��������� ��������� ���� � ������ �� ����� ������������ ������� ������. �� ������� ��� ����� ��������������.");
			ORIC_SWAMPDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(rockdragon) == FALSE) && (ORIC_ROCKDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_04");	//�� ��� ��������� �������� � ������, ������ �� ��������.
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_05");	//���� ���������� �����������, ��� ��� �������� ������ ����������. ����� ����, ���� �� ��� ���������� ���.
			b_logentry(TOPIC_DRACHENJAGD,"���������� ��������� �������� �����, ��� �������� � ������ �� �������� �� ��� ������ ����������. ���� �����������, ��� ������ ��������� ���.");
			ORIC_ROCKDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(firedragon) == FALSE) && (ORIC_FIREDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_06");	//����� �������� ��������� ��������, ���� �� ���, �� ������, ������� � ����������� ������� �� ���. ���� ����� �������� ��� ���.
			b_logentry(TOPIC_DRACHENJAGD,"��-��������, ���������� �������, ����������� �� ����� � ������ ��������, ������ ���������� �� �������.");
			ORIC_FIREDRAGONINFO_ONETIME = TRUE;
		}
		else if((Npc_IsDead(icedragon) == FALSE) && (ORIC_ICEDRAGONINFO_ONETIME == FALSE))
		{
			AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_07");	//�� ������ ��������� �������� ������� ������. � �� ��������, ���� ���� �� �������� ���������� ���.
			b_logentry(TOPIC_DRACHENJAGD,"�������� ����������, ���������� �� �����, ����������� ����� �� ������ ����� ���� ������� �������.");
			ORIC_ICEDRAGONINFO_ONETIME = TRUE;
		};
		ORIC_DRAGONCOUNTER = MIS_KILLEDDRAGONS;
		ORIC_FIRSTQUESTION = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Oric_DragonPlettBericht_11_08");	//� ��������� ������ ��� ������ ������� ����.
	};
};


instance DIA_ORIC_KAP5_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap5_exit_condition;
	information = dia_oric_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_oric_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_KAP6_EXIT(C_INFO)
{
	npc = pal_251_oric;
	nr = 999;
	condition = dia_oric_kap6_exit_condition;
	information = dia_oric_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_oric_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_oric_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_PICKPOCKET(C_INFO)
{
	npc = pal_251_oric;
	nr = 900;
	condition = dia_oric_pickpocket_condition;
	information = dia_oric_pickpocket_info;
	permanent = TRUE;
	description = "(������� ��� ������ ����� ��������� ������)";
};


func int dia_oric_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (other.attribute[ATR_DEXTERITY] >= (85 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_oric_pickpocket_info()
{
	Info_ClearChoices(dia_oric_pickpocket);
	Info_AddChoice(dia_oric_pickpocket,DIALOG_BACK,dia_oric_pickpocket_back);
	Info_AddChoice(dia_oric_pickpocket,DIALOG_PICKPOCKET,dia_oric_pickpocket_doit);
};

func void dia_oric_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 85)
	{
		b_giveinvitems(self,other,itsc_palrepelevil,1);
		b_givethiefxp();
		Info_ClearChoices(dia_oric_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_oric_pickpocket_back()
{
	Info_ClearChoices(dia_oric_pickpocket);
};

