
func void zs_reacttoweapon()
{
	perception_set_minimal();
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	if(b_assessenemy())
	{
		return;
	};
	AI_Standup(self);
	b_lookatnpc(self,other);
	b_selectweapon(self,other);
	b_turntonpc(self,other);
	if((self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON) && (self.aivar[AIV_LASTPLAYERAR] != AR_NONE) && Npc_IsPlayer(other))
	{
		b_say(self,other,"$LOOKINGFORTROUBLEAGAIN");
	}
	else if(PLAYER_DRAWWEAPONCOMMENT == FALSE)
	{
		if(Npc_IsInFightMode(other,FMODE_MAGIC))
		{
			b_say(self,other,"$STOPMAGIC");
		}
		else
		{
			b_say(self,other,"$WEAPONDOWN");
		};
		PLAYER_DRAWWEAPONCOMMENT = TRUE;
	};
	Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
	self.aivar[AIV_TAPOSITION] = FALSE;
	self.aivar[AIV_STATETIME] = 0;
};

func int zs_reacttoweapon_loop()
{
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		Npc_ClearAIQueue(self);
		AI_RemoveWeapon(self);
		b_stoplookat(self);
		return LOOP_END;
	};
	if(Npc_IsInFightMode(other,FMODE_NONE))
	{
		Npc_ClearAIQueue(self);
		b_say(self,other,"$WISEMOVE");
		AI_RemoveWeapon(self);
		b_stoplookat(self);
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) > self.aivar[AIV_STATETIME])
	{
		if(!Npc_CanSeeNpc(self,other))
		{
			b_turntonpc(self,other);
		};
		self.aivar[AIV_STATETIME] = self.aivar[AIV_STATETIME] + 1;
	};
	if((self.aivar[AIV_TAPOSITION] == FALSE) && (Npc_GetStateTime(self) > 5))
	{
		if(Npc_IsInFightMode(other,FMODE_MAGIC))
		{
			b_say(self,other,"$ISAIDSTOPMAGIC");
		}
		else
		{
			b_say(self,other,"$ISAIDWEAPONDOWN");
		};
		self.aivar[AIV_TAPOSITION] = TRUE;
	};
	if(Npc_GetStateTime(self) > 10)
	{
		b_attack(self,other,AR_REACTTOWEAPON,0);
	};
	return LOOP_CONTINUE;
};

func void zs_reacttoweapon_end()
{
	b_stoplookat(self);
	AI_StartState(self,zs_observeplayer,1,"");
};

