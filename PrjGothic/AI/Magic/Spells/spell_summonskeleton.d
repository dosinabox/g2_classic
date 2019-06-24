
const int SPL_COST_SUMMONSKELETON = 30;

instance SPELL_SUMMONSKELETON(C_SPELL_PROTO)
{
	time_per_mana = 0;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summonskeleton(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_SUMMONSKELETON)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summonskeleton()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONSKELETON;
	self.aivar[AIV_SELECTSPELL] = self.aivar[AIV_SELECTSPELL] + 1;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,summoned_skeleton,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,skeleton,1,500);
	};
};

