
instance DIA_ROD_EXIT(C_INFO)
{
	npc = sld_804_rod;
	nr = 999;
	condition = dia_rod_exit_condition;
	information = dia_rod_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rod_exit_condition()
{
	return TRUE;
};

func void dia_rod_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ROD_HELLO(C_INFO)
{
	npc = sld_804_rod;
	nr = 1;
	condition = dia_rod_hello_condition;
	information = dia_rod_hello_info;
	permanent = FALSE;
	description = "��� ����?";
};


func int dia_rod_hello_condition()
{
	return TRUE;
};

func void dia_rod_hello_info()
{
	AI_Output(other,self,"DIA_Rod_Hello_15_00");	//��� ����?
	if(other.guild != GIL_SLD)
	{
		AI_Output(self,other,"DIA_Rod_Hello_06_01");	//��� ���� ����� �� ����, �����?
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_Rod_Hello_06_02");	//���, ��� ���� �� ������� ����� � ���������?
		};
	}
	else if(Wld_IsRaining())
	{
		B_Say(self,other,"$WEATHER");
	}
	else
	{
		B_Say(self,other,"$ABS_GOOD");
	};
};


var int rod_schwachgesagt;

instance DIA_ROD_WANNALEARN(C_INFO)
{
	npc = sld_804_rod;
	nr = 2;
	condition = dia_rod_wannalearn_condition;
	information = dia_rod_wannalearn_info;
	permanent = TRUE;
	description = "�� ������ ������� ���� �������� ��������� �������?";
};


func int dia_rod_wannalearn_condition()
{
	if(ROD_TEACH2H == FALSE)
	{
		return TRUE;
	};
};

func void dia_rod_wannalearn_info()
{
	AI_Output(other,self,"DIA_Rod_WannaLearn_15_00");	//�� ������ ������� ���� �������� ��������� �������?
	if((ROD_WETTEGEWONNEN == TRUE) || (self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_01");	//� �������� ����, �� ��� �� ��������, ��� � ������� �������.
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_02");	//� ��� �� � �����, � ���� �������� ���� ������ ��� ��������� �������.
		if(!Npc_HasItems(self,itmw_2h_rod))
		{
			AI_Output(self,other,"DIA_Rod_WannaLearn_06_03");	//��, ���� �� ������ ��� ����� ��� ���.
		}
		else
		{
			ROD_TEACH2H = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_04");	//��������, �������. ����� ������� ��������� �������, ����� �������� ���������� �����.
		AI_Output(self,other,"DIA_Rod_WannaLearn_06_05");	//������ �� ���� �� ����� �� �������� � �� �������� � ������� � ��������?
		ROD_SCHWACHGESAGT = TRUE;
	};
};


var int rod_merke_2h;

instance DIA_ROD_TEACH(C_INFO)
{
	npc = sld_804_rod;
	nr = 3;
	condition = dia_rod_teach_condition;
	information = dia_rod_teach_info;
	permanent = TRUE;
	description = "� ���� ��������� ����� ������� ��������� �������!";
};


func int dia_rod_teach_condition()
{
	if(ROD_TEACH2H == TRUE)
	{
		return TRUE;
	};
};

func void dia_rod_teach_info()
{
	AI_Output(other,self,"DIA_Rod_Teach_15_00");	//� ���� ��������� ����� ������� ��������� �������!
	ROD_MERKE_2H = other.hitchance[NPC_TALENT_2H];
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_rod_teach_2h_5);
};

func void dia_rod_teach_back()
{
	if(ROD_MERKE_2H < other.hitchance[NPC_TALENT_2H])
	{
		AI_Output(self,other,"DIA_Rod_Teach_BACK_06_00");	//�� ��� �������� �� �����.
	};
	Info_ClearChoices(dia_rod_teach);
};

func void dia_rod_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,30);
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_rod_teach_2h_5);
};

func void dia_rod_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,30);
	Info_ClearChoices(dia_rod_teach);
	Info_AddChoice(dia_rod_teach,DIALOG_BACK,dia_rod_teach_back);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_rod_teach_2h_1);
	Info_AddChoice(dia_rod_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_rod_teach_2h_5);
};


instance DIA_ROD_WANNAJOIN(C_INFO)
{
	npc = sld_804_rod;
	nr = 4;
	condition = dia_rod_wannajoin_condition;
	information = dia_rod_wannajoin_info;
	permanent = TRUE;
	description = "� ���� �������������� � ���������!";
};


func int dia_rod_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_rod_wannajoin_info()
{
	AI_Output(other,self,"DIA_Rod_WannaJoin_15_00");	//� ���� �������������� � ���������!
	if(!Npc_HasItems(self,itmw_2h_rod))
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_01");	//� ��� ������ ����, ����� ������� ������� ��� ��� ���, �?
	}
	else if((self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (ROD_WETTEGEWONNEN == TRUE))
	{
		if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_02");	//������. � �� ����� �����.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_03");	//�� ������ ���������, � ������ ��� ����� ��������.
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_04");	//����������� ������ ����� �� �������� �������� �� ������ ������ ����� ��������. �� ���������� � �����.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_WannaJoin_06_05");	//��, ��, � ���� �������� ���. ���������� �� ���������.
		};
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_06");	//���� ���� ��������� ��� ������, �� � �� ������.
		b_logentry(TOPIC_SLDRESPEKT,"� ������ ����� ����, ���� � ������ �������������� � ���������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_WannaJoin_06_07");	//� ��� ����� ��� ��������!
		ROD_SCHWACHGESAGT = TRUE;
	};
};


instance DIA_ROD_DUELL(C_INFO)
{
	npc = sld_804_rod;
	nr = 6;
	condition = dia_rod_duell_condition;
	information = dia_rod_duell_info;
	permanent = TRUE;
	description = "������, ��� ����� ������� ���� ������� �������, �� �� ������?";
};


func int dia_rod_duell_condition()
{
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		if((ROD_WETTEGEWONNEN == FALSE) && (ROD_SCHWACHGESAGT == TRUE))
		{
			return TRUE;
		};
		if(MIS_JARVIS_SLDKO == LOG_RUNNING)
		{
			return TRUE;
		};
	};
};

func void dia_rod_duell_info()
{
	AI_Output(other,self,"DIA_Rod_Duell_15_00");	//������, ��� ����� ������� ���� ������� �������, �� �� ������?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_01");	//�����, ��������!
	}
	else
	{
		AI_Output(self,other,"DIA_Rod_Duell_06_02");	//�� ������ �� �������!
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_ROD_STARKGENUG(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_starkgenug_condition;
	information = dia_rod_starkgenug_info;
	permanent = FALSE;
	description = "� ���������� �����!";
};


func int dia_rod_starkgenug_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && (ROD_SCHWACHGESAGT == TRUE))
	{
		return TRUE;
	};
};

func void dia_rod_starkgenug_info()
{
	AI_Output(other,self,"DIA_Rod_StarkGenug_15_00");	//� ���������� �����!
	AI_Output(self,other,"DIA_Rod_StarkGenug_06_01");	//����! �� ���� �� ���� ������� ��������� ��� ����� �����!
	Log_CreateTopic(TOPIC_RODWETTE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RODWETTE,LOG_RUNNING);
	b_logentry(TOPIC_RODWETTE,"������� ��� �� ������, ��� � ����� �������� ��� ���.");
};


instance DIA_ROD_BINSTARKGENUG(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_binstarkgenug_condition;
	information = dia_rod_binstarkgenug_info;
	permanent = FALSE;
	description = "� ������, � ���������� �����!";
};


func int dia_rod_binstarkgenug_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && Npc_KnowsInfo(other,dia_rod_starkgenug))
	{
		return TRUE;
	};
};

func void dia_rod_binstarkgenug_info()
{
	AI_Output(other,self,"DIA_Rod_BINStarkGenug_15_00");	//� ������, � ���������� �����!
	AI_Output(self,other,"DIA_Rod_BINStarkGenug_06_01");	//���, �� ���������� ��� ������! �������� ��������� ��������� ����?
};


var int rod_wettegewonnen;
var int rod_wetteangenommen;

instance DIA_ROD_WETTE(C_INFO)
{
	npc = sld_804_rod;
	nr = 5;
	condition = dia_rod_wette_condition;
	information = dia_rod_wette_info;
	permanent = TRUE;
	description = "����� ���������, ��� ����� �������� ���� ���!";
};


func int dia_rod_wette_condition()
{
	if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE) && Npc_KnowsInfo(other,dia_rod_binstarkgenug) && Npc_HasItems(self,itmw_2h_rod) && (ROD_WETTEANGENOMMEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_rod_wette_info()
{
	AI_Output(other,self,"DIA_Rod_Wette_15_00");	//����� ���������, ��� ����� �������� ���� ���!
	AI_Output(self,other,"DIA_Rod_Wette_06_01");	//�����? ���... (������) � ������� �� ��� � ���� �����?
	AI_Output(self,other,"DIA_Rod_Wette_06_02");	//��... �� ����� �� ������ �������. ������, ��� ����� 30 �����! � ���� ���� ���� �� �������?
	Info_ClearChoices(dia_rod_wette);
	Info_AddChoice(dia_rod_wette,"���.",dia_rod_wette_no);
	Info_AddChoice(dia_rod_wette,"�������.",dia_rod_wette_yes);
	b_logentry(TOPIC_RODWETTE,"��� ������ 30 ������� ����� �� ��, ��� � �� ����� �������� ��� ���.");
};

func void dia_rod_wette_no()
{
	AI_Output(other,self,"DIA_Rod_Wette_No_15_00");	//���.
	AI_Output(self,other,"DIA_Rod_Wette_No_06_01");	//��, ����� ����������.
	Info_ClearChoices(dia_rod_wette);
};

func void dia_rod_wette_yes()
{
	AI_Output(other,self,"DIA_Rod_Wette_Yes_15_00");	//�������.
	AI_Output(self,other,"DIA_Rod_Wette_Yes_06_01");	//������...
	if(b_giveinvitems(other,self,itmi_gold,30))
	{
		ROD_WETTEANGENOMMEN = TRUE;
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_02");	//���!
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_03");	//(��������) ������, ����� ���������, ��������� �� �����...
		b_giveinvitems(self,other,itmw_2h_rod,1);
		if(other.attribute[ATR_STRENGTH] >= 30)
		{
			if(Npc_HasReadiedMeleeWeapon(other) || Npc_HasReadiedRangedWeapon(other))
			{
				AI_RemoveWeapon(other);
			};
			AI_WaitTillEnd(other,self);
			CreateInvItem(other,ItMw_2h_Rod_Fake);
			AI_UseItem(other,ItMw_2h_Rod_Fake);
			AI_Wait(other,0.5);
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_04");	//��� ����������?!
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_05");	//(������ � �����) ������, �� ����� ����.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_06");	//� ����� �� ������ �� ���� ������. �� �� ����� �� ��������, ����������� ����� �����.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_07");	//��, ������, � ������ ��� ������� 30 ������� �����. �����.
			b_giveinvitems(self,other,itmi_gold,60);
			B_LogEntry(TOPIC_RODWETTE,"� ���� �������� ��� ����.");
			ROD_WETTEGEWONNEN = TRUE;
			b_giveplayerxp(XP_ROD);
		}
		else
		{
			AI_Output(other,self,"DIA_Rod_Wette_Yes_15_08");	//� �� ���� ������� ��� ������.
			AI_Output(self,other,"DIA_Rod_Wette_Yes_06_09");	//(�������) ��� � � �������!
			B_LogEntry(TOPIC_RODWETTE,"� �� ���� �������� ��� ����.");
		};
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_10");	//� ������, ����� ��� ��� ������ �����.
		Info_ClearChoices(dia_rod_wette);
		Info_AddChoice(dia_rod_wette,"�����, ��� ���...",dia_rod_wette_keepit);
		Info_AddChoice(dia_rod_wette,"���, �����.",dia_rod_wette_giveback);
	}
	else
	{
		AI_Output(other,self,"DIA_Rod_Wette_Yes_15_11");	//� ���� �� � ��� ���...
		AI_Output(self,other,"DIA_Rod_Wette_Yes_06_12");	//��. �����������, ����� � ���� ����� ���������� ������, ����� ������� ������.
		Info_ClearChoices(dia_rod_wette);
	};
};

func void dia_rod_wette_giveback()
{
	AI_Output(other,self,"DIA_Rod_Wette_GiveBack_15_00");	//���, �����.
	b_giveinvitems(other,self,itmw_2h_rod,1);
	AI_EquipBestMeleeWeapon(self);
	Info_ClearChoices(dia_rod_wette);
};

func void dia_rod_wette_keepit()
{
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_00");	//�����, ��� ���...
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_01");	//(���������) ��� ��� ������?
	AI_Output(other,self,"DIA_Rod_Wette_KeepIt_15_02");	//����� � ������� ��� � ���� �������.
	AI_Output(self,other,"DIA_Rod_Wette_GiveBack_06_01");	//�� �� ������ ������ ����� �����!
	AI_Output(self,other,"DIA_Rod_Wette_KeepIt_06_03");	//��, �������, �������!
	Info_ClearChoices(dia_rod_wette);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


var int rod_schwertxpgiven;

instance DIA_ROD_GIVEITBACK(C_INFO)
{
	npc = sld_804_rod;
	nr = 7;
	condition = dia_rod_giveitback_condition;
	information = dia_rod_giveitback_info;
	permanent = TRUE;
	description = "���, ����� ���� ���!";
};


func int dia_rod_giveitback_condition()
{
	if(Npc_HasItems(other,itmw_2h_rod))
	{
		return TRUE;
	};
};

func void dia_rod_giveitback_info()
{
	var C_Item ReadyWeap;
	if(Npc_HasReadiedMeleeWeapon(other))
	{
		ReadyWeap = Npc_GetReadiedWeapon(other);
		if(Hlp_IsItem(ReadyWeap,itmw_2h_rod))
		{
			AI_DropItem(other,itmw_2h_rod);
			AI_RemoveWeapon(other);
		};
	};
	b_giveinvitems(other,self,itmw_2h_rod,1);
	AI_Output(other,self,"DIA_Rod_GiveItBack_15_00");	//���, ����� ���� ���!
	AI_Output(self,other,"DIA_Rod_GiveItBack_06_01");	//�������!
	if(Hlp_IsItem(ReadyWeap,itmw_2h_rod))
	{
		AI_TakeItem(self,ReadyWeap);
	};
	AI_EquipBestMeleeWeapon(self);
	if(ROD_SCHWERTXPGIVEN == FALSE)
	{
		b_giveplayerxp(XP_AMBIENT);
		ROD_SCHWERTXPGIVEN = TRUE;
	};
};


instance DIA_ROD_PERM(C_INFO)
{
	npc = sld_804_rod;
	nr = 1;
	condition = dia_rod_perm_condition;
	information = dia_rod_perm_info;
	permanent = TRUE;
	description = "��� ����?";
};


func int dia_rod_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_rod_hello))
	{
		return TRUE;
	};
};

func void dia_rod_perm_info()
{
	AI_Output(other,self,"DIA_Rod_PERM_15_00");	//��� ����?
	if(KAPITEL <= 2)
	{
		if(other.guild == GIL_NONE)
		{
			if((self.aivar[AIV_DEFEATEDBYPLAYER] == FALSE) && (ROD_WETTEGEWONNEN == FALSE))
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_01");	//��� �� ���� ����, ������.
				ROD_SCHWACHGESAGT = TRUE;
			}
			else
			{
				AI_Output(self,other,"DIA_Rod_PERM_06_02");	//��� ���������, �������� �� ���� �������������� � ���.
			};
		}
		else if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_03");	//������ �� ���� �� ���, �����. ����� �� � ���� ���������.
		}
		else
		{
			AI_Output(self,other,"DIA_Rod_PERM_06_04");	//�� �� ��� �������. �������� �� �� ����� � ������ �����!
		};
	};
	if(KAPITEL >= 3)
	{
		AI_Output(self,other,"DIA_Rod_PERM_06_05");	//���� ��� ��� ������� � �������� ������������� ������, ��� ����� ������� ����� � ���������� ���� ������!
	};
};


instance DIA_RODSLD_PICKPOCKET(C_INFO)
{
	npc = sld_804_rod;
	nr = 900;
	condition = dia_rodsld_pickpocket_condition;
	information = dia_rodsld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_20;
};


func int dia_rodsld_pickpocket_condition()
{
	return c_beklauen(15,35);
};

func void dia_rodsld_pickpocket_info()
{
	Info_ClearChoices(dia_rodsld_pickpocket);
	Info_AddChoice(dia_rodsld_pickpocket,DIALOG_BACK,dia_rodsld_pickpocket_back);
	Info_AddChoice(dia_rodsld_pickpocket,DIALOG_PICKPOCKET,dia_rodsld_pickpocket_doit);
};

func void dia_rodsld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_rodsld_pickpocket);
};

func void dia_rodsld_pickpocket_back()
{
	Info_ClearChoices(dia_rodsld_pickpocket);
};

