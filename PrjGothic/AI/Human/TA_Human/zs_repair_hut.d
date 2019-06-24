
func void zs_repair_hut()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_repair_hut_loop()
{
	var int zufall;
	if(!c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"REPAIR"))
	{
		AI_UseMob(self,"REPAIR",1);
	};
	if((Npc_GetStateTime(self) > 5) && c_bodystatecontains(self,BS_MOBINTERACT_INTERRUPT))
	{
		zufall = Hlp_Random(100);
		if(zufall < 50)
		{
			AI_PlayAniBS(self,"T_REPAIR_RANDOM_1",BS_MOBINTERACT_INTERRUPT);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void zs_repair_hut_end()
{
	AI_UseMob(self,"REPAIR",-1);
};

