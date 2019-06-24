
func void zs_sit_bench()
{
	perception_set_normal();
	b_resetall(self);
	if(!c_bodystatecontains(self,BS_SIT))
	{
		AI_SetWalkMode(self,NPC_WALK);
		if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
		{
			AI_GotoWP(self,self.wp);
		};
	};
};

func int zs_sit_bench_loop()
{
	var int random;
	if(!c_bodystatecontains(self,BS_SIT) && Wld_IsMobAvailable(self,"BENCH"))
	{
		AI_UseMob(self,"BENCH",1);
	};
	if(c_bodystatecontains(self,BS_SIT) && (Npc_GetStateTime(self) > 5))
	{
		random = Hlp_Random(8);
		if(random <= 0)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_1",BS_SIT);
		};
		if(random <= 1)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_2",BS_SIT);
		};
		if(random <= 2)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_3",BS_SIT);
		};
		if(random <= 3)
		{
			AI_PlayAniBS(self,"R_CHAIR_RANDOM_4",BS_SIT);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void zs_sit_bench_end()
{
	AI_UseMob(self,"BENCH",-1);
};

