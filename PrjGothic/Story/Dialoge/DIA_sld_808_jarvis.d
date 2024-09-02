
instance DIA_JARVIS_EXIT(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 999;
	condition = dia_jarvis_exit_condition;
	information = dia_jarvis_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_jarvis_exit_condition()
{
	return TRUE;
};

func void dia_jarvis_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_JARVIS_HELLO(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 1;
	condition = dia_jarvis_hello_condition;
	information = dia_jarvis_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_jarvis_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_jarvis_hello_info()
{
	AI_Output(self,other,"DIA_Jarvis_Hello_04_00");	//��! � ���� ������-�� ����?
	AI_Output(other,self,"DIA_Jarvis_Hello_15_01");	//����� ����. � ���� ��� � �������.
	AI_Output(self,other,"DIA_Jarvis_Hello_04_02");	//�����... ��� ���� �����?
};


instance DIA_JARVIS_DIELAGE(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 2;
	condition = dia_jarvis_dielage_condition;
	information = dia_jarvis_dielage_info;
	permanent = FALSE;
	description = "��� ��������?";
};


func int dia_jarvis_dielage_condition()
{
	return TRUE;
};

func void dia_jarvis_dielage_info()
{
	AI_Output(other,self,"DIA_Jarvis_DieLage_15_00");	//��� ��������?
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_01");	//��������� ������� ��������. �������� ������������� �� ��� �������.
	AI_Output(self,other,"DIA_Jarvis_DieLage_04_02");	//������� � ��� ���� �����������, ��� �� ������ ���������� ����.
};


instance DIA_JARVIS_TWOFRONTS(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 3;
	condition = dia_jarvis_twofronts_condition;
	information = dia_jarvis_twofronts_info;
	permanent = FALSE;
	description = "� ��� ���������, ��� ��������� ��� �������?";
};


func int dia_jarvis_twofronts_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_twofronts_info()
{
	AI_Output(other,self,"DIA_Jarvis_TwoFronts_15_00");	//� ��� ���������, ��� ��������� ��� �������?
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_01");	//����������� �� ��� ������ �� ������� ������ � ��.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_02");	//�� ��������� �������� �������������� � ��� �����.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_03");	//��� �� �� �������, ��� ���� ����� � ��������� � ������.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_04");	//��� ���-�� ����������, ��� �� ����� ����. �� ������� ��� �������.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_05");	//�� ����������, ��� ����������� ����� ��, �� ������ �� �������� ������� ��������� ������ �� � ��� �����.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_06");	//����������� �� ����� �� �� ��������� ��� �������� �������. �� � ������ ���� ����� ������, ��� �������.
	AI_Output(self,other,"DIA_Jarvis_TwoFronts_04_07");	//�� �������� ����� �� �����������, ����� ����������� ���� ����.
};


instance DIA_JARVIS_LEESPLAN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 4;
	condition = dia_jarvis_leesplan_condition;
	information = dia_jarvis_leesplan_info;
	permanent = FALSE;
	description = "�� ������, ��� ���������� ������ ��?";
};


func int dia_jarvis_leesplan_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_leesplan_info()
{
	AI_Output(other,self,"DIA_Jarvis_LeesPlan_15_00");	//�� ������, ��� ���������� ������ ��?
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_01");	//�� �����, ����� �� �������� � ������ ������� ��������� � ������.
	};
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_02");	//�� ��������� �������� ��� ���� � ����� �������. ����� ���������, � �� ���� ������ ������ ����, ����� �������� ������.
	AI_Output(self,other,"DIA_Jarvis_LeesPlan_04_03");	//� �� ����, ��� �� ���������� ���������� ���, �� � ������� ���. �� ������ ��� ������� �������.
};


instance DIA_JARVIS_SYLVIOSPLAN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 5;
	condition = dia_jarvis_sylviosplan_condition;
	information = dia_jarvis_sylviosplan_info;
	permanent = FALSE;
	description = "�� ������, ��� ��������� �������?";
};


func int dia_jarvis_sylviosplan_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_sylviosplan_info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosPlan_15_00");	//�� ������, ��� ��������� �������?
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_01");	//������� �������, ��� ����� ��������� ����������� � ������ �������.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_02");	//�� �������, ��� ���������� �������� �� ��������� ��������� ��� ����� � ����� ��������������� ���� ���������.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_03");	//������� ������ �����, ���������� ������ �� ������� ��������� � ������, ��������� ����������������, �� � ��� �����.
	AI_Output(self,other,"DIA_Jarvis_SylviosPlan_04_04");	//�� �� ��������, ��� ��� ������ �� ����, ��� ����� ��������� � ���� ��������.
};


instance DIA_JARVIS_WANNAJOIN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 6;
	condition = dia_jarvis_wannajoin_condition;
	information = dia_jarvis_wannajoin_info;
	permanent = FALSE;
	description = "� ���� ����� ���������!";
};


func int dia_jarvis_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_jarvis_wannajoin_info()
{
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_00");	//� ���� ����� ���������!
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_01");	//� �� ������, ��� ��� ������� ����...
	AI_Output(other,self,"DIA_Jarvis_WannaJoin_15_02");	//� ��� ��������?
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_03");	//��, � ������ ���������� ���� �� ����, ���� ������.
	AI_Output(self,other,"DIA_Jarvis_WannaJoin_04_04");	//� �������� ��������, � ���������� �� ����, ������ ���� ���� ������, ��� �� �� ������� ��!
};


instance DIA_JARVIS_MISSIONKO(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 7;
	condition = dia_jarvis_missionko_condition;
	information = dia_jarvis_missionko_info;
	permanent = FALSE;
	description = "� ��� � ������ �������?";
};


func int dia_jarvis_missionko_condition()
{
	if(Npc_KnowsInfo(other,dia_jarvis_wannajoin) && Npc_KnowsInfo(other,dia_jarvis_dielage))
	{
		return TRUE;
	};
};

func void dia_jarvis_missionko_info()
{
	AI_Output(other,self,"DIA_Jarvis_MissionKO_15_00");	//� ��� � ������ �������?
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_01");	//��� ������. �������� ���������� ������ �������! ��� ��� ������� ����� ������, � ��� ��.
	AI_Output(self,other,"DIA_Jarvis_MissionKO_04_02");	//� ���� �� ������ �������������� ������ �����, �� ���� ������� ��������� �������� ���������.
	MIS_JARVIS_SLDKO = LOG_RUNNING;
	self.aivar[AIV_IGNORE_MURDER] = TRUE;
	Log_CreateTopic(TOPIC_JARVISSLDKO,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JARVISSLDKO,LOG_RUNNING);
	b_logentry(TOPIC_JARVISSLDKO,"������� �����, ����� � ������� ������� ������ �������, ����� �� ������ ���� ����� �� ����.");
};


instance DIA_JARVIS_DUELLREGELN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_duellregeln_condition;
	information = dia_jarvis_duellregeln_info;
	permanent = FALSE;
	description = "��� �� ������� ������?";
};


func int dia_jarvis_duellregeln_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_duellregeln_info()
{
	AI_Output(other,self,"DIA_Jarvis_DuellRegeln_15_00");	//��� �� ������� ������?
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_01");	//�������� � ��������, �� ��� ��������, ���� ���� ��� ���������.
	AI_Output(self,other,"DIA_Jarvis_DuellRegeln_04_02");	//� ����, ����� ����� ���� �� ���� �������������: ���� �� �������, ������ �� �������������� ���� ������ ��� ���. ���� ������ ���� ������� �������� ���� ������ � �����!
	b_logentry(TOPIC_JARVISSLDKO,"� ��� ���� �� ����� �������������� ���� �������� ������ �����...");
};


instance DIA_JARVIS_SYLVIOSMEN(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_sylviosmen_condition;
	information = dia_jarvis_sylviosmen_info;
	permanent = FALSE;
	description = "��� �� ��������� ���� �������?";
};


func int dia_jarvis_sylviosmen_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_sylviosmen_info()
{
	AI_Output(other,self,"DIA_Jarvis_SylviosMen_15_00");	//��� �� ��������� ���� �������?
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_01");	//�� �������. ������ �����, ��� ������� � ��� ������ ���� �����.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_02");	//����� ���� ���, ��������, ������ � �����.
	AI_Output(self,other,"DIA_Jarvis_SylviosMen_04_03");	//��������� �������� ���� ����������� �������, ���� �� ������� ��.
	b_logentry(TOPIC_JARVISSLDKO,"���� ������� - ��� ��� �������, ��� ������ ���� �����, ���, ��������, ������ � �����.");
};


instance DIA_JARVIS_HOWMANY(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_howmany_condition;
	information = dia_jarvis_howmany_info;
	permanent = FALSE;
	description = "������� ����� ������� � ������ ��������?";
};


func int dia_jarvis_howmany_condition()
{
	if(MIS_JARVIS_SLDKO == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void dia_jarvis_howmany_info()
{
	AI_Output(other,self,"DIA_Jarvis_HowMany_15_00");	//������� ����� ������� � ������ ��������?
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_01");	//���� �� �������� ����� �� ���, �� ��������, �� ���� �� �������.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_02");	//���� �� �������� - ��� ���� ����.
	AI_Output(self,other,"DIA_Jarvis_HowMany_04_03");	//��� ���� ���������: �� ����� �������� �������� ��������. �� �������� ������ ������ ������� - �� ������� �� ���� �������.
	b_logentry(TOPIC_JARVISSLDKO,"������ ����������, ���� � ������� ����� ����� �������. �������, � ����� ������� ��� ����� ���� �� �����������.");
};


instance DIA_JARVIS_HOWMANYLEFT(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_howmanyleft_condition;
	information = dia_jarvis_howmanyleft_info;
	permanent = TRUE;
	description = "������� ����� ������� ��� ��� ����� �������?";
};


func int dia_jarvis_howmanyleft_condition()
{
	if((MIS_JARVIS_SLDKO == LOG_RUNNING) && Npc_KnowsInfo(other,dia_jarvis_howmany))
	{
		return TRUE;
	};
};

func void dia_jarvis_howmanyleft_info()
{
	var int victories;
	AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_00");	//������� ����� ������� ��� ��� ����� �������?
	victories = 0;
	if((bullco.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (bullco.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_01");	//� ��������� �����.
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_02");	//� ������. �������.
		victories = victories + 1;
	};
	if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (rod.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_03");	//��� ������ ����� ������ �����������.
		victories = victories + 1;
	};
	if((sentenza.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (sentenza.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(Npc_KnowsInfo(other,dia_sentenza_hello))
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_04");	//�������� ������� �������� �� ���� ������ - �� ����� ������ ����.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_05");	//� ������� ��������.
		};
		victories = victories + 1;
	};
	if((fester.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (fester.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(MIS_FESTER_KILLBUGS == LOG_SUCCESS)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_06");	//������ ������� �������� ���� - ��� ���� ��� ������.
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_07");	//������ ������� �� ��������.
		};
		victories = victories + 1;
	};
	if((raoul.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (raoul.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		if(victories == 0)
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_08");	//��� �������� �����...
		}
		else
		{
			AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_09");	//� ����� ���������� � ������...
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_10");	//�?
		AI_Output(other,self,"DIA_Jarvis_HowManyLeft_15_11");	//���������, ��� ��� ������ ���������� �������.
		victories = victories + 1;
	};
	if(victories < 3)
	{
		if(victories == 0)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_12");	//�� ���� �� ������� �� ������ �� ����� �������.
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_13");	//������, ��������� � ��� �� ����.
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_14");	//� ����, ����� �� ������� ��� ������� ����� �� ���.
	}
	else
	{
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_15");	//����� ����������, ������ ����������.
		if(victories == 6)
		{
			AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_16");	//�� �� ���� �������� ����������, ��?
		};
		AI_Output(self,other,"DIA_Jarvis_HowManyLeft_04_17");	//� ������� - ���� �� ������� ��� ������, � ���������� �� ���� ��� ���������.
		MIS_JARVIS_SLDKO = LOG_SUCCESS;
		self.aivar[AIV_IGNORE_MURDER] = FALSE;
		b_giveplayerxp(XP_AMBIENT * victories);
		b_logentry(TOPIC_SLDRESPEKT,"������� ����������� �� ����, ���� � ���� �������������� � ���������.");
	};
};


var int jarvis_guildcomment;
var int jarvis_sylviocomment;

instance DIA_JARVIS_PERM(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 8;
	condition = dia_jarvis_perm_condition;
	information = dia_jarvis_perm_info;
	permanent = FALSE;
	description = "���� �������?";
};


func int dia_jarvis_perm_condition()
{
	if(other.guild != GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_jarvis_perm_info()
{
	AI_Output(other,self,"DIA_Jarvis_PERM_15_00");	//���� �������?
	if(KAPITEL <= 3)
	{
		if(JARVIS_GUILDCOMMENT == FALSE)
		{
			if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_01");	//������ �� ���� �� ���. ��� ������.
			}
			else
			{
				AI_Output(self,other,"DIA_Jarvis_PERM_04_02");	//�� ������ �������� �����, �� ��� �� ����� ����� �� ���.
			};
			JARVIS_GUILDCOMMENT = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_03");	//��������� �����, ���� ������� ����� �����-�� �����������. (������� ������)
		};
	};
	if(KAPITEL >= 4)
	{
		if(JARVIS_SYLVIOCOMMENT == FALSE)
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_04");	//������� �������-�� ������. ����� ����, ��� �� ������� � ��������, �� �� ������ ������� ���������� � �������.
			AI_Output(self,other,"DIA_Jarvis_PERM_04_05");	//��, ��������, ������, ��� ��� ����� �����.
			JARVIS_SYLVIOCOMMENT = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Jarvis_PERM_04_06");	//���, ���� ��� ��������. ��� ����� ���������, ��� ��� ��� ��������.
		};
	};
};


instance DIA_JARVIS_PICKPOCKET(C_INFO)
{
	npc = sld_808_jarvis;
	nr = 900;
	condition = dia_jarvis_pickpocket_condition;
	information = dia_jarvis_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_jarvis_pickpocket_condition()
{
	return c_beklauen(41,55);
};

func void dia_jarvis_pickpocket_info()
{
	Info_ClearChoices(dia_jarvis_pickpocket);
	Info_AddChoice(dia_jarvis_pickpocket,DIALOG_BACK,dia_jarvis_pickpocket_back);
	Info_AddChoice(dia_jarvis_pickpocket,DIALOG_PICKPOCKET,dia_jarvis_pickpocket_doit);
};

func void dia_jarvis_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_jarvis_pickpocket);
};

func void dia_jarvis_pickpocket_back()
{
	Info_ClearChoices(dia_jarvis_pickpocket);
};

