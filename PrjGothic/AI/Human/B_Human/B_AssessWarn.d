
func void b_assesswarn()
{
	if(Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(self))
	{
		return;
	};
	if(Npc_IsInState(self,zs_reacttoweapon) || Npc_IsInState(self,zs_observeplayer))
	{
		return;
	};
	if(other.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};
	if(c_npcisgateguard(self))
	{
		return;
	};
	Npc_ClearAIQueue(self);
	b_clearperceptions(self);
	AI_StartState(self,zs_observeplayer,0,"");
};

