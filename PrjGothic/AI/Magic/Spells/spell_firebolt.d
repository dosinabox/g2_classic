
const int SPL_COST_FIREBOLT = 5;
const int SPL_DAMAGE_FIREBOLT = 30;

instance SPELL_FIREBOLT(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_FIREBOLT;
	damagetype = DAM_MAGIC;
};


func int spell_logic_firebolt(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_FIREBOLT)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_firebolt()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_FIREBOLT;
};

