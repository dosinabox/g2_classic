
instance VLK_481_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 474;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_dagger);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL20,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_481;
};


func void rtn_start_481()
{
	ta_cook_cauldron(5,5,12,5,"NW_CITY_PATH_HABOUR_13_C");
	ta_smalltalk(12,5,15,55,"NW_CITY_HABOUR_SMALLTALK_02");
	ta_cook_cauldron(15,55,20,5,"NW_CITY_PATH_HABOUR_13_C");
	ta_smalltalk(20,5,23,55,"NW_CITY_HABOUR_SMALLTALK_02");
	ta_sleep(23,55,5,5,"NW_CITY_HABOUR_HUT_06_BED_02");
};

