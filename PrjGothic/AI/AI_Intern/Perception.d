
func void initperceptions()
{
	Perc_SetRange(PERC_ASSESSDAMAGE,9999);
	Perc_SetRange(PERC_ASSESSOTHERSDAMAGE,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSDEFEAT,WATCHFIGHT_DIST_MAX);
	Perc_SetRange(PERC_ASSESSMURDER,PERC_DIST_ACTIVE_MAX);
	Perc_SetRange(PERC_ASSESSTHREAT,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_DRAWWEAPON,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSFIGHTSOUND,3000);
	Perc_SetRange(PERC_ASSESSQUIETSOUND,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSTHEFT,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSUSEMOB,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSENTERROOM,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_ASSESSMAGIC,9999);
	Perc_SetRange(PERC_ASSESSSTOPMAGIC,9999);
	Perc_SetRange(PERC_ASSESSTALK,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSWARN,PERC_DIST_INTERMEDIAT);
	Perc_SetRange(PERC_MOVEMOB,PERC_DIST_DIALOG);
	Perc_SetRange(PERC_ASSESSSURPRISE,FIGHT_DIST_CANCEL);
	Perc_SetRange(PERC_OBSERVEINTRUDER,100);
	Perc_SetRange(PERC_ASSESSREMOVEWEAPON,100);
	Perc_SetRange(PERC_CATCHTHIEF,100);
	Perc_SetRange(PERC_ASSESSCALL,100);
	Perc_SetRange(PERC_MOVENPC,100);
	Perc_SetRange(PERC_ASSESSCASTER,100);
	Perc_SetRange(PERC_NPCCOMMAND,100);
	Perc_SetRange(PERC_OBSERVESUSPECT,100);
};

func void perception_set_normal()
{
	self.senses = SENSE_HEAR | SENSE_SEE;
	self.senses_range = PERC_DIST_ACTIVE_MAX;
	if(Npc_KnowsInfo(self,1) || c_npcisgateguard(self))
	{
		Npc_SetPercTime(self,0.3);
	}
	else
	{
		Npc_SetPercTime(self,1);
	};
	Npc_PercEnable(self,PERC_ASSESSPLAYER,b_assessplayer);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_assessdamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_assessusemob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessportalcollision);
	Npc_PercEnable(self,PERC_ASSESSTHREAT,b_assessthreat);
	Npc_PercEnable(self,PERC_DRAWWEAPON,b_assessdrawweapon);
	Npc_PercEnable(self,PERC_ASSESSFIGHTSOUND,b_assessfightsound);
	Npc_PercEnable(self,PERC_ASSESSQUIETSOUND,b_assessquietsound);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_assesswarn);
	Npc_PercEnable(self,PERC_ASSESSTALK,b_assesstalk);
	Npc_PercEnable(self,PERC_MOVEMOB,b_movemob);
};

func void perception_set_minimal()
{
	self.senses = SENSE_HEAR | SENSE_SEE;
	self.senses_range = PERC_DIST_ACTIVE_MAX;
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_assessdamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_assessmurder);
	Npc_PercEnable(self,PERC_ASSESSTHEFT,b_assesstheft);
	Npc_PercEnable(self,PERC_ASSESSUSEMOB,b_assessusemob);
	Npc_PercEnable(self,PERC_ASSESSENTERROOM,b_assessportalcollision);
};

func void b_clearperceptions(var C_NPC slf)
{
	Npc_PercDisable(slf,PERC_ASSESSPLAYER);
	Npc_PercDisable(slf,PERC_ASSESSENEMY);
	Npc_PercDisable(slf,PERC_ASSESSBODY);
	Npc_PercDisable(slf,PERC_ASSESSMAGIC);
	Npc_PercDisable(slf,PERC_ASSESSDAMAGE);
	Npc_PercDisable(slf,PERC_ASSESSMURDER);
	Npc_PercDisable(slf,PERC_ASSESSTHEFT);
	Npc_PercDisable(slf,PERC_ASSESSUSEMOB);
	Npc_PercDisable(slf,PERC_ASSESSENTERROOM);
	Npc_PercDisable(slf,PERC_ASSESSTHREAT);
	Npc_PercDisable(slf,PERC_DRAWWEAPON);
	Npc_PercDisable(slf,PERC_ASSESSFIGHTSOUND);
	Npc_PercDisable(slf,PERC_ASSESSQUIETSOUND);
	Npc_PercDisable(slf,PERC_ASSESSWARN);
	Npc_PercDisable(slf,PERC_ASSESSTALK);
	Npc_PercDisable(slf,PERC_MOVEMOB);
	Npc_PercDisable(slf,PERC_ASSESSOTHERSDAMAGE);
	Npc_PercDisable(slf,PERC_ASSESSSTOPMAGIC);
	Npc_PercDisable(slf,PERC_ASSESSSURPRISE);
};

func void perception_set_monster_rtn()
{
	Npc_SetPercTime(self,1);
	Npc_PercEnable(self,PERC_ASSESSENEMY,b_mm_assessenemy);
	Npc_PercEnable(self,PERC_ASSESSBODY,b_mm_assessbody);
	Npc_PercEnable(self,PERC_ASSESSMAGIC,b_assessmagic);
	Npc_PercEnable(self,PERC_ASSESSDAMAGE,b_mm_assessdamage);
	Npc_PercEnable(self,PERC_ASSESSOTHERSDAMAGE,b_mm_assessothersdamage);
	Npc_PercEnable(self,PERC_ASSESSMURDER,b_mm_assessothersdamage);
	Npc_PercEnable(self,PERC_ASSESSWARN,b_mm_assesswarn);
};

