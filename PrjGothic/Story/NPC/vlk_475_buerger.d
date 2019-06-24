
instance VLK_475_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 475;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_HEREK,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_475;
};


func void rtn_start_475()
{
	ta_stand_armscrossed(10,55,18,50,"NW_CITY_WATCH_FIGHT_02");
	ta_smalltalk(18,50,3,5,"NW_CITY_HABOUR_04");
	ta_stand_drinking(3,5,5,5,"NW_CITY_HABOUR_PUFF_IN_01");
	ta_smalltalk(5,5,10,5,"NW_CITY_HABOUR_POOR_AREA_01");
};

