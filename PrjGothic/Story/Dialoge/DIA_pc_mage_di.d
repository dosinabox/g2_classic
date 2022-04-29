
instance DIA_MILTEN_DI_EXIT(C_INFO)
{
	npc = pc_mage_di;
	nr = 999;
	condition = dia_milten_di_exit_condition;
	information = dia_milten_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_milten_di_exit_condition()
{
	return TRUE;
};

func void dia_milten_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MILTEN_DI_HELLO(C_INFO)
{
	npc = pc_mage_di;
	nr = 3;
	condition = dia_milten_di_hello_condition;
	information = dia_milten_di_hello_info;
	description = "����� ��� � ������ �������.";
};


func int dia_milten_di_hello_condition()
{
	if(Npc_IsDead(undeaddragon) == FALSE)
	{
		return TRUE;
	};
};

func void dia_milten_di_hello_info()
{
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_00");	//����� ��� � ������ �������.
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_01");	//�� ��� ������ ���. ��� ���� ���������, ������� �� �� ������������� �� ���� ���.
	AI_Output(other,self,"DIA_Milten_DI_Hello_15_02");	//�� � ���?
	AI_Output(self,other,"DIA_Milten_DI_Hello_03_03");	//������� �� ���� ������ ���� �������, ����� �� ���� ����� ��������� ���� ���� ��.
};


instance DIA_MILTEN_DI_TRADE(C_INFO)
{
	npc = pc_mage_di;
	nr = 12;
	condition = dia_milten_di_trade_condition;
	information = dia_milten_di_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = "���� ��������� ������ �����?";
};


func int dia_milten_di_trade_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_milten_di_hello))
	{
		return TRUE;
	};
};

func void dia_milten_di_trade_info()
{
	AI_Output(other,self,"DIA_Milten_DI_TRADE_15_00");	//���� ��������� ������ �����?
	b_givetradeinv(self);
	Npc_RemoveInvItems(self,itpo_health_02,Npc_HasItems(self,itpo_health_02));
	CreateInvItems(self,itpo_health_02,15);
	Npc_RemoveInvItems(self,itpo_mana_02,Npc_HasItems(self,itpo_mana_02));
	CreateInvItems(self,itpo_mana_02,15);
	AI_Output(self,other,"DIA_Milten_DI_TRADE_03_01");	//���� ���� �����.
};


instance DIA_MILTEN_DI_RAT(C_INFO)
{
	npc = pc_mage_di;
	nr = 3;
	condition = dia_milten_di_rat_condition;
	information = dia_milten_di_rat_info;
	description = "������ ���� ��� �����-������ �����?";
};


func int dia_milten_di_rat_condition()
{
	if(Npc_KnowsInfo(other,dia_milten_di_hello) && (Npc_IsDead(undeaddragon) == FALSE))
	{
		return TRUE;
	};
};

func void dia_milten_di_rat_info()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_15_00");	//������ ���� ��� �����-������ �����?
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_01");	//���. ��� ������� �����, ��� �� ����������� � ���� ������. �� � ���� � ������ ��� ��� ����� �������� ������ ����.
	AI_Output(self,other,"DIA_Milten_DI_Rat_03_02");	//� ���� ���� ���� ������?
	Info_ClearChoices(dia_milten_di_rat);
	if(SC_INNOSEYEVERGESSEN_DI == TRUE)
	{
		Info_AddChoice(dia_milten_di_rat,"���.",dia_milten_di_rat_nein);
	}
	else
	{
		Info_AddChoice(dia_milten_di_rat,"�������.",dia_milten_di_rat_ja);
	};
};

func void dia_milten_di_rat_nein()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_nein_15_00");	//���.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_01");	//(����������) �� �����...��� �� ������ ������, ���� �� ����������� � ��������� �����, �� �������?
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_02");	//�� ��� � �� �������? ����� � ��� ���� ���� ������������ ����, �� ����� �� �������� ������������ ����.
	AI_Output(self,other,"DIA_Milten_DI_Rat_nein_03_03");	//� �� � ��� �������? ��� �������� ������ ���������, ��� ���� ���������������������� �� ����� ������ ��� ������.
	Info_ClearChoices(dia_milten_di_rat);
};

func void dia_milten_di_rat_ja()
{
	AI_Output(other,self,"DIA_Milten_DI_Rat_ja_15_00");	//�������.
	AI_Output(self,other,"DIA_Milten_DI_Rat_ja_03_01");	//������, ��� � ����� ����� ������ ������. � ������� ���������.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_milten_di_rat);
};


instance DIA_MILTEN_DI_PEDROTOT(C_INFO)
{
	npc = pc_mage_di;
	nr = 3;
	condition = dia_milten_di_pedrotot_condition;
	information = dia_milten_di_pedrotot_info;
	description = "� ����� �����.";
};


func int dia_milten_di_pedrotot_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_di_you))
	{
		return TRUE;
	};
};

func void dia_milten_di_pedrotot_info()
{
	AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_00");	//� ����� �����.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_01");	//(���������) ���? ���? �����, �� �������? ����, �� ��� ��������� ����������.
	AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_02");	//� ������� �� ����, ��� �� ����� �������.
	b_giveplayerxp(XP_AMBIENT);
	if(Npc_IsDead(pedro_di))
	{
		AI_Output(other,self,"DIA_Milten_DI_PEDROTOT_15_03");	//�� �����.
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_04");	//��? ������. �� ��������� ��� ���� � �����. ���� � �� ���� �������, ��� ��� ���� ���, � ��� �� ��� �� �� ����� ������ ��� ������� ��������.
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_PEDROTOT_03_05");	//� ���� � ��� ������ �����.
	};
};


instance DIA_MILTEN_DI_TEACHMAGIC(C_INFO)
{
	npc = pc_mage_di;
	nr = 31;
	condition = dia_milten_di_teachmagic_condition;
	information = dia_milten_di_teachmagic_info;
	permanent = TRUE;
	description = "� ���� �������� ���� ���������� �����������.";
};


func int dia_milten_di_teachmagic_condition()
{
	if((Npc_IsDead(undeaddragon) == FALSE) && Npc_KnowsInfo(other,dia_milten_di_hello))
	{
		return TRUE;
	};
};


var int dia_milten_di_teachmagic_onetime;

func void dia_milten_di_teachmagic_info()
{
	AI_Output(other,self,"DIA_Milten_DI_TeachMagic_15_00");	//� ���� �������� ���� ���������� �����������.
	if(ORKSTURMDI == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_01");	//� ������ ���, ��� �����.
	}
	else if(DIA_MILTEN_DI_TEACHMAGIC_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_02");	//� ������ ����, �� ������ ��� �������, ��� �� ������������, ����� ���� ���������� ���, ��� ��� ���� ������.
		DIA_MILTEN_DI_TEACHMAGIC_ONETIME = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_03_03");	//������. ��� �� ������?
	};
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_milten_di_teachmagic_mana_1);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_milten_di_teachmagic_mana_5);
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		Info_AddChoice(dia_milten_di_teachmagic,"�������� ���",dia_milten_di_teachmagic_runes);
	};
};

func void dia_milten_di_teachmagic_mana_1()
{
	if(b_teachattributepoints(self,other,ATR_MANA_MAX,1,200))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_1_03_00");	//�� ����� ���� ���� ������.
	};
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_milten_di_teachmagic_mana_1);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_milten_di_teachmagic_mana_5);
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		Info_AddChoice(dia_milten_di_teachmagic,"�������� ���",dia_milten_di_teachmagic_runes);
	};
};

func void dia_milten_di_teachmagic_mana_5()
{
	if(b_teachattributepoints(self,other,ATR_MANA_MAX,5,200))
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_MANA_5_03_00");	//�� ������� ����� ���� ����.
	};
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_milten_di_teachmagic_mana_1);
	Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_milten_di_teachmagic_mana_5);
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_PAL))
	{
		Info_AddChoice(dia_milten_di_teachmagic,"�������� ���",dia_milten_di_teachmagic_runes);
	};
};

func void dia_milten_di_teachmagic_runes()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_00");	//��, ���! � �� ������� ���������� � ����, �� �� ���-������ ���������.
	if(hero.guild == GIL_PAL)
	{
		Info_AddChoice(dia_milten_di_teachmagic,"���� ���������",dia_milten_di_teachmagic_runen_paladin);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4)
	{
		Info_AddChoice(dia_milten_di_teachmagic," ��������� ����",dia_milten_di_teachmagic_runen_circle_4);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5)
	{
		Info_AddChoice(dia_milten_di_teachmagic," ����� ����",dia_milten_di_teachmagic_runen_circle_5);
	}
	else if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6)
	{
		Info_AddChoice(dia_milten_di_teachmagic," ������ ����",dia_milten_di_teachmagic_runen_circle_6);
	}
	else
	{
		AI_Output(self,other,"DIA_Milten_DI_TeachMagic_RUNES_03_01");	//��. �� ��� �� ������ �����. ������� �� ������ ������� ������ �����, � ����� � ����� ������ ����.
	};
};

func void dia_milten_di_teachmagic_runen_paladin()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHT] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALLIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_paladin_spl_pallight);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALLIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_paladin_spl_pallightheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALHOLYBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_paladin_spl_palholybolt);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALMEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_paladin_spl_palmediumheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALREPELEVIL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_paladin_spl_palrepelevil);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALFULLHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALFULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_paladin_spl_palfullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PALDESTROYEVIL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PALDESTROYEVIL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_paladin_spl_paldestroyevil);
	};
};

func void dia_milten_di_teachmagic_runen_paladin_spl_pallight()
{
	b_teachplayerpalrunes(self,other,SPL_PALLIGHT,b_getlearncosttalent(other,NPC_TALENT_RUNES));
};

func void dia_milten_di_teachmagic_runen_paladin_spl_pallightheal()
{
	b_teachplayerpalrunes(self,other,SPL_PALLIGHTHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES));
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palholybolt()
{
	b_teachplayerpalrunes(self,other,SPL_PALHOLYBOLT,b_getlearncosttalent(other,NPC_TALENT_RUNES));
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palmediumheal()
{
	b_teachplayerpalrunes(self,other,SPL_PALMEDIUMHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES));
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palrepelevil()
{
	b_teachplayerpalrunes(self,other,SPL_PALREPELEVIL,b_getlearncosttalent(other,NPC_TALENT_RUNES));
};

func void dia_milten_di_teachmagic_runen_paladin_spl_palfullheal()
{
	b_teachplayerpalrunes(self,other,SPL_PALFULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES));
};

func void dia_milten_di_teachmagic_runen_paladin_spl_paldestroyevil()
{
	b_teachplayerpalrunes(self,other,SPL_PALDESTROYEVIL,b_getlearncosttalent(other,NPC_TALENT_RUNES));
};

func void dia_milten_di_teachmagic_runen_circle_4()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_SUMMONGOLEM,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_circle_4_spl_summongolem);
	};
	if(PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_DESTROYUNDEAD,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_circle_4_spl_destroyundead);
	};
	if(PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_LIGHTNINGFLASH,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_circle_4_spl_lightningflash);
	};
	if(PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_CHARGEFIREBALL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_circle_4_spl_chargefireball);
	};
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_chargefireball()
{
	b_teachplayertalentrunes(self,other,SPL_CHARGEFIREBALL);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_summongolem()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONGOLEM);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_destroyundead()
{
	b_teachplayertalentrunes(self,other,SPL_DESTROYUNDEAD);
};

func void dia_milten_di_teachmagic_runen_circle_4_spl_lightningflash()
{
	b_teachplayertalentrunes(self,other,SPL_LIGHTNINGFLASH);
};

func void dia_milten_di_teachmagic_runen_circle_5()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_ICEWAVE] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_ICEWAVE,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_circle_5_spl_icewave);
	};
	if(PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_SUMMONDEMON,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_circle_5_spl_summondemon);
	};
	if(PLAYER_TALENT_RUNES[SPL_FULLHEAL] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_FULLHEAL,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_circle_5_spl_fullheal);
	};
	if(PLAYER_TALENT_RUNES[SPL_PYROKINESIS] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_PYROKINESIS,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_circle_5_spl_pyrokinesis);
	};
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_pyrokinesis()
{
	b_teachplayertalentrunes(self,other,SPL_PYROKINESIS);
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_icewave()
{
	b_teachplayertalentrunes(self,other,SPL_ICEWAVE);
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_summondemon()
{
	b_teachplayertalentrunes(self,other,SPL_SUMMONDEMON);
};

func void dia_milten_di_teachmagic_runen_circle_5_spl_fullheal()
{
	b_teachplayertalentrunes(self,other,SPL_FULLHEAL);
};

func void dia_milten_di_teachmagic_runen_circle_6()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
	Info_AddChoice(dia_milten_di_teachmagic,DIALOG_BACK,dia_milten_di_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_circle_6_spl_firerain);
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_circle_6_spl_breathofdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_circle_6_spl_massdeath);
	};
	if(PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_ARMYOFDARKNESS,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_circle_6_spl_armyofdarkness);
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(dia_milten_di_teachmagic,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_milten_di_teachmagic_runen_circle_6_spl_shrink);
	};
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_armyofdarkness()
{
	b_teachplayertalentrunes(self,other,SPL_ARMYOFDARKNESS);
};

func void dia_milten_di_teachmagic_runen_circle_6_spl_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};

func void dia_milten_di_teachmagic_back()
{
	Info_ClearChoices(dia_milten_di_teachmagic);
};


instance DIA_MILTEN_DI_DEMENTOROBSESSIONBOOK(C_INFO)
{
	npc = pc_mage_di;
	nr = 99;
	condition = dia_milten_di_dementorobsessionbook_condition;
	information = dia_milten_di_dementorobsessionbook_info;
	description = "��� �����, �������� ���������, ������� ���� � ���-��?";
};


func int dia_milten_di_dementorobsessionbook_condition()
{
	if(Npc_HasItems(other,itwr_dementorobsessionbook_mis))
	{
		return TRUE;
	};
};

func void dia_milten_di_dementorobsessionbook_info()
{
	AI_Output(other,self,"DIA_Milten_DI_DementorObsessionBook_15_00");	//��� �����, �������� ���������, ������� ���� � ���-��?
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_01");	//������� ������� �� ����� ������.
	AI_Output(self,other,"DIA_Milten_DI_DementorObsessionBook_03_02");	//������. � ���� ������� ����, ����� ������� ���-���� ����� �� ����.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_MILTEN_DI_DRAGONEGG(C_INFO)
{
	npc = pc_mage_di;
	nr = 99;
	condition = dia_milten_di_dragonegg_condition;
	information = dia_milten_di_dragonegg_info;
	description = "�� ���� ���� � ���������� ������?";
};


func int dia_milten_di_dragonegg_condition()
{
	if(Npc_HasItems(other,itat_dragonegg_mis))
	{
		return TRUE;
	};
};

func void dia_milten_di_dragonegg_info()
{
	AI_Output(other,self,"DIA_Milten_DI_DragonEgg_15_00");	//�� ���� ���� � ���������� ������?
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_01");	//���, �� ������. � ������, ��� �������� ������� ���-�� ���� ������� ����� �� ���.
	AI_Output(self,other,"DIA_Milten_DI_DragonEgg_03_02");	//��, ����������, �� ��������� ���� � �������. � ������� �� ����, ��� ��� ���������.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_MILTEN_DI_UNDEADDRAGONDEAD(C_INFO)
{
	npc = pc_mage_di;
	nr = 31;
	condition = dia_milten_di_undeaddragondead_condition;
	information = dia_milten_di_undeaddragondead_info;
	permanent = TRUE;
	description = "������. ���� �������! ���� ������ ����� ����� ����.";
};


func int dia_milten_di_undeaddragondead_condition()
{
	if(Npc_IsDead(undeaddragon))
	{
		return TRUE;
	};
};


var int dia_milten_di_undeaddragondead_onetime;

func void dia_milten_di_undeaddragondead_info()
{
	AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_00");	//������. ���� �������! ���� ������ ����� ����� ����.
	if(DIA_MILTEN_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_01");	//��� ���� ������ ������� �������� ����� �� ����?
		AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_02");	//���� ���� ������, ���� � ����.
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_03");	//(�������) ��, �����-������ ������ ������ ��������? ��, �����������, ��������� ���.
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_04");	//��� �� ����������� ������ ������?
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_05");	//� ����� �� ��������� ����������� ��������, ����� ������������� ���� ����. �� �� ����� ����� ������ �� ����������.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_06");	//� ������� �� ����� � ���, ��� ���� ����� ����. � ��� ���� ���?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_07");	//� ���� �� ����.
			AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_08");	//(�������) ����, ��� ������. ��, ������. �� ������ ��� ���� ���. ����� ��� ������������� ������� ��� �������?
			AI_Output(other,self,"DIA_Milten_DI_UndeadDragonDead_15_09");	//���. ����� ����.
		};
		AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_10");	//�� �����, �������, � �����, ��� �������, ��� ���� ������ �����, - ������� �������.
	};
	AI_Output(self,other,"DIA_Milten_DI_UndeadDragonDead_03_11");	//���� ����� ����� � �������� � ������� ���, ����� �� �������� �����.
	AI_StopProcessInfos(self);
	if(DIA_MILTEN_DI_UNDEADDRAGONDEAD_ONETIME == FALSE)
	{
		if(LESTER_ISONBOARD != LOG_SUCCESS)
		{
			Npc_ExchangeRoutine(self,"SittingShipDI");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	};
	DIA_MILTEN_DI_UNDEADDRAGONDEAD_ONETIME = TRUE;
};


instance DIA_MAGE_DI_PICKPOCKET(C_INFO)
{
	npc = pc_mage_di;
	nr = 900;
	condition = dia_mage_di_pickpocket_condition;
	information = dia_mage_di_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_mage_di_pickpocket_condition()
{
	return c_beklauen(45,120);
};

func void dia_mage_di_pickpocket_info()
{
	Info_ClearChoices(dia_mage_di_pickpocket);
	Info_AddChoice(dia_mage_di_pickpocket,DIALOG_BACK,dia_mage_di_pickpocket_back);
	Info_AddChoice(dia_mage_di_pickpocket,DIALOG_PICKPOCKET,dia_mage_di_pickpocket_doit);
};

func void dia_mage_di_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_mage_di_pickpocket);
};

func void dia_mage_di_pickpocket_back()
{
	Info_ClearChoices(dia_mage_di_pickpocket);
};

