
instance VLK_496_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 496;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe1",FACEBABE_N_OLDBROWN,BODYTEX_N,itar_vlkbabe_l);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_496;
};


func void rtn_start_496()
{
	ta_smalltalk(6,0,7,0,"NW_CITY_MERCHANT_PATH_28_D");
	ta_stand_drinking(7,0,8,0,"NW_CITY_MERCHANT_PATH_28_D");
	ta_smalltalk(8,0,10,0,"NW_CITY_MERCHANT_PATH_28_D");
	ta_stand_drinking(10,0,11,0,"NW_CITY_MERCHANT_PATH_28_D");
	ta_smalltalk(11,0,13,0,"NW_CITY_MERCHANT_PATH_28_D");
	ta_stand_drinking(13,0,14,0,"NW_CITY_MERCHANT_PATH_28_D");
	ta_smalltalk(14,0,16,0,"NW_CITY_MERCHANT_PATH_28_D");
	ta_cook_stove(16,0,17,0,"NW_CITY_UPTOWN_HUT_04_COOK");
	ta_smalltalk(17,0,21,45,"NW_CITY_UPTOWN_PATH_15");
	ta_cook_stove(21,45,0,0,"NW_CITY_UPTOWN_HUT_04_COOK");
	ta_sleep(0,0,4,30,"NW_CITY_LUTERO_BED_WEIB");
	ta_sweep_fp(4,30,6,0,"NW_CITY_UPTOWN_HUT_04_01");
};

