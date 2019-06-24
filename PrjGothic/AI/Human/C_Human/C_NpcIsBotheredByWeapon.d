
func int c_npcisbotheredbyweapon(var C_NPC slf,var C_NPC oth)
{
	if(slf.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return FALSE;
	};
	if((slf.npctype == NPCTYPE_FRIEND) && Npc_IsPlayer(other))
	{
		return FALSE;
	};
	if(c_npcistoughguy(slf) && Npc_IsInFightMode(oth,FMODE_MELEE))
	{
		return FALSE;
	};
	if(Npc_GetAttitude(slf,oth) == ATT_FRIENDLY)
	{
		return FALSE;
	};
	if(c_npcisgateguard(slf))
	{
		return FALSE;
	};
	if(Npc_IsInFightMode(oth,FMODE_FIST))
	{
		return FALSE;
	};
	if(Npc_IsInFightMode(oth,FMODE_MAGIC) && (Npc_GetActiveSpellCat(oth) != SPELL_BAD))
	{
		return FALSE;
	};
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_ORC))
	{
		return FALSE;
	};
	return TRUE;
};

