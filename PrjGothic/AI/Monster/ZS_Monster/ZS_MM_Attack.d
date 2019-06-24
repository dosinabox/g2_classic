
func void b_mm_assesssurprise()
{
	Npc_SetTarget(self,other);
};

func void zs_mm_attack()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSBODY,b_mm_assessbody);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_assessdamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_mm_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSSURPRISE,b_mm_assesssurprise);
	b_validateother();
	if(self.guild == GIL_SHEEP)
	{
		Npc_ClearAIQueue(self);
		b_clearperceptions(self);
		Npc_SetTarget(self,other);
		AI_StartState(self,zs_mm_flee,0,"");
		return;
	};
	AI_Standup(self);
	AI_SetWalkMode(self,NPC_RUN);
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,other,self);
	self.aivar[AIV_PURSUITEND] = FALSE;
	self.aivar[AIV_STATETIME] = 0;
	self.aivar[AIV_HITBYOTHERNPC] = 0;
	self.aivar[AIV_SELECTSPELL] = 0;
};

func int zs_mm_attack_loop()
{
	Npc_GetTarget(self);
	if(Npc_GetDistToWP(self,"OC_RAMP_07") <= 500)
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		AI_PlayAni(self,"T_WARN");
		self.aivar[AIV_PURSUITEND] = TRUE;
		return LOOP_END;
	};
	if(Npc_GetDistToNpc(self,other) > FIGHT_DIST_CANCEL)
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
		AI_PlayAni(self,"T_WARN");
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
				AI_TurnToNPC(self,other);
				self.aivar[AIV_DIST] = Npc_GetDistToNpc(self,other);
				self.aivar[AIV_STATETIME] = Npc_GetStateTime(self);
			};
		};
		return LOOP_CONTINUE;
	};
	if((c_bodystatecontains(other,BS_SWIM) || c_bodystatecontains(other,BS_DIVE)) && (self.aivar[AIV_MM_FOLLOWINWATER] == FALSE))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	if(self.aivar[AIV_WAITBEFOREATTACK] == 1)
	{
		AI_Wait(self,0.8);
		self.aivar[AIV_WAITBEFOREATTACK] = 0;
	};
	if(self.level == 0)
	{
		if(Npc_GetStateTime(self) > self.aivar[AIV_STATETIME])
		{
			self.aivar[AIV_SUMMONTIME] = self.aivar[AIV_SUMMONTIME] + 1;
			self.aivar[AIV_STATETIME] = Npc_GetStateTime(self);
		};
		if(self.aivar[AIV_SUMMONTIME] >= MONSTER_SUMMON_TIME)
		{
			Npc_ChangeAttribute(self,ATR_HITPOINTS,-self.attribute[ATR_HITPOINTS_MAX]);
		};
	};
	if(!c_bodystatecontains(other,BS_RUN) && !c_bodystatecontains(other,BS_JUMP) && (Npc_GetStateTime(self) > 0))
	{
		Npc_SetStateTime(self,0);
		self.aivar[AIV_STATETIME] = 0;
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
	if(c_npcismonstermage(self) || (self.guild == GIL_SKELETON) || (self.guild == GIL_SUMMONED_SKELETON) || (self.guild > GIL_SEPERATOR_ORC))
	{
		b_createammo(self);
		Npc_ChangeAttribute(self,ATR_MANA,ATR_MANA_MAX);
		b_selectweapon(self,other);
	};
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
		if((self.aivar[AIV_MM_PRIORITY] == PRIO_EAT) && c_wanttoeat(self,other))
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
		Npc_PerceiveAll(self);
		Npc_GetNextTarget(self);
		if(Hlp_IsValidNpc(other) && !c_npcisdown(other) && ((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) || Npc_IsPlayer(other)) && (other.aivar[AIV_INVINCIBLE] == FALSE))
		{
			self.aivar[AIV_LASTTARGET] = Hlp_GetInstanceID(other);
			return LOOP_CONTINUE;
		}
		else
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
	};
};

func void zs_mm_attack_end()
{
	OTHER = Hlp_GetNpc(self.aivar[AIV_LASTTARGET]);
	if(c_npcismonstermage(self) || (self.guild == GIL_SKELETON) || (self.guild == GIL_SUMMONED_SKELETON) || (self.guild > GIL_SEPERATOR_ORC))
	{
		AI_RemoveWeapon(self);
	};
	if(Npc_IsDead(other) && c_wanttoeat(self,other))
	{
		Npc_ClearAIQueue(self);
		AI_StartState(self,zs_mm_eatbody,0,"");
		return;
	};
};

