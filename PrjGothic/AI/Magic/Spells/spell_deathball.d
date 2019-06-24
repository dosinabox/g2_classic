
const int SPL_COST_DEATHBALL = 5;
const int SPL_DAMAGE_DEATHBALL = 175;

instance SPELL_DEATHBALL(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_DEATHBALL;
};


func int spell_logic_deathball(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_DEATHBALL)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_deathball()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_DEATHBALL;
};

