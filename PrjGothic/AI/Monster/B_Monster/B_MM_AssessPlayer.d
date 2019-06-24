
func void b_mm_assessplayer()
{
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	if(c_npcisdown(other))
	{
		return;
	};
	b_assigndragontalk(self);
	if((Npc_GetDistToNpc(self,other) <= 700) && Npc_CheckInfo(self,1))
	{
		if((self.guild == GIL_DRAGON) || ((self.guild != GIL_DRAGON) && (Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG)))
		{
			if(!c_bodystatecontains(other,BS_FALL) && !c_bodystatecontains(other,BS_SWIM) && !c_bodystatecontains(other,BS_DIVE))
			{
				self.aivar[AIV_NPCSTARTEDTALK] = TRUE;
				b_assesstalk();
				return;
			};
		};
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if((Npc_GetDistToNpc(self,hero) < 500) && !c_bodystatecontains(self,BS_STAND))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			AI_TurnToNPC(self,hero);
		};
	};
};

