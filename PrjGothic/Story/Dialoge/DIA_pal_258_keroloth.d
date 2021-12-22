
instance DIA_KEROLOTH_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_exit_condition;
	information = dia_keroloth_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_keroloth_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_HELLO(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 2;
	condition = dia_keroloth_hello_condition;
	information = dia_keroloth_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_keroloth_hello_condition()
{
	if(Npc_IsInState(self,zs_talk))
	{
		return TRUE;
	};
};

func void dia_keroloth_hello_info()
{
	AI_Output(other,self,"DIA_Keroloth_HELLO_15_00");	//�� ���������� �����?
	AI_Output(self,other,"DIA_Keroloth_HELLO_07_01");	//��. ����� ��� ���� ���, ��� ��� ����, �������, ������� �����, ��� ����������� ������ ���.
};


instance DIA_KEROLOTH_WANTTEACH(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 3;
	condition = dia_keroloth_wantteach_condition;
	information = dia_keroloth_wantteach_info;
	permanent = FALSE;
	description = "�� ������ ������� � ����?";
};


func int dia_keroloth_wantteach_condition()
{
	if(KEROLOTHS_BEUTELLEER == FALSE)
	{
		return TRUE;
	};
};

func void dia_keroloth_wantteach_info()
{
	AI_Output(other,self,"DIA_Keroloth_WantTeach_15_00");	//�� ������ ������� � ����?
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_01");	//�������. � �������� ����.
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_02");	//�� ����� ������� ���� ����������� ������� ������, ���� �� ������ ������ �����.
	AI_Output(self,other,"DIA_Keroloth_WantTeach_07_03");	//�������� � ������ �������. �� �������� ����.
	KEROLOTH_TEACHPLAYER = TRUE;
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"������� ��������� �������� � �����.");
	Log_CreateTopic(TOPIC_TRADER_OC,LOG_NOTE);
	b_logentry(TOPIC_TRADER_OC,"������ ������� ������ � �����.");
};


var int dia_keroloth_teach_permanent_1h;
var int dia_keroloth_teach_permanent;

instance DIA_KEROLOTH_TEACHER(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 100;
	condition = dia_keroloth_teacher_condition;
	information = dia_keroloth_teacher_info;
	permanent = TRUE;
	description = "(������� ��� ���������� �������)";
};


func int dia_keroloth_teacher_condition()
{
	if((KEROLOTH_TEACHPLAYER == TRUE) && (KEROLOTHS_BEUTELLEER == FALSE) && (DIA_KEROLOTH_TEACH_PERMANENT_1H == FALSE))
	{
		return TRUE;
	};
};

func void dia_keroloth_teacher_info()
{
	AI_Output(other,self,"DIA_Keroloth_Teacher_15_00");	//� ���� �������������!
	Info_ClearChoices(dia_keroloth_teacher);
	Info_AddChoice(dia_keroloth_teacher,DIALOG_BACK,dia_keroloth_teacher_back);
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_keroloth_teacher_1h_1);
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_keroloth_teacher_1h_5);
};

func void dia_keroloth_teacher_back()
{
	Info_ClearChoices(dia_keroloth_teacher);
};

func void b_keroloth_teachnomore1()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore1_07_00");	//�� ����� �����. ��� ������ ������ ����� ����.
};

func void b_keroloth_teachnomore2()
{
	AI_Output(self,other,"B_Keroloth_TeachNoMore2_07_00");	//������ ����� ������� ������ ������ ������ ���� ������.
};

func void dia_keroloth_teacher_1h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,1,60);
	if(other.hitchance[NPC_TALENT_1H] >= 60)
	{
		b_keroloth_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_1H) == 2)
		{
			b_keroloth_teachnomore2();
		};
		DIA_KEROLOTH_TEACH_PERMANENT = TRUE;
	};
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H1,b_getlearncosttalent(other,NPC_TALENT_1H)),dia_keroloth_teacher_1h_1);
};

func void dia_keroloth_teacher_1h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_1H,5,60);
	if(other.hitchance[NPC_TALENT_1H] >= 60)
	{
		b_keroloth_teachnomore1();
		if(Npc_GetTalentSkill(other,NPC_TALENT_1H) == 2)
		{
			b_keroloth_teachnomore2();
		};
		DIA_KEROLOTH_TEACH_PERMANENT_1H = TRUE;
	};
	Info_AddChoice(dia_keroloth_teacher,b_buildlearnstring(PRINT_LEARN1H5,b_getlearncosttalent(other,NPC_TALENT_1H) * 5),dia_keroloth_teacher_1h_5);
};


instance DIA_KEROLOTH_TEACH(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 101;
	condition = dia_keroloth_teach_condition;
	information = dia_keroloth_teach_info;
	permanent = TRUE;
	description = "(������� ��� ��������� �������)";
};


func int dia_keroloth_teach_condition()
{
	if((KEROLOTH_TEACHPLAYER == TRUE) && (KEROLOTHS_BEUTELLEER == FALSE) && (DIA_KEROLOTH_TEACH_PERMANENT == FALSE))
	{
		return TRUE;
	};
};

func void dia_keroloth_teach_info()
{
	AI_Output(other,self,"DIA_Keroloth_Teach_15_00");	//������.
	Info_ClearChoices(dia_keroloth_teach);
	Info_AddChoice(dia_keroloth_teach,DIALOG_BACK,dia_keroloth_teach_back);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_keroloth_teach_2h_1);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_keroloth_teach_2h_5);
};

func void dia_keroloth_teach_back()
{
	Info_ClearChoices(dia_keroloth_teach);
};

func void dia_keroloth_teach_2h_1()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,1,60);
	if(other.hitchance[NPC_TALENT_2H] >= 60)
	{
		b_keroloth_teachnomore1();
		DIA_KEROLOTH_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_keroloth_teach);
	Info_AddChoice(dia_keroloth_teach,DIALOG_BACK,dia_keroloth_teach_back);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_keroloth_teach_2h_1);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_keroloth_teach_2h_5);
};

func void dia_keroloth_teach_2h_5()
{
	b_teachfighttalentpercent(self,other,NPC_TALENT_2H,5,60);
	if(other.hitchance[NPC_TALENT_2H] >= 60)
	{
		b_keroloth_teachnomore1();
		DIA_KEROLOTH_TEACH_PERMANENT = TRUE;
	};
	Info_ClearChoices(dia_keroloth_teach);
	Info_AddChoice(dia_keroloth_teach,DIALOG_BACK,dia_keroloth_teach_back);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H1,b_getlearncosttalent(other,NPC_TALENT_2H)),dia_keroloth_teach_2h_1);
	Info_AddChoice(dia_keroloth_teach,b_buildlearnstring(PRINT_LEARN2H5,b_getlearncosttalent(other,NPC_TALENT_2H) * 5),dia_keroloth_teach_2h_5);
};


instance DIA_KEROLOTH_UDAR(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 4;
	condition = dia_keroloth_udar_condition;
	information = dia_keroloth_udar_info;
	permanent = FALSE;
	description = "��� ������ �������� ���?";
};


func int dia_keroloth_udar_condition()
{
	if((KEROLOTH_TEACHPLAYER == TRUE) && (KEROLOTHS_BEUTELLEER == FALSE))
	{
		return TRUE;
	};
};

func void dia_keroloth_udar_info()
{
	AI_Output(other,self,"DIA_Keroloth_Udar_15_00");	//��� ������ �������� ���?
	AI_Output(self,other,"DIA_Keroloth_Udar_07_01");	//��� ������ ����?
	AI_Output(other,self,"DIA_Keroloth_Udar_15_02");	//�� ������ ������� ���� ���?
	AI_Output(self,other,"DIA_Keroloth_Udar_07_03");	//���, �� �� ������ ��������� �����. �� ������� - ���, �� ������ ����������, ��������� � ����.
	Log_CreateTopic(TOPIC_TEACHER_OC,LOG_NOTE);
	b_logentry(TOPIC_TEACHER_OC,"����, �� ����� ������ ��������, ����� ��� �� ���������.");
};


instance DIA_KEROLOTH_KAP3_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap3_exit_condition;
	information = dia_keroloth_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_KAP4_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap4_exit_condition;
	information = dia_keroloth_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_KAP4_HELLO(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 40;
	condition = dia_keroloth_kap4_hello_condition;
	information = dia_keroloth_kap4_hello_info;
	description = "� ���� ����� ������������ ���.";
};


func int dia_keroloth_kap4_hello_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_hello_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_15_00");	//� ���� ����� ������������ ���.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_01");	//(�����������) ���� ��� ��������. ��� ���� �����: ���� �� ������� �� ����� �����.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_07_02");	//���� �����������, � ��� - ������� ��� �����. ��� �������!
	Info_AddChoice(dia_keroloth_kap4_hello,DIALOG_BACK,dia_keroloth_kap4_hello_ende);
	Info_AddChoice(dia_keroloth_kap4_hello,"������� �� ������ ��� ������ �������� �� ����.",dia_keroloth_kap4_hello_ruhig);
	Info_AddChoice(dia_keroloth_kap4_hello,"� ���� ���-�� ������?",dia_keroloth_kap4_hello_bestohlen);
	Info_AddChoice(dia_keroloth_kap4_hello,"��� �� �������?",dia_keroloth_kap4_hello_pack);
};

func void dia_keroloth_kap4_hello_ende()
{
	Info_ClearChoices(dia_keroloth_kap4_hello);
};

func void dia_keroloth_kap4_hello_bestohlen()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_15_00");	//� ���� ���-�� ������?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_01");	//���. ��� �������� 20 ������� � ��� ������. ������� ��, ���� ��������, ��, �����!
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_07_02");	//������, ����� � �������� �� ���� �������...
	Info_AddChoice(dia_keroloth_kap4_hello,"��� ��� � ���� �������?",dia_keroloth_kap4_hello_bestohlen_wasfehlt);
};

func void dia_keroloth_kap4_hello_bestohlen_wasfehlt()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_00");	//��� ��� � ���� �������?
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_01");	//��� �������, �� ����� ����� ������������.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_02");	//��� ������!
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_15_03");	//�� ���-������ ��������.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_bestohlen_wasfehlt_07_04");	//����� � �������� �� ����...
	Log_CreateTopic(TOPIC_KEROLOTHSGELDBEUTEL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KEROLOTHSGELDBEUTEL,LOG_RUNNING);
	b_logentry(TOPIC_KEROLOTHSGELDBEUTEL,"������� ������� ������� ���� �������. �� ����������, ��� ��� ������ �������� �� ��������.");
	Info_ClearChoices(dia_keroloth_kap4_hello);
};

func void dia_keroloth_kap4_hello_pack()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_pack_15_00");	//��� �� �������?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_01");	//��, ���������, �������� �� ��������, �������. ��� ���?
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_02");	//���� �����, ���������� ���� ���������� �� ��������, �������. � ���� ���, ��� �� �������, � ���� ����� � ����?
	};
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_pack_07_03");	//(���� ��� ���) ����� ���� ����������, ��� � ���� ������.
};

func void dia_keroloth_kap4_hello_ruhig()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_HELLO_ruhig_15_00");	//���������! ������� �� ������ ��� ������ �������� �� ����.
	AI_Output(self,other,"DIA_Keroloth_KAP4_HELLO_ruhig_07_01");	//�� � �� ���� �������������. ��� ���� ��� ��� ����������, ����!
};


instance DIA_KEROLOTH_KAP4_GELDGEFUNDEN(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 42;
	condition = dia_keroloth_kap4_geldgefunden_condition;
	information = dia_keroloth_kap4_geldgefunden_info;
	description = "� �����, � ����� ���� �������.";
};


func int dia_keroloth_kap4_geldgefunden_condition()
{
	if(Npc_KnowsInfo(other,dia_keroloth_kap4_hello) && (Npc_HasItems(other,itmi_kerolothsgeldbeutel_mis) || Npc_HasItems(other,itmi_kerolothsgeldbeutelleer_mis)))
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_geldgefunden_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_15_00");	//� �����, � ����� ���� �������.
	TOPIC_END_KEROLOTHSGELDBEUTEL = TRUE;
	b_giveplayerxp(XP_KEROLOTHSGELDBEUTEL);
	if(b_giveinvitems(other,self,itmi_kerolothsgeldbeutelleer_mis,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_01");	//������� ����. ����� ������ ������� ���?
		KEROLOTHS_BEUTELLEER = TRUE;
	};
	if(b_giveinvitems(other,self,itmi_kerolothsgeldbeutel_mis,1))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_07_02");	//���? ���? ����� ������� ������ ���?
	};
	if(hero.guild == GIL_DJG)
	{
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"�������. � ��� ������ �������?",dia_keroloth_kap4_geldgefunden_lohn);
	};
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"�� ��� ��� ���, � �������.",dia_keroloth_kap4_geldgefunden_schmiede);
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"� ���������� ������ �������� �� ��������.",dia_keroloth_kap4_geldgefunden_djg);
	Info_AddChoice(dia_keroloth_kap4_geldgefunden,"������ ��� �����?",dia_keroloth_kap4_geldgefunden_keineahnung);
};

func void dia_keroloth_kap4_geldgefunden_keineahnung()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_15_00");	//������ ��� �����?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_01");	//�� ��������� ������ ����? ��� ���� ��� ��, ���������.
		Info_ClearChoices(dia_keroloth_kap4_geldgefunden);
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"� ���������� ������ �������� �� ��������.",dia_keroloth_kap4_geldgefunden_djg);
		Info_AddChoice(dia_keroloth_kap4_geldgefunden,"������� ��� �������.",dia_keroloth_kap4_geldgefunden_keineahnung_kannstmich);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_keineAhnung_07_02");	//� ��� ��� ������.
		AI_StopProcessInfos(self);
	};
};

func void dia_keroloth_kap4_geldgefunden_keineahnung_kannstmich()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_kannstmich_15_00");	//������� ��� �������.
	AI_Output(self,other,"DIA_Keroloth_KAP4_kannstmich_07_01");	//� ������ ����, ��� �������� ������� �����!
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_keroloth_kap4_geldgefunden_djg()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_15_00");	//� ���������� ������ �������� �� ��������.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_01");	//(���) � ���� ���.
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_02");	//(�����) �� ������ �� ������ ������� � �����.
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_DJG_07_03");	//��, �������, � ������ ���� ������...
	};
	AI_StopProcessInfos(self);
	if((Npc_IsDead(ferros) == FALSE) && (Npc_GetDistToNpc(self,ferros) <= 2000))
	{
		b_attack(self,ferros,AR_NONE,1);
	}
	else if((Npc_IsDead(jan) == FALSE) && (Npc_GetDistToNpc(self,jan) <= 2000))
	{
		b_attack(self,jan,AR_NONE,1);
	}
	else if((Npc_IsDead(rethon) == FALSE) && (Npc_GetDistToNpc(self,rethon) <= 2000))
	{
		b_attack(self,rethon,AR_NONE,1);
	};
};

func void dia_keroloth_kap4_geldgefunden_schmiede()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_15_00");	//���. �� ��� ��� ���, � �������.
	AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Schmiede_07_01");	//���? � �������? ��, ������ ����, ����� ��� �� ������� ������-������ �������� �� ��������. ������ �� ������ ���, ��� ��� �� ���.
};

func void dia_keroloth_kap4_geldgefunden_lohn()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_15_00");	//�������. � ��� ������ �������?
	if(KEROLOTHS_BEUTELLEER == TRUE)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_01");	//��� ���� ��������� �����. ��, ������, ����� �� ������� �� �����, �?
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_GELDGEFUNDEN_Lohn_07_02");	//�-��. ������. ��� ��������� �����. � ������ ����� ���, ��� ������ ���?
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		KEROLOTH_HASPAYED = TRUE;
	};
};


instance DIA_KEROLOTH_KAP4_BELOHNUNG(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 43;
	condition = dia_keroloth_kap4_belohnung_condition;
	information = dia_keroloth_kap4_belohnung_info;
	permanent = TRUE;
	description = "� ���� �������� ������� ������������ �� ��� �������.";
};


func int dia_keroloth_kap4_belohnung_condition()
{
	if(Npc_KnowsInfo(other,dia_keroloth_kap4_geldgefunden) && (KEROLOTH_HASPAYED == FALSE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_belohnung_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_BELOHNUNG_15_00");	//� ���� �������� ������� ������������ �� ��� �������.
	if((KEROLOTHS_BEUTELLEER == TRUE) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_01");	//��, � �������� �������� ���� � �������!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_BELOHNUNG_07_02");	//��� ���, ��� ���� �����? ��� ���� �����. � ������ ����������.
		CreateInvItems(self,itmi_gold,50);
		b_giveinvitems(self,other,itmi_gold,50);
		KEROLOTH_HASPAYED = TRUE;
	};
};


instance DIA_KEROLOTH_KAP4_ENTSPANNDICH(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 44;
	condition = dia_keroloth_kap4_entspanndich_condition;
	information = dia_keroloth_kap4_entspanndich_info;
	permanent = TRUE;
	description = "����������.";
};


func int dia_keroloth_kap4_entspanndich_condition()
{
	if((Npc_KnowsInfo(other,dia_keroloth_kap4_geldgefunden) && (KAPITEL >= 4)) || (MIS_OCGATEOPEN == TRUE))
	{
		return TRUE;
	};
};

func void dia_keroloth_kap4_entspanndich_info()
{
	AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_00");	//����������.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_01");	//��, ������. � ���������.
	}
	else if(MIS_OCGATEOPEN == TRUE)
	{
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_02");	//� �� ���� �������� ���, �� ��� �������, ��� �� ���������, ������� ������ ������.
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_03");	//�� ��������� �� ���!
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_NONE,1);
	}
	else
	{
		AI_Output(other,self,"DIA_Keroloth_KAP4_ENTSPANNDICH_15_04");	//�� ���� ������� ���� ������� �����, ����� ���?
		AI_Output(self,other,"DIA_Keroloth_KAP4_ENTSPANNDICH_07_05");	//�� ���������� ����! ����������!
		AI_StopProcessInfos(self);
	};
};


instance DIA_KEROLOTH_KAP5_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap5_exit_condition;
	information = dia_keroloth_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_KAP6_EXIT(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 999;
	condition = dia_keroloth_kap6_exit_condition;
	information = dia_keroloth_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_keroloth_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_keroloth_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_KEROLOTH_PICKPOCKET(C_INFO)
{
	npc = pal_258_keroloth;
	nr = 900;
	condition = dia_keroloth_pickpocket_condition;
	information = dia_keroloth_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_keroloth_pickpocket_condition()
{
	return c_beklauen(25,45);
};

func void dia_keroloth_pickpocket_info()
{
	Info_ClearChoices(dia_keroloth_pickpocket);
	Info_AddChoice(dia_keroloth_pickpocket,DIALOG_BACK,dia_keroloth_pickpocket_back);
	Info_AddChoice(dia_keroloth_pickpocket,DIALOG_PICKPOCKET,dia_keroloth_pickpocket_doit);
};

func void dia_keroloth_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_keroloth_pickpocket);
};

func void dia_keroloth_pickpocket_back()
{
	Info_ClearChoices(dia_keroloth_pickpocket);
};

