
func void b_assessthreat()
{
	if(!Npc_CanSeeNpc(self,other))
	{
		return;
	};
	if(!c_npcisbotheredbyweapon(self,other))
	{
		return;
	};
	Npc_ClearAIQueue(self);
	b_clearperceptions(self);
	AI_StartState(self,zs_reacttoweapon,0,"");
};

