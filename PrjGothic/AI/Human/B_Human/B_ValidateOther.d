
func void b_validateother()
{
	if(!Hlp_IsValidNpc(other))
	{
		OTHER = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
		Npc_SetTarget(self,other);
		self.aivar[AIV_LOADGAME] = TRUE;
	}
	else
	{
		Npc_GetTarget(self);
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
		self.aivar[AIV_LOADGAME] = FALSE;
	};
};

