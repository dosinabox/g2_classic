
instance DIA_EDDA_EXIT(C_INFO)
{
	npc = vlk_471_edda;
	nr = 999;
	condition = dia_edda_exit_condition;
	information = dia_edda_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_edda_exit_condition()
{
	return TRUE;
};

func void dia_edda_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_EDDA_HALLO(C_INFO)
{
	npc = vlk_471_edda;
	nr = 2;
	condition = dia_edda_hallo_condition;
	information = dia_edda_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_edda_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_edda_hallo_info()
{
	AI_Output(other,self,"DIA_Edda_Hallo_15_00");	//��� �� ������?
	AI_Output(self,other,"DIA_Edda_Hallo_17_01");	//���. �����, ��� �� �������� �������, ��, �� ������� ����, ��� ������� ���.
	AI_Output(self,other,"DIA_Edda_Hallo_17_02");	//���� ������ ���� �������, ���� ������.
};


instance DIA_EDDA_STADT(C_INFO)
{
	npc = vlk_471_edda;
	nr = 5;
	condition = dia_edda_stadt_condition;
	information = dia_edda_stadt_info;
	permanent = FALSE;
	description = "��� �� ������ ���������� ��� � ������?";
};


func int dia_edda_stadt_condition()
{
	return TRUE;
};

func void dia_edda_stadt_info()
{
	AI_Output(other,self,"DIA_Edda_Stadt_15_00");	//��� �� ������ ���������� ��� � ������?
	AI_Output(self,other,"DIA_Edda_Stadt_17_01");	//����������� ������� ��������� �����. ������� ����� �� ������� � ����� ����.
	AI_Output(self,other,"DIA_Edda_Stadt_17_02");	//�� ���� �� �����, ��� ������������ �� ����, ������ ������� � ���� ������. ��� ���� ��� ���� �������.
	AI_Output(other,self,"DIA_Edda_Stadt_15_03");	//� �� �� ������� �����?
	AI_Output(self,other,"DIA_Edda_Stadt_17_04");	//������������ ������ ����, ��� ���� � ����, ��� �������.
	AI_Output(self,other,"DIA_Edda_Stadt_17_05");	//���-�� ����� ��� ������ ������.
	EDDA_SCHLAFPLATZ = TRUE;
	Wld_AssignRoomToGuild("hafen08",GIL_NONE);
};


instance DIA_EDDA_KOCHEN(C_INFO)
{
	npc = vlk_471_edda;
	nr = 6;
	condition = dia_edda_kochen_condition;
	information = dia_edda_kochen_info;
	permanent = FALSE;
	description = "�� ������ ������� ��� ���� ���?";
};


func int dia_edda_kochen_condition()
{
	return TRUE;
};

func void dia_edda_kochen_info()
{
	AI_Output(other,self,"DIA_Edda_Kochen_15_00");	//�� ������ ������� ��� ��� ����?
	AI_Output(self,other,"DIA_Edda_Kochen_17_01");	//� ������� ��� ����. ��� ���� ����, ���� ��������. ���, ��� ��� ����� - ��� ����� �� ������ ��� ����.
};


instance DIA_EDDA_SUPPE(C_INFO)
{
	npc = vlk_471_edda;
	nr = 6;
	condition = dia_edda_suppe_condition;
	information = dia_edda_suppe_info;
	permanent = TRUE;
	description = "�� ������ ������� ��� ���� ���?";
};


func int dia_edda_suppe_condition()
{
	if(Npc_KnowsInfo(other,dia_edda_kochen))
	{
		return TRUE;
	};
};

func void dia_edda_suppe_info()
{
	AI_Output(other,self,"DIA_Edda_Suppe_15_00");	//�� ������ ������� ��� ���� ���?
	if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_02");	//� ����������� ��� �� ������ ��������� � �������� ��� ������ ����.
	}
	else if(EDDA_DAY != Wld_GetDay())
	{
		if(b_giveinvitems(other,self,itfo_fish,1))
		{
			AI_Output(self,other,"DIA_Edda_Suppe_17_01");	//��� ������ �����. ���, ����� �������.
			b_giveinvitems(self,other,itfo_fishsoup,1);
			EDDA_DAY = Wld_GetDay();
		}
		else
		{
			AI_Output(self,other,"DIA_Edda_Suppe_17_04");	//������� ��� ����, � � ����� ���� ������� ���.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Edda_Suppe_17_03");	//���, �� �������. ������� ������.
	};
};


instance DIA_EDDA_STATUE(C_INFO)
{
	npc = vlk_471_edda;
	nr = 6;
	condition = dia_edda_statue_condition;
	information = dia_edda_statue_info;
	permanent = FALSE;
	description = "��������, � ������ ������ ������ ��� ����.";
};


func int dia_edda_statue_condition()
{
	if(Npc_KnowsInfo(other,dia_edda_stadt) && (Npc_HasItems(other,itmi_innosstatue) >= 1))
	{
		return TRUE;
	};
};

func void dia_edda_statue_info()
{
	AI_Output(other,self,"DIA_Edda_Statue_15_00");	//��������, � ������ ������ ������ ��� ����.
	AI_Output(self,other,"DIA_Edda_Statue_17_01");	//�� - �������� ���� �������. �� �� ������� ���� ���� ������...
	AI_Output(other,self,"DIA_Edda_Statue_15_02");	//�� ����� ��������������.
	b_giveinvitems(other,self,itmi_innosstatue,1);
	b_giveplayerxp(XP_EDDA_STATUE);
};


instance DIA_EDDA_PICKPOCKET(C_INFO)
{
	npc = vlk_471_edda;
	nr = 900;
	condition = dia_edda_pickpocket_condition;
	information = dia_edda_pickpocket_info;
	permanent = TRUE;
	description = "(������� �� ������ ����� ����� �������)";
};


func int dia_edda_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itmi_eddasstatue) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_edda_pickpocket_info()
{
	Info_ClearChoices(dia_edda_pickpocket);
	Info_AddChoice(dia_edda_pickpocket,DIALOG_BACK,dia_edda_pickpocket_back);
	Info_AddChoice(dia_edda_pickpocket,DIALOG_PICKPOCKET,dia_edda_pickpocket_doit);
};

func void dia_edda_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itmi_eddasstatue,1);
		b_givethiefxp();
		Info_ClearChoices(dia_edda_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_edda_pickpocket_back()
{
	Info_ClearChoices(dia_edda_pickpocket);
};

