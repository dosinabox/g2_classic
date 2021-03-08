
instance DIA_MOE_EXIT(C_INFO)
{
	npc = vlk_432_moe;
	nr = 999;
	condition = dia_moe_exit_condition;
	information = dia_moe_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_moe_exit_condition()
{
	return TRUE;
};

func void dia_moe_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MOE_PICKPOCKET(C_INFO)
{
	npc = vlk_432_moe;
	nr = 900;
	condition = dia_moe_pickpocket_condition;
	information = dia_moe_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_moe_pickpocket_condition()
{
	return c_beklauen(25,30);
};

func void dia_moe_pickpocket_info()
{
	Info_ClearChoices(dia_moe_pickpocket);
	Info_AddChoice(dia_moe_pickpocket,DIALOG_BACK,dia_moe_pickpocket_back);
	Info_AddChoice(dia_moe_pickpocket,DIALOG_PICKPOCKET,dia_moe_pickpocket_doit);
};

func void dia_moe_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_moe_pickpocket);
};

func void dia_moe_pickpocket_back()
{
	Info_ClearChoices(dia_moe_pickpocket);
};


instance DIA_MOE_HALLO(C_INFO)
{
	npc = vlk_432_moe;
	nr = 2;
	condition = dia_moe_hallo_condition;
	information = dia_moe_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_moe_hallo_condition()
{
	if((Npc_GetDistToNpc(self,other) <= ZIVILANQUATSCHDIST) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF) && (hero.guild != GIL_MIL) && (hero.guild != GIL_NOV) && (Npc_RefuseTalk(self) == FALSE))
	{
		return TRUE;
	};
};

func void dia_moe_hallo_info()
{
	AI_Output(self,other,"DIA_Moe_Hallo_01_00");	//��, � �� ���� ����. ���� ���� ����� �����? �� ����� � �����?
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"���, � �� ��� � �����...",dia_moe_hallo_gehen);
	Info_AddChoice(dia_moe_hallo,"��, ��� ��� �������� ������� ...",dia_moe_hallo_witz);
	Info_AddChoice(dia_moe_hallo,"�� ������ ���-�� ������?",dia_moe_hallo_reizen);
};

func void dia_moe_hallo_gehen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Gehen_15_00");	//���, � �� ��� � �����...
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_01");	//� ��� � �������. �� ��� �� ��� �� ����� - �� ����� ������� ����� � ����.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_02");	//��� ��� �� ����� �������, � ���� ������� ���� ���������� �����������. �� ����� ��� 50 ������� ����� � ������ ���� ������.
	AI_Output(self,other,"DIA_Moe_Hallo_Gehen_01_03");	//��� ����� �� ��������� ���� � �����.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"����� �������, ��� ������ �� ����� ������ ���������...",dia_moe_hallo_miliz);
	Info_AddChoice(dia_moe_hallo,"������ �� ����, �� �� �������� �� �����!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"������, � �������.",dia_moe_hallo_zahlen);
	Info_AddChoice(dia_moe_hallo,"�� � �� ���� ���� � �����!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_kneipe()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Kneipe_15_00");	//�� � �� ���� ���� � �����!
	AI_Output(self,other,"DIA_Moe_Hallo_Kneipe_01_01");	//���������, ���� ��� ������ ��� ������� � �����. ��� ��� ����� ���� ��������� ����� ������ - � ������ ��� �������� �� ����� ��������� ����.
};

func void dia_moe_hallo_witz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Witz_15_00");	//��, ��� ��� �������� �������. � � �� ������ ��� �� ������ �����������.
	AI_Output(self,other,"DIA_Moe_Hallo_Witz_01_01");	//�� - ����� ���� ������� ��� ����, ������, ��� � �������� ���� ������ ��������� �� ��������.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"�������, ����� ������ ������ ��� �������� ������� ���� ���� ����� ...",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"�� ��������� ������� ��� ��������?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"���������, � ������ ����� ������ ����.",dia_moe_hallo_ruhig);
	Info_AddChoice(dia_moe_hallo,"�� � �� ���� ���� � �����!",dia_moe_hallo_kneipe);
};

func void dia_moe_hallo_reizen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Reizen_15_00");	//�� ������ ���-�� ������?
	AI_Output(self,other,"DIA_Moe_Hallo_Reizen_01_01");	//���� ������ ����� ������, �����.
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"�������, ����� ������ ������ ��� �������� ������� ���� ���� ����� ...",dia_moe_hallo_pruegel);
	Info_AddChoice(dia_moe_hallo,"�� ��������� ������� ��� ��������?",dia_moe_hallo_aerger);
	Info_AddChoice(dia_moe_hallo,"���������, � ������ ����� ������ ����.",dia_moe_hallo_ruhig);
};

func void dia_moe_hallo_miliz()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Miliz_15_00");	//����� �������, ��� ������ �� ����� ������ ���������...
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_01");	//(�������) ��������� ����� ���. � �� ������, ������ �� ����� �� ������?
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_02");	//�� ���������� � �������� ��������, �����. ����� �� ��������� �� ��������� �������� ����� � ����� �� ����.
	AI_Output(self,other,"DIA_Moe_Hallo_Miliz_01_03");	//��� ������ ������ ����������� � '������� ������'. ���������, ����� ���� ������ �� � �. (������� �������)
};

func void dia_moe_hallo_pruegel()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Pruegel_15_00");	//�������, ����� ������ ������, ��� �������� ������� ���� ���� �����.
	AI_Output(self,other,"DIA_Moe_Hallo_Pruegel_01_01");	//������ �����������, �����. ������ ���, �� ��� �� ��������!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_aerger()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Aerger_15_00");	//�� ��������� ������� ��� ��������?
	AI_Output(self,other,"DIA_Moe_Hallo_Aerger_01_01");	//�������, � ������ ��������� ��������. ��� ��� ���������, ������!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_ruhig()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Ruhig_15_00");	//���������, � ������ ����� ������ ����.
	AI_Output(self,other,"DIA_Moe_Hallo_Ruhig_01_01");	//������, �� ��� ����� ������ ���� 50 �����. ��� ����� �� ����. (����������)
	Info_ClearChoices(dia_moe_hallo);
	Info_AddChoice(dia_moe_hallo,"������ �� ����, �� �� �������� �� �����!",dia_moe_hallo_vergisses);
	Info_AddChoice(dia_moe_hallo,"������, � �������.",dia_moe_hallo_zahlen);
};

func void dia_moe_hallo_zahlen()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_00");	//������, � �������.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_01");	//�������. ��� ������� �� ����� ������, ������ �� ������ ������ ��� ��� ���������� ������ ��������.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"������ �� ����, �� �� �������� �� �����!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"������, ��� ���, ��� � ���� ����.",dia_moe_hallo_alles);
	}
	else if(Npc_HasItems(hero,itmi_gold) > 9)
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_02");	//...�� � ���� ��� � ����� ������� ������.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_03");	//��� �� �����. ������ ����� ��� ���, ��� � ���� ����.
		Info_ClearChoices(dia_moe_hallo);
		Info_AddChoice(dia_moe_hallo,"������ �� ����, �� �� �������� �� �����!",dia_moe_hallo_vergisses);
		Info_AddChoice(dia_moe_hallo,"������, ��� ���, ��� � ���� ����.",dia_moe_hallo_alles);
	}
	else
	{
		AI_Output(other,self,"DIA_Moe_Hallo_Zahlen_15_04");	//...�� � ���� ��� ���� � 10 �����.
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_05");	//����, ������� ������� ��� �� �������?!
		AI_Output(self,other,"DIA_Moe_Hallo_Zahlen_01_06");	//������, (�����) �� ������ ����.
		AI_StopProcessInfos(self);
	};
};

func void dia_moe_hallo_vergisses()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Vergisses_15_00");	//������ �� ����, �� �� �������� �� �����!
	AI_Output(self,other,"DIA_Moe_Hallo_Vergisses_01_01");	//����� � ������ ���, ��� � ���� ����, - � �� ������ ������ ������������� �� ����� ������ ����.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_moe_hallo_alles()
{
	AI_Output(other,self,"DIA_Moe_Hallo_Alles_15_00");	//������, ��� ���, ��� � ���� ����.
	b_giveinvitems(other,self,itmi_gold,Npc_HasItems(other,itmi_gold));
	AI_Output(self,other,"DIA_Moe_Hallo_Alles_01_01");	//�������, ����� ����������. � ������� �����������. (����������)
	AI_StopProcessInfos(self);
};


instance DIA_MOE_HARBOR(C_INFO)
{
	npc = vlk_432_moe;
	nr = 998;
	condition = dia_moe_harbor_condition;
	information = dia_moe_harbor_info;
	permanent = TRUE;
	description = "�� ������ � ����� ����� ���, ��?";
};


func int dia_moe_harbor_condition()
{
	return TRUE;
};

func void dia_moe_harbor_info()
{
	AI_Output(other,self,"DIA_Moe_Harbor_15_00");	//�� ������ � ����� ����� ���, ��?
	AI_Output(self,other,"DIA_Moe_Harbor_01_01");	//�������. � ���?
	Info_ClearChoices(dia_moe_harbor);
	Info_AddChoice(dia_moe_harbor,DIALOG_BACK,dia_moe_harbor_back);
	Info_AddChoice(dia_moe_harbor,"��� ��� � ���������?",dia_moe_harbor_ship);
	Info_AddChoice(dia_moe_harbor,"������ � �� ���� ����� ������ �� ���������?",dia_moe_harbor_militia);
	Info_AddChoice(dia_moe_harbor,"����� ����� ������ � ��������� �����?",dia_moe_harbor_rumors);
};

func void dia_moe_harbor_back()
{
	Info_ClearChoices(dia_moe_harbor);
};

func void dia_moe_harbor_ship()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Ship_15_00");	//��� ��� � ���������?
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_01");	//������������ �������, ������� ������ �� ��������� �����, - ��� ������� ���������.
	AI_Output(self,other,"DIA_Moe_Harbor_Ship_01_02");	//�� ����� ��� ���, �� ������� � ���-������.
};

func void dia_moe_harbor_militia()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Militia_15_00");	//������ � �� ���� ����� ������ �� ���������?
	AI_Output(self,other,"DIA_Moe_Harbor_Militia_01_01");	//��� �� ������������ �������� ����. � ��� ����� ���� �������.
};

func void dia_moe_harbor_rumors()
{
	AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_00");	//����� ����� ������ � ��������� �����?
	if(KAPITEL == 1)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_01");	//�� ����� �� ����� �����, ������� ������ ������� ����� ��������. ��������, ���� ��� ������.
	}
	else if(KAPITEL == 2)
	{
		if(hero.guild == GIL_MIL)
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_02");	//������, �� � ��� ����� ���������? ��� ����.
		}
		else if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_03");	//(��������) ��� �����. ������� ������� �������, �� �� ��� ��� �������� �� ������� � ���������� ����.
			AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_04");	//������ ���������� ���� ����.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_05");	//��� �� ��� �������� ����� ��� ���? � ������� ���������.
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_06");	//���������� �����. ���� ����� �������� ������ ���� ��� ����, ��� ��� ������ ������.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_07");	//��� ����� ������� �� ��������, ��� ����� ������� ����.
		};
	}
	else if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET == LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_08");	//� ����� ���� �� �� ����� �������� ���������.
				AI_Output(other,self,"DIA_Moe_Harbor_Rumors_15_09");	//� ������ ����?
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_10");	//� ����� �������� �������� ���, �������. � �� �� ����� ����� ������� � ��������� ������ ����, ����� ������� ��������� ����� �����.
			}
			else
			{
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_11");	//� ����, ��� �� �� ������ � ����� �������� ���������, �� �������� �������� ������ �������� ���� �������.
				AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_12");	//������ ��������� �����? ���� ����� ��������� �� ������. �� ������� ����, �� ��������� �����.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_13");	//� ��� ���, ��� ����������, ��� �������� �� ����� ��������� � ����� ��������, ��������� �� ������������ ���� ����������� ����.
			AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_14");	//� �����, ��� ������ ���� ������ � ������������ �����. � �� ���, ��� ���� �����.
		};
	}
	else if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_15");	//����� ��������� ������ �� ����������.
	}
	else
	{
		AI_Output(self,other,"DIA_Moe_Harbor_Rumors_01_16");	//�������-�� ��� ����������� �������� �������� ������. ����� ����.
	};
};


instance DIA_MOE_LEHMARGELDEINTREIBEN(C_INFO)
{
	npc = vlk_432_moe;
	nr = 2;
	condition = dia_moe_lehmargeldeintreiben_condition;
	information = dia_moe_lehmargeldeintreiben_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_moe_lehmargeldeintreiben_condition()
{
	if((LEHMAR_GELDGELIEHEN_DAY <= (Wld_GetDay() - 2)) && (LEHMAR_GELDGELIEHEN != 0))
	{
		return TRUE;
	};
};

func void dia_moe_lehmargeldeintreiben_info()
{
	AI_Output(self,other,"DIA_Moe_LEHMARGELDEINTREIBEN_01_00");	//��, ��! ����� �������� ���� ������.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

