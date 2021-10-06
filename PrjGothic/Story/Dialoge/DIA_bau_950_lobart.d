
instance DIA_LOBART_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_exit_condition;
	information = dia_lobart_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_lobart_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_STOLENCLOTHS(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_stolencloths_condition;
	information = dia_lobart_stolencloths_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lobart_stolencloths_condition()
{
	if((Mob_HasItems("CHEST_LOBART",itar_bau_l) == FALSE) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lobart_stolencloths_info()
{
	var C_ITEM heroarmor;
	heroarmor = Npc_GetEquippedArmor(other);
	if(Hlp_IsItem(heroarmor,itar_bau_l) == TRUE)
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_00");	//� �� ���� �������� ����� ������! ���� ������� ����������� � ���� ������!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_01");	//��, ��!
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_02");	//����� �� ��� ��� ��������� ���, �� ����� ������� ������� ����!
	};
	if(Npc_KnowsInfo(other,dia_lobart_worknow))
	{
		AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_03");	//�� ��� �� ���������� ����� ������ ����, ����� ������ � ���� ����, ������� ����������!
	};
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_05_04");	//����� ���������� ��� ������!
	Info_ClearChoices(dia_lobart_stolencloths);
	Info_AddChoice(dia_lobart_stolencloths,"������ �� ����!",dia_lobart_stolencloths_forgetit);
	if(Npc_HasItems(other,itar_bau_l) > 0)
	{
		Info_AddChoice(dia_lobart_stolencloths,"�����, ������ ������� �� �����.",dia_lobart_stolencloths_hereyougo);
	}
	else
	{
		Info_AddChoice(dia_lobart_stolencloths,"� ���� �� ���.",dia_lobart_stolencloths_donthaveit);
	};
};

func void dia_lobart_stolencloths_hereyougo()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_HereYouGo_15_00");	//�����, ������ ������� �� �����.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_01");	//���� ��� ���� �����, �� ������ ��������� �� ���!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_HereYouGo_05_02");	//(���������) � ������ ��� �������!
	b_giveinvitems(other,self,itar_bau_l,1);
	Info_ClearChoices(dia_lobart_stolencloths);
};

func void dia_lobart_stolencloths_donthaveit()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_15_00");	//� ���� �� ���.
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_DontHaveIt_05_01");	//�� ��� ������ ��, ��? (���) � ������ ����, ������!
	LOBART_KLEIDUNG_GESTOHLEN = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_THEFT,1);
};

func void dia_lobart_stolencloths_forgetit()
{
	AI_Output(other,self,"DIA_Lobart_STOLENCLOTHS_ForgetIt_15_00");	//������ �� ����!
	AI_Output(self,other,"DIA_Lobart_STOLENCLOTHS_ForgetIt_05_01");	//(���) � ������ ����, ������!
	LOBART_KLEIDUNG_GESTOHLEN = TRUE;
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_THEFT,1);
};


instance DIA_LOBART_HALLO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_hallo_condition;
	information = dia_lobart_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lobart_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lobart_hallo_info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_00");	//��� �� ��� ���������� �� ���� �����?
		AI_Output(self,other,"DIA_Lobart_Hallo_05_01");	//�� �� ���� �������? �� ������� ���������� �������� ��� �� ������� ������?
		Info_ClearChoices(dia_lobart_hallo);
		Info_AddChoice(dia_lobart_hallo,"� �� �������...",dia_lobart_hallo_what);
		Info_AddChoice(dia_lobart_hallo,"� �� ������!",dia_lobart_hallo_fortheking);
		Info_AddChoice(dia_lobart_hallo,"� � �����������!",dia_lobart_hallo_forthepeasants);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_Hallo_05_02");	//��� ���� ���� �������?
	};
};

func void dia_lobart_hallo_forthepeasants()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForThePeasants_15_00");	//� � �����������!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_01");	//��! ���� ������ ������� ���� ������ ��� ���� � ������!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_02");	//��� �� �������, ��� ����� ��� ����� ����� ��������?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForThePeasants_05_03");	//����� ����, ��� ������ ����, ���� ����� �����, ��� ����.
	LOBART_AGAINSTKING = TRUE;
	Info_ClearChoices(dia_lobart_hallo);
};

func void dia_lobart_hallo_fortheking()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_ForTheKing_15_00");	//� �� ������!
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_01");	//(������������) '�� ������!' ����� �������� � ��������� ���������, ����� ������� �������� ���� ����.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_02");	//�� ��� ��, ������������, ��� �������, ����� ����� �������� ��� �� ��������? � ��� ��� ����������, ����� ���� ���������� ����?
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_03");	//� ����� ����: � ������, �� �������� ���������� �������.
	AI_Output(self,other,"DIA_Lobart_Hallo_ForTheKing_05_04");	//��� ��� ������ ���� � �����, ������ �� ����� �������.
	LOBART_AGAINSTKING = FALSE;
	Info_ClearChoices(dia_lobart_hallo);
};

func void dia_lobart_hallo_what()
{
	AI_Output(other,self,"DIA_Lobart_Hallo_What_15_00");	//� �� �������...
	AI_Output(self,other,"DIA_Lobart_Hallo_What_05_01");	//���?! �� ������� ���� ��������, �������! � ���� �����, �� ���� �� �������! ��� �� ���� ��?!
};


instance DIA_LOBART_KLEIDUNG(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_kleidung_condition;
	information = dia_lobart_kleidung_info;
	permanent = FALSE;
	description = "��� ����� ��������� ������!";
};


func int dia_lobart_kleidung_condition()
{
	if(!Npc_KnowsInfo(other,dia_lobart_stolencloths) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lobart_kleidung_info()
{
	AI_Output(other,self,"DIA_Lobart_KLEIDUNG_15_00");	//��� ����� ��������� ������!
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_01");	//� ���� ���� ���� ��������� ������������ ������� ������.
	AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_02");	//�� ������ ��������� �� ���?
	Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
	b_logentry(TOPIC_KLEIDUNG,"������ ������ ����� ������� ��� ������� ������.");
	if(!Npc_KnowsInfo(other,dia_lobart_worknow))
	{
		AI_Output(self,other,"DIA_Lobart_KLEIDUNG_05_03");	//�� ��� �� ���������� ����� �� ���������... ���� �� ���� �� ���, ��� ���� ������.
		b_logentry(TOPIC_KLEIDUNG,"������ ����� ������� ���� �� ������, ���� � ��������� �� ��� �����. ��� ������ � ������, ��� ������� ��������� ��� ������.");
	};
};


instance DIA_LOBART_BUYCLOTHES(C_INFO)
{
	npc = bau_950_lobart;
	nr = 2;
	condition = dia_lobart_buyclothes_condition;
	information = dia_lobart_buyclothes_info;
	permanent = TRUE;
	description = "������� ����� ��� ������� ������?";
};


func int dia_lobart_buyclothes_condition()
{
	if((Npc_KnowsInfo(other,dia_lobart_kleidung) && (LOBART_KLEIDUNG_VERKAUFT == FALSE)) || (Npc_KnowsInfo(other,dia_lobart_stolencloths) && (LOBART_KLEIDUNG_GESTOHLEN == FALSE) && (LOBART_KLEIDUNG_VERKAUFT == FALSE) && (hero.guild == GIL_NONE)))
	{
		return TRUE;
	};
};

func void dia_lobart_buyclothes_info()
{
	WERT_LOBARTSRUESTUNG = 80;
	AI_Output(other,self,"DIA_Lobart_BuyClothes_15_00");	//������� ����� ��� ������� ������?
	AI_Output(self,other,"DIA_Lobart_BuyClothes_05_01");	//���. ��������...
	if(LOBART_AGAINSTKING == TRUE)
	{
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_LOBART_RUEBEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_02");	//�� ������� ��� ���� �� ����.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_HILDA_PFANNEKAUFEN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_03");	//�� ����� ���� ����.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_VINO_WEIN == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_04");	//���� �������, ��� �� ����� ����� ���. � ��� ���-��� �� ������ - ������ �� �� �����-�� ����� � ��������� �����������.
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	if(MIS_MALETH_BANDITS == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_05_05");	//����� �������, ��� �� ������� ��������. ��� ������� ���������� ��� ����� �������. �������, ��� ������� ��� �� ���!
		WERT_LOBARTSRUESTUNG = WERT_LOBARTSRUESTUNG - 10;
	};
	b_say_gold(self,other,WERT_LOBARTSRUESTUNG);
	if(WERT_LOBARTSRUESTUNG == 30)
	{
		AI_Output(self,other,"DIA_Lobart_GOLD_05_06");	//� ������� � �� �� �����.
		b_logentry(TOPIC_KLEIDUNG,"�� �� �� ������� �� ��� ������, ��� �� 30 ������� �����.");
	};
	Info_ClearChoices(dia_lobart_buyclothes);
	Info_AddChoice(dia_lobart_buyclothes,"��� ��� ��� ������� ������ ��� ����.",dia_lobart_buyclothes_notyet);
	Info_AddChoice(dia_lobart_buyclothes,"����� ����� ���� ��� ������� ������ (������: ������ - 15, ������ - 15)",dia_lobart_buyclothes_buy);
};

func void dia_lobart_buyclothes_buy()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_BUY_15_00");	//����� ����� ���� ��� ������� ������.
	if(b_giveinvitems(other,self,itmi_gold,WERT_LOBARTSRUESTUNG))
	{
		if(Npc_HasItems(self,itar_bau_l) > 0)
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_01");	//������, ��� �������. ������� ����� � ���� ���������. ���, �����!
			b_giveinvitems(self,other,itar_bau_l,1);
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_02");	//� ���� ���� ���� ������, ��� �� ������� ����������� ����.
			AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_03");	//�� ���� �� ����� ����� ���-������ ��� ��� ����������!
		};
		LOBART_KLEIDUNG_VERKAUFT = TRUE;
		Wld_AssignRoomToGuild("farm03",GIL_NONE);
		b_checklog();
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_BuyClothes_BUY_05_04");	//� ���� ������������ ������!
	};
	Info_ClearChoices(dia_lobart_buyclothes);
};

func void dia_lobart_buyclothes_notyet()
{
	AI_Output(other,self,"DIA_Lobart_BuyClothes_NotYet_15_00");	//��� ��� ��� ������� ������ ��� ����.
	AI_Output(self,other,"DIA_Lobart_BuyClothes_NotYet_05_01");	//��� ������...
	Info_ClearChoices(dia_lobart_buyclothes);
};


instance DIA_LOBART_AUFSTANDINFO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_aufstandinfo_condition;
	information = dia_lobart_aufstandinfo_info;
	permanent = FALSE;
	description = "��� ���� ����� ����?";
};


func int dia_lobart_aufstandinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_hallo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_aufstandinfo_info()
{
	AI_Output(other,self,"DIA_Lobart_AufstandInfo_15_00");	//��� ���� ����� ����?
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_01");	//�� �� ������ ��� ����� ����? �������, �� ������ ������ ��������? �� �� ������ ����������� �����!
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_02");	//�� ���������� ������� ������� ������� ����, ���������� ������, ������ ������������.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_03");	//�� � ��� ���, ��� � ������� ������ ��������, ��������� ������ ������������ � ��� ��� ���� � ���� - ��� ��� ����� ������� ���, ��� � ��� ����.
		AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_04");	//���� ��� ����� ������������ � ������, � ��� ������ �� ��������� ��� ����� ����.
	};
	AI_Output(self,other,"DIA_Lobart_AufstandInfo_05_05");	//��������� ������� ����� ���������! ���� ��� ������ �� ���!
};


instance DIA_LOBART_ONARSTORY(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_onarstory_condition;
	information = dia_lobart_onarstory_info;
	permanent = FALSE;
	description = "�������� ��� ��������� �� ���� �����...";
};


func int dia_lobart_onarstory_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_onarstory_info()
{
	AI_Output(other,self,"DIA_Lobart_OnarStory_15_00");	//�������� ��� ��������� �� ���� �����...
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_01");	//�� ���� �������, ����� ���? ��� ������ � ���� ���������� ���� � ����� �����, ��� �� �� ������?
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_02");	//���� - ����� ������� ������ � ���� ���������. �� ������ ��������� � �������.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_03");	//�������, �� ����� ���������, ����� �� �� ������� �� ��� ����� ��������� ������!
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_04");	//�� ���� ������ ��� �� ���.
		AI_Output(self,other,"DIA_Lobart_OnarStory_05_05");	//��� �� �� �� ����, ������ �� ���� ����������� ������ �� ������������ ������� �� ��� �����.
	};
};


instance DIA_LOBART_SLDINFO(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_sldinfo_condition;
	information = dia_lobart_sldinfo_info;
	permanent = FALSE;
	description = "� ��� ��� ��������, ������� ����� ����?";
};


func int dia_lobart_sldinfo_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_onarstory) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_sldinfo_info()
{
	AI_Output(other,self,"DIA_Lobart_SldInfo_15_00");	//� ��� ��� ��������, ������� ����� ����?
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_01");	//� ���� ��� ���� �� ���� ������. ����������������, ����������� �� ��� - ������ ���������� �� �������.
	AI_Output(self,other,"DIA_Lobart_SldInfo_05_02");	//(������������) � ����, ������������, �� ��� ����� �������...
};


instance DIA_LOBART_WHICHSIDE(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_whichside_condition;
	information = dia_lobart_whichside_info;
	permanent = FALSE;
	description = "� ��� ������ ����? ��-�� �� ���� �������? �������� ��� ������?";
};


func int dia_lobart_whichside_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_aufstandinfo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_whichside_info()
{
	AI_Output(other,self,"DIA_Lobart_WhichSide_15_00");	//� ��� ������ ����? ��-�� �� ���� �������? �������� ��� ������?
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_01");	//� ������� ������ � ������, ����� � ���� ���� ����������� ��������.
	AI_Output(self,other,"DIA_Lobart_WhichSide_05_02");	//�� � ���� ��� �����. � �� ��� ����� �� ����, ��� ������.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_03");	//������ ���� ���� �����, � ���� ���������� ����� ��������� ������ ����, ��� �� ����� �������������� � ����.
		AI_Output(self,other,"DIA_Lobart_WhichSide_05_04");	//��� ������ ����������� �������� ��� ��� �� ������������, �� ���� ��� ������ �� �������� ������� ���� ������� ��� ������.
	};
};


instance DIA_LOBART_WORKNOW(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_worknow_condition;
	information = dia_lobart_worknow_info;
	permanent = FALSE;
	description = "� ��� ������.";
};


func int dia_lobart_worknow_condition()
{
	if((Npc_KnowsInfo(other,dia_lobart_aufstandinfo) || Npc_KnowsInfo(other,dia_lobart_stolencloths)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_worknow_info()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_15_00");	//� ��� ������.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_01");	//��� �� ����� ��� ���� ���������� ��������. �� � ���� ���������� ���� �������� ������.
	};
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_02");	//� ���� �������, �� ������ ������ �� ����. ����� ����� ��� ��������� �������� ���-����� ��������� ��� ����.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_03");	//� ���� ��������� ���� �������. ��� ���� ���� ��������� ������.
		AI_Output(self,other,"DIA_Lobart_WorkNOW_05_04");	//��� ������ ����� �������� ������. � �� ���� ������ ���� �� ������ ���, �� � ���� ������� ���� �� �������, ���� �� ����������� �� ����.
		Log_CreateTopic(TOPIC_KLEIDUNG,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_KLEIDUNG,LOG_RUNNING);
		b_logentry(TOPIC_KLEIDUNG,"������ ������ ����� ������� ��� ������� ������. �� ����� ������� ���� �� ������, ���� � ��������� �� ��� �����. ��� ������ � ������, ��� ������� ��������� ��� ������.");
		if((Npc_HasEquippedArmor(other) == FALSE) || (LOBART_KLEIDUNG_VERKAUFT == TRUE))
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_05");	//���� �� ����, ��� �� ���������, � �� ������: ���� ������.
		}
		else
		{
			AI_Output(self,other,"DIA_Lobart_WorkNOW_05_06");	//�� � ���� ��� ���� ������, ��� ��� ��, ��������, �������� ������.
		};
	};
	AI_Output(self,other,"DIA_Lobart_WorkNOW_05_07");	//������ ��������� - ��������� ���� ���� �� ������� ����� �������.
	Info_ClearChoices(dia_lobart_worknow);
	Info_AddChoice(dia_lobart_worknow,"� ������ ������� ����? ��, ������ ����, ������!",dia_lobart_worknow_wannafoolme);
	Info_AddChoice(dia_lobart_worknow,"������...",dia_lobart_worknow_ok);
};

func void dia_lobart_worknow_ok()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_Ok_15_00");	//������...
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_Ok_05_01");	//����� ����������, ���� � �� ���������.
	};
	Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
	b_logentry(TOPIC_RUEBEN,"������ ������ �����, ����� � ������ ���� �� ����. �� ��� �� ������� ��� ������ �� ����������� ��������� ����.");
	MIS_LOBART_RUEBEN = LOG_RUNNING;
	Info_ClearChoices(dia_lobart_worknow);
};

func void dia_lobart_worknow_wannafoolme()
{
	AI_Output(other,self,"DIA_Lobart_WorkNOW_WannaFoolMe_15_00");	//� ������ ������� ����? ��, ������ ����, ������!
	AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_01");	//��������� ������� ������ �� ��� '����������� �����������', ��?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_02");	//����� �� ���� ��� �������� � ���� �����!
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_WorkNOW_WannaFoolMe_05_03");	//������ � ���� ��� ������ ������ ��� ����.
	};
	Log_CreateTopic(TOPIC_RUEBEN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RUEBEN,LOG_RUNNING);
	b_logentry(TOPIC_RUEBEN,"������ ������ �����, ����� � ������ ���� �� ����. �� ��� �� �������� ��� ������� ��� ������� ��� ������ �� ����������� ��������� ����.");
	MIS_LOBART_RUEBEN = LOG_RUNNING;
	Info_ClearChoices(dia_lobart_worknow);
};


instance DIA_LOBART_RUEBENRUNNING(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_ruebenrunning_condition;
	information = dia_lobart_ruebenrunning_info;
	permanent = TRUE;
	description = "��� ���� ����!";
};


func int dia_lobart_ruebenrunning_condition()
{
	if((MIS_LOBART_RUEBEN == LOG_RUNNING) && (Npc_HasItems(other,itpl_beet) >= 1) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_ruebenrunning_info()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_00");	//��� ���� ����!
	if(Npc_HasItems(other,itpl_beet) >= 20)
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_01");	//��, ������, �� �� ����� �� ����������, ��� ��������.
		};
		if(Npc_IsDead(hilda) == FALSE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_02");	//������ �� ���� ���� � ��� � ����� ��, ����� ��� ����������� ��.
			MIS_LOBART_RUEBENTOHILDA = LOG_RUNNING;
			Log_CreateTopic(TOPIC_RUEBENBRINGEN,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_RUEBENBRINGEN,LOG_RUNNING);
			b_logentry(TOPIC_RUEBENBRINGEN,"� ������ ������� ��������� ���� ���� �������, ����������� � ����.");
		};
		MIS_LOBART_RUEBEN = LOG_SUCCESS;
		b_giveplayerxp(XP_LOBARTHOLRUEBEN);
		AI_Output(other,self,"DIA_Lobart_RuebenRunning_15_03");	//��� ������ ���� �����?
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_04");	//� ���� ���� ���� 5 ������� �����.
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_05");	//...��� ������� ���� ������ �������. ��� �� ���������?
		};
		Info_ClearChoices(dia_lobart_ruebenrunning);
		if(hero.guild == GIL_NONE)
		{
			Info_AddChoice(dia_lobart_ruebenrunning,"����� ������ ������ �������!",dia_lobart_ruebenrunning_billiger);
		};
		Info_AddChoice(dia_lobart_ruebenrunning,"��� ��� 5 ������� �����!",dia_lobart_ruebenrunning_gold);
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_06");	//�� �� �� ������ � ��������!
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_07");	//�� ���, ���� ���������?! �������, ��� �������, ��� ��� �� ���, ����� ���� �������� ������ � ����� ���������!
			AI_Output(self,other,"DIA_Lobart_RuebenRunning_05_08");	//����������� �� ���� � ������� ������! ������� ��� � ������ ����, ��� ���� ������!
		};
		AI_StopProcessInfos(self);
	};
};

func void dia_lobart_ruebenrunning_gold()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Gold_15_00");	//��� ��� 5 ������� �����!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_01");	//�����.
	b_giveinvitems(self,other,itmi_gold,5);
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Lobart_RuebenRunning_Gold_05_02");	//������ �� ������ �� ��� �����.
	};
	Info_ClearChoices(dia_lobart_ruebenrunning);
};

func void dia_lobart_ruebenrunning_billiger()
{
	AI_Output(other,self,"DIA_Lobart_RuebenRunning_Billiger_15_00");	//����� ������ ������ �������!
	AI_Output(self,other,"DIA_Lobart_RuebenRunning_Billiger_05_01");	//������! � ����� ���� �� �� 10 ������� �������.
	Info_ClearChoices(dia_lobart_ruebenrunning);
};


instance DIA_LOBART_MOREWORK(C_INFO)
{
	npc = bau_950_lobart;
	nr = 1;
	condition = dia_lobart_morework_condition;
	information = dia_lobart_morework_info;
	permanent = TRUE;
	description = "� ���� ���� ��� �����-������ ������ ��� ����?";
};


func int dia_lobart_morework_condition()
{
	if(((MIS_LOBART_RUEBEN == LOG_RUNNING) || (MIS_LOBART_RUEBEN == LOG_SUCCESS)) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lobart_morework_info()
{
	AI_Output(other,self,"DIA_Lobart_MoreWork_15_00");	//� ���� ���� ��� �����-������ ������ ��� ����?
	if(MIS_LOBART_RUEBEN == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_01");	//������� ������ ���� � ����. � ���,���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Lobart_MoreWork_05_02");	//���, �� �� ������ �������� � ���� ���� ��� ������ �� ����. ��������, �� ����� ������.
	};
};


instance DIA_LOBART_ANDREHELPLOBART(C_INFO)
{
	npc = bau_950_lobart;
	condition = dia_lobart_andrehelplobart_condition;
	information = dia_lobart_andrehelplobart_info;
	description = "���� �������� � ���� �����.";
};


func int dia_lobart_andrehelplobart_condition()
{
	if(MIS_ANDREHELPLOBART == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lobart_andrehelplobart_info()
{
	AI_Output(other,self,"DIA_Lobart_ANDREHELPLOBART_15_00");	//���� �������� � ���� �����. � ���� ���-������ ������ ����?
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_01");	//��, �������. ���� ��� ������ �� ���� ��������� ������� ��������.
	AI_Output(self,other,"DIA_Lobart_ANDREHELPLOBART_05_02");	//�������� �� ����. ���� �� �������, ���!
	b_logentry(TOPIC_FELDRAEUBER,"���� ������� ��������� �������� ���������. �� �����, ����� � ������� ��.");
	MIS_LOBARTKILLBUGS = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_BUGDEAD(C_INFO)
{
	npc = bau_950_lobart;
	condition = dia_lobart_bugdead_condition;
	information = dia_lobart_bugdead_info;
	permanent = TRUE;
	description = "� ���������� � ����� �������!";
};


var int dia_lobart_bugdead_noperm;

func int dia_lobart_bugdead_condition()
{
	if((MIS_LOBARTKILLBUGS == LOG_RUNNING) && (DIA_LOBART_BUGDEAD_NOPERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_lobart_bugdead_info()
{
	if(Npc_IsDead(lobarts_giant_bug1) && Npc_IsDead(lobarts_giant_bug2) && Npc_IsDead(lobarts_giant_bug3) && Npc_IsDead(lobarts_giant_bug4) && Npc_IsDead(lobarts_giant_bug5) && Npc_IsDead(lobarts_giant_bug6) && Npc_IsDead(lobarts_giant_bug7))
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_00");	//� ���������� � ����� �������!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_01");	//�������. �� �� ����� �� ������ ����������. � ������������ ���� �������. ���, ����� ������������.
		b_startotherroutine(vino,"Start");
		b_startotherroutine(lobartsbauer1,"Start");
		b_startotherroutine(lobartsbauer2,"Start");
		CreateInvItems(self,itmi_gold,20);
		b_giveinvitems(self,other,itmi_gold,20);
		MIS_LOBARTKILLBUGS = LOG_SUCCESS;
		MIS_ANDREHELPLOBART = LOG_SUCCESS;
		Log_AddEntry(TOPIC_FELDRAEUBER,"���� ������� ������� �� ������� ��������. � ��������� �� ����.");
		DIA_LOBART_BUGDEAD_NOPERM = TRUE;
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_BUGDEAD_15_02");	//� �����, � ���������� �� ����� �������!
		AI_Output(self,other,"DIA_Lobart_BUGDEAD_05_03");	//�� ������� ������ ����. � ��� ��� ���� ��. ���� �� ������ ���� ������, ���� ������ ������ � �������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_LOBART_KAP3_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap3_exit_condition;
	information = dia_lobart_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lobart_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_DMT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 30;
	condition = dia_lobart_dmt_condition;
	information = dia_lobart_dmt_info;
	description = "��� ���� �����?";
};


func int dia_lobart_dmt_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_lobart_dmt_info()
{
	AI_Output(other,self,"DIA_Lobart_DMT_15_00");	//��� ���� �����?
	AI_Output(self,other,"DIA_Lobart_DMT_05_01");	//��� ��� ����������.
	AI_Output(self,other,"DIA_Lobart_DMT_05_02");	//���������� ��������� ��� ����� � ������ ����� � ������������� �� ������ � �� ���� �����.
	Info_ClearChoices(dia_lobart_dmt);
	Info_AddChoice(dia_lobart_dmt,DIALOG_ENDE,dia_lobart_dmt_back);
	if((hero.guild == GIL_KDF) && (VINO_ISALIVE_KAP3 == TRUE))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_03");	//��� ����� ���������� � ���-�� � ����, � ����� �������� ������ � ���.
		if(NPCOBSESSEDBYDMT_VINO == FALSE)
		{
			Info_AddChoice(dia_lobart_dmt,"���� ��� �������� ����?",dia_lobart_dmt_vinowohin);
		};
		Info_AddChoice(dia_lobart_dmt,"����� � ��� ���� � ����?",dia_lobart_dmt_vinowas);
	};
	if((Npc_IsDead(hilda) == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Lobart_DMT_05_04");	//������ ����� ����� ��� ���� ����� ������ ��������. ��� ����� �� ������ � �������. � ��� ����� ������ �����.
	};
	AI_Output(self,other,"DIA_Lobart_DMT_05_05");	//��� ����� �����������!
	if((MIS_HEALHILDA != LOG_SUCCESS) && (Npc_IsDead(hilda) == FALSE))
	{
		Info_AddChoice(dia_lobart_dmt,"������ �� �� �������� ���� � ������?",dia_lobart_dmt_frauheilen);
	};
	Info_AddChoice(dia_lobart_dmt,"������ �� ������ �� �������� � ����� ������ � ������?",dia_lobart_dmt_hof);
	Info_AddChoice(dia_lobart_dmt,"�� ������� � ������ � ������?",dia_lobart_dmt_spoketothem);
};

func void dia_lobart_dmt_frauheilen()
{
	AI_Output(other,self,"DIA_Lobart_DMT_FrauHeilen_15_00");	//������ �� �� �������� ���� � ������?
	AI_Output(self,other,"DIA_Lobart_DMT_FrauHeilen_05_01");	//�� ������ �� ������� � ����� � �������, �� � � ����� �� �����, ���� �� ���� ����� ����� ����� ����.
	Log_CreateTopic(TOPIC_HEALHILDA,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HEALHILDA,LOG_RUNNING);
	b_logentry(TOPIC_HEALHILDA,"���� ������� ������ ������, �� � ������� ���� ���������, ������� ����� �������� ��.");
	MIS_HEALHILDA = LOG_RUNNING;
};

func void dia_lobart_dmt_back()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void dia_lobart_dmt_spoketothem()
{
	AI_Output(other,self,"DIA_Lobart_DMT_spokeToThem_15_00");	//�� ������� � ������ � ������?
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_01");	//�������. �� ��� �� ����� ������ �������.
	AI_Output(self,other,"DIA_Lobart_DMT_spokeToThem_05_02");	//� �����, ��� ����-�� ����.
};

func void dia_lobart_dmt_hof()
{
	AI_Output(other,self,"DIA_Lobart_DMT_hof_15_00");	//������ �� ������ �� �������� � ����� ������ � ������?
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_01");	//� �� ����� �����. �� � �����, ��� ��� ������ ������ ������ ����������. ��� ��, �������.
	AI_Output(self,other,"DIA_Lobart_DMT_hof_05_02");	//�� ������� ���-�� ��������� ������!
};

func void dia_lobart_dmt_vinowas()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWas_15_00");	//����� � ��� ���� � ����?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWas_05_01");	//��� �� �������. ��� ������ ����� ��� � �����.
};

func void dia_lobart_dmt_vinowohin()
{
	AI_Output(other,self,"DIA_Lobart_DMT_VinoWohin_15_00");	//���� ��� �������� ����?
	AI_Output(self,other,"DIA_Lobart_DMT_VinoWohin_05_01");	//��� ����� �����, �� ���� ����.
};


instance DIA_LOBART_VINOTOT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 32;
	condition = dia_lobart_vinotot_condition;
	information = dia_lobart_vinotot_info;
	description = "���� �� ��������.";
};


func int dia_lobart_vinotot_condition()
{
	if((Npc_IsDead(vino) || (NPCOBSESSEDBYDMT_VINO == TRUE)) && Npc_KnowsInfo(other,dia_lobart_dmt) && (hero.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_lobart_vinotot_info()
{
	AI_Output(other,self,"DIA_Lobart_VINOTOT_15_00");	//���� �� ��������.
	if(Npc_IsDead(vino))
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_01");	//�� �����.
	}
	else
	{
		AI_Output(other,self,"DIA_Lobart_VINOTOT_15_02");	//��� ����� ��� � ���.
	};
	AI_Output(self,other,"DIA_Lobart_VINOTOT_05_03");	//�, �����. �������, ���� ���� ������ ����� ����������.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_LOBART_PERM(C_INFO)
{
	npc = bau_950_lobart;
	nr = 80;
	condition = dia_lobart_perm_condition;
	information = dia_lobart_perm_info;
	permanent = TRUE;
	description = "������ ���� �����!";
};


func int dia_lobart_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_lobart_dmt) && (KAPITEL >= 3) && (Npc_IsDead(orcwarrior_lobart1) && Npc_IsDead(orcwarrior_lobart2) && Npc_IsDead(orcwarrior_lobart3) && Npc_IsDead(orcwarrior_lobart4) && Npc_IsDead(orcwarrior_lobart5) && Npc_IsDead(orcwarrior_lobart6)))
	{
		return TRUE;
	};
};

func void dia_lobart_perm_info()
{
	AI_Output(other,self,"DIA_Lobart_PERM_15_00");	//������ ���� �����!
	AI_Output(self,other,"DIA_Lobart_PERM_05_01");	//� ���������.
};


instance DIA_LOBART_KAP4_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap4_exit_condition;
	information = dia_lobart_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lobart_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_ORKPROBLEM(C_INFO)
{
	npc = bau_950_lobart;
	nr = 41;
	condition = dia_lobart_orkproblem_condition;
	information = dia_lobart_orkproblem_info;
	description = "� ���� �������� � ������.";
};


func int dia_lobart_orkproblem_condition()
{
	if(((Npc_IsDead(orcwarrior_lobart1) == FALSE) || (Npc_IsDead(orcwarrior_lobart2) == FALSE) || (Npc_IsDead(orcwarrior_lobart3) == FALSE) || (Npc_IsDead(orcwarrior_lobart4) == FALSE) || (Npc_IsDead(orcwarrior_lobart5) == FALSE) || (Npc_IsDead(orcwarrior_lobart6) == FALSE)) && (KAPITEL >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)) && Npc_KnowsInfo(other,dia_lobart_dmt))
	{
		return TRUE;
	};
};

func void dia_lobart_orkproblem_info()
{
	AI_Output(other,self,"DIA_Lobart_ORKPROBLEM_15_00");	//� ���� �������� � ������.
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_01");	//(���) ����. �� �����-������ ��� ��� ��������?!
	AI_Output(self,other,"DIA_Lobart_ORKPROBLEM_05_02");	//���� ��� ����� ������������, ��� ����� �� ����� ������ � 3-� ������� �����.
	Log_CreateTopic(TOPIC_LOBARTSORKPROBLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LOBARTSORKPROBLEM,LOG_RUNNING);
	b_logentry(TOPIC_LOBARTSORKPROBLEM,"�� ����� ������� ���������� ����. �� �����, ����� � ������� ��� �� ���.");
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_ORKSWEG(C_INFO)
{
	npc = bau_950_lobart;
	nr = 42;
	condition = dia_lobart_orksweg_condition;
	information = dia_lobart_orksweg_info;
	description = "� ������� ���� ����� �� �����.";
};


func int dia_lobart_orksweg_condition()
{
	if((Npc_IsDead(orcwarrior_lobart1) == TRUE) && (Npc_IsDead(orcwarrior_lobart2) == TRUE) && (Npc_IsDead(orcwarrior_lobart3) == TRUE) && (Npc_IsDead(orcwarrior_lobart4) == TRUE) && (Npc_IsDead(orcwarrior_lobart5) == TRUE) && (Npc_IsDead(orcwarrior_lobart6) == TRUE) && (KAPITEL >= 4) && ((hero.guild == GIL_PAL) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_lobart_orksweg_info()
{
	AI_Output(other,self,"DIA_Lobart_ORKSWEG_15_00");	//� ������� ���� ����� �� �����.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_01");	//������ �� ������� ��������, ��� �������� ������ �� ������ ��� ���, ������� ��������.
	};
	AI_Output(self,other,"DIA_Lobart_ORKSWEG_05_02");	//����� ������. � �� ���� ���� ���� �� ��� �����, �� � �������, �� ������� ��� ���� �������������.
	b_startotherroutine(vino,"Start");
	b_startotherroutine(lobartsbauer1,"Start");
	b_startotherroutine(lobartsbauer2,"Start");
	TOPIC_END_LOBARTSORKPROBLEM = TRUE;
	b_giveplayerxp(XP_KILLEDLOBARTORKS);
	CreateInvItems(self,itmi_gold,150);
	b_giveinvitems(self,other,itmi_gold,150);
};


instance DIA_LOBART_KAP5_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap5_exit_condition;
	information = dia_lobart_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lobart_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_KAP6_EXIT(C_INFO)
{
	npc = bau_950_lobart;
	nr = 999;
	condition = dia_lobart_kap6_exit_condition;
	information = dia_lobart_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lobart_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_lobart_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOBART_PICKPOCKET(C_INFO)
{
	npc = bau_950_lobart;
	nr = 900;
	condition = dia_lobart_pickpocket_condition;
	information = dia_lobart_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_lobart_pickpocket_condition()
{
	return c_beklauen(65,80);
};

func void dia_lobart_pickpocket_info()
{
	Info_ClearChoices(dia_lobart_pickpocket);
	Info_AddChoice(dia_lobart_pickpocket,DIALOG_BACK,dia_lobart_pickpocket_back);
	Info_AddChoice(dia_lobart_pickpocket,DIALOG_PICKPOCKET,dia_lobart_pickpocket_doit);
};

func void dia_lobart_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lobart_pickpocket);
};

func void dia_lobart_pickpocket_back()
{
	Info_ClearChoices(dia_lobart_pickpocket);
};

