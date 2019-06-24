
func void zs_preach_vatras()
{
	perception_set_normal();
	Npc_PercDisable(self,PERC_ASSESSQUIETSOUND);
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
};

func int zs_preach_vatras_loop()
{
	if(Npc_GetStateTime(self) >= 13)
	{
		if(self.aivar[AIV_TAPOSITION] > 20)
		{
			self.aivar[AIV_TAPOSITION] = 0;
		};
		b_preach_vatras(self.aivar[AIV_TAPOSITION]);
		self.aivar[AIV_TAPOSITION] = self.aivar[AIV_TAPOSITION] + 1;
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void zs_preach_vatras_end()
{
};

