
func void zs_practice_sword()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
	};
	AI_EquipBestMeleeWeapon(self);
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
};

func int zs_practice_sword_loop()
{
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(!Npc_HasEquippedMeleeWeapon(self))
		{
			CreateInvItems(self,itmw_1h_bau_mace,1);
			AI_EquipBestMeleeWeapon(self);
		};
		AI_ReadyMeleeWeapon(self);
		self.aivar[AIV_TAPOSITION] = ISINPOS;
	};
	AI_PlayAni(self,"T_1HSFREE");
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	return LOOP_CONTINUE;
};

func void zs_practice_sword_end()
{
	AI_Standup(self);
	AI_RemoveWeapon(self);
};

