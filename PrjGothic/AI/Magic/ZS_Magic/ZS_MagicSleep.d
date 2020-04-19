
func void b_stopmagicsleep()
{
	Npc_PercDisable(self,PERC_ASSESSDAMAGE);
	b_say_overlay(self,other,"$WHATWASSTHAT");
	AI_PlayAni(self,"T_VICTIM_SLE_2_STAND");
};

func void b_assessmagicsleeptalk()
{
	b_say(self,other,"$YOUDISTURBEDMYSLUMBER");
	AI_StartState(self,zs_observeplayer,1,"");
};

func void zs_magicsleep()
{
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_stopmagicsleep);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assessmagicsleeptalk);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	b_stoplookat(self);
	AI_StopPointAt(self);
	if(!Npc_HasBodyFlag(self,BS_FLAG_INTERRUPTABLE))
	{
		AI_Standup(self);
	}
	else
	{
		AI_StandupQuick(self);
	};
	AI_PlayAniBS(self,"T_STAND_2_VICTIM_SLE",BS_LIE);
};

func int zs_magicsleep_loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_SLEEP)
	{
		Npc_ClearAIQueue(self);
		b_stopmagicsleep();
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_magicsleep_end()
{
};

func void b_stopmagicflee()
{
	Npc_PercDisable(self,PERC_ASSESSDAMAGE);
	Npc_SetTarget(self,other);
	AI_StartState(self,zs_flee,0,"");
};

func void zs_magicflee()
{
	var int randy;
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_stopmagicflee);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	self.aivar[AIV_GUARDPASSAGE_STATUS] = GP_NONE;
	Npc_SetRefuseTalk(self,0);
	Npc_SetTempAttitude(self,Npc_GetPermAttitude(self,hero));
	b_stoplookat(self);
	AI_StopPointAt(self);
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
		randy = Hlp_Random(3);
		if(randy == 0)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM1",BS_STAND);
		};
		if(randy == 1)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM2",BS_STAND);
		};
		if(randy == 2)
		{
			AI_PlayAniBS(self,"T_STAND_2_FEAR_VICTIM3",BS_STAND);
		};
	};
};

func int zs_magicflee_loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_FEAR)
	{
		Npc_ClearAIQueue(self);
		b_stopmagicflee();
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void zs_magicflee_end()
{
};

