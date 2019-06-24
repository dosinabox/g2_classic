
func void zs_stomp_herb()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_stomp_herb_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"HERB"))
	{
		AI_UseMob(self,"HERB",1);
	};
	return LOOP_CONTINUE;
};

func void zs_stomp_herb_end()
{
	AI_UseMob(self,"HERB",-1);
};

