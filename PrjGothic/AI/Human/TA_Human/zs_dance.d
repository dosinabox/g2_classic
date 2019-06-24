
func void zs_dance()
{
	perception_set_normal();
	b_resetall(self);
	AI_SetWalkMode(self,NPC_WALK);
	if(Npc_GetDistToWP(self,self.wp) > TA_DIST_SELFWP_MAX)
	{
		AI_GotoWP(self,self.wp);
		AI_AlignToWP(self);
	};
};

func int zs_dance_loop()
{
	var int dancestyle;
	dancestyle = Hlp_Random(9);
	if(dancestyle == 0)
	{
		AI_PlayAni(self,"T_DANCE_01");
	};
	if(dancestyle == 1)
	{
		AI_PlayAni(self,"T_DANCE_02");
	};
	if(dancestyle == 2)
	{
		AI_PlayAni(self,"T_DANCE_03");
	};
	if(dancestyle == 3)
	{
		AI_PlayAni(self,"T_DANCE_04");
	};
	if(dancestyle == 4)
	{
		AI_PlayAni(self,"T_DANCE_05");
	};
	if(dancestyle == 5)
	{
		AI_PlayAni(self,"T_DANCE_06");
	};
	if(dancestyle == 6)
	{
		AI_PlayAni(self,"T_DANCE_07");
	};
	if(dancestyle == 7)
	{
		AI_PlayAni(self,"T_DANCE_08");
	};
	if(dancestyle == 8)
	{
		AI_PlayAni(self,"T_DANCE_09");
	};
	AI_GotoWP(self,self.wp);
	AI_AlignToWP(self);
	return LOOP_CONTINUE;
};

func void zs_dance_end()
{
	AI_Standup(self);
};

