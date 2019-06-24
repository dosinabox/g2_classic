
func void zs_sit_throne()
{
	perception_set_normal();
	b_resetall(self);
	if(!c_bodystatecontains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func int zs_sit_throne_loop()
{
	if(!c_bodystatecontains(self,BS_SIT) && Wld_IsMobAvailable(self,"THRONE"))
	{
		AI_UseMob(self,"THRONE",1);
	};
	return LOOP_CONTINUE;
};

func void zs_sit_throne_end()
{
	AI_UseMob(self,"THRONE",-1);
};

