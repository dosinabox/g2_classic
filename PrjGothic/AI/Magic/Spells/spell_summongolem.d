
const int SPL_COST_SUMMONGOLEM = 40;

instance SPELL_SUMMONGOLEM(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_BAD;
	targetcollectalgo = TARGET_COLLECT_NONE;
};


func int spell_logic_summongolem(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_SUMMONGOLEM)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_summongolem()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SUMMONGOLEM;
	if(Npc_IsPlayer(self))
	{
		Wld_SpawnNpcRange(self,summoned_golem,1,500);
	}
	else
	{
		Wld_SpawnNpcRange(self,stonegolem,1,500);
	};
};

