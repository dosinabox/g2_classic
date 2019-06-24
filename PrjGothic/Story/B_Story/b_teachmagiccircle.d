
func int b_teachmagiccircle(var C_NPC slf,var C_NPC oth,var int circle)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,NPC_TALENT_MAGE);
	if((circle < 1) || (circle > 6))
	{
		Print("*** ERROR: Wrong Parameter ***");
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
	b_logentry(TOPIC_TALENTMAGICCIRCLE,"Магические руны, к которым я имею доступ, подразделяются по кругам. Я не могу использовать заклинание, требующее более высокого круга, нежели изученный мной.");
	if(circle == 1)
	{
		PrintScreen(PRINT_LEARNCIRCLE_1,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Заклинания 1-го круга: свет, огненная стрела, малая молния, лечение легких ранений и вызов скелета гоблина.");
		return TRUE;
	};
	if(circle == 2)
	{
		PrintScreen(PRINT_LEARNCIRCLE_2,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Заклинания 2-го круга: огненный шар, ледяная стрела, вызов волка, кулак ветра и сон.");
		return TRUE;
	};
	if(circle == 3)
	{
		PrintScreen(PRINT_LEARNCIRCLE_3,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Заклинания 3-го круга: лечение средних ранений, шаровая молния, малая огненная буря, создание скелета, страх и ледяной блок.");
		return TRUE;
	};
	if(circle == 4)
	{
		PrintScreen(PRINT_LEARNCIRCLE_4,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Заклинания 4-го круга: молния, создание каменного голема, уничтожение нежити и большой огненный шар.");
		return TRUE;
	};
	if(circle == 5)
	{
		PrintScreen(PRINT_LEARNCIRCLE_5,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Заклинания 5-го круга: большая огненная буря, ледяная волна, вызов демона и лечение тяжелых ранений.");
		return TRUE;
	};
	if(circle == 6)
	{
		PrintScreen(PRINT_LEARNCIRCLE_6,-1,-1,FONT_SCREEN,2);
		b_logentry(TOPIC_TALENTMAGICCIRCLE,"Заклинания 6-го круга: огненный дождь, дыхание смерти, волна смерти, армия тьмы и сморщивание монстра.");
		return TRUE;
	};
};

