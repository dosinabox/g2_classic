
func void b_magecavetrigger()
{
	if((Npc_IsDead(magicgolem) == FALSE) && (MIS_SCHNITZELJAGD == LOG_RUNNING))
	{
		if(Hlp_IsValidNpc(agon) && !Npc_IsDead(agon))
		{
			AI_Teleport(agon,"NW_TROLLAREA_PATH_02");
			Npc_ExchangeRoutine(agon,"GOLEMLIVES");
			AI_ContinueRoutine(agon);
		};
	};
};

