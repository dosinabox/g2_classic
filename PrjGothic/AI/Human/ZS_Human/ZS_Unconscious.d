
func void zs_unconscious()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	if(c_bodystatecontains(self,BS_SWIM) || c_bodystatecontains(self,BS_DIVE))
	{
		Npc_ClearAIQueue(self);
		b_clearperceptions(self);
		AI_StartState(self,zs_dead,0,"");
		return;
	};
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	b_stoplookat(self);
	AI_StopPointAt(self);
	if((self.guild < GIL_SEPERATOR_HUM) && Npc_IsPlayer(other))
	{
		self.aivar[AIV_DEFEATEDBYPLAYER] = TRUE;
		self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] = FIGHT_LOST;
		if((self.aivar[AIV_LASTPLAYERAR] == AR_NONE) && (self.aivar[AIV_DUELLOST] == FALSE) && (self.guild == GIL_SLD))
		{
			SLD_DUELLE_GEWONNEN = SLD_DUELLE_GEWONNEN + 1;
			self.aivar[AIV_DUELLOST] = TRUE;
		};
		if(self.aivar[AIV_ARENAFIGHT] == AF_RUNNING)
		{
			self.aivar[AIV_ARENAFIGHT] = AF_AFTER;
		};
	};
	if(Npc_IsPlayer(self))
	{
		other.aivar[AIV_LASTFIGHTAGAINSTPLAYER] = FIGHT_WON;
		if(other.aivar[AIV_ARENAFIGHT] == AF_RUNNING)
		{
			other.aivar[AIV_ARENAFIGHT] = AF_AFTER;
		};
	};
	b_givetradeinv(self);
	b_clearruneinv(self);
	if((Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER] == TRUE)) && (self.aivar[AIV_VICTORYXPGIVEN] == FALSE))
	{
		b_giveplayerxp(self.level * XP_PER_VICTORY);
		self.aivar[AIV_VICTORYXPGIVEN] = TRUE;
	};
	AI_UnequipWeapons(self);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dar)) && (Hlp_GetInstanceID(other) == Hlp_GetInstanceID(cipher)))
	{
		DAR_LOSTAGAINSTCIPHER = TRUE;
	};
};

func int zs_unconscious_loop()
{
	if(Npc_GetStateTime(self) < HAI_TIME_UNCONSCIOUS)
	{
		return LOOP_CONTINUE;
	};
	return LOOP_END;
};

func void zs_unconscious_end()
{
	self.aivar[AIV_RANSACKED] = FALSE;
	AI_Standup(self);
	if(Npc_IsPlayer(self))
	{
		return;
	};
	if(Npc_CanSeeNpcFreeLOS(self,other) && (Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT))
	{
		b_turntonpc(self,other);
		if(c_npcistoughguy(self) && (Npc_GetPermAttitude(self,other) != ATT_HOSTILE) && (self.npctype != NPCTYPE_FRIEND))
		{
			b_say(self,other,"$NEXTTIMEYOUREINFORIT");
		}
		else
		{
			b_say(self,other,"$OHMYHEAD");
		};
	};
	Npc_PerceiveAll(self);
	if(Wld_DetectItem(self,ITEM_KAT_NF) || Wld_DetectItem(self,ITEM_KAT_FF))
	{
		if(Hlp_IsValidItem(item))
		{
			if(Npc_GetDistToItem(self,item) <= 500)
			{
				AI_TakeItem(self,item);
			};
		};
	};
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
	AI_StartState(self,zs_healself,0,"");
};

