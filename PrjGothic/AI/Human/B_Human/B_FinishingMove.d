
func void b_finishingmove(var C_NPC slf,var C_NPC oth)
{
	if(!Npc_IsInFightMode(slf,FMODE_MELEE))
	{
		Npc_SetToFightMode(slf,itmw_1h_misc_sword);
	};
	AI_FinishingMove(slf,oth);
};

