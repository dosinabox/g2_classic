
func void zs_gotobed()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp) == FALSE)
	{
		AI_GotoWP(self,self.wp);
	};
	AI_StartState(self,zs_sleep,0,"");
};

func void b_assesssleeptalk()
{
	if(c_bodystatecontains(self,BS_LIE))
	{
		AI_UseMob(self,"BEDHIGH",-1);
	};
	AI_StartState(self,zs_observeplayer,0,"");
};

func void zs_sleep()
{
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,b_assessquietsound);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_assessdamage);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesssleeptalk);
	AI_SetWalkMode(self,NPC_WALK);
};

func int zs_sleep_loop()
{
	if(!c_bodystatecontains(self,BS_LIE))
	{
		if(Wld_IsMobAvailable(self,"BEDHIGH"))
		{
			AI_UseMob(self,"BEDHIGH",1);
		}
		else if((PLAYER_GETOUTOFMYBEDCOMMENT == FALSE) && c_bodystatecontains(hero,BS_LIE) && (Npc_GetDistToNpc(self,hero) <= 500))
		{
			b_turntonpc(self,hero);
			b_say(self,other,"$GETOUTOFMYBED");
			PLAYER_GETOUTOFMYBEDCOMMENT = TRUE;
		};
	};
	return LOOP_CONTINUE;
};

func void zs_sleep_end()
{
	if(!Npc_IsInPlayersRoom(self))
	{
		b_say(self,self,"$AWAKE");
	};
	AI_UseMob(self,"BEDHIGH",-1);
};

