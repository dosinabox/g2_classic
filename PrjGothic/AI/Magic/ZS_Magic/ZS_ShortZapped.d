
func void b_stopshortzapped()
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

func int zs_shortzapped()
{
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,b_stopshortzapped);
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

func int zs_shortzapped_loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_SHORTZAPPED)
	{
		b_stopshortzapped();
	};
};

func void zs_shortzapped_end()
{
};

