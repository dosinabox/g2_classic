
const int SPL_COST_PALLIGHT = 5;
const int SPL_COST_LIGHT = 1;
const int SPL_DURATION_PALLIGHT = 5;
const int SPL_DURATION_LIGHT = 5;

instance SPELL_LIGHT(C_SPELL_PROTO)
{
	time_per_mana = 500;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_NONE;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};

instance SPELL_PALLIGHT(C_SPELL_PROTO)
{
	time_per_mana = 500;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_NONE;
	targetcollectrange = 0;
	targetcollectazi = 0;
	targetcollectelev = 0;
};


func int spell_logic_pallight(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_PALLIGHT)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_pallight()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_PALLIGHT;
};

func int spell_logic_light(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_LIGHT)
	{
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_light()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_LIGHT;
};

