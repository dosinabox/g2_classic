
const int SPL_COST_SLEEP = 10;
const int SPL_TIME_SLEEP = 30;

instance SPELL_SLEEP(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_NEUTRAL;
	targetcollectalgo = TARGET_COLLECT_FOCUS;
};


func int spell_logic_sleep(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_SLEEP)
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_SLEEP;
		if(!c_bodystatecontains(other,BS_SWIM) && !c_bodystatecontains(other,BS_DIVE) && !c_npcisdown(other) && (other.guild < GIL_SEPERATOR_HUM) && (other.flags != NPC_FLAG_IMMORTAL) && (Npc_GetDistToNpc(self,other) <= 1000) && !c_npcisgateguard(self) && (other.guild != GIL_KDF) && (other.guild != GIL_DMT) && (other.guild != GIL_PAL))
		{
			Npc_ClearAIQueue(other);
			b_clearperceptions(other);
			AI_StartState(other,zs_magicsleep,0,"");
		};
		return SPL_SENDCAST;
	};
	return SPL_SENDSTOP;
};

func void spell_cast_sleep()
{
};

