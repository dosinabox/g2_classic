
func int c_wanttoattackmurder(var C_NPC slf,var C_NPC oth)
{
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_STRF) || (slf.guild == GIL_BDT) || (slf.guild == GIL_DJG))
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IGNORE_MURDER] == TRUE)
	{
		return FALSE;
	};
	if(Npc_IsPlayer(oth) && (slf.npctype == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	if(c_npchasattackreasontokill(oth))
	{
		return FALSE;
	};
	if(c_npcisgateguard(slf))
	{
		return FALSE;
	};
	return TRUE;
};

