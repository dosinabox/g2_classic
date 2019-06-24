
func void b_selectweapon(var C_NPC slf,var C_NPC oth)
{
	if(c_bodystatecontains(slf,BS_FALL) || c_bodystatecontains(slf,BS_SWIM) || c_bodystatecontains(slf,BS_DIVE))
	{
		return;
	};
	if(b_selectspell(slf,oth))
	{
		return;
	};
	if(Npc_IsInFightMode(slf,FMODE_MAGIC))
	{
		if(!Npc_IsInFightMode(slf,FMODE_NONE))
		{
			AI_RemoveWeapon(slf);
		};
		AI_ReadyMeleeWeapon(slf);
		return;
	};
	if(Npc_IsInFightMode(slf,FMODE_FAR))
	{
		if((Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER) || !Npc_HasEquippedMeleeWeapon(slf))
		{
			return;
		};
	};
	if(Npc_IsInFightMode(slf,FMODE_MELEE))
	{
		if((Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_RANGED_OUTER) || !Npc_HasEquippedRangedWeapon(slf))
		{
			return;
		};
	};
	if(Npc_HasEquippedMeleeWeapon(slf) && (Npc_GetDistToNpc(slf,oth) <= FIGHT_DIST_RANGED_OUTER))
	{
		if(!Npc_IsInFightMode(slf,FMODE_NONE))
		{
			AI_RemoveWeapon(slf);
		};
		AI_ReadyMeleeWeapon(slf);
		return;
	};
	if(Npc_HasEquippedRangedWeapon(slf) && (Npc_GetDistToNpc(slf,oth) > FIGHT_DIST_RANGED_INNER) && c_npchasattackreasontokill(slf))
	{
		if(!Npc_IsInFightMode(slf,FMODE_NONE))
		{
			AI_RemoveWeapon(slf);
		};
		AI_ReadyRangedWeapon(slf);
		return;
	};
	if(Npc_IsInFightMode(slf,FMODE_NONE))
	{
		if(Npc_HasEquippedMeleeWeapon(slf))
		{
			AI_ReadyMeleeWeapon(slf);
			return;
		};
		if(Npc_HasEquippedRangedWeapon(slf))
		{
			AI_ReadyRangedWeapon(slf);
			return;
		};
		AI_ReadyMeleeWeapon(slf);
		return;
	};
};

