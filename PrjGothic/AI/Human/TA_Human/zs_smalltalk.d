
const int SMALLTALKFREQ = 4;

func void zs_smalltalk()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
};

func int zs_smalltalk_loop()
{
	if(Npc_IsOnFP(self,"SMALLTALK"))
	{
		if(Npc_GetStateTime(self) >= (SMALLTALKFREQ * 2))
		{
			Npc_PerceiveAll(self);
			if(Wld_DetectNpc(self,-1,zs_smalltalk,-1))
			{
				if(Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)
				{
					Npc_SetStateTime(other,SMALLTALKFREQ);
					b_turntonpc(self,other);
					b_say_smalltalk();
				};
			};
			Npc_SetStateTime(self,0);
		};
	}
	else if(Wld_IsFPAvailable(self,"SMALLTALK"))
	{
		AI_GotoFP(self,"SMALLTALK");
		AI_Standup(self);
		AI_AlignToFP(self);
	};
	return LOOP_CONTINUE;
};

func void zs_smalltalk_end()
{
};

