
instance VLK_410_BALTRAM(NPC_DEFAULT)
{
	name[0] = "Áאכüענאל";
	guild = GIL_VLK;
	id = 410;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_shortsword2);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_MARKUS_KARK,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_410;
};


func void rtn_start_410()
{
	ta_stand_armscrossed(5,5,20,5,"NW_CITY_ZURIS");
	ta_smalltalk(20,5,0,5,"NW_CITY_BEER_05");
	ta_sleep(0,5,5,5,"NW_CITY_HOTEL_BED_02");
};

