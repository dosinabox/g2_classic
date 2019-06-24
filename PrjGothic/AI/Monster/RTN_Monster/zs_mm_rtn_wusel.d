
func void zs_mm_rtn_wusel()
{
	perception_set_monster_rtn();
	AI_SetWalkMode(self,NPC_RUN);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_GotoFP(self,"FP_ROAM");
};

func int zs_mm_rtn_wusel_loop()
{
	if(!Wld_IsTime(self.aivar[AIV_MM_WUSELSTART],0,self.aivar[AIV_MM_WUSELEND],0) && (self.aivar[AIV_MM_WUSELSTART] != ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_allscheduler,1,"");
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) >= 1)
	{
		if(Npc_IsOnFP(self,"FP_ROAM"))
		{
			if(Wld_IsNextFPAvailable(self,"FP_ROAM"))
			{
				Npc_ClearAIQueue(self);
				AI_GotoNextFP(self,"FP_ROAM");
			};
		}
		else if(!c_bodystatecontains(self,BS_WALK) && !c_bodystatecontains(self,BS_RUN))
		{
			AI_GotoFP(self,"FP_ROAM");
		};
		Npc_SetStateTime(self,0);
		self.aivar[AIV_TAPOSITION] = NOTINPOS;
	};
	return LOOP_CONTINUE;
};

func void zs_mm_rtn_wusel_end()
{
};

