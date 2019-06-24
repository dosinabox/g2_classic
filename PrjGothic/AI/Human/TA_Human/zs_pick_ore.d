
func void zs_pick_ore()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,itmw_2h_axe_l_01) == 0)
	{
		CreateInvItem(self,itmw_2h_axe_l_01);
	};
	EquipItem(self,itmw_2h_axe_l_01);
};

func int zs_pick_ore_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"ORE"))
	{
		AI_UseMob(self,"ORE",1);
	};
	return LOOP_CONTINUE;
};

func void zs_pick_ore_end()
{
	AI_UseMob(self,"ORE",-1);
};

