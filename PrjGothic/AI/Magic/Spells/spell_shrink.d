
const int SPL_COST_SHRINK = 100;

instance SPELL_SHRINK(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
	targetcollectrange = 1000;
};


func int spell_logic_shrink(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_SHRINK)
	{
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_shrink()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SHRINK;
	if((other.flags != NPC_FLAG_IMMORTAL) && (other.guild > GIL_SEPERATOR_HUM) && (other.aivar[AIV_MM_SHRINKSTATE] == 0))
	{
		Npc_ClearAIQueue(other);
		b_clearperceptions(other);
		AI_StartState(other,zs_magicshrink,0,"");
	};
};

