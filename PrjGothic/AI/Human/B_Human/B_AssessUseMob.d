
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
		if(!Npc_IsDetectedMobOwnedByNpc(other,self))
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
	if(!Hlp_StrCmp(detmob,"CHESTBIG") && !Hlp_StrCmp(detmob,"CHESTSMALL"))
	{
		if(Hlp_StrCmp(detmob,"TOUCHPLATE"))
		{
			var C_NPC buergerin_4002;
			buergerin_4002 = Hlp_GetNpc(VLK_4002_Buergerin);
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(salandril))
			{
				b_attack(self,other,AR_USEMOB,0);
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(richter))
			{
				b_attack(self,other,AR_USEMOB,0);
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(buergerin_4002))
			{
				b_attack(self,other,AR_USEMOB,0);
			};
		}
		else if(Hlp_StrCmp(detmob,"LEVER"))
		{
			var C_NPC buergerin_4001;
			buergerin_4001 = Hlp_GetNpc(vlk_4001_buergerin);
			if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(valentino))
			{
				b_attack(self,other,AR_USEMOB,0);
			}
			else if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(buergerin_4001))
			{
				b_attack(self,other,AR_USEMOB,0);
			};
		};
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

