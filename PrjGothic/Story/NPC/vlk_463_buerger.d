
instance VLK_463_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 463;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL06,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_463;
};


func void rtn_start_463()
{
	ta_smalltalk(8,0,23,0,"NW_CITY_PATH_HABOUR_BACK_ALLEY_02");
	ta_smalltalk(23,0,8,0,"NW_CITY_PATH_HABOUR_BACK_ALLEY_02");
};

