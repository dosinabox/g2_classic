
func int b_teachthieftalent(var C_NPC slf,var C_NPC oth,var int talent)
{
	var int kosten;
	kosten = b_getlearncosttalent(oth,talent);
	if((talent != NPC_TALENT_PICKLOCK) && (talent != NPC_TALENT_SNEAK) && (talent != NPC_TALENT_ACROBAT) && (talent != NPC_TALENT_PICKPOCKET))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLEARNPOINTS,-1,-1,FONT_SCREENSMALL,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	if(talent == NPC_TALENT_PICKLOCK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKLOCK,1);
		PrintScreen(PRINT_LEARNPICKLOCK,-1,-1,FONT_SCREEN,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_SNEAK)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_SNEAK,1);
		PrintScreen(PRINT_LEARNSNEAK,-1,-1,FONT_SCREEN,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_ACROBAT)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ACROBAT,1);
		PrintScreen(PRINT_LEARNACROBAT,-1,-1,FONT_SCREEN,2);
		return TRUE;
	};
	if(talent == NPC_TALENT_PICKPOCKET)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_PICKPOCKET,1);
		PrintScreen(PRINT_LEARNPICKPOCKET,-1,-1,FONT_SCREEN,2);
		return TRUE;
	};
};

