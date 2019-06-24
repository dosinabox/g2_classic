
func int zs_magicshrink()
{
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	self.aivar[AIV_MM_SHRINKSTATE] = 0;
};

func int zs_magicshrink_loop()
{
	if(self.aivar[AIV_MM_SHRINKSTATE] == 0)
	{
		Mdl_SetModelScale(self,0.9,0.9,0.9);
		self.aivar[AIV_MM_SHRINKSTATE] = 1;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 1)
	{
		Mdl_SetModelScale(self,0.85,0.85,0.85);
		self.aivar[AIV_MM_SHRINKSTATE] = 2;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 2)
	{
		Mdl_SetModelScale(self,0.8,0.8,0.8);
		self.aivar[AIV_MM_SHRINKSTATE] = 3;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 3)
	{
		Mdl_SetModelScale(self,0.75,0.75,0.75);
		self.aivar[AIV_MM_SHRINKSTATE] = 4;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 4)
	{
		Mdl_SetModelScale(self,0.7,0.7,0.7);
		self.aivar[AIV_MM_SHRINKSTATE] = 5;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 5)
	{
		Mdl_SetModelScale(self,0.65,0.65,0.65);
		self.aivar[AIV_MM_SHRINKSTATE] = 6;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 6)
	{
		Mdl_SetModelScale(self,0.6,0.6,0.6);
		self.aivar[AIV_MM_SHRINKSTATE] = 7;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 7)
	{
		Mdl_SetModelScale(self,0.55,0.55,0.55);
		self.aivar[AIV_MM_SHRINKSTATE] = 8;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 8)
	{
		Mdl_SetModelScale(self,0.5,0.5,0.5);
		self.aivar[AIV_MM_SHRINKSTATE] = 9;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 9)
	{
		Mdl_SetModelScale(self,0.45,0.45,0.45);
		self.aivar[AIV_MM_SHRINKSTATE] = 10;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 10)
	{
		Mdl_SetModelScale(self,0.4,0.4,0.4);
		self.aivar[AIV_MM_SHRINKSTATE] = 11;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 11)
	{
		Mdl_SetModelScale(self,0.35,0.35,0.35);
		self.aivar[AIV_MM_SHRINKSTATE] = 12;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 12)
	{
		Mdl_SetModelScale(self,0.3,0.3,0.3);
		self.aivar[AIV_MM_SHRINKSTATE] = 13;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 13)
	{
		Npc_ChangeAttribute(self,ATR_HITPOINTS,-((self.attribute * 9) / 10));
		Npc_ChangeAttribute(self,ATR_HITPOINTS_MAX,-((self.attribute[ATR_HITPOINTS_MAX] * 9) / 10));
		Npc_ChangeAttribute(self,ATR_STRENGTH,-((self.attribute[ATR_STRENGTH] * 9) / 10));
		self.protection[PROT_BLUNT] = self.protection[PROT_BLUNT] / 10;
		self.protection[PROT_EDGE] = self.protection[PROT_EDGE] / 10;
		self.protection[PROT_FIRE] = self.protection[PROT_FIRE] / 10;
		self.protection[PROT_FLY] = 0;
		self.protection[PROT_MAGIC] = self.protection[PROT_MAGIC] / 10;
		self.protection[PROT_POINT] = self.protection[PROT_POINT] / 10;
		self.aivar[AIV_MM_SHRINKSTATE] = 14;
	}
	else if(self.aivar[AIV_MM_SHRINKSTATE] == 14)
	{
		Npc_ClearAIQueue(self);
		self.start_aistate = zs_magicshrunk;
		AI_StartState(self,zs_magicshrunk,1,"");
		return LOOP_END;
	};
	AI_Wait(self,0.38);
	return LOOP_CONTINUE;
};

func void zs_magicshrink_end()
{
};

func void zs_magicshrunk()
{
	Npc_SetTarget(self,hero);
};

func int zs_magicshrunk_loop()
{
	AI_Flee(self);
	return LOOP_CONTINUE;
};

func void zs_magicshrunk_end()
{
};

