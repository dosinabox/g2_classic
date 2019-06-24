
func void zs_read_bookstand()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_read_bookstand_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BOOK"))
	{
		AI_UseMob(self,"BOOK",1);
	};
	return LOOP_CONTINUE;
};

func void zs_read_bookstand_end()
{
	AI_UseMob(self,"BOOK",-1);
};

