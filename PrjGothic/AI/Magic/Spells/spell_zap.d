
const int SPL_COST_ZAP = 6;
const int SPL_DAMAGE_ZAP = 30;

instance SPELL_ZAP(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_ZAP;
	damagetype = DAM_MAGIC;
};


func int spell_logic_zap(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_ZAP)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_zap(var int spelllevel)
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_ZAP;
};

