
func void zs_cook_stove()
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

func int zs_cook_stove_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"STOVE"))
	{
		AI_UseMob(self,"STOVE",1);
	};
	return LOOP_CONTINUE;
};

func void zs_cook_stove_end()
{
	AI_UseMob(self,"STOVE",-1);
	if(Npc_HasItems(self,itfomutton) >= 1)
	{
		Npc_RemoveInvItems(self,itfomutton,1);
	};
};

