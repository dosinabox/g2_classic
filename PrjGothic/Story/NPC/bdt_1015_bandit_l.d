
instance BDT_1015_BANDIT_L(NPC_DEFAULT)
{
	name[0] = NAME_BANDIT;
	guild = GIL_BDT;
	id = 1015;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,0);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_vlk_dagger);
	b_createambientinv(self);
	CreateInvItems(self,itwr_banditletter_mis,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_NORMAL01,BODYTEX_B,itar_bdt_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_1015;
};


func void rtn_start_1015()
{
	ta_stand_armscrossed(0,0,12,0,"NW_XARDAS_BANDITS_RIGHT");
	ta_stand_armscrossed(12,0,0,0,"NW_XARDAS_BANDITS_RIGHT");
};

