
const int SPL_COST_DEATHBOLT = 5;
const int SPL_DAMAGE_DEATHBOLT = 120;

instance SPELL_DEATHBOLT(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_DEATHBOLT;
};


func int spell_logic_deathbolt(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_DEATHBOLT)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_deathbolt()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_DEATHBOLT;
};

