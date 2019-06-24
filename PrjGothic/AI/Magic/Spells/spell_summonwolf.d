
const int SPL_COST_SUMMONWOLF = 20;

instance SPELL_SUMMONWOLF(C_SPELL_PROTO)
{
	time_per_mana = 0;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summonwolf(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_SUMMONWOLF)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summonwolf()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONWOLF;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,summoned_wolf,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,wolf,1,500);
	};
};

