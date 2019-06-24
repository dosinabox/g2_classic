
func void b_createammo(var C_NPC slf)
{
	var C_ITEM rangedweapon;
	if(Npc_IsInFightMode(slf,FMODE_FAR))
	{
		rangedweapon = Npc_GetReadiedWeapon(slf);
	}
	else if(Npc_HasEquippedRangedWeapon(slf))
	{
		rangedweapon = Npc_GetEquippedRangedWeapon(slf);
	}
	else
	{
		return;
	};
	if(rangedweapon.munition == itrw_arrow)
	{
		if(Npc_HasItems(slf,itrw_arrow) < 10)
		{
			CreateInvItems(slf,itrw_arrow,10);
		};
	}
	else if(rangedweapon.munition == itrw_bolt)
	{
		if(Npc_HasItems(slf,itrw_bolt) < 10)
		{
			CreateInvItems(slf,itrw_bolt,10);
		};
	};
};

