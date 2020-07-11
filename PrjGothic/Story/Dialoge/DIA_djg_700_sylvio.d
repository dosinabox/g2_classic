
instance DIA_SYLVIODJG_EXIT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 999;
	condition = dia_sylviodjg_exit_condition;
	information = dia_sylviodjg_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sylviodjg_exit_condition()
{
	return TRUE;
};

func void dia_sylviodjg_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIODJG_HELLOAGAIN(C_INFO)
{
	npc = djg_700_sylvio;
	condition = dia_sylviodjg_helloagain_condition;
	information = dia_sylviodjg_helloagain_info;
	important = TRUE;
};


func int dia_sylviodjg_helloagain_condition()
{
	if((Npc_IsDead(icedragon) == FALSE) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylviodjg_helloagain_info()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_00");	//��, ���� � �������! �� ���� ����� �������������, ��? � ���� ���! � ���� ���� ��������.
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_01");	//��������, ���� �� �������, ��� ��������� ����� ���� ������, �� ������� ����������. � ��� ����� ������.
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_02");	//��, ��! ���� ������ �� �����! ��� ����-������ ���! ����� ��� ���� ������ ���.
	}
	else
	{
		AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_03");	//�� ��, �������! ����������� � ���� �����. ����� ��� ���� ������ ���.
	};
	AI_Output(other,self,"DIA_SylvioDJG_HelloAgain_15_04");	//�����. ����� �� ����� ������������ � ������������.
	AI_Output(self,other,"DIA_SylvioDJG_HelloAgain_09_05");	//�� ��� ������ ���. �������.
};


instance DIA_SYLVIO_VERSAGER(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 6;
	condition = dia_sylvio_versager_condition;
	information = dia_sylvio_versager_info;
	description = "� ��� ���� �� �������?";
};


func int dia_sylvio_versager_condition()
{
	if(Npc_KnowsInfo(other,dia_sylviodjg_helloagain) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_versager_info()
{
	AI_Output(other,self,"DIA_Sylvio_VERSAGER_15_00");	//� ��� ���� �� �������?
	AI_Output(self,other,"DIA_Sylvio_VERSAGER_09_01");	//�� ����� �� ���� �������, ��������, ����� ���� ���� ����� �� �����, ��� ��� ��� �����������, ������� � �����.
};


instance DIA_SYLVIO_DEINELEUTE(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 7;
	condition = dia_sylvio_deineleute_condition;
	information = dia_sylvio_deineleute_info;
	description = "��� ���� ����?";
};


func int dia_sylvio_deineleute_condition()
{
	if(Npc_KnowsInfo(other,dia_sylvio_versager) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (MIS_DJG_SYLVIO_KILLICEGOLEM == 0))
	{
		return TRUE;
	};
};

func void dia_sylvio_deineleute_info()
{
	AI_Output(other,self,"DIA_Sylvio_DEINELEUTE_15_00");	//��� ���� ����?
	AI_Output(self,other,"DIA_Sylvio_DEINELEUTE_09_01");	//������ ���. �� ����� �� ������� ������. ��� ������ ��� ����� ���� ��� ������.
};


instance DIA_SYLVIO_WASISTPASSIERT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 8;
	condition = dia_sylvio_wasistpassiert_condition;
	information = dia_sylvio_wasistpassiert_info;
	description = "��� ��������� � ����?";
};


func int dia_sylvio_wasistpassiert_condition()
{
	if(Npc_KnowsInfo(other,dia_sylvio_versager) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_wasistpassiert_info()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_15_00");	//��� ��������� � ����?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_01");	//��� �� ������ ������ ���� ���� ������� ��������. �� ��������� ��.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_09_02");	//���� �� ����� ������, �����, �� ����������?
	Info_AddChoice(dia_sylvio_wasistpassiert,"������. ������ �� � ���?",dia_sylvio_wasistpassiert_ok);
	Info_AddChoice(dia_sylvio_wasistpassiert,"��� ��� ���� �������, ���� � ������ ���?",dia_sylvio_wasistpassiert_washastdudavon);
	Info_AddChoice(dia_sylvio_wasistpassiert,"� ��� ��� � ����� �����?",dia_sylvio_wasistpassiert_warum);
	Info_AddChoice(dia_sylvio_wasistpassiert,"������ �� �� ������������ � ���� ���?",dia_sylvio_wasistpassiert_selbst);
	Log_CreateTopic(TOPIC_SYLVIOKILLICEGOLEM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SYLVIOKILLICEGOLEM,LOG_RUNNING);
	b_logentry(TOPIC_SYLVIOKILLICEGOLEM,"������� ��������� ���� ������� ������� � ����� � ����������� ����� ������ ��������.");
	MIS_DJG_SYLVIO_KILLICEGOLEM = LOG_RUNNING;
};

func void dia_sylvio_wasistpassiert_selbst()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_selbst_15_00");	//������ �� �� ������������ � ���� ���?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_01");	//�����, �����. �� ���� ������.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_selbst_09_02");	//��-�����, � ���� ������ �������.
	Info_AddChoice(dia_sylvio_wasistpassiert,"� �� ����� � ���� ����.",dia_sylvio_wasistpassiert_keininteresse);
};


var int djg_sylvio_promisedmoney;

func void dia_sylvio_wasistpassiert_warum()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_warum_15_00");	//��� � �� ��� ������?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_warum_09_01");	//�� ����. ��, ������... 1000 ������� �����. ��� ���� ���?
	DJG_SYLVIO_PROMISEDMONEY = TRUE;
};

func void dia_sylvio_wasistpassiert_washastdudavon()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00");	//��� ��� ���� �������, ���� � ������ ���?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01");	//���� ��� ��� �����. ��, ������� �� ���� ������, �����: � ���� ������� � ���� ������� �����.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02");	//� ���������, �� ���� ���� ����� ��� ������� �����.
	Info_AddChoice(dia_sylvio_wasistpassiert,"��� ���� ������ � ���� ������� ������?",dia_sylvio_wasistpassiert_eisregion);
};

func void dia_sylvio_wasistpassiert_keininteresse()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00");	//� �� ����� � ���� ����.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01");	//��-�. ����� �������� ������, ����.
	AI_StopProcessInfos(self);
};

func void dia_sylvio_wasistpassiert_eisregion()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00");	//��� ���� ������ � ���� ������� ������?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01");	//�� �����-������ ����������� �������� �������, �? ������, � ����� ����.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02");	//���, �� ����� �������, ��������� ������� ������. �� ����� ������� ������ �� �����.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03");	//��� ���������� ������� ������ ������ �� ����� �����.
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04");	//��� ����� ���. ��� ���? �� ��� ���?
};

func void dia_sylvio_wasistpassiert_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASISTPASSIERT_ok_15_00");	//������. ������ �� � ���?
	AI_Output(self,other,"DIA_Sylvio_WASISTPASSIERT_ok_09_01");	//����� ����������. � �� ���� ����� �����.
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_ICEGOLEMSKILLED(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 9;
	condition = dia_sylvio_icegolemskilled_condition;
	information = dia_sylvio_icegolemskilled_info;
	description = "���� ���� ����!";
};


func int dia_sylvio_icegolemskilled_condition()
{
	if(Npc_IsDead(icegolem_sylvio1) && Npc_IsDead(icegolem_sylvio2) && (MIS_DJG_SYLVIO_KILLICEGOLEM == LOG_RUNNING) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_icegolemskilled_info()
{
	AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_00");	//���� ���� ����! ������� �������� ������ ���.
	AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_01");	//�������� ������. ���������, ��� ��� � ��� ����.
	if(DJG_SYLVIO_PROMISEDMONEY == TRUE)
	{
		AI_Output(other,self,"DIA_Sylvio_ICEGOLEMSKILLED_15_02");	//���������. � ��� ��� ������?
		AI_Output(self,other,"DIA_Sylvio_ICEGOLEMSKILLED_09_03");	//����� ���� �����.
	};
	AI_StopProcessInfos(self);
	MIS_DJG_SYLVIO_KILLICEGOLEM = LOG_SUCCESS;
	b_giveplayerxp(XP_SYLVIODJGICEGOLEMDEAD);
	Npc_ExchangeRoutine(self,"IceWait1");
	b_startotherroutine(djg_bullco,"IceWait1");
};


instance DIA_SYLVIO_WASJETZT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 10;
	condition = dia_sylvio_wasjetzt_condition;
	information = dia_sylvio_wasjetzt_info;
	description = "��� ���?";
};


func int dia_sylvio_wasjetzt_condition()
{
	if((MIS_DJG_SYLVIO_KILLICEGOLEM == LOG_SUCCESS) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_wasjetzt_info()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_15_00");	//��� ���?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_01");	//��. ��� ���-�� ���������� ��� �� ����� ��������.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_09_02");	//����� ����� �����, ���� �� ������� ������, � � ����� �� �����.
	Info_AddChoice(dia_sylvio_wasjetzt,"������, �����.",dia_sylvio_wasjetzt_ok);
	Info_AddChoice(dia_sylvio_wasjetzt,"�� �������?",dia_sylvio_wasjetzt_trennen);
	Info_AddChoice(dia_sylvio_wasjetzt,"� �� ��������� ������ ��� ������� ������ �� ����.",dia_sylvio_wasjetzt_nein);
	if(DJG_SYLVIO_PROMISEDMONEY == TRUE)
	{
		Info_AddChoice(dia_sylvio_wasjetzt,"�������, � ���� ������� ���� ������.",dia_sylvio_wasjetzt_geld);
	};
};

func void dia_sylvio_wasjetzt_trennen()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_trennen_15_00");	//�� �������?
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_trennen_09_01");	//����, ������ �������. ��� ������.
};

func void dia_sylvio_wasjetzt_ok()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_ok_15_00");	//������, �����.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_ok_09_01");	//�����, �������!
	AI_StopProcessInfos(self);
};

func void dia_sylvio_wasjetzt_nein()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_nein_15_00");	//� �� ��������� ������ ��� ������� ������ �� ����.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_nein_09_01");	//����!
	AI_StopProcessInfos(self);
};

func void dia_sylvio_wasjetzt_geld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_Geld_15_00");	//�������, � ���� ������� ���� ������.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_Geld_09_01");	//����� �� ������� �������, � ���� ����� ������� �����, ��� �� ������� ������.
	Info_AddChoice(dia_sylvio_wasjetzt,"� ���� �������� ���� ������ ������.",dia_sylvio_wasjetzt_jetztgeld);
};

func void dia_sylvio_wasjetzt_jetztgeld()
{
	AI_Output(other,self,"DIA_Sylvio_WASJETZT_jetztGeld_15_00");	//� ���� �������� ���� ������ ������.
	AI_Output(self,other,"DIA_Sylvio_WASJETZT_jetztGeld_09_01");	//���� �� ������� ������� ����, ���� ��� �������� ����������� � �����.
};


instance DIA_SYLVIO_KOMMSTDU(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 11;
	condition = dia_sylvio_kommstdu_condition;
	information = dia_sylvio_kommstdu_info;
	permanent = TRUE;
	description = "� �����, �� ������������� � ������� �����.";
};


func int dia_sylvio_kommstdu_condition()
{
	if(Npc_KnowsInfo(other,dia_sylvio_wasjetzt) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_sylvio_kommstdu_info()
{
	AI_Output(other,self,"DIA_Sylvio_KOMMSTDU_15_00");	//� �����, �� ������������� � ������� �����.
	AI_Output(self,other,"DIA_Sylvio_KOMMSTDU_09_01");	//��� ������. � � ����� �����.
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIO_DUHIER(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 11;
	condition = dia_sylvio_duhier_condition;
	information = dia_sylvio_duhier_info;
	permanent = TRUE;
	description = "��� �� �������� �� ���� ������.";
};


func int dia_sylvio_duhier_condition()
{
	if((Npc_IsDead(icedragon) == FALSE) && (icedragon.aivar[AIV_TALKEDTOPLAYER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_sylvio_duhier_info()
{
	AI_Output(other,self,"DIA_Sylvio_DUHIER_15_00");	//��� �� �������� �� ���� ������.
	AI_Output(self,other,"DIA_Sylvio_DUHIER_09_01");	//����. �� � ��� ����������� ������������.
	AI_StopProcessInfos(self);
};


instance DIA_SYLVIODJG_WHATNEXT(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 12;
	condition = dia_sylviodjg_whatnext_condition;
	information = dia_sylviodjg_whatnext_info;
	important = TRUE;
};


func int dia_sylviodjg_whatnext_condition()
{
	if(Npc_IsDead(icedragon))
	{
		return TRUE;
	};
};

func void dia_sylviodjg_whatnext_info()
{
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_00");	//������� ������ �����! � ������ �� ������ ��� ���, ��� � ���� ����!
	AI_Output(other,self,"DIA_SylvioDJG_WHATNEXT_15_01");	//�� �� ���!
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_02");	//��� � ������ ��� ����� �� �������� �������� �������.
	AI_Output(self,other,"DIA_SylvioDJG_WHATNEXT_09_03");	//� ���� ��������� ���� � ���� ���� ��������!
	TOPIC_END_SYLVIOKILLICEGOLEM = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_sylviodjg_whatnext);
	Info_AddChoice(dia_sylviodjg_whatnext,DIALOG_ENDE,dia_sylviodjg_whatnext_attack);
};

func void dia_sylviodjg_whatnext_attack()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	Npc_ExchangeRoutine(self,"Start");
	b_startotherroutine(djg_bullco,"Start");
	b_logentry(TOPIC_DRAGONHUNTER,"��� ������� ������ ������� ��������� ��������� ���� ��� ������ ��� �������� ���������. �� ������� ����������.");
	b_attack(self,other,AR_NONE,1);
	b_attack(djg_bullco,other,AR_NONE,1);
};


instance DIA_SYLVIODJG_BUTNOW(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 13;
	condition = dia_sylviodjg_butnow_condition;
	information = dia_sylviodjg_butnow_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_sylviodjg_butnow_condition()
{
	if(Npc_IsDead(icedragon) && (Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(other,dia_sylviodjg_whatnext))
	{
		return TRUE;
	};
};

func void dia_sylviodjg_butnow_info()
{
	AI_Output(self,other,"DIA_SylvioDJG_BUTNOW_09_00");	//������ ����� ��������.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	b_attack(self,other,AR_NONE,1);
	b_attack(djg_bullco,other,AR_NONE,1);
};


instance DIA_SYLVIO_PICKPOCKET(C_INFO)
{
	npc = djg_700_sylvio;
	nr = 900;
	condition = dia_sylvio_pickpocket_condition;
	information = dia_sylvio_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_100;
};


func int dia_sylvio_pickpocket_condition()
{
	return c_beklauen(78,560);
};

func void dia_sylvio_pickpocket_info()
{
	Info_ClearChoices(dia_sylvio_pickpocket);
	Info_AddChoice(dia_sylvio_pickpocket,DIALOG_BACK,dia_sylvio_pickpocket_back);
	Info_AddChoice(dia_sylvio_pickpocket,DIALOG_PICKPOCKET,dia_sylvio_pickpocket_doit);
};

func void dia_sylvio_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_sylvio_pickpocket);
};

func void dia_sylvio_pickpocket_back()
{
	Info_ClearChoices(dia_sylvio_pickpocket);
};

