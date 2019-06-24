
func int c_npcishero(var C_NPC slf)
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(her))
	{
		return TRUE;
	};
	return FALSE;
};

