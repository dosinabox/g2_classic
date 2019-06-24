
func void zs_mm_rtn_follow_sheep()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_mm_assessplayer);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
};

func int zs_mm_rtn_follow_sheep_loop()
{
	var int randommove;
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(Npc_GetDistToNpc(self,hero) > 500)
		{
			if(!c_bodystatecontains(self,BS_SWIM))
			{
				AI_SetWalkMode(self,NPC_RUN);
			};
			AI_GotoNpc(self,hero);
		}
		else
		{
			AI_TurnToNPC(self,hero);
			self.wp = Npc_GetNearestWP(self);
		};
	}
	else
	{
		randommove = Hlp_Random(3);
		if(randommove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
		};
		if(randommove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
		};
		if(randommove == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
		};
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_follow_sheep_end()
{
};

func void zs_mm_rtn_follow_sheep_balthasar()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_mm_assessplayer);
};

func int zs_mm_rtn_follow_sheep_balthasar_loop()
{
	if(Npc_GetDistToWP(balthasar,"NW_BIGMILL_FARM3_BALTHASAR") > 500)
	{
		if(Npc_GetDistToNpc(self,balthasar) > 500)
		{
			if(!c_bodystatecontains(self,BS_SWIM))
			{
				AI_SetWalkMode(self,NPC_RUN);
			};
			AI_GotoNpc(self,balthasar);
		}
		else
		{
			AI_TurnToNPC(self,balthasar);
			self.wp = Npc_GetNearestWP(self);
		};
	}
	else
	{
		AI_StartState(self,zs_mm_rtn_roam,1,"NW_BIGMILL_FARM3_BALTHASAR");
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_follow_sheep_balthasar_end()
{
};

