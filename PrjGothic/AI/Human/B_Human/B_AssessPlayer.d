
func void b_assessplayer()
{
	var C_NPC pcl;
	pcl = Hlp_GetNpc(pc_levelinspektor);
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		return;
	};
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	if(c_npcisdown(other))
	{
		return;
	};
	if(other.guild > GIL_SEPERATOR_HUM)
	{
		if(c_npcisgateguard(self))
		{
			AI_StandupQuick(self);
			b_attack(self,other,AR_MONSTERCLOSETOGATE,0);
			return;
		}
		else if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_HOSTILE)
		{
			if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (self.npctype != NPCTYPE_FRIEND))
			{
				b_attack(self,other,AR_GUILDENEMY,0);
				return;
			};
		};
	};
	if(b_assessenemy())
	{
		return;
	};
	if((b_getplayercrime(self) == CRIME_MURDER) && c_wanttoattackmurder(self,other) && (Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT))
	{
		b_attack(self,other,AR_HUMANMURDEREDHUMAN,0);
		return;
	};
	if(b_assessenterroom())
	{
		return;
	};
	if(b_assessdrawweapon())
	{
		return;
	}
	else
	{
		PLAYER_DRAWWEAPONCOMMENT = FALSE;
	};
	if(c_bodystatecontains(other,BS_SNEAK))
	{
		if(!Npc_IsInState(self,zs_observeplayer) && c_wanttoreacttosneaker(self,other))
		{
			Npc_ClearAIQueue(self);
			b_clearperceptions(self);
			AI_StartState(self,zs_observeplayer,1,"");
			return;
		};
	}
	else if(!c_bodystatecontains(other,BS_STAND))
	{
		PLAYER_SNEAKERCOMMENT = FALSE;
	};
	if(!c_bodystatecontains(other,BS_LIE))
	{
		PLAYER_GETOUTOFMYBEDCOMMENT = FALSE;
	};
	b_assigndementortalk(self);
	if((Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG) && Npc_CheckInfo(self,1))
	{
		if(c_npcisgateguard(self))
		{
			self.aivar[AIV_NPCSTARTEDTALK] = TRUE;
			b_assesstalk();
			return;
		}
		else if(!c_bodystatecontains(other,BS_FALL) && !c_bodystatecontains(other,BS_SWIM) && !c_bodystatecontains(other,BS_DIVE) && (b_getplayercrime(self) == CRIME_NONE) && (c_refusetalk(self) == FALSE))
		{
			self.aivar[AIV_NPCSTARTEDTALK] = TRUE;
			b_assesstalk();
			return;
		};
	};
	if(c_bodystatecontains(self,BS_WALK) && (Npc_GetDistToNpc(self,other) <= PERC_DIST_DIALOG) && (Npc_RefuseTalk(other) == FALSE) && !c_npcisgateguard(self))
	{
		b_lookatnpc(self,other);
		b_say_guildgreetings(self,other);
		b_stoplookat(self);
		Npc_SetRefuseTalk(other,20);
	};
	if(c_npcisgateguard(self) && (Npc_GetDistToNpc(self,other) > PERC_DIST_DIALOG))
	{
		self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	};
};

