
func int b_getgreatestpetzcrime(var C_NPC slf)
{
	if(c_npcbelongstooldcamp(slf))
	{
		if(PETZCOUNTER_OLDCAMP_MURDER > 0)
		{
			return CRIME_MURDER;
		};
		if(PETZCOUNTER_OLDCAMP_THEFT > 0)
		{
			return CRIME_THEFT;
		};
		if(PETZCOUNTER_OLDCAMP_ATTACK > 0)
		{
			return CRIME_ATTACK;
		};
		if(PETZCOUNTER_OLDCAMP_SHEEPKILLER > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	if(c_npcbelongstocity(slf))
	{
		if(PETZCOUNTER_CITY_MURDER > 0)
		{
			return CRIME_MURDER;
		};
		if(PETZCOUNTER_CITY_THEFT > 0)
		{
			return CRIME_THEFT;
		};
		if(PETZCOUNTER_CITY_ATTACK > 0)
		{
			return CRIME_ATTACK;
		};
		if(PETZCOUNTER_CITY_SHEEPKILLER > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	if(c_npcbelongstomonastery(slf))
	{
		if(PETZCOUNTER_MONASTERY_MURDER > 0)
		{
			return CRIME_MURDER;
		};
		if(PETZCOUNTER_MONASTERY_THEFT > 0)
		{
			return CRIME_THEFT;
		};
		if(PETZCOUNTER_MONASTERY_ATTACK > 0)
		{
			return CRIME_ATTACK;
		};
		if(PETZCOUNTER_MONASTERY_SHEEPKILLER > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	if(c_npcbelongstofarm(slf))
	{
		if(PETZCOUNTER_FARM_MURDER > 0)
		{
			return CRIME_MURDER;
		};
		if(PETZCOUNTER_FARM_THEFT > 0)
		{
			return CRIME_THEFT;
		};
		if(PETZCOUNTER_FARM_ATTACK > 0)
		{
			return CRIME_ATTACK;
		};
		if(PETZCOUNTER_FARM_SHEEPKILLER > 0)
		{
			return CRIME_SHEEPKILLER;
		};
	};
	return CRIME_NONE;
};

