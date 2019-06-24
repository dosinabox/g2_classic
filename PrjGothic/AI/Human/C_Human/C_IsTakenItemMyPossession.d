
func int c_istakenitemmypossession(var C_NPC slf,var C_NPC oth,var C_ITEM itm)
{
	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();
	if(Npc_OwnedByNpc(itm,slf))
	{
		if(Hlp_IsItem(itm,holy_hammer_mis))
		{
			HAMMER_TAKEN = TRUE;
		};
		return TRUE;
	};
	if((itm.flags & ITEM_DROPPED) == ITEM_DROPPED)
	{
		return FALSE;
	};
	if(c_npcisbotheredbyplayerroomguild(self) || (Wld_GetPlayerPortalGuild() == GIL_PUBLIC))
	{
		return TRUE;
	};
	if(Wld_GetGuildAttitude(slf.guild,itm.ownerguild) == ATT_FRIENDLY)
	{
		return TRUE;
	};
	return FALSE;
};

