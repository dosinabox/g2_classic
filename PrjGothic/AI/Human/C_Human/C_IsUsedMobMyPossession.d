
func int c_isusedmobmypossession(var C_NPC slf,var C_NPC oth)
{
	if(Npc_IsDetectedMobOwnedByNpc(other,self))
	{
		return TRUE;
	};
	if(c_npcisbotheredbyplayerroomguild(self) || (Wld_GetPlayerPortalGuild() == GIL_PUBLIC))
	{
		return TRUE;
	};
	return FALSE;
};

