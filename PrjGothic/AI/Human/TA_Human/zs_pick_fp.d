
func void zs_pick_fp()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_pick_fp_loop()
{
	if((Npc_GetStateTime(self) >= 7) && Hlp_Random(2))
	{
		if(Npc_IsOnFP(self,"PICK") && Wld_IsFPAvailable(self,"PICK"))
		{
			AI_GotoNextFP(self,"PICK");
			AI_PlayAni(self,"T_PLUNDER");
			Npc_SetStateTime(self,0);
		}
		else if(Npc_IsOnFP(self,"PICK"))
		{
			AI_PlayAni(self,"T_PLUNDER");
			Npc_SetStateTime(self,0);
		};
		AI_SetWalkMode(self,NPC_WALK);
	}
	else if(Npc_GetStateTime(self) >= 7)
	{
		if(Npc_IsOnFP(self,"PICK"))
		{
			AI_PlayAni(self,"T_PLUNDER");
		};
		AI_SetWalkMode(self,NPC_WALK);
	};
	if(!Npc_IsOnFP(self,"PICK") && Wld_IsFPAvailable(self,"PICK"))
	{
		AI_GotoFP(self,"PICK");
	};
	return LOOP_CONTINUE;
};

func void zs_pick_fp_end()
{
};

