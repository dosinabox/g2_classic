
func void zs_roast_scavenger()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_roast_scavenger_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BARBQ"))
	{
		AI_UseMob(self,"BARBQ",1);
	};
	return LOOP_CONTINUE;
};

func void zs_roast_scavenger_end()
{
	AI_UseMob(self,"BARBQ",-1);
};

