
func void b_mm_assessquietsound_sleep()
{
	if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_HOSTILE)
	{
		b_mm_assessenemy();
	};
};

func void zs_mm_rtn_sleep()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_assessdamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_mm_assessothersdamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_mm_assessothersdamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_mm_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,b_mm_assessquietsound_sleep);
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
	AI_PlayAni(self,"T_PERCEPTION");
	AI_PlayAniBS(self,"T_STAND_2_SLEEP",BS_LIE);
};

func int zs_mm_rtn_sleep_loop()
{
	if(!Wld_IsTime(self.aivar[AIV_MM_SLEEPSTART],0,self.aivar[AIV_MM_SLEEPEND],0) && (self.aivar[AIV_MM_SLEEPSTART] != ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_allscheduler,1,"");
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_sleep_end()
{
	AI_PlayAniBS(self,"T_SLEEP_2_STAND",BS_STAND);
};

