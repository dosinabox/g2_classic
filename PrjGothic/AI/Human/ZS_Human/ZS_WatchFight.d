
func void b_cheerfight()
{
	var int zufall;
	if(Npc_GetStateTime(self) <= 2)
	{
		return;
	};
	if((other.guild > GIL_SEPERATOR_HUM) || (victim.guild > GIL_SEPERATOR_HUM))
	{
		return;
	};
	Npc_SetStateTime(self,0);
	if(c_npcistoughguy(self))
	{
		zufall = Hlp_Random(3);
		if((Npc_GetAttitude(self,victim) == ATT_FRIENDLY) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY))
		{
			if(zufall == 0)
			{
				b_say_overlay(self,self,"$OOH01");
			};
			if(zufall == 1)
			{
				b_say_overlay(self,self,"$OOH02");
			};
			if(zufall == 2)
			{
				b_say_overlay(self,self,"$OOH03");
			};
			AI_PlayAni(self,"T_WATCHFIGHT_OHNO");
		}
		else
		{
			if(zufall == 0)
			{
				b_say_overlay(self,self,"$CHEERFRIEND01");
			};
			if(zufall == 1)
			{
				b_say_overlay(self,self,"$CHEERFRIEND02");
			};
			if(zufall == 2)
			{
				b_say_overlay(self,self,"$CHEERFRIEND03");
			};
			AI_PlayAni(self,"T_WATCHFIGHT_YEAH");
		};
	};
};

func void b_assessdefeat()
{
	Npc_ClearAIQueue(self);
	if(c_npcistoughguy(self) || (Npc_IsPlayer(other) && (self.npctype == NPCTYPE_FRIEND)))
	{
		if(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
		{
			b_say(self,other,"$GOODVICTORY");
		}
		else
		{
			b_say(self,other,"$NOTBAD");
		};
	}
	else if(victim.aivar[AIV_ATTACKREASON] != AR_NONE)
	{
		b_say(self,other,"$OHMYGODHESDOWN");
		b_memorizeplayercrime(self,other,CRIME_ATTACK);
	}
	else
	{
		b_say(self,other,"$NOTBAD");
	};
};

func void zs_watchfight()
{
	Npc_PercEnable(self,PERC_ASSESSDEFEAT,b_assessdefeat);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_cheerfight);
	perception_set_minimal();
	AI_Standup(self);
	b_turntonpc(self,victim);
	AI_RemoveWeapon(self);
	if(((Npc_GetDistToNpc(self,other) < PERC_DIST_INTERMEDIAT) || (Npc_GetDistToNpc(self,victim) < PERC_DIST_INTERMEDIAT)) && !Npc_IsInState(other,zs_unconscious) && !Npc_IsInState(victim,zs_unconscious) && ((other.guild < GIL_SEPERATOR_HUM) && (victim.guild < GIL_SEPERATOR_HUM)))
	{
		if(c_npcistoughguy(self))
		{
			b_say(self,other,"$THERESAFIGHT");
		}
		else
		{
			b_say(self,other,"$OHMYGODITSAFIGHT");
		};
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	self.aivar[AIV_STATETIME] = 0;
};

func int zs_watchfight_loop()
{
	if((Npc_GetDistToNpc(self,other) > WATCHFIGHT_DIST_MAX) && (Npc_GetDistToNpc(self,victim) > WATCHFIGHT_DIST_MAX))
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if(!(Npc_IsInState(other,zs_attack) || Npc_IsInState(other,zs_reacttodamage)) && !(Npc_IsInState(victim,zs_attack) || Npc_IsInState(victim,zs_reacttodamage)) && (Npc_GetStateTime(self) > 0))
	{
		if(Npc_IsInState(other,zs_unconscious) || Npc_IsInState(victim,zs_unconscious) || Npc_IsInState(other,zs_dead) || Npc_IsInState(victim,zs_dead))
		{
			if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
			{
				self.aivar[AIV_TAPOSITION] = ISINPOS;
				return LOOP_CONTINUE;
			}
			else
			{
				Npc_ClearAIQueue(self);
				return LOOP_END;
			};
		}
		else
		{
			Npc_ClearAIQueue(self);
			return LOOP_END;
		};
	};
	if(c_npcistoughguy(self))
	{
	};
	if((Npc_GetDistToNpc(self,other) <= WATCHFIGHT_DIST_MIN) || (Npc_GetDistToNpc(self,victim) <= WATCHFIGHT_DIST_MIN))
	{
		Npc_ClearAIQueue(self);
		if(Npc_GetDistToNpc(self,other) <= Npc_GetDistToNpc(self,victim))
		{
			b_turntonpc(self,victim);
		}
		else
		{
			b_turntonpc(self,other);
		};
		AI_Dodge(self);
	}
	else if(Npc_GetStateTime(self) != self.aivar[AIV_STATETIME])
	{
		if(Npc_GetDistToNpc(self,other) <= Npc_GetDistToNpc(self,victim))
		{
			b_turntonpc(self,other);
		}
		else
		{
			b_turntonpc(self,victim);
		};
		self.aivar[AIV_STATETIME] = Npc_GetStateTime(self);
	};
	return LOOP_CONTINUE;
};

func void zs_watchfight_end()
{
};

