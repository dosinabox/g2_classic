
func void b_refreshatinsert()
{
	var C_NPC her;
	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		return;
	};
	her = Hlp_GetNpc(pc_hero);
	if((self.guild < GIL_SEPERATOR_HUM) && (Hlp_GetInstanceID(self) != Hlp_GetInstanceID(her)))
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
		if(Npc_HasEquippedWeapon(self) == FALSE)
		{
			if(self.guild == GIL_MIL)
			{
				CreateInvItems(self,itmw_1h_bau_mace,1);
			};
			if(self.guild == GIL_PAL)
			{
				CreateInvItems(self,itmw_1h_bau_mace,1);
			};
			if(self.guild == GIL_SLD)
			{
				CreateInvItems(self,itmw_1h_bau_mace,1);
			};
			if(self.guild == GIL_BAU)
			{
				CreateInvItems(self,itmw_1h_bau_mace,1);
			};
			if(self.guild == GIL_NOV)
			{
				CreateInvItems(self,itmw_1h_bau_mace,1);
			};
		};
	};
};

