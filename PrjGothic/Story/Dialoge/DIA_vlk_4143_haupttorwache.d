
instance DIA_HAUPTTORWACHE_EXIT(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 999;
	condition = dia_haupttorwache_exit_condition;
	information = dia_haupttorwache_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_haupttorwache_exit_condition()
{
	return TRUE;
};

func void dia_haupttorwache_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HAUPTTORWACHE_AUFGABE(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 4;
	condition = dia_haupttorwache_aufgabe_condition;
	information = dia_haupttorwache_aufgabe_info;
	permanent = TRUE;
	description = "��� �� ����������� �����?";
};


func int dia_haupttorwache_aufgabe_condition()
{
	return TRUE;
};

func void dia_haupttorwache_aufgabe_info()
{
	AI_Output(other,self,"DIA_Haupttorwache_AUFGABE_15_00");	//��� �� ����������� �����?
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_01");	//��� ������ ������. � ������ �������, ����� ���� �� ������������ �����, ��� �� 30 ����� � �������.
	AI_Output(self,other,"DIA_Haupttorwache_AUFGABE_13_02");	//���� �� ����������� ������� �������, � ������� �������. ��� � ���.
};


instance DIA_HAUPTTORWACHE_TOROEFFNEN(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 5;
	condition = dia_haupttorwache_toroeffnen_condition;
	information = dia_haupttorwache_toroeffnen_info;
	permanent = TRUE;
	description = "��� ����� �������, ����� ������� ������� ������?";
};


func int dia_haupttorwache_toroeffnen_condition()
{
	if(KAPITEL >= 5)
	{
		return TRUE;
	};
};

func void dia_haupttorwache_toroeffnen_info()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_15_00");	//��� ����� �������, ����� ������� ������� ������?
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_13_01");	//���� ����� �������! ����� ���� ����� ���?
	self.flags = 0;
	Info_ClearChoices(dia_haupttorwache_toroeffnen);
	Info_AddChoice(dia_haupttorwache_toroeffnen,"� ���������� � ������������ �����.",dia_haupttorwache_toroeffnen_sicherheit);
	Info_AddChoice(dia_haupttorwache_toroeffnen,"�� � ������ ��� �������.",dia_haupttorwache_toroeffnen_frage);
};

func void dia_haupttorwache_toroeffnen_sicherheit()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00");	//� ���������� � ������������ �����.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01");	//� ����, ������ ���.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02");	//� ����� �������������� ��������, � ������ ���� ������� ��� ���� �� �������������.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03");	//(�����) ��� ������� ���������������. � ���� ������� ������� ���. � �������� � ���� �������.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04");	//��. ������ ���������, ��� ���-������ ������ � �������� �����, ����� ������� ������, � ��� ������ ������ ������� ����� ��������.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05");	//����� ����� �� ������ ������� ��� ������. ��� ���� ������ �� �������, ��� ���������� ������. ������, ��� ����� �� �����, ��� � ���� ���� ����.
	AI_StopProcessInfos(self);
};

func void dia_haupttorwache_toroeffnen_frage()
{
	AI_Output(other,self,"DIA_Haupttorwache_TOROEFFNEN_frage_15_00");	//�� � ������ ��� �������.
	AI_Output(self,other,"DIA_Haupttorwache_TOROEFFNEN_frage_13_01");	//� ��������� ��� �����, ��� �����������. � ���� ����� ���� ������� �������� ��-�� �����. ��� ������, ����� ������ �������. � ������ �����. � �����.
	AI_StopProcessInfos(self);
};


instance DIA_HAUPTTORWACHE_PICKPOCKET(C_INFO)
{
	npc = vlk_4143_haupttorwache;
	nr = 900;
	condition = dia_haupttorwache_pickpocket_condition;
	information = dia_haupttorwache_pickpocket_info;
	permanent = TRUE;
	description = "(������� ���� ���� ����� �������)";
};


func int dia_haupttorwache_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_oc_maingate_mis) >= 1) && (KAPITEL >= 5) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_haupttorwache_pickpocket_info()
{
	Info_ClearChoices(dia_haupttorwache_pickpocket);
	Info_AddChoice(dia_haupttorwache_pickpocket,DIALOG_BACK,dia_haupttorwache_pickpocket_back);
	Info_AddChoice(dia_haupttorwache_pickpocket,DIALOG_PICKPOCKET,dia_haupttorwache_pickpocket_doit);
};

func void dia_haupttorwache_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itke_oc_maingate_mis,1);
		b_givethiefxp();
		Info_ClearChoices(dia_haupttorwache_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_haupttorwache_pickpocket_back()
{
	Info_ClearChoices(dia_haupttorwache_pickpocket);
};

