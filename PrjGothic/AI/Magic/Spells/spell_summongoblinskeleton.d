
const int SPL_COST_SUMMONGOBLINSKELETON = 10;

instance SPELL_SUMMONGOBLINSKELETON(C_SPELL_PROTO)
{
	time_per_mana = 0;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summongoblinskeleton(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_SUMMONGOBLINSKELETON)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summongoblinskeleton()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONGOBLINSKELETON;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,summoned_gobbo_skeleton,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,gobbo_skeleton,1,500);
	};
};

