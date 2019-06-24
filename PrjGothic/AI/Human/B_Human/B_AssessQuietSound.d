
func void b_assessquietsound()
{
	if(!Hlp_IsValidNpc(other))
	{
		return;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	if((Wld_GetPlayerPortalGuild() >= GIL_NONE) && (Npc_GetHeightToNpc(self,other) > PERC_DIST_INDOOR_HEIGHT))
	{
		return;
	};
	if(b_assessenterroom())
	{
		return;
	};
	if(c_npcisgateguard(self))
	{
		return;
	};
	if((Npc_GetAttitude(self,other) != ATT_HOSTILE) && (Npc_CheckInfo(self,1) == FALSE))
	{
		return;
	};
	if((Npc_GetAttitude(self,other) == ATT_HOSTILE) && (self.aivar[AIV_ENEMYOVERRIDE] == TRUE))
	{
		return;
	};
	if(Npc_CanSeeSource(self))
	{
		return;
	};
	Npc_ClearAIQueue(self);
	b_clearperceptions(self);
	AI_StartState(self,zs_observeplayer,1,"");
};

