
func int b_teachmagiccircle(var C_NPC slf,var C_NPC oth,var int circle)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_MAGE);
	if((circle < 1) || (circle > 6))
	{
		Print("*** ќЎ»Ѕ ј: неправильный параметр ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLP,-1,-1,FONT_SCREEN,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	Npc_SetTalentSkill(oth,NPC_TALENT_MAGE,circle);
	Log_CreateTopic(TOPIC_TALENTMAGICCIRCLE,LOG_NOTE);
	b_logentry(TOPIC_TALENTMAGICCIRCLE,"ћагические руны, к которым € имею доступ, подраздел€ютс€ по кругам. я не могу использовать заклинание, требующее более высокого круга, нежели изученный мной.");
	if(circle == 1)
	{
		PrintScreen(PRINT_LEARNCIRCLE_1,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"«аклинани€ 1-го круга: свет, огненна€ стрела, мала€ молни€, лечение легких ранений и вызов скелета гоблина.");
		return TRUE;
	};
	if(circle == 2)
	{
		PrintScreen(PRINT_LEARNCIRCLE_2,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"«аклинани€ 2-го круга: огненный шар, лед€на€ стрела, вызов волка, кулак ветра и сон.");
		return TRUE;
	};
	if(circle == 3)
	{
		PrintScreen(PRINT_LEARNCIRCLE_3,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"«аклинани€ 3-го круга: лечение средних ранений, шарова€ молни€, мала€ огненна€ бур€, создание скелета, страх и лед€ной блок.");
		return TRUE;
	};
	if(circle == 4)
	{
		PrintScreen(PRINT_LEARNCIRCLE_4,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"«аклинани€ 4-го круга: молни€, создание каменного голема, уничтожение нежити и большой огненный шар.");
		return TRUE;
	};
	if(circle == 5)
	{
		PrintScreen(PRINT_LEARNCIRCLE_5,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"«аклинани€ 5-го круга: больша€ огненна€ бур€, лед€на€ волна, вызов демона и лечение т€желых ранений.");
		return TRUE;
	};
	if(circle == 6)
	{
		PrintScreen(PRINT_LEARNCIRCLE_6,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"«аклинани€ 6-го круга: огненный дождь, дыхание смерти, волна смерти, арми€ тьмы и уменьшение монстра.");
		return TRUE;
	};
	return FALSE;
};

