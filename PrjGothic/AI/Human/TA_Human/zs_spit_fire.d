
func void zs_spit_fire()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Npc_HasItems(self,itlstorchfirespit) == 0)
	{
		CreateInvItem(self,itlstorchfirespit);
	};
};

func int zs_spit_fire_loop()
{
	if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		AI_AlignToFP(self);
	}
	else
	{
		AI_AlignToWP(self);
	};
	if(Npc_GetStateTime(self) > 10)
	{
		AI_UseItemToState(self,itlstorchfirespit,5);
		AI_UseItemToState(self,itlstorchfirespit,0);
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void zs_spit_fire_end()
{
	AI_UseItemToState(self,itlstorchfirespit,-1);
};

