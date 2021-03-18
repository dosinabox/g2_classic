
func int b_teachplayertalentsmith(var C_NPC slf,var C_NPC oth,var int waffe)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_SMITH);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTSMITH,LOG_NOTE);
	b_logentry(TOPIC_TALENTSMITH,"����� �������� ������, ������ ����� ��� ����� ����� �����. � ������ �������� ������� �� � ���� ���������� �����, � ����� ������� ����� �� ����������. ������ ������ �������� ������� ������ ����������, ��������� ������ ������ ��������.");
	if(waffe == WEAPON_COMMON)
	{
		PLAYER_TALENT_SMITH[WEAPON_COMMON] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"��� '���������� ����' ��� �� ����� ������� ������������.");
	};
	if(waffe == WEAPON_1H_SPECIAL_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"��� '�������� ������� ����' ��� ����� 1 ����� ����.");
	};
	if(waffe == WEAPON_2H_SPECIAL_01)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_01] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"��� '���������� ������� ����' ��� ����� 2 ����� ����.");
	};
	if(waffe == WEAPON_1H_SPECIAL_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"��� '����������� ������� ����' ��� ����� 2 ����� ����.");
	};
	if(waffe == WEAPON_2H_SPECIAL_02)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_02] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"��� '�������� ���������� ������� ����' ��� ����� 3 ����� ����.");
	};
	if(waffe == WEAPON_1H_SPECIAL_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"��� '������� ������� ����' ��� ����� 3 ����� ����.");
	};
	if(waffe == WEAPON_2H_SPECIAL_03)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_03] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"��� '�������� ������� ������� ����' ��� ����� 4 ����� ����.");
	};
	if(waffe == WEAPON_1H_SPECIAL_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_1H_SPECIAL_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"��� '������� ������ ��������' ��� ����� 4 ����� ���� � 5 �������� ����� �������.");
	};
	if(waffe == WEAPON_2H_SPECIAL_04)
	{
		PLAYER_TALENT_SMITH[WEAPON_2H_SPECIAL_04] = TRUE;
		b_logentry(TOPIC_TALENTSMITH,"��� '�������� ������� ������ ��������' ��� ����� 5 ����� ���� � 5 �������� ����� �������.");
	};
	PrintScreen(PRINT_LEARNSMITH,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_SMITH,1);
	return TRUE;
};

