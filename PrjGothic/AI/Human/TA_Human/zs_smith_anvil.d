
func void zs_smith_anvil()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_smith_anvil_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_UseMob(self,"BSANVIL",1);
	};
	return LOOP_CONTINUE;
};

func void zs_smith_anvil_end()
{
	AI_UseMob(self,"BSANVIL",-1);
};

