
instance DIA_LARES_KAP1_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap1_exit_condition;
	information = dia_lares_kap1_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap1_exit_condition()
{
	if(KAPITEL == 1)
	{
		return TRUE;
	};
};

func void dia_lares_kap1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_PICKPOCKET(C_INFO)
{
	npc = vlk_449_lares;
	nr = 900;
	condition = dia_lares_pickpocket_condition;
	information = dia_lares_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_lares_pickpocket_condition()
{
	return c_beklauen(95,350);
};

func void dia_lares_pickpocket_info()
{
	Info_ClearChoices(dia_lares_pickpocket);
	Info_AddChoice(dia_lares_pickpocket,DIALOG_BACK,dia_lares_pickpocket_back);
	Info_AddChoice(dia_lares_pickpocket,DIALOG_PICKPOCKET,dia_lares_pickpocket_doit);
};

func void dia_lares_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lares_pickpocket);
};

func void dia_lares_pickpocket_back()
{
	Info_ClearChoices(dia_lares_pickpocket);
};


instance DIA_LARES_HALLO(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_hallo_condition;
	information = dia_lares_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_hallo_condition()
{
	return TRUE;
};

func void dia_lares_hallo_info()
{
	AI_Output(self,other,"DIA_Lares_HALLO_09_00");	//�, ������ ����, ����� � ���! ��� �� ������� �����?
	if((MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE))
	{
		AI_Output(self,other,"DIA_Lares_HALLO_09_01");	//�� ���, ������� ����?
		AI_Output(self,other,"DIA_Lares_HALLO_09_02");	//(�������) ��� ������������ ������ �������� ������ � ��������� �����.
		b_giveplayerxp(500);
	};
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"�� ��� ����������� ������?",dia_lares_hallo_no);
	Info_AddChoice(dia_lares_hallo,"��, �����, ������ ��������! � ��� �� ����� ����?",dia_lares_hallo_yes);
};

func void dia_lares_hallo_no()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NO_15_00");	//�� ��� ����������� ������?
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_01");	//������, �� ���, �� ������� ����? �� ���� ������ � ����� ������.
	AI_Output(self,other,"DIA_Lares_HALLO_NO_09_02");	//�� ������ ��� � �����... ��, �� ������ ������������ ���. �� ������� ��?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"������� ��, � ����� ��!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"��?..",dia_lares_hallo_noidea);
};

func void dia_lares_hallo_yes()
{
	AI_Output(other,self,"DIA_Lares_HALLO_YES_15_00");	//��, �����, ������ ��������! � ��� �� ����� ����?
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_01");	//� ���� ��������� �� ������ �������� ������ � �� � ������� �������.
	AI_Output(self,other,"DIA_Lares_HALLO_YES_09_02");	//�� ���� ������� ��?
	Info_ClearChoices(dia_lares_hallo);
	Info_AddChoice(dia_lares_hallo,"������� ��, � ����� ��!",dia_lares_hallo_lee);
	Info_AddChoice(dia_lares_hallo,"��?..",dia_lares_hallo_noidea);
};

func void b_lares_aboutlee()
{
	AI_Output(self,other,"B_Lares_AboutLee_09_00");	//� �������� �� ������� ������ � ���. ����� ����� ����, ��� ������ ��� ���������.
	AI_Output(self,other,"B_Lares_AboutLee_09_01");	//�� � ��� ����� ������ �� ����� ��������� �����.
	AI_Output(self,other,"B_Lares_AboutLee_09_02");	//�� ����������� � ���� ��������. �� � ������� �������� �����, � ���� ������ �� �� ���.
};

func void dia_lares_hallo_lee()
{
	AI_Output(other,self,"DIA_Lares_HALLO_LEE_15_00");	//������� ��, � ����� ��!
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};

func void dia_lares_hallo_noidea()
{
	AI_Output(other,self,"DIA_Lares_HALLO_NOIDEA_15_00");	//��?..
	AI_Output(self,other,"DIA_Lares_HALLO_NOIDEA_09_01");	//����, ������, ������ �������� ��������. �� ��� ������������� ��������� � ����� ������.
	b_lares_aboutlee();
	Info_ClearChoices(dia_lares_hallo);
};


instance DIA_LARES_WHYINCITY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 2;
	condition = dia_lares_whyincity_condition;
	information = dia_lares_whyincity_info;
	permanent = FALSE;
	description = "� ������ �� �� � �� � ����������?";
};


func int dia_lares_whyincity_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lares_whyincity_info()
{
	AI_Output(other,self,"DIA_Lares_WhyInCity_15_00");	//� ������ �� �� � �� � ����������?
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_01");	//� � ����! ������ � ������ �� �� �����.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_02");	//����� �������, � �� �������� � ������. �� �� �����, ����� ������� ����� ��� ���.
	AI_Output(self,other,"DIA_Lares_WhyInCity_09_03");	//� ����� �� ������ � �����?
};


instance DIA_LARES_PALADINE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 3;
	condition = dia_lares_paladine_condition;
	information = dia_lares_paladine_info;
	permanent = FALSE;
	description = "��� �� ��� �� �� �� ����� ����� ���������� � ����������!";
};


func int dia_lares_paladine_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void dia_lares_paladine_info()
{
	AI_Output(other,self,"DIA_Lares_Paladine_15_00");	//��� �� ��� �� �� �� ����� ����� ���������� � ����������!
	AI_Output(self,other,"DIA_Lares_Paladine_09_01");	//��� ���� ����� �� ���?
	AI_Output(other,self,"DIA_Lares_Paladine_15_02");	//� ��� ���� ������, ���� ������. � ������ ���������� ���.
	AI_Output(self,other,"DIA_Lares_Paladine_09_03");	//� �� �������, ��� ������� ��� ����? ���� ������� �� ������� � ������� ������� ������.
	AI_Output(other,self,"DIA_Lares_Paladine_15_04");	//� ���-������ ��������.
	AI_Output(self,other,"DIA_Lares_Paladine_09_05");	//�������, ���� �� ������� �������� �������� ������� ��� ������� ��������� �� ���������� � ���������...
};


instance DIA_LARES_ALTERNATIVE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 4;
	condition = dia_lares_alternative_condition;
	information = dia_lares_alternative_info;
	permanent = FALSE;
	description = "� ���� ���� �����?";
};


func int dia_lares_alternative_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_paladine))
	{
		return TRUE;
	};
};

func void dia_lares_alternative_info()
{
	AI_Output(other,self,"DIA_Lares_Alternative_15_00");	//� ���� ���� �����?
	AI_Output(self,other,"DIA_Lares_Alternative_09_01");	//�� ����� ����� � �� ����� �� ����� ����� � ��������� � ��.
	AI_Output(self,other,"DIA_Lares_Alternative_09_02");	//� ������, �� ������ ������ ������� � ������� �������.
};


instance DIA_LARES_ABOUTSLD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 5;
	condition = dia_lares_aboutsld_condition;
	information = dia_lares_aboutsld_info;
	permanent = FALSE;
	description = "�������� ��� ��������� � ���������.";
};


func int dia_lares_aboutsld_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void dia_lares_aboutsld_info()
{
	AI_Output(other,self,"DIA_Lares_AboutSld_15_00");	//�������� ��� ��������� � ���������.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_01");	//��, ���� �� ��� �� �����, ��� ��� � ������, �� � ���� �� ������ ���������� ������� � ����.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_02");	//����������� �� ��� ��������� ����������, � ���� �� �� ������� ���� �� �����, �� ������ �� �� ������������.
	AI_Output(self,other,"DIA_Lares_AboutSld_09_03");	//(�������) ���� �� �������� ��������, � ���� �� ����� ������ �������������� � ���...
};


instance DIA_LARES_SCHIFF(C_INFO)
{
	npc = vlk_449_lares;
	nr = 6;
	condition = dia_lares_schiff_condition;
	information = dia_lares_schiff_info;
	permanent = FALSE;
	description = "� ����� ������� �� ��������?";
};


func int dia_lares_schiff_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity) && (schiffswache_213.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_schiff_info()
{
	AI_Output(other,self,"DIA_Lares_Schiff_15_00");	//� ����� ������� �� ��������?
	AI_Output(self,other,"DIA_Lares_Schiff_09_01");	//�� ����� � ������ �����, �� �������. �� � ����� ��� ����� ����� ����� �������� ������.
	AI_Output(self,other,"DIA_Lares_Schiff_09_02");	//�� ��� ����� ������ ��������� �����...
	AI_Output(other,self,"DIA_Lares_Schiff_15_03");	//������?
	AI_Output(self,other,"DIA_Lares_Schiff_09_04");	//���� ����� �������� �� ���� ��, ���� ��������� ���... � ���� ���� ����.
};


instance DIA_LARES_WEGZUMHOF(C_INFO)
{
	npc = vlk_449_lares;
	nr = 7;
	condition = dia_lares_wegzumhof_condition;
	information = dia_lares_wegzumhof_info;
	permanent = FALSE;
	description = "��� ��� ����� ����� ���������?";
};


func int dia_lares_wegzumhof_condition()
{
	if((other.guild == GIL_NONE) && Npc_KnowsInfo(other,dia_lares_whyincity))
	{
		return TRUE;
	};
};

func void dia_lares_wegzumhof_info()
{
	AI_Output(other,self,"DIA_Lares_WegZumHof_15_00");	//��� ��� ����� ����� ���������?
	AI_Output(self,other,"DIA_Lares_WegZumHof_09_01");	//� ���� ������� ���� ����, ���� ������. � ��� ����� ��� ������� ����� ����� ��������.
	AI_Output(self,other,"DIA_Lares_WegZumHof_09_02");	//��������� � ������ ������ �����, �� ��� �� �� ����� ��������� � �������� �� ����������...
};


instance DIA_LARES_WHYPALHERE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 8;
	condition = dia_lares_whypalhere_condition;
	information = dia_lares_whypalhere_info;
	permanent = FALSE;
	description = "�� ������, ����� �������� ������� ����?";
};


func int dia_lares_whypalhere_condition()
{
	if(KAPITEL <= 1)
	{
		return TRUE;
	};
};

func void dia_lares_whypalhere_info()
{
	AI_Output(other,self,"DIA_Lares_WhyPalHere_15_00");	//�� ������, ����� �������� ������� ����?
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_01");	//����� ����� �� ����� �����... ����������� ������, ��� ��-�� �����, �� ��� �������, ������� ������ � ������.
	AI_Output(self,other,"DIA_Lares_WhyPalHere_09_02");	//������ �����, ��� ����� ��������� � ������ �������.
};


instance DIA_LARES_GUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_lares_guildofthieves_condition;
	information = dia_lares_guildofthieves_info;
	permanent = FALSE;
	description = "�� ������ ���-������ � ��������� ������� �����?";
};


func int dia_lares_guildofthieves_condition()
{
	if(MIS_ANDRE_GUILDOFTHIEVES == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lares_guildofthieves_info()
{
	AI_Output(other,self,"DIA_Lares_GuildOfThieves_15_00");	//�� ������ ���-������ � ��������� ������� �����?
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_01");	//�� � ������� �� �������...
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_02");	//�������, ����� ���� ������� �����. ��� � � ����� ������� ������.
	AI_Output(self,other,"DIA_Lares_GuildOfThieves_09_03");	//� ������ �����-����� ������� ���, ��������, ���-�� ������ � ����.
};


instance DIA_LARES_WHEREGUILDOFTHIEVES(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_lares_whereguildofthieves_condition;
	information = dia_lares_whereguildofthieves_info;
	permanent = FALSE;
	description = "�� ������, ��� ��� ����� ������� �����?";
};


func int dia_lares_whereguildofthieves_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_guildofthieves) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_whereguildofthieves_info()
{
	AI_Output(other,self,"DIA_Lares_WhereGuildOfThieves_15_00");	//�� ������, ��� ��� ����� ������� �����?
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_01");	//(�������) �� ��������, �� ���� ���� �� ����, �� ������ ��.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_02");	//��� ���� ������ ����� ������ ��������� �� ����� ����.
	AI_Output(self,other,"DIA_Lares_WhereGuildOfThieves_09_03");	//���� �� ����������� ��������� � ����, ���� ����� ���� ������������.
};


instance DIA_LARES_GOTKEY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_lares_gotkey_condition;
	information = dia_lares_gotkey_info;
	permanent = FALSE;
	description = "� ����� ����� ���� ����. �� ���� ������� ������� �����...";
};


func int dia_lares_gotkey_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_whereguildofthieves) && Npc_HasItems(other,itke_thiefguildkey_mis) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_gotkey_info()
{
	AI_Output(other,self,"DIA_Lares_GotKey_15_00");	//� ����� ����� ���� ����. �� ���� ������� ������� �����...
	AI_Output(self,other,"DIA_Lares_GotKey_09_01");	//�?
	AI_Output(other,self,"DIA_Lares_GotKey_15_02");	//� �����, �� �������� ���� � ������ ��������� �������...
	AI_Output(self,other,"DIA_Lares_GotKey_09_03");	//��, ��� ����� ���� ���� �� �����������.
};


instance DIA_LARES_KANALISATION(C_INFO)
{
	npc = vlk_449_lares;
	nr = 9;
	condition = dia_lares_kanalisation_condition;
	information = dia_lares_kanalisation_info;
	permanent = FALSE;
	description = "��� ��� ����� �����������?";
};


func int dia_lares_kanalisation_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_gotkey) && (DG_GEFUNDEN == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_kanalisation_info()
{
	AI_Output(other,self,"DIA_Lares_Kanalisation_15_00");	//��� ��� ����� �����������?
	AI_Output(self,other,"DIA_Lares_Kanalisation_09_01");	//��������� � ����... ����������� ������ ������� � �����.
};


instance DIA_LARES_OTHERGUILD(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_otherguild_condition;
	information = dia_lares_otherguild_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_otherguild_condition()
{
	if(Npc_IsInState(self,zs_talk) && (other.guild != GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lares_otherguild_info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		if(other.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_00");	//������ �� � ���������!
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_01");	//(�������) �� ����� �������� ����� - ������ ��������� � ���������...
		}
		else
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_02");	//��� ������ �� ���� �� ��������� ������!
		};
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_03");	//(������) ������ �� ��� ���������� �����...
		if(Npc_KnowsInfo(other,dia_lares_whyincity))
		{
			AI_Output(self,other,"DIA_Lares_OtherGuild_09_04");	//(����������) �� ���� ������ �� ����������, ��� � ������� �� ��, ������?
			AI_Output(other,self,"DIA_Lares_OtherGuild_15_05");	//�� �� ������ ����...
		};
	};
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_06");	//� �� �������. �� �������� � ���������? ��� ��� ����?
		AI_Output(other,self,"DIA_Lares_OtherGuild_15_07");	//��-�������.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_08");	//�����������.
	};
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_09");	//� ������, �� ��� ������.
		AI_Output(self,other,"DIA_Lares_OtherGuild_09_10");	//����������.
	};
};


instance DIA_LARES_GONOW(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_gonow_condition;
	information = dia_lares_gonow_info;
	permanent = FALSE;
	description = "������, �����.";
};


func int dia_lares_gonow_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_wegzumhof) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_lares_gonow_info()
{
	AI_Output(other,self,"DIA_Lares_GoNow_15_00");	//������, �����.
	AI_Output(self,other,"DIA_Lares_GoNow_09_01");	//�����... ��� �� ����.
	AI_StopProcessInfos(self);
	LARES_GUIDE = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"GUIDE");
	if(Npc_KnowsInfo(other,dia_moe_hallo) == FALSE)
	{
		Npc_SetRefuseTalk(moe,30);
	};
};


instance DIA_LARES_GUIDE(C_INFO)
{
	npc = vlk_449_lares;
	nr = 1;
	condition = dia_lares_guide_condition;
	information = dia_lares_guide_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lares_guide_condition()
{
	if(Npc_KnowsInfo(other,dia_lares_gonow) && Hlp_StrCmp(Npc_GetNearestWP(self),"NW_TAVERNE_04"))
	{
		self.flags = 0;
		return TRUE;
	};
};

func void dia_lares_guide_info()
{
	if(LARES_GUIDE > (Wld_GetDay() - 2))
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_00");	//������.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_GUIDE_09_01");	//��� �� ���. � � �� ����� ������, ��� ���� �������� �����.
	};
	AI_Output(self,other,"DIA_Lares_GUIDE_09_02");	//��� �, ���������� ����� ���� �� ������� ������ ���. � ��� ����� ������������ � �����...
	AI_Output(self,other,"DIA_Lares_GUIDE_09_03");	//������ ������� �� ���� ������. �� ����� - ����� �������� �� ����, �� ������� ����� � ��� ����� � �������.
	AI_StopProcessInfos(self);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_LARES_DEX(C_INFO)
{
	npc = vlk_449_lares;
	nr = 10;
	condition = dia_lares_dex_condition;
	information = dia_lares_dex_info;
	permanent = FALSE;
	description = "�� ������ ������� ���� ����-������?";
};


func int dia_lares_dex_condition()
{
	return TRUE;
};

func void dia_lares_dex_info()
{
	AI_Output(other,self,"DIA_Lares_DEX_15_00");	//�� ������ ������� ���� ����-������?
	AI_Output(self,other,"DIA_Lares_DEX_09_01");	//�������. ���� ������, � ������ ���� ����� ����� ������.
	LARES_TEACHDEX = TRUE;
	Log_CreateTopic(TOPIC_CITYTEACHER,LOG_NOTE);
	b_logentry(TOPIC_CITYTEACHER,"����� ����� ������ ��� �������� ��� ��������.");
};


var int lares_merkedex;

instance DIA_LARES_TEACH(C_INFO)
{
	npc = vlk_449_lares;
	nr = 10;
	condition = dia_lares_teach_condition;
	information = dia_lares_teach_info;
	permanent = TRUE;
	description = "� ���� ����� ����� ������!";
};


func int dia_lares_teach_condition()
{
	if(LARES_TEACHDEX == TRUE)
	{
		return TRUE;
	};
};

func void dia_lares_teach_info()
{
	AI_Output(other,self,"DIA_Lares_TEACH_15_00");	//� ���� ����� ����� ������!
	LARES_MERKEDEX = other.attribute[ATR_DEXTERITY];
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
};

func void dia_lares_teach_back()
{
	if(other.attribute[ATR_DEXTERITY] > LARES_MERKEDEX)
	{
		AI_Output(self,other,"DIA_Lares_TEACH_BACK_09_00");	//�� ��� ���� ����� ������.
	};
	Info_ClearChoices(dia_lares_teach);
};

func void dia_lares_teach_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,30);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
};

func void dia_lares_teach_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,30);
	Info_ClearChoices(dia_lares_teach);
	Info_AddChoice(dia_lares_teach,DIALOG_BACK,dia_lares_teach_back);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_lares_teach_1);
	Info_AddChoice(dia_lares_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_lares_teach_5);
};


instance DIA_LARES_KAP2_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap2_exit_condition;
	information = dia_lares_kap2_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap2_exit_condition()
{
	if(KAPITEL == 2)
	{
		return TRUE;
	};
};

func void dia_lares_kap2_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KAP3_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap3_exit_condition;
	information = dia_lares_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lares_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_ANYNEWS(C_INFO)
{
	npc = vlk_449_lares;
	nr = 39;
	condition = dia_lares_anynews_condition;
	information = dia_lares_anynews_info;
	permanent = TRUE;
	description = "���� �������?";
};


func int dia_lares_anynews_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_lares_anynews_info()
{
	AI_Output(other,self,"DIA_Lares_AnyNews_15_00");	//���� �������?
	if(MIS_RESCUEBENNET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_01");	//�������� ������� ������� � �����. ������� ���������, � �� ������������ �� �����.
		AI_Output(self,other,"DIA_Lares_AnyNews_09_02");	//��� � ����, � �����, �� ����� ������������� ���� �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_AnyNews_09_03");	//����� ������� � ���. �������� ���������� �������, ������ �������.
		if(MIS_RESCUEBENNET == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_04");	//� ������. �������� ��� ����.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_05");	//��, �� ��� ��� ���������.
		}
		else
		{
			AI_Output(other,self,"DIA_Lares_AnyNews_15_06");	//��� ��� ���������?
			AI_Output(self,other,"DIA_Lares_AnyNews_09_07");	//������ ������ � ����� �� ���������. �� ��������� ��� ���� �� �������.
			AI_Output(self,other,"DIA_Lares_AnyNews_09_08");	//���� ������ ������ ������, ��������� �������, �� ��� � ������ ������ � ��������.
			MIS_RESCUEBENNET = LOG_RUNNING;
		};
	};
};


instance DIA_LARES_NEWSABOUTBENNET(C_INFO)
{
	npc = vlk_449_lares;
	nr = 38;
	condition = dia_lares_newsaboutbennet_condition;
	information = dia_lares_newsaboutbennet_info;
	permanent = FALSE;
	description = "���� ������� � �������?";
};


func int dia_lares_newsaboutbennet_condition()
{
	if(MIS_RESCUEBENNET == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_lares_newsaboutbennet_info()
{
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_00");	//���� ������� � �������?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_01");	//��� ����� � ������� � ������� ��� �� �������.
	AI_Output(other,self,"DIA_Lares_NewsAboutBennet_15_02");	//��� ��� ��������� ��� ������?
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_03");	//���� � ���� ��� ������� ����. � �� ���� ���������� � ��� ������ � ���������� � ���.
	AI_Output(self,other,"DIA_Lares_NewsAboutBennet_09_04");	//���, ��� ��� �������� - ��� ������� ���� �� �������, �����, ��� ������� ���-�� ������.
};


instance DIA_LARES_KAP4_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap4_exit_condition;
	information = dia_lares_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lares_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KAP4_PERM(C_INFO)
{
	npc = vlk_449_lares;
	nr = 49;
	condition = dia_lares_kap4_perm_condition;
	information = dia_lares_kap4_perm_info;
	permanent = TRUE;
	description = "������ �� �� ��������� �� ��������?";
};


func int dia_lares_kap4_perm_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_lares_kap4_perm_info()
{
	AI_Output(other,self,"DIA_Lares_Kap4_PERM_15_00");	//������ �� �� ��������� �� ��������?
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_01");	//��� �� �� ���. ����� ���� ���������� ������.
	AI_Output(self,other,"DIA_Lares_Kap4_PERM_09_02");	//��� ��, �������. ������ ������� ������ - ��� ���, ��� ��� ������ �����.
};


instance DIA_LARES_KAP5_EXIT(C_INFO)
{
	npc = vlk_449_lares;
	nr = 999;
	condition = dia_lares_kap5_exit_condition;
	information = dia_lares_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lares_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_lares_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LARES_KNOWWHEREENEMY(C_INFO)
{
	npc = vlk_449_lares;
	nr = 51;
	condition = dia_lares_knowwhereenemy_condition;
	information = dia_lares_knowwhereenemy_info;
	permanent = TRUE;
	description = "�� �� ������ �������� ���� ������?";
};


func int dia_lares_knowwhereenemy_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (LARES_ISONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_knowwhereenemy_info()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_00");	//�� �� ������ �������� ���� ������?
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_01");	//��� ����� ������� ��� �������. � ��� �� �������?
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_02");	//� �������, ��� ���������� ���������� ��������. �� �� �������, �������� ������.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_03");	//� ��������� ���������� �� ���� ��� � ��������.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_04");	//������ ���������. ���� � ���� �����, �� ������ �� ���� ������������.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_09_05");	//���� �� ����� ������� �������� ��� ��� ���������� ������� � ����� �����������?
	if(CREWMEMBER_COUNT >= MAX_CREW)
	{
		AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_15_06");	//������� ��� �����, �� � ������� � ����, ���� ���-�� ���������.
	}
	else
	{
		Info_ClearChoices(dia_lares_knowwhereenemy);
		Info_AddChoice(dia_lares_knowwhereenemy,"� ���� ���� �����������, �� �������� �������� ����.",dia_lares_knowwhereenemy_no);
		Info_AddChoice(dia_lares_knowwhereenemy,"� ����, ��� ���� ���������� �� ����.",dia_lares_knowwhereenemy_yes);
	};
};

func void dia_lares_knowwhereenemy_yes()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_00");	//� ����, ��� ���� ���������� �� ����.
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_Yes_15_01");	//���������� � �������.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_Yes_09_02");	//�� ������� �������� - ��� ��� ��������. �������� �����.
	b_giveplayerxp(XP_CREWMEMBER_SUCCESS);
	LARES_ISONBOARD = LOG_SUCCESS;
	CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
	if(MIS_READYFORCHAPTER6 == TRUE)
	{
		Npc_ExchangeRoutine(self,"SHIP");
	}
	else
	{
		Npc_ExchangeRoutine(self,"WAITFORSHIP");
	};
	Info_ClearChoices(dia_lares_knowwhereenemy);
};

func void dia_lares_knowwhereenemy_no()
{
	AI_Output(other,self,"DIA_Lares_KnowWhereEnemy_No_15_00");	//� ���� ���� �����������, �� �������� �������� ����.
	AI_Output(self,other,"DIA_Lares_KnowWhereEnemy_No_09_01");	//�� ������ ������, ��� �� ������. ���� �������� ��������� � ����� �������, �� ������, ��� ���� �����.
	if(hero.guild == GIL_DJG)
	{
		LARES_ISONBOARD = LOG_OBSOLETE;
	}
	else
	{
		LARES_ISONBOARD = LOG_FAILED;
	};
	Info_ClearChoices(dia_lares_knowwhereenemy);
};


instance DIA_LARES_LEAVEMYSHIP(C_INFO)
{
	npc = vlk_449_lares;
	nr = 51;
	condition = dia_lares_leavemyship_condition;
	information = dia_lares_leavemyship_info;
	permanent = TRUE;
	description = "����� �����, ���� �� �� ��������� �� ����.";
};


func int dia_lares_leavemyship_condition()
{
	if((LARES_ISONBOARD == LOG_SUCCESS) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_lares_leavemyship_info()
{
	AI_Output(other,self,"DIA_Lares_LeaveMyShip_15_00");	//����� �����, ���� �� �� ��������� �� ����.
	AI_Output(self,other,"DIA_Lares_LeaveMyShip_09_01");	//��� ������, �� � ������� �����, ��� �� �������� � ����.
	if(hero.guild == GIL_DJG)
	{
		LARES_ISONBOARD = LOG_OBSOLETE;
	}
	else
	{
		LARES_ISONBOARD = LOG_FAILED;
	};
	CREWMEMBER_COUNT = CREWMEMBER_COUNT - 1;
	Npc_ExchangeRoutine(self,"ShipOff");
};


instance DIA_LARES_STILLNEEDYOU(C_INFO)
{
	npc = vlk_449_lares;
	nr = 51;
	condition = dia_lares_stillneedyou_condition;
	information = dia_lares_stillneedyou_info;
	permanent = TRUE;
	description = "�� ��� ��� ������������� � ����� �� �������?";
};


func int dia_lares_stillneedyou_condition()
{
	if(((LARES_ISONBOARD == LOG_OBSOLETE) || (LARES_ISONBOARD == LOG_FAILED)) && (CREWMEMBER_COUNT < MAX_CREW))
	{
		return TRUE;
	};
};

func void dia_lares_stillneedyou_info()
{
	AI_Output(other,self,"DIA_Lares_StillNeedYou_15_00");	//�� ��� ��� ������������� � ����� �� �������?
	if(LARES_ISONBOARD == LOG_OBSOLETE)
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_01");	//������ � �� �������� ����� ��� ���������� �� ����, �� ��� ��� �� - ���� �� ���, �� ���� ��� � ���� �����.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_02");	//���������� �� �������.
		LARES_ISONBOARD = LOG_SUCCESS;
		CREWMEMBER_COUNT = CREWMEMBER_COUNT + 1;
		if(MIS_READYFORCHAPTER6 == TRUE)
		{
			Npc_ExchangeRoutine(self,"SHIP");
		}
		else
		{
			Npc_ExchangeRoutine(self,"WAITFORSHIP");
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_03");	//�� ��������, �� � �����, �� ��� ����.
		AI_Output(self,other,"DIA_Lares_StillNeedYou_09_04");	//��� ����� �������� �����.
		AI_StopProcessInfos(self);
	};
};

