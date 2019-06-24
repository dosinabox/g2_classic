
func void zs_sit_campfire()
{
	perception_set_normal();
	b_resetall(self);
	if(!c_bodystatecontains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func int zs_sit_campfire_loop()
{
	if(Npc_IsOnFP(self,"CAMPFIRE") && !c_bodystatecontains(self,BS_SIT))
	{
		AI_AlignToFP(self);
		AI_PlayAniBS(self,"T_STAND_2_SIT",BS_SIT);
	}
	else if(Wld_IsFPAvailable(self,"CAMPFIRE") && !c_bodystatecontains(self,BS_SIT))
	{
		AI_GotoFP(self,"CAMPFIRE");
		AI_Standup(self);
		AI_AlignToFP(self);
	};
	return LOOP_CONTINUE;
};

func void zs_sit_campfire_end()
{
	AI_PlayAniBS(self,"T_SIT_2_STAND",BS_STAND);
};

