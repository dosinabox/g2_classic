
const int SPL_COST_CHARM = 10;
const int SPL_DAMAGE_CHARM = 0;

instance SPELL_CHARM(C_SPELL_PROTO)
{
	time_per_mana = 0;
	spelltype = SPELL_NEUTRAL;
	damage_per_level = SPL_DAMAGE_CHARM;
	damagetype = DAM_MAGIC;
};


func int spell_logic_charm(var int manainvested)
{
	if(self.attribute[ATR_MANA] >= SPL_COST_CHARM)
	{
		if((other.aivar[AIV_NPCSAWPLAYERCOMMIT] != CRIME_NONE) && (MIS_IGNAZ_CHARM == LOG_RUNNING))
		{
			CHARM_TEST = TRUE;
		};
		b_deletepetzcrime(other);
		other.aivar[AIV_NPCSAWPLAYERCOMMIT] = CRIME_NONE;
		other.aivar[AIV_LASTFIGHTAGAINSTPLAYER] = FIGHT_NONE;
		if(Wld_GetGuildAttitude(other.guild,self.guild) != ATT_HOSTILE)
		{
			if(Npc_GetAttitude(other,self) == ATT_HOSTILE)
			{
				Npc_SetTempAttitude(other,Wld_GetGuildAttitude(other.guild,self.guild));
			};
		};
		return SPL_SENDCAST;
	}
	else
	{
		return SPL_SENDSTOP;
	};
};

func void spell_cast_charm()
{
	self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - SPL_COST_CHARM;
};

