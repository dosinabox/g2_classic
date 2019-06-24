
func void zs_flee()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	b_validateother();
	if(self.aivar[AIV_LOADGAME] == FALSE)
	{
		b_say_overlay(self,other,"$RUNAWAY");
	};
	AI_RemoveWeapon(self);
	AI_SetWalkMode(self,NPC_RUN);
	Mdl_ApplyOverlayMds(self,"HUMANS_FLEE.MDS");
};

func int zs_flee_loop()
{
	Npc_GetTarget(self);
	if(Npc_GetDistToNpc(self,other) > FIGHT_DIST_CANCEL)
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if(c_npcisdown(other))
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	AI_Flee(self);
	return LOOP_CONTINUE;
};

func void zs_flee_end()
{
	Mdl_RemoveOverlayMds(self,"HUMANS_FLEE.MDS");
	AI_Standup(self);
	AI_StartState(self,zs_healself,1,"");
};

