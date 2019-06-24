
func void b_summonedassesstalk()
{
	Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
};

func void zs_mm_rtn_summoned()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_mm_assessplayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_mm_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_assessdamage);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_mm_assessothersdamage);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_summonedassesstalk);
	b_setattitude(self,ATT_FRIENDLY);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
};

func int zs_mm_rtn_summoned_loop()
{
	if(Npc_GetDistToNpc(self,hero) > 500)
	{
		AI_GotoNpc(self,hero);
	}
	else if(Npc_GetStateTime(self) >= 1)
	{
		if(!Npc_CanSeeNpc(self,hero))
		{
			AI_TurnToNPC(self,hero);
		};
		self.aivar[AIV_SUMMONTIME] = self.aivar[AIV_SUMMONTIME] + Npc_GetStateTime(self);
		if(self.aivar[AIV_SUMMONTIME] >= MONSTER_SUMMON_TIME)
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		};
		Npc_SetStateTime(self,0);
	};
	self.wp = Npc_GetNearestWP(self);
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_summoned_end()
{
};

