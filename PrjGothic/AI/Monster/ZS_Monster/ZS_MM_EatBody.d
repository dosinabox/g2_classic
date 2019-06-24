
func void zs_mm_eatbody()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_assessdamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_mm_assessothersdamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_mm_assessothersdamage);
	AI_GotoNpc(self,other);
	AI_TurnToNPC(self,other);
	AI_PlayAni(self,"T_STAND_2_EAT");
	self.aivar[AIV_MM_PRIORITY] = PRIO_EAT;
	self.aivar[AIV_LASTBODY] = Hlp_GetInstanceID(other);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_mm_eatbody_loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		Npc_PercEnable(self,PERC_ASSESSENEMY,b_mm_assessenemy);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if(!Hlp_IsValidNpc(other))
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_mm_eatbody_end()
{
	AI_PlayAni(self,"T_EAT_2_STAND");
};

