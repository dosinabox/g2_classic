
func void b_assesstheft()
{
	if(!Npc_IsPlayer(other))
	{
		return;
	};
	if((Wld_GetPlayerPortalGuild() >= GIL_NONE) && (Npc_GetHeightToNpc(self,other) > PERC_DIST_INDOOR_HEIGHT))
	{
		return;
	};
	if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		if(Hlp_IsValidItem(item) && Npc_OwnedByNpc(item,self))
		{
		}
		else
		{
			return;
		};
	};
	if(!c_istakenitemmypossession(self,other,item))
	{
		return;
	};
	if(!Npc_CanSeeNpc(self,other))
	{
		if(Npc_IsInPlayersRoom(self) && (Npc_IsInState(self,zs_observeplayer) || Npc_IsInState(self,zs_clearroom)))
		{
		}
		else
		{
			return;
		};
	};
	if(!c_wanttoattackthief(self,other))
	{
		if(c_npcisgateguard(self))
		{
			b_memorizeplayercrime(self,other,CRIME_THEFT);
		};
		return;
	};
	b_attack(self,other,AR_THEFT,0);
};

