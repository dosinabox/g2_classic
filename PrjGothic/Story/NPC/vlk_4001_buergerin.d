
instance VLK_4001_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 4001;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_BabeHair",FACEBABE_N_HAIRANDCLOTH,BODYTEX_N,itar_vlkbabe_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4001;
};


func void rtn_start_4001()
{
	ta_sleep(21,45,6,30,"NW_CITY_REICH03_BED_02");
	ta_stand_sweeping(6,30,8,0,"NW_CITY_UPTOWN_HUT_02_ENTRY");
	ta_cook_stove(8,0,10,0,"NW_CITY_REICH03_COOK");
	ta_smalltalk(10,0,14,0,"NW_CITY_UPTOWN_PATH_15_B");
	ta_sweep_fp(14,0,15,30,"NW_CITY_UPTOWN_HUT_02_IN");
	ta_cook_stove(15,30,17,0,"NW_CITY_REICH03_COOK");
	ta_smalltalk(17,0,21,45,"NW_CITY_UPTOWN_PATH_15_B");
};

