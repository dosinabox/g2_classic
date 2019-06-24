
func void b_assessmagic()
{
	if(Npc_GetActiveSpellCat(other) == SPELL_BAD)
	{
		Npc_SendPassivePerc(self,PERC_ASSESSFIGHTSOUND,self,other);
	};
	if((Npc_GetActiveSpell(other) == SPL_ICECUBE) || (Npc_GetActiveSpell(other) == SPL_ICEWAVE))
	{
		Npc_ClearAIQueue(self);
		b_clearperceptions(self);
		AI_StartState(self,zs_magicfreeze,0,"");
		return;
	};
	if(Npc_GetActiveSpell(other) == SPL_CHARGEZAP)
	{
		Npc_ClearAIQueue(self);
		b_clearperceptions(self);
		AI_StartState(self,zs_shortzapped,0,"");
		return;
	};
	if(Npc_GetActiveSpell(other) == SPL_FEAR)
	{
		Npc_ClearAIQueue(self);
		b_clearperceptions(self);
		Npc_SetTarget(self,other);
		if((self.guild < GIL_SEPERATOR_HUM) && (self.guild != GIL_KDF) && (self.guild != GIL_PAL))
		{
			AI_StartState(self,zs_magicflee,0,"");
			return;
		}
		else if(self.guild > GIL_SEPERATOR_HUM)
		{
			AI_StartState(self,zs_mm_flee,0,"");
			return;
		};
	};
	if(Npc_GetActiveSpell(other) == SPL_FIRERAIN)
	{
		Npc_ClearAIQueue(self);
		AI_StartState(self,zs_magicburnshort,0,"");
		return;
	};
};


const func PLAYER_PERC_ASSESSMAGIC = B_ASSESSMAGIC;
