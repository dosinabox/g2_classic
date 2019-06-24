
func void b_mm_assessenemy()
{
	var C_NPC pcl;
	if((self.guild == GIL_DRAGON) && (Npc_HasItems(hero,itmi_innoseye_mis) >= 1))
	{
		return;
	};
	if((self.aivar[AIV_ENEMYOVERRIDE] == TRUE) && (other.guild < GIL_SEPERATOR_HUM))
	{
		return;
	};
	pcl = Hlp_GetNpc(pc_levelinspektor);
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		return;
	};
	if(Npc_GetDistToWP(self,"OC_RAMP_07") <= 500)
	{
		return;
	};
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	if((c_bodystatecontains(other,BS_SWIM) || c_bodystatecontains(other,BS_DIVE)) && (self.aivar[AIV_MM_FOLLOWINWATER] == FALSE))
	{
		return;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return;
	};
	if(Npc_IsPlayer(other) && (other.guild > GIL_SEPERATOR_HUM))
	{
		if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
		{
			return;
		};
	};
	if(self.senses_range > PERC_DIST_MONSTER_ACTIVE_MAX)
	{
		if(Npc_GetDistToNpc(self,other) > PERC_DIST_MONSTER_ACTIVE_MAX)
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				return;
			};
		};
	};
	if((self.guild == GIL_ORC) || (self.guild == GIL_FRIENDLY_ORC))
	{
		if(c_bodystatecontains(other,BS_SNEAK) || c_bodystatecontains(other,BS_STAND))
		{
			if(!Npc_CanSeeNpc(self,other))
			{
				return;
			};
		};
	};
	if(!Npc_CanSeeNpcFreeLOS(self,other))
	{
		return;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(other.npctype == NPCTYPE_FRIEND)
		{
			return;
		};
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		b_clearperceptions(self);
		AI_StartState(self,zs_mm_attack,0,"");
		return;
	};
	if(self.aivar[AIV_MM_THREATENBEFOREATTACK] == FALSE)
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		b_clearperceptions(self);
		AI_StartState(self,zs_mm_attack,0,"");
		return;
	};
	if(Npc_IsInState(self,zs_mm_eatbody))
	{
		if(Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			b_clearperceptions(self);
			AI_StartState(self,zs_mm_attack,0,"");
			return;
		};
		return;
	};
	if(Npc_IsInState(self,zs_mm_hunt))
	{
		if(Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_ATTACKRANGE)
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			b_clearperceptions(self);
			AI_StartState(self,zs_mm_attack,0,"");
			return;
		}
		else
		{
			return;
		};
	};
	if(c_predatorfoundprey(self,other))
	{
		Npc_ClearAIQueue(self);
		Npc_SetTarget(self,other);
		b_clearperceptions(self);
		AI_StartState(self,zs_mm_hunt,0,"");
		return;
	};
	if(c_predatorfoundprey(other,self))
	{
		if(!Npc_IsInState(other,zs_mm_hunt) && (Npc_GetDistToNpc(self,other) <= FIGHT_DIST_MONSTER_FLEE))
		{
			Npc_ClearAIQueue(self);
			Npc_SetTarget(self,other);
			b_clearperceptions(self);
			AI_StartState(self,zs_mm_flee,0,"");
			return;
		}
		else
		{
			return;
		};
	};
	Npc_ClearAIQueue(self);
	b_clearperceptions(self);
	AI_StartState(self,zs_mm_threatenenemy,0,"");
};

