
instance BDT_1013_BANDIT_L(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1013;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,0);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	CreateInvItems(self,itwr_poster_mis,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_HOMER,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_1013;
};


func void rtn_start_1013()
{
	ta_stand_armscrossed(0,0,12,0,"NW_XARDAS_STAIRS_01");
	ta_stand_armscrossed(12,0,0,0,"NW_XARDAS_STAIRS_01");
};

func void rtn_ambush_1013()
{
	ta_guide_player(0,0,12,0,"NW_XARDAS_BANDITS_RIGHT");
	ta_guide_player(12,0,0,0,"NW_XARDAS_BANDITS_RIGHT");
};

func void rtn_away_1013()
{
	ta_sit_campfire(0,0,12,0,"NW_XARDAS_GOBBO_02");
	ta_sit_campfire(12,0,0,0,"NW_XARDAS_GOBBO_02");
};

