
instance VLK_407_HAKON(NPC_DEFAULT)
{
	name[0] = "Хакон";
	guild = GIL_VLK;
	id = 407;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_shortsword2);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART20,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_407;
};


func void rtn_start_407()
{
	ta_stand_armscrossed(5,10,19,50,"NW_CITY_HAKON");
	ta_smoke_waterpipe(19,50,0,10,"NW_CITY_RAUCH_02");
	ta_sleep(0,10,5,10,"NW_CITY_HOTEL_BED_04");
};

