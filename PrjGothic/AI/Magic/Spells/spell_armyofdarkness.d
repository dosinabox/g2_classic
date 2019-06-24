
const int SPL_COST_ARMYOFDARKNESS = 60;

instance SPELL_ARMYOFDARKNESS(C_SPELL_PROTO)
{
	time_per_mana = 0;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_armyofdarkness(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_ARMYOFDARKNESS)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_armyofdarkness(var int spelllevel)
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_ARMYOFDARKNESS;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,summoned_skeleton,6,800);
	}
	else
	{
		Wld_SpawnNpcRange(self,skeleton,6,800);
	};
};

