
instance DIA_BENNET_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_exit_condition;
	information = dia_bennet_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_bennet_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_HALLO(C_INFO)
{
	npc = sld_809_bennet;
	nr = 1;
	condition = dia_bennet_hallo_condition;
	information = dia_bennet_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bennet_hallo_condition()
{
	if((KAPITEL < 3) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_bennet_hallo_info()
{
	AI_Output(self,other,"DIA_Bennet_HALLO_06_00");	//� �� ������ ������. ����� �������. �� ��������� � ���� �����.
	Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTRADER,"����� - �������� �������.");
};


instance DIA_BENNET_TRADE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 700;
	condition = dia_bennet_trade_condition;
	information = dia_bennet_trade_info;
	permanent = TRUE;
	description = "� ��� ������ ���������� �����������?";
	trade = TRUE;
};


func int dia_bennet_trade_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_trade_info()
{
	var int mcbolzenamount;
	var int mcarrowamount;
	AI_Output(other,self,"DIA_Bennet_TRADE_15_00");	//� ��� ������ ���������� �����������?
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itrw_bolt,Npc_HasItems(self,itrw_bolt));
	mcbolzenamount = KAPITEL * 50;
	CreateInvItems(self,itrw_bolt,mcbolzenamount);
	Npc_RemoveInvItems(self,itrw_arrow,Npc_HasItems(self,itrw_arrow));
	mcarrowamount = KAPITEL * 50;
	CreateInvItems(self,itrw_arrow,mcarrowamount);
	AI_Output(self,other,"DIA_Bennet_TRADE_06_01");	//��� ���� �����?
	if(BENNETLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_SOLDIERTRADER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTRADER,"������ ������� ��������� ����������.");
		BENNETLOG = TRUE;
	};
};


instance DIA_BENNET_WHICHWEAPONS(C_INFO)
{
	npc = sld_809_bennet;
	nr = 2;
	condition = dia_bennet_whichweapons_condition;
	information = dia_bennet_whichweapons_info;
	permanent = FALSE;
	description = "����� ������ �� �������?";
};


func int dia_bennet_whichweapons_condition()
{
	if(((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)) && (MIS_BENNET_BRINGORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_whichweapons_info()
{
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_00");	//����� ������ �� �������?
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_01");	//������ - ������� ����. ������ ������.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_02");	//�� ���� �� � ���� ���� ���������� ����, � ��� �� �������� ������, ������������� ����� ��� �� ������� �����.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_03");	//�� �������� �� ������, ��� ����� ��������� ����? (�������) ����� ��� � ������ ��������, � ���� � ����.
	AI_Output(other,self,"DIA_Bennet_WhichWeapons_15_04");	//���.
	AI_Output(self,other,"DIA_Bennet_WhichWeapons_06_05");	//������� ��, �� ������.
};


instance DIA_BENNET_BAUORSLD(C_INFO)
{
	npc = sld_809_bennet;
	nr = 3;
	condition = dia_bennet_bauorsld_condition;
	information = dia_bennet_bauorsld_info;
	permanent = FALSE;
	description = "�� � ��������� ��� � ����������?";
};


func int dia_bennet_bauorsld_condition()
{
	if((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_bauorsld_info()
{
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_00");	//�� � ��������� ��� � ����������?
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_01");	//�� �������� ���� ����, ��?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_02");	//��� ������ ���������.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_03");	//�� �����-������ ����� �������, ������� ����� �� ������?
	AI_Output(other,self,"DIA_Bennet_BauOrSld_15_04");	//���.
	AI_Output(self,other,"DIA_Bennet_BauOrSld_06_05");	//����� ����� �� ������� ����� ����� �������?
};


instance DIA_BENNET_WANNAJOIN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 4;
	condition = dia_bennet_wannajoin_condition;
	information = dia_bennet_wannajoin_info;
	permanent = TRUE;
	description = "� ���� �������������� � ���������!";
};


func int dia_bennet_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_bauorsld) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_bennet_wannajoin_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaJoin_15_00");	//� ���� �������������� � ���������!
	AI_Output(self,other,"DIA_Bennet_WannaJoin_06_01");	//����� ��������� ������� � ��� � �������. ����� �� ���� ���� ���������.
	if((MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS) || (MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_SUCCESS))
	{
		AI_Output(other,self,"DIA_Bennet_WannaJoin_15_02");	//� ������ ���������.
		AI_Output(self,other,"DIA_Bennet_WannaJoin_06_03");	//������, ����� � ���������� �� ����.
	};
};


instance DIA_BENNET_WANNASMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_wannasmith_condition;
	information = dia_bennet_wannasmith_info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ������ ����?";
};


func int dia_bennet_wannasmith_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) && (BENNET_TEACHCOMMON == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_wannasmith_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_15_00");	//�� ������ ������� ���� ������ ����?
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_01");	//�������.
	AI_Output(self,other,"DIA_Bennet_WannaSmith_06_02");	//�������, ��� ��������� ���� � ��������� �����. ������, 30 �������.
	Info_ClearChoices(dia_bennet_wannasmith);
	Info_AddChoice(dia_bennet_wannasmith,"��, ����� ����, �����.",dia_bennet_wannasmith_later);
	Info_AddChoice(dia_bennet_wannasmith,"�������. ��� ���� 30 �������.",dia_bennet_wannasmith_pay);
};

func void dia_bennet_wannasmith_pay()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Pay_15_00");	//�������. ��� ���� 30 �������.
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_01");	//������ �������, ��� ����� ������� ����! � ����� ���������� � ��������, ��� ������ �� ������ �����.
		BENNET_TEACHCOMMON = TRUE;
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"������ ����� ������� ���� ���������� ����.");
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmith_Pay_06_02");	//�� ���� ������� ���� �� ������. 30 ������� � �� ����� ������� ������.
	};
	Info_ClearChoices(dia_bennet_wannasmith);
};

func void dia_bennet_wannasmith_later()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmith_Later_15_00");	//��, ����� ����, �����.
	Info_ClearChoices(dia_bennet_wannasmith);
};


instance DIA_BENNET_TEACHCOMMON(C_INFO)
{
	npc = sld_809_bennet;
	nr = 6;
	condition = dia_bennet_teachcommon_condition;
	information = dia_bennet_teachcommon_info;
	permanent = TRUE;
	description = b_buildlearnstring("��������� ���������� ����",b_getlearncosttalent(other,NPC_TALENT_SMITH));
};


func int dia_bennet_teachcommon_condition()
{
	if((PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE) && (BENNET_TEACHCOMMON == TRUE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_teachcommon_info()
{
	AI_Output(other,self,"DIA_Bennet_TeachCOMMON_15_00");	//����� ���� ������ ����!
	if(b_teachplayertalentsmith(self,other,WEAPON_COMMON))
	{
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_01");	//��� �������� ������: ������ ����� ����� ����� � ������� ��� ��� �����, ���� �� �� ����������.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_02");	//����� ������� ��� �� ���������� � �������� ���� �����.
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_03");	//����� ������ - �����, ����� ����� �� ����� ������� ��������. � ���� ���� ����� ��������� ����� ��� ��������� ������...
		AI_Output(self,other,"DIA_Bennet_TeachCOMMON_06_04");	//� ���������� �� ��������� ��� - ��� ����� ���� ������ ��������.
	};
};


instance DIA_BENNET_WANNASMITHORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 7;
	condition = dia_bennet_wannasmithore_condition;
	information = dia_bennet_wannasmithore_info;
	permanent = TRUE;
	description = "����� ���� ������ ���������� ������!";
};


func int dia_bennet_wannasmithore_condition()
{
	if((BENNET_TEACHSMITH == FALSE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_wannasmithore_info()
{
	AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_00");	//����� ���� ������ ���������� ������!
	if(PLAYER_TALENT_SMITH[WEAPON_COMMON] == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_01");	//�� �� ���� �� ������ ����� ���������� ����.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_02");	//������� �� ������ ��������� ������ ������� ����. � ��� ���������.
	}
	else if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_03");	//���� �� �� ���� �� ���, ���� � �������, ���� ����� ���� �������� ������������ ����������� ������.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_04");	//������ �������� ������� ������� ���� ����������, � � �����, ���� ������� � ������ ������ �� ����� �� ����.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_05");	//� ��� ������. ����� ��� ��� ������� �� ��������� ������ ��������� �� ����������� ������.
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_06");	//������ �������. (����������) ������ ���� � ������ �� ����.
		};
	}
	else if(MIS_BENNET_BRINGORE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_07");	//���� �� � ���� ���� ���������� ����, � ��, ��������, ����������.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_08");	//��, �� �����. � � ����������, � � ���� ��������� ����. ��� ��� ���� �����?
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_09");	//����� ���, ��� ��������� � ������ ������ ���������� ������, �� ���� ���������� ����?
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_10");	//����...
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_11");	//��� ��� �����. ��� ����� ��� ������� 5 ������ ���� - ��� �� ������ ������ �� ����.
		if(MIS_BENNET_BRINGORE == FALSE)
		{
			MIS_BENNET_BRINGORE = LOG_RUNNING;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_12");	//�������, �� ������ ��� ����, � �� ����� ������, ��� ������ ������� ���.
		AI_Output(other,self,"DIA_Bennet_WannaSmithORE_15_13");	//��� ����� ��, ������ ����!
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_14");	//����� �������: �� �����, ������� ������ ���� ���, - �� ���������� ����, ��� �� ������ ������ ������� ��� �� ������ �����. ����������� - ������ ��� ����� ��������.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_15");	//� ��� ��� ��� ������� ���� ����� �������, ������ ������ �������� ��������� � ��������� ������ ����.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_16");	//�����������, ������ ������ ������� ������� ��� ���������� �����. ������ ����� ��������� � ����.
		AI_Output(self,other,"DIA_Bennet_WannaSmithORE_06_17");	//� ��� ��������� ������� �� ������, ������� �� ������ ��������.
		BENNET_TEACHSMITH = TRUE;
	};
};


instance DIA_BENNET_WHEREORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whereore_condition;
	information = dia_bennet_whereore_info;
	permanent = FALSE;
	description = "��� ��� ����� ���������� ����?";
};


func int dia_bennet_whereore_condition()
{
	if((MIS_BENNET_BRINGORE == LOG_RUNNING) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_whereore_info()
{
	AI_Output(other,self,"DIA_Bennet_WhereOre_15_00");	//��� ��� ����� ���������� ����?
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_01");	//��, ���� �� � ������ ���� ���. � �����, � ��������������� ������� �� ��������� ������� ���-������.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_02");	//��, ����� ����, ���� ������� � �� ������� ��������� ������ �������� ���-������ ����� � ������� ������� �� ��� ��������� ����� ����.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_03");	//��������� � ����, � ����� � ��� ������ ���� ����������� �����. �������� �������� ������� ���.
	AI_Output(self,other,"DIA_Bennet_WhereOre_06_04");	//�� ���� ���������: � ������, ��� �������� ������ �������.
};


instance DIA_BENNET_BRINGORE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 9;
	condition = dia_bennet_bringore_condition;
	information = dia_bennet_bringore_info;
	permanent = FALSE;
	description = "���, ����� - (5 ������ ����).";
};


func int dia_bennet_bringore_condition()
{
	if((MIS_BENNET_BRINGORE == LOG_RUNNING) && (Npc_HasItems(other,itmi_nugget) >= 5))
	{
		return TRUE;
	};
};

func void dia_bennet_bringore_info()
{
	AI_Output(other,self,"DIA_Bennet_BringOre_15_00");	//��� �����.
	AI_Output(self,other,"DIA_Bennet_BringOre_06_01");	//(�������) ������!
	b_giveinvitems(other,self,itmi_nugget,5);
	AI_Output(self,other,"DIA_Bennet_BringOre_06_02");	//�� �� ���! � ��������!
	AI_Output(self,other,"DIA_Bennet_BringOre_06_03");	//������ ���� ��� �����. ��� ���� �����������, ����� ������� ���� ����������� ������.
	b_giveinvitems(self,other,itmi_nugget,2);
	MIS_BENNET_BRINGORE = LOG_SUCCESS;
};


var int bennet_kap2smith;
var int bennet_kap3smith;
var int bennet_kap4smith;
var int bennet_kap5smith;

func void b_saybennetlater()
{
	AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_04");	//����� ������������. ������ �������.
};


instance DIA_BENNET_TEACHSMITH(C_INFO)
{
	npc = sld_809_bennet;
	nr = 30;
	condition = dia_bennet_teachsmith_condition;
	information = dia_bennet_teachsmith_info;
	permanent = TRUE;
	description = "� ���� ������ ������ � ���������� ������.";
};


func int dia_bennet_teachsmith_condition()
{
	if((BENNET_TEACHSMITH == TRUE) && ((KAPITEL != 3) || (MIS_RESCUEBENNET == LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_bennet_teachsmith_info()
{
	AI_Output(other,self,"DIA_Bennet_TeachSmith_15_00");	//� ���� ������ ������ � ���������� ������.
	if(KAPITEL == 1)
	{
		b_saybennetlater();
	}
	else if((KAPITEL == 2) && (BENNET_KAP2SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_01");	//� ���� ������� ���� ������ ���������� ���� � ���� ��������� ������.
		BENNET_KAP2SMITH = TRUE;
	}
	else if((KAPITEL == 3) && (MIS_READYFORCHAPTER4 == FALSE) && (BENNET_KAP3SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_02");	//� ������� ��������������, � ������ � ���� ������� ����, ��� ������ ���������� � ������� ��������� ���������� ����.
		BENNET_KAP3SMITH = TRUE;
	}
	else if((MIS_READYFORCHAPTER4 == TRUE) && (KAPITEL < 5) && (BENNET_KAP4SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_03");	//���� ��� ������ ����� ����. ��� ������, ��� � ���� ������ ������.
		BENNET_KAP4SMITH = TRUE;
	}
	else if((KAPITEL >= 5) && (BENNET_KAP5SMITH == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_04");	//��������. �� ���� ������ ��� �������� �����������. ���������� ������, �������� ������ �������. � � ����� ����, ��� ���������� ���!
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_05");	//(����������) � �� ������ ������?
		BENNET_KAP5SMITH = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_TeachSmith_06_06");	//����� ������ �� ����� �� ��������� ������?
	};
	Info_ClearChoices(dia_bennet_teachsmith);
	Info_AddChoice(dia_bennet_teachsmith,DIALOG_BACK,dia_bennet_teachsmith_back);
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] == FALSE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_1hspecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] == FALSE) && (KAPITEL >= 2))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_01,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_2hspecial1);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] == FALSE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_1hspecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] == FALSE) && (KAPITEL >= 3))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_02,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_2hspecial2);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] == FALSE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_1hspecial3);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] == FALSE) && (KAPITEL >= 4))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_03,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_2hspecial3);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] == FALSE) && (KAPITEL >= 5))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_1H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_1hspecial4);
	};
	if((PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] == FALSE) && (KAPITEL >= 5))
	{
		Info_AddChoice(dia_bennet_teachsmith,b_buildlearnstring(NAME_ITMW_2H_SPECIAL_04,b_getlearncosttalent(other,NPC_TALENT_SMITH)),dia_bennet_teachsmith_2hspecial4);
	};
};

func void dia_bennet_teachsmith_back()
{
	Info_ClearChoices(dia_bennet_teachsmith);
};

func void dia_bennet_teachsmith_1hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_01);
};

func void dia_bennet_teachsmith_2hspecial1()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_01);
};

func void dia_bennet_teachsmith_1hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_02);
};

func void dia_bennet_teachsmith_2hspecial2()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_02);
};

func void dia_bennet_teachsmith_1hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_03);
};

func void dia_bennet_teachsmith_2hspecial3()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_03);
};

func void dia_bennet_teachsmith_1hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_1H_SPECIAL_04);
};

func void dia_bennet_teachsmith_2hspecial4()
{
	b_teachplayertalentsmith(self,other,WEAPON_2H_SPECIAL_04);
};


instance DIA_BENNET_KAP3_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap3_exit_condition;
	information = dia_bennet_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_bennet_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_WHYPRISON(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whyprison_condition;
	information = dia_bennet_whyprison_info;
	permanent = FALSE;
	description = "��� �� ����� �� �������?";
};


func int dia_bennet_whyprison_condition()
{
	if((KAPITEL == 3) && (MIS_RESCUEBENNET != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_whyprison_info()
{
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_00");	//��� �� ����� �� �������?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_01");	//��� ������ �������� ���� � ������� ����. �������, ��� � ���� ��������.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_02");	//�� � �� ����� �����, ��� ����� ���������� ����.
	AI_Output(other,self,"DIA_Bennet_WhyPrison_15_03");	//����� �� �� ���?
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_04");	//������ ��� �����? �� ������ �������� ���� ������.
	AI_Output(self,other,"DIA_Bennet_WhyPrison_06_05");	//�������� � ������ �������, ������� �����... ��, � �� ����... ������ �� ���-������!
	MIS_RESCUEBENNET = LOG_RUNNING;
	Log_CreateTopic(TOPIC_RESCUEBENNET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEBENNET,LOG_RUNNING);
	b_logentry(TOPIC_RESCUEBENNET,"� ������� ��������� ��������. �� �� ��� �����, ����� ������ ��������� �� ������.");
};


instance DIA_BENNET_WHATHAPPENED(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_whathappened_condition;
	information = dia_bennet_whathappened_info;
	permanent = FALSE;
	description = "��� ���������?";
};


func int dia_bennet_whathappened_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_whathappened_info()
{
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_00");	//��� ���������?
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_01");	//� ����� � ������ ����� ������ � ��������, ����� ������ ���-��� ��� ����� ������.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_02");	//���������� �� �������� ������� ���� � ���� ����� ��������� ���.
	AI_Output(other,self,"DIA_Bennet_WhatHappened_15_03");	//����� � ����.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_04");	//�� ����� ������ - ���-�� ���������, � ��� ��� �� �������, ���� �������� ���.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_05");	//� �� ��������. � �����, ����� �� ��������� ����� ���������� ��� ������ �������, � ���������� � �������� ������.
	AI_Output(self,other,"DIA_Bennet_WhatHappened_06_06");	//� ������ ��� ������. ��������� ��� �� ���������� �� ���� � ������� �� �������.
};


instance DIA_BENNET_VICTIM(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_victim_condition;
	information = dia_bennet_victim_info;
	permanent = FALSE;
	description = "��� ��� ����?";
};


func int dia_bennet_victim_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_victim_info()
{
	AI_Output(other,self,"DIA_Bennet_Victim_15_00");	//��� ��� ����?
	AI_Output(self,other,"DIA_Bennet_Victim_06_01");	//������� �� ���� - ���� �� ���������, � �� ����, ���.
	AI_Output(other,self,"DIA_Bennet_Victim_15_02");	//�� ������ ���?
	AI_Output(self,other,"DIA_Bennet_Victim_06_03");	//�����-�� �����, ��-�����. ��, � �� ����, � �� ������.
	AI_Output(self,other,"DIA_Bennet_Victim_06_04");	//���� ����� �������� ����� ������, ��� �������� ��� ������.
	b_logentry(TOPIC_RESCUEBENNET,"�����, ���� �� ���������, ��� ����. ���� �����, ��������, ������ ���������� ��� ��������� �� ���� ����, ���� ������ �� ����� �������������.");
};


instance DIA_BENNET_EVIDENCE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_evidence_condition;
	information = dia_bennet_evidence_info;
	permanent = FALSE;
	description = "� ��� ���� �������������� ������ ����?";
};


func int dia_bennet_evidence_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_whyprison))
	{
		return TRUE;
	};
};

func void dia_bennet_evidence_info()
{
	AI_Output(other,self,"DIA_Bennet_Evidence_15_00");	//� ��� ���� �������������� ������ ����?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_01");	//�������, ���� ���������, ������� ������� ����.
	AI_Output(other,self,"DIA_Bennet_Evidence_15_02");	//�� ������, ��� ���� ���������?
	AI_Output(self,other,"DIA_Bennet_Evidence_06_03");	//���. � ���� ������, ��� �� ����.
	b_logentry(TOPIC_RESCUEBENNET,"���� ���������, ������������, ��� �����, ��� ��� ������ ������. � ������ ����� ����� ���������, ���� � ���� �������� ������.");
	RESCUEBENNET_KNOWSWITNESS = TRUE;
};


instance DIA_BENNET_INVESTIGATION(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_investigation_condition;
	information = dia_bennet_investigation_info;
	permanent = FALSE;
	description = "��� ����� �������������?";
};


func int dia_bennet_investigation_condition()
{
	if((MIS_RESCUEBENNET == LOG_RUNNING) && Npc_KnowsInfo(other,dia_bennet_evidence))
	{
		return TRUE;
	};
};

func void dia_bennet_investigation_info()
{
	AI_Output(other,self,"DIA_Bennet_Investigation_15_00");	//��� ����� �������������?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_01");	//��� ���� �����. ��� ��� ��� ���� ���� �� ���������, ��� ���� ��������� ��� ����� � ������� ���������.
	AI_Output(other,self,"DIA_Bennet_Investigation_15_02");	//��� ��� ��������?
	AI_Output(self,other,"DIA_Bennet_Investigation_06_03");	//��� ����� ������������. ���� ���� �� �������� ������, �� � ���� ������� ��� ������ ����������.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_04");	//�� ������ ������ ���, ��� �������� �����. �� �� �������� ��� ������ ���.
	AI_Output(self,other,"DIA_Bennet_Investigation_06_05");	//�� ��� ���������, ��� ��� ������.
};


instance DIA_BENNET_THANKYOU(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_thankyou_condition;
	information = dia_bennet_thankyou_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_bennet_thankyou_condition()
{
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_bennet_thankyou_info()
{
	if(hero.guild == GIL_SLD)
	{
		other.guild = GIL_DJG;
		Npc_SetTrueGuild(other,GIL_DJG);
	};
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_00");	//��, � � �� �����, ��� ���� ��������� �������!
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_01");	//��� �, � ����� ������, ��� ���������� ������.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_02");	//�� ��. �� �� ����� ��������� ���� �������, ������� �������� ����!
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_03");	//(�������) �� ��� ��� �������, ��� ���� �� ������� � �����.
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_04");	//��, ���� �� �����. � ���� ���� ���-��� ��� ����.
	AI_Output(other,self,"DIA_Bennet_ThankYou_15_05");	//��� �� ������ � ����?
	AI_Output(self,other,"DIA_Bennet_ThankYou_06_06");	//(����������) �������.
};


instance DIA_BENNET_PRESENT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_present_condition;
	information = dia_bennet_present_info;
	permanent = FALSE;
	description = "����� �������?";
};


func int dia_bennet_present_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_thankyou))
	{
		return TRUE;
	};
};

func void dia_bennet_present_info()
{
	AI_Output(other,self,"DIA_Bennet_Present_15_00");	//����� �������?
	AI_Output(self,other,"DIA_Bennet_Present_06_01");	//�� ��� ������� � ��������, ������� ����� �� ��������� � ������.
	AI_Output(other,self,"DIA_Bennet_Present_15_02");	//��� ������������� ���!
	AI_Output(self,other,"DIA_Bennet_Present_06_03");	//������, � ���� ����.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_04");	//��� �� ��� �� ����, ��������� �� ������ ������ ����������� � ������.
		AI_Output(self,other,"DIA_Bennet_Present_06_05");	//(����������) ��� ���������� ������� ��� �������.
		AI_Output(other,self,"DIA_Bennet_Present_15_06");	//� ����� ��� ����� ��������� �� ���?
		AI_Output(self,other,"DIA_Bennet_Present_06_07");	//(�����) � ���������� ����� ��� ��������. ������� �������� �� ��������!
		AI_Output(self,other,"DIA_Bennet_Present_06_08");	//��� ������� � �����, ��� ������������ �������.
		AI_Output(self,other,"DIA_Bennet_Present_06_09");	//��� ��� �� ���� ����, � ����, ����� �� ������� ������ ���������. ��� �������!
		CreateInvItems(self,itar_djg_l,1);
		b_giveinvitems(self,other,itar_djg_l,1);
		AI_Output(self,other,"DIA_Bennet_Present_06_10");	//� �������, ���, ��������, ���� ���� ��������� ������������ ���. ���� ����������� ������� ����������, ����� �� ����������� � ��� ������.
		AI_Output(self,other,"DIA_Bennet_Present_06_11");	//�����, ��� ��������� �������� �������. ��������� �������� �������. � ������ ������� ���� �� ���.
		AI_Output(other,self,"DIA_Bennet_Present_15_12");	//������� � ������ �� �������?
		b_say_gold(self,other,VALUE_DRAGONSCALE);
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_Present_06_13");	//�����, � �����, �� ��������� �������� ������������� � ����������� ����� �� ��������.
		AI_Output(other,self,"DIA_Bennet_Present_15_14");	//�?
		AI_Output(self,other,"DIA_Bennet_Present_06_15");	//���, ������ ���� ������. ���� �� ������, ��� ���.
		CreateInvItems(self,itam_hp_01,1);
		b_giveinvitems(self,other,itam_hp_01,1);
	};
};


var int bennet_dragonscale_counter;
var int show_djg_armor_m;

instance DIA_BENNET_DRAGONSCALE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_dragonscale_condition;
	information = dia_bennet_dragonscale_info;
	permanent = TRUE;
	description = "� ������ ���� ��������� ��������� ������.";
};


func int dia_bennet_dragonscale_condition()
{
	if((Npc_HasItems(other,itat_dragonscale) > 0) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_bennet_dragonscale_info()
{
	AI_Output(other,self,"DIA_Bennet_DragonScale_15_00");	//� ������ ���� ��������� ��������� ������.
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_01");	//��������� ����� �������!
	AI_Output(self,other,"DIA_Bennet_DragonScale_06_02");	//��� ���� ������!
	BENNET_DRAGONSCALE_COUNTER = BENNET_DRAGONSCALE_COUNTER + Npc_HasItems(other,itat_dragonscale);
	b_giveinvitems(self,other,itmi_gold,Npc_HasItems(other,itat_dragonscale) * VALUE_DRAGONSCALE);
	b_giveinvitems(other,self,itat_dragonscale,Npc_HasItems(other,itat_dragonscale));
	if((BENNET_DRAGONSCALE_COUNTER >= 20) && (SHOW_DJG_ARMOR_M == FALSE))
	{
		AI_Output(self,other,"DIA_Bennet_DragonScale_06_03");	//������, ����� ������ ���� ����������. � ���� ������� ���� �����, ���������� �������, ����, �������, ���� ��� ���������.
		SHOW_DJG_ARMOR_M = TRUE;
	};
};


var int bennet_dia_bennet_djg_armor_m_permanent;

instance DIA_BENNET_DJG_ARMOR_M(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_djg_armor_m_condition;
	information = dia_bennet_djg_armor_m_info;
	permanent = TRUE;
	description = "������� ������� �������� �� ��������: ������: ������ 80, ������ 80. (12000 ������)";
};


func int dia_bennet_djg_armor_m_condition()
{
	if((BENNET_DIA_BENNET_DJG_ARMOR_M_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && (SHOW_DJG_ARMOR_M == TRUE))
	{
		return TRUE;
	};
};

func void dia_bennet_djg_armor_m_info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_00");	//� ���� ������ �������.
	if(Npc_HasItems(other,itmi_gold) >= 12000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_01");	//����� ������. ������, ��� ���� �� ����������.
		AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_M_15_02");	//�� ��, �� �����-�� ����...
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_03");	//�� ��������, ��� ��� ����� ���� �����.
		b_giveinvitems(other,self,itmi_gold,12000);
		CreateInvItems(self,itar_djg_m,1);
		b_giveinvitems(self,other,itar_djg_m,1);
		BENNET_DIA_BENNET_DJG_ARMOR_M_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_M_06_04");	//� ���� ������������ ������.
	};
};


instance DIA_BENNET_BETTERARMOR(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_betterarmor_condition;
	information = dia_bennet_betterarmor_info;
	permanent = FALSE;
	description = "� ����, ��� ����� ��� �������� �������.";
};


func int dia_bennet_betterarmor_condition()
{
	if((PLAYERGETSFINALDJGARMOR == TRUE) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_bennet_betterarmor_info()
{
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_00");	//� ����, ��� ����� ��� �������� �������.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_01");	//(���������� ��� ����) �� �������� ���.
	AI_Output(other,self,"DIA_Bennet_BetterArmor_15_02");	//����� ������� �������� ������� ���������� �����.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_03");	//(�������) ��� ����� ��������� � �� ���. ��, �� ����.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_04");	//��� ����� ������� ����������� ���, ��� �� �����-���� �����. ��� ����� ������ � ����� �������.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_05");	//��� ����������.
	AI_Output(self,other,"DIA_Bennet_BetterArmor_06_06");	//�� ������ ������ ��, ���� ������. � �� ��������� �� �� ��� ����, � ���� ������-������ ��������� ��������� ������������.
};


var int bennet_dia_bennet_djg_armor_h_permanent;

instance DIA_BENNET_DJG_ARMOR_H(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_djg_armor_h_condition;
	information = dia_bennet_djg_armor_h_info;
	permanent = TRUE;
	description = "������� ������� �������� �� ��������: ������: ������ 90, ������ 90. (20000 ������)";
};


func int dia_bennet_djg_armor_h_condition()
{
	if((BENNET_DIA_BENNET_DJG_ARMOR_H_PERMANENT == FALSE) && (hero.guild == GIL_DJG) && Npc_KnowsInfo(other,dia_bennet_betterarmor))
	{
		return TRUE;
	};
};

func void dia_bennet_djg_armor_h_info()
{
	AI_Output(other,self,"DIA_Bennet_DJG_ARMOR_H_15_00");	//��� ��� �������.
	if(Npc_HasItems(other,itmi_gold) >= 20000)
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_01");	//��� ������ ������� �� ����, ��� � �����-���� �����.
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_02");	//��������� ������������ ���������.
		b_giveinvitems(other,self,itmi_gold,20000);
		CreateInvItems(self,itar_djg_h,1);
		b_giveinvitems(self,other,itar_djg_h,1);
		BENNET_DIA_BENNET_DJG_ARMOR_H_PERMANENT = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DJG_ARMOR_H_06_03");	//� ���� ������������ ������.
	};
};


instance DIA_BENNET_REPAIRNECKLACE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_repairnecklace_condition;
	information = dia_bennet_repairnecklace_info;
	permanent = FALSE;
	description = "�� ������ ������������� ��������� �������?";
};


func int dia_bennet_repairnecklace_condition()
{
	if((MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_bennet_repairnecklace_info()
{
	AI_Output(other,self,"DIA_Bennet_RepairNecklace_15_00");	//�� ������ ������������� ��������� �������?
	AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_01");	//����� ����. �� ������ ������� �������� ��� ��.
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_02");	//����� ��� ������� ����� ��������� ������.
		AI_Output(self,other,"DIA_Bennet_RepairNecklace_06_03");	//��� ����� � �� ����� ������ �������, ��� ��������.
	};
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BENNET_SHOWINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_showinnoseye_condition;
	information = dia_bennet_showinnoseye_info;
	permanent = FALSE;
	description = "�� ������ ��������� �� ���� ������?";
};


func int dia_bennet_showinnoseye_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_broken_mis) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_showinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_00");	//�� ������ ��������� �� ���� ������?
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_01");	//�������, ����� ���������.
	AI_PrintScreen(Print_InnoseyeGiven,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_02");	//����, ������������ ������. ������ �������. ��, �����, �������, � ����� �������� ��.
	AI_Output(other,self,"DIA_Bennet_ShowInnosEye_15_03");	//������� ��� ������ �������?
	if(MIS_RESCUEBENNET != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_04");	//��, � ������� ����� ����. ��� �� ���-�� ����� ������ �������?
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_05");	//���� �� � ��� � ����� �������, � ��� �� ������� ��� �� ���� ����. ��, ������� ��, ������� ��� ����� ��������� ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_06");	//���� �� �������� ��� ���, � ����������� ���� �� ����� ��� ���������.
		AI_Output(self,other,"DIA_Bennet_ShowInnosEye_06_07");	//� � ���� �� ������ � ���� ����� �� ��� ������. ���� ��� �� ������� ���� �� ������.
	};
	AI_PrintScreen(Print_InnosEyeGet,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
	b_logentry(TOPIC_INNOSEYE,"������ - ������, ������� ����� ���, ����� �������� ������.");
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
};


instance DIA_BENNET_GIVEINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_giveinnoseye_condition;
	information = dia_bennet_giveinnoseye_info;
	permanent = FALSE;
	description = "��� ������, ����������, ������ ���.";
};


func int dia_bennet_giveinnoseye_condition()
{
	if((Npc_HasItems(other,itmi_innoseye_broken_mis) >= 1) && (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE) && (MIS_RESCUEBENNET == LOG_SUCCESS) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_giveinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_GiveInnosEye_15_00");	//��� ������, ����������, ������ ���.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_01");	//������. � ������� ������ � ����������� ����.
	AI_Output(self,other,"DIA_Bennet_GiveInnosEye_06_02");	//������ ������, � �������� ���.
	Npc_RemoveInvItems(other,itmi_innoseye_broken_mis,1);
	AI_PrintScreen(PRINT_INNOSEYEGIVEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	BENNET_REPAIRDAY = Wld_GetDay();
};


instance DIA_BENNET_GETINNOSEYE(C_INFO)
{
	npc = sld_809_bennet;
	nr = 8;
	condition = dia_bennet_getinnoseye_condition;
	information = dia_bennet_getinnoseye_info;
	permanent = TRUE;
	description = "������ �����?";
};


func int dia_bennet_getinnoseye_condition()
{
	if(Npc_KnowsInfo(other,dia_bennet_giveinnoseye) && (MIS_BENNET_INNOSEYEREPAIREDSETTING != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_bennet_getinnoseye_info()
{
	AI_Output(other,self,"DIA_Bennet_GetInnosEye_15_00");	//������ �����?
	if(BENNET_REPAIRDAY < Wld_GetDay())
	{
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_01");	//��, �����.
		TEXT_INNOSEYE_SETTING = TEXT_INNOSEYE_SETTING_REPAIRED;
		CreateInvItems(other,itmi_innoseye_broken_mis,1);
		AI_PrintScreen(PRINT_INNOSEYEGET,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_02");	//��� �������� ������� ����� ������ ��� �����.
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_03");	//� ������� ��� ����, � ������ �� ��� ���������.
		b_logentry(TOPIC_INNOSEYE,"������ ����� ��� ���������. ������ �������� �������� ������.");
		MIS_BENNET_INNOSEYEREPAIREDSETTING = LOG_SUCCESS;
		b_giveplayerxp(XP_INNOSEYEISREPAIRED);
	}
	else
	{
		b_saybennetlater();
		AI_Output(self,other,"DIA_Bennet_GetInnosEye_06_05");	//���� �� ������ ���������� ������ ���, ��� ������ �������� ������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_BENNET_KAP4_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap4_exit_condition;
	information = dia_bennet_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_bennet_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_DRACHENEIER(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_dracheneier_condition;
	information = dia_bennet_dracheneier_info;
	permanent = TRUE;
	description = "�� ������ ���-������ ������� � ���������� ������?";
};


func int dia_bennet_dracheneier_condition()
{
	if((KAPITEL >= 4) && (BENNETSDRAGONEGGOFFER == 0) && (Npc_HasItems(other,itat_dragonegg_mis) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int bennetsdragoneggoffer;
var int dracheneier_angebotenxp_onetime;

func void dia_bennet_dracheneier_info()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_00");	//�� ������ ���-������ ������� � ���������� ������?
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_01");	//�������� ����? ���, ���� ������, ���� ������� ������ ��?
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_02");	//� ������ �� � �����-������.
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_03");	//����� ���������.
	};
	Npc_RemoveInvItems(other,itat_dragonegg_mis,1);
	AI_PrintScreen("���� ������",-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_04");	//���. ����� ������� ��������. �������� �������� ��� ��������. ���� ������ ������� ������� ��.
		AI_Output(other,self,"DIA_Bennet_DRACHENEIER_15_05");	//�� � ���? ��� ����� ����?
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_06");	//�������! ����� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_07");	//�� � ������� ��� �� ����������� ������� �� � ���� ����� �����? �� ������� �� ��� ���?
	};
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_06_08");	//� ������� ����, ���, ������, 300 ������� �� ������ ����, ��� �� ��������� ���.
	Info_ClearChoices(dia_bennet_dracheneier);
	Info_AddChoice(dia_bennet_dracheneier,"����� ������ �������� ������ ����. � ���� ���������� ��� ����.",dia_bennet_dracheneier_nein);
	Info_AddChoice(dia_bennet_dracheneier,"��� ���� �������, � �� �����-������ �������.",dia_bennet_dracheneier_mehr);
	Info_AddChoice(dia_bennet_dracheneier,"������������.",dia_bennet_dracheneier_ok);
	if(DRACHENEIER_ANGEBOTENXP_ONETIME == FALSE)
	{
		b_logentry(TOPIC_DRACHENEIER,"������ ����� ���� �� �������� ����, ������� �����, ������� ����.");
		b_giveplayerxp(XP_DJG_BRINGDRAGONEGG);
		DRACHENEIER_ANGEBOTENXP_ONETIME = TRUE;
	};
};

func void dia_bennet_dracheneier_ok()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_00");	//������������.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_01");	//�������.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_02");	//���� ������� ���, ���� �� ����.
	if(BENNETSDRAGONEGGOFFER != 350)
	{
		BENNETSDRAGONEGGOFFER = 300;
	};
	CreateInvItems(self,itmi_gold,BENNETSDRAGONEGGOFFER);
	b_giveinvitems(self,other,itmi_gold,BENNETSDRAGONEGGOFFER);
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_03");	//���. �� ������, ��� ������ �� � �����-������?
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_ok_15_04");	//�����.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_05");	//��������� � ����, ����-����� ������ ������� � �������.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_06");	//� �� ��������, ���� ���� ������� ����� ��� ���� � ������� ����������.
	b_logentry(TOPIC_DRACHENEIER,"������ ��������, ��� ��� ����� �������� ���� � ������� ��������. �� ������ �� ���, �� ������, ������ ��������������.");
	if(!Npc_HasItems(other,itwr_map_caves_mis))
	{
		if(!Npc_IsDead(Brahim))
		{
			AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_08");	//�� ������� �� ������ ����� ����� ����� � ���������� � ������. ����� ����, ���� �� ������� �� ��� ����.
			b_logentry(TOPIC_DRACHENEIER,"� ������ ������ ����� ����� � ���������� � ������, ����� ���� ���������, ��� � �� ������� ����� ���.");
		}
		else
		{
			AI_Output(self,other,"DIA_Bennet_DRACHENEIER_ok_06_07");	//���. ������ ��� �����. ��� ������� ���� ����� ������.
			CreateInvItems(self,itwr_map_caves_mis,1);
			b_giveinvitems(self,other,itwr_map_caves_mis,1);
			b_logentry(TOPIC_DRACHENEIER,"�� ��� ��� ����� �����, ��������, ��� ������� ���.");
		};
	};
	Info_ClearChoices(dia_bennet_dracheneier);
};

func void dia_bennet_dracheneier_mehr()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_mehr_15_00");	//��� ���� �������, � �� �����-������ �������.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_mehr_06_01");	//(�������) ������. 350 � �����. � �� ���� ���� ���� ������ - ����� ��� ���� �� ��������.
	BENNETSDRAGONEGGOFFER = 350;
};

func void dia_bennet_dracheneier_nein()
{
	AI_Output(other,self,"DIA_Bennet_DRACHENEIER_nein_15_00");	//����� ������ �������� ������ ����. � ���� ���������� ��� ����.
	AI_Output(self,other,"DIA_Bennet_DRACHENEIER_nein_06_01");	//��� ��� �����, ���� �����������.
	CreateInvItems(other,itat_dragonegg_mis,1);
	AI_PrintScreen("���� ��������",-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
	BENNETSDRAGONEGGOFFER = 0;
	Info_ClearChoices(dia_bennet_dracheneier);
};


instance DIA_BENNET_EIERBRINGEN(C_INFO)
{
	npc = sld_809_bennet;
	nr = 5;
	condition = dia_bennet_eierbringen_condition;
	information = dia_bennet_eierbringen_info;
	permanent = TRUE;
	description = "����� ��� �������� ����?";
};


func int dia_bennet_eierbringen_condition()
{
	if((BENNETSDRAGONEGGOFFER > 0) && (KAPITEL >= 4) && (Npc_HasItems(other,itat_dragonegg_mis) >= 1) && (hero.guild == GIL_DJG))
	{
		return TRUE;
	};
};


var int dragoneggcounter;

func void dia_bennet_eierbringen_info()
{
	var int dragoneggcount;
	var int xp_djg_bringdragoneggs;
	var int dragonegggeld;
	var string concattext;
	AI_Output(other,self,"DIA_Bennet_EierBringen_15_00");	//����� ��� �������� ����?
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_01");	//�������!
	dragoneggcount = Npc_HasItems(other,itat_dragonegg_mis);
	if(dragoneggcount == 1)
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_02");	//���. � ������ ��� ����.
		b_giveplayerxp(XP_DJG_BRINGDRAGONEGG);
		Npc_RemoveInvItems(other,itat_dragonegg_mis,1);
		AI_PrintScreen("���� ������",-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		DRAGONEGGCOUNTER = DRAGONEGGCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Bennet_EierBringen_15_03");	//� ������ ��� ���������.
		Npc_RemoveInvItems(other,itat_dragonegg_mis,dragoneggcount);
		concattext = ConcatStrings(IntToString(dragoneggcount),PRINT_ITEMSGEGEBEN);
		AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		xp_djg_bringdragoneggs = dragoneggcount * XP_DJG_BRINGDRAGONEGG;
		DRAGONEGGCOUNTER = DRAGONEGGCOUNTER + dragoneggcount;
		b_giveplayerxp(xp_djg_bringdragoneggs);
	};
	if(DRAGONEGGCOUNTER <= 7)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_04");	//�������. ����� ����. �� ����� ���������, �? ��������� ���-�� ������ ���� ���.
	}
	else if(DRAGONEGGCOUNTER <= 11)
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_05");	//��� �� �������� ��? ���� �� ���-������ ��� �������� ��� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Bennet_EierBringen_06_06");	//� �� �����, ��� �� ������� ��� ����. � ���� ��, ��� � ���� ����������. � ���� �� ����, ��� � ���� ������ �� ����� ����.
		TOPIC_END_DRACHENEIER = TRUE;
		b_checklog();
	};
	AI_Output(self,other,"DIA_Bennet_EierBringen_06_07");	//��, ������. ��� ���� ������.
	dragonegggeld = dragoneggcount * BENNETSDRAGONEGGOFFER;
	CreateInvItems(self,itmi_gold,dragonegggeld);
	b_giveinvitems(self,other,itmi_gold,dragonegggeld);
};


instance DIA_BENNET_KAP5_EXIT(C_INFO)
{
	npc = sld_809_bennet;
	nr = 999;
	condition = dia_bennet_kap5_exit_condition;
	information = dia_bennet_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bennet_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_bennet_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BENNET_KNOWWHEREENEMY(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_knowwhereenemy_condition;
	information = dia_bennet_knowwhereenemy_info;
	permanent = TRUE;
	description = "��� ����� ����� �� ������ ������. ��� �� ���������� ������.";
};


func int dia_bennet_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (BENNET_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_00");	//��� ����� ����� �� ������ ������. ��� �� ���������� ������.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_01");	//� �� ������� ��� ���?
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_02");	//��. ��� �������? �� ������� ����, �� ������� ��������� ������.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_03");	//��� �����, ��� �������� �� ����� �����. ������, ���� �� �����, ��� �����. �� ������ ������������ �� ����.
	Log_CreateTopic(TOPIC_CREW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CREW,LOG_RUNNING);
	b_logentry(TOPIC_CREW,"������ ����� ������������ ����������. ������ �� ���������������. � ������, ��� ����� ������� ��������� � ����.");
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_15_04");	//��� ������� ������ ��������� ��������������.
		AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_06_05");	//����� ����� ����-������ �� ���.
	}
	else
	{
		Info_ClearChoices(dia_bennet_knowwhereenemy);
		Info_AddChoice(dia_bennet_knowwhereenemy,"� ��� ���� �����, ����� �� ��� ������������.",dia_bennet_knowwhereenemy_no);
		Info_AddChoice(dia_bennet_knowwhereenemy,"���� ���� ��������. �������� � ������.",dia_bennet_knowwhereenemy_yes);
	};
};

func void dia_bennet_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_Yes_15_00");	//���� ���� ��������. �������� � ������.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_Yes_06_01");	//������. �������� �����.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	self.flags = NPC_FLAG_IMMORTAL;
	BENNET_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_bennet_knowwhereenemy);
};

func void dia_bennet_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Bennet_KnowWhereEnemy_No_15_00");	//� ��� ���� �����, ����� �� ��� ������������.
	AI_Output(self,other,"DIA_Bennet_KnowWhereEnemy_No_06_01");	//�������. � ���� �����.
	BENNET_ISONBOARD = LOG_OBSOLETE;
	Info_ClearChoices(dia_bennet_knowwhereenemy);
};


instance DIA_BENNET_LEAVEMYSHIP(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_leavemyship_condition;
	information = dia_bennet_leavemyship_info;
	permanent = TRUE;
	description = "� ���� ����� ���� ������� �������.";
};


func int dia_bennet_leavemyship_condition()
{
	if((BENNET_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_bennet_leavemyship_info()
{
	AI_Output(other,self,"DIA_Bennet_LeaveMyShip_15_00");	//� ���� ����� ���� ������� �������.
	AI_Output(self,other,"DIA_Bennet_LeaveMyShip_06_01");	//������ �� ������� ����, ����� ������ - ������. �� �� ��� �� ������������, �? ����� ������ ������ ������ � ���, ���� �� ������, ��� ��� �����.
	BENNET_ISONBOARD = LOG_OBSOLETE;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_BENNET_STILLNEEDYOU(C_INFO)
{
	npc = sld_809_bennet;
	nr = 55;
	condition = dia_bennet_stillneedyou_condition;
	information = dia_bennet_stillneedyou_info;
	permanent = TRUE;
	description = "�����������, � �� ���� ����� ������� �������.";
};


func int dia_bennet_stillneedyou_condition()
{
	if(((BENNET_ISONBOARD == LOG_OBSOLETE) || (BENNET_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_bennet_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Bennet_StillNeedYou_15_00");	//�����������, � �� ���� ����� ������� �������.
	AI_Output(self,other,"DIA_Bennet_StillNeedYou_06_01");	//(�������) ������! ������ ����� ���������� ��� ������� ��������! �������� � ������.
	self.flags = NPC_FLAG_IMMORTAL;
	BENNET_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	AI_StopProcessInfos(self);
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
};


instance DIA_BENNET_PICKPOCKET(C_INFO)
{
	npc = sld_809_bennet;
	nr = 900;
	condition = dia_bennet_pickpocket_condition;
	information = dia_bennet_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_bennet_pickpocket_condition()
{
	return c_beklauen(35,45);
};

func void dia_bennet_pickpocket_info()
{
	Info_ClearChoices(dia_bennet_pickpocket);
	Info_AddChoice(dia_bennet_pickpocket,DIALOG_BACK,dia_bennet_pickpocket_back);
	Info_AddChoice(dia_bennet_pickpocket,DIALOG_PICKPOCKET,dia_bennet_pickpocket_doit);
};

func void dia_bennet_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_bennet_pickpocket);
};

func void dia_bennet_pickpocket_back()
{
	Info_ClearChoices(dia_bennet_pickpocket);
};

