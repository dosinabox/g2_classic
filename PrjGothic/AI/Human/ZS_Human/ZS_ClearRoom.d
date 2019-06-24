
func void b_clearroomtalk()
{
	if(c_wanttoattackroomintruder(self))
	{
		b_say(self,other,"$GETOUTOFHERE");
	}
	else
	{
		b_say(self,other,"$WHYAREYOUINHERE");
	};
};

func int b_exitifroomleft()
{
	var int portalguild;
	portalguild = Wld_GetPlayerPortalGuild();
	if(!c_npcisbotheredbyplayerroomguild(self) || (portalguild == GIL_PUBLIC))
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		b_stoplookat(self);
		if(c_wanttoattackroomintruder(self))
		{
			b_say(self,other,"$YESGOOUTOFHERE");
		}
		else
		{
			b_say(self,other,"$WISEMOVE");
		};
		AI_ContinueRoutine(self);
		return TRUE;
	};
	return FALSE;
};

func void zs_clearroom()
{
	perception_set_minimal();
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_exitifroomleft);
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_clearroomtalk);
	AI_Standup(self);
	b_lookatnpc(self,other);
	AI_SetWalkMode(self,NPC_RUN);
	if(!Npc_IsInPlayersRoom(self))
	{
		AI_GotoWP(self,Npc_GetNearestWP(other));
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_clearroom_loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		b_turntonpc(self,other);
		if(c_wanttoattackroomintruder(self))
		{
			b_selectweapon(self,other);
			b_say(self,other,"$GETOUTOFHERE");
		}
		else if(Npc_GetAttitude(other,self) != ATT_FRIENDLY)
		{
			b_say(self,other,"$WHYAREYOUINHERE");
		};
		Npc_SetStateTime(self,0);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	if(b_exitifroomleft())
	{
		return LOOP_END;
	};
	if(c_wanttoattackroomintruder(self))
	{
		if(Npc_GetStateTime(self) > 5)
		{
			b_attack(self,other,AR_CLEARROOM,0);
			return LOOP_END;
		};
	}
	else if(Npc_GetStateTime(self) >= 2)
	{
		if(!Npc_CanSeeNpcFreeLOS(self,other))
		{
			AI_GotoWP(self,Npc_GetNearestWP(other));
			b_turntonpc(self,other);
		}
		else if(!Npc_CanSeeNpc(self,other))
		{
			b_turntonpc(self,other);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void zs_clearroom_end()
{
	b_stoplookat(self);
};

