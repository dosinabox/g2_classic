
func void b_killnpc(var int npcinstance)
{
	var C_NPC npc;
	npc = Hlp_GetNpc(npcinstance);
	if(Hlp_IsValidNpc(npc) && !Npc_IsDead(npc))
	{
		npc.flags = 0;
		CreateInvItem(npc,itmi_oldcoin);
		Npc_ChangeAttribute(npc,ATR_HITPOINTS,-npc.attribute[ATR_HITPOINTS_MAX]);
	};
};

