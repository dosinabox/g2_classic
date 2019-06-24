
instance PAL_207_GIRION(NPC_DEFAULT)
{
	name[0] = "Гирион";
	guild = GIL_PAL;
	id = 207;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_LEFTY,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_207;
};


func void rtn_start_207()
{
	ta_practice_sword(6,0,7,3,"NW_CITY_GIRION");
	ta_stand_armscrossed(7,3,19,0,"NW_CITY_GIRION");
	ta_sit_throne(19,0,22,59,"NW_CITY_UPTOWN_HUT_03_SIT");
	ta_sleep(22,59,6,0,"NW_CITY_LEOMAR_BED_02");
};

func void rtn_waitforship_207()
{
	ta_stand_wp(8,0,23,0,"NW_CITY_WAY_TO_SHIP_25");
	ta_stand_wp(23,0,8,0,"NW_CITY_WAY_TO_SHIP_25");
};

func void rtn_ship_207()
{
	ta_sit_bench(8,0,23,0,"SHIP_DECK_18");
	ta_sit_bench(23,0,8,0,"SHIP_DECK_18");
};

