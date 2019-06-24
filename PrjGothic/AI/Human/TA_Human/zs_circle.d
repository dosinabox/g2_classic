
func void zs_circle()
{
	perception_set_normal();
	b_resetall(self);
	Npc_SetPercTime(self,0.3);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int zs_circle_loop()
{
	var int randy;
	if(self.guild == GIL_DMT)
	{
		randy = Hlp_Random(3000);
		if(Npc_GetStateTime(self) > randy)
		{
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
		};
	}
	else if(MIS_RITUALINNOSEYEREPAIR != LOG_SUCCESS)
	{
		randy = Hlp_Random(1000);
		if(Npc_GetStateTime(self) > randy)
		{
			Npc_SetStateTime(self,0);
			Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
			Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
			AI_PlayAni(self,"T_PRACTICEMAGIC5");
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(xardas))
			{
				Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(pyrokar))
			{
				Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
			}
			else
			{
				Wld_PlayEffect("spellFX_INCOVATION_BLUE",self,self,0,0,0,FALSE);
			};
		};
	};
	return LOOP_CONTINUE;
};

func void zs_circle_end()
{
};

