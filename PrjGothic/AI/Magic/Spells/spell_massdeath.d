
const int SPL_COST_MASSDEATH = 150;
const int SPL_DAMAGE_MASSDEATH = 400;

instance SPELL_MASSDEATH(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_MASSDEATH;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_massdeath(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_MASSDEATH)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_massdeath()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_MASSDEATH;
};

