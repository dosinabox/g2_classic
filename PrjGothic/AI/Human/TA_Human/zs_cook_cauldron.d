
func void zs_cook_cauldron()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,itmi_scoop) == 0)
	{
		CreateInvItem(self,itmi_scoop);
	};
};

func int zs_cook_cauldron_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"CAULDRON"))
	{
		AI_UseMob(self,"CAULDRON",1);
	};
	return LOOP_CONTINUE;
};

func void zs_cook_cauldron_end()
{
	AI_UseMob(self,"CAULDRON",-1);
};

