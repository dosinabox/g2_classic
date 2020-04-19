
const int SPL_COST_PALDESTROYEVIL = 30;
const int SPL_DAMAGE_PALDESTROYEVIL = 600;

instance SPELL_PALDESTROYEVIL(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_PALDESTROYEVIL;
	spelltype = SPELL_NEUTRAL;
};


func int spell_logic_paldestroyevil(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_PALDESTROYEVIL)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_paldestroyevil()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALDESTROYEVIL;
};

