
func void b_assessusemob()
{
	var string detmob;
	if(!Npc_IsPlayer(other))
	{
		return;
	};
	if(Wld_GetPlayerPortalGuild() >= GIL_NONE)
	{
		if(Npc_GetHeightToNpc(self,other) > PERC_DIST_INDOOR_HEIGHT)
		{
			return;
		};
	};
	if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY)
	{
		if(Npc_IsDetectedMobOwnedByNpc(other,self))
		{
		}
		else
		{
			return;
		};
	};
	if(!c_isusedmobmypossession(self,other))
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
	detmob = Npc_GetDetectedMob(other);
	if((Hlp_StrCmp(detmob,"CHESTBIG") == FALSE) && (Hlp_StrCmp(detmob,"CHESTSMALL") == FALSE))
	{
		return;
	};
	if(!c_wanttoattackthief(self,other))
	{
		if(c_npcisgateguard(self))
		{
			b_memorizeplayercrime(self,other,CRIME_THEFT);
		};
		return;
	};
	b_attack(self,other,AR_USEMOB,0);
};

