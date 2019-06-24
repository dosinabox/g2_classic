
func void zs_reacttodamage()
{
	perception_set_normal();
	b_lookatnpc(self,other);
	b_selectweapon(self,other);
	b_turntonpc(self,other);
	b_say(self,other,"$WHATAREYOUDOING");
	self.aivar[AIV_STATETIME] = 0;
};

func int zs_reacttodamage_loop()
{
	if(Npc_GetStateTime(self) > self.aivar[AIV_STATETIME])
	{
		if(!Npc_CanSeeNpc(self,other))
		{
			AI_TurnToNPC(self,other);
		};
		self.aivar[AIV_STATETIME] = self.aivar[AIV_STATETIME] + 1;
	};
	if(Npc_GetStateTime(self) > 10)
	{
		return LOOP_END;
	}
	else
	{
		return LOOP_CONTINUE;
	};
};

func void zs_reacttodamage_end()
{
	AI_RemoveWeapon(self);
	b_stoplookat(self);
};

