
instance DIA_RANGAR_EXIT(C_INFO)
{
	npc = mil_321_rangar;
	nr = 999;
	condition = dia_rangar_exit_condition;
	information = dia_rangar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_rangar_exit_condition()
{
	return TRUE;
};

func void dia_rangar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RANGAR_PICKPOCKET(C_INFO)
{
	npc = mil_321_rangar;
	nr = 900;
	condition = dia_rangar_pickpocket_condition;
	information = dia_rangar_pickpocket_info;
	permanent = TRUE;
	description = "(������� ���� ���� ����� �����)";
};


func int dia_rangar_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_02) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_rangar_pickpocket_info()
{
	Info_ClearChoices(dia_rangar_pickpocket);
	Info_AddChoice(dia_rangar_pickpocket,DIALOG_BACK,dia_rangar_pickpocket_back);
	Info_AddChoice(dia_rangar_pickpocket,DIALOG_PICKPOCKET,dia_rangar_pickpocket_doit);
};

func void dia_rangar_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_city_tower_02,1);
		b_givethiefxp();
		Info_ClearChoices(dia_rangar_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_rangar_pickpocket_back()
{
	Info_ClearChoices(dia_rangar_pickpocket);
};


instance DIA_RANGAR_HALLO(C_INFO)
{
	npc = mil_321_rangar;
	nr = 2;
	condition = dia_rangar_hallo_condition;
	information = dia_rangar_hallo_info;
	permanent = FALSE;
	description = "��, �� ��� ������� ���?";
};


func int dia_rangar_hallo_condition()
{
	return TRUE;
};

func void dia_rangar_hallo_info()
{
	AI_Output(other,self,"DIA_Rangar_Hallo_15_00");	//��, ��� ����?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_01");	//���� � ��������� ��� ������� ������� ��� ����, � ���� ������������ � ������ �����. � ��� ��� ������? (����������)
	AI_Output(other,self,"DIA_Rangar_Hallo_15_02");	//�� ��������� �� ���������?
	AI_Output(self,other,"DIA_Rangar_Hallo_07_03");	//��, � ���������� �� � �������� � ������. � ��������� ������ ��� ��������.
};


instance DIA_RANGAR_ORK(C_INFO)
{
	npc = mil_321_rangar;
	nr = 3;
	condition = dia_rangar_ork_condition;
	information = dia_rangar_ork_info;
	permanent = FALSE;
	description = "� ��� �������� � ������?";
};


func int dia_rangar_ork_condition()
{
	if(Npc_KnowsInfo(other,dia_rangar_hallo))
	{
		return TRUE;
	};
};

func void dia_rangar_ork_info()
{
	AI_Output(other,self,"DIA_Rangar_Ork_15_00");	//� ��� �������� � ������?
	AI_Output(self,other,"DIA_Rangar_Ork_07_01");	//��� ������ ��� ������������ - ��������� ������ � �������� ������ �������� ��� ���������.
	AI_Output(self,other,"DIA_Rangar_Ork_07_02");	//��� �������� ����� � ������ ���� ������ ���. �� �������� �� ����� � ��� �������. -��-
};


instance DIA_RANGAR_BIER(C_INFO)
{
	npc = mil_321_rangar;
	nr = 4;
	condition = dia_rangar_bier_condition;
	information = dia_rangar_bier_info;
	permanent = TRUE;
	description = "������ ��� ����?";
};


func int dia_rangar_bier_condition()
{
	if(Npc_KnowsInfo(other,dia_rangar_hallo))
	{
		return TRUE;
	};
};

func void dia_rangar_bier_info()
{
	AI_Output(other,self,"DIA_Rangar_Bier_15_00");	//������ ��� ����?
	if(b_giveinvitems(other,self,itfo_beer,1))
	{
		if(KNOWS_PALADINS == FALSE)
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_01");	//��, ��� ������ �����, ��� �������� ���.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_02");	//�� ���-�� ����� ������� ������ �����...
			AI_Output(self,other,"DIA_Rangar_Bier_07_03");	//��, ��, �����. ���� �� ������������ ������ ��� ������.
			AI_Output(self,other,"DIA_Rangar_Bier_07_04");	//��� �������� � ������ ��������. � ������ ���������� ����������.
			AI_Output(self,other,"DIA_Rangar_Bier_07_05");	//���� ������ ��� �� ���������� ���.
			KNOWS_PALADINS = 1;
			Info_ClearChoices(dia_rangar_bier);
		}
		else if((KNOWS_PALADINS == 1) && (KNOWS_ORK == TRUE))
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_06");	//� �� �� ��������� ��� �� ����� �����.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(other,self,"DIA_Rangar_Bier_15_07");	//�������, ����� ������ � ������ ������.
			AI_Output(self,other,"DIA_Rangar_Bier_07_08");	//��, �����, ������� ��� ����� ������. ���� ��� - ��������� ������. �� ����� ������� �� �����.
			AI_Output(self,other,"DIA_Rangar_Bier_07_09");	//��������, �� ������ ����� ���� ��� ����� ������, ���� �� �������� ������ � ������. �����?
			AI_Output(other,self,"DIA_Rangar_Bier_15_10");	//�����.
			KNOWS_PALADINS = 2;
			Info_ClearChoices(dia_rangar_bier);
		}
		else
		{
			AI_Output(self,other,"DIA_Rangar_Bier_07_11");	//������� ��� - ���������� ������.
			CreateInvItems(self,itfo_booze,1);
			b_useitem(self,itfo_booze);
			AI_Output(self,other,"DIA_Rangar_Bier_07_12");	//������, ������� ��������� �����, �������� �������� ���� �����. �� ��� �������.
			Info_ClearChoices(dia_rangar_bier);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Rangar_Bier_07_13");	//� ���� ��� ����.
		AI_StopProcessInfos(self);
	};
};

