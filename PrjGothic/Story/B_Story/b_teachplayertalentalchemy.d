
func int b_teachplayertalentalchemy(var C_NPC slf,var C_NPC oth,var int potion)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_ALCHEMY);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTALCHEMY,LOG_NOTE);
	b_logentry(TOPIC_TALENTALCHEMY,"„тобы сварить зелье, мне нужна пуста€ мензурка и необходимые дл€ этого зель€ ингредиенты. »з этих ингредиентов, € могу приготовить зелье на столе алхимика.");
	if(potion == POTION_HEALTH_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_01] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"»нгредиенты дл€ 'Ћ≈„≈ЅЌќ… Ё——≈Ќ÷»»': 2 лечебные травы и 1 луговой горец.");
	};
	if(potion == POTION_HEALTH_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_02] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"»нгредиенты дл€ 'Ћ≈„≈ЅЌќ√ќ Ё —“–ј “ј': 2 лечебных растени€ и 1 луговой горец.");
	};
	if(potion == POTION_HEALTH_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_HEALTH_03] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"»нгредиенты дл€ 'Ћ≈„≈ЅЌќ√ќ ЁЋ» —»–ј': 2 лечебных корн€ и 1 луговой горец.");
	};
	if(potion == POTION_MANA_01)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_01] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"»нгредиенты дл€ 'Ё——≈Ќ÷»» ћјЌџ': 2 огненных крапивы и 1 луговой горец.");
	};
	if(potion == POTION_MANA_02)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_02] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"»нгредиенты дл€ 'Ё —“–ј “ј ћјЌџ': 2 огненных травы и 1 луговой горец.");
	};
	if(potion == POTION_MANA_03)
	{
		PLAYER_TALENT_ALCHEMY[POTION_MANA_03] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"»нгредиенты дл€ 'ЁЋ» —»–ј ћјЌџ': 2 огненных корн€ и 1 луговой горец");
	};
	if(potion == POTION_SPEED)
	{
		PLAYER_TALENT_ALCHEMY[POTION_SPEED] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"»нгредиенты дл€ '«≈Ћ№я ”— ќ–≈Ќ»я': 1 снеппер-трава и 1 луговой горец");
	};
	if(potion == POTION_PERM_STR)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_STR] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"»нгредиенты дл€ 'ЁЋ» —»–ј —»Ћџ': 1 драконий корень и 1 царский щавель.");
	};
	if(potion == POTION_PERM_DEX)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_DEX] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"»нгредиенты дл€ 'ЁЋ» —»–ј Ћќ¬ ќ—“»': 1 гоблинска€ €года и 1 царский щавель.");
	};
	if(potion == POTION_PERM_MANA)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_MANA] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"»нгредиенты дл€ 'ЁЋ» —»–ј ƒ”’ј': 1 огненный корень и 1 царский щавель.");
	};
	if(potion == POTION_PERM_HEALTH)
	{
		PLAYER_TALENT_ALCHEMY[POTION_PERM_HEALTH] = TRUE;
		b_logentry(TOPIC_TALENTALCHEMY,"»нгредиенты дл€ 'ЁЋ» —»–ј ∆»«Ќ»': 1 лечебный корень и 1 царский щавель.");
	};
	PrintScreen(PRINT_LEARNALCHEMY,-1,-1,FONT_SCREEN,2);
	Npc_SetTalentSkill(oth,NPC_TALENT_ALCHEMY,1);
	return TRUE;
};

