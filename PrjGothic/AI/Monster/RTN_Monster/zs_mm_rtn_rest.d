
func void zs_mm_rtn_rest()
{
	perception_set_monster_rtn();
	AI_SetWalkMode(self,NPC_WALK);
	b_mm_desynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_mm_rtn_rest_loop()
{
	var int randommove;
	if(!Wld_IsTime(self.aivar[AIV_MM_RESTSTART],0,self.aivar[AIV_MM_RESTEND],0) && (self.aivar[AIV_MM_RESTSTART] != ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_allscheduler,1,"");
		return LOOP_END;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Wld_IsFPAvailable(self,"FP_ROAM"))
		{
			AI_GotoFP(self,"FP_ROAM");
		};
		if(Npc_IsOnFP(self,"FP_ROAM"))
		{
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	else if(Hlp_Random(1000) <= 5)
	{
		randommove = Hlp_Random(3);
		if(randommove == 0)
		{
			AI_PlayAni(self,"R_ROAM1");
		};
		if(randommove == 1)
		{
			AI_PlayAni(self,"R_ROAM2");
		};
		if(randommove == 2)
		{
			AI_PlayAni(self,"R_ROAM3");
		};
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_rest_end()
{
};

