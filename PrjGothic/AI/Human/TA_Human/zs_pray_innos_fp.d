
func void zs_pray_innos_fp()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_pray_innos_fp_loop()
{
	if(Npc_IsOnFP(self,"PRAY"))
	{
		if(!c_bodystatecontains(self,BS_SIT))
		{
			AI_AlignToFP(self);
			AI_PlayAniBS(self,"T_STAND_2_PRAY",BS_SIT);
		}
		else
		{
			AI_PlayAniBS(self,"T_PRAY_RANDOM",BS_SIT);
		};
	}
	else if(Wld_IsFPAvailable(self,"PRAY"))
	{
		AI_GotoFP(self,"PRAY");
		AI_Standup(self);
		AI_AlignToFP(self);
	};
	return LOOP_CONTINUE;
};

func void zs_pray_innos_fp_end()
{
	Npc_StopAni(self,"T_PRAY_RANDOM");
	AI_PlayAni(self,"T_PRAY_2_STAND");
};

