
func int b_assessenemy()
{
	var C_NPC pcl;
	pcl = Hlp_GetNpc(pc_levelinspektor);
	if(Hlp_GetInstanceID(other) == Hlp_GetInstanceID(pcl))
	{
		return FALSE;
	};
	if(Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT)
	{
		return FALSE;
	};
	if(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		if(Npc_GetDistToNpc(self,other) > PERC_DIST_ACTIVE_MAX)
		{
			return FALSE;
		};
		if(!Npc_CanSeeNpc(self,other))
		{
			return FALSE;
		};
	};
	if(((self.aivar[AIV_ENEMYOVERRIDE] == TRUE) || (other.aivar[AIV_ENEMYOVERRIDE] == TRUE)) && (other.guild < GIL_SEPERATOR_HUM))
	{
		return FALSE;
	};
	if(Npc_GetAttitude(self,other) != ATT_HOSTILE)
	{
		return FALSE;
	};
	if(c_npcisgateguard(self))
	{
		return FALSE;
	};
	if(Npc_IsPlayer(other) && (self.npctype == NPCTYPE_FRIEND))
	{
		return FALSE;
	};
	if(Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)
	{
		if((self.aivar[AIV_LastPlayerAR] == AR_GuildEnemy) || (self.aivar[AIV_LastPlayerAR] == AR_MonsterVsHuman) || (self.aivar[AIV_LastPlayerAR] == AR_MonsterMurderedHuman) || (self.aivar[AIV_LastPlayerAR] == AR_MonsterCloseToGate) || (self.aivar[AIV_LastPlayerAR] == AR_GuardCalledToKill))
		{
			B_SetAttitude(self,Wld_GetGuildAttitude(self.guild,other.guild));
			self.aivar[AIV_LastPlayerAR] = AR_NONE;
			return FALSE;
		};
		if((Npc_GetAttitude(self,other) == ATT_HOSTILE) && ((Npc_GetStateTime(self) > 2) || Npc_IsInState(self,zs_observeplayer)) && (Npc_GetDistToNpc(self,other) <= PERC_DIST_INTERMEDIAT))
		{
			b_attack(self,other,self.aivar[AIV_LASTPLAYERAR],0);
			return TRUE;
		}
		else
		{
			return FALSE;
		};
	};
	b_attack(self,other,AR_GUILDENEMY,0);
	return TRUE;
};

