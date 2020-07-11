
func void b_raiseattribute(var C_NPC oth,var int attrib,var int points)
{
	var string concattext;
	if(attrib == ATR_STRENGTH)
	{
		oth.attribute[ATR_STRENGTH] += points;
		concattext = ConcatStrings(PRINT_LEARNSTR,IntToString(points));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
	if(attrib == ATR_DEXTERITY)
	{
		oth.attribute[ATR_DEXTERITY] += points;
		concattext = ConcatStrings(PRINT_LEARNDEX,IntToString(points));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
	if(attrib == ATR_MANA_MAX)
	{
		oth.attribute[ATR_MANA_MAX] += points;
		oth.attribute[ATR_MANA] += points;
		concattext = ConcatStrings(PRINT_LEARNMANA_MAX,IntToString(points));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
	if(attrib == ATR_HITPOINTS_MAX)
	{
		oth.attribute[ATR_HITPOINTS_MAX] += points;
		oth.attribute[ATR_HITPOINTS] += points;
		concattext = ConcatStrings(PRINT_LEARNHITPOINTS_MAX,IntToString(points));
		PrintScreen(concattext,-1,-1,FONT_SCREEN,2);
	};
};

