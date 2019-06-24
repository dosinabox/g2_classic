
func void zs_mm_hunt()
{
	perception_set_monster_rtn();
	AI_Standup(self);
	AI_TurnToNPC(self,other);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoNpc(self,other);
};

func int zs_mm_hunt_loop()
{
	return LOOP_END;
};

func void zs_mm_hunt_end()
{
};

