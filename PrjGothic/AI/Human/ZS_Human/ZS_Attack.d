
func void b_assesssurprise()
{
	Npc_SetTarget(self,other);
	self.aivar[AIV_ATTACKREASON] = AR_GUILDENEMY;
};

func void zs_attack()
{
	perception_set_minimal();
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,b_assesssurprise);
	b_validateother();
	if(c_wanttoflee(self,other))
	{
		Npc_ClearAIQueue(self);
		b_clearperceptions(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_flee,0,"");
		return;
	};
	if(self.aivar[AIV_LOADGAME] == FALSE)
	{
		b_say_attackreason();
	};
	if(Npc_IsInFightMode(self,FMODE_NONE))
	{
		AI_EquipBestRangedWeapon(self);
		AI_EquipBestMeleeWeapon(self);
	};
	AI_Standup(self);
	b_stoplookat(self);
	b_turntonpc(self,other);
	AI_SetWalkMode(self,NPC_RUN);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	self.aivar[AIV_LASTABSOLUTIONLEVEL] = b_getcurrentabsolutionlevel(self);
	self.aivar[AIV_PURSUITEND] = FALSE;
	self.aivar[AIV_STATETIME] = 0;
	self.aivar[AIV_TAPOSITION] = 0;
	self.aivar[AIV_HITBYOTHERNPC] = 0;
	self.aivar[AIV_SELECTSPELL] = 0;
};

func int zs_attack_loop()
{
	Npc_GetTarget(self);
	if(Npc_GetDistToNpc(self,other) > self.aivar[AIV_FIGHTDISTCANCEL])
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PURSUITEND] = TRUE;
		return LOOP_END;
	};
	if((Npc_GetStateTime(self) > self.aivar[AIV_MM_FOLLOWTIME]) && (self.aivar[AIV_PURSUITEND] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		self.aivar[AIV_PURSUITEND] = TRUE;
		self.aivar[AIV_DIST] = Npc_GetDistToNpc(self,other);
		self.aivar[AIV_STATETIME] = Npc_GetStateTime(self);
		if(other.guild < GIL_SEPERATOR_HUM)
		{
			b_say(self,other,"$RUNCOWARD");
		};
	};
	if(self.aivar[AIV_PURSUITEND] == TRUE)
	{
		if(Npc_GetDistToNpc(self,other) > self.senses_range)
		{
			return LOOP_END;
		};
		if(Npc_GetStateTime(self) > self.aivar[AIV_STATETIME])
		{
			if((Npc_GetDistToNpc(self,other) < self.aivar[AIV_DIST]) || (!c_bodystatecontains(other,BS_RUN) && !c_bodystatecontains(other,BS_JUMP)))
			{
				self.aivar[AIV_PURSUITEND] = FALSE;
				Npc_SetStateTime(self,0);
				self.aivar[AIV_STATETIME] = 0;
			}
			else
			{
				b_turntonpc(self,other);
				self.aivar[AIV_DIST] = Npc_GetDistToNpc(self,other);
				self.aivar[AIV_STATETIME] = Npc_GetStateTime(self);
			};
		};
		return LOOP_CONTINUE;
	};
	if(b_getcurrentabsolutionlevel(self) > self.aivar[AIV_LASTABSOLUTIONLEVEL])
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	if((c_bodystatecontains(other,BS_SWIM) || c_bodystatecontains(other,BS_DIVE)) && (self.aivar[AIV_MM_FOLLOWINWATER] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	if(self.aivar[AIV_WAITBEFOREATTACK] >= 1)
	{
		AI_Wait(self,0.8);
		self.aivar[AIV_WAITBEFOREATTACK] = 0;
	};
	if(self.aivar[AIV_MAXDISTTOWP] > 0)
	{
		if((Npc_GetDistToWP(self,self.wp) > self.aivar[AIV_MAXDISTTOWP]) && (Npc_GetDistToWP(other,self.wp) > self.aivar[AIV_MAXDISTTOWP]))
		{
			self.fight_tactic = FAI_NAILED;
		}
		else
		{
			self.fight_tactic = self.aivar[AIV_ORIGINALFIGHTTACTIC];
		};
	};
	if(!c_bodystatecontains(other,BS_RUN) && !c_bodystatecontains(other,BS_JUMP))
	{
		Npc_SetStateTime(self,0);
	};
	if((Npc_GetStateTime(self) > 2) && (self.aivar[AIV_TAPOSITION] == 0))
	{
		b_callguards();
		self.aivar[AIV_TAPOSITION] = 1;
	};
	if((Npc_GetStateTime(self) > 8) && (self.aivar[AIV_TAPOSITION] == 1))
	{
		b_callguards();
		self.aivar[AIV_TAPOSITION] = 2;
	};
	b_createammo(self);
	b_selectweapon(self,other);
	if(Hlp_IsValidNpc(other) && !c_npcisdown(other))
	{
		if(other.aivar[AIV_INVINCIBLE] == FALSE)
		{
			AI_Attack(self);
		}
		else
		{
			Npc_ClearAIQueue(self);
		};
		self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
		return LOOP_CONTINUE;
	}
	else
	{
		Npc_ClearAIQueue(self);
		if(Hlp_IsValidNpc(other) && Npc_IsPlayer(other) && c_npcisdown(other))
		{
			Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
		};
		if(self.aivar[AIV_ATTACKREASON] != AR_KILL)
		{
			Npc_PerceiveAll(self);
			Npc_GetNextTarget(self);
		};
		if(Hlp_IsValidNpc(other) && !c_npcisdown(other) && ((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) || Npc_IsPlayer(other)) && (other.aivar[AIV_INVINCIBLE] == FALSE))
		{
			if(Wld_GetGuildAttitude(self.guild,other.guild) == ATT_HOSTILE)
			{
				self.aivar[AIV_ATTACKREASON] = AR_GUILDENEMY;
				if(Npc_IsPlayer(other))
				{
					self.aivar[AIV_LASTPLAYERAR] = AR_GUILDENEMY;
					self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] = FIGHT_CANCEL;
					self.aivar[AIV_LASTFIGHTCOMMENT] = FALSE;
				};
			}
			else if(Npc_GetAttitude(self,other) == ATT_HOSTILE)
			{
				self.aivar[AIV_ATTACKREASON] = self.aivar[AIV_LASTPLAYERAR];
			};
			return LOOP_CONTINUE;
		}
		else
		{
			Npc_ClearAIQueue(self);
			if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_CANCEL) && (self.aivar[AIV_LASTTARGET] != Hlp_GetInstanceID(hero)))
			{
				self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
			};
			return LOOP_END;
		};
	};
};

func void zs_attack_end()
{
	OTHER = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	if(self.aivar[AIV_PURSUITEND] == TRUE)
	{
		if(Hlp_IsValidNpc(other) && Npc_IsPlayer(other) && (self.npctype != NPCTYPE_FRIEND))
		{
			Npc_SetTempAttitude(self,ATT_HOSTILE);
		};
		if(self.aivar[AIV_ARENAFIGHT] == AF_RUNNING)
		{
			self.aivar[AIV_ARENAFIGHT] = AF_AFTER;
		};
	};
	if(self.aivar[AIV_PURSUITEND] == FALSE)
	{
		if(b_getcurrentabsolutionlevel(self) > self.aivar[AIV_LASTABSOLUTIONLEVEL])
		{
			b_say(self,other,"$WISEMOVE");
		}
		else
		{
			b_say_attackend();
		};
	};
	if((other.aivar[AIV_KILLEDBYPLAYER] == TRUE) && (Wld_GetGuildAttitude(self.guild,hero.guild) != ATT_HOSTILE))
	{
		b_setattitude(self,ATT_FRIENDLY);
	};
	if(Npc_IsInState(other,zs_unconscious) && c_npchasattackreasontokill(self))
	{
		b_finishingmove(self,other);
	};
	AI_RemoveWeapon(self);
	if(c_npcisdown(other) && (other.guild < GIL_SEPERATOR_HUM) && c_wanttoransack(self) && ((other.aivar[AIV_RANSACKED] == FALSE) || c_npcransacksalways(self)) && (Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT))
	{
		other.aivar[AIV_RANSACKED] = TRUE;
		AI_StartState(self,zs_ransackbody,0,"");
		return;
	};
	AI_StartState(self,zs_healself,0,"");
};

