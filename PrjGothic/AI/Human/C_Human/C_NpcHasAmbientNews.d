
func int c_npchasambientnews(var C_NPC slf)
{
	if(slf.aivar[AIV_NEWSOVERRIDE] == TRUE)
	{
		return FALSE;
	};
	if(b_getplayercrime(slf) == CRIME_NONE)
	{
		return FALSE;
	};
	return TRUE;
};

