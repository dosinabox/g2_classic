
func void zs_observeplayer()
{
	perception_set_normal();
	if(!c_bodystatecontains(self,BS_SIT))
	{
		AI_Standup(self);
		b_lookatnpc(self,other);
		b_turntonpc(self,other);
	}
	else
	{
		b_lookatnpc(self,other);
	};
	if(Npc_WasInState(self,zs_sleep))
	{
		b_say(self,other,"$YOUDISTURBEDMYSLUMBER");
	};
	if((self.aivar[AIV_SEENLEFTROOM] == TRUE) && Npc_IsPlayer(other))
	{
		self.aivar[AIV_SEENLEFTROOM] = FALSE;
		if(PLAYER_LEFTROOMCOMMENT == FALSE)
		{
			b_say(self,other,"$WHATDIDYOUDOINTHERE");
			PLAYER_LEFTROOMCOMMENT = TRUE;
		};
	};
	self.aivar[AIV_STATETIME] = Hlp_Random(2) + 1;
};

func int zs_observeplayer_loop()
{
	if(c_bodystatecontains(other,BS_SNEAK) && (PLAYER_SNEAKERCOMMENT == FALSE))
	{
		PLAYER_SNEAKERCOMMENT = TRUE;
		AI_PointAtNpc(self,other);
		b_say(self,other,"$WHATSTHISSUPPOSEDTOBE");
		AI_StopPointAt(self);
		Npc_SendPassivePerc(self,PERC_ASSESSWARN,self,other);
	};
	if(Npc_GetStateTime(self) > self.aivar[AIV_STATETIME])
	{
		if(!c_bodystatecontains(self,BS_SIT))
		{
			b_turntonpc(self,other);
		};
		self.aivar[AIV_STATETIME] = Hlp_Random(2) + 1;
		Npc_SetStateTime(self,0);
	};
	if(Npc_GetDistToNpc(self,other) > PERC_DIST_INTERMEDIAT)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	}
	else
	{
		return LOOP_CONTINUE;
	};
};

func void zs_observeplayer_end()
{
	b_stoplookat(self);
};

