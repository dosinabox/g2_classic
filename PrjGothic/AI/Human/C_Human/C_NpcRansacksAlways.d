
func int c_npcransacksalways(var C_NPC slf)
{
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(garwig)) && (Npc_HasItems(other,holy_hammer_mis) > 0))
	{
		return TRUE;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(rod)) && (Npc_HasItems(other,itmw_2h_rod) > 0))
	{
		return TRUE;
	};
	return FALSE;
};

