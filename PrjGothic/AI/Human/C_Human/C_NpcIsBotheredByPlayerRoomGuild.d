
func int c_npcisbotheredbyplayerroomguild(var C_NPC slf)
{
	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();
	if((portalguild > GIL_NONE) && ((slf.guild == portalguild) || (Wld_GetGuildAttitude(slf.guild,portalguild) == ATT_FRIENDLY)))
	{
		return TRUE;
	};
	return FALSE;
};

