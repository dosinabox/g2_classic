
func void b_assessguideplayer()
{
	if(Npc_GetDistToNpc(self,hero) > 800)
	{
		if(Npc_GetDistToWP(self,self.wp) < Npc_GetDistToWP(hero,self.wp))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			b_turntonpc(self,hero);
		};
		if((Npc_GetDistToNpc(self,hero) > 1200) && (self.aivar[AIV_ENEMYOVERRIDE] == TRUE) && (Npc_GetAttitude(self,hero) == ATT_HOSTILE))
		{
			self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		};
	}
	else
	{
		b_assessplayer();
	};
};

func void b_assessguidefightsound()
{
	if(Npc_IsPlayer(other) || Npc_IsPlayer(victim))
	{
		b_assessfightsound();
	};
};

func void zs_guide_player()
{
	perception_set_minimal();
	b_resetall(self);
	self.senses = SENSE_SEE | SENSE_HEAR | SENSE_SMELL;
	self.senses_range = 2000;
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assessguideplayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessguidefightsound);
};

func int zs_guide_player_loop()
{
	if((Npc_GetDistToNpc(self,hero) > 800) && (Npc_GetDistToWP(self,self.wp) < Npc_GetDistToWP(hero,self.wp)))
	{
		b_assessguideplayer();
	}
	else if(Npc_GetDistToWP(self,self.wp) > 300)
	{
		if(!c_bodystatecontains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};
		AI_GotoWP(self,self.wp);
	}
	else
	{
		b_turntonpc(self,hero);
	};
	return LOOP_CONTINUE;
};

func int zs_guide_player_end()
{
};

