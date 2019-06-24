
instance VLK_497_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 497;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_BabeHair",FACEBABE_N_HAIRANDCLOTH,BODYTEX_N,itar_vlkbabe_l);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_497;
};


func void rtn_start_497()
{
	ta_stand_eating(5,0,6,0,"NW_CITY_MERCHANT_PATH_28_E");
	ta_smalltalk(6,0,7,0,"MARKT_02");
	ta_stand_eating(7,0,8,0,"NW_CITY_MERCHANT_PATH_28_E");
	ta_smalltalk(8,0,10,0,"MARKT_02");
	ta_stand_armscrossed(10,0,11,0,"MARKT");
	ta_smalltalk(11,0,13,0,"MARKT_02");
	ta_stand_eating(13,0,14,0,"NW_CITY_MERCHANT_PATH_28_E");
	ta_smalltalk(14,0,16,0,"MARKT_02");
	ta_stand_armscrossed(16,0,17,0,"MARKT");
	ta_cook_stove(17,0,18,0,"NW_CITY_UPTOWN_HUT_01_COOK");
	ta_sweep_fp(18,0,19,0,"NW_CITY_UPTOWN_HUT_01_COOK");
	ta_smalltalk(19,0,22,0,"NW_CITY_UPTOWN_PATH_08");
	ta_sleep(22,0,5,0,"NW_CITY_GERBRANDT_BED_02");
};

func void rtn_newlife_497()
{
	ta_smalltalk(22,0,8,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	ta_smalltalk(8,0,11,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	ta_smalltalk(11,0,15,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	ta_smalltalk(15,0,18,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	ta_smalltalk(18,0,22,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
};

