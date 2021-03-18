
instance DIA_TORLOF_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_exit_condition;
	information = dia_torlof_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_torlof_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_HALLO(C_INFO)
{
	npc = sld_801_torlof;
	nr = 1;
	condition = dia_torlof_hallo_condition;
	information = dia_torlof_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_hallo_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_hallo_info()
{
	AI_Output(self,other,"DIA_Torlof_Hallo_01_00");	//(�����������) ���� ���� ����� �� ����?
};


instance DIA_TORLOF_WANNAJOIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 2;
	condition = dia_torlof_wannajoin_condition;
	information = dia_torlof_wannajoin_info;
	permanent = FALSE;
	description = "� ���� �������������� � ���������!";
};


func int dia_torlof_wannajoin_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_torlof_wannajoin_info()
{
	AI_Output(other,self,"DIA_Torlof_WannaJoin_15_00");	//� ���� �������������� � ���������!
	AI_Output(self,other,"DIA_Torlof_WannaJoin_01_01");	//��? � � ���� �� ����, ��� � �������� ���� � ���� ���������?
};


var int torlof_go;

instance DIA_TORLOF_PROBE(C_INFO)
{
	npc = sld_801_torlof;
	nr = 3;
	condition = dia_torlof_probe_condition;
	information = dia_torlof_probe_info;
	permanent = TRUE;
	description = "������� ����!";
};


func int dia_torlof_probe_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_wannajoin) && (hero.guild == GIL_NONE) && (TORLOF_GO == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_probe_info()
{
	AI_Output(other,self,"DIA_Torlof_Probe_15_00");	//������� ����!
	AI_Output(self,other,"DIA_Torlof_Probe_01_01");	//���� ������ �� ��� ��?
	if(Npc_KnowsInfo(other,dia_lee_othersld))
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_02");	//�� ������, �� �������� ���.
		AI_Output(self,other,"DIA_Torlof_Probe_01_03");	//(��������) ������. ����� ������. ������ ��� �������������� � ���, �� ������ ������� ��� ����.
		AI_Output(self,other,"DIA_Torlof_Probe_01_04");	//��-������, �� ������ ��������, ��� �������� ������ ������, ������� ������ � ����������� ���������. � ������ �������� ����.
		AI_Output(self,other,"DIA_Torlof_Probe_01_05");	//� ������: �� ������ ��������� �������� ������ ���������.
		TORLOF_GO = TRUE;
		Npc_ExchangeRoutine(self,"Start");
		Log_CreateTopic(TOPIC_BECOMESLD,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_BECOMESLD,LOG_RUNNING);
		b_logentry(TOPIC_BECOMESLD,"����� ���� �������� � ���� ���������, � ������ ������ ��������� ������� � ��������� �������� ��������� ���������.");
	}
	else
	{
		AI_Output(other,self,"DIA_Torlof_Probe_15_06");	//���.
		AI_Output(self,other,"DIA_Torlof_Probe_01_07");	//����� � ���� �� ��� � ������ ����������� ���� ����?
		AI_StopProcessInfos(self);
	};
};


instance DIA_TORLOF_RESPEKT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 4;
	condition = dia_torlof_respekt_condition;
	information = dia_torlof_respekt_info;
	permanent = FALSE;
	description = "��� ��� ��������� �������� ������ ���������? ";
};


func int dia_torlof_respekt_condition()
{
	if((TORLOF_GO == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_respekt_info()
{
	AI_Output(other,self,"DIA_Torlof_Respekt_15_00");	//��� ��� ��������� �������� ������ ���������?
	AI_Output(self,other,"DIA_Torlof_Respekt_01_01");	//��� ����������� ����� ����������, ���� �� ��������� ���� ������� � �������� ��� ���������.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_02");	//�� ����� ������� ���������, ���� �������� �������� ������ ������.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_03");	//��������� ���������� ������� ������ �� ������ ���������, � ������ ����� �� ����������� ���� ����.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_04");	//�� ������ ���������� ��������� ��� ����� ������ ����� ������ - �� ���� ������ �� ��������, �� ������ ������ ���������� � �����.
	AI_Output(self,other,"DIA_Torlof_Respekt_01_05");	//���� �� ��������, �� �������� �������� ����������� �� ���. �� ������ ������, �� ���� �������� ����-������. ����� � ���� ����� ����� ������� ��������.
	Log_CreateTopic(TOPIC_SLDRESPEKT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SLDRESPEKT,LOG_RUNNING);
	b_logentry(TOPIC_SLDRESPEKT,"���� � ����, ����� �������� ������� ����, � ������ ������ ���������, �������������� ��� ��������. ����� �� ����� �������, ������� � �����.");
};


instance DIA_TORLOF_DUELLREGELN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 5;
	condition = dia_torlof_duellregeln_condition;
	information = dia_torlof_duellregeln_info;
	permanent = FALSE;
	description = "��� �� ������� ������?";
};


func int dia_torlof_duellregeln_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_respekt) || Npc_KnowsInfo(other,dia_jarvis_missionko))
	{
		return TRUE;
	};
};

func void dia_torlof_duellregeln_info()
{
	AI_Output(other,self,"DIA_Torlof_Duellregeln_15_00");	//������ ������� �����?
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_01");	//��� �������� ������. ��� �������� ������ ����� ����������� �������� ������ �� ��������� ������� �����.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_02");	//������ ������ ��� ����� � ������� �� ����-������ ��� ��������������.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_03");	//����������� ������ ����� ����� ������ �����. �����������, ��������, ��� ��� �����-������ ������� ��� ��������.
	AI_Output(self,other,"DIA_Torlof_Duellregeln_01_04");	//����� �� ������������ �� ����� ����� ����������� � �����. ���� ������ ���� �� ��������� �� ����� ����.
	b_logentry(TOPIC_SLDRESPEKT,"������� �����: ����� ������ �������� � ������, ����� � ��� ����� �� ����� ����� ���������. ���������� � ����� ������ �������.");
};


instance DIA_TORLOF_DEINESTIMME(C_INFO)
{
	npc = sld_801_torlof;
	nr = 6;
	condition = dia_torlof_deinestimme_condition;
	information = dia_torlof_deinestimme_info;
	permanent = FALSE;
	description = "� ��� ������ ����? �� ������������ �� ����?";
};


func int dia_torlof_deinestimme_condition()
{
	if((TORLOF_GO == TRUE) && (other.guild == GIL_NONE) && (MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_torlof_deinestimme_info()
{
	AI_Output(other,self,"DIA_Torlof_DeineStimme_15_00");	//� ��� ������ ����? �� ������������ �� ����?
	AI_Output(self,other,"DIA_Torlof_DeineStimme_01_01");	//���� �� ������� ��������, ��� ������ ��������� ����������� ��������, �� ��.
};


var int points_sld;

instance DIA_TORLOF_RUF(C_INFO)
{
	npc = sld_801_torlof;
	nr = 7;
	condition = dia_torlof_ruf_condition;
	information = dia_torlof_ruf_info;
	permanent = TRUE;
	description = "��� ��� ��������� ����� ���������?";
};


func int dia_torlof_ruf_condition()
{
	if((TORLOF_GO == TRUE) && (TORLOF_GENUGSTIMMEN == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_ruf_info()
{
	AI_Output(other,self,"DIA_Torlof_RUF_15_00");	//��� ��� ��������� ����� ���������?
	AI_Output(self,other,"DIA_Torlof_RUF_01_01");	//���, ���������...
	POINTS_SLD = 0;
	if(Npc_IsDead(sld_wolf))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(sld_wolf.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_02");	//����� �������, ��� ������ �� ����� ������ ����.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(Npc_IsDead(jarvis))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(MIS_JARVIS_SLDKO == LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_03");	//������� ��������, ��� �� �� ���������� �������.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(jarvis.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_04");	//������� ��� ��� �� ������, ��� �� �� ���������� �������.
		AI_Output(self,other,"DIA_Torlof_RUF_01_05");	//�� �� �����, ����� ��� ����� ������� ������� ��� ������ �����. ���� ���� ��� ���������, � ���� � � ��� ��������.
	};
	if(Npc_IsDead(cord))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(CORD_APPROVED == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_06");	//���� ��������, ��� �� ���������� �����, ����� �������������� � ���.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cord.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_07");	//�� ������ �����, ���� ����� ������� ��������� ����� ������� �������.
	};
	if(Npc_IsDead(cipher))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if((MIS_CIPHER_PAKET == LOG_SUCCESS) || (MIS_CIPHER_BRINGWEED == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_08");	//����� �������, ��� ��� ��������� ����, ��� �� ������� �������������� � ���. ������, ���-�� ������� ��� ����������� ����������.
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(cipher.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_09");	//����� �������, ��� �� ����� ������, � ��� �� ������, � ��� ���� ����.
	};
	if(Npc_IsDead(rod))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(rod,itmw_2h_rod) == 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_10");	//��� ������ ����� �������� ���� ��� �����.
	}
	else if((rod.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || (ROD_WETTEGEWONNEN == TRUE))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_11");	//������, ���� ������� ������� ����, ��� �� ���������� �����.
		if(rod.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			POINTS_SLD = POINTS_SLD + 1;
		};
	}
	else if(rod.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_12");	//��� ������� ���� ��������.
	};
	if(Npc_IsDead(sentenza))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(Npc_HasItems(sentenza,itmi_gold) >= 50)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_13");	//�������� ����������� �� ����. �� �������, ��� �� ������ �������������� �������.
		POINTS_SLD = POINTS_SLD + 1;
		TORLOF_SENTENZACOUNTED = TRUE;
	}
	else if(sentenza.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_14");	//�������� �� ����������� �� ����. �� �������, ��� �� ������ ��� 50 ������� �����.
	};
	if(Npc_IsDead(raoul))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(raoul.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_15");	//����� ������ ����. ��� �������, �� �� ��� ���� �� �������.
	};
	if(Npc_IsDead(bullco))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(bullco.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_16");	//� ������� � ����� ���� �������� ������. ��� ��� ������� ������ ������ ���� � ���.
	};
	if(Npc_IsDead(buster))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(BUSTER_DUELL == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_17");	//������ �������, ��� � ����� ��� � �������.
		if(buster.aivar[AIV_DEFEATEDBYPLAYER] == FALSE)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_18");	//���� �� � �������� ���.
		};
	}
	else if(buster.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_19");	//������ �������, ��� �� �������, ����� �� ������ ����.
		AI_Output(self,other,"DIA_Torlof_RUF_01_20");	//��� �� ����� ������. ��������, ���� ����� ��������� �� �������� � ������� ���.
	};
	if(Npc_IsDead(dar))
	{
		POINTS_SLD = POINTS_SLD + 1;
	}
	else if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_21");	//��� �������, ��� �� ������. �� � ��� ������ ����� �� �������� ��������������.
	};
	if(POINTS_SLD > 0)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_22");	//��������� �������� ������ �� �������.
	};
	if((MIS_TORLOF_HOLPACHTVONSEKOB != LOG_SUCCESS) && (MIS_TORLOF_BENGARMILIZKLATSCHEN != LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_23");	//����������� �� ��� ������ ����, �������� �� �� ���������.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_24");	//�� ������ ����������� �� ���, ������ ���������.
		if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_25");	//���� ������ �������, ��� ��������� ������� ��������� ����� ���� ������� �����, ����� ������� ��� ����������.
			POINTS_SLD = POINTS_SLD + 3;
		}
		else
		{
			POINTS_SLD = POINTS_SLD + 5;
		};
		AI_Output(self,other,"DIA_Torlof_RUF_01_26");	//� ����� ������, �� ������ ������������ �� ��� �����.
		POINTS_SLD = POINTS_SLD + 1;
	};
	if(SLD_DUELLE_GEWONNEN >= 3)
	{
		POINTS_SLD = POINTS_SLD + 1;
		if(POINTS_SLD >= 9)
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_27");	//� �� ������� � ���������� ������� ������.
			AI_Output(self,other,"DIA_Torlof_RUF_01_28");	//������ �������� ������� ���.
		}
		else
		{
			AI_Output(self,other,"DIA_Torlof_RUF_01_29");	//��� �� �� �� ����, �� ��� ������� � ���������� ������� ������.
		};
	};
	if(POINTS_SLD >= 9)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_30");	//����������� ��������� �� ����, � �� �������, ��� �� ������ �������������� � ��� � ����� �����.
		AI_Output(self,other,"DIA_Torlof_RUF_01_31");	//���, �������� � ��. �� �������� ���� ������.
		TORLOF_GENUGSTIMMEN = TRUE;
		b_logentry(TOPIC_BECOMESLD,"� �������� �������� ���������. ������, � ������ ������������ � ��.");
	}
	else if(POINTS_SLD >= 7)
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_32");	//��� �������� �����, �� ���� ��� �� ����������.
		AI_Output(self,other,"DIA_Torlof_RUF_01_33");	//���� ����� ��� ��������� � ����������� �������.
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_RUF_01_34");	//���� ��� ������ �� ��������� ���������, ������. ���� �� ������, ����� �� ������� ���� � ���� ����, ���� ����� ������ �����������.
	};
};


instance DIA_TORLOF_AUFGABEN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 8;
	condition = dia_torlof_aufgaben_condition;
	information = dia_torlof_aufgaben_info;
	permanent = FALSE;
	description = "� ������ ����������� ��������?";
};


func int dia_torlof_aufgaben_condition()
{
	if((TORLOF_GO == TRUE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_torlof_aufgaben_info()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_15_00");	//� ������ ����������� ��������?
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_01");	//���� ����� ��� �� ���� ��������: �� �����, ����� �� �������� � ��� ��� ���������, � �� �����, ����� �� ������������ ������� �� ��� ������.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_02");	//��� �������� ���� �����, ����� ������� ������������ �������.
	AI_Output(self,other,"DIA_Torlof_Aufgaben_01_03");	//����, ��� �� ���������?
	Info_ClearChoices(dia_torlof_aufgaben);
	Info_AddChoice(dia_torlof_aufgaben,"� ������ �����!",dia_torlof_aufgaben_pacht);
	Info_AddChoice(dia_torlof_aufgaben,"� ��������� � ����������, ������ ������ �� ���� ��������!",dia_torlof_aufgaben_miliz);
};

func void b_torlof_holpachtvonsekob()
{
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_00");	//������. ������. ������ ����� �� ������ ����� ����� ��� ��������� ������.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_01");	//���� �����, ����� ��� ������� 50 ������� �����. ���� �������?
	AI_Output(other,self,"B_Torlof_HolPachtvonSekob_15_02");	//��� ����� ������?
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_03");	//�� ������ ���� ������. ���� �������� ������, ��� ����� ������ �� �������� �����������.
	AI_Output(self,other,"B_Torlof_HolPachtvonSekob_01_04");	//���� � ���� ����� ��������, ������� �� ����� ������� ���� ����� ������.
	MIS_TORLOF_HOLPACHTVONSEKOB = LOG_RUNNING;
	sekob.flags = 0;
	CreateInvItems(sekob,itmi_gold,50);
	Log_CreateTopic(TOPIC_TORLOFPACHT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFPACHT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFPACHT,"������ �������� ���� ������� ����� � ������� ������. �� ������ ��������� 50 ������� �����.");
};

func void b_torlof_bengarmilizklatschen()
{
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_00");	//������ ������ ������� ���������, ��� ��������� �� ������ ��������� ��� �� �����.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_01");	//��� ����� �� ����� ������� - ��������, �������� ��������� ��� ������� ��������� � ������.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_02");	//� ����, ����� �� ���������� �� ��� ����� � ��� ������ ���� ����������, ��� ��� �� ������ ������! ���� �������?
	AI_Output(other,self,"B_Torlof_BengarMilizKlatschen_15_03");	//��� ��� ����� ����� �������?
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_04");	//�� ���-������ ���� ������ ���� ������� ��������, ������� �� ����� � �����. �� ��� � ��������� ����� �������.
	AI_Output(self,other,"B_Torlof_BengarMilizKlatschen_01_05");	//���� �� �����������, ����������� �������� �� �����, ��� ������� ���� ������.
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_RUNNING;
	bengar.flags = 0;
	Wld_InsertNpc(mil_335_rumbold,"FARM3");
	Wld_InsertNpc(mil_336_rick,"FARM3");
	b_initnpcglobals();
	Log_CreateTopic(TOPIC_TORLOFMILIZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOFMILIZ,LOG_RUNNING);
	b_logentry(TOPIC_TORLOFMILIZ,"������ �������� ������� ��������� � ����� �������. ��� ��������� �� �����������.");
};

func void dia_torlof_aufgaben_pacht()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Pacht_15_00");	//� ������ �����!
	b_torlof_holpachtvonsekob();
	TORLOF_PROBE = PROBE_SEKOB;
	Info_ClearChoices(dia_torlof_aufgaben);
};

func void dia_torlof_aufgaben_miliz()
{
	AI_Output(other,self,"DIA_Torlof_Aufgaben_Miliz_15_00");	//� ��������� � ����������, ������ ������ �� ���� ��������!
	b_torlof_bengarmilizklatschen();
	TORLOF_PROBE = PROBE_BENGAR;
	Info_ClearChoices(dia_torlof_aufgaben);
};


var int torlof_theothermission_day;

func void b_torlof_theothermissionday()
{
	if(TORLOF_THEOTHERMISSION_DAY < (Wld_GetDay() - 1))
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_00");	//�� �������� �� ��� ������� ����� �������. ���� ����� ���������.
		TORLOF_THEOTHERMISSION_TOOLATE = TRUE;
		if(ENTEROW_KAPITEL2 == TRUE)
		{
			AI_Output(self,other,"DIA_Torlof_Add_01_00");	//� ��� ��� �����, �������� �������� � ������ �������� ��� ���...
		};
	}
	else
	{
		AI_Output(self,other,"B_Torlof_TheOtherMissionDay_01_01");	//�������! ����� � ���� ����� ���-������ ���������, � ��� ���� �����.
	};
};


instance DIA_TORLOF_SEKOBSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 9;
	condition = dia_torlof_sekobsuccess_condition;
	information = dia_torlof_sekobsuccess_info;
	permanent = TRUE;
	description = "� ������ ����� ������.";
};


func int dia_torlof_sekobsuccess_condition()
{
	if(MIS_TORLOF_HOLPACHTVONSEKOB == LOG_RUNNING)
	{
		if((sekob.aivar[AIV_DEFEATEDBYPLAYER] == TRUE) || Npc_IsDead(sekob))
		{
			return TRUE;
		};
	};
};

func void dia_torlof_sekobsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_00");	//� ������ ����� ������.
	if(b_giveinvitems(other,self,itmi_gold,50))
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_01");	//�? �� �������� �����������?
		if(Npc_IsDead(sekob))
		{
			AI_Output(other,self,"DIA_Torlof_SekobTot_15_00");	//��, � ��� ��������� ���������� ������...
		}
		else
		{
			AI_Output(other,self,"DIA_Torlof_SekobSuccess_15_02");	//��� �������� ������� ���.
		};
		if(TORLOF_PROBE == PROBE_SEKOB)
		{
			AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_03");	//�������! �� ������ ���������. ��� ������ ����������� ���������, ��� �� ��������� ��������.
		}
		else
		{
			b_torlof_theothermissionday();
		};
		MIS_TORLOF_HOLPACHTVONSEKOB = LOG_SUCCESS;
		b_giveplayerxp(XP_TORLOF_SEKOBSKOHLEBEKOMMEN);
		b_logentry(TOPIC_BECOMESLD,"� �������� ������, ������� ��� ��� ������.");
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_SekobSuccess_01_04");	//�? �� ���, �������� ��� ������? �� ������ �������� �� ���! � ���������!
	};
};


instance DIA_TORLOF_BENGARSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 10;
	condition = dia_torlof_bengarsuccess_condition;
	information = dia_torlof_bengarsuccess_info;
	permanent = FALSE;
	description = "� ����� �������� ������� � ����������.";
};


func int dia_torlof_bengarsuccess_condition()
{
	if((MIS_TORLOF_BENGARMILIZKLATSCHEN == LOG_RUNNING) && Npc_IsDead(rumbold) && Npc_IsDead(rick))
	{
		return TRUE;
	};
};

func void dia_torlof_bengarsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_00");	//� ����� �������� ������� � ����������.
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_01");	//�� �����������, ����� ��� �� ��������� � ���� �� ������ ������ �����?
	AI_Output(other,self,"DIA_Torlof_BengarSuccess_15_02");	//����� ������� ���, �� �������� ����� ������ �����������...
	AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_03");	//�������!
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		AI_Output(self,other,"DIA_Torlof_BengarSuccess_01_04");	//�� ������ ���������. �� ���� ����������� � ����������, ����� ����������, ����� ��������� �������� �����������.
	}
	else
	{
		b_torlof_theothermissionday();
	};
	MIS_TORLOF_BENGARMILIZKLATSCHEN = LOG_SUCCESS;
	b_giveplayerxp(XP_BENGAR_MILIZKLATSCHEN);
	b_logentry(TOPIC_BECOMESLD,"� �������� ������, ������� ��� ��� ������.");
};


instance DIA_TORLOF_WELCOME(C_INFO)
{
	npc = sld_801_torlof;
	nr = 11;
	condition = dia_torlof_welcome_condition;
	information = dia_torlof_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_welcome_condition()
{
	if((other.guild == GIL_SLD) && (KAPITEL <= 1))
	{
		return TRUE;
	};
};

func void dia_torlof_welcome_info()
{
	AI_Output(self,other,"DIA_Torlof_Welcome_01_00");	//����� ���������� � ���� ���������, ������!
	AI_Output(other,self,"DIA_Torlof_Welcome_15_01");	//�������!
	AI_Output(self,other,"DIA_Torlof_Welcome_01_02");	//��� ������ � ���� ����� ������ ��� ����, � ��� ���� �����.
};


var int torlof_knowsdragons;

func void b_torlof_dragons()
{
	AI_Output(self,other,"DIA_Torlof_Add_01_01");	//��� �� ���?
	AI_Output(other,self,"DIA_Torlof_Add_15_02");	//� ��� � ������ ��������! ��� �������! � ��������� ���������� ��������!
	AI_Output(self,other,"DIA_Torlof_Add_01_03");	//��? ������, �� ���� ���� �������� ������������� ���� ���� ������!
	AI_Output(self,other,"DIA_Torlof_Add_01_04");	//�� ��� ����� ���������...
	TORLOF_KNOWSDRAGONS = TRUE;
};


instance DIA_TORLOF_THEOTHERMISSION(C_INFO)
{
	npc = sld_801_torlof;
	nr = 11;
	condition = dia_torlof_theothermission_condition;
	information = dia_torlof_theothermission_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_theothermission_condition()
{
	if((other.guild == GIL_SLD) && (KAPITEL >= 2))
	{
		return TRUE;
	};
};

func void dia_torlof_theothermission_info()
{
	if((TORLOF_KNOWSDRAGONS == FALSE) && (ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE))
	{
		b_torlof_dragons();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_00");	//������, ��� �� �����. � ���� ���� ��� ���� ������...
	AI_Output(other,self,"DIA_Torlof_TheOtherMission_15_01");	//��� �����?
	if(TORLOF_PROBE == PROBE_BENGAR)
	{
		b_torlof_holpachtvonsekob();
	}
	else
	{
		b_torlof_bengarmilizklatschen();
	};
	AI_Output(self,other,"DIA_Torlof_TheOtherMission_01_02");	//� �� ������ ��������� � ���� �� ����������� ����!
	TORLOF_THEOTHERMISSION_DAY = Wld_GetDay();
};


instance DIA_TORLOF_DRAGONS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 12;
	condition = dia_torlof_dragons_condition;
	information = dia_torlof_dragons_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_torlof_dragons_condition()
{
	if((ENTER_OLDWORLD_FIRSTTIME_TRIGGER_ONETIME == TRUE) && (KAPITEL <= 3) && (other.guild == GIL_SLD) && (TORLOF_KNOWSDRAGONS == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_dragons_info()
{
	b_torlof_dragons();
};


instance DIA_TORLOF_WHATCANYOUTEACH(C_INFO)
{
	npc = sld_801_torlof;
	nr = 140;
	condition = dia_torlof_whatcanyouteach_condition;
	information = dia_torlof_whatcanyouteach_info;
	permanent = FALSE;
	description = "�� ������ ������ ��� �������� ��� �����������?";
};


func int dia_torlof_whatcanyouteach_condition()
{
	return TRUE;
};

func void dia_torlof_whatcanyouteach_info()
{
	AI_Output(other,self,"DIA_Torlof_WhatCanYouTeach_15_00");	//�� ������ ������ ��� �������� ��� �����������?
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_01");	//� ��� �� �������� ����, ��� ����� ������������ ���� � ������� ���.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_02");	//������ ����� ����������� ��-�� ����, ��� �� ����� ��������� ��������� ���� ����.
	AI_Output(self,other,"DIA_Torlof_WhatCanYouTeach_01_03");	//�� �� ����� �������� �������� � ������������� ������.
	Log_CreateTopic(TOPIC_SOLDIERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_SOLDIERTEACHER,"������ ����� �������� ��� �������� � ����.");
};


var int torlof_merke_str;
var int torlof_merke_dex;

instance DIA_TORLOF_TEACH(C_INFO)
{
	npc = sld_801_torlof;
	nr = 150;
	condition = dia_torlof_teach_condition;
	information = dia_torlof_teach_info;
	permanent = TRUE;
	description = "� ���� �������� ���� �����������!";
};


func int dia_torlof_teach_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_whatcanyouteach))
	{
		return TRUE;
	};
};

func void dia_torlof_teach_info()
{
	AI_Output(other,self,"DIA_Torlof_Teach_15_00");	//� ���� �������� ���� �����������!
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE))
	{
		TORLOF_MERKE_STR = other.attribute[ATR_STRENGTH];
		TORLOF_MERKE_DEX = other.attribute[ATR_DEXTERITY];
		Info_ClearChoices(dia_torlof_teach);
		Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
		Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_Teach_01_01");	//� ������, ��� � ��� �� ������ ����, �� ��� �� ������, ��� � ���� ��������.
		AI_Output(self,other,"DIA_Torlof_Teach_01_02");	//���� �� �� ������� ����� �� ���, ���� ����� �������� ������� �������!
	};
};

func void dia_torlof_teach_back()
{
	if((TORLOF_MERKE_STR < other.attribute[ATR_STRENGTH]) || (TORLOF_MERKE_DEX < other.attribute[ATR_DEXTERITY]))
	{
		AI_Output(self,other,"DIA_Torlof_Teach_Back_01_00");	//������! ������ �� ������ ����� ���������� ������������ ���� �����������!
	};
	Info_ClearChoices(dia_torlof_teach);
};

func void dia_torlof_teach_str_1()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,1,90);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_str_5()
{
	b_teachattributepoints(self,other,ATR_STRENGTH,5,90);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_dex_1()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,1,90);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};

func void dia_torlof_teach_dex_5()
{
	b_teachattributepoints(self,other,ATR_DEXTERITY,5,90);
	Info_ClearChoices(dia_torlof_teach);
	Info_AddChoice(dia_torlof_teach,DIALOG_BACK,dia_torlof_teach_back);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX1,b_getlearncostattribute(other,ATR_DEXTERITY)),dia_torlof_teach_dex_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNDEX5,b_getlearncostattribute(other,ATR_DEXTERITY) * 5),dia_torlof_teach_dex_5);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR1,b_getlearncostattribute(other,ATR_STRENGTH)),dia_torlof_teach_str_1);
	Info_AddChoice(dia_torlof_teach,b_buildlearnstring(PRINT_LEARNSTR5,b_getlearncostattribute(other,ATR_STRENGTH) * 5),dia_torlof_teach_str_5);
};


instance DIA_TORLOF_KAP3_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap3_exit_condition;
	information = dia_torlof_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_torlof_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_DEMENTOREN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 30;
	condition = dia_torlof_dementoren_condition;
	information = dia_torlof_dementoren_info;
	description = "� ���� ���� �����-������ ������ ��� ����?";
};


func int dia_torlof_dementoren_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_torlof_dementoren_info()
{
	AI_Output(other,self,"DIA_Torlof_DEMENTOREN_15_00");	//� ���� ���� �����-������ ������ ��� ����?
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_01");	//�� ����� ���� ������, ������ � ������ ����, ������� ��������� �����? ���� �� ��� � ����� �������, ���� ������.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_02");	//����� � ����� �� ����, � ����� ����� �������� �����, �� ��� ����� ��-���������� �������� ����.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_03");	//��� ������ �� ������� ������ ��������, ������� ��������� � �����, � ����� ����� ���� ������.
	AI_Output(self,other,"DIA_Torlof_DEMENTOREN_01_04");	//��������, ���� ����� ������� ���� � ����������� � ����� �������!
	Wld_InsertNpc(castleminedmt,"FP_STAND_DEMENTOR_KDF_12");
	Log_CreateTopic(TOPIC_TORLOF_DMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TORLOF_DMT,LOG_RUNNING);
	b_logentry(TOPIC_TORLOF_DMT,"� ����� ����� ������, � �����, � ���������� ������, ������, ��������� ��� ���� � ������ �����. �� ��� � ������� ������. � ������ ������ ��� �������� ��� ����.");
	MIS_TORLOF_DMT = LOG_RUNNING;
};


instance DIA_TORLOF_DMTSUCCESS(C_INFO)
{
	npc = sld_801_torlof;
	nr = 30;
	condition = dia_torlof_dmtsuccess_condition;
	information = dia_torlof_dmtsuccess_info;
	description = "���� � ��� � ������ ����� ������ �� ����� ���������� ���.";
};


func int dia_torlof_dmtsuccess_condition()
{
	if((MIS_TORLOF_DMT == LOG_RUNNING) && Npc_IsDead(castleminedmt))
	{
		return TRUE;
	};
};

func void dia_torlof_dmtsuccess_info()
{
	AI_Output(other,self,"DIA_Torlof_DmtSuccess_15_00");	//���� � ��� � ������ ����� ������ �� ����� ���������� ���.
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_01");	//�� ���� ����������� � ����? �������!
	AI_Output(self,other,"DIA_Torlof_DmtSuccess_01_02");	//� ����� �� ������� ���� ������. �� ������ ���� �����, ��� �� ��� ����� ���� ������������...
	MIS_TORLOF_DMT = LOG_SUCCESS;
	b_giveplayerxp(XP_TORLOF_DMT);
};


instance DIA_TORLOF_KAP4_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap4_exit_condition;
	information = dia_torlof_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_torlof_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_WOISTSYLVIO(C_INFO)
{
	npc = sld_801_torlof;
	nr = 40;
	condition = dia_torlof_woistsylvio_condition;
	information = dia_torlof_woistsylvio_info;
	description = "���, ����� ��������� ���� ������?";
};


func int dia_torlof_woistsylvio_condition()
{
	if((MIS_READYFORCHAPTER4 == TRUE) || (KAPITEL == 4))
	{
		return TRUE;
	};
};

func void dia_torlof_woistsylvio_info()
{
	AI_Output(other,self,"DIA_Torlof_WOISTSYLVIO_15_00");	//���, ����� ��������� ���� ������?
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_01");	//������� ������ ���������� ������ � ���� ����� ������.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_02");	//������������, ��� ��� ��������� �������. ����� �� ��� �������, ��� ���� �� ����������.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_03");	//��� �����? ��������� �������� ��������� ����� ����� ������ �������.
	AI_Output(self,other,"DIA_Torlof_WOISTSYLVIO_01_04");	//�� ���� ��� �� ��������. � �����. � ���������� ����, � ��� ��� ���� �� ������� ������ �������.
};


instance DIA_TORLOF_KAP5_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap5_exit_condition;
	information = dia_torlof_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_torlof_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_BEMYCAPTAIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 51;
	condition = dia_torlof_bemycaptain_condition;
	information = dia_torlof_bemycaptain_info;
	description = "�� �����?";
};


func int dia_torlof_bemycaptain_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_00");	//�� �����?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_01");	//�� ���, ������ ����� �� ����? ��, ���� ������, � �����. � ������ �� �����������?
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN_15_02");	//� ��� �� ����� ���������� ����� ��������. ��� ����� ��������� �� �������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_03");	//(�������) �� �������? �� � ���� ���� ��� �������, �� ������ ��� � �������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_04");	//���, ��� �������. ���� �� ������ ��������������� ����� �������� � �������� �������� � ������� ����, �� ������ ������� �������� ���, ��� �� ���������, � ��� ��������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_05");	//����� ����, � ���� ������� � ������ �������. �������� �� ���� �� ������, ��� � ������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_06");	//������ ��������� ���-�� ����� ���������, ����� ��� �������� ������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN_01_07");	//����������� � ����� � ������ ��������. ������ � ��������� ���� �� ������� ����� � ������ ��. � ���� ����������� �� ���������!
	Log_CreateTopic(TOPIC_CAPTAIN,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CAPTAIN,LOG_RUNNING);
	b_logentry(TOPIC_CAPTAIN,"������ ��� ������ ���������� ������ ���� ��������, � ������ ��������� ��������� �������� �����. �� �������, ��� ����� �������� �������� � ����� � ������ ��������. �� �����, ����� � ����� ���� �� ������� ����� � ��������� � ������� ����� � �����. �� ��������, ��� ��� �������� ��������� �������� �����, ����� ������ ����� ���������.");
};


instance DIA_TORLOF_BEMYCAPTAIN2(C_INFO)
{
	npc = sld_801_torlof;
	nr = 52;
	condition = dia_torlof_bemycaptain2_condition;
	information = dia_torlof_bemycaptain2_info;
	description = "������ ����� � ������ �������� �������...";
};


func int dia_torlof_bemycaptain2_condition()
{
	if((MIS_OCGATEOPEN == TRUE) && Npc_KnowsInfo(other,dia_torlof_bemycaptain))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain2_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_00");	//������ ����� � ������ �������� �������, � �� ���������. ������ ����� �� ���������� �����, � ��� ����� ���� ����� ���������.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_01");	//�������� � ����� ����� ������� ������.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN2_15_02");	//�, � �����, �� ������� ����� �������, ����� �������� �� ������ �������� � ������ ��������, ����� �������� ������, ���������� � �����.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN2_01_03");	//��� ������� �������. ������ ����� �� ������ ��� �������� ��� ����� ��������� �����.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_TORLOF_BEMYCAPTAIN3(C_INFO)
{
	npc = sld_801_torlof;
	nr = 53;
	condition = dia_torlof_bemycaptain3_condition;
	information = dia_torlof_bemycaptain3_info;
	permanent = TRUE;
	description = "������ �� �������� ��� ��������� �� �������?";
};


var int torlof_paidtobecaptain;

func int dia_torlof_bemycaptain3_condition()
{
	if(Npc_KnowsInfo(other,dia_torlof_bemycaptain2) && (TORLOF_PAIDTOBECAPTAIN == FALSE) && (SCGOTCAPTAIN == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain3_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_15_00");	//������ �� �������� ��� ��������� �� �������?
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_01");	//��, ��. �� ����� ��������� �� �������. ���. ��� ��� �������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_02");	//�� ��������� ��� 2500 �������, � � ����� ����� ��������� ������ �������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_01_03");	//� ����� � ����� �������� ���� ���� � ��������, ����� �� ������ ����� ��������.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	Info_AddChoice(dia_torlof_bemycaptain3,"��� ��������� ������� �����.",dia_torlof_bemycaptain3_zuviel);
	Info_AddChoice(dia_torlof_bemycaptain3,"������. ��� ���� ������.",dia_torlof_bemycaptain3_ok);
};

func void dia_torlof_bemycaptain3_zuviel()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_zuViel_15_00");	//��� ��������� ������� �����.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_01");	//��. ������ ������������� ����� ������. �� � ���� ��� ������� ������. ���� �� ����� ������� �������� ��� ������ �������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_zuViel_01_02");	//��� ��� ����� ������� � �� �������� �������.
	Info_ClearChoices(dia_torlof_bemycaptain3);
	b_logentry(TOPIC_CAPTAIN,"������ ������ ����� ����������� ��������. ������, �� ����� �������� �� ��� ������ 2500 ������� �����.");
};

func void dia_torlof_bemycaptain3_ok()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN3_ok_15_00");	//������. ��� ���� ������.
	if(b_giveinvitems(other,self,itmi_gold,2500))
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_01");	//�����������. ������ ���� �������� ������ ���������� ��������, ��� � ������ ������.
		TORLOF_PAIDTOBECAPTAIN = TRUE;
		b_logentry(TOPIC_CAPTAIN,"����� ����, ��� ������ ������� 2500 ������� �����, ��, �������, ����� ���� �� ����.");
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN3_ok_01_02");	//�� ��������� ������ ����? ������� ������ ������. ����� � ���������.
	};
	Info_ClearChoices(dia_torlof_bemycaptain3);
};


instance DIA_TORLOF_BEMYCAPTAIN4(C_INFO)
{
	npc = sld_801_torlof;
	nr = 54;
	condition = dia_torlof_bemycaptain4_condition;
	information = dia_torlof_bemycaptain4_info;
	permanent = TRUE;
	description = "���� ���� ���������.";
};


func int dia_torlof_bemycaptain4_condition()
{
	if((SCGOTCAPTAIN == FALSE) && (TORLOF_PAIDTOBECAPTAIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_bemycaptain4_info()
{
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_00");	//���� ���� ���������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_01");	//������. ��� ��� ������� � ������� �������, � � �������� ���� �� ���� ��������� ������.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_02");	//� ���� ���� ������� �����? ��� ��� �� ������ �� �������.
	AI_Output(other,self,"DIA_Torlof_BEMYCAPTAIN4_15_03");	//� ���������� ��� ����. �������� � �����.
	AI_Output(self,other,"DIA_Torlof_BEMYCAPTAIN4_01_04");	//��� �� �������� �������, ��� ��� ��� � ���� ���������.
	AI_StopProcessInfos(self);
	SCGOTCAPTAIN = TRUE;
	TORLOFISCAPTAIN = TRUE;
	self.flags = NPC_FLAG_IMMORTAL;
	Npc_ExchangeRoutine(self,"WaitForShipCaptain");
	b_giveplayerxp(XP_CAPTAIN_SUCCESS);
};


instance DIA_TORLOF_LOSFAHREN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 59;
	condition = dia_torlof_losfahren_condition;
	information = dia_torlof_losfahren_info;
	permanent = TRUE;
	description = "�� ������������ � �������.";
};


func int dia_torlof_losfahren_condition()
{
	if((TORLOFISCAPTAIN == TRUE) && (MIS_READYFORCHAPTER6 == FALSE))
	{
		return TRUE;
	};
};

func void dia_torlof_losfahren_info()
{
	AI_Output(other,self,"DIA_Torlof_LOSFAHREN_15_00");	//�� ������������ � �������.
	if(b_captainconditions(self) == TRUE)
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_01");	//������. ��� ��� ������� �����, � �� ��������� ������.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_02");	//(������) ������� ������!
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_03");	//�������, ����� �� �� ����� ��� �����������. �������� �� �����.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_04");	//���� �� �� ���� ������, ���, �������� � ����������� �����. ��� ����������� ����� ������.
		AI_StopProcessInfos(self);
		b_captaincallsallonboard(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_05");	//��� �������, ������� � ������� ����� �������� ����������� �� �����, ��������.
		AI_Output(self,other,"DIA_Torlof_LOSFAHREN_01_06");	//��� �����, �� ������� ����, 5 �������, ������� ������ ��� ��� ������.
		AI_StopProcessInfos(self);
	};
};


instance DIA_TORLOF_PERM5_NOTCAPTAIN(C_INFO)
{
	npc = sld_801_torlof;
	nr = 59;
	condition = dia_torlof_perm5_notcaptain_condition;
	information = dia_torlof_perm5_notcaptain_info;
	permanent = TRUE;
	description = "� ����� ����� ������� ��������.";
};


func int dia_torlof_perm5_notcaptain_condition()
{
	if((SCGOTCAPTAIN == TRUE) && (TORLOFISCAPTAIN == FALSE) && (TORLOF_PAIDTOBECAPTAIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_torlof_perm5_notcaptain_info()
{
	AI_Output(other,self,"DIA_Torlof_PERM5_NOTCAPTAIN_15_00");	//� ����� ����� ������� ��������. ����� ��� ��� ������.
	AI_Output(self,other,"DIA_Torlof_PERM5_NOTCAPTAIN_01_01");	//����� � ���! ���� �� �������� ��� ������, � ����� ��������� �� ���� �����, ��� ���� ��������.
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_KAP6_EXIT(C_INFO)
{
	npc = sld_801_torlof;
	nr = 999;
	condition = dia_torlof_kap6_exit_condition;
	information = dia_torlof_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_torlof_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_torlof_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TORLOF_PICKPOCKET(C_INFO)
{
	npc = sld_801_torlof;
	nr = 900;
	condition = dia_torlof_pickpocket_condition;
	information = dia_torlof_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_torlof_pickpocket_condition()
{
	return c_beklauen(76,120);
};

func void dia_torlof_pickpocket_info()
{
	Info_ClearChoices(dia_torlof_pickpocket);
	Info_AddChoice(dia_torlof_pickpocket,DIALOG_BACK,dia_torlof_pickpocket_back);
	Info_AddChoice(dia_torlof_pickpocket,DIALOG_PICKPOCKET,dia_torlof_pickpocket_doit);
};

func void dia_torlof_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_torlof_pickpocket);
};

func void dia_torlof_pickpocket_back()
{
	Info_ClearChoices(dia_torlof_pickpocket);
};

