
func void zs_pray_sleeper()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_pray_sleeper_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"IDOL"))
	{
		AI_UseMob(self,"IDOL",1);
	};
	return LOOP_CONTINUE;
};

func void zs_pray_sleeper_end()
{
	AI_UseMob(self,"IDOL",-1);
};

