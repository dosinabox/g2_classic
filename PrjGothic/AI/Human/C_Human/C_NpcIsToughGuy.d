
func int c_npcistoughguy(var C_NPC slf)
{
	if(slf.aivar[AIV_TOUGHGUY] == TRUE)
	{
		return TRUE;
	};
	if((slf.guild == GIL_SLD) || (slf.guild == GIL_DJG) || (slf.guild == GIL_BDT))
	{
		return TRUE;
	};
	return FALSE;
};

