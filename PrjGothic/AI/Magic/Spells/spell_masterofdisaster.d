
const int SPL_COST_MASTEROFDISASTER = 50;
const int SPL_DAMAGE_MASTEROFDISASTER = 300;

instance SPELL_MASTEROFDISASTER(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_MASTEROFDISASTER;
	damagetype = DAM_MAGIC;
};


func int spell_logic_masterofdisaster(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_MASTEROFDISASTER)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_masterofdisaster()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_MASTEROFDISASTER;
};

