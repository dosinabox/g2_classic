
func void zs_mm_rtn_dragonrest()
{
	Npc_SetPercTime(self,1);
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(dragon_testmodell))
	{
		perception_set_monster_rtn();
		Npc_PercEnable(self,PERC_ASSESSPLAYER,b_mm_assessplayer);
	};
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	AI_SetWalkMode(self,NPC_WALK);
	b_mm_desynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_ROAM"))
	{
		AI_GotoFP(self,"FP_ROAM");
	}
	else
	{
		AI_AlignToWP(self);
	};
};

func int zs_mm_rtn_dragonrest_loop()
{
	var int randommove;
	if(!Wld_IsTime(self.aivar[AIV_MM_RESTSTART],0,self.aivar[AIV_MM_RESTEND],0) && (self.aivar[AIV_MM_RESTSTART] != ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_allscheduler,1,"");
		return LOOP_END;
	};
	if(Hlp_Random(1000) <= 5)
	{
		randommove = Hlp_Random(3);
		AI_Standup(self);
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

func void zs_mm_rtn_dragonrest_end()
{
	AI_PlayAni(self,"T_REST_2_STAND");
};

