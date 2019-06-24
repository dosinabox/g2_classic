
func void b_usefakescroll()
{
	var C_NPC target;
	if(c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		b_turntonpc(self,hero);
	};
	AI_RemoveWeapon(self);
	CreateInvItem(self,fakescroll);
	target = Npc_GetLookAtTarget(self);
	if(Hlp_IsValidNpc(target))
	{
		b_stoplookat(self);
		AI_UseItemToState(self,fakescroll,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,fakescroll,-1);
		b_lookatnpc(self,hero);
	}
	else
	{
		AI_UseItemToState(self,fakescroll,1);
		AI_Wait(self,1);
		AI_UseItemToState(self,fakescroll,-1);
	};
};

