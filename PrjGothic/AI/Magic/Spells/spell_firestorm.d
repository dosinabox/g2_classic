
const int SPL_COST_INSTANTFIRESTORM = 20;
const int SPL_DAMAGE_INSTANTFIRESTORM = 60;

instance SPELL_FIRESTORM(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_INSTANTFIRESTORM;
	damagetype = DAM_MAGIC;
};


func int spell_logic_firestorm(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_INSTANTFIRESTORM)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_firestorm()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_INSTANTFIRESTORM;
};

