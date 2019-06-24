
func int c_npcisdown(var C_NPC slf)
{
	if(Npc_IsInState(slf,zs_unconscious) || Npc_IsInState(slf,zs_magicsleep) || Npc_IsDead(slf))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

