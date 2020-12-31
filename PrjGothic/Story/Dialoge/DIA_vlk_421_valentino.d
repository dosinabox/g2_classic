
instance DIA_VALENTINO_EXIT(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 999;
	condition = dia_valentino_exit_condition;
	information = dia_valentino_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_valentino_exit_condition()
{
	return TRUE;
};

func void dia_valentino_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VALENTINO_HALLO(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 1;
	condition = dia_valentino_hallo_condition;
	information = dia_valentino_hallo_info;
	permanent = FALSE;
	description = "���, � ��� � ��� �����?";
};


func int dia_valentino_hallo_condition()
{
	return TRUE;
};

func void dia_valentino_hallo_info()
{
	AI_Output(other,self,"DIA_Valentino_HALLO_15_00");	//���, � ��� � ��� �����?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_01");	//���� ����� ���������. � ������� �� ���������� ���� ����, ������ ��� �������, ����� �������.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_02");	//�������� ����.
		AI_Output(self,other,"DIA_Valentino_HALLO_03_03");	//��, ����� ��������, � �� ����� ��������� ������ �������. ��� ��� ����� �������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_HALLO_03_04");	//�� �������� � �������� ��������? ��� �������������!
		AI_Output(self,other,"DIA_Valentino_HALLO_03_05");	//������� ���� ������� �����. � ���� ���, ��� ������, ������� �� ������ ����������?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_06");	//��, � �������, ����� �� �������� ������ ����������� ��� ��, ��?
		AI_Output(self,other,"DIA_Valentino_HALLO_03_07");	//��, ���� �� � ���� ���� ������� �� ������, ������� � ����, �� �� �� ���� �� �������. �� ���� ������� �� ����� ����� �������.
		AI_Output(other,self,"DIA_Valentino_HALLO_15_08");	//�� ����� ��������.
	};
};


instance DIA_VALENTINO_WHOAGAIN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 2;
	condition = dia_valentino_whoagain_condition;
	information = dia_valentino_whoagain_info;
	permanent = FALSE;
	description = "� ������� ����, ��� �� �����!";
};


func int dia_valentino_whoagain_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo) && (other.guild != GIL_KDF) && (other.guild != GIL_PAL))
	{
		return TRUE;
	};
};

func void dia_valentino_whoagain_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_01");	//� ������� ����, ��� �� �����!
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_01");	//� ��������� ������������. ������� � �������� ������.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_02");	//������ ��������, ������� ��������� � �������, ������� ��� � ��������� �� ����.
	AI_Output(self,other,"DIA_Valentino_HALLO_wasmachstdu_03_03");	//���� � ���� ���� ��������, ����� �� ��� ����. ��� ��� �� �����.
};


instance DIA_VALENTINO_MANIEREN(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 3;
	condition = dia_valentino_manieren_condition;
	information = dia_valentino_manieren_info;
	permanent = FALSE;
	description = "������, ��� �������� ������� ���� ������� �������!";
};


func int dia_valentino_manieren_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_valentino_manieren_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_02");	//������, ��� �������� ������� ���� ������� �������!
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_01");	//���� ��� �� �������! ������ ����, ������� ������. � ����� � ������ ������ �����, � ����� ���� �����������.
	AI_Output(self,other,"DIA_Valentino_HALLO_klappe_03_02");	//�� ���� �������� ���� ������ � ���� ������������� �� ����� ����� ����
};


var int valentino_lo_perm;
var int valentino_hi_perm;

instance DIA_VALENTINO_WASNUETZLICHES(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 4;
	condition = dia_valentino_wasnuetzliches_condition;
	information = dia_valentino_wasnuetzliches_info;
	permanent = TRUE;
	description = "�� ��� ���-������ ������ ������� ���?";
};


func int dia_valentino_wasnuetzliches_condition()
{
	if(Npc_KnowsInfo(other,dia_valentino_hallo))
	{
		return TRUE;
	};
};

func void dia_valentino_wasnuetzliches_info()
{
	AI_Output(other,self,"DIA_Valentino_Add_15_03");	//(��������) �� ��� ���-������ ������ ������� ���?
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		b_say(self,other,"$NOTNOW");
	}
	else if((VALENTINO_LO_PERM == FALSE) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_01");	//����� ����������, ������� ������ ������ �� ������, ���� ��, ��� ������, � ������, ����� �� ��������� � ����� � ����������.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_02");	//��� � �������� �����, �������. ��� ���� �����, �� ������ ���.
		VALENTINO_LO_PERM = TRUE;
	}
	else if((VALENTINO_HI_PERM == FALSE) && ((other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_03");	//��� �������� � ����� ��������� ��� ������ ������������. �� ������ ������ �����, ����� ����� �����������.
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_04");	//��� ��� �� ����� ������� � ��������.
		VALENTINO_HI_PERM = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Valentino_WASNUETZLICHES_03_05");	//� ������ ���� ���, ��� ���� ����� �����. ��������� �� �����.
	};
};


instance DIA_VALENTINO_PICKPOCKET(C_INFO)
{
	npc = vlk_421_valentino;
	nr = 900;
	condition = dia_valentino_pickpocket_condition;
	information = dia_valentino_pickpocket_info;
	permanent = TRUE;
	description = "(������� ���� ���� ����� �����)";
};


func int dia_valentino_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_valentino) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_valentino_pickpocket_info()
{
	Info_ClearChoices(dia_valentino_pickpocket);
	Info_AddChoice(dia_valentino_pickpocket,DIALOG_BACK,dia_valentino_pickpocket_back);
	Info_AddChoice(dia_valentino_pickpocket,DIALOG_PICKPOCKET,dia_valentino_pickpocket_doit);
};

func void dia_valentino_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itke_valentino,1);
		b_givethiefxp();
		Info_ClearChoices(dia_valentino_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_valentino_pickpocket_back()
{
	Info_ClearChoices(dia_valentino_pickpocket);
};

