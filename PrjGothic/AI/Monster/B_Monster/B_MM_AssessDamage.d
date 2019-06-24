
func void b_mm_assessdamage()
{
	var C_NPC maggol;
	var C_ITEM othweap;
	self.aivar[AIV_MM_PRIORITY] = PRIO_ATTACK;
	if(Npc_HasItems(other,holy_hammer_mis) > 0)
	{
		maggol = Hlp_GetNpc(magicgolem);
		Npc_GetInvItem(other,holy_hammer_mis);
		othweap = Npc_GetReadiedWeapon(other);
		if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(maggol)) && (Hlp_GetInstanceID(othweap) == Hlp_GetInstanceID(item)))
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-1000);
			return;
		};
	};
	if(c_predatorfoundprey(other,self))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		b_clearperceptions(self);
		AI_StartState(self,zs_mm_flee,0,"");
		return;
	};
	if(Npc_IsInState(self,zs_mm_attack))
	{
		if(Npc_IsPlayer(other) && (self.aivar[AIV_PARTYMEMBER] == TRUE))
		{
			return;
		};
		if((self.aivar[AIV_MM_REAL_ID] == ID_SKELETON) && (other.aivar[AIV_MM_REAL_ID] == ID_SKELETON_MAGE))
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
	Npc_ClearAIQueue(self);
	Npc_SetTarget(self,other);
	b_clearperceptions(self);
	AI_StartState(self,zs_mm_attack,0,"");
};

