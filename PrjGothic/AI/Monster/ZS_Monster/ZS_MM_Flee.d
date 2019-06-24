
func void zs_mm_flee()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	b_validateother();
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
	b_mm_desynchronize();
};

func int zs_mm_flee_loop()
{
	Npc_GetTarget(self);
	if(Npc_GetDistToNpc(self,other) < 2000)
	{
		if(Npc_GetStateTime(self) > 0)
		{
			Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
			Npc_SetStateTime(self,0);
		};
		AI_Flee(self);
		return LOOP_CONTINUE;
	}
	else
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
};

func void zs_mm_flee_end()
{
};

