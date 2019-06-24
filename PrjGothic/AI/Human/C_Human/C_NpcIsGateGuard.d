
func int c_npcisgateguard(var C_NPC slf)
{
	if(Npc_IsInState(slf,zs_guard_passage))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

