
const int SPL_COST_FIRERAIN = 60;
const int SPL_DAMAGE_FIRERAIN = 300;

instance SPELL_FIRERAIN(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_FIRERAIN;
	damagetype = DAM_MAGIC;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_firerain(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_FIRERAIN)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_firerain()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_FIRERAIN;
};

