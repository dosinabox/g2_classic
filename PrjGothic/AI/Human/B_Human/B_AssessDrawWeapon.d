
func int b_assessdrawweapon()
{
	if(Npc_IsInFightMode(other,FMODE_NONE))
	{
		return FALSE;
	};
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_DIALOG)
	{
		return FALSE;
	};
	if(!c_npcisbotheredbyweapon(self,other))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,zs_reacttoweapon))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,zs_observeplayer) && Npc_WasInState(self,zs_watchfight))
	{
		return FALSE;
	};
	if(!Npc_CanSeeNpc(self,other))
	{
		return FALSE;
	};
	Npc_ClearAIQueue(self);
	b_clearperceptions(self);
	AI_StartState(self,zs_reacttoweapon,0,"");
	return TRUE;
};

