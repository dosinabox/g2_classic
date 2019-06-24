
const int SPL_COST_LIGHTNINGFLASH = 20;
const int SPL_DAMAGE_LIGHTNINGFLASH = 120;
const int SPL_ZAPPED_DAMAGE_PER_SEC = 2;
const int SPL_TIME_SHORTZAPPED = 2;

instance SPELL_LIGHTNINGFLASH(C_SPELL_PROTO)
{
	time_per_mana = 0;
	damage_per_level = SPL_DAMAGE_LIGHTNINGFLASH;
	damagetype = DAM_MAGIC;
};


func int spell_logic_lightningflash(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_LIGHTNINGFLASH)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_lightningflash()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_LIGHTNINGFLASH;
};

