
const int SPL_COST_PALHOLYBOLT = 5;
const int SPL_DAMAGE_PALHOLYBOLT = 150;

instance SPELL_PALHOLYBOLT(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_PALHOLYBOLT;
};


func int spell_logic_palholybolt(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_PALHOLYBOLT)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_palholybolt()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALHOLYBOLT;
};

