
func int b_giveinvitems(var C_NPC giver,var C_NPC taker,var int iteminstance,var int amount)
{
	var string concattext;
	var string itemname;
	if(Npc_IsPlayer(giver))
	{
		if(amount > Npc_HasItems(giver,iteminstance))
		{
			return FALSE;
		};
	};
	if(amount == 0)
	{
		return TRUE;
	};
	Npc_RemoveInvItems(giver,iteminstance,amount);
	CreateInvItems(taker,iteminstance,amount);
//	itemname = item.name;
	itemname = item.description;
	if(Npc_IsPlayer(giver))
	{
		if(iteminstance == itmi_gold)
		{
			concattext = ConcatStrings(IntToString(amount),PRINT_GOLDGEGEBEN);
			AI_PrintScreen(concattext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,2);
		}
		else if(amount == 1)
		{
			concatText = ConcatStrings(itemname,PRINT_ITEMGEGEBEN);
			AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsGegeben);
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,itemname);
			concatText = ConcatStrings(concatText,")");
			AI_PrintScreen(concatText,-1,YPOS_ItemGiven,FONT_ScreenSmall,2);
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
			concatText = ConcatStrings(itemname,PRINT_ITEMERHALTEN);
			AI_PrintScreen(concatText,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		}
		else
		{
			concatText = ConcatStrings(IntToString(amount),PRINT_ItemsErhalten);
			concatText = ConcatStrings(concatText," (");
			concatText = ConcatStrings(concatText,itemname);
			concatText = ConcatStrings(concatText,")");
			AI_PrintScreen(concatText,-1,YPOS_ItemTaken,FONT_ScreenSmall,2);
		};
	};
	return TRUE;
};

