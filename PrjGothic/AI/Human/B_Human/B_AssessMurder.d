
func void b_assessmurder()
{
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(other))
	{
		return;
	};
	if((Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT) && (Npc_GetDistToNpc(self,victim) > PERC_DIST_INTERMEDIAT))
	{
		return;
	};
	if((Npc_GetHeightToNpc(self,other) > PERC_DIST_HEIGHT) && (Npc_GetHeightToNpc(self,victim) > PERC_DIST_HEIGHT))
	{
		return;
	};
	if(!Npc_CanSeeNpcFreeLOS(self,other) && !Npc_CanSeeNpcFreeLOS(self,victim))
	{
		return;
	};
	if(b_assessenemy())
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
		};
	};
	if((other.guild > GIL_SEPERATOR_HUM) && (victim.guild > GIL_SEPERATOR_HUM))
	{
		return;
	};
	if(other.guild > GIL_SEPERATOR_HUM)
	{
		b_attack(self,other,AR_MONSTERMURDEREDHUMAN,0);
		return;
	};
	if(victim.guild > GIL_SEPERATOR_HUM)
	{
		return;
	};
	if(self.aivar[AIV_ENEMYOVERRIDE] == TRUE)
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
	if(((Npc_GetAttitude(self,victim) == ATT_HOSTILE) || (Npc_GetAttitude(self,victim) == ATT_ANGRY)) && ((Npc_GetAttitude(self,other) == ATT_FRIENDLY) || (Npc_GetAttitude(self,other) == ATT_NEUTRAL)))
	{
		return;
	};
	if(Npc_IsPlayer(other) && (self.npctype == NPCTYPE_FRIEND))
	{
		return;
	};
	if(!c_wanttoattackmurder(self,other))
	{
		if(c_npcisgateguard(self))
		{
			b_memorizeplayercrime(self,other,CRIME_MURDER);
		};
		return;
	};
	if((other.aivar[AIV_DROPDEADANDKILL] == TRUE) || (victim.aivar[AIV_DROPDEADANDKILL] == TRUE))
	{
		return;
	};
	if((victim.guild == GIL_DMT) || (victim.guild == GIL_BDT))
	{
		return;
	};
	b_attack(self,other,AR_HUMANMURDEREDHUMAN,0);
};

