
func void zs_dead()
{
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	b_stoplookat(self);
	AI_StopPointAt(self);
	if((Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)) && (self.aivar[AIV_VICTORYXPGIVEN] == FALSE))
	{
		b_giveplayerxp(self.level * XP_PER_VICTORY);
		self.aivar[AIV_VICTORYXPGIVEN] = TRUE;
	};
	if(Npc_IsPlayer(other))
	{
		self.aivar[AIV_KILLEDBYPLAYER] = TRUE;
		if((self.guild == GIL_GIANT_BUG) && (MIS_FESTER_KILLBUGS == LOG_RUNNING))
		{
			FESTERS_GIANT_BUG_KILLED = FESTERS_GIANT_BUG_KILLED + 1;
		};
	};
	b_givetradeinv(self);
	b_givedeathinv(self);
	b_clearruneinv(self);
	b_deletepetzcrime(self);
	self.aivar[AIV_NPCSAWPLAYERCOMMIT] = CRIME_NONE;
	AI_UnequipWeapons(self);
	self.aivar[AIV_TAPOSITION] = ISINPOS;
};

func int ZS_Dead_Loop()
{
	if(self.aivar[AIV_TAPOSITION] == ISINPOS)
	{
		b_dragonkillcounter(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};
	return LOOP_CONTINUE;
};

