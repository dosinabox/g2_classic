
func void zs_mm_threatenenemy()
{
	Npc_SetPercTime(self,2);
	Npc_PercEnable(self,PERC_ASSESSBODY,b_mm_assessbody);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_assessdamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_mm_assessothersdamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_mm_assessothersdamage);
	AI_Standup(self);
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
};

func int zs_mm_threatenenemy_loop()
{
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_MONSTER_ACTIVE_MAX)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if(Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_mm_attack,0,"");
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) >= MONSTER_THREATEN_TIME)
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_mm_attack,0,"");
		return LOOP_END;
	};
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_WARN");
	return LOOP_CONTINUE;
};

func void zs_mm_threatenenemy_end()
{
};

