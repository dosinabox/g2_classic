
func void b_stoplookat(var C_NPC slf)
{
	var C_NPC target;
	target = Npc_GetLookAtTarget(slf);
	if(Hlp_IsValidNpc(target))
	{
		AI_StopLookAt(slf);
	};
};

func void b_lookatnpc(var C_NPC slf,var C_NPC oth)
{
	b_stoplookat(slf);
	AI_LookAtNpc(slf,oth);
};

func void b_turntonpc(var C_NPC slf,var C_NPC oth)
{
	AI_TurnToNPC(slf,oth);
};

