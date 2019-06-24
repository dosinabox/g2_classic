
func void b_mm_assessbody()
{
	var C_NPC stoerenfried;
	if(self.guild > GIL_SEPERATOR_ORC)
	{
		return;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	if(self.aivar[AIV_MM_PRIORITY] == PRIO_ATTACK)
	{
		return;
	};
	if(!c_wanttoeat(self,other))
	{
		return;
	};
	if(Npc_IsInState(self,zs_mm_attack))
	{
		stoerenfried = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
		if(Npc_GetDistToNpc(stoerenfried,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
		{
			return;
		};
	};
	Npc_ClearAIQueue(self);
	b_clearperceptions(self);
	AI_StartState(self,zs_mm_eatbody,0,"");
};

