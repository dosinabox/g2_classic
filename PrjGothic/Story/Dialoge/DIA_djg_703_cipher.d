
var int djg_cipher_dragonkillednotyet;

instance DIA_CIPHERDJG_EXIT(C_INFO)
{
	npc = djg_703_cipher;
	nr = 999;
	condition = dia_cipherdjg_exit_condition;
	information = dia_cipherdjg_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cipherdjg_exit_condition()
{
	return TRUE;
};

func void dia_cipherdjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CIPHER_HALLO(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipher_hallo_condition;
	information = dia_cipher_hallo_info;
	description = "�������� ������.";
};


func int dia_cipher_hallo_condition()
{
	return TRUE;
};

func void dia_cipher_hallo_info()
{
	AI_Output(other,self,"DIA_Cipher_HALLO_15_00");	//�������� ������.
	AI_Output(self,other,"DIA_Cipher_HALLO_07_01");	//������� ����. ����� ������, ��� �� ����������. ������� ����� �������� � �������� �������.
};


instance DIA_CIPHERDJG_HELLOAGAIN(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_helloagain_condition;
	information = dia_cipherdjg_helloagain_info;
	description = "��� �� ������� �����?";
};


func int dia_cipherdjg_helloagain_condition()
{
	if((Npc_IsDead(swampdragon) == FALSE) && Npc_KnowsInfo(other,dia_cipher_hallo))
	{
		return TRUE;
	};
};

func void dia_cipherdjg_helloagain_info()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_01");	//� ����� ��� ����� ����. ������� ���������� ������.
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_15_02");	//���������� ������? ��� ����?
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_03");	//��� ���-�� ������ ��������� ������. ��� ������� ������ �������� ��� ������ ������ ����� ����, ��� �� �������� �����.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_04");	//� ��� ������ ����� �����, ����� ����� ���������� ���� ���� ��������.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_05");	//�� ������ � �� �� ��� �� ����� ���� ����.
	if(Npc_IsDead(djg_rod) == FALSE)
	{
		AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_06");	//������, �� ���� ���. �� �� ������� ����� ������ ���� ��� ���� ������� ����.
	};
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_07_07");	//� ��� ������ ����? �� ���� ���� ������ ���� �� �� ��������, ������? ������ ���� ������.
	b_logentry(TOPIC_DRAGONHUNTER,"����� ������ ���, ��� � ������� ������ �������� ����� ������.");
	Info_AddChoice(dia_cipherdjg_helloagain,"� ��� �� ����������� ������ ������?",dia_cipherdjg_helloagain_goalone);
	Info_AddChoice(dia_cipherdjg_helloagain,"������ �� � ���. ������ ��� �� ��������.",dia_cipherdjg_helloagain_gotogether);
};

func void dia_cipherdjg_helloagain_goalone()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_GoAlone_15_00");	//� ����������� ����������� � ��������.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_GoAlone_07_01");	//��� ������. ������, � �������� � ����!
	AI_StopProcessInfos(self);
};

func void dia_cipherdjg_helloagain_gotogether()
{
	AI_Output(other,self,"DIA_CipherDJG_HELLOAGAIN_GoTogether_15_00");	//������ �� � ���. ������ ��� �� ��������.
	AI_Output(self,other,"DIA_CipherDJG_HELLOAGAIN_GoTogether_07_01");	//��� ������. ����� �, �������, ����� ��������� ������. ��� ���� ����������. ������ ��� ��� �����!
	DJG_SWAMPPARTY = TRUE;
	Info_ClearChoices(dia_cipherdjg_helloagain);
};


instance DIA_CIPHERDJG_GOTOGETHERAGAIN(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_gotogetheragain_condition;
	information = dia_cipherdjg_gotogetheragain_info;
	description = "� ���������! ������ ������!";
};


func int dia_cipherdjg_gotogetheragain_condition()
{
	if(Npc_KnowsInfo(other,dia_cipherdjg_helloagain) && (DJG_SWAMPPARTY == FALSE) && (Npc_IsDead(swampdragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_cipherdjg_gotogetheragain_info()
{
	AI_Output(other,self,"DIA_CipherDJG_GOTOGETHERAGAIN_15_00");	//� ���������! ������ ������!
	AI_Output(self,other,"DIA_CipherDJG_GOTOGETHERAGAIN_07_01");	//������ ��� ��� �����!
	DJG_SWAMPPARTY = TRUE;
};


instance DIA_CIPHERDJG_GO(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_go_condition;
	information = dia_cipherdjg_go_info;
	description = "������ ����� ���������� ������, ����� ���� ����!";
};


func int dia_cipherdjg_go_condition()
{
	if((DJG_SWAMPPARTY == TRUE) && (Npc_IsDead(swampdragon) == FALSE))
	{
		return TRUE;
	};
};


var int djg_swampparty_gogogo;

func void dia_cipherdjg_go_info()
{
	AI_Output(other,self,"DIA_CipherDJG_GO_15_00");	//������ ����� ���������� ������, ����� ���� ����!
	AI_Output(self,other,"DIA_CipherDJG_GO_07_01");	//����� ������!
	AI_StopProcessInfos(self);
	DJG_SWAMPPARTY_GOGOGO = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	djg_rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait1");
	b_startotherroutine(djg_rod,"SwampWait1");
};


instance DIA_CIPHERDJG_SWAMPWAIT2(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_swampwait2_condition;
	information = dia_cipherdjg_swampwait2_info;
	important = TRUE;
};


func int dia_cipherdjg_swampwait2_condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT1_01") < 700) && (Npc_IsDead(swampdragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_cipherdjg_swampwait2_info()
{
	AI_Output(self,other,"DIA_CipherDJG_SwampWait2_07_00");	//������ ���������� ����� �� ��������� ���������. � ��������� ���� ����� ����.
	AI_Output(self,other,"DIA_CipherDJG_SwampWait2_07_01");	//��, �� ����� ������ ��������� ��� ��� ������, ����� ��� ����� �� ������ �� ��� �����. ��� �� ���������?
	AI_Output(other,self,"DIA_CipherDJG_SwampWait2_15_02");	//�� ����� ������ �������!
	Info_AddChoice(dia_cipherdjg_swampwait2,DIALOG_ENDE,dia_cipherdjg_swampwait2_weiter);
};

func void dia_cipherdjg_swampwait2_weiter()
{
	AI_StopProcessInfos(self);
	DJG_SWAMPPARTY = TRUE;
	DJG_SWAMPPARTY_GOGOGO = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	djg_rod.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"SwampWait2");
	b_startotherroutine(djg_rod,"SwampWait2");
};


instance DIA_CIPHERDJG_GOFORSWAMPDRAGON(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_goforswampdragon_condition;
	information = dia_cipherdjg_goforswampdragon_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_cipherdjg_goforswampdragon_condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_SWAMP_WAIT2_01") < 1000) && (Npc_IsDead(swampdragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_cipherdjg_goforswampdragon_info()
{
	if(Npc_KnowsInfo(other,dia_dragon_swamp_exit))
	{
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_00");	//(�����) � �����!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"SwampDragon");
		b_startotherroutine(djg_rod,"SwampDragon");
	}
	else
	{
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_01");	//� ��� ����� ��� �����. �� ������ ���� ���������!
		AI_Output(self,other,"DIA_CipherDJG_GoForSwampDragon_07_02");	//��� ������ � ��������, ����� �� �� ���������.
		AI_StopProcessInfos(self);
	};
	self.flags = 0;
	djg_rod.flags = 0;
};


instance DIA_CIPHERDJG_SWAMPDRAGONDEAD(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_swampdragondead_condition;
	information = dia_cipherdjg_swampdragondead_info;
	important = TRUE;
};


func int dia_cipherdjg_swampdragondead_condition()
{
	if((Npc_IsDead(swampdragon) == TRUE) && (DJG_SWAMPPARTY == TRUE) && (DJG_SWAMPPARTY_GOGOGO == TRUE))
	{
		return TRUE;
	};
};

func void dia_cipherdjg_swampdragondead_info()
{
	AI_Output(self,other,"DIA_CipherDJG_SWAMPDRAGONDEAD_07_00");	//����. �� �����?
	AI_Output(other,self,"DIA_CipherDJG_SWAMPDRAGONDEAD_15_01");	//���������. ��� �������!
	AI_Output(self,other,"DIA_CipherDJG_SWAMPDRAGONDEAD_07_02");	//��, �� � ���������.
	AI_StopProcessInfos(self);
	b_giveplayerxp(XP_CIPHERDJGDEADDRAGON);
	DJG_SWAMPPARTY = FALSE;
	DJG_SWAMPPARTY_GOGOGO = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	djg_rod.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(djg_rod,"Start");
};


instance DIA_CIPHERDJG_WHATNEXT(C_INFO)
{
	npc = djg_703_cipher;
	condition = dia_cipherdjg_whatnext_condition;
	information = dia_cipherdjg_whatnext_info;
	permanent = TRUE;
	description = "�������� ������ �����!";
};


func int dia_cipherdjg_whatnext_condition()
{
	if(Npc_IsDead(swampdragon) == TRUE)
	{
		return TRUE;
	};
};

func void dia_cipherdjg_whatnext_info()
{
	AI_Output(other,self,"DIA_CipherDJG_WHATNEXT_15_00");	//�������� ������ �����! ��� �� ������ ������ ������?
	AI_Output(self,other,"DIA_CipherDJG_WHATNEXT_07_01");	//������� �� ����. � ��� �� ���� �� �����. � �� ������ ������ ��������� � ������� ��� �����.
	AI_Output(self,other,"DIA_CipherDJG_WHATNEXT_07_02");	//�������, �� ���� ����� ������� ���������. ������� ��� ����.
	b_logentry(TOPIC_DRAGONHUNTER,"����� ������, ��� ������, ����� �������� ������ �����, �� ����� ���������� ���� ����� ��� ������� '�����'. ��� �, ���������.");
	AI_StopProcessInfos(self);
};


instance DIA_CIPHER_PICKPOCKET(C_INFO)
{
	npc = djg_703_cipher;
	nr = 900;
	condition = dia_cipher_pickpocket_condition;
	information = dia_cipher_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_cipher_pickpocket_condition()
{
	return c_beklauen(79,220);
};

func void dia_cipher_pickpocket_info()
{
	Info_ClearChoices(dia_cipher_pickpocket);
	Info_AddChoice(dia_cipher_pickpocket,DIALOG_BACK,dia_cipher_pickpocket_back);
	Info_AddChoice(dia_cipher_pickpocket,DIALOG_PICKPOCKET,dia_cipher_pickpocket_doit);
};

func void dia_cipher_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_cipher_pickpocket);
};

func void dia_cipher_pickpocket_back()
{
	Info_ClearChoices(dia_cipher_pickpocket);
};

