
func void b_restartfreeze()
{
	if((Npc_GetActiveSpell(other) == SPL_ICECUBE) || (Npc_GetActiveSpell(other) == SPL_ICEWAVE))
	{
		Npc_SetStateTime(self,0);
	};
};

func void b_stopmagicfreeze()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_ClearAIQueue(self);
	AI_Standup(self);
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		b_assessdamage();
	}
	else
	{
		Npc_SetTempAttitude(self,ATT_HOSTILE);
	};
};

func void zs_magicfreeze()
{
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_restartfreeze);
	Npc_StopAni(self,"S_FIRE_VICTIM");
	if(!c_bodystatecontains(self,BS_UNCONSCIOUS))
	{
		AI_PlayAniBS(self,"T_STAND_2_FREEZE_VICTIM",BS_UNCONSCIOUS);
	};
	self.aivar[AIV_FREEZESTATETIME] = 0;
};

func int zs_magicfreeze_loop()
{
	if(Npc_GetStateTime(self) > SPL_TIME_FREEZE)
	{
		b_stopmagicfreeze();
		return LOOP_END;
	};
	if(Npc_GetStateTime(self) != self.aivar[AIV_FREEZESTATETIME])
	{
		self.aivar[AIV_FREEZESTATETIME] = Npc_GetStateTime(self);
		if((self.attribute[ATR_HITPOINTS] - (SPL_FREEZE_DAMAGE * 2)) > 0)
		{
			if((self.guild == GIL_FIREGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_FIREWARAN) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_FIRE))
			{
				b_magichurtnpc(other,SPL_FREEZE_DAMAGE * 2);
				return LOOP_CONTINUE;
			};
			if((self.guild == GIL_ICEGOLEM) || (self.aivar[AIV_MM_REAL_ID] == ID_DRAGON_ICE))
			{
				b_magichurtnpc(other,SPL_FREEZE_DAMAGE / 2);
				return LOOP_CONTINUE;
			};
			b_magichurtnpc(other,SPL_FREEZE_DAMAGE);
		};
	};
	return LOOP_CONTINUE;
};

func void zs_magicfreeze_end()
{
};

