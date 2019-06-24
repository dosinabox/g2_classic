
instance VLK_495_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_MAGD;
	guild = GIL_VLK;
	id = 495;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_BabeHair",FACEBABE_N_HAIRANDCLOTH,BODYTEX_N,itar_baubabe_l);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_495;
};


func void rtn_start_495()
{
	ta_smalltalk(6,0,8,0,"NW_CITY_MERCHANT_PATH_28_B");
	ta_stand_eating(8,0,9,0,"NW_CITY_MERCHANT_PATH_30");
	ta_smalltalk(9,0,11,0,"NW_CITY_MERCHANT_PATH_28_B");
	ta_stand_eating(11,0,12,0,"NW_CITY_MERCHANT_PATH_30");
	ta_smalltalk(12,0,14,0,"NW_CITY_MERCHANT_PATH_28_B");
	ta_stand_eating(14,0,15,0,"NW_CITY_MERCHANT_PATH_30");
	ta_smalltalk(15,0,17,0,"NW_CITY_MERCHANT_PATH_28_B");
	ta_stand_eating(17,0,18,0,"NW_CITY_MERCHANT_PATH_30");
	ta_cook_stove(18,0,1,0,"TAVERN02");
	ta_stand_drinking(1,0,5,0,"NW_CITY_TAVERN_IN_04");
	ta_stand_sweeping(5,0,6,0,"NW_CITY_MERCHANT_TAVERN01_IN");
};

