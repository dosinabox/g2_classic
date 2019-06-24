
func void zs_mm_rtn_eatground()
{
	perception_set_monster_rtn();
	AI_SetWalkMode(self,NPC_WALK);
	b_mm_desynchronize();
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	if(Wld_IsFPAvailable(self,"FP_ROAM"))
	{
		AI_GotoFP(self,"FP_ROAM");
	};
	AI_PlayAni(self,"T_STAND_2_EAT");
	Mdl_ApplyRandomAni(self,"S_EAT","R_ROAM1");
	Mdl_ApplyRandomAni(self,"S_EAT","R_ROAM2");
	Mdl_ApplyRandomAni(self,"S_EAT","R_ROAM3");
	Mdl_ApplyRandomAniFreq(self,"S_EAT",8);
};

func int zs_mm_rtn_eatground_loop()
{
	if(!Wld_IsTime(self.aivar[AIV_MM_EATGROUNDSTART],0,self.aivar[AIV_MM_EATGROUNDEND],0) && (self.aivar[AIV_MM_EATGROUNDSTART] != ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_allscheduler,1,"");
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_eatground_end()
{
	AI_PlayAni(self,"T_EAT_2_STAND");
};

