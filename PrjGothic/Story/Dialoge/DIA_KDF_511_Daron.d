
func void b_daronsegen()
{
	var string concattext;
	var int bonus_1;
	var int bonus_2;
	var int bonus_3;
	DARON_SEGEN = TRUE;
	if(DARON_SPENDE < 100)
	{
		if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
			PrintScreen(PRINT_FULLYHEALED,-1,-1,FONT_SCREEN,2);
		};
	}
	else if((DARON_SPENDE < 250) && (bonus_1 == FALSE))
	{
		if(other.attribute[ATR_MANA] < other.attribute[ATR_MANA_MAX])
		{
			other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		};
		other.attribute[ATR_MANA_MAX] = other.attribute[ATR_MANA_MAX] + 2;
		concattext = ConcatStrings(PRINT_LEARNMANA_MAX,IntToString(2));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,1);
		bonus_1 = TRUE;
	}
	else if((DARON_SPENDE < 500) && (bonus_2 == FALSE))
	{
		b_giveplayerxp(XP_AMBIENT);
		bonus_2 = TRUE;
	}
	else if((DARON_SPENDE >= 750) && (DARON_SPENDE < 1000) && (bonus_3 == FALSE))
	{
		other.lp = other.lp + 1;
		concattext = ConcatStrings(PRINT_LEARNLP,IntToString(1));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,1);
		bonus_3 = TRUE;
	}
	else
	{
		if(other.attribute[ATR_HITPOINTS] < other.attribute[ATR_HITPOINTS_MAX])
		{
			other.attribute[ATR_HITPOINTS] = other.attribute[ATR_HITPOINTS_MAX];
		};
		if(other.attribute[ATR_MANA] < other.attribute[ATR_MANA_MAX])
		{
			other.attribute[ATR_MANA] = other.attribute[ATR_MANA_MAX];
		};
		other.attribute[ATR_HITPOINTS_MAX] = other.attribute[ATR_HITPOINTS_MAX] + 5;
		concattext = ConcatStrings(PRINT_LEARNHITPOINTS_MAX,IntToString(5));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,1);
	};
};


instance DIA_DARON_EXIT(C_INFO)
{
	npc = kdf_511_daron;
	nr = 999;
	condition = dia_daron_exit_condition;
	information = dia_daron_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_daron_exit_condition()
{
	return TRUE;
};

func void dia_daron_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DARON_HALLO(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_hallo_condition;
	information = dia_daron_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_daron_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_hallo_info()
{
	AI_Output(self,other,"DIA_Daron_Hallo_10_00");	//��� � ���� ������� ��� ����? �� ����� ��������� ��������?
	AI_Output(self,other,"DIA_Daron_Hallo_10_01");	//�� ������ ���������� ������ ������� ������, ���, �����, ������ ������������ ������ ��� ������?
};


instance DIA_DARON_PALADINE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_paladine_condition;
	information = dia_daron_paladine_info;
	permanent = FALSE;
	description = "��� ����� ���������� � ����������. �� ������ ������ ��� � ����?";
};


func int dia_daron_paladine_condition()
{
	if((other.guild != GIL_KDF) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_daron_paladine_info()
{
	AI_Output(other,self,"DIA_Daron_Paladine_15_00");	//��� ����� ���������� � ����������. �� ������ ������ ��� � ����?
	AI_Output(self,other,"DIA_Daron_Paladine_10_01");	//��, ��� ����� �� ������ ����� ������ � ������� ������� ������. ������ ������� ���� ��������� ������ ��������� � ��������� ������.
	AI_Output(self,other,"DIA_Daron_Paladine_10_02");	//�� �, ������� ��, ���, ����� ����.
	AI_Output(other,self,"DIA_Daron_Paladine_15_03");	//��� � ���� ����� ����� ����?
	AI_Output(self,other,"DIA_Daron_Paladine_10_04");	//�� ������ �������� � ��� ����� � �������� ����������. � �� ���������� ���������� �������, ��������, �� ������ ������ � ���� �����.
	AI_Output(self,other,"DIA_Daron_Paladine_10_05");	//������, ���� ���� �����, ����� ������� ������ � ������������� ��������.
};


instance DIA_DARON_ABOUTSEGEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 2;
	condition = dia_daron_aboutsegen_condition;
	information = dia_daron_aboutsegen_info;
	permanent = FALSE;
	description = "� ������, ����� �������� ���� �������������!";
};


func int dia_daron_aboutsegen_condition()
{
	if((MIS_THORBEN_GETBLESSINGS == LOG_RUNNING) && (PLAYER_ISAPPRENTICE == APP_NONE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_aboutsegen_info()
{
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_00");	//� ������, ����� �������� ���� �������������!
	AI_Output(self,other,"DIA_Daron_AboutSegen_10_01");	//��� ������ - ����� ��, ��������, �������� ������������ ������ ������ ������ ������, ������?
	AI_Output(other,self,"DIA_Daron_AboutSegen_15_02");	//������-��, � ����� �������� ���� �������������, ����� ��������� � ������� � ������ �� �������� � ������ ����� ������...
	if(DARON_SEGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_03");	//�� � ��� ��� ���� ��� �������������, ��� ���.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_04");	//������ � �������, ��� ���!
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_05");	//��, ��� ���! ��� ��������� ������������� ������ � �� ������ ��� ���� ��������� ������������ ����.
		AI_Output(self,other,"DIA_Daron_AboutSegen_10_06");	//��� ��� ���� � ��������� � ����� ������ ���������� �� ��������� � ������ ������ ������?
	};
};


instance DIA_DARON_SPENDEN(C_INFO)
{
	npc = kdf_511_daron;
	nr = 3;
	condition = dia_daron_spenden_condition;
	information = dia_daron_spenden_info;
	permanent = FALSE;
	description = "� ����� ������������� ������ ��������� �����������?";
};


func int dia_daron_spenden_condition()
{
	if(hero.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_daron_spenden_info()
{
	AI_Output(other,self,"DIA_Daron_Spenden_15_00");	//� ����� ������������� ������ ��������� �����������?
	AI_Output(self,other,"DIA_Daron_Spenden_10_01");	//��, ��� ������� �� ����, ��� �� ������������. ����� ���������, ��� � ���� ����.
	AI_Output(self,other,"DIA_Daron_Spenden_10_02");	//(������� � ������� � ��������) �-�-� ���...
	if(Npc_HasItems(other,itmi_gold) < 10)
	{
		AI_Output(self,other,"DIA_Daron_Spenden_10_03");	//��, �� ���� ������, ��? ������ ���� �� ��������, ��� � ���� ����.
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"��� ���� ����� �� ����������� ����. ��� �������, ��� ��������, ��� � ������ ������������ ��� ������� ������. ��� ����� �� �� ����������� ����.");
		};
	}
	else
	{
		if(Npc_HasItems(other,itmi_gold) < 50)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_04");	//��, �� �� �����, �� � �� �����. 10 ������� ��� ������ - �� ����� �������� ������.
			b_giveinvitems(other,self,itmi_gold,10);
		}
		else if(Npc_HasItems(other,itmi_gold) < 100)
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_05");	//� ���� ������ 50 ������� �����. ��������� 25 ����� ������ � ������ ��� �������������.
			b_giveinvitems(other,self,itmi_gold,25);
		}
		else
		{
			AI_Output(self,other,"DIA_Daron_Spenden_10_06");	//� ���� ������ ��� ������� ����� - ������� �������: '������, ���� ������'.
			AI_Output(self,other,"DIA_Daron_Spenden_10_07");	//������� ������ ���� ������ ����������.
			b_giveinvitems(other,self,itmi_gold,50);
		};
		AI_Output(self,other,"DIA_Daron_Spenden_10_08");	//������������ ���� �� ����� ������. �� ����� � ���� ��� ���� � ��������������.
		DARON_SEGEN = TRUE;
		b_giveplayerxp(XP_INNOSSEGEN);
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"��� ���� ����� ����������� ����.");
		};
	};
};


instance DIA_DARON_WOHER(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_woher_condition;
	information = dia_daron_woher_info;
	permanent = FALSE;
	description = "������ ��?";
};


func int dia_daron_woher_condition()
{
	if((other.guild != GIL_KDF) && (other.guild != GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_daron_woher_info()
{
	AI_Output(other,self,"DIA_Daron_Woher_15_00");	//������ �� ������?
	AI_Output(self,other,"DIA_Daron_Woher_10_01");	//� ������ �� ��������� �����, ������������ � �����.
	if(other.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Daron_Woher_10_02");	//�� ��������� � ���� ����, ��� ���� ������� � ������� ������� ������� ������ ����������� ������� ������.
	};
};


instance DIA_DARON_INNOS(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_innos_condition;
	information = dia_daron_innos_info;
	permanent = FALSE;
	description = "�������� ��� �� ������.";
};


func int dia_daron_innos_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher) && (other.guild != GIL_KDF) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_daron_innos_info()
{
	AI_Output(other,self,"DIA_Daron_Innos_15_00");	//�������� ��� �� ������.
	AI_Output(self,other,"DIA_Daron_Innos_10_01");	//�����, ��� ���������� �������, - ��� ���� � �����.
	AI_Output(self,other,"DIA_Daron_Innos_10_02");	//�� ������� ����� � �������� ����������� ����� ���� �� �����. �� ���� �� ����� � ������.
	AI_Output(self,other,"DIA_Daron_Innos_10_03");	//�� ������� � ��������� �� ��� �����. �� ������������ ���������� �������� ��� ���� � ����������� ��� �����.
};


instance DIA_DARON_KLOSTER(C_INFO)
{
	npc = kdf_511_daron;
	nr = 9;
	condition = dia_daron_kloster_condition;
	information = dia_daron_kloster_info;
	permanent = FALSE;
	description = "�������� ��� ��������� � ���������.";
};


func int dia_daron_kloster_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher) || (Npc_KnowsInfo(other,dia_daron_paladine) && (other.guild != GIL_NOV) && (other.guild != GIL_KDF)))
	{
		return TRUE;
	};
};

func void dia_daron_kloster_info()
{
	AI_Output(other,self,"DIA_Daron_Kloster_15_00");	//�������� ��� ��������� � ���������.
	AI_Output(self,other,"DIA_Daron_Kloster_10_01");	//�� ������� ����� ��������� ���� ������ �����. �� ���� ����� ���� �� �������������� ������ ������.
	AI_Output(self,other,"DIA_Daron_Kloster_10_02");	//�� ����� ������ ����������� � ��������� ������� � �������� ���.
	AI_Output(self,other,"DIA_Daron_Kloster_10_03");	//��� �� ������ ������������ ����.
};


instance DIA_DARON_STADT(C_INFO)
{
	npc = kdf_511_daron;
	nr = 99;
	condition = dia_daron_stadt_condition;
	information = dia_daron_stadt_info;
	permanent = TRUE;
	description = "� ��� �� ������� � ������?";
};


func int dia_daron_stadt_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_woher))
	{
		return TRUE;
	};
};

func void dia_daron_stadt_info()
{
	AI_Output(other,self,"DIA_Daron_Stadt_15_00");	//� ��� �� ������� � ������?
	AI_Output(self,other,"DIA_Daron_Stadt_10_01");	//� ��������� ��������� � ����������� ������� ������ �������� � ����������� �������.
	AI_Output(self,other,"DIA_Daron_Stadt_10_02");	//� ��� ������� ������� ��� ���� ���� ����� ������ � �������� ������.
};


instance DIA_DARON_ARM(C_INFO)
{
	npc = kdf_511_daron;
	nr = 10;
	condition = dia_daron_arm_condition;
	information = dia_daron_arm_info;
	permanent = FALSE;
	description = "� ��� ��� ������!";
};


func int dia_daron_arm_condition()
{
	if(Npc_KnowsInfo(other,dia_daron_stadt) && (Npc_HasItems(other,itmi_gold) < 10) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_daron_arm_info()
{
	AI_Output(other,self,"DIA_Daron_arm_15_00");	//� ��� ��� ������!
	AI_Output(self,other,"DIA_Daron_arm_10_01");	//��, �� ������� �� ������. ��� ������������� � ��� ������� �������. ������ ��� ������, �������, ��� ������� ����.
	AI_Output(self,other,"DIA_Daron_arm_10_02");	//�� �� ������ ����� ���� ������, � ����� � ���� �� ����� ���������� � ������. � �� ������� ������������ ��� ������ ������ ������, ����� � ���, ��� ��� �������� ����.
	b_giveinvitems(self,other,itmi_gold,20);
};


instance DIA_DARON_SPENDE(C_INFO)
{
	npc = kdf_511_daron;
	nr = 800;
	condition = dia_daron_spende_condition;
	information = dia_daron_spende_info;
	permanent = TRUE;
	description = "� ���� ������� �������������...";
};


var int dia_daron_spende_permanent;

func int dia_daron_spende_condition()
{
	if(Npc_IsInState(self,zs_talk) && (DIA_DARON_SPENDE_PERMANENT == FALSE) && Npc_KnowsInfo(other,dia_daron_spenden) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_daron_spende_info()
{
	AI_Output(other,self,"DIA_Daron_Spende_15_00");	//� ���� ������� �������������...
	Info_ClearChoices(dia_daron_spende);
	if(DARON_SPENDE < 1000)
	{
		Info_AddChoice(dia_daron_spende,"�� � ���� ������������ ������... (�����)",dia_daron_spende_back);
		Info_AddChoice(dia_daron_spende,"(50  ������)",dia_daron_spende_50);
		Info_AddChoice(dia_daron_spende,"(100 ������)",dia_daron_spende_100);
		Info_AddChoice(dia_daron_spende,"(200 ������)",dia_daron_spende_200);
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_10_01");	//�� ��� ����������� ��� ����� 1000 ������� �����.
		AI_Output(self,other,"DIA_Daron_Spende_10_02");	//������������� ������ ������ �������� � �����.
		DIA_DARON_SPENDE_PERMANENT = TRUE;
		b_daronsegen();
	};
};

func void dia_daron_spende_back()
{
	AI_Output(other,self,"DIA_Daron_Spende_BACK_15_00");	//�� � ���� ������������ ������...
	AI_Output(self,other,"DIA_Daron_Spende_BACK_10_01");	//��� �� ����� ��������, ��� ���. �� ������ �������� ������������� �����.
	Info_ClearChoices(dia_daron_spende);
};


var int daron_spende;

func void dia_daron_spende_50()
{
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_00");	//������������ ���� �� ����� ������. �� ����� � ���� ��� ���� � ��������������.
		DARON_SPENDE = DARON_SPENDE + 50;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"��� ���� ����� ����������� ����.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_50_10_01");	//�� ������ ���������� ��������� ��� ���������, ���� � ���� ������ ������������ ������.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_100()
{
	if(b_giveinvitems(other,self,itmi_gold,100))
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_00");	//�����, �� ����, ��������� ���� �����������.
		AI_Output(self,other,"DIA_Daron_Spende_100_10_01");	//� ������������ ����� �������� �� ������ �����. �� ����� ���� ���� ����� ��� ��� �����.
		DARON_SPENDE = DARON_SPENDE + 100;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"��� ���� ����� ����������� ����.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_100_10_02");	//����� ������� - ���� ������ ��������, ������ ���� ����. � ���� �� ������ ������������, ������� ���� ���.
	};
	Info_ClearChoices(dia_daron_spende);
};

func void dia_daron_spende_200()
{
	if(b_giveinvitems(other,self,itmi_gold,200))
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_00");	//�����, ���������� ����� ��������. �� ����� ���� ���� ����� ��� ��� �����.
		AI_Output(self,other,"DIA_Daron_Spende_200_10_01");	//������ ��� ���� ���� ��������� ������.
		DARON_SPENDE = DARON_SPENDE + 200;
		b_daronsegen();
		DARON_SEGEN = TRUE;
		if(MIS_THORBEN_GETBLESSINGS == LOG_RUNNING)
		{
			b_logentry(TOPIC_THORBEN,"��� ���� ����� ����������� ����.");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Daron_Spende_200_10_02");	//���� �� ������ ������������ ������� ������, ��� � ���� ������ ���� �� ����.
	};
	Info_ClearChoices(dia_daron_spende);
};


instance DIA_DARON_PICKPOCKET(C_INFO)
{
	npc = kdf_511_daron;
	nr = 900;
	condition = dia_daron_pickpocket_condition;
	information = dia_daron_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_daron_pickpocket_condition()
{
	return c_beklauen(47,80);
};

func void dia_daron_pickpocket_info()
{
	Info_ClearChoices(dia_daron_pickpocket);
	Info_AddChoice(dia_daron_pickpocket,DIALOG_BACK,dia_daron_pickpocket_back);
	Info_AddChoice(dia_daron_pickpocket,DIALOG_PICKPOCKET,dia_daron_pickpocket_doit);
};

func void dia_daron_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_daron_pickpocket);
};

func void dia_daron_pickpocket_back()
{
	Info_ClearChoices(dia_daron_pickpocket);
};

