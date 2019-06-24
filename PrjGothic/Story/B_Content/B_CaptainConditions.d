
func int b_captainconditions(var C_NPC captain)
{
	if((KAPITEL == 5) && (SCGOTCAPTAIN == TRUE) && Npc_HasItems(hero,itwr_seamap_irdorath) && (CREWMEMBER_COUNT >= MIN_CREW) && (Npc_GetDistToWP(captain,"NW_WAITFOR_SHIP_CAPTAIN") < 2000) && ((MIS_SHIPISFREE == TRUE) || (Npc_IsDead(schiffswache_212) && Npc_IsDead(schiffswache_213))))
	{
		MIS_SHIPISFREE = TRUE;
		return TRUE;
	};
};

