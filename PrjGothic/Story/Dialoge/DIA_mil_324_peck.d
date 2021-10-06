
instance DIA_PECK_EXIT(C_INFO)
{
	npc = mil_324_peck;
	nr = 999;
	condition = dia_peck_exit_condition;
	information = dia_peck_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_peck_exit_condition()
{
	return TRUE;
};

func void dia_peck_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PECK_PICKPOCKET(C_INFO)
{
	npc = mil_324_peck;
	nr = 900;
	condition = dia_peck_pickpocket_condition;
	information = dia_peck_pickpocket_info;
	permanent = TRUE;
	description = "(�������� ���� ���� ����������)";
};


func int dia_peck_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_05) >= 1) && (other.attribute[ATR_DEXTERITY] >= (60 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_peck_pickpocket_info()
{
	Info_ClearChoices(dia_peck_pickpocket);
	Info_AddChoice(dia_peck_pickpocket,DIALOG_BACK,dia_peck_pickpocket_back);
	Info_AddChoice(dia_peck_pickpocket,DIALOG_PICKPOCKET,dia_peck_pickpocket_doit);
};

func void dia_peck_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		b_giveinvitems(self,other,itke_city_tower_05,1);
		b_givethiefxp();
		Info_ClearChoices(dia_peck_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_peck_pickpocket_back()
{
	Info_ClearChoices(dia_peck_pickpocket);
};


instance DIA_PECK_HEY(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_hey_condition;
	information = dia_peck_hey_info;
	permanent = TRUE;
	description = "��, �� ��� ������� ���?";
};


func int dia_peck_hey_condition()
{
	if((MIS_ANDRE_PECK != LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void dia_peck_hey_info()
{
	AI_Output(other,self,"DIA_Peck_HEY_15_00");	//��, �� ��� ������� ���?
	AI_Output(self,other,"DIA_Peck_HEY_12_01");	//��������, � �����. ������ ���� � �����.
	AI_StopProcessInfos(self);
};


instance DIA_PECK_FOUND_PECK(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_found_peck_condition;
	information = dia_peck_found_peck_info;
	permanent = FALSE;
	description = "��, ���� ���� ������������ �����.";
};


func int dia_peck_found_peck_condition()
{
	if((MIS_ANDRE_PECK == LOG_RUNNING) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void dia_peck_found_peck_info()
{
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_00");	//��, ���� ���� ������������ �����.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_01");	//��� ���� �����? �� ����� �� ������, � �����?
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_02");	//��� ����� ������, ��� ��� ����������� � �������.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_03");	//����, ���� ������ ����� ���������.
	AI_Output(other,self,"DIA_Peck_FOUND_PECK_15_04");	//�����, ����� ��� ���� ���� ����.
	AI_Output(self,other,"DIA_Peck_FOUND_PECK_12_05");	//����... ����. �����, � ��� ��� - �� ����� ������ ����������� �����, �� ������ ���, ��� � ��� �����.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STORAGE");
	Npc_ExchangeRoutine(vanja,"ALONE");
};


instance DIA_PECK_WEAPON(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_weapon_condition;
	information = dia_peck_weapon_info;
	permanent = TRUE;
	description = "� ������ �� �������.";
};


var int dia_peck_weapon_perm;

func int dia_peck_weapon_condition()
{
	if(Npc_KnowsInfo(other,dia_andre_found_peck) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (KAPITEL < 3) && (DIA_PECK_WEAPON_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_peck_weapon_info()
{
	AI_Output(other,self,"DIA_Peck_WEAPON_15_00");	//� ������ �� �������.
	if(MIS_ANDRE_PECK == LOG_RUNNING)
	{
		AI_Output(self,other,"DIA_Peck_WEAPON_12_01");	//������� ����� � ����� � ������ ���.
	}
	else
	{
		if(MIS_ANDRE_PECK == LOG_OBSOLETE)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_02");	//����������, ��� ������. ��� ����� ����. � ��� ����� ���.
			AI_Output(self,other,"DIA_Peck_WEAPON_12_03");	//�� �� ������ �����, ��� � ��� � ������� ������. ������, �� ���������� ������. ���, ����� ���� ���.
			AI_Output(self,other,"DIA_Peck_Add_12_00");	//��� ������, ��� � ���� ����.
			b_giveinvitems(self,hero,itmw_schwert1,1);
		}
		else if(MIS_ANDRE_PECK == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Peck_WEAPON_12_04");	//� �� ������ ���� �����. ��� ������ �����, ��� � ��� � ������� ������, �?
			AI_Output(self,other,"DIA_Peck_WEAPON_12_05");	//� ������ �� ������ �������� �� ���� ���... ������, �� �������� ���. ���. � ������ ����� � �����!
			b_giveinvitems(self,hero,itmw_1h_misc_sword,1);
		};
		DIA_PECK_WEAPON_PERM = TRUE;
		AI_Output(self,other,"DIA_Peck_WEAPON_12_06");	//���� ���� ����� ������ �������, ��� � ��������� �� �����.
	};
	AI_StopProcessInfos(self);
};

func void b_peck_leckmich()
{
	AI_Output(self,other,"DIA_Peck_Add_12_07");	//������� ��� �������!
};


instance DIA_PECK_WEAPON2(C_INFO)
{
	npc = mil_324_peck;
	nr = 2;
	condition = dia_peck_weapon2_condition;
	information = dia_peck_weapon2_info;
	permanent = TRUE;
	description = "� ���� ��� ������ ������� ��� ����?";
};


var int dia_peck_weapon2_perm;

func int dia_peck_weapon2_condition()
{
	if((other.guild == GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (ENTEROW_KAPITEL2 == TRUE) && (DIA_PECK_WEAPON_PERM == TRUE) && (DIA_PECK_WEAPON2_PERM == FALSE))
	{
		return TRUE;
	};
};

func void dia_peck_weapon2_info()
{
	AI_Output(other,self,"DIA_Peck_Add_15_01");	//� ���� ��� ������ ������� ��� ����?
	if(MIS_ANDRE_PECK == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_06");	//� �� �����, ��� �� ����� �� ���� ����� �����.
		b_peck_leckmich();
	}
	else if(KAPITEL < 3)
	{
		AI_Output(self,other,"DIA_Peck_Add_12_02");	//���� ���...
	}
	else
	{
		AI_Output(self,other,"DIA_Peck_Add_12_03");	//������, ��� �� �������. ��� ��������� ��������� ����� ������� ������� �� ��������� �����.
		AI_Output(self,other,"DIA_Peck_Add_12_04");	//��� �� ������ �� �����������. (������� ����)
		AI_Output(self,other,"DIA_Peck_Add_12_05");	//���, ������.
		b_giveinvitems(self,other,itmw_rubinklinge,1);
		DIA_PECK_WEAPON2_PERM = TRUE;
	};
};


instance DIA_PECK_PERM(C_INFO)
{
	npc = mil_324_peck;
	nr = 998;
	condition = dia_peck_perm_condition;
	information = dia_peck_perm_info;
	permanent = TRUE;
	description = "� ����� ��� � �������?";
};


func int dia_peck_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_peck_weapon) || ((other.guild != GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000)))
	{
		return TRUE;
	};
};

func void dia_peck_perm_info()
{
	AI_Output(other,self,"DIA_Peck_PERM_15_00");	//� ����� ��� � �������?
	if(MIS_ANDRE_PECK == LOG_SUCCESS)
	{
		b_peck_leckmich();
	}
	else if(KAPITEL != 3)
	{
		AI_Output(self,other,"DIA_Peck_PERM_12_01");	//��, � � �����?
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_02");	//�� ������. ���� ������� ��� ��������. � ���� �������, ��� ����� ���������� ���������� ������ ������ �� ������ �����.
				AI_Output(self,other,"DIA_Peck_PERM_12_03");	//��� ���-�� �� ����� ������� ��������� ������ ����� ������� ������.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_04");	//�������! �� ������ �� �����. ���� ����� ���� �������, ��� ����� ������������ �� ������� �������.
			}
			else
			{
				AI_Output(self,other,"DIA_Peck_PERM_12_05");	//� ����, ��� �� �������, �� � ���� �� ��������� ���� ������ � ���� �����������.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Peck_PERM_12_06");	//� ����� ���, ��� ��� ���� �� �������� ������ �������.
			AI_Output(other,self,"DIA_Peck_PERM_15_07");	//������?
			AI_Output(self,other,"DIA_Peck_PERM_12_08");	//�������� ������ ��� �� ��������� ��. ��� �� �� ����� ������ ����� ���� � �������� ��������� �� ���, ��� �� ������� ������ �� ���.
			AI_Output(self,other,"DIA_Peck_PERM_12_09");	//��� ���� ����� ������� �� �����. � ���� ������ �� ���� �� ���, � ���� ��� ����� ��������.
		};
	};
};

