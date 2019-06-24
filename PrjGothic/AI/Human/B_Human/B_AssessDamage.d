
func void b_assessdamage()
{
	if(Npc_IsPlayer(self))
	{
		return;
	};
	if(self.aivar[AIV_ARENAFIGHT] == AF_AFTER)
	{
		self.aivar[AIV_ARENAFIGHT] = AF_AFTER_PLUS_DAMAGE;
	};
	if(Npc_IsInState(self,zs_attack))
	{
		if(Npc_IsPlayer(other) && (self.npctype == NPCTYPE_FRIEND))
		{
			return;
		};
		if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
		{
			return;
		};
		if(Hlp_GetInstanceID(other) != self.aivar[AIV_LASTTARGET])
		{
			if(self.aivar[AIV_HITBYOTHERNPC] == Hlp_GetInstanceID(other))
			{
				Npc_SetTarget(self,other);
			}
			else
			{
				self.aivar[AIV_HITBYOTHERNPC] = Hlp_GetInstanceID(other);
			};
		};
		return;
	};
	if(b_assessenemy())
	{
		return;
	};
	if(Npc_IsInFightMode(other,FMODE_MELEE) || Npc_IsInFightMode(other,FMODE_FIST) || Npc_IsInFightMode(other,FMODE_NONE))
	{
		if((Npc_GetAttitude(self,other) == ATT_FRIENDLY) || ((self.npctype == NPCTYPE_FRIEND) && Npc_IsPlayer(other)))
		{
			if(!Npc_IsInState(self,zs_reacttodamage))
			{
				Npc_ClearAIQueue(self);
				b_clearperceptions(self);
				AI_StartState(self,zs_reacttodamage,0,"");
				return;
			};
		};
	};
	b_attack(self,other,AR_REACTTODAMAGE,0);
};

