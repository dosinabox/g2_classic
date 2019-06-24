
func int b_getplayercrime(var C_NPC slf)
{
	if(slf.aivar[AIV_NPCSAWPLAYERCOMMIT] <= CRIME_ATTACK)
	{
		if(slf.aivar[AIV_NPCSAWPLAYERCOMMITDAY] < (Wld_GetDay() - 2))
		{
			return CRIME_NONE;
		};
	};
	if(slf.aivar[AIV_CRIMEABSOLUTIONLEVEL] < b_getcurrentabsolutionlevel(slf))
	{
		return CRIME_NONE;
	};
	return slf.aivar[AIV_NPCSAWPLAYERCOMMIT];
};

