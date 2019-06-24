
const int SPL_COST_CHARGEFIREBALL = 75;
const int SPL_DAMAGE_CHARGEFIREBALL = 100;

instance SPELL_CHARGEFIREBALL(C_SPELL_PROTO)
{
	time_per_mana = 120;
	damage_per_level = SPL_DAMAGE_CHARGEFIREBALL;
	damagetype = DAM_MAGIC;
	canturnduringinvest = TRUE;
};


func int spell_logic_chargefireball(var int manainvested)
{
	if(manainvested == 0)
	{
		return SPL_FORCEINVEST + ((SPL_COST_CHARGEFIREBALL * 2) / 10);
	};
	if((manainvested == ((SPL_COST_CHARGEFIREBALL * 3) / 10)) || (manainvested == ((SPL_COST_CHARGEFIREBALL * 5) / 10)) || (manainvested == ((SPL_COST_CHARGEFIREBALL * 8) / 10)))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_COST_CHARGEFIREBALL)
	{
		return SPL_DONTINVEST;
	};
	return SPL_RECEIVEINVEST;
};

