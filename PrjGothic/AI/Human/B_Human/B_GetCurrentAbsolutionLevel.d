
func int b_getcurrentabsolutionlevel(var C_NPC slf)
{
	if(c_npcbelongstooldcamp(slf))
	{
		return ABSOLUTIONLEVEL_OLDCAMP;
	};
	if(c_npcbelongstocity(slf))
	{
		return ABSOLUTIONLEVEL_CITY;
	};
	if(c_npcbelongstomonastery(slf))
	{
		return ABSOLUTIONLEVEL_MONASTERY;
	};
	if(c_npcbelongstofarm(slf))
	{
		return ABSOLUTIONLEVEL_FARM;
	};
	return 0;
};

