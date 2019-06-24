
func int b_assessenterroom()
{
	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();
	if(Npc_IsPlayer(other) && (PLAYER_LEFTROOMCOMMENT == TRUE) && (portalguild > GIL_NONE) && (portalguild != GIL_PUBLIC))
	{
		PLAYER_LEFTROOMCOMMENT = FALSE;
	};
	if(Npc_GetDistToNpc(self,other) > 1000)
	{
		return FALSE;
	};
	if(!Npc_IsInPlayersRoom(self) && !(Npc_GetPortalGuild(self) < GIL_NONE))
	{
		return FALSE;
	};
	if(Npc_IsInState(self,zs_attack))
	{
		return FALSE;
	};
	if(c_npcisgateguard(self))
	{
		return FALSE;
	};
	if(!Npc_IsPlayer(other))
	{
		return FALSE;
	};
	if(self.npctype == NPCTYPE_FRIEND)
	{
		return FALSE;
	};
	if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
	{
		return FALSE;
	};
	if(c_bodystatecontains(other,BS_SNEAK) || c_bodystatecontains(other,BS_STAND))
	{
		if(!Npc_CanSeeNpc(self,other) && !Npc_IsInState(self,zs_observeplayer))
		{
			return FALSE;
		};
	};
	if(self.guild == GIL_NONE)
	{
		return FALSE;
	};
	if(!Npc_IsInPlayersRoom(self) && Npc_IsInState(self,zs_sleep))
	{
		return FALSE;
	};
	if((portalguild == GIL_PUBLIC) && Npc_IsInPlayersRoom(self))
	{
		if(Npc_IsInState(self,zs_observeplayer))
		{
			return FALSE;
		};
		if(c_bodystatecontains(self,BS_LIE))
		{
			b_mm_desynchronize();
		};
		if(Npc_IsInState(self,zs_potion_alchemy) || Npc_IsInState(self,zs_read_bookstand) || Npc_IsInState(self,zs_sit_bench) || Npc_IsInState(self,zs_sit_campfire) || Npc_IsInState(self,zs_sit_chair) || Npc_IsInState(self,zs_sit_throne) || Npc_IsInState(self,zs_sleep) || Npc_IsInState(self,zs_smalltalk) || Npc_IsInState(self,zs_smoke_joint) || Npc_IsInState(self,zs_stand_armscrossed) || Npc_IsInState(self,zs_stand_drinking) || Npc_IsInState(self,zs_stand_eating) || Npc_IsInState(self,zs_stand_guarding) || Npc_IsInState(self,zs_stand_wp))
		{
			Npc_ClearAIQueue(self);
			b_clearperceptions(self);
			if(c_bodystatecontains(self,BS_SIT))
			{
				AI_StartState(self,zs_observeplayer,0,"");
			}
			else
			{
				AI_StartState(self,zs_observeplayer,1,"");
			};
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	if(c_npcisbotheredbyplayerroomguild(self))
	{
		Npc_ClearAIQueue(self);
		b_clearperceptions(self);
		AI_StartState(self,zs_clearroom,1,"");
		return TRUE;
	};
	return FALSE;
};

func void b_assessportalcollision()
{
	var int formerportalguild;
	formerportalguild = Wld_GetFormerPlayerPortalGuild();
	if(b_assessenterroom())
	{
		return;
	};
	if(!Npc_CanSeeNpc(self,other) && (c_bodystatecontains(other,BS_SNEAK) || c_bodystatecontains(other,BS_STAND)))
	{
		return;
	};
	Npc_PerceiveAll(self);
	if(Wld_DetectNpcEx(self,-1,zs_clearroom,-1,FALSE))
	{
		return;
	};
	if((self.guild == formerportalguild) || (Wld_GetGuildAttitude(self.guild,formerportalguild) == ATT_FRIENDLY))
	{
		if((Wld_GetGuildAttitude(self.guild,other.guild) == ATT_FRIENDLY) || (Npc_IsPlayer(other) && (self.npctype == NPCTYPE_FRIEND)))
		{
			return;
		};
		if(self.guild == GIL_NONE)
		{
			return;
		};
		if(((formerportalguild == GIL_MIL) || (formerportalguild == GIL_SLD)) && (Wld_GetGuildAttitude(self.guild,formerportalguild) == ATT_FRIENDLY))
		{
			b_attack(self,other,AR_LEFTPORTALROOM,0);
			return;
		}
		else
		{
			self.aivar[AIV_SEENLEFTROOM] = TRUE;
			Npc_ClearAIQueue(self);
			b_clearperceptions(self);
			AI_StartState(self,zs_observeplayer,0,"");
			return;
		};
	};
};

