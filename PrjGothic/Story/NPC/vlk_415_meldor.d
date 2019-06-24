
instance VLK_415_MELDOR(NPC_DEFAULT)
{
	name[0] = "Ìוכהמנ";
	guild = GIL_VLK;
	id = 415;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_vlk_dagger);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_P_NORMALBALD,BODYTEX_P,itar_vlk_l);
	Mdl_SetModelFatness(self,0.8);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,35);
	daily_routine = rtn_prestart_415;
};


func void rtn_prestart_415()
{
	ta_smoke_joint(5,5,23,55,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	ta_sleep(23,55,5,5,"NW_CITY_HABOUR_HUT_04_BED_02");
};

func void rtn_start_415()
{
	ta_smoke_joint(5,5,12,35,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	ta_smalltalk(12,35,16,5,"NW_CITY_HABOUR_HUT_08");
	ta_smoke_joint(16,5,18,5,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	ta_stand_eating(18,5,19,55,"NW_CITY_PATH_HABOUR_03");
	ta_smoke_joint(19,55,23,55,"NW_CITY_HABOUR_POOR_AREA_PATH_20");
	ta_sleep(23,55,5,5,"NW_CITY_HABOUR_HUT_04_BED_02");
};

