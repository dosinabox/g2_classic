
const int SPL_COST_PALREPELEVIL = 15;
const int SPL_DAMAGE_PALREPELEVIL = 300;

instance SPELL_PALREPELEVIL(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_PALREPELEVIL;
};


func int spell_logic_palrepelevil(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_PALREPELEVIL)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_palrepelevil()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALREPELEVIL;
};

