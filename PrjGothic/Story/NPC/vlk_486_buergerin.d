
instance VLK_486_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 486;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe8",FACEBABE_N_LILO,BODYTEX_N,itar_vlkbabe_m);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,35);
	daily_routine = rtn_start_486;
};


func void rtn_start_486()
{
	ta_stand_armscrossed(5,30,6,0,"NW_CITY_MERCHANT_PATH_36_B");
	ta_smalltalk(6,0,8,0,"NW_CITY_MERCHANT_PATH_36_B");
	ta_stand_armscrossed(8,0,9,0,"NW_CITY_MERCHANT_PATH_36_B");
	ta_smalltalk(9,0,11,0,"NW_CITY_MERCHANT_PATH_36_B");
	ta_stand_armscrossed(11,0,12,0,"NW_CITY_MERCHANT_PATH_36_B");
	ta_smalltalk(12,0,14,0,"NW_CITY_MERCHANT_PATH_36_B");
	ta_stand_armscrossed(14,0,15,0,"NW_CITY_MERCHANT_PATH_36_B");
	ta_smalltalk(15,0,17,0,"NW_CITY_MERCHANT_PATH_36_B");
	ta_stand_armscrossed(17,0,17,30,"NW_CITY_MERCHANT_PATH_36_B");
	ta_cook_stove(17,30,20,0,"NW_CITY_ZURIS_FRAU_COOK");
	ta_sit_chair(20,0,23,30,"NW_CITY_MERCHANT_HUT_02_IN_02");
	ta_sleep(23,30,5,30,"NW_CITY_BED_ZURIS_FRAU");
};

