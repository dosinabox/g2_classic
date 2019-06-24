
func int c_bodystatecontains(var C_NPC slf,var int bodystate)
{
	if((Npc_GetBodyState(slf) & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS)) == (bodystate & (BS_MAX | BS_FLAG_INTERRUPTABLE | BS_FLAG_FREEHANDS)))
	{
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};

