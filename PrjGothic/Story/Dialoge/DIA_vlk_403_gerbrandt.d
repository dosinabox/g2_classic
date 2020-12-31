
var int diego_coming;

instance DIA_GERBRANDT_EXIT(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 999;
	condition = dia_gerbrandt_exit_condition;
	information = dia_gerbrandt_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerbrandt_exit_condition()
{
	return TRUE;
};

func void dia_gerbrandt_exit_info()
{
	if(DIEGO_COMING == TRUE)
	{
		DIEGONW = Hlp_GetNpc(pc_thief_nw);
		if(DIEGO_ISONBOARD == FALSE)
		{
			b_startotherroutine(diegonw,"GERBRANDT");
		};
		Npc_ExchangeRoutine(self,"NEWLIFE");
		b_startotherroutine(gerbrandtsfrau,"NEWLIFE");
		DIEGO_COMING = 2;
	};
	AI_StopProcessInfos(self);
};


instance DIA_GERBRANDT_PICKPOCKET(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 900;
	condition = dia_gerbrandt_pickpocket_condition;
	information = dia_gerbrandt_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gerbrandt_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)) && (DIEGO_COMING != TRUE))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_pickpocket_info()
{
	Info_ClearChoices(dia_gerbrandt_pickpocket);
	Info_AddChoice(dia_gerbrandt_pickpocket,DIALOG_BACK,dia_gerbrandt_pickpocket_back);
	Info_AddChoice(dia_gerbrandt_pickpocket,DIALOG_PICKPOCKET,dia_gerbrandt_pickpocket_doit);
};

func void dia_gerbrandt_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itse_goldpocket100,1);
		TotalTheftGold += 100;
		b_givethiefxp();
		Info_ClearChoices(dia_gerbrandt_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_gerbrandt_pickpocket_back()
{
	Info_ClearChoices(dia_gerbrandt_pickpocket);
};


instance DIA_GERBRANDT_HELLO(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 5;
	condition = dia_gerbrandt_hello_condition;
	information = dia_gerbrandt_hello_info;
	permanent = FALSE;
	description = "��� �� ������� �����?";
};


func int dia_gerbrandt_hello_condition()
{
	if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL) && (DIEGO_COMING == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_hello_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_15_00");	//��� �� ������� �����?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_01");	//� �� ��� �����? ������, �� ������� ����� � ������� �� ������, � ��� ������ ����.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_02");	//���� ����� ���������. � ��� ���� � ������ ���������. �����?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"� �����, ���������.",dia_gerbrandt_hello_no);
	Info_AddChoice(dia_gerbrandt_hello,"� �����, ������ ���������.",dia_gerbrandt_hello_yes);
};

func void dia_gerbrandt_hello_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_No_15_00");	//� �����, ���������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_01");	//���������� ����! ���� ����� ��������� �������� �� ���, ����� � ���� ����� ������� ��������...
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_02");	//����� � ����� �����. ����, ��� ������� ��������, �������� ������� ����� ������ ����. � ����� ��� ����� ������ �� ������ �� ���� ���, ������ ��� ����� ����, ��� � ��������� � ���, �� ��������, ��� ������� ��� �� �����!
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_03");	//����������� ����� � ����� �������� �� ����. � ���� �� ����� ������, ���� ����� ��������������, ����� ��� ������������ � ���� ���� ���������.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_15_00");	//� �����, ������ ���������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_01");	//��, �� ������� ����, ���� �� ������������� ����� �������, ����� ������, ���� ����� ����� ����.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_02");	//��� ������ ������ ����� ������ � ����, � ���� ��������� �������� ������ ��� ������ ���������� ��������, ��� ��.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_03");	//�� ���� �� ��������� �������� ���������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_04");	//�� ������ ������?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"���.",dia_gerbrandt_hello_yes_no);
	Info_AddChoice(dia_gerbrandt_hello,"��� �� ����� ������.",dia_gerbrandt_hello_nojob);
	Info_AddChoice(dia_gerbrandt_hello,"�������.",dia_gerbrandt_hello_yes_yes);
};

func void dia_gerbrandt_hello_yes_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_No_15_00");	//���.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_01");	//������, �� ������ ����, �� ������� ���������� ��������� ������ � ����� �� �����.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_02");	//� ���� � ���� ������� �����, ��������, � ���� �������� ���� ���������� �����. ����� ������ ����� ������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_03");	//��� �, ����� � ��� ���� � ����, ��� ������ � �������� ������������� ������ �������� �������.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_nojob()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_NoJob_15_00");	//��� �� ����� ������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_01");	//�� �������, �� ������ ����. ������, ����� �� ����� �������� ������ ����� ��� ����� ���������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_02");	//� ���� �� ���������� ���������� ����, �� ������ ����� ������ ���� ���������� ����� � �������, ������ ��� ��� ����� ���, ��� �� ������� ���� ���������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_03");	//��� ������ �����, ����� �� ������ ������� ���� ���� ���� ������.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_00");	//�������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01");	//�������. � ���� ������� ������ ����� ��������� ����������.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02");	//��� ������ ����� ������������?
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03");	//������������?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04");	//������, � ������� ���� ����. ����� �������� ������������ �����, ������� �� ���. ����� � ��� ���� ������.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void b_gerbrandt_pissoff()
{
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_00");	//��� ��� ��� ������ - �� ����������� ���� ����?
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_01");	//�� � ���� �������� ����� ��� � ��� ��� ���������.
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_02");	//������ ���� � �����!
	AI_StopProcessInfos(self);
};


instance DIA_GERBRANDT_PERM(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 800;
	condition = dia_gerbrandt_perm_condition;
	information = dia_gerbrandt_perm_info;
	permanent = TRUE;
	description = "���� ���-������ ���������?";
};


func int dia_gerbrandt_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_gerbrandt_hello))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_perm_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Perm_15_00");	//���� �������?
	if(KAPITEL <= 2)
	{
		if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_01");	//����� ����� ���� ������ ������ �����. ����� ����� ���������� ����� ��������, � �� �����-������ ������� � ����������.
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_02");	//���� ���� �����-������ ������� ����� ������� � ���������, ��������, ���� ����� ����� ���� �����.
		}
		else
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_03");	//��� �� �� ��� ����������, �, ����������� ������.
		};
	}
	else if(KAPITEL >= 3)
	{
		if(MIS_DIEGOSRESIDENCE != LOG_SUCCESS)
		{
			if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_04");	//����� � ����� ����� ����� ��� �� - �� ������ �� ������ ������ �����.
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_05");	//��� ����� ���������� � ������������ �� �������� ��� ������������ � ������� ��������.
			}
			else
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_06");	//��� ������ �� ��������, ����� ����. � �����!
			};
		}
		else
		{
			b_gerbrandt_pissoff();
		};
	};
};


instance DIA_GERBRANDT_GREETINGSFROMDIEGO(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_greetingsfromdiego_condition;
	information = dia_gerbrandt_greetingsfromdiego_info;
	permanent = FALSE;
	description = "����� �������� ���� ������.";
};


func int dia_gerbrandt_greetingsfromdiego_condition()
{
	if((MIS_DIEGOSRESIDENCE == LOG_RUNNING) && (Npc_HasItems(other,itwr_diegosletter_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_greetingsfromdiego_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_00");	//����� �������� ���� ������.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01");	//(���������) ���? ���? ����� �����?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_02");	//�� �������� ���� ������� ���� ��� ������.
	b_giveinvitems(other,self,itwr_diegosletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03");	//(�����������) ����� �� ����� ����. ��� �����!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04");	//(� ������) �� ���, ��� � ������?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_05");	//���?
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06");	//�����, ������� ��!
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_07");	//��, � ������ ����� ����������� � ���.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08");	//(� ��������, ��� ����) ��� �����! ��� �������!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09");	//� ���� ��� �������, ��� ����� ������� ������. ������. ���� �� ������ ���� �����, ��� �����!
	MIS_DIEGOSRESIDENCE = LOG_SUCCESS;
	b_giveplayerxp(XP_DIEGOSRESIDENCE);
	DIEGO_COMING = TRUE;
};

