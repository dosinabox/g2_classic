
func void b_startotherroutine(var C_NPC slf,var string newroutine)
{
	AI_Standup(slf);
	if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(slf))
	{
		if(Hlp_IsValidNpc(slf) && !Npc_IsDead(slf))
		{
			Npc_ExchangeRoutine(slf,newroutine);
			AI_ContinueRoutine(slf);
		};
	}
	else
	{
		Npc_ExchangeRoutine(slf,newroutine);
	};
};

