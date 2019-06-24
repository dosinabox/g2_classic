
func void b_mm_assesswarn()
{
	if(self.guild > GIL_SEPERATOR_ORC)
	{
		if(Npc_IsInState(self,zs_mm_attack))
		{
			return;
		};
		if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,victim);
			b_clearperceptions(self);
			AI_StartState(self,zs_mm_attack,0,"");
			return;
		};
		return;
	};
	if(other.guild < GIL_SEPERATOR_HUM)
	{
		return;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	if(Npc_IsInState(self,zs_mm_attack))
	{
		if(c_predatorfoundprey(self,other) && (self.aivar[AIV_MM_PRIORITY] == PRIO_EAT))
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
		}
		else
		{
			OTHER = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
		};
		return;
	};
	if((self.guild == other.guild) && (self.aivar[AIV_MM_PACKHUNTER] == TRUE))
	{
		if((self.guild == GIL_WOLF) && (victim.guild == GIL_WOLF) && Npc_IsPlayer(victim))
		{
			return;
		};
		if(Npc_IsInState(other,zs_mm_attack))
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,victim);
			b_clearperceptions(self);
			AI_StartState(self,zs_mm_attack,0,"");
			return;
		};
		if(Npc_IsInState(other,zs_mm_threatenenemy))
		{
			AI_SetWalkMode(self,NPC_RUN);
			AI_GotoNpc(self,victim);
			return;
		};
	};
};

