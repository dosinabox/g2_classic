
func void zs_potion_alchemy()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,itmi_flask) == 0)
	{
		CreateInvItem(self,itmi_flask);
	};
};

func int zs_potion_alchemy_loop()
{
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"LAB"))
	{
		AI_UseMob(self,"LAB",1);
	};
	return LOOP_CONTINUE;
};

func void zs_potion_alchemy_end()
{
	AI_UseMob(self,"LAB",-1);
};

