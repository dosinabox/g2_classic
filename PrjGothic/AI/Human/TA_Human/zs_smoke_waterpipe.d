
func void zs_smoke_waterpipe()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_smoke_waterpipe_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"SMOKE"))
	{
		AI_UseMob(self,"SMOKE",1);
	};
	return LOOP_CONTINUE;
};

func void zs_smoke_waterpipe_end()
{
	AI_UseMob(self,"SMOKE",-1);
};

