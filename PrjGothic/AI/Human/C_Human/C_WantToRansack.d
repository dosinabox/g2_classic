
func int c_wanttoransack(var C_NPC slf)
{
	if((slf.npctype == NPCTYPE_FRIEND) && Npc_IsPlayer(other))
	{
		return FALSE;
	};
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_ORC) || (slf.guild == GIL_PAL) || (slf.guild == GIL_KDF) || (slf.guild == GIL_NOV))
	{
		return FALSE;
	};
	return TRUE;
};

