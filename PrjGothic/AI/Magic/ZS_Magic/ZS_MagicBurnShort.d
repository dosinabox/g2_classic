
const int SPL_MAGICBURNSHORT_DAMAGE_PER_SEC = 1;

func void b_stopmagicburnshort()
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

func void b_restartburnshort()
{
	if((Npc_GetActiveSpell(other) == SPL_CHARGEFIREBALL) || (Npc_GetActiveSpell(other) == SPL_FIRESTORM))
	{
		Npc_SetStateTime(self,0);
		return;
	};
	if((Npc_GetActiveSpell(other) == SPL_ICEWAVE) || (Npc_GetActiveSpell(other) == SPL_ICECUBE))
	{
		Npc_ClearAIQueue(self);
		b_clearperceptions(self);
		AI_StartState(self,zs_magicfreeze,0,"");
	};
};

func void zs_magicburnshort()
{
	Npc_PercEnable(self,PERC_ASSESSSTOPMAGIC,b_stopmagicburnshort);
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
		Npc_PlayAni(self,"S_FIRE_VICTIM");
	};
};

func int zs_magicburnshort_loop()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_restartburnshort);
	if(Npc_GetStateTime(self) == 1)
	{
		Npc_SetStateTime(self,0);
		b_magichurtnpc(other,SPL_MAGICBURNSHORT_DAMAGE_PER_SEC);
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		Npc_PlayAni(self,"S_FIRE_VICTIM");
	};
	if(self.attribute[ATR_HITPOINTS] <= 0)
	{
		Npc_ClearAIQueue(self);
		AI_Standup(self);
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_magicburnshort_end()
{
	Npc_ClearAIQueue(self);
	AI_Standup(self);
};

