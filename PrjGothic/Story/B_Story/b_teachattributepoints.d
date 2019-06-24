
func int b_teachattributepoints(var C_NPC slf,var C_NPC oth,var int attrib,var int points,var int teachermax)
{
	var string concattext;
	var int kosten;
	var int realattribute;
	kosten = b_getlearncostattribute(oth,attrib) * points;
	if((attrib != ATR_STRENGTH) && (attrib != ATR_DEXTERITY) && (attrib != ATR_MANA_MAX))
	{
		Print("*** ERROR: Wrong Parameter ***");
		return FALSE;
	};
	if(attrib == ATR_STRENGTH)
	{
		realattribute = oth.attribute[ATR_STRENGTH];
	}
	else if(attrib == ATR_DEXTERITY)
	{
		realattribute = oth.attribute[ATR_DEXTERITY];
	}
	else if(attrib == ATR_MANA_MAX)
	{
		realattribute = oth.attribute[ATR_MANA_MAX];
	};
	if(realattribute >= teachermax)
	{
		concattext = ConcatStrings(PRINT_NOLEARNOVERPERSONALMAX,IntToString(teachermax));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
		b_say(slf,oth,"$NOLEARNYOUREBETTER");
		return FALSE;
	};
	if((realattribute + points) > teachermax)
	{
		concattext = ConcatStrings(PRINT_NOLEARNOVERPERSONALMAX,IntToString(teachermax));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
		b_say(slf,oth,"$NOLEARNOVERPERSONALMAX");
		return FALSE;
	};
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NOTENOUGHLP,-1,-1,FONT_SCREEN,2);
		b_say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	oth.lp = oth.lp - kosten;
	b_raiseattribute(oth,attrib,points);
	return TRUE;
};

