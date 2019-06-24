
func void zs_cook_pan()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,itfomuttonraw) == 0)
	{
		CreateInvItem(self,itfomuttonraw);
	};
};

func int zs_cook_pan_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"PAN"))
	{
		AI_UseMob(self,"PAN",1);
	};
	return LOOP_CONTINUE;
};

func void zs_cook_pan_end()
{
	AI_UseMob(self,"PAN",-1);
	AI_UseItem(self,itfomutton);
};

