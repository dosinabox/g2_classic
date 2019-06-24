
func int c_wanttoattacksheepkiller(var C_NPC slf,var C_NPC oth)
{
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_STRF) || (slf.guild == GIL_BDT) || (slf.guild == GIL_DJG))
	{
		return FALSE;
	};
	if(slf.aivar[AIV_IGNORE_SHEEPKILLER] == TRUE)
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
	if((other.guild < GIL_SEPERATOR_HUM) && (other.aivar[AIV_ATTACKREASON] != AR_NONE))
	{
		return FALSE;
	};
	if(c_npcisgateguard(slf))
	{
		return FALSE;
	};
	return TRUE;
};

