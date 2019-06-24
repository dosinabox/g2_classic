
const int SPL_COST_FIRESTORM = 125;
const int SPL_DAMAGE_FIRESTORM = 100;
const int SPL_PYRO_DAMAGE_PER_SEC = 20;

instance SPELL_PYROKINESIS(C_SPELL_PROTO)
{
	time_per_mana = 120;
	damage_per_level = SPL_DAMAGE_FIRESTORM;
	damagetype = DAM_MAGIC;
};


func int spell_logic_pyrokinesis(var int manainvested)
{
	if(manainvested >= SPL_COST_FIRESTORM)
	{
		return SPL_DONTINVEST;
	};
	if((manainvested == ((SPL_COST_FIRESTORM * 3) / 10)) || (manainvested == ((SPL_COST_FIRESTORM * 5) / 10)) || (manainvested == ((SPL_COST_FIRESTORM * 8) / 10)))
	{
		return SPL_NEXTLEVEL;
	};
	if(manainvested >= SPL_COST_FIRESTORM)
	{
		return SPL_SENDCAST;
	};
	return SPL_RECEIVEINVEST;
};

func void spell_cast_pyrokinesis(var int spelllevel)
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - (spelllevel * SPL_COST_FIRESTORM);
};

