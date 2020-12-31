
func void zs_dead()
{
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	b_stoplookat(self);
	AI_StopPointAt(self);
	b_givedeathxp(other,self);
	if((self.guild == GIL_GOBBO) || (self.guild == GIL_GOBBO_SKELETON) || (self.guild == GIL_SUMMONED_GOBBO_SKELETON))
	{
		Npc_RemoveInvItems(self,itmw_1h_bau_mace,Npc_HasItems(self,itmw_1h_bau_mace));
	}
	else if(self.guild == GIL_SUMMONED_SKELETON)
	{
		Npc_RemoveInvItems(self,itmw_2h_sword_m_01,Npc_HasItems(self,itmw_2h_sword_m_01));
	};
	if(Npc_IsPlayer(other))
	{
		self.aivar[AIV_KILLEDBYPLAYER] = TRUE;
		if(c_dropunconscious())
		{
			MadKillerCount += 1;
		};
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

