
func void zs_healself()
{
	perception_set_minimal();
};

func int zs_healself_loop()
{
	if(self.attribute[ATR_HITPOINTS] == self.attribute[ATR_HITPOINTS_MAX])
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
	if(Npc_HasItems(self,itpo_health_03) > 0)
	{
		AI_UseItem(self,itpo_health_03);
		return LOOP_CONTINUE;
	}
	else if(Npc_HasItems(self,itpo_health_02) > 0)
	{
		AI_UseItem(self,itpo_health_02);
		return LOOP_CONTINUE;
	}
	else if(Npc_HasItems(self,itpo_health_01) > 0)
	{
		AI_UseItem(self,itpo_health_01);
		return LOOP_CONTINUE;
	}
	else
	{
		Npc_ClearAIQueue(self);
		return LOOP_END;
	};
};

func void zs_healself_end()
{
};

