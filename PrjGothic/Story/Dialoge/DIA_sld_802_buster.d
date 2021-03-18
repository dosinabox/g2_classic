
instance DIA_BUSTER_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_exit_condition;
	information = dia_buster_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_buster_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_HELLO(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_hello_condition;
	information = dia_buster_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_hello_condition()
{
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_buster_hello_info()
{
	AI_Output(self,other,"DIA_Buster_Hello_13_00");	//����������, ��� � ��� �����?! � ���� �������� �� ����?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"��� �������. � ���� ������� ���������.",dia_buster_hello_goingtofarm);
	Info_AddChoice(dia_buster_hello,"� ��� ����������?",dia_buster_hello_whoareyou);
};

func void dia_buster_hello_whoareyou()
{
	AI_Output(other,self,"DIA_Buster_Hello_WhoAreYou_15_00");	//� ��� ����������?
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_01");	//� ������, ���� �� ��������� ��!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_02");	//� ���� ����� ���� ���������� �� ����, � �� �� ��� �������� ������� ���� �������!
	AI_Output(self,other,"DIA_Buster_Hello_WhoAreYou_13_03");	//�����, ��� ���� ����� �����?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"��� �� ���� ����.",dia_buster_hello_notyourbusiness);
	Info_AddChoice(dia_buster_hello,"� ���� ��!",dia_buster_hello_iknowlee);
	Info_AddChoice(dia_buster_hello,"� ���� ������� ���������.",dia_buster_hello_goingtofarm);
};

func void dia_buster_hello_iknowlee()
{
	AI_Output(other,self,"DIA_Buster_Hello_IKnowLee_15_00");	//� ���� ��!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_01");	//��� ����� ��! ��� �� ���� �� ������, ��������. ������, �� �������������� �� ����!
	AI_Output(self,other,"DIA_Buster_Hello_IKnowLee_13_02");	//����, ���� �� �������������?
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"��� �� ���� ����.",dia_buster_hello_notyourbusiness);
	Info_AddChoice(dia_buster_hello,"� ���� ������� ���������.",dia_buster_hello_goingtofarm);
};

func void dia_buster_hello_notyourbusiness()
{
	AI_Output(other,self,"DIA_Buster_Hello_NotYourBusiness_15_00");	//��� �� ���� ����.
	AI_Output(self,other,"DIA_Buster_Hello_NotYourBusiness_13_01");	//� ������ �� ������� ��� ������������� �� ����, ��, ������� �����! ��-�����, �� ������������ ������� �������.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_goingtofarm()
{
	AI_Output(other,self,"DIA_Buster_Hello_GoingToFarm_15_00");	//��� �������. � ���� ������� ���������.
	AI_Output(self,other,"DIA_Buster_Hello_GoingToFarm_13_01");	//��?.. �� - �� �� �������� ��� ����� �� �������.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"������ ���������?",dia_buster_hello_wannatestit);
	Info_AddChoice(dia_buster_hello,"� ���� ���� ������� ������ ������.",dia_buster_hello_slewbeasts);
	Info_AddChoice(dia_buster_hello,"���� ��������� �������.",dia_buster_hello_imnodanger);
};

func void dia_buster_hello_imnodanger()
{
	AI_Output(other,self,"DIA_Buster_Hello_ImNoDanger_15_00");	//���� ��������� �������.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_01");	//(������������) ��, �� ������ ���� � �������� ������������ ����� ����, ��������.
	AI_Output(self,other,"DIA_Buster_Hello_ImNoDanger_13_02");	//��� ��������� ���������� ��������� � ������. ��� �� ����������� �� ������. ��� ����� ���������. (�������)
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"�� ������ � ���� ��������� �����? ���� ������� ������?",dia_buster_hello_realorcs);
	Info_AddChoice(dia_buster_hello,"�?",dia_buster_hello_sowhat);
	Info_AddChoice(dia_buster_hello,"����������.",dia_buster_hello_impressive);
};

func void dia_buster_hello_slewbeasts()
{
	AI_Output(other,self,"DIA_Buster_Hello_SlewBeasts_15_00");	//� ���� ���� ������� ������ ������.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_01");	//��! (�������) ��, ��������, ���������� ��������� ������������ �� ���� � ������ ������� ���� �� �� ���.
	AI_Output(self,other,"DIA_Buster_Hello_SlewBeasts_13_02");	//� �� ����� ����� ���� � ������! ��, � � ����� ��������� ���������� �����������. (����������� ����)
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"�� ������ � ���� ��������� �����? ���� ������� ������?",dia_buster_hello_realorcs);
	Info_AddChoice(dia_buster_hello,"�?",dia_buster_hello_sowhat);
	Info_AddChoice(dia_buster_hello,"����������.",dia_buster_hello_impressive);
};

func void dia_buster_hello_wannatestit()
{
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_00");	//������ ���������?
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_01");	//���� ��! � ����� �� �� ���� �����, ��?
	AI_Output(other,self,"DIA_Buster_Hello_WannaTestIt_15_02");	//����� ������� � ���.
	AI_Output(self,other,"DIA_Buster_Hello_WannaTestIt_13_03");	//����� �����, ������ ���, �� ��� �� �����.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_impressive()
{
	AI_Output(other,self,"DIA_Buster_Hello_Impressive_15_00");	//����������.
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_01");	//(�������) ��� ���� ������, ������! �� ���� ������ ���� ����������� ������ � �������!
	AI_Output(self,other,"DIA_Buster_Hello_Impressive_13_02");	//�� ������ ���� ����� ���� �� ���� �� �������. �� ����������� ����� ���� ����� �� ������.
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"������, ��� �������� �������� ����, ��� � ���� �� ����!",dia_buster_hello_letmeshowyou);
	Info_AddChoice(dia_buster_hello,"��� �������.",dia_buster_hello_ifyousayso);
};

func void dia_buster_hello_ifyousayso()
{
	AI_Output(other,self,"DIA_Buster_Hello_IfYouSaySo_15_00");	//��� �������.
	AI_Output(self,other,"DIA_Buster_Hello_IfYouSaySo_13_01");	//(�� ��������� ���������) �������, ������!
	AI_StopProcessInfos(self);
};

func void dia_buster_hello_letmeshowyou()
{
	AI_Output(other,self,"DIA_Buster_Hello_LetMeShowYou_15_00");	//������, ��� �������� �������� ����, ��� � ���� �� ����!
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_01");	//�� ���, ������� �� ���� ������� �����������, ��?
	AI_Output(self,other,"DIA_Buster_Hello_LetMeShowYou_13_02");	//������, �����, ������, �� ��� �� ��������.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_sowhat()
{
	AI_Output(other,self,"DIA_Buster_Hello_SoWhat_15_00");	//�?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_01");	//(�������) ��� ����� �� ���������, � ��� � ������. �� �������, ��� �� ����, ��?
	AI_Output(self,other,"DIA_Buster_Hello_SoWhat_13_02");	//(�������) ������, ������ ����� ����������� ���� ����!
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"������ �����!",dia_buster_hello_whenever);
	Info_AddChoice(dia_buster_hello,"� ������ ����...",dia_buster_hello_justjoking);
};

func void dia_buster_hello_realorcs()
{
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_00");	//�� ������ � ���� ��������� �����? ���� ������� ������?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_01");	//(��������) � ���� � ����... �������! �� ���, ����������� ���� ����?
	AI_Output(other,self,"DIA_Buster_Hello_RealOrcs_15_02");	//(��������) ���� � �� �����.
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_03");	//�� �� ����� ��������! (����������) �� ��� ��������������, ��?
	AI_Output(self,other,"DIA_Buster_Hello_RealOrcs_13_04");	//����� �����, ������, �� ��� �� ��������, �����!
	Info_ClearChoices(dia_buster_hello);
	Info_AddChoice(dia_buster_hello,"������ �����!",dia_buster_hello_whenever);
	Info_AddChoice(dia_buster_hello,"� ������ ����...",dia_buster_hello_justjoking);
};

func void dia_buster_hello_whenever()
{
	AI_Output(other,self,"DIA_Buster_Hello_Whenever_15_00");	//������ �����!
	AI_Output(self,other,"DIA_Buster_Hello_Whenever_13_01");	//����� ��� ����, ��������!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_buster_hello_justjoking()
{
	AI_Output(other,self,"DIA_Buster_Hello_JustJoking_15_00");	//� ������ ����...
	AI_Output(self,other,"DIA_Buster_Hello_JustJoking_13_01");	//������������ � ������ �������! � ������ ����������!
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_FIGHTNONE(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_fightnone_condition;
	information = dia_buster_fightnone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_fightnone_condition()
{
	if(Npc_KnowsInfo(other,dia_buster_hello) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE) && Npc_IsInState(self,zs_talk))
	{
		if((KAPITEL >= 3) && ((other.guild == GIL_SLD) || (other.guild == GIL_DJG)))
		{
			return FALSE;
		};
		return TRUE;
	};
};

func void dia_buster_fightnone_info()
{
	AI_Output(self,other,"DIA_Buster_FightNone_13_00");	//��� ���� �����, �������?
};


instance DIA_BUSTER_DUELL(C_INFO)
{
	npc = sld_802_buster;
	nr = 3;
	condition = dia_buster_duell_condition;
	information = dia_buster_duell_info;
	permanent = TRUE;
	description = "� ������� ���� �� �����!";
};


func int dia_buster_duell_condition()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST)
	{
		return TRUE;
	};
};

func void dia_buster_duell_info()
{
	AI_Output(other,self,"DIA_Buster_Duell_15_00");	//� ������� ���� �� �����!
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_NONE)
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_01");	//��-��! ���� ��� ��������, ��? �����, ��� ����!
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Duell_13_02");	//�� ������ ����������� ��� ���? ��, �� ������, �����, ��� ����!
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_Duell_13_03");	//������ ������ �� ������!
		};
	};
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};


instance DIA_BUSTER_WANNAJOIN(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_wannajoin_condition;
	information = dia_buster_wannajoin_info;
	permanent = TRUE;
	description = "� ���� �������������� � ���������!";
};


func int dia_buster_wannajoin_condition()
{
	if((other.guild == GIL_NONE) && (BUSTER_DUELL == FALSE))
	{
		return TRUE;
	};
};

func void dia_buster_wannajoin_info()
{
	AI_Output(other,self,"DIA_Buster_WannaJoin_15_00");	//� ���� �������������� � ���������!
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) || (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST))
	{
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_01");	//� ����� � ����� ������ ��� � ����, �� ������ ���������� � ���� ������ �������.
		}
		else
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_02");	//�� �� �������� ������� ����, �� � ������ ���� ������� ������.
		};
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_03");	//��� ����� �� ����� ������, ��� ��� � ����� �� ����� �����, �� ���� �� �������, � ���������� �� ����.
		BUSTER_DUELL = TRUE;
		Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
		b_logentry(TOPIC_SLDRESPEKT,"� ��� ���, ��� � ������� �������, �� �� ����� ������ ������ ����� ���������� � ���� ���������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_WannaJoin_13_04");	//��? � �� �����, ����� ����� ������ ��� �� �����-���� ��������� � ��������...
		if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL)
		{
			AI_Output(self,other,"DIA_Buster_WannaJoin_13_05");	//�� �������� �� ����� - ����� ��� �� ����� ������ ������!
		};
	};
};


var int buster_sentenzatip;

instance DIA_BUSTER_OTHERSLD(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_othersld_condition;
	information = dia_buster_othersld_info;
	permanent = FALSE;
	description = "� ���� ������ ������ � ��������� � ���� ���������.";
};


func int dia_buster_othersld_condition()
{
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_buster_othersld_info()
{
	AI_Output(other,self,"DIA_Buster_OtherSld_15_00");	//� ���� ������ ������ � ��������� � ���� ���������.
	AI_Output(self,other,"DIA_Buster_OtherSld_13_01");	//� ��������� � ���� ��� ���� �������. ���� ����� ������������ ��������.
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_02");	//� ��� �������� ��������� - �� ������� � ��� ������: ���� ������ �������� �� ���� - ����� ���������� � ���.
	};
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		if(hero.guild == GIL_NONE)
		{
			AI_Output(self,other,"DIA_Buster_OtherSld_13_03");	//� �����, �� ������� ����� ����� �� ���.
			AI_Output(self,other,"DIA_Buster_OtherSld_13_04");	//�� �� ����� �����������. ���� ������ ������� �� ����� ������ ���������� ���.
		};
		AI_Output(self,other,"DIA_Buster_OtherSld_13_05");	//�� ���� ����� ����� ������, ������� ����� ������� ����...
		AI_Output(self,other,"DIA_Buster_OtherSld_13_06");	//��������, ��������. �� �������� ���� �� �����. ���� ����� �� ����������� � ���.
		BUSTER_SENTENZATIP = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_OtherSld_13_07");	//�� ����� � ������ ���� ��� ���, �������?!
		AI_StopProcessInfos(self);
	};
};


var int buster_goldzumbrennen;
var int buster_bonus;

instance DIA_BUSTER_ABOUTSENTENZA(C_INFO)
{
	npc = sld_802_buster;
	nr = 1;
	condition = dia_buster_aboutsentenza_condition;
	information = dia_buster_aboutsentenza_info;
	permanent = FALSE;
	description = "��� ��� ������ ��������?";
};


func int dia_buster_aboutsentenza_condition()
{
	if(BUSTER_SENTENZATIP == TRUE)
	{
		return TRUE;
	};
};

func void dia_buster_aboutsentenza_info()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_00");	//��� ��� ������ ��������?
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_01");	//�� ���������� �������� �� ���� ������, ����� �� ������ ������� �� ����� - �� ������ ��� �� �����.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_02");	//�� ����� �����, � �� ��������. � ��� ��� � ������, ����� ������ ���� ������ ���. � ��� ������, �� ������������ �� ���� ����� �����.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_03");	//������ �� ������, ��� �� ������. � ������� ��� ���� ��� ���� ������, �� ��� ��� ����� ���� �������. � ����� � ���� ����������� �����.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_04");	//� �����, ��� �� ������� �����, ������� ����� �� ������� ���.
	AI_Output(other,self,"DIA_Buster_AboutSentenza_15_05");	//������� �� �����.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_13_06");	//����������. �� ����� ��� ���� ������?
	Info_ClearChoices(dia_buster_aboutsentenza);
	Info_AddChoice(dia_buster_aboutsentenza,"���.",dia_buster_aboutsentenza_no);
	if(Npc_HasItems(other,itmi_gold) >= 5)
	{
		Info_AddChoice(dia_buster_aboutsentenza,"��, ��� ����� - 5 ������� �����.",dia_buster_aboutsentenza_give);
	};
};

func void dia_buster_aboutsentenza_give()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_Give_15_00");	//��, ��� ����� - 5 ������� �����.
	b_giveinvitems(other,self,itmi_gold,5);
	AI_Output(self,other,"DIA_Buster_AboutSentenza_Give_13_01");	//�������. ������, ��� �� ��� �� �����. � �� ������ ����� �������.
	BUSTER_GOLDZUMBRENNEN = TRUE;
	BUSTER_BONUS = 50;
	Info_ClearChoices(dia_buster_aboutsentenza);
};

func void dia_buster_aboutsentenza_no()
{
	AI_Output(other,self,"DIA_Buster_AboutSentenza_No_15_00");	//���.
	AI_Output(self,other,"DIA_Buster_AboutSentenza_No_13_01");	//� ��� � �����.
	Info_ClearChoices(dia_buster_aboutsentenza);
};


instance DIA_BUSTER_LEELEADER(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_leeleader_condition;
	information = dia_buster_leeleader_info;
	permanent = FALSE;
	description = "��������� ����������� ��, ��?";
};


func int dia_buster_leeleader_condition()
{
	if(BUSTER_DUELL == TRUE)
	{
		return TRUE;
	};
};

func void dia_buster_leeleader_info()
{
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_00");	//��������� ����������� ��, ��?
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_01");	//��������� - ��, ������ � ��������, ��� ����� ����! �� ���� ��� � �������.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_02");	//(��������) ��� � �.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_03");	//� �� ����� ����, ����� ��� �������. � ��������� ����� ���� ����.
	AI_Output(other,self,"DIA_Buster_LeeLeader_15_04");	//� ���� ���� ������ ��������.
	AI_Output(self,other,"DIA_Buster_LeeLeader_13_05");	//����� �� ������ ��������� - � ��� ��� ������ ����������.
};


instance DIA_BUSTER_WHATHAPPENED(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_whathappened_condition;
	information = dia_buster_whathappened_info;
	permanent = FALSE;
	description = "��� ����� � ���������� �� �������?";
};


func int dia_buster_whathappened_condition()
{
	if(Npc_KnowsInfo(other,dia_buster_leeleader) && ((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG)))
	{
		return TRUE;
	};
};

func void dia_buster_whathappened_info()
{
	AI_Output(other,self,"DIA_Buster_WhatHappened_15_00");	//��� ����� � ���������� �� �������?
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_01");	//����� ����, ��� ������� �� �����, �� ����� ��� �� �������. �� ������, ��� ��� ������ �� �������, ���� �� ����� ��������� ������. � �� ��� ����.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_02");	//������ �� ����� ����� ���� ���������� ��������. �������� ������ ���, ����� �� �� ������� ��������� �� ������.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_03");	//���� ����������� �� ��� ������ ������ ��� ���� ���������.
	AI_Output(self,other,"DIA_Buster_WhatHappened_13_04");	//���� ������ ��� ����, � �� ����� �������� �����, ����� ����������� ����������� �������� � ����� ���������� �������.
};


instance DIA_BUSTER_TEACH(C_INFO)
{
	npc = sld_802_buster;
	nr = 8;
	condition = dia_buster_teach_condition;
	information = dia_buster_teach_info;
	permanent = TRUE;
	description = "�� ������ ������� ���� ���������?";
};


func int dia_buster_teach_condition()
{
	if(Npc_GetTalentSkill(other,NPC_TALENT_1H) <= 30)
	{
		return TRUE;
	};
};

func void dia_buster_teach_info()
{
	AI_Output(other,self,"DIA_Buster_Teach_15_00");	//�� ������ ������� ���� ���������?
	if(self.aivar[AIV_DEFEATEDBYPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_01");	//��, � ���� �������� ���� ������� �������...
	}
	else
	{
		AI_Output(self,other,"DIA_Buster_Teach_13_02");	//�� �� ��� �� ����, ��� ��������. ������, � ����� ���� ����, ��� ���� ���. �����, ����� ����, � ���� �������� ����� ������ ����...
	};
	if(BUSTERLOG == FALSE)
	{
		Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
		b_logentry(TOPIC_SOLDIERTEACHER,"������ ����� ������� ���� ��������� �������� ���������� �������.");
		BUSTERLOG = TRUE;
	};
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_buster_teach_1h_5);
};

func void dia_buster_teach_back()
{
	Info_ClearChoices(dia_buster_teach);
};

func void dia_buster_teach_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,30);
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_buster_teach_1h_5);
};

func void dia_buster_teach_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,30);
	Info_ClearChoices(dia_buster_teach);
	Info_AddChoice(dia_buster_teach,DIALOG_BACK,dia_buster_teach_back);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_buster_teach_1h_1);
	Info_AddChoice(dia_buster_teach,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_buster_teach_1h_5);
};


instance DIA_BUSTER_KAP3_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap3_exit_condition;
	information = dia_buster_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_buster_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_SHADOWBEASTS(C_INFO)
{
	npc = sld_802_buster;
	nr = 30;
	condition = dia_buster_shadowbeasts_condition;
	information = dia_buster_shadowbeasts_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_buster_shadowbeasts_condition()
{
	if(((KAPITEL == 3) || (KAPITEL == 4)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};

func void b_dia_buster_shadowbeasts_ok()
{
	AI_StopProcessInfos(self);
};

func void dia_buster_shadowbeasts_info()
{
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_00");	//��, ��������!
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_01");	//��� ���� �����?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_02");	//��������� ����� � ��� �����, ��� ����� ���������� ����� � ���� ����.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_15_03");	//�?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_04");	//��� �������, � ����, ��� ��� ����� �������.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_13_05");	//�������� �� ������ ����� �������� ������� ����� �� ������������ �����.
	Info_ClearChoices(dia_buster_shadowbeasts);
	Info_AddChoice(dia_buster_shadowbeasts,"��� ���� ��������, � ������� �� ��������?",dia_buster_shadowbeasts_wer);
	Info_AddChoice(dia_buster_shadowbeasts,"��� �� ��� ��������?",dia_buster_shadowbeasts_was);
	Info_AddChoice(dia_buster_shadowbeasts,"����� �� �������� ��� ��� ���?",dia_buster_shadowbeasts_ich);
};

func void dia_buster_shadowbeasts_ich()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_00");	//����� �� �������� ��� ��� ���?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_01");	//��� � �� ���� ��� �������. � ������ ���������� ����� � ������������� �� ����� ��������� ��������.
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_ich_15_02");	//�� ������ �������, �� ���������.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_ich_13_03");	//��, � ��� � ������.
};

func void dia_buster_shadowbeasts_was()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_15_00");	//��� �� ��� ��������?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_01");	//���� �������� ����������, ��� ����� ����� ������� ������� ���� ����������.
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_13_02");	//���-�� ������ ������� � ��� � ����������� �� ���� ������. ��� ��� ����� �� � �����.
	Info_AddChoice(dia_buster_shadowbeasts,"������� �� ���� ����� ����������?",dia_buster_shadowbeasts_was_wieviel);
};

func void dia_buster_shadowbeasts_was_wieviel()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_00");	//������� �� ���� ����� ����������?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_01");	//����� ���� �����! ����� ������ ��� �����.
	if(BUSTER_GOLDZUMBRENNEN == TRUE)
	{
		AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_was_wieviel_13_02");	//� ����� � ��� ������, ��� �� ��� ���, � ������ ��� ���� ������ ����.
	};
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_was_wieviel_15_03");	//������ ���������! � ��� ���� �����, ����� ������ ��� ����.
	MIS_BUSTER_KILLSHADOWBEASTS_DJG = LOG_RUNNING;
	Log_CreateTopic(TOPIC_BUSTER_KILLSHADOWBEASTS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BUSTER_KILLSHADOWBEASTS,LOG_RUNNING);
	b_logentry(TOPIC_BUSTER_KILLSHADOWBEASTS,"������ ���� ������� ���� �� ������ ��� ���������, ��� � ������� ���.");
	Info_ClearChoices(dia_buster_shadowbeasts);
};

func void dia_buster_shadowbeasts_wer()
{
	AI_Output(other,self,"DIA_Buster_SHADOWBEASTS_wer_15_00");	//��� ���� ��������, � ������� �� ��������?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_01");	//��� �� ������, ��������. � ���, ��-������, ����� - ���������� ���� ���������? �� ���, ������ �������� ����?
	AI_Output(self,other,"DIA_Buster_SHADOWBEASTS_wer_13_02");	//���� �� ������ ����� ���� �� ����, ��� ������ ������ �� ����, �������?
};


instance DIA_BUSTER_BRINGTROPHYSHADOWBEAST(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_bringtrophyshadowbeast_condition;
	information = dia_buster_bringtrophyshadowbeast_info;
	permanent = TRUE;
	description = "������ ����� ����������...";
};


func int dia_buster_bringtrophyshadowbeast_condition()
{
	if((MIS_BUSTER_KILLSHADOWBEASTS_DJG == LOG_RUNNING) && (Npc_HasItems(other,itat_shadowhorn) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG)))
	{
		return TRUE;
	};
};


var int bustertrophyshadowbeastcounter;

func void dia_buster_bringtrophyshadowbeast_info()
{
	var int bustertrophyshadowbeastcount;
	var int xp_bringbustertrophyshadowbeast;
	var int xp_bringbustertrophyshadowbeasts;
	var int bustersbustertrophyshadowbeastoffer;
	var int bustertrophyshadowbeastgeld;
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_00");	//��� �������� �� ������ ������� ���������� ������.
		AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_01");	//��� ��� ������?
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_02");	//�� �����. ������ �������� ��� ���� ����. ������ � ��� ����� �� ����, ��� � ���� ������.
		MIS_BUSTER_KILLSHADOWBEASTS_DJG = LOG_SUCCESS;
		b_giveplayerxp(XP_AMBIENT);
	}
	else if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_SHADOWHORN] == FALSE)
	{
		AI_Output(other,self,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_15_03");	//� ��� ����� ��������� ���������?
		AI_Output(self,other,"DIA_Buster_ANIMALTROPHYSHADOWBEAST_13_04");	//�� ����� �� ������? ��, ������, � ����� � ���� �����.
		Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
		Info_AddChoice(dia_buster_bringtrophyshadowbeast,"� ������� � ���� � ������.",dia_buster_bringtrophyshadowbeast_back);
		Info_AddChoice(dia_buster_bringtrophyshadowbeast,b_buildlearnstring("����� ����.",b_getlearncosttalent(other,NPC_TALENT_TAKEANIMALTROPHY)),dia_buster_bringtrophyshadowbeast_teach);
	}
	else
	{
		bustertrophyshadowbeastcount = Npc_HasItems(other,itat_shadowhorn);
		xp_bringbustertrophyshadowbeast = 20 * XP_PER_VICTORY;
		bustersbustertrophyshadowbeastoffer = VALUE_SHADOWHORN + BUSTER_BONUS;
		if(bustertrophyshadowbeastcount == 1)
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_05");	//� ������ ���� ��� ���������.
			b_giveplayerxp(xp_bringbustertrophyshadowbeast);
			b_giveinvitems(other,self,itat_shadowhorn,1);
			BUSTERTROPHYSHADOWBEASTCOUNTER = BUSTERTROPHYSHADOWBEASTCOUNTER + 1;
		}
		else
		{
			AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_15_06");	//� ������ ���� ���������� ��� ������ ��������.
			b_giveinvitems(other,self,itat_shadowhorn,bustertrophyshadowbeastcount);
			xp_bringbustertrophyshadowbeasts = bustertrophyshadowbeastcount * xp_bringbustertrophyshadowbeast;
			BUSTERTROPHYSHADOWBEASTCOUNTER = BUSTERTROPHYSHADOWBEASTCOUNTER + bustertrophyshadowbeastcount;
			b_giveplayerxp(xp_bringbustertrophyshadowbeasts);
		};
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_07");	//�������. ����� ����. � ������� ���, ���� �������. ��� �����, ��� ����� �������� ����� ��������� ��� ����.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_13_08");	//��� ���� ����.
		bustertrophyshadowbeastgeld = bustertrophyshadowbeastcount * bustersbustertrophyshadowbeastoffer;
		CreateInvItems(self,itmi_gold,bustertrophyshadowbeastgeld);
		b_giveinvitems(self,other,itmi_gold,bustertrophyshadowbeastgeld);
	};
};

func void dia_buster_bringtrophyshadowbeast_teach()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_teach_15_00");	//����� ����.
	if(b_teachplayertalenttakeanimaltrophy(self,other,TROPHY_SHADOWHORN))
	{
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_01");	//�����, ������. �������� ���������, � ��� ����� ������ ������ ��� ��� ������ �����.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_02");	//����� ������������ ��� � ��� ��� � ������� �������� ������ ������ ����.
		AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_03");	//��, � ����� ������ ���������� ��� �����, ��������� ��� ��� �����, � ������� ��� ���� � ������.
		if(MIS_BUSTER_KILLSHADOWBEASTS_DJG == LOG_RUNNING)
		{
			AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_teach_13_04");	//� ��������� ��� ���. � �����, � ���� ���������.
		};
	};
	Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
};

func void dia_buster_bringtrophyshadowbeast_back()
{
	AI_Output(other,self,"DIA_Buster_BringTrophyShadowbeast_back_15_00");	//� ������� � ���� � ������.
	AI_Output(self,other,"DIA_Buster_BringTrophyShadowbeast_back_13_01");	//�������.
	Info_ClearChoices(dia_buster_bringtrophyshadowbeast);
};


instance DIA_BUSTER_KAP4_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap4_exit_condition;
	information = dia_buster_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_buster_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_PERM4(C_INFO)
{
	npc = sld_802_buster;
	nr = 2;
	condition = dia_buster_perm4_condition;
	information = dia_buster_perm4_info;
	permanent = TRUE;
	description = "��� �� ������� �� ��������� �� ��������?";
};


func int dia_buster_perm4_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_buster_perm4_info()
{
	AI_Output(other,self,"DIA_Buster_Perm4_15_00");	//��� �� ������� �� ��������� �� ��������?
	AI_Output(self,other,"DIA_Buster_Perm4_13_01");	//��� ����� ����� ���������� ����� ���� ������ - ���� �� ������� � ����.
	AI_Output(self,other,"DIA_Buster_Perm4_13_02");	//� � ����������� �������� � ��.
};


instance DIA_BUSTER_KAP5_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap5_exit_condition;
	information = dia_buster_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_buster_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_KAP6_EXIT(C_INFO)
{
	npc = sld_802_buster;
	nr = 999;
	condition = dia_buster_kap6_exit_condition;
	information = dia_buster_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_buster_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_buster_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BUSTER_PICKPOCKET(C_INFO)
{
	npc = sld_802_buster;
	nr = 900;
	condition = dia_buster_pickpocket_condition;
	information = dia_buster_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_buster_pickpocket_condition()
{
	return c_beklauen(34,60);
};

func void dia_buster_pickpocket_info()
{
	Info_ClearChoices(dia_buster_pickpocket);
	Info_AddChoice(dia_buster_pickpocket,DIALOG_BACK,dia_buster_pickpocket_back);
	Info_AddChoice(dia_buster_pickpocket,DIALOG_PICKPOCKET,dia_buster_pickpocket_doit);
};

func void dia_buster_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_buster_pickpocket);
};

func void dia_buster_pickpocket_back()
{
	Info_ClearChoices(dia_buster_pickpocket);
};

