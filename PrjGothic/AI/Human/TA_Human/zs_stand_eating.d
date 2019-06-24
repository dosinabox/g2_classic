
func void zs_stand_eating()
{
	var int random;
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
	};
	self.aivar[AIV_TAPOSITION] = NOTINPOS;
	random = Hlp_Random(4);
	if(random == 0)
	{
		if(Npc_HasItems(self,itfo_apple) == 0)
		{
			CreateInvItem(self,itfo_apple);
		};
		self.aivar[AIV_FOOD] = FOOD_APPLE;
	}
	else if(random == 1)
	{
		if(Npc_HasItems(self,itfo_cheese) == 0)
		{
			CreateInvItem(self,itfo_cheese);
		};
		self.aivar[AIV_FOOD] = FOOD_CHEESE;
	}
	else if(random == 2)
	{
		if(Npc_HasItems(self,itfo_bacon) == 0)
		{
			CreateInvItem(self,itfo_bacon);
		};
		self.aivar[AIV_FOOD] = FOOD_BACON;
	}
	else if(random == 3)
	{
		if(Npc_HasItems(self,itfomutton) == 0)
		{
			CreateInvItem(self,itfomutton);
		};
		self.aivar[AIV_FOOD] = FOOD_BREAD;
	};
};

func int zs_stand_eating_loop()
{
	if(Npc_IsOnFP(self,"STAND"))
	{
		AI_AlignToFP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	}
	else if(Wld_IsFPAvailable(self,"STAND"))
	{
		AI_GotoFP(self,"STAND");
		AI_Standup(self);
		AI_AlignToFP(self);
		self.aivar[AIV_TAPOSITION] = NOTINPOS_WALK;
	}
	else
	{
		AI_AlignToWP(self);
		if(self.aivar[AIV_TAPOSITION] == NOTINPOS_WALK)
		{
			self.aivar[AIV_TAPOSITION] = NOTINPOS;
		};
	};
	if(self.aivar[AIV_TAPOSITION] == NOTINPOS)
	{
		if(self.aivar[AIV_FOOD] == FOOD_APPLE)
		{
			AI_UseItemToState(self,itfo_apple,0);
			AI_PlayAniBS(self,"T_FOOD_RANDOM_2",BS_ITEMINTERACT);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if(self.aivar[AIV_FOOD] == FOOD_CHEESE)
		{
			AI_UseItemToState(self,itfo_cheese,0);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if(self.aivar[AIV_FOOD] == FOOD_BACON)
		{
			AI_UseItemToState(self,itfo_bacon,0);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
		if(self.aivar[AIV_FOOD] == FOOD_BREAD)
		{
			AI_UseItemToState(self,itfomutton,0);
			self.aivar[AIV_TAPOSITION] = ISINPOS;
		};
	};
	if((Npc_GetStateTime(self) > 5) && (self.aivar[AIV_TAPOSITION] == ISINPOS))
	{
		if(self.aivar[AIV_FOOD] == FOOD_APPLE)
		{
			AI_PlayAniBS(self,"T_FOOD_RANDOM_1",BS_ITEMINTERACT);
		}
		else if((self.aivar[AIV_FOOD] == FOOD_BACON) || (self.aivar[AIV_FOOD] == FOOD_BREAD))
		{
			AI_PlayAniBS(self,"T_MEAT_RANDOM_1",BS_ITEMINTERACT);
		}
		else
		{
			AI_PlayAniBS(self,"T_FOODHUGE_RANDOM_1",BS_ITEMINTERACT);
		};
		Npc_SetStateTime(self,0);
	};
	return LOOP_CONTINUE;
};

func void zs_stand_eating_end()
{
	AI_PlayAniBS(self,"T_POTION_RANDOM_2",BS_ITEMINTERACT);
	if(self.aivar[AIV_FOOD] == FOOD_APPLE)
	{
		AI_UseItemToState(self,itfo_apple,-1);
	};
	if(self.aivar[AIV_FOOD] == FOOD_CHEESE)
	{
		AI_UseItemToState(self,itfo_cheese,-1);
	};
	if(self.aivar[AIV_FOOD] == FOOD_BACON)
	{
		AI_UseItemToState(self,itfo_bacon,-1);
	};
	if(self.aivar[AIV_FOOD] == FOOD_BREAD)
	{
		AI_UseItemToState(self,itfomutton,-1);
	};
};

