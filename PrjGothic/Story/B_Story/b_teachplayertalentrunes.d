
func int b_teachplayertalentrunes(var C_NPC slf,var C_NPC oth,var int spell)
{
	var int kosten;
	var C_NPC scrolltrader;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_RUNES);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTRUNES,LOG_NOTE);
	b_logentry(TOPIC_TALENTRUNES,"����� ������� ����, ��� ����� ������ � ����������� � ������������ �����������. ��� ������ ���� ������������ � ������� ������� ����� � ���� ������� ���� �� ������ �����.");
	if(Npc_IsDead(gorax) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(gorax);
	}
	else if(Npc_IsDead(isgaroth) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(isgaroth);
	}
	else if(Npc_IsDead(engor) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(engor);
	}
	else if(Npc_IsDead(orlan) == FALSE)
	{
		scrolltrader = Hlp_GetNpc(orlan);
	};
	if(spell == SPL_LIGHT)
	{
		PLAYER_TALENT_RUNES[SPL_LIGHT] = TRUE;
		CreateInvItems(scrolltrader,itsc_light,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '����': 1 ������� ������.");
	};
	if(spell == SPL_FIREBOLT)
	{
		PLAYER_TALENT_RUNES[SPL_FIREBOLT] = TRUE;
		CreateInvItems(scrolltrader,itsc_firebolt,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '�������� ������': 1 ����.");
	};
	if(spell == SPL_ICEBOLT)
	{
		PLAYER_TALENT_RUNES[SPL_ICEBOLT] = TRUE;
		CreateInvItems(scrolltrader,itsc_icebolt,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '������� ������': 1 ������� �����.");
	};
	if(spell == SPL_LIGHTHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_LIGHTHEAL] = TRUE;
		CreateInvItems(scrolltrader,itsc_lightheal,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '������� ������ �������': 1 �������� �����.");
	};
	if(spell == SPL_SUMMONGOBLINSKELETON)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONGOBLINSKELETON] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumgobskel,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '����� ������� �������': 1 ����� �������.");
	};
	if(spell == SPL_INSTANTFIREBALL)
	{
		PLAYER_TALENT_RUNES[SPL_INSTANTFIREBALL] = TRUE;
		CreateInvItems(scrolltrader,itsc_instantfireball,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '�������� ���': 1 �����.");
	};
	if(spell == SPL_ZAP)
	{
		PLAYER_TALENT_RUNES[SPL_ZAP] = TRUE;
		CreateInvItems(scrolltrader,itsc_zap,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '����� ������': 1 ������ ��������.");
	};
	if(spell == SPL_SUMMONWOLF)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONWOLF] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumwolf,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '����� �����': 1 ����� �����.");
	};
	if(spell == SPL_WINDFIST)
	{
		PLAYER_TALENT_RUNES[SPL_WINDFIST] = TRUE;
		CreateInvItems(scrolltrader,itsc_windfist,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '����� �����': 1 �����.");
	};
	if(spell == SPL_SLEEP)
	{
		PLAYER_TALENT_RUNES[SPL_SLEEP] = TRUE;
		CreateInvItems(scrolltrader,itsc_sleep,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '���': 1 �������� �����.");
	};
	if(spell == SPL_MEDIUMHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_MEDIUMHEAL] = TRUE;
		CreateInvItems(scrolltrader,itsc_mediumheal,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '������� ������� �������': 1 �������� ��������.");
	};
	if(spell == SPL_LIGHTNINGFLASH)
	{
		PLAYER_TALENT_RUNES[SPL_LIGHTNINGFLASH] = TRUE;
		CreateInvItems(scrolltrader,itsc_lightningflash,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '������': 1 ������ �������� � 1 ������� �����.");
	};
	if(spell == SPL_CHARGEFIREBALL)
	{
		PLAYER_TALENT_RUNES[SPL_CHARGEFIREBALL] = TRUE;
		CreateInvItems(scrolltrader,itsc_chargefireball,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '������� �������� ���': 1 ���� � 1 �����.");
	};
	if(spell == SPL_SUMMONSKELETON)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONSKELETON] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumskel,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '�������� �������': 1 ����� �������.");
	};
	if(spell == SPL_FEAR)
	{
		PLAYER_TALENT_RUNES[SPL_FEAR] = TRUE;
		CreateInvItems(scrolltrader,itsc_fear,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '�����': 1 ������ ���������.");
	};
	if(spell == SPL_ICECUBE)
	{
		PLAYER_TALENT_RUNES[SPL_ICECUBE] = TRUE;
		CreateInvItems(scrolltrader,itsc_icecube,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '������� ����': 1 ������� ����� � 1 ���������.");
	};
	if(spell == SPL_CHARGEZAP)
	{
		PLAYER_TALENT_RUNES[SPL_CHARGEZAP] = TRUE;
		CreateInvItems(scrolltrader,itsc_thunderball,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '������� ������': 1 ���� � 1 ������ ��������.");
	};
	if(spell == SPL_SUMMONGOLEM)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONGOLEM] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumgol,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '����� ������': 1 ������ ��������� ������.");
	};
	if(spell == SPL_DESTROYUNDEAD)
	{
		PLAYER_TALENT_RUNES[SPL_DESTROYUNDEAD] = TRUE;
		CreateInvItems(scrolltrader,itsc_harmundead,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '����������� ������': 1 ������ ����.");
	};
	if(spell == SPL_PYROKINESIS)
	{
		PLAYER_TALENT_RUNES[SPL_PYROKINESIS] = TRUE;
		CreateInvItems(scrolltrader,itsc_pyrokinesis,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '������� �������� ����': 1 ���� � 1 ���� ��������� �����.");
	};
	if(spell == SPL_FIRESTORM)
	{
		PLAYER_TALENT_RUNES[SPL_FIRESTORM] = TRUE;
		CreateInvItems(scrolltrader,itsc_firestorm,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '����� �������� ����': 1 ���� � 1 �����.");
	};
	if(spell == SPL_ICEWAVE)
	{
		PLAYER_TALENT_RUNES[SPL_ICEWAVE] = TRUE;
		CreateInvItems(scrolltrader,itsc_icewave,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '������� �����': 1 ������� ����� � 1 ���������.");
	};
	if(spell == SPL_SUMMONDEMON)
	{
		PLAYER_TALENT_RUNES[SPL_SUMMONDEMON] = TRUE;
		CreateInvItems(scrolltrader,itsc_sumdemon,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '����� ������': 1 ������ ������.");
	};
	if(spell == SPL_FULLHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_FULLHEAL] = TRUE;
		CreateInvItems(scrolltrader,itsc_fullheal,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '������� ������� �������': 1 �������� ������.");
	};
	if(spell == SPL_FIRERAIN)
	{
		PLAYER_TALENT_RUNES[SPL_FIRERAIN] = TRUE;
		CreateInvItems(scrolltrader,itsc_firerain,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '�������� �����': 1 �����, 1 ���� � 1 ���� ��������� �����.");
	};
	if(spell == SPL_BREATHOFDEATH)
	{
		PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] = TRUE;
		CreateInvItems(scrolltrader,itsc_breathofdeath,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '������� ������': 1 ����� � 1 ������ ���������.");
	};
	if(spell == SPL_MASSDEATH)
	{
		PLAYER_TALENT_RUNES[SPL_MASSDEATH] = TRUE;
		CreateInvItems(scrolltrader,itsc_massdeath,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '����� ������': 1 ����� ������� � 1 ������ ���������.");
	};
	if(spell == SPL_ARMYOFDARKNESS)
	{
		PLAYER_TALENT_RUNES[SPL_ARMYOFDARKNESS] = TRUE;
		CreateInvItems(scrolltrader,itsc_armyofdarkness,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '����� ����': 1 ����� �������, 1 ������ ���������, 1 ������ ��������� ������ � 1 ������ ������.");
	};
	if(spell == SPL_SHRINK)
	{
		PLAYER_TALENT_RUNES[SPL_SHRINK] = TRUE;
		CreateInvItems(scrolltrader,itsc_shrink,1);
		b_logentry(TOPIC_TALENTRUNES,"����������� ��� ���� '���������� �������': 1 ����� ������� � 1 ���� ������.");
	};
	PrintScreen(PRINT_LEARNRUNES,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_RUNES,1);
	return TRUE;
};

func int b_teachplayerpalrunes(var C_NPC slf,var C_NPC oth,var int spell,var int kosten)
{
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	if(spell == SPL_PALLIGHT)
	{
		PLAYER_TALENT_RUNES[SPL_PALLIGHT] = TRUE;
		CreateInvItems(slf,itru_pallight,1);
		b_giveinvitems(slf,oth,itru_pallight,1);
	};
	if(spell == SPL_PALLIGHTHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_PALLIGHTHEAL] = TRUE;
		CreateInvItems(slf,itru_pallightheal,1);
		b_giveinvitems(slf,oth,itru_pallightheal,1);
	};
	if(spell == SPL_PALHOLYBOLT)
	{
		PLAYER_TALENT_RUNES[SPL_PALHOLYBOLT] = TRUE;
		CreateInvItems(slf,itru_palholybolt,1);
		b_giveinvitems(slf,oth,itru_palholybolt,1);
	};
	if(spell == SPL_PALMEDIUMHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_PALMEDIUMHEAL] = TRUE;
		CreateInvItems(slf,itru_palmediumheal,1);
		b_giveinvitems(slf,oth,itru_palmediumheal,1);
	};
	if(spell == SPL_PALREPELEVIL)
	{
		PLAYER_TALENT_RUNES[SPL_PALREPELEVIL] = TRUE;
		CreateInvItems(slf,itru_palrepelevil,1);
		b_giveinvitems(slf,oth,itru_palrepelevil,1);
	};
	if(spell == SPL_PALFULLHEAL)
	{
		PLAYER_TALENT_RUNES[SPL_PALFULLHEAL] = TRUE;
		CreateInvItems(slf,itru_palfullheal,1);
		b_giveinvitems(slf,oth,itru_palfullheal,1);
	};
	if(spell == SPL_PALDESTROYEVIL)
	{
		PLAYER_TALENT_RUNES[SPL_PALDESTROYEVIL] = TRUE;
		CreateInvItems(slf,itru_paldestroyevil,1);
		b_giveinvitems(slf,oth,itru_paldestroyevil,1);
	};
	return TRUE;
};

