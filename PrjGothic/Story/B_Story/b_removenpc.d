
func void b_removenpc(var int npcinstance)
{
	var C_NPC npc;
	npc = Hlp_GetNpc(npcinstance);
	if(Hlp_IsValidNpc(npc) && !Npc_IsDead(npc))
	{
		npc.flags = 0;
		AI_Teleport(npc,"TOT");
		b_startotherroutine(npc,"TOT");
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
		AI_Teleport(npc,"TOT");
	};
};

