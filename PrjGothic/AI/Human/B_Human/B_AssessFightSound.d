
func void b_assessfightsound()
{
	if(!Hlp_IsValidNpc(victim))
	{
		return;
	};
	if((Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT))
	{
		if(((victim.guild == GIL_OUT) || (other.guild == GIL_OUT)) && (self.guild == GIL_OUT))
		{
		}
		else
		{
			return;
		};
	};
	if((other.fight_tactic == FAI_NAILED) || (victim.fight_tactic == FAI_NAILED))
	{
		return;
	};
	if((Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT) && (Npc_GetHeightToNpc(self,victim) > PERC_DIST_HEIGHT))
	{
		return;
	};
	if((Npc_GetHeightToNpc(self,other) > 500) && (Npc_GetDistToWP(self,"NW_MONASTERY_PLACE_04") <= 3000))
	{
		return;
	};
	if((Hlp_GetInstanceID(victim) == Hlp_GetInstanceID(self)) || (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(self)))
	{
		return;
	};
	if((victim.guild == GIL_SHEEP) && (victim.aivar[AIV_TOUGHGUY] == FALSE))
	{
		if(c_wanttoattacksheepkiller(self,other))
		{
			b_attack(self,other,AR_SHEEPKILLER,0);
			return;
		}
		else if(c_npcisgateguard(self))
		{
			b_memorizeplayercrime(self,other,CRIME_SHEEPKILLER);
			return;
		};
		return;
	};
	if(c_npcisgateguard(self))
	{
		return;
	};
	if((other.guild > GIL_SEPERATOR_HUM) && (victim.guild > GIL_SEPERATOR_HUM))
	{
		return;
	};
	if((other.guild > GIL_SEPERATOR_HUM) && (Npc_GetAttitude(self,victim) != ATT_HOSTILE))
	{
		b_attack(self,other,AR_MONSTERVSHUMAN,0);
		return;
	};
	if((victim.guild > GIL_SEPERATOR_HUM) && (Npc_GetAttitude(self,other) != ATT_HOSTILE) && !Npc_IsDead(victim))
	{
		b_attack(self,victim,AR_MONSTERVSHUMAN,0);
		return;
	};
	if((self.aivar[AIV_ENEMYOVERRIDE] == TRUE) && (Npc_GetDistToNpc(self,victim) <= PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT))
	{
		self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		if(Hlp_IsValidNpc(other) && !c_npcisdown(other))
		{
			b_attack(self,other,AR_GUILDENEMY,0);
			return;
		};
		return;
	};
	if(((other.aivar[AIV_ATTACKREASON] == AR_GUARDSTOPSINTRUDER) || (other.aivar[AIV_ATTACKREASON] == AR_MONSTERCLOSETOGATE) || (other.aivar[AIV_ATTACKREASON] == AR_HUMANMURDEREDHUMAN) || (other.aivar[AIV_ATTACKREASON] == AR_GUILDENEMY) || (other.aivar[AIV_ATTACKREASON] == AR_GUARDCALLEDTOKILL)) && (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		b_attack(self,victim,AR_GUARDCALLEDTOKILL,0);
		return;
	};
	if(((victim.aivar[AIV_ATTACKREASON] == AR_GUARDSTOPSINTRUDER) || (victim.aivar[AIV_ATTACKREASON] == AR_MONSTERCLOSETOGATE) || (victim.aivar[AIV_ATTACKREASON] == AR_HUMANMURDEREDHUMAN) || (victim.aivar[AIV_ATTACKREASON] == AR_GUILDENEMY) || (victim.aivar[AIV_ATTACKREASON] == AR_GUARDCALLEDTOKILL)) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		b_attack(self,other,AR_GUARDCALLEDTOKILL,0);
		return;
	};
	if(((other.aivar[AIV_ATTACKREASON] == AR_GUARDSTOPSFIGHT) || (other.aivar[AIV_ATTACKREASON] == AR_REACTTODAMAGE) || (other.aivar[AIV_ATTACKREASON] == AR_REACTTOWEAPON)) && (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		if(((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE)) && ((victim.guild == GIL_SLD) || (victim.guild == GIL_DJG) || (victim.guild == GIL_NONE)))
		{
		}
		else if(!Npc_IsPlayer(other) && !Npc_IsPlayer(victim))
		{
		}
		else
		{
			b_attack(self,victim,AR_GUARDSTOPSFIGHT,0);
			return;
		};
	};
	if(((victim.aivar[AIV_ATTACKREASON] == AR_GUARDSTOPSFIGHT) || (victim.aivar[AIV_ATTACKREASON] == AR_REACTTODAMAGE) || (victim.aivar[AIV_ATTACKREASON] == AR_REACTTOWEAPON)) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		if(((other.guild == GIL_SLD) || (other.guild == GIL_DJG) || (other.guild == GIL_NONE)) && ((victim.guild == GIL_SLD) || (victim.guild == GIL_DJG) || (victim.guild == GIL_NONE)))
		{
		}
		else if(!Npc_IsPlayer(other) && !Npc_IsPlayer(victim))
		{
		}
		else
		{
			b_attack(self,other,AR_GUARDSTOPSFIGHT,0);
			return;
		};
	};
	if((other.aivar[AIV_ATTACKREASON] == AR_NONE) && (victim.aivar[AIV_ATTACKREASON] == AR_NONE) && (self.guild == GIL_MIL))
	{
		if((Npc_GetAttitude(self,other) == ATT_FRIENDLY) && (Npc_GetAttitude(self,victim) != ATT_FRIENDLY))
		{
			b_attack(self,victim,AR_GUARDSTOPSFIGHT,0);
			return;
		}
		else if((Npc_GetAttitude(self,victim) == ATT_FRIENDLY) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY))
		{
			b_attack(self,other,AR_GUARDSTOPSFIGHT,0);
			return;
		}
		else if(Npc_IsPlayer(other))
		{
			b_attack(self,victim,AR_GUARDSTOPSFIGHT,0);
			return;
		}
		else if(Npc_IsPlayer(victim))
		{
			b_attack(self,other,AR_GUARDSTOPSFIGHT,0);
			return;
		}
		else
		{
			b_attack(self,other,AR_GUARDSTOPSFIGHT,0);
			return;
		};
	};
	if(((other.aivar[AIV_ATTACKREASON] == AR_USEMOB) || (other.aivar[AIV_ATTACKREASON] == AR_THEFT) || (other.aivar[AIV_ATTACKREASON] == AR_LEFTPORTALROOM)) && (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		if(c_wanttoattackthief(self,victim))
		{
			b_attack(self,victim,AR_GUARDCALLEDTOTHIEF,0);
		};
		return;
	};
	if(((victim.aivar[AIV_ATTACKREASON] == AR_USEMOB) || (victim.aivar[AIV_ATTACKREASON] == AR_THEFT) || (victim.aivar[AIV_ATTACKREASON] == AR_LEFTPORTALROOM)) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		if(c_wanttoattackthief(self,other))
		{
			b_attack(self,other,AR_GUARDCALLEDTOTHIEF,0);
		};
		return;
	};
	if((other.aivar[AIV_ATTACKREASON] == AR_CLEARROOM) && (Npc_GetAttitude(self,other) == ATT_FRIENDLY))
	{
		b_attack(self,victim,AR_GUARDCALLEDTOROOM,0);
		return;
	};
	if((victim.aivar[AIV_ATTACKREASON] == AR_CLEARROOM) && (Npc_GetAttitude(self,victim) == ATT_FRIENDLY))
	{
		b_attack(self,other,AR_GUARDCALLEDTOROOM,0);
		return;
	};
	if((Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT))
	{
		return;
	};
	if(!Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return;
	};
	Npc_ClearAIQueue(self);
	b_clearperceptions(self);
	AI_StartState(self,zs_watchfight,0,"");
};

