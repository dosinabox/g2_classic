
const int SPL_COST_CHARGEZAP = 60;
const int SPL_DAMAGE_CHARGEZAP = 60;

instance SPELL_CHARGEZAP(C_SPELL_PROTO)
{
	time_per_mana = 100;
	damage_per_level = SPL_DAMAGE_CHARGEZAP;
	damagetype = DAM_MAGIC;
	canturnduringinvest = TRUE;
};


func int spell_logic_chargezap(var int manainvested)
{
	if(manainvested == 0)
	{
		return SPL_FORCEINVEST + ((SPL_COST_CHARGEZAP * 3) / 10);
	};
	if((manainvested == ((SPL_COST_CHARGEZAP * 5) / 10)) || (manainvested == ((SPL_COST_CHARGEZAP * 7) / 10)) || (manainvested == ((SPL_COST_CHARGEZAP * 9) / 10)))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_COST_CHARGEZAP)
	{
		return SPL_DONTINVEST;
	};
	return SPL_RECEIVEINVEST;
};

