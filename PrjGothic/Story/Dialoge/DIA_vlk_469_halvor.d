
instance DIA_HALVOR_EXIT(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 999;
	condition = dia_halvor_exit_condition;
	information = dia_halvor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_halvor_exit_condition()
{
	return TRUE;
};

func void dia_halvor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HALVOR_PICKPOCKET(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 900;
	condition = dia_halvor_pickpocket_condition;
	information = dia_halvor_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_halvor_pickpocket_condition()
{
	return c_beklauen(78,150);
};

func void dia_halvor_pickpocket_info()
{
	Info_ClearChoices(dia_halvor_pickpocket);
	Info_AddChoice(dia_halvor_pickpocket,DIALOG_BACK,dia_halvor_pickpocket_back);
	Info_AddChoice(dia_halvor_pickpocket,DIALOG_PICKPOCKET,dia_halvor_pickpocket_doit);
};

func void dia_halvor_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_halvor_pickpocket);
};

func void dia_halvor_pickpocket_back()
{
	Info_ClearChoices(dia_halvor_pickpocket);
};


instance DIA_HALVOR_HALLO(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_hallo_condition;
	information = dia_halvor_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_halvor_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && Wld_IsTime(5,0,20,0))
	{
		return TRUE;
	};
};

func void dia_halvor_hallo_info()
{
	AI_Output(self,other,"DIA_Halvor_Hallo_06_00");	//��, ���� ����� ����? � ���� ����� ������� ���� - � ����� ������ ����!
	Log_CreateTopic(TOPIC_CITYTRADER,LOG_NOTE);
	b_logentry(TOPIC_CITYTRADER,"������ ������� ����� � ������.");
};


instance DIA_HALVOR_TRADE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_trade_condition;
	information = dia_halvor_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "������ ��� ���� ����.";
};


func int dia_halvor_trade_condition()
{
	if(Npc_KnowsInfo(hero,dia_halvor_hallo) && Wld_IsTime(5,0,20,0) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_trade_info()
{
	b_givetradeinv(self);
	AI_Output(other,self,"DIA_Halvor_TRADE_15_00");	//������ ��� ���� ����.
};


instance DIA_HALVOR_NIGHT(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_night_condition;
	information = dia_halvor_night_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_halvor_night_condition()
{
	if(Wld_IsTime(20,0,0,0) && Npc_IsInState(self,zs_talk) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_night_info()
{
	AI_Output(self,other,"DIA_Halvor_Night_06_00");	//��, ���� �� ������ ������ ����, ������ �� ��� ������. ������?
};


instance DIA_HALVOR_MESSAGE(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_message_condition;
	information = dia_halvor_message_info;
	permanent = FALSE;
	description = "� �����, ���� ������ ������ ����� ��������� � ����...";
//	trade = FALSE;
};


func int dia_halvor_message_condition()
{
	if(KNOWS_HALVOR == TRUE)
	{
		return TRUE;
	};
};

func void dia_halvor_message_info()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_15_00");	//� �����, ���� ������ ������ ����� ��������� � ����...
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_01");	//���?.. ��� ��������.
	b_usefakescroll();
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_02");	//(� ��������) �-�... ������, ����� ��������� �������� �� ���� - �-�... ��������. � ���������� ������, ���������� �� ��������.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_06_03");	//(���������) �� ��� ������������� �������� �� ���� ���������, ������? � ������, �� ����� ������ � ���������������, ����� ���?
	Info_ClearChoices(dia_halvor_message);
	Info_AddChoice(dia_halvor_message,"��, �������� ������� ��� �����������.",dia_halvor_message_offer);
	Info_AddChoice(dia_halvor_message,"������, ���� ������ ������.",dia_halvor_message_prison);
};

func void dia_halvor_message_offer()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_OFFER_15_00");	//��, �������� ������� ��� �����������.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_01");	//������. �������� ����. � ���� ������� ���� �� ������ ����.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_OFFER_06_03");	//���� �� ������ ��� ���� ������ ������, �-�... � �������� �� ����, �� � � ����� ����� ��������� ��������� ����������.
	Info_ClearChoices(dia_halvor_message);
	Info_AddChoice(dia_halvor_message,"������, ������������.",dia_halvor_message_okay);
	Info_AddChoice(dia_halvor_message,"������, ���� ������ ������.",dia_halvor_message_prison);
	Info_AddChoice(dia_halvor_message,"�� ��?! � ��� ��� �� ������?",dia_halvor_message_deal);
};

func void dia_halvor_message_prison()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_00");	//������, ���� ������ ������.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_01");	//���, �������, �� �� ������ ��������� ���! ���� �... �... �� �� ���������... � ������ �������.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_PRISON_15_02");	//���� ������ �������� �� ���� ������. � ������ � ��������� �������� � ���� ����� �����.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_PRISON_06_03");	//�� ��������� �� ����.
	BETRAYAL_HALVOR = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_halvor_message_deal()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_00");	//�� ��?! � ��� ��� �� ������?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_01");	//��, � ��� �� ���������� ����... ��������� ����, ���������? �� ������� �������, ������� ������� ������ ��� ���.
	AI_Output(other,self,"DIA_Halvor_MESSAGE_DEAL_15_02");	//�� ������ � ���� ���-�� ����� ����, ���������� ���� ������ ��������?
	AI_Output(self,other,"DIA_Halvor_MESSAGE_DEAL_06_03");	//�� ��� ��������� ���������. � ���� ���� ��������� �����... ���.
};

func void dia_halvor_message_okay()
{
	AI_Output(other,self,"DIA_Halvor_MESSAGE_Okay_15_00");	//������, ������������. � �����, �� �������� ��� ��� � �����.
	AI_Output(self,other,"DIA_Halvor_MESSAGE_Okay_06_01");	//�������. ������, ����� ����� ������ ����������. � ���������� ����� ���������� ������� ��� ����.
	b_giveinvitems(other,self,itwr_halvormessage,1);
	Npc_RemoveInvItems(self,itwr_halvormessage,1);
	HALVOR_DEAL = TRUE;
	DIEBESGILDE_OKAY = DIEBESGILDE_OKAY + 1;
	CreateInvItems(self,itse_erzfisch,1);
	CreateInvItems(self,itse_goldfisch,1);
	CreateInvItems(self,itse_ringfisch,1);
	CreateInvItems(self,itse_lockpickfisch,1);
	Info_ClearChoices(dia_halvor_message);
};


instance DIA_HALVOR_ZEICHEN(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_zeichen_condition;
	information = dia_halvor_zeichen_info;
	permanent = FALSE;
	description = "(�������� ������ �����)";
};


func int dia_halvor_zeichen_condition()
{
	if((KNOWS_SECRETSIGN == TRUE) && (BETRAYAL_HALVOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_zeichen_info()
{
	AI_PlayAni(other,"T_YES");
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_00");	//�������. �� ������ �� ������ ������ ����.
	AI_Output(self,other,"DIA_Halvor_Zeichen_06_01");	//(����) � ����� ������� ���� �����������. ���� � ���� ���� ���������� ������� ��� ����, � ������ �� �� ������� ����.
	CreateInvItems(self,itke_lockpick,20);
	Log_CreateTopic(TOPIC_DIEBESGILDE,LOG_NOTE);
	b_logentry(TOPIC_DIEBESGILDE,"������ ����� ���������� ������� � ����� �� ����� ������� ����.");
};


instance DIA_HALVOR_HEHLEREI(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 2;
	condition = dia_halvor_hehlerei_condition;
	information = dia_halvor_hehlerei_info;
	permanent = TRUE;
	description = "(������� ��� ������� � �����)";
};


func int dia_halvor_hehlerei_condition()
{
	if(Npc_KnowsInfo(other,dia_halvor_zeichen) && (BETRAYAL_HALVOR == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_hehlerei_info()
{
	HALVOR_SCORE = 0;
	if(HALVOR_DAY != Wld_GetDay())
	{
		if((Npc_HasItems(other,itmi_silverplate) >= 1) || (Npc_HasItems(other,itmi_silvercup) >= 1))
		{
			HALVOR_SCORE = (Npc_HasItems(other,itmi_silverplate) * (VALUE_SILVERPLATE / 2)) + (Npc_HasItems(other,itmi_silvercup) * (VALUE_SILVERCUP / 2));
			if(HALVOR_SCORE <= 1000)
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_05");	//�� ���� ������� � ��� ����...
				b_say_gold(self,other,HALVOR_SCORE);
				Info_ClearChoices(dia_halvor_hehlerei);
				Info_AddChoice(dia_halvor_hehlerei,"������. �������!",dia_halvor_hehlerei_annehmen);
				Info_AddChoice(dia_halvor_hehlerei,"� ������� ��� ����.",dia_halvor_hehlerei_ablehnen);
			}
			else
			{
				AI_Output(self,other,"DIA_Halvor_Zeichen_06_06");	//�� ������ ������� �����. � ���� ��� ������� ������ �����.
				Info_ClearChoices(dia_halvor_hehlerei);
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Halvor_Zeichen_06_02");	//������, ����� � ���� ����� ���������� ������� ��� ����.
			Info_ClearChoices(dia_halvor_hehlerei);
		};
	}
	else if(Wld_GetDay() == 0)
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_03");	//�� ������ ������ ��� ���� ������� ������. ������� ������� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Halvor_Zeichen_06_04");	//������, �� ������� � �� ����� ����� ����. ������ ������, ������?
	};
};

func void dia_halvor_hehlerei_annehmen()
{
	var int amount;
	var string concattext;
	amount = Npc_HasItems(other,itmi_silverplate) + Npc_HasItems(other,itmi_silvercup);
	concattext = ConcatStrings(IntToString(amount),PRINT_ITEMSGEGEBEN);
	AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
	Npc_RemoveInvItems(other,itmi_silvercup,Npc_HasItems(other,itmi_silvercup));
	Npc_RemoveInvItems(other,itmi_silverplate,Npc_HasItems(other,itmi_silverplate));
	b_giveinvitems(self,other,itmi_gold,HALVOR_SCORE);
	AI_Output(other,self,"DIA_Halvor_Zeichen_Annehmen_15_00");	//������. �������!
	AI_Output(self,other,"DIA_Halvor_Zeichen_Annehmen_06_01");	//�� ��������� ��������� ������� ������ �������. ����� �� ������� �� ��� �� ������, ��� ����� ������� ����������, ���������?
	HALVOR_DAY = Wld_GetDay();
	Info_ClearChoices(dia_halvor_hehlerei);
};

func void dia_halvor_hehlerei_ablehnen()
{
	Info_ClearChoices(dia_halvor_hehlerei);
};


instance DIA_HALVOR_CREW(C_INFO)
{
	npc = vlk_469_halvor;
	nr = 51;
	condition = dia_halvor_crew_condition;
	information = dia_halvor_crew_info;
	permanent = FALSE;
	description = "� ������� �������.";
};


func int dia_halvor_crew_condition()
{
	if((MIS_SCKNOWSWAYTOIRDORATH == TRUE) && (HALVOR_AUSGELIEFERT == FALSE))
	{
		return TRUE;
	};
};

func void dia_halvor_crew_info()
{
	AI_Output(other,self,"DIA_Halvor_Crew_15_00");	//� ������� �������.
	AI_Output(self,other,"DIA_Halvor_Crew_06_01");	//� ��� �� ���������� ������ ������?
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,"��� ��� ����.",dia_halvor_crew_mything);
	Info_AddChoice(dia_halvor_crew,"����� ���� ���������� �������.",dia_halvor_crew_stealship);
};

func void dia_halvor_crew_mything()
{
	AI_Output(other,self,"DIA_Halvor_Crew_MyThing_15_00");	//��� ��� ����.
	AI_Output(self,other,"DIA_Halvor_Crew_MyThing_06_01");	//��� ������. ��� ������������� �� ��� ����.
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,DIALOG_BACK,dia_halvor_crew_back);
	Info_AddChoice(dia_halvor_crew,"������ ����� �� ����?",dia_halvor_crew_joinme);
	Info_AddChoice(dia_halvor_crew,"�� ������ ������ ���?",dia_halvor_crew_helpme);
};

func void dia_halvor_crew_stealship()
{
	AI_Output(other,self,"DIA_Halvor_Crew_StealShip_15_00");	//����� ���� ���������� �������.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_01");	//��, �����. �� ��� ��������? �������� ������� �� ���� �������, ���� ��������� �� ����.
	AI_Output(self,other,"DIA_Halvor_Crew_StealShip_06_02");	//�������� ��� ������, �� � �� ��������� ��������� ����� ������.
	Info_ClearChoices(dia_halvor_crew);
	Info_AddChoice(dia_halvor_crew,DIALOG_BACK,dia_halvor_crew_back);
	Info_AddChoice(dia_halvor_crew,"������ ����� �� ����?",dia_halvor_crew_joinme);
	if(Npc_IsDead(jack) == FALSE)
	{
		Info_AddChoice(dia_halvor_crew,"�� ������ ������ ���?",dia_halvor_crew_helpme);
	};
};

func void dia_halvor_crew_joinme()
{
	AI_Output(other,self,"DIA_Halvor_Crew_JoinMe_15_00");	//������ ����� �� ����?
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_01");	//����, �������. � ���� � ����� ������ �������. ����� ����, ���� ������, � �� ���� ������������� � �������, ������ �����.
	AI_Output(self,other,"DIA_Halvor_Crew_JoinMe_06_02");	//�� � ��� �� ����� ���� �����.
};

func void dia_halvor_crew_helpme()
{
	AI_Output(other,self,"DIA_Halvor_Crew_HelpMe_15_00");	//�� ������ ������ ���?
	AI_Output(self,other,"DIA_Halvor_Crew_HelpMe_06_01");	//� �� ����� ������� ��� �����. ����� �������� � ������, �� ������ ��������� ���-�� �����, � ������. �� ����� �����, ��� ���� ����� ��� ����� �����������.
};

func void dia_halvor_crew_back()
{
	Info_ClearChoices(dia_halvor_crew);
};

