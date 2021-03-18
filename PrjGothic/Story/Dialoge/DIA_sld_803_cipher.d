
instance DIA_CIPHER_EXIT(C_INFO)
{
	npc = sld_803_cipher;
	nr = 999;
	condition = dia_cipher_exit_condition;
	information = dia_cipher_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cipher_exit_condition()
{
	return TRUE;
};

func void dia_cipher_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CIPHER_HELLO(C_INFO)
{
	npc = sld_803_cipher;
	nr = 1;
	condition = dia_cipher_hello_condition;
	information = dia_cipher_hello_info;
	permanent = FALSE;
	description = "��� ����?";
};


func int dia_cipher_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_cipher_hello_info()
{
	AI_Output(other,self,"DIA_Cipher_Hello_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Cipher_Hello_07_01");	//��, � ���� ������-�� ����?
	AI_Output(other,self,"DIA_Cipher_Hello_15_02");	//��������...
	AI_Output(self,other,"DIA_Cipher_Hello_07_03");	//� �������� �������� ������ � �������, �������?
};


instance DIA_CIPHER_TRADEWHAT(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_tradewhat_condition;
	information = dia_cipher_tradewhat_info;
	permanent = FALSE;
	description = "� ��� �� �������� ������?";
};


func int dia_cipher_tradewhat_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_hello))
	{
		return TRUE;
	};
};

func void dia_cipher_tradewhat_info()
{
	AI_Output(other,self,"DIA_Cipher_TradeWhat_15_00");	//� ��� �� �������� ������?
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_01");	//��, �� ���������.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_02");	//� ������ � ����� �� ������� ����� ��� �������� �����.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_03");	//������ �������� �� ����� ������ �������� ������. � ���� ���� ��������� ��������� ��������� �� ����.
	AI_Output(self,other,"DIA_Cipher_TradeWhat_07_04");	//�� �����-�� ������� ����� ��� ����� �� ����� �������!
	Log_CreateTopic(TOPIC_CIPHERPAKET,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERPAKET,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERPAKET,"������� ����� ������� ��� �������� �����.");
	if(!Npc_IsDead(bodo))
	{
		AI_Output(self,other,"DIA_Cipher_TradeWhat_07_05");	//� ����� ������, ��� ��� ����. �� ���� � ��� �� �������, ��� � �, � ������ ���������� ��� �������, ��� �����...
		b_logentry(TOPIC_CIPHERPAKET,"�� �����������, ��� ��� ����� ����.");
	};
	MIS_CIPHER_PAKET = LOG_RUNNING;
};


instance DIA_CIPHER_DOWITHTHIEF(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_dowiththief_condition;
	information = dia_cipher_dowiththief_info;
	permanent = FALSE;
	description = "� ��� �� ����������� ������ � �����?";
};


func int dia_cipher_dowiththief_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat))
	{
		return TRUE;
	};
};

func void dia_cipher_dowiththief_info()
{
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_00");	//� ��� �� ����������� ������ � �����?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_01");	//�����-������ � ������ ���, ����� �� ����� ������ ��� �����.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_02");	//� �����, � ����� �������� �������� � �������� ��� ����, ������� �� �� ����� �������.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_03");	//���� � ������� ��� ����� �����, ������� �����, �� ������ � ��������, � ���� ����������� �� ���.
	AI_Output(other,self,"DIA_Cipher_DoWithThief_15_04");	//��� ������?
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_05");	//��� ������. �� �� ����� ��������� ��������, ����� �� �������� ��� ��������� �������� �����. ��� ������������ ����.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_06");	//� ��� ������ ����������, ��� ������� ��� ����������. � ����� ����� ������.
	AI_Output(self,other,"DIA_Cipher_DoWithThief_07_07");	//��� ��� ��� ����� ����� ������� ��������� � ����...
};


instance DIA_CIPHER_WANNAJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_wannajoin_condition;
	information = dia_cipher_wannajoin_info;
	permanent = FALSE;
	description = "� ���� �������������� � ����� ��!";
};


func int dia_cipher_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_hello) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_cipher_wannajoin_info()
{
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_00");	//� ���� �������������� � ����� ��!
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_01");	//����� ��?! ���� �� ����� ���������� � ��� �� ����, ��� ����� ���������� ���� ��� ������!
	AI_Output(other,self,"DIA_Cipher_WannaJoin_15_02");	//������?
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_03");	//�� ������ ��� ����� ���������. � � ������� �� ��� ���� ��� ��.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_04");	//�� ��������� ����� ��� ����� �� �������. �� ����� ������ ������ ����� � �����, ���� �������� �� ������ � ������.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_05");	//������� ������, ��� �� ������ ���������� ������� �� ��������� ������ � ������.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_06");	//� �����, ��� ���� �� ������������ ����� ����������.
	AI_Output(self,other,"DIA_Cipher_WannaJoin_07_07");	//� ������ ����������� �� ��� ������ ���� ������� �����. � �� ��� ����� ������ ��������������?
};


instance DIA_CIPHER_YESJOIN(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_yesjoin_condition;
	information = dia_cipher_yesjoin_info;
	permanent = FALSE;
	description = "� ��� ����� ���� ����� ����� �� ���!";
};


func int dia_cipher_yesjoin_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_wannajoin) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_cipher_yesjoin_info()
{
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_00");	//� ��� ����� ���� ����� ����� �� ���!
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_01");	//�� ��� ������, ��� �� �������� �� ������� ����������?
	AI_Output(other,self,"DIA_Cipher_YesJoin_15_02");	//�� ��� �� ���������?
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_03");	//��, � ��� ����� ������ �� �����. ������� ��� ��������� ������� �� �������� �����, � �� �������� ��� �����.
	AI_Output(self,other,"DIA_Cipher_YesJoin_07_04");	//� ������, ���� ������� ���-������ �����.
	MIS_CIPHER_BRINGWEED = LOG_RUNNING;
	Log_CreateTopic(TOPIC_CIPHERHERB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CIPHERHERB,LOG_RUNNING);
	b_logentry(TOPIC_CIPHERHERB,"����� ������ ���� ����� �� ����, ���� � ������� ��� ��������� ������� �������� ����� �������� �����.");
};


instance DIA_CIPHER_JOINTS(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_joints_condition;
	information = dia_cipher_joints_info;
	permanent = TRUE;
	description = "������ �������� �����...";
};


func int dia_cipher_joints_condition()
{
	if(MIS_CIPHER_BRINGWEED == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_cipher_joints_info()
{
	AI_Output(other,self,"DIA_Cipher_Joints_15_00");	//������ �������� �����...
	if(MIS_CIPHER_PAKET == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Cipher_Joints_07_01");	//�� ������ ����� ��� ���! ������ ��� ����� �������!
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_07_02");	//� ����������� ���������� �� ����...
			b_logentry(TOPIC_SLDRESPEKT,"����� ����������� �� ����, ����� � ���� �������������� � ���������.");
		};
		MIS_CIPHER_BRINGWEED = LOG_OBSOLETE;
	}
	else
	{
		Info_ClearChoices(dia_cipher_joints);
		Info_AddChoice(dia_cipher_joints,"� ��������, ��� ����� �������...",dia_cipher_joints_running);
		if(Npc_HasItems(other,itmi_joint) > 0)
		{
			Info_AddChoice(dia_cipher_joints,"��� ��������� ������� ��� ����...",dia_cipher_joints_success);
		};
	};
};

func void dia_cipher_joints_running()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Running_15_00");	//���������, ��� ����� �������...
	Info_ClearChoices(dia_cipher_joints);
};

func void dia_cipher_joints_success()
{
	AI_Output(other,self,"DIA_Cipher_Joints_Success_15_00");	//��� ��������� ������� ��� ����...
	if(b_giveinvitems(other,self,itmi_joint,10))
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_01");	//��! �� ��� �������!
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_02");	//�� �������� ��� �����.
		};
		MIS_CIPHER_BRINGWEED = LOG_SUCCESS;
		b_logentry(TOPIC_SLDRESPEKT,"����� ����������� �� ����, ����� � ���� �������������� � ���������.");
		b_giveplayerxp(XP_CIPHERWEED);
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_03");	//��� ���? �� � ������ ��� �� ���� �������!
		AI_Output(self,other,"DIA_Cipher_Joints_Success_07_04");	//��� ����� ���� �� 10 �������.
		if(other.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Cipher_Joints_Success_07_05");	//�����, �� �������� ��� �����.
		};
	};
	Info_ClearChoices(dia_cipher_joints);
};


instance DIA_CIPHER_TRADE(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_trade_condition;
	information = dia_cipher_trade_info;
	permanent = TRUE;
	description = "������ ��� ���� ������.";
	trade = TRUE;
};


func int dia_cipher_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat))
	{
		return TRUE;
	};
};

func void dia_cipher_trade_info()
{
	AI_Output(other,self,"DIA_Cipher_TRADE_15_00");	//������ ��� ���� ������.
	if(Npc_HasItems(self,itmi_joint) > 0)
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_01");	//�������. �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Cipher_TRADE_07_02");	//� ���� ������ ��� �������� �����. �� ������ ���-������ ���?
	};
};


instance DIA_CIPHER_DARDIEB(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_dardieb_condition;
	information = dia_cipher_dardieb_info;
	permanent = FALSE;
	description = "� ����, ��� ���� ���� �����.";
};


func int dia_cipher_dardieb_condition()
{
	if(((DAR_DIEB == TRUE) || (DAR_VERDACHT == TRUE)) && !Npc_IsDead(dar))
	{
		return TRUE;
	};
};

func void dia_cipher_dardieb_info()
{
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_00");	//� ����, ��� ���� ���� �����.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_01");	//���? ��� ��� ����?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_02");	//���, ��� ������ ���� �� ��������� - ���.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_03");	//���� �������! ��� ��?
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_04");	//���� ���� �� ������� ���, ��� ���� �� �������, � ���� ������ ��� ����� ����. �� ������ ��� � ��������.
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_05");	//��� ��?!
	AI_Output(other,self,"DIA_Cipher_DarDieb_15_06");	//�� ������, �� ����...
	AI_Output(self,other,"DIA_Cipher_DarDieb_07_07");	//� �������� ���!
	AI_StopProcessInfos(self);
	other.aivar[AIV_INVINCIBLE] = FALSE;
	b_attack(self,dar,AR_NONE,0);
};


instance DIA_CIPHER_DARLOST(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_darlost_condition;
	information = dia_cipher_darlost_info;
	permanent = FALSE;
	description = "�� ������ �� ���� ��������... ������ ���� �����?";
};


func int dia_cipher_darlost_condition()
{
	if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		return TRUE;
	};
};

func void dia_cipher_darlost_info()
{
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_00");	//�� ������ �� ���� ��������... ������ ���� �����?
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_01");	//(��������) ��, ������� �����.
	AI_Output(other,self,"DIA_Cipher_DarLOST_15_02");	//�� �� ��� ����, � �������...
	AI_Output(self,other,"DIA_Cipher_DarLOST_07_03");	//���� ������� ������� �� ������ ��� ������ � ��� ������!
	b_giveplayerxp(XP_AMBIENT * 2);
};


instance DIA_CIPHER_KRAUTPAKET(C_INFO)
{
	npc = sld_803_cipher;
	nr = 2;
	condition = dia_cipher_krautpaket_condition;
	information = dia_cipher_krautpaket_info;
	permanent = FALSE;
	description = "��� �������� �� ���� ��� �������� �����?";
};


func int dia_cipher_krautpaket_condition()
{
	if((Npc_HasItems(other,itmi_herbpaket) > 0) && (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_cipher_krautpaket_info()
{
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_00");	//��� �������� �� ���� ��� �������� �����?
	b_giveinvitems(other,self,itmi_herbpaket,1);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_01");	//��, ���! ��� �� ����� ���?
	AI_Output(other,self,"DIA_Cipher_KrautPaket_15_02");	//��� ������ �������...
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_03");	//�����, ��� �� �����, �� ������ � ����, ��� �� ��� �������.
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_04");	//��, ������ ��� � �������.
	b_giveinvitems(self,other,itmi_gold,200);
	b_giveinvitems(self,other,itmi_joint,10);
	b_giveplayerxp(XP_CIPHER_KRAUTPAKET);
	AI_Output(self,other,"DIA_Cipher_KrautPaket_07_05");	//������ � ������ ���� ��������...
	CreateInvItems(self,itmi_joint,40);
	Npc_RemoveInvItems(self,itmi_herbpaket,1);
	MIS_CIPHER_PAKET = LOG_SUCCESS;
	b_giveplayerxp(XP_CIPHERPAKET);
};


instance DIA_CIPHERSLD_PICKPOCKET(C_INFO)
{
	npc = sld_803_cipher;
	nr = 900;
	condition = dia_ciphersld_pickpocket_condition;
	information = dia_ciphersld_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_ciphersld_pickpocket_condition()
{
	return c_beklauen(65,65);
};

func void dia_ciphersld_pickpocket_info()
{
	Info_ClearChoices(dia_ciphersld_pickpocket);
	Info_AddChoice(dia_ciphersld_pickpocket,DIALOG_BACK,dia_ciphersld_pickpocket_back);
	Info_AddChoice(dia_ciphersld_pickpocket,DIALOG_PICKPOCKET,dia_ciphersld_pickpocket_doit);
};

func void dia_ciphersld_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ciphersld_pickpocket);
};

func void dia_ciphersld_pickpocket_back()
{
	Info_ClearChoices(dia_ciphersld_pickpocket);
};

