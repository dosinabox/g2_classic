
instance DIA_ORLAN_EXIT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 999;
	condition = dia_orlan_exit_condition;
	information = dia_orlan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_orlan_exit_condition()
{
	return TRUE;
};

func void dia_orlan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORLAN_WEIN(C_INFO)
{
	npc = bau_970_orlan;
	nr = 3;
	condition = dia_orlan_wein_condition;
	information = dia_orlan_wein_info;
	permanent = FALSE;
	description = "� ������ ���� �� ���������.";
};


func int dia_orlan_wein_condition()
{
	if((MIS_GORAXWEIN == LOG_RUNNING) && (Npc_HasItems(other,itfo_wine) >= 12))
	{
		return TRUE;
	};
};

func void dia_orlan_wein_info()
{
	AI_Output(other,self,"DIA_Orlan_Wein_15_00");	//� ������ ���� �� ���������.
	AI_Output(self,other,"DIA_Orlan_Wein_05_01");	//�����������. ��� ������ ��, ��� ��� �����.
	AI_Output(self,other,"DIA_Orlan_Wein_05_02");	//� ��� ����������� � ���� � �������� ��������. � ��� ���� 100 ������� ����� ����� ������.
	Info_ClearChoices(dia_orlan_wein);
	Info_AddChoice(dia_orlan_wein,"������, ����� ��� ��� ������.",dia_orlan_wein_ja);
	Info_AddChoice(dia_orlan_wein,"�� ��������� ������ ����?",dia_orlan_wein_nein);
};

func void dia_orlan_wein_ja()
{
	AI_Output(other,self,"DIA_Orlan_Wein_JA_15_00");	//������, ����� ��� ��� ������.
	AI_Output(self,other,"DIA_Orlan_Wein_JA_05_01");	//�����. � ����� ������� ����� ����.
	b_giveinvitems(self,other,itmi_gold,100);
	b_giveinvitems(other,self,itfo_wine,12);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_nein()
{
	AI_Output(other,self,"DIA_Orlan_Wein_NEIN_15_00");	//�� ��������� ������ ����? ��� ����� 240 �����.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_01");	//���, ������ ����������� ����, ��? �� ������, ����� ����, �� ������ ������������. ��������, ����� �������� ��� - � ��� ���� 100 ����� �� ��� ����.
	AI_Output(self,other,"DIA_Orlan_Wein_NEIN_05_02");	//�� ������� �������, ��� � ������� ����, � � ��� ���� � ������� ������ ������ � ������������.
	Info_ClearChoices(dia_orlan_wein);
	Info_AddChoice(dia_orlan_wein,"��, ����� ���� 240 �����.",dia_orlan_wein_nie);
	Info_AddChoice(dia_orlan_wein,"��, ������ ���������. ����� ���� ��� ������.",dia_orlan_wein_okay);
	Info_AddChoice(dia_orlan_wein,"� ��� ��� �� ������?",dia_orlan_wein_was);
};

func void dia_orlan_wein_nie()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Nie_15_00");	//��, ����� ���� 240 �����.
	AI_Output(self,other,"DIA_Orlan_Wein_Nie_05_01");	//�� �� ������ ����� �� ���� ������, ��? (��������) �� ������, ��� ���� ������.
	b_giveinvitems(self,other,itmi_gold,240);
	b_giveinvitems(other,self,itfo_wine,12);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_okay()
{
	var string text;
	text = ConcatStrings("4",PRINT_ITEMSERHALTEN);
	PrintScreen(text,-1,-1,FONT_SCREENSMALL,2);
	b_giveinvitems(self,other,itmi_gold,100);
	AI_Output(other,self,"DIA_Orlan_Wein_Okay_15_00");	//��, ������ ���������. ����� ���� ��� ������.
	AI_Output(self,other,"DIA_Orlan_Wein_Okay_05_01");	//��� ���� ������ � ������.
	b_giveinvitems(other,self,itfo_wine,12);
	CreateInvItems(hero,itsc_light,2);
	CreateInvItems(hero,itsc_lightheal,1);
	CreateInvItems(hero,itsc_sumgobskel,1);
	Info_ClearChoices(dia_orlan_wein);
};

func void dia_orlan_wein_was()
{
	AI_Output(other,self,"DIA_Orlan_Wein_Was_15_00");	//� ��� ��� �� ������?
	AI_Output(self,other,"DIA_Orlan_Wein_Was_05_01");	//������� �� ���� - � � ���� ������ �� �������. ��� ��������� ��� �� �����, �������... �-�... ����� �� �����, ��!
};


instance DIA_ORLAN_WERBISTDU(C_INFO)
{
	npc = bau_970_orlan;
	nr = 2;
	condition = dia_orlan_werbistdu_condition;
	information = dia_orlan_werbistdu_info;
	description = "��� ��?";
};


func int dia_orlan_werbistdu_condition()
{
	return TRUE;
};

func void dia_orlan_werbistdu_info()
{
	AI_Output(other,self,"DIA_Orlan_WERBISTDU_15_00");	//�� ���?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_01");	//� �����, ������ ���� �������� �������.
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_02");	//�� ���-������ �����, ���������? ����� ����, ��������� ��� ��� ������� �������?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_03");	//������ ����, ���, ����� ����, ���� ����� ����������?
	AI_Output(self,other,"DIA_Orlan_WERBISTDU_05_04");	//� ���� ���� ���� ��� ��� � ���� ������, ���� � ���� ���� ������� ������.
};


instance DIA_ORLAN_RUESTUNG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 5;
	condition = dia_orlan_ruestung_condition;
	information = dia_orlan_ruestung_info;
	permanent = TRUE;
	description = "��� �� ������� �� ������ ����������?";
};


var int dia_orlan_ruestung_noperm;

func int dia_orlan_ruestung_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (DIA_ORLAN_RUESTUNG_NOPERM == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_orlan_ruestung_info()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_15_00");	//��� �� ������� �� ������ ����������?
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_05_01");	//� ���� ���� ����� ������� ���������, � ������, ��� ������������ ����.
	Info_ClearChoices(dia_orlan_ruestung);
	Info_AddChoice(dia_orlan_ruestung,DIALOG_BACK,dia_orlan_ruestung_back);
	Info_AddChoice(dia_orlan_ruestung,"������� �������. ������: ������ 25, ������ 20, ����� 5 (250 ������)",dia_orlan_ruestung_buy);
};

func void dia_orlan_ruestung_buy()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_Buy_15_00");	//� �� ����� ������ ������� �������.
	if(b_giveinvitems(other,self,itmi_gold,VALUE_ITAR_LEATHER_L))
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_01");	//������ �����.
		CreateInvItems(self,itar_leather_l,1);
		b_giveinvitems(self,other,itar_leather_l,1);
		AI_EquipBestArmor(other);
		DIA_ORLAN_RUESTUNG_NOPERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_RUESTUNG_Buy_05_02");	//������. ������, ����� � ���� �������� ������.
	};
	Info_ClearChoices(dia_orlan_ruestung);
};

func void dia_orlan_ruestung_back()
{
	AI_Output(other,self,"DIA_Orlan_RUESTUNG_BACK_15_00");	//� ������� ��� ����.
	AI_Output(self,other,"DIA_Orlan_RUESTUNG_BACK_05_01");	//��� ������. ������ �� ����� ������� �����.
	Info_ClearChoices(dia_orlan_ruestung);
};


instance DIA_ORLAN_TRADE(C_INFO)
{
	npc = bau_970_orlan;
	nr = 70;
	condition = dia_orlan_trade_condition;
	information = dia_orlan_trade_info;
	trade = TRUE;
	permanent = TRUE;
	description = "������ ��� ���� ������.";
};


func int dia_orlan_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_trade_info()
{
	AI_Output(other,self,"DIA_Orlan_TRADE_15_00");	//������ ��� ���� ������.
	b_givetradeinv(self);
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_01");	//�������. ��� ���� ������� ����� �������� ������ ������� �����.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_MIL))
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_02");	//�������, ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_TRADE_05_03");	//���� �� ������� ���������.
	};
};


instance DIA_ORLAN_HOTELZIMMER(C_INFO)
{
	npc = bau_970_orlan;
	nr = 6;
	condition = dia_orlan_hotelzimmer_condition;
	information = dia_orlan_hotelzimmer_info;
	permanent = TRUE;
	description = "������� �� ������ �� �������?";
};


var int orlan_scgothotelzimmer;
var int orlan_scgothotelzimmerday;

func int dia_orlan_hotelzimmer_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu) && (ORLAN_SCGOTHOTELZIMMER == FALSE))
	{
		return TRUE;
	};
};

func void dia_orlan_hotelzimmer_info()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_15_00");	//������� �� ������ �� �������?
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		if(hero.guild == GIL_PAL)
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_01");	//��� ������ ������ � ���� ������ �������� ��������� �������. ���������� ���������, �����������.
		}
		else
		{
			AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_02");	//� �� ������� �� ������ ����� ������ �� ���� ������ � ������������� ������ �� �����.
		};
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_03");	//��� ���� �� ������� ������. �������, ������� ������ ����������.
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		b_giveinvitems(self,other,itke_orlan_hotelzimmer,1);
		ORLAN_SCGOTHOTELZIMMER = TRUE;
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_05_04");	//�� ������� 50 ������� ����� � ������ - � ������� ����.
		Info_ClearChoices(dia_orlan_hotelzimmer);
		Info_AddChoice(dia_orlan_hotelzimmer,"���� ������, ��� ������-��!",dia_orlan_hotelzimmer_nein);
		Info_AddChoice(dia_orlan_hotelzimmer,"������. ��� ������.",dia_orlan_hotelzimmer_ja);
	};
};

func void dia_orlan_hotelzimmer_ja()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_ja_15_00");	//������. ��� ������.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_01");	//� ��� ����. ������� ��������� ����� �� ��������. �� �� ������ �� � �� ������� ������� ����� �������, �������?
		CreateInvItems(self,itke_orlan_hotelzimmer,1);
		b_giveinvitems(self,other,itke_orlan_hotelzimmer,1);
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
		ORLAN_SCGOTHOTELZIMMER = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_HotelZimmer_ja_05_02");	//� ���� ��� ����������. ������� ������, ����� ������������.
	};
	Info_ClearChoices(dia_orlan_hotelzimmer);
};

func void dia_orlan_hotelzimmer_nein()
{
	AI_Output(other,self,"DIA_Orlan_HotelZimmer_nein_15_00");	//���� ������, ��� ������-��!
	AI_Output(self,other,"DIA_Orlan_HotelZimmer_nein_05_01");	//����� �������� �������� ������ � ������ �����, ������.
	Info_ClearChoices(dia_orlan_hotelzimmer);
};


var int orlan_angriffwegenmiete;

instance DIA_ORLAN_MIETEFAELLIG(C_INFO)
{
	npc = bau_970_orlan;
	nr = 10;
	condition = dia_orlan_mietefaellig_condition;
	information = dia_orlan_mietefaellig_info;
	important = TRUE;
	permanent = TRUE;
};


var int dia_orlan_mietefaellig_nomore;

func int dia_orlan_mietefaellig_condition()
{
	if((ORLAN_ANGRIFFWEGENMIETE == TRUE) && (DIA_ORLAN_MIETEFAELLIG_NOMORE == FALSE))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			return FALSE;
		};
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
		{
			ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
			ORLAN_ANGRIFFWEGENMIETE = FALSE;
			return FALSE;
		};
	};
	if((ORLAN_SCGOTHOTELZIMMER == TRUE) && (ORLAN_SCGOTHOTELZIMMERDAY <= (Wld_GetDay() - 7)) && (DIA_ORLAN_MIETEFAELLIG_NOMORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orlan_mietefaellig_info()
{
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_00");	//(����������) � ����� ��� ������ ������ �����. ��������� �����, ������� ���������. ��� ����� ��� ����.
		DIA_ORLAN_MIETEFAELLIG_NOMORE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_05_01");	//����� �, �������, ������ ��� �����?
		Info_ClearChoices(dia_orlan_mietefaellig);
		Info_AddChoice(dia_orlan_mietefaellig,"������ �� ����. � ������ �� ���� ������� ����.",dia_orlan_mietefaellig_nein);
		Info_AddChoice(dia_orlan_mietefaellig,"��� ���� 50 �����.",dia_orlan_mietefaellig_ja);
	};
};


var int dia_orlan_mietefaellig_onetime;

func void dia_orlan_mietefaellig_ja()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_00");	//��� ���� 50 �����.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_01");	//��� ��� �������.
		if(DIA_ORLAN_MIETEFAELLIG_ONETIME == FALSE)
		{
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_02");	//��� �� ������ ���� ����?
			AI_Output(other,self,"DIA_Orlan_MieteFaellig_ja_15_03");	//���� ����� �� �����.
			AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_04");	//����. ��, ��. ���, � �����-��, �� ��� ����.
			DIA_ORLAN_MIETEFAELLIG_ONETIME = TRUE;
		};
		ORLAN_SCGOTHOTELZIMMERDAY = Wld_GetDay();
		Info_ClearChoices(dia_orlan_mietefaellig);
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_MieteFaellig_ja_05_05");	//�� ���, ��������� ������ ����? � ���� ���� ��� �����, ����� ��������� �� ���. � ������ ����, �� ��...
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	};
};

func void dia_orlan_mietefaellig_nein()
{
	AI_Output(other,self,"DIA_Orlan_MieteFaellig_nein_15_00");	//������ �� ����. � ������ �� ���� ������� ����.
	AI_Output(self,other,"DIA_Orlan_MieteFaellig_nein_05_01");	//����� ��� �������� �������� ����. ���������� �����!
	ORLAN_ANGRIFFWEGENMIETE = TRUE;
	Info_ClearChoices(dia_orlan_mietefaellig);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ORLAN_WETTKAMPFLAEUFT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 7;
	condition = dia_orlan_wettkampflaeuft_condition;
	information = dia_orlan_wettkampflaeuft_info;
	important = TRUE;
};


func int dia_orlan_wettkampflaeuft_condition()
{
	if((DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == TRUE) && (MIS_RUKHAR_WETTKAMPF_DAY <= (Wld_GetDay() - 2)))
	{
		return TRUE;
	};
};

func void dia_orlan_wettkampflaeuft_info()
{
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_00");	//��� �� ���, �������. � ���� ����.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_01");	//��� ���������?
	AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_02");	//���������� '��� ���� ��������' �������-�� �����������.
	AI_Output(other,self,"DIA_Orlan_WETTKAMPFLAEUFT_15_03");	//��� �������?
	if((Mob_HasItems("CHEST_RUKHAR",itfo_booze) == FALSE) && (Mob_HasItems("CHEST_RUKHAR",itfo_water) == TRUE))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_04");	//�� ���� ��� ��������. ������ ����� �� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_05");	//��� ������ ����� ������ ��������� � �������. ����� ��������� �������.
		RUKHAR_WON_WETTKAMPF = TRUE;
	};
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Orlan_WETTKAMPFLAEUFT_05_06");	//� �������, ��� ���� � ��������� ���. � �� ����, ����� �������� ����������� � ���� ����. ������ ��� � ���� �� ����.
	};
	b_giveplayerxp(XP_RUKHAR_WETTKAMPFVORBEI);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(randolph,"Start");
	if(Hlp_IsValidNpc(rukhar))
	{
		if(RUKHAR_WON_WETTKAMPF == TRUE)
		{
			b_startotherroutine(rukhar,"WettkampfRukharWon");
		}
		else
		{
			b_startotherroutine(rukhar,"WettkampfRukharLost");
		};
	};
	MIS_RUKHAR_WETTKAMPF = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORLAN_EINGEBROCKT(C_INFO)
{
	npc = bau_970_orlan;
	nr = 8;
	condition = dia_orlan_eingebrockt_condition;
	information = dia_orlan_eingebrockt_info;
	important = TRUE;
};


func int dia_orlan_eingebrockt_condition()
{
	if((DIA_RANDOLPH_ICHGEBEDIRGELD_NOPERM == TRUE) && (MIS_RUKHAR_WETTKAMPF == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_orlan_eingebrockt_info()
{
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_00");	//�� ��, �������� �� ��� �������. ������ ��� ����� ���� ������������ � �������.
	AI_Output(other,self,"DIA_Orlan_EINGEBROCKT_15_01");	//������?
	AI_Output(self,other,"DIA_Orlan_EINGEBROCKT_05_02");	//���� �� ���������� ����� ��� ���� ����������, �����, ����� ����� ����������� �� ���� � ���. ��� ����� ��� �������, ���������?
};


instance DIA_ORLAN_PERM(C_INFO)
{
	npc = bau_970_orlan;
	nr = 99;
	condition = dia_orlan_perm_condition;
	information = dia_orlan_perm_info;
	permanent = TRUE;
	description = "��� ���� � �������?";
};


func int dia_orlan_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_perm_info()
{
	AI_Output(other,self,"DIA_Orlan_Perm_15_00");	//��� ���� � �������?
	if(KAPITEL <= 2)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_01");	//������ � �����.
		AI_Output(self,other,"DIA_Orlan_Perm_05_02");	//���� ����� �� ��� ������ ����������� ���� ��������, ��� ��� ���� ������.
	}
	else if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Orlan_Perm_05_03");	//�������, ��� ������ ���� ����� �����, �����, �����, ��� �������� ������� �������.
		AI_Output(self,other,"DIA_Orlan_Perm_05_04");	//����� ����� �� ������������ ������ ����������� ����.
	};
};


instance DIA_ORLAN_MINENANTEIL(C_INFO)
{
	npc = bau_970_orlan;
	nr = 3;
	condition = dia_orlan_minenanteil_condition;
	information = dia_orlan_minenanteil_info;
	description = "�� �������� �����?";
};


func int dia_orlan_minenanteil_condition()
{
	if((hero.guild == GIL_KDF) && (MIS_SERPENTES_MINENANTEIL_KDF == LOG_RUNNING) && Npc_KnowsInfo(other,dia_orlan_werbistdu))
	{
		return TRUE;
	};
};

func void dia_orlan_minenanteil_info()
{
	AI_Output(other,self,"DIA_Orlan_Minenanteil_15_00");	//�� �������� �����?
	AI_Output(self,other,"DIA_Orlan_Minenanteil_05_01");	//�������. �� ���� ������ ������, ���� ���� ���� ����������.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_ORLAN_PICKPOCKET(C_INFO)
{
	npc = bau_970_orlan;
	nr = 900;
	condition = dia_orlan_pickpocket_condition;
	information = dia_orlan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_orlan_pickpocket_condition()
{
	return c_beklauen(89,260);
};

func void dia_orlan_pickpocket_info()
{
	Info_ClearChoices(dia_orlan_pickpocket);
	Info_AddChoice(dia_orlan_pickpocket,DIALOG_BACK,dia_orlan_pickpocket_back);
	Info_AddChoice(dia_orlan_pickpocket,DIALOG_PICKPOCKET,dia_orlan_pickpocket_doit);
};

func void dia_orlan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_orlan_pickpocket);
};

func void dia_orlan_pickpocket_back()
{
	Info_ClearChoices(dia_orlan_pickpocket);
};

