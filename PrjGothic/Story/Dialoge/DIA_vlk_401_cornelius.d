
instance DIA_CORNELIUS_EXIT(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 999;
	condition = dia_cornelius_exit_condition;
	information = dia_cornelius_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_cornelius_exit_condition()
{
	return TRUE;
};

func void dia_cornelius_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_SEEMURDER(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_seemurder_condition;
	information = dia_cornelius_seemurder_info;
	permanent = FALSE;
	description = "�� �����, ��� ����� ������, ��?";
};


func int dia_cornelius_seemurder_condition()
{
	if(RECUEBENNET_KNOWSCORNELIUS == TRUE)
	{
		return TRUE;
	};
};

func void dia_cornelius_seemurder_info()
{
	AI_Output(other,self,"DIA_Cornelius_SeeMurder_15_00");	//�� �����, ��� ����� ������, ��?
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_01");	//(������) � �� ������ �������� �� ����� �������.
	AI_Output(self,other,"DIA_Cornelius_SeeMurder_13_02");	//���� ����� ��� ���������� ����.
};


instance DIA_CORNELIUS_WHATYOUSEE(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 5;
	condition = dia_cornelius_whatyousee_condition;
	information = dia_cornelius_whatyousee_info;
	permanent = FALSE;
	description = "��� ������ �� �����?";
};


func int dia_cornelius_whatyousee_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_seemurder))
	{
		return TRUE;
	};
};

func void dia_cornelius_whatyousee_info()
{
	AI_Output(other,self,"DIA_Cornelius_WhatYouSee_15_00");	//��� ������ �� �����?
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_01");	//(�����������) ��������, � ���� ��� ������� �� �������� � �����.
	AI_Output(self,other,"DIA_Cornelius_WhatYouSee_13_02");	//(�����������) �����, � ������ ������ �� ��������.
	b_logentry(TOPIC_RESCUEBENNET,"��������� ������������ ������������� �� ����.");
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_ENOUGH(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 6;
	condition = dia_cornelius_enough_condition;
	information = dia_cornelius_enough_info;
	permanent = FALSE;
	description = "������! ��� �� �����?";
};


func int dia_cornelius_enough_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_whatyousee))
	{
		return TRUE;
	};
};

func void dia_cornelius_enough_info()
{
	AI_Output(other,self,"DIA_Cornelius_Enough_15_00");	//������! ��� �� �����?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_01");	//(������) �... � �����, ��� ������� ����� ���� � ����� ��������.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_02");	//(������) � ����� �� ����� ���� ��� � ������ ��� ��� � �����.
	AI_Output(other,self,"DIA_Cornelius_Enough_15_03");	//�� � ���� ���������� ������?
	AI_Output(self,other,"DIA_Cornelius_Enough_13_04");	//(���������) ��, �������. � ����� ��� ����� ������������ �������.
	AI_Output(self,other,"DIA_Cornelius_Enough_13_05");	//(���������) �� ��� ������ ������ �������. ��� ����� �������� � �����������.
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_DONTBELIEVEYOU(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_dontbelieveyou_condition;
	information = dia_cornelius_dontbelieveyou_info;
	permanent = TRUE;
	description = "� ���� �� ����.";
};


func int dia_cornelius_dontbelieveyou_condition()
{
	if(Npc_KnowsInfo(other,dia_cornelius_enough) && (CORNELIUS_TELLTRUTH != TRUE))
	{
		return TRUE;
	};
};

func void dia_cornelius_dontbelieveyou_info()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_15_00");	//� ���� �� ����.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_13_01");	//(� ��������� ������������) � ���? ��� �� ����������� ������?
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
	Info_AddChoice(dia_cornelius_dontbelieveyou,"������� �� ������?",dia_cornelius_dontbelieveyou_whatyouwant);
	Info_AddChoice(dia_cornelius_dontbelieveyou,"�� ���� ����� �������� ����� ������, ������?",dia_cornelius_dontbelieveyou_wantsurvive);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"���� ����� �� ��������� �������� � ���������.",dia_cornelius_dontbelieveyou_monastery);
	};
	if(hero.guild == GIL_SLD)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"� ���� ������� ���������, ��� �� ������.",dia_cornelius_dontbelieveyou_knowyourhome);
	};
	if(hero.guild == GIL_MIL)
	{
		Info_AddChoice(dia_cornelius_dontbelieveyou,"�� ���������������� ���� ������� � ������ - � �������!",dia_cornelius_dontbelieveyou_perjury);
	};
};

func void dia_cornelius_dontbelieveyou_whatyouwant()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_00");	//������� �� ������?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_01");	//(��������) � ���� �� ������ ������, ����� ��������� ���.
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WhatYouWant_15_02");	//�������?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WhatYouWant_13_03");	//2000 �������. ��... ����� �, ��������, ���������� ���� ����� ������.
	b_logentry(TOPIC_RESCUEBENNET,"��������� ����� ������������� �� ���� �� 2000 ������.");
	CORNELIUS_PAYFORPROOF = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_wantsurvive()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_WantSurvive_15_00");	//�� ���� ����� �������� ����� ������, ������?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_01");	//(���������) ���� �� �������� �� ����, ���� �������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_02");	//� ���� ����� ����������� ������. ��� ��� ���� �� ����� ������� ���� ���� �� �������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_WantSurvive_13_03");	//� ������ �������� ������! ��� � ������ ������!
	AI_StopProcessInfos(self);
};

func void dia_cornelius_dontbelieveyou_monastery()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_00");	//���� ����� �� ��������� �������� � ���������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_01");	//(����� ��� ���) ��� �� ���� ������ �������?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Monastery_15_02");	//��, � ��� ���� ������ ��������� �������� ������. ����� ����������� ������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Monastery_13_03");	//���, ����������, �� �����. � ����� ���� ���, ��� �� ������ ������.
	CORNELIUS_TELLTRUTH = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_knowyourhome()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_00");	//� ���� ������� ���������, ��� �� ������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_01");	//(����� ��� ���) ��� �� ���� ������ �������?
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_02");	//�������, ��� ������ ������������� � �����. �� ����� �� �������� ��� ��������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_03");	//�� �� ������ ������� ���. ��� ����� ����!
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_KnowYourHome_15_04");	//������ ��������.
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_KnowYourHome_13_05");	//� ����� ���, ��� �� ������, ������ �� ����� �����.
	CORNELIUS_TELLTRUTH = TRUE;
	Info_ClearChoices(dia_cornelius_dontbelieveyou);
};

func void dia_cornelius_dontbelieveyou_perjury()
{
	AI_Output(other,self,"DIA_Cornelius_DontBelieveYou_Perjury_15_00");	//�� ���������������� ���� ������� � ������ - � �������!
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_01");	//�� ��������� �������� ���? �����-�� ������ �������� �������� ���, ��������� �����������?
	AI_Output(self,other,"DIA_Cornelius_DontBelieveYou_Perjury_13_02");	//���� �� ���������� �� ���������, � ����������, ����� ���� �����������.
	CORNELIUS_THREATENBYMILSC = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_PAYCORNELIUS(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_paycornelius_condition;
	information = dia_cornelius_paycornelius_info;
	permanent = FALSE;
	description = "��� ������.";
};


func int dia_cornelius_paycornelius_condition()
{
	if((CORNELIUS_PAYFORPROOF == TRUE) && (Npc_HasItems(other,itmi_gold) >= 2000) && (CORNELIUS_TELLTRUTH == FALSE))
	{
		return TRUE;
	};
};

func void dia_cornelius_paycornelius_info()
{
	AI_Output(other,self,"DIA_Cornelius_PayCornelius_15_00");	//��� ������.
	b_giveinvitems(other,self,itmi_gold,2000);
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_01");	//����� � �� ���� ����������, ��� �� ��� ����.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_02");	//������, ���� ������, ���� ��� ������ �� �������.
	AI_Output(self,other,"DIA_Cornelius_PayCornelius_13_03");	//�������, ��� ��� ������ ���.
	CORNELIUS_TELLTRUTH = TRUE;
};


instance DIA_CORNELIUS_REALSTORY(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 4;
	condition = dia_cornelius_realstory_condition;
	information = dia_cornelius_realstory_info;
	permanent = TRUE;
	description = "��� ��� ��������� �� ����� ����?";
};


func int dia_cornelius_realstory_condition()
{
	if(CORNELIUS_TELLTRUTH == TRUE)
	{
		return TRUE;
	};
};

func void dia_cornelius_realstory_info()
{
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_00");	//��� ��� ��������� �� ����� ����?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_01");	//� �� �����, ��� ���������. � ������� ������ �� ��, ��� ������ ����� ��������.
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_02");	//� �������� ������� ������ ��� �� ����. � ��� ����� ���� ������.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_03");	//��� �������� ����?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_04");	//���� ���������� ����, ��� � ������. �� ����� ����, ���� � �����������.
	AI_Output(other,self,"DIA_Cornelius_RealStory_15_05");	//�� ����� ����������� ��������� ����� ����� ������ �������?
	AI_Output(self,other,"DIA_Cornelius_RealStory_13_06");	//� ���� ��� �� ����� �� ���. � �� ��������� ���������� � ������.
	if(Npc_HasItems(self,itwr_corneliustagebuch_mis) >= 1)
	{
		AI_Output(self,other,"DIA_Cornelius_RealStory_13_07");	//� ��� ���� ��� �������, �� �������� ����������� ���������������.
		b_giveinvitems(self,other,itwr_corneliustagebuch_mis,1);
	};
	b_logentry(TOPIC_RESCUEBENNET,"��������� ������. ��� ���������, ����� ����� ������� � ������. �� �� �� ������� ���, ��� �������� ���. �� ���� ������ �� ������.");
	CORNELIUSFLEE = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FLEE");
};


instance DIA_CORNELIUS_FLEEING(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 1;
	condition = dia_cornelius_fleeing_condition;
	information = dia_cornelius_fleeing_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_cornelius_fleeing_condition()
{
	if((CORNELIUSFLEE == TRUE) && Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_cornelius_fleeing_info()
{
	b_say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_CORNELIUS_PICKPOCKET(C_INFO)
{
	npc = vlk_401_cornelius;
	nr = 900;
	condition = dia_cornelius_pickpocket_condition;
	information = dia_cornelius_pickpocket_info;
	permanent = TRUE;
	description = "(�������� ������� ��� ����� �������� ����������)";
};


func int dia_cornelius_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itwr_corneliustagebuch_mis) >= 1) && (other.attribute[ATR_DEXTERITY] >= (60 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_cornelius_pickpocket_info()
{
	Info_ClearChoices(dia_cornelius_pickpocket);
	Info_AddChoice(dia_cornelius_pickpocket,DIALOG_BACK,dia_cornelius_pickpocket_back);
	Info_AddChoice(dia_cornelius_pickpocket,DIALOG_PICKPOCKET,dia_cornelius_pickpocket_doit);
};

func void dia_cornelius_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 60)
	{
		b_giveinvitems(self,other,itwr_corneliustagebuch_mis,1);
		b_givethiefxp();
		Info_ClearChoices(dia_cornelius_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_cornelius_pickpocket_back()
{
	Info_ClearChoices(dia_cornelius_pickpocket);
};

