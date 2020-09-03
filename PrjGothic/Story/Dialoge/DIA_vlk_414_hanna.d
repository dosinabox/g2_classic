
instance DIA_HANNA_EXIT(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 999;
	condition = dia_hanna_exit_condition;
	information = dia_hanna_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hanna_exit_condition()
{
	if(KAPITEL <= 2)
	{
		return TRUE;
	};
};

func void dia_hanna_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_HELLO(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_hello_condition;
	information = dia_hanna_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_hello_condition()
{
	return TRUE;
};

func void dia_hanna_hello_info()
{
	AI_Output(self,other,"DIA_Hanna_Hello_17_00");	//���, ������ - ��� � ���� ������� ��� ����?
};


instance DIA_HANNA_ROOM(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 2;
	condition = dia_hanna_room_condition;
	information = dia_hanna_room_info;
	permanent = FALSE;
	description = "� ���� ����� �������.";
};


func int dia_hanna_room_condition()
{
	return TRUE;
};

func void dia_hanna_room_info()
{
	AI_Output(other,self,"DIA_Hanna_Room_15_00");	//� ���� ����� �������.
	AI_Output(self,other,"DIA_Hanna_Room_17_01");	//�� ��������� ��� ��� �� ������.
	if(Npc_KnowsInfo(other,dia_lothar_schlafen))
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_03");	//���� �� ��������� ������ ���, ��� � ���� �������� ���� ����� ���������...
	}
	else
	{
		AI_Output(other,self,"DIA_Hanna_Add_15_00");	//������� ����� ������� �� ����?
		AI_Output(self,other,"DIA_Hanna_Add_17_01");	//��� ������ ��������� ���������.
		AI_Output(self,other,"DIA_Hanna_Add_17_02");	//�������� ���������� ������ ���� ����������������.
		AI_Output(other,self,"DIA_Hanna_Add_15_04");	//�� ����, � ���� ������������ ����� �� ���� ���������?!
	};
	AI_Output(self,other,"DIA_Hanna_Add_17_05");	//��, ��.
	AI_Output(self,other,"DIA_Hanna_Add_17_06");	//������ ��������� ����� �� ��������.
	AI_Output(self,other,"DIA_Hanna_Add_17_07");	//���� ���� ��� ��� ��������.
};


instance DIA_HANNA_WHYPAY(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 3;
	condition = dia_hanna_whypay_condition;
	information = dia_hanna_whypay_info;
	permanent = FALSE;
	description = "� ������ �������� ������ �� ���?";
};


func int dia_hanna_whypay_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_room))
	{
		return TRUE;
	};
};

func void dia_hanna_whypay_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_12");	//� ������ �������� ������ �� ���?
	AI_Output(self,other,"DIA_Hanna_Add_17_13");	//� �� ���� �����, � ��� ��� �������.
	AI_Output(self,other,"DIA_Hanna_Add_17_14");	//� ����� �������, � �����, ��� �����, ����� ����� �� ��������� ����� �� ������. ��� ���������� ��� ����.
	AI_Output(self,other,"DIA_Hanna_Add_17_15");	//��, � � ������ �������, ��� ����� ��������� ������������ ������������� ���������.
	AI_Output(self,other,"DIA_Hanna_Add_17_16");	//������, ����� ������� ������� ���������, ��� �������� ���������� ������ �� ��������� � �������� ����������� ������ ���������������.
	AI_Output(self,other,"DIA_Hanna_Add_17_17");	//����� ����, � �����, ��� ����� ������� ������� ��������� ��� � ������.
	AI_Output(self,other,"DIA_Hanna_Add_17_18");	//���� ����� ���� �������� ��������� ���������� ���� �� ������� ����������.
};


instance DIA_HANNA_WERHIER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 4;
	condition = dia_hanna_werhier_condition;
	information = dia_hanna_werhier_info;
	permanent = TRUE;
	description = "��� ����� ����� ������?";
};


func int dia_hanna_werhier_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_room))
	{
		return TRUE;
	};
};

func void dia_hanna_werhier_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_08");	//��� ����� ����� ������?
	AI_Output(self,other,"DIA_Hanna_Add_17_09");	//� �������� ������������� �������� � �����.
	AI_Output(other,self,"DIA_Hanna_Add_15_10");	//���.
	AI_Output(self,other,"DIA_Hanna_Add_17_11");	//���� �� �����, ����� �������� � �� ��������! ��� �� ����� ����� ��������!
};


instance DIA_HANNA_CITY(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 5;
	condition = dia_hanna_city_condition;
	information = dia_hanna_city_info;
	permanent = TRUE;
	description = "��������� �������� � ������...";
};


func int dia_hanna_city_condition()
{
	return TRUE;
};

func void dia_hanna_city_info()
{
	AI_Output(other,self,"DIA_Hanna_City_15_00");	//��������� �������� � ������...
	Info_ClearChoices(dia_hanna_city);
	Info_AddChoice(dia_hanna_city,DIALOG_BACK,dia_hanna_city_back);
	Info_AddChoice(dia_hanna_city,"��� � ���� ������ ���-������ �����?",dia_hanna_city_buy);
	Info_AddChoice(dia_hanna_city,"�������� ��� � ������.",dia_hanna_city_city);
};

func void dia_hanna_city_back()
{
	Info_ClearChoices(dia_hanna_city);
};

func void dia_hanna_city_buy()
{
	AI_Output(other,self,"DIA_Hanna_City_Buy_15_00");	//��� � ���� ������ ���-������ �����?
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_01");	//����� ��������� ����� ����� �������� ������ � �����. � �����, �� ������� ��� ���, ��� ���� �����.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_02");	//����� ���� ��������� ����� ������������� � ������ ����� ������. ����������� �� ��� ��������� ���������� �� ��������� �����.
	AI_Output(self,other,"DIA_Hanna_City_Buy_17_03");	//����� � ����� �� ������� �������� �����. ��� ����� ������� ����� �� ������.
};

func void dia_hanna_city_city()
{
	AI_Output(other,self,"DIA_Hanna_City_City_15_00");	//�������� ��� � ������.
	AI_Output(self,other,"DIA_Hanna_City_City_17_01");	//������� - ���� �� ����� ������� ������� �����������, ���� �������� �� ��, ��� ������ �� ������ �� ������� �����.
	AI_Output(self,other,"DIA_Hanna_City_City_17_02");	//�� � ��� ���, ��� �������� ����� � ������, ��������� �������� ����������� ������. ������ ������������ ���� �������� ���� ��� ���� �����.
	AI_Output(self,other,"DIA_Hanna_City_City_17_03");	//� ������ � ��� ���� ������� ����������� �� �������. ������� �������� ������� ����� ����������, � ������ �������� ����� ����������� ����.
	AI_Output(self,other,"DIA_Hanna_City_City_17_04");	//����� �� �����, ��� �������� ��� �������. ��� ������ �� ��������, ����� ��� ����� � ��������� �� ������. ���� �� � ����� ����� ���� ���-�� ��������.
};


instance DIA_HANNA_KAP3_EXIT(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 999;
	condition = dia_hanna_kap3_exit_condition;
	information = dia_hanna_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_hanna_kap3_exit_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_hanna_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


var int hanna_priceforletter;

instance DIA_HANNA_ANYNEWS(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 31;
	condition = dia_hanna_anynews_condition;
	information = dia_hanna_anynews_info;
	permanent = FALSE;
	description = "��� ����?";
};


func int dia_hanna_anynews_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_hanna_anynews_info()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_15_00");	//��� ����?
	AI_Output(self,other,"DIA_Hanna_AnyNews_17_01");	//��� ������-�� �������, ��� ���� �� �����-�� ������� �������� ������ �����.
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"�� ����������.",dia_hanna_anynews_yes);
	Info_AddChoice(dia_hanna_anynews,"��, ��� �������...",dia_hanna_anynews_depends);
	Info_AddChoice(dia_hanna_anynews,"��, � �����, ��.",dia_hanna_anynews_no);
};

func void dia_hanna_anynews_no()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_No_15_00");	//��, � �����, ��.
	AI_Output(self,other,"DIA_Hanna_AnyNews_No_17_01");	//��, ������ � �����. ������ ��� ������ ������ � ����. ��� ��� ���� �����?
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_depends()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Depends_15_00");	//��, ��� �������, �...
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_01");	//��� ������� �� ����, ������� �� ���� ����� ����������, �� ������ �������?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Depends_17_02");	//� �� ����� �����, ��� ��.
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_15_00");	//�� ����������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_01");	//��, ��������� ����� ����... � ��������� ������� � ���� ������ ���� � ������� ����� ������ ���� ��������, ���������� � ������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_02");	//�� ����� � ��������, ��� � ���� �� ������� ������ ���������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_03");	//� �����, �� ��� �������� ��������� � ������ ���� ����.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_17_04");	//�� �� ��� �� ������� ��� ���?
	MIS_HANNARETRIEVELETTER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_HANNARETRIEVELETTER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HANNARETRIEVELETTER,LOG_RUNNING);
	b_logentry(TOPIC_HANNARETRIEVELETTER,"� ����� ������ ��������. ������, �� ������ � ������, ���, ��� ����� ��������� �������.");
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"� ���� �� ������� �� ����������.",dia_hanna_anynews_yes_footboy);
	Info_AddChoice(dia_hanna_anynews,"� ��� ��� � ����� �����?",dia_hanna_anynews_yes_reward);
	Info_AddChoice(dia_hanna_anynews,"� ��������.",dia_hanna_anynews_yes_willsee);
};

func void dia_hanna_anynews_yes_footboy()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Footboy_15_00");	//� ���� �� ������� �� ����������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Footboy_17_01");	//������� - �������� ������� ������� ������� �������� ��� ����. ������, ��� �������� �������� ���� �����.
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_reward()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_15_00");	//��� � �� ��� ������?
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_01");	//���, � ����� - �� �� �����, ��� ���� ���� ��������� �������� �����.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_17_02");	//��� ��� �� ������ �������� �� ������ �������?
	Info_ClearChoices(dia_hanna_anynews);
	Info_AddChoice(dia_hanna_anynews,"�����, ������.",dia_hanna_anynews_yes_reward_ok);
	Info_AddChoice(dia_hanna_anynews,"��, �� ����� �� ���� ������� ���������� �� ����... ��� �������...",dia_hanna_anynews_yes_reward_benice);
	Info_AddChoice(dia_hanna_anynews,"������.",dia_hanna_anynews_yes_reward_gold);
};

func void dia_hanna_anynews_yes_reward_ok()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_OK_15_00");	//�����, ������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_OK_17_01");	//��, ���� ������� ������� � ���� ��� ����. ���� �� ��������� ��� ���� ��������, � ��� ���� 75 �������.
	HANNA_PRICEFORLETTER = 75;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_reward_benice()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_15_00");	//��, �� ����� �� ���� ������� ���������� �� ����... ��� �������...
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_BeNice_17_01");	//��, �� ���! �... �������� ������! ����������� ������!
	MIS_HANNARETRIEVELETTER = LOG_FAILED;
	AI_StopProcessInfos(self);
};

func void dia_hanna_anynews_yes_reward_gold()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_Reward_Gold_15_00");	//������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_01");	//���� ����� ���� ���������� ������? ����� - � �������� ���� �������� � 50 �������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_Reward_Gold_17_02");	//���� �� ������� ������� ��� ���� ��������, � ��� ���� 50 ������� �����.
	HANNA_PRICEFORLETTER = 50;
	Info_ClearChoices(dia_hanna_anynews);
};

func void dia_hanna_anynews_yes_willsee()
{
	AI_Output(other,self,"DIA_Hanna_AnyNews_Yes_WillSee_15_00");	//� ��������.
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_01");	//�� ����� ��������. � ����� ���� �����!
	AI_Output(self,other,"DIA_Hanna_AnyNews_Yes_WillSee_17_02");	//���� �� ��������� ��� ��� ������, ���� ���� �������.
	HANNA_PRICEFORLETTER = 200;
	Info_ClearChoices(dia_hanna_anynews);
};


instance DIA_HANNA_THISLETTER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 31;
	condition = dia_hanna_thisletter_condition;
	information = dia_hanna_thisletter_info;
	permanent = FALSE;
	description = "�� ���� �������� ����� � ����?";
};


func int dia_hanna_thisletter_condition()
{
	if((MIS_HANNARETRIEVELETTER == LOG_RUNNING) && (Npc_HasItems(other,itwr_shatteredgolem_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_hanna_thisletter_info()
{
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_00");	//�� ���� �������� ����� � ����?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_01");	//��, ������ ���. �������.
	b_giveinvitems(other,self,itwr_shatteredgolem_mis,1);
	AI_Output(other,self,"DIA_Hanna_ThisLetter_15_02");	//��� ������ ���� �������?
	AI_Output(self,other,"DIA_Hanna_ThisLetter_17_03");	//�� ��� ������. ��� ���� ������.
	CreateInvItems(self,itmi_gold,HANNA_PRICEFORLETTER);
	b_giveinvitems(self,other,itmi_gold,HANNA_PRICEFORLETTER);
	MIS_HANNARETRIEVELETTER = LOG_SUCCESS;
	b_giveplayerxp(XP_HANNARETRIEVELETTER);
};


instance DIA_HANNA_PICKPOCKET(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 900;
	condition = dia_hanna_pickpocket_condition;
	information = dia_hanna_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60_FEMALE;
};


func int dia_hanna_pickpocket_condition()
{
	return c_beklauen(45,25);
};

func void dia_hanna_pickpocket_info()
{
	Info_ClearChoices(dia_hanna_pickpocket);
	Info_AddChoice(dia_hanna_pickpocket,DIALOG_BACK,dia_hanna_pickpocket_back);
	Info_AddChoice(dia_hanna_pickpocket,DIALOG_PICKPOCKET,dia_hanna_pickpocket_doit);
};

func void dia_hanna_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_hanna_pickpocket);
};

func void dia_hanna_pickpocket_back()
{
	Info_ClearChoices(dia_hanna_pickpocket);
};


instance DIA_HANNA_AUSKELLER(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 11;
	condition = dia_hanna_auskeller_condition;
	information = dia_hanna_auskeller_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hanna_auskeller_condition()
{
	if(Npc_HasItems(other,itke_thiefguildkey_hotel_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_hanna_auskeller_info()
{
	if((cassia.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (jesper.aivar[AIV_KILLEDBYPLAYER] == TRUE) || (ramirez.aivar[AIV_KILLEDBYPLAYER] == TRUE))
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_27");	//������... �� ������?
		AI_Output(other,self,"DIA_Hanna_Add_15_28");	//� ����� ���-��� ���������� � ����� �������...
		AI_Output(self,other,"DIA_Hanna_Add_17_29");	//��� �� ����� � ���� �������?!
		AI_Output(other,self,"DIA_Hanna_Add_15_30");	//�� ��������� ������ ���!
		AI_Output(self,other,"DIA_Hanna_Add_17_31");	//(�������) � �� ����, ��� �� ��������...
	}
	else
	{
		AI_Output(self,other,"DIA_Hanna_Add_17_19");	//(�����������) �������� �� ����! �� ������ ����� ������? �?
		AI_Output(other,self,"DIA_Hanna_Add_15_20");	//(��������) �...
		AI_Output(self,other,"DIA_Hanna_Add_17_21");	//(�������) � ����!
		AI_Output(self,other,"DIA_Hanna_Add_17_22");	//(������������) �� ������ ���. � ��� ����.
		AI_Output(self,other,"DIA_Hanna_Add_17_23");	//���� � �� ����� ������� ���-������ �����, �����?
		AI_Output(self,other,"DIA_Hanna_Add_17_24");	//�� �� ����� ���� ��������� ���������� �������� � �����.
	};
	AI_StopProcessInfos(self);
};


instance DIA_HANNA_SCHULDENBUCH(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_schuldenbuch_condition;
	information = dia_hanna_schuldenbuch_info;
	permanent = FALSE;
	description = "��������, ����� � ���� ���� �����!";
};


func int dia_hanna_schuldenbuch_condition()
{
	if(Npc_HasItems(other,itwr_schuldenbuch) >= 1)
	{
		return TRUE;
	};
};

func void dia_hanna_schuldenbuch_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_41");	//��������, ����� � ���� ���� �����!
	AI_Output(self,other,"DIA_Hanna_Add_17_42");	//�������� ������. ��� ���� ��� �������?
	AI_Output(other,self,"DIA_Hanna_Add_15_43");	//��...
	AI_Output(self,other,"DIA_Hanna_Add_17_44");	//��, ��� ����� ������� ������ ��������� - ��� ������. �� �����, ���� �� ����� � ����...
};


instance DIA_HANNA_GIVESCHULDENBUCH(C_INFO)
{
	npc = vlk_414_hanna;
	nr = 1;
	condition = dia_hanna_giveschuldenbuch_condition;
	information = dia_hanna_giveschuldenbuch_info;
	permanent = FALSE;
	description = "��� - ������ ��� �����.";
};


func int dia_hanna_giveschuldenbuch_condition()
{
	if(Npc_KnowsInfo(other,dia_hanna_schuldenbuch) && (Npc_HasItems(other,itwr_schuldenbuch) >= 1))
	{
		return TRUE;
	};
};

func void dia_hanna_giveschuldenbuch_info()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_45");	//��� - ������ ��� �����.
	b_giveinvitems(other,self,itwr_schuldenbuch,1);
	AI_Output(self,other,"DIA_Hanna_Add_17_46");	//�������.
	AI_Output(self,other,"DIA_Hanna_Add_17_47");	//������ ��� � �������� �������.
	b_giveinvitems(self,other,itse_hannasbeutel,1);
	b_giveplayerxp(XP_SCHULDENBUCH);
	AI_Output(other,self,"DIA_Hanna_Add_15_49");	//��� ��� ����� �� ���� ���?
	AI_Output(self,other,"DIA_Hanna_Add_17_48");	//��� ���� �� ����, ������� � ���������.
};

func void hanna_blubb()
{
	AI_Output(other,self,"DIA_Hanna_Add_15_37");	//� ������ ��� � �������?
	AI_Output(self,other,"DIA_Hanna_Add_17_39");	//� ����� ��� �� ������ ��.
	AI_Output(self,other,"DIA_Hanna_Add_17_40");	//�, �������, ����� ����, ����� � ���� ����� ����� � �������, ��� � ��� ����.
	AI_Output(self,other,"DIA_Hanna_Add_17_38");	//��. �� ���� ����� �� �������� �� ����...
	AI_Output(other,self,"DIA_Hanna_Add_15_25");	//�� ����� � ������ �����?
	AI_Output(self,other,"DIA_Hanna_Add_17_26");	//(����� ���������) � �� �������, � ��� �� ��������...
	AI_Output(self,other,"DIA_Hanna_Add_17_32");	//����� ���� ���������... ���-�� ������ ���� �������!
	AI_Output(self,other,"DIA_Hanna_Add_17_33");	//��� ��� ������ �� ������ ����������, �� ������ � �� ���� ������!
	AI_Output(self,other,"DIA_Hanna_Add_17_34");	//� �������, ��� ��� ��...
	AI_Output(self,other,"DIA_Hanna_Add_17_35");	//� ������ ��� ���������� ��� ����.
	AI_Output(self,other,"DIA_Hanna_Add_17_36");	//��� �������� ��� � ����������� �����. �� ��� ���� ������ �� �����, ������...
};

