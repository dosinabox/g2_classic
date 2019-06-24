
func void zs_mm_rtn_orcsit()
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

func int zs_mm_rtn_orcsit_loop()
{
	if(!Wld_IsTime(self.aivar[AIV_MM_ORCSITSTART],0,self.aivar[AIV_MM_ORCSITEND],0) && (self.aivar[AIV_MM_ORCSITSTART] != ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_allscheduler,1,"");
		return LOOP_END;
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(Wld_IsFPAvailable(self,"FP_CAMPFIRE"))
		{
			AI_GotoFP(self,"FP_CAMPFIRE");
		};
		if(Npc_IsOnFP(self,"FP_CAMPFIRE"))
		{
			AI_PlayAniBS(self,"T_STAND_2_GUARDSLEEP",BS_SIT);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	}
	else
	{
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_orcsit_end()
{
	AI_PlayAniBS(self,"T_GUARDSLEEP_2_STAND",BS_STAND);
};

