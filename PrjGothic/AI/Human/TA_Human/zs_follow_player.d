
func void zs_follow_player()
{
	perception_set_minimal();
	b_resetall(self);
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assessplayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
};

func int zs_follow_player_loop()
{
	if(Npc_GetDistToNpc(self,hero) > 500)
	{
		if(!c_bodystatecontains(self,BS_SWIM))
		{
			AI_SetWalkMode(self,NPC_RUN);
		};
		AI_GotoNpc(self,hero);
	}
	else if(Npc_GetStateTime(self) > 1)
	{
		if(!Npc_CanSeeNpc(self,hero))
		{
			b_turntonpc(self,hero);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void zs_follow_player_end()
{
};

