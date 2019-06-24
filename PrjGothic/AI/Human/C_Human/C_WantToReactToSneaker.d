
func int c_wanttoreacttosneaker(var C_NPC slf,var C_NPC oth)
{
	if(Npc_GetDistToNpc(slf,oth) > 700)
	{
		return FALSE;
	};
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_STRF) || (slf.guild == GIL_BDT))
	{
		return FALSE;
	};
	if((slf.npctype == NPCTYPE_FRIEND) && Npc_IsPlayer(oth))
	{
		return FALSE;
	};
	if(Npc_GetAttitude(slf,oth) == ATT_FRIENDLY)
	{
		return FALSE;
	};
	if(c_npcisgateguard(self))
	{
		return FALSE;
	};
	return TRUE;
};

