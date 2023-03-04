
instance DIA_DJG_715_FERROS_EXIT(C_INFO)
{
	npc = djg_715_ferros;
	nr = 999;
	condition = dia_djg_715_ferros_exit_condition;
	information = dia_djg_715_ferros_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_djg_715_ferros_exit_condition()
{
	return TRUE;
};

func void dia_djg_715_ferros_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DJG_715_FERROS_HELLO(C_INFO)
{
	npc = djg_715_ferros;
	nr = 4;
	condition = dia_djg_715_ferros_hello_condition;
	information = dia_djg_715_ferros_hello_info;
	permanent = FALSE;
	description = "������ ��?";
};


func int dia_djg_715_ferros_hello_condition()
{
	return TRUE;
};

func void dia_djg_715_ferros_hello_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Hello_15_00");	//������ ��?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_01");	//� ��������. ��� ���� � � ������ ������.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_02");	//��� ���������� ��� ����. ���� ������� �� ����� ���, ��� �����.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_03");	//������ ������� �������� ��� ����� ������������.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_Hello_01_04");	//��, ��������, ��������� ��� ����, ���� ���� ��������� ��� ������.
	};
};


instance DIA_DJG_715_FERROS_FRIENDS(C_INFO)
{
	npc = djg_715_ferros;
	nr = 5;
	condition = dia_djg_715_ferros_friends_condition;
	information = dia_djg_715_ferros_friends_info;
	permanent = FALSE;
	description = "� ��� ������ ���� ����?";
};


func int dia_djg_715_ferros_friends_condition()
{
	if(Npc_KnowsInfo(other,dia_djg_715_ferros_hello))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_friends_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_Friends_15_00");	//� ��� ������ ���� ����?
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_01");	//� ������� ��.
	AI_Output(self,other,"DIA_DJG_715_Ferros_Friends_01_02");	//��� ������, ��� �� ��������� ����� ���, ��� �� ������, ���� ���� ��� �� ����������� ��. � �� ���� ��������� � ���� �������.
};


instance DIA_DJG_715_FERROS_WAR(C_INFO)
{
	npc = djg_715_ferros;
	nr = 6;
	condition = dia_djg_715_ferros_war_condition;
	information = dia_djg_715_ferros_war_info;
	permanent = FALSE;
	description = "��� ��� �� ������ � �����?";
};


func int dia_djg_715_ferros_war_condition()
{
	if(Npc_KnowsInfo(other,dia_djg_715_ferros_hello))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_war_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_War_15_00");	//��� ��� �� ������ � �����?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_01");	//�� ���� ����� �� ����� ������ ������, �?
	};
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_02");	//���� �������� �������. �� ���� ��� ��� ��� ���, � �� ����.
	AI_Output(self,other,"DIA_DJG_715_Ferros_War_01_03");	//���������, ��� � ������, - ��� ������ �����. �� � � ��� �� ����.
};


instance DIA_DJG_715_FERROS_OLDCAMP(C_INFO)
{
	npc = djg_715_ferros;
	nr = 7;
	condition = dia_djg_715_ferros_oldcamp_condition;
	information = dia_djg_715_ferros_oldcamp_info;
	permanent = FALSE;
	description = "� ��� �� ������� �����, � �����?";
};


func int dia_djg_715_ferros_oldcamp_condition()
{
	return TRUE;
};

func void dia_djg_715_ferros_oldcamp_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_15_00");	//� ��� �� ������� �����, � �����?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_01");	//� ������� � �������� � ������ ������ ��������� � ����.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_02");	//� ���������, � ������� ���� ���, ����� ���������� ���� �����. � ��� � ������� �����.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_01_03");	//��� ���� � �� ���� ����� ������, � �� ����, ��� ������� �����, - ����������� ����.
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
	Info_AddChoice(dia_djg_715_ferros_oldcamp,"� ����� ���� ����� � ����� �������.",dia_djg_715_ferros_oldcamp_no);
	Info_AddChoice(dia_djg_715_ferros_oldcamp,"��� �� ���� ���, ���� � ����� ���� ���?",dia_djg_715_ferros_oldcamp_price);
	Info_AddChoice(dia_djg_715_ferros_oldcamp,"� ����� ���� ���.",dia_djg_715_ferros_oldcamp_yes);
	Wld_InsertItem(itmw_1h_ferrossword_mis,"FP_OW_ITEM_08");
	MIS_FERROSSWORD = LOG_RUNNING;
	Log_CreateTopic(TOPIC_FERROSSWORD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FERROSSWORD,LOG_RUNNING);
	b_logentry(TOPIC_FERROSSWORD,"������ ������� ���� ��� ��-�� �����. ��� ���� ���������.");
};

func void dia_djg_715_ferros_oldcamp_no()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_No_15_00");	//� ����� ���� ����� � ����� �������.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_No_01_01");	//� ��� ����� ���� ������ - � ����� � ������ ������ ����?
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};

func void dia_djg_715_ferros_oldcamp_price()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Price_15_00");	//��� �� ���� ���, ���� � ����� ���� ���?
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Price_01_01");	//����, � ������ �� ���� ����. � �������� ��� ���� ������ �� ���� ���.
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};

func void dia_djg_715_ferros_oldcamp_yes()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_OldCamp_Yes_15_00");	//� ����� ���� ���.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_01");	//��� ���� �� �����������. ���� ����� �������� � �������� ����� �� ���.
	AI_Output(self,other,"DIA_DJG_715_Ferros_OldCamp_Yes_01_02");	//�, ��������, ������� ��� ���, ����� ������� �����.
	b_logentry(TOPIC_FERROSSWORD,"������, ������ ������� ���� ��� �� ������� ����� �� ���, ���, ��� ��������� ������� �����.");
	Info_ClearChoices(dia_djg_715_ferros_oldcamp);
};


instance DIA_DJG_715_FERROS_FERROSANYSWORD(C_INFO)
{
	npc = djg_715_ferros;
	nr = 6;
	condition = dia_djg_715_ferros_ferrosanysword_condition;
	information = dia_djg_715_ferros_ferrosanysword_info;
	permanent = FALSE;
	description = "��������, � ���� ���� ��� ���� ������ ���.";
};


func int dia_djg_715_ferros_ferrosanysword_condition()
{
	if((MIS_FERROSSWORD == LOG_RUNNING) && ((Npc_HasItems(other,itmw_1h_special_01) >= 1) || (Npc_HasItems(other,itmw_1h_special_02) >= 1)))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_ferrosanysword_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00");	//��������, � ���� ���� ��� ���� ������ ���.
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,DIALOG_BACK,dia_djg_715_ferros_ferrosanysword_back);
	if(Npc_HasItems(other,itmw_1h_special_01) >= 1)
	{
		Info_AddChoice(dia_djg_715_ferros_ferrosanysword,name_itmw_1h_special_01,dia_djg_715_ferros_ferrosanysword_silverblade);
	};
	if(Npc_HasItems(other,itmw_1h_special_02) >= 1)
	{
		Info_AddChoice(dia_djg_715_ferros_ferrosanysword,name_itmw_1h_special_02,dia_djg_715_ferros_ferrosanysword_oreblade);
	};
};

func void dia_djg_715_ferros_ferrosanysword_back()
{
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};

func void b_ferros_ferrosanysword_give()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00");	//��� ������� ������. ������������ ������.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01");	//�� ������, ��� ������ ������ ��� ��� ������ ���?
};

func void dia_djg_715_ferros_ferrosanysword_silverblade()
{
	b_ferros_ferrosanysword_give();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"���, �� ����� ��� ������.",dia_djg_715_ferros_ferrosanysword_silverblade_no);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"��, �������.",dia_djg_715_ferros_ferrosanysword_silverblade_yes);
};

func void dia_djg_715_ferros_ferrosanysword_oreblade()
{
	b_ferros_ferrosanysword_give();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"���, �� ����� ��� ������.",dia_djg_715_ferros_ferrosanysword_oreblade_no);
	Info_AddChoice(dia_djg_715_ferros_ferrosanysword,"��, �������.",dia_djg_715_ferros_ferrosanysword_oreblade_yes);
};

func void b_ferros_ferrosanysword_yes1()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00");	//��, �������.
};

func void b_ferros_ferrosanysword_yes2()
{
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00");	//�������. � ���� �������.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01");	//������ � ������ ���� ������� ������, ������� �������� ���� ����� ������������ ���� � �������� � ���.
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"������ ����� �������� ��� ���� � ��������.");
};

func void b_ferros_ferrosanysword_no()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00");	//���, �� ����� ��� ������.
	AI_Output(self,other,"DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01");	//�������.
};

func void dia_djg_715_ferros_ferrosanysword_silverblade_yes()
{
	b_ferros_ferrosanysword_yes1();
	b_giveinvitems(other,self,itmw_1h_special_01,1);
	b_ferros_ferrosanysword_yes2();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	MIS_FERROSSWORD = LOG_SUCCESS;
	b_giveplayerxp(XP_FERROSSWORD);
};

func void dia_djg_715_ferros_ferrosanysword_silverblade_no()
{
	b_ferros_ferrosanysword_no();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};

func void dia_djg_715_ferros_ferrosanysword_oreblade_yes()
{
	b_ferros_ferrosanysword_yes1();
	b_giveinvitems(other,self,itmw_1h_special_02,1);
	b_ferros_ferrosanysword_yes2();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
	MIS_FERROSSWORD = LOG_SUCCESS;
	b_giveplayerxp(XP_FERROSSWORD);
};

func void dia_djg_715_ferros_ferrosanysword_oreblade_no()
{
	b_ferros_ferrosanysword_no();
	Info_ClearChoices(dia_djg_715_ferros_ferrosanysword);
};


instance DIA_DJG_715_FERROS_FERROSHISSWORD(C_INFO)
{
	npc = djg_715_ferros;
	nr = 6;
	condition = dia_djg_715_ferros_ferroshissword_condition;
	information = dia_djg_715_ferros_ferroshissword_info;
	permanent = FALSE;
	description = "� ����� ���� ���.";
};


func int dia_djg_715_ferros_ferroshissword_condition()
{
	if((MIS_FERROSSWORD == LOG_RUNNING) && (Npc_HasItems(other,itmw_1h_ferrossword_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_djg_715_ferros_ferroshissword_info()
{
	AI_Output(other,self,"DIA_DJG_715_Ferros_FerrosHisSword_15_00");	//� ����� ���� ���.
	b_giveinvitems(other,self,itmw_1h_ferrossword_mis,1);
	b_ferros_ferrosanysword_yes2();
	MIS_FERROSSWORD = LOG_SUCCESS;
	b_giveplayerxp(XP_FERROSSWORD);
};


instance DIA_FERROS_TEACH(C_INFO)
{
	npc = djg_715_ferros;
	nr = 1;
	condition = dia_ferros_teach_condition;
	information = dia_ferros_teach_info;
	permanent = TRUE;
	description = "������ ���, ��� ����� �������� ���� �����������.";
};


func int dia_ferros_teach_condition()
{
	if(MIS_FERROSSWORD == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_ferros_teach_info()
{
	AI_Output(other,self,"DIA_Ferros_Teach_15_00");	//������ ���, ��� ����� �������� ���� �����������.
	if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_01");	//����� ���� ���� ��������� ����� � ������ ���� �� ���������. � ���, ��� ������ ������� ���, ������.
	}
	else
	{
		AI_Output(self,other,"DIA_Ferros_Teach_01_02");	//������� ���� ������ ����� �������� ���������� ���� ����������� ������ ������.
		Info_ClearChoices(dia_ferros_teach);
		Info_AddChoice(dia_ferros_teach,DIALOG_BACK,dia_ferros_teach_back);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ferros_teach_str_1);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ferros_teach_str_5);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ferros_teach_dex_1);
		Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ferros_teach_dex_5);
	};
};

func void dia_ferros_teach_back()
{
	Info_ClearChoices(dia_ferros_teach);
};

func void dia_ferros_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,70);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_ferros_teach_str_1);
};

func void dia_ferros_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,70);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_ferros_teach_str_5);
};

func void dia_ferros_teach_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,70);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_ferros_teach_dex_1);
};

func void dia_ferros_teach_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,70);
	Info_AddChoice(dia_ferros_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_ferros_teach_dex_5);
};


instance DIA_FERROS_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_715_ferros;
	nr = 5;
	condition = dia_ferros_alldragonsdead_condition;
	information = dia_ferros_alldragonsdead_info;
	permanent = FALSE;
	description = "��� ������� ������.";
};


func int dia_ferros_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_ferros_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Ferros_AllDragonsDead_15_00");	//��� ������� ������.
	AI_Output(self,other,"DIA_Ferros_AllDragonsDead_01_01");	//�������! ���� �� � ��� ���� �������� ����� ����� ����, ���, ��������, �� ����� �� ��� ������.
};


instance DIA_FERROS_PICKPOCKET(C_INFO)
{
	npc = djg_715_ferros;
	nr = 900;
	condition = dia_ferros_pickpocket_condition;
	information = dia_ferros_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_ferros_pickpocket_condition()
{
	return c_beklauen(56,75);
};

func void dia_ferros_pickpocket_info()
{
	Info_ClearChoices(dia_ferros_pickpocket);
	Info_AddChoice(dia_ferros_pickpocket,DIALOG_BACK,dia_ferros_pickpocket_back);
	Info_AddChoice(dia_ferros_pickpocket,DIALOG_PICKPOCKET,dia_ferros_pickpocket_doit);
};

func void dia_ferros_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_ferros_pickpocket);
};

func void dia_ferros_pickpocket_back()
{
	Info_ClearChoices(dia_ferros_pickpocket);
};

