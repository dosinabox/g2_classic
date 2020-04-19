
func void b_stoppyro()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		b_assessdamage();
		AI_ContinueRoutine(self);
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
		AI_ContinueRoutine(self);
	};
};

func void zs_pyro()
{
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,b_stoppyro);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		AI_PlayAni(self,"T_STAND_2_LIGHTNING_VICTIM");
	};
};

func int zs_pyro_loop()
{
	if(Npc_GetStateTime(self) >= 1)
	{
		Npc_SetStateTime(self,0);
		b_magichurtnpc(other,SPL_PYRO_DAMAGE_PER_SEC);
		if(self.attribute[ATR_HITPOINTS] <= 0)
		{
			Npc_ClearAIQueue(self);
			AI_Standup(self);
			return LOOP_END;
		};
	};
	return LOOP_CONTINUE;
};

func void zs_pyro_end()
{
};

