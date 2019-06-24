
func void zs_mm_allscheduler()
{
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	if(Wld_IsTime(self.aivar[AIV_MM_SLEEPSTART],0,self.aivar[AIV_MM_SLEEPEND],0) || (self.aivar[AIV_MM_SLEEPSTART] == ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_rtn_sleep,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_RESTSTART],0,self.aivar[AIV_MM_RESTEND],0) || (self.aivar[AIV_MM_RESTSTART] == ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_rtn_rest,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_ROAMSTART],0,self.aivar[AIV_MM_ROAMEND],0) || (self.aivar[AIV_MM_ROAMSTART] == ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_rtn_roam,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_EATGROUNDSTART],0,self.aivar[AIV_MM_EATGROUNDEND],0) || (self.aivar[AIV_MM_EATGROUNDSTART] == ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_rtn_eatground,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_WUSELSTART],0,self.aivar[AIV_MM_WUSELEND],0) || (self.aivar[AIV_MM_WUSELSTART] == ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_rtn_wusel,1,"");
	}
	else if(Wld_IsTime(self.aivar[AIV_MM_ORCSITSTART],0,self.aivar[AIV_MM_ORCSITEND],0) || (self.aivar[AIV_MM_ORCSITSTART] == ONLYROUTINE))
	{
		AI_StartState(self,zs_mm_rtn_orcsit,1,"");
	}
	else
	{
		AI_StartState(self,zs_mm_rtn_rest,1,"");
	};
};

