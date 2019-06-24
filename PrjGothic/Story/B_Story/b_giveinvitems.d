
func int b_giveinvitems(var C_NPC giver,var C_NPC taker,var int iteminstance,var int amount)
{
	var string concattext;
	if(Npc_IsPlayer(giver))
	{
		if(amount > Npc_HasItems(giver,iteminstance))
		{
			return FALSE;
		};
	};
	Npc_RemoveInvItems(giver,iteminstance,amount);
	CreateInvItems(taker,iteminstance,amount);
	if(Npc_IsPlayer(giver))
	{
		if(iteminstance == itmi_gold)
		{
			concattext = ConcatStrings(IntToString(amount),PRINT_GOLDGEGEBEN);
			AI_PrintScreen(concattext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
		}
		else if(amount == 1)
		{
			AI_PrintScreen(PRINT_ITEMGEGEBEN,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		}
		else
		{
			concattext = ConcatStrings(IntToString(amount),PRINT_ITEMSGEGEBEN);
			AI_PrintScreen(concattext,-1,YPOS_ITEMGIVEN,FONT_SCREENSMALL,2);
		};
	}
	else if(Npc_IsPlayer(taker))
	{
		if(iteminstance == itmi_gold)
		{
			concattext = ConcatStrings(IntToString(amount),PRINT_GOLDERHALTEN);
			AI_PrintScreen(concattext,-1,YPOS_GOLDTAKEN,FONT_SCREENSMALL,2);
		}
		else if(amount == 1)
		{
			AI_PrintScreen(PRINT_ITEMERHALTEN,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
		}
		else
		{
			concattext = ConcatStrings(IntToString(amount),PRINT_ITEMSERHALTEN);
			AI_PrintScreen(concattext,-1,YPOS_ITEMTAKEN,FONT_SCREENSMALL,2);
		};
	};
	return TRUE;
};

