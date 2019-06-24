
instance VLK_408_JORA(NPC_DEFAULT)
{
	name[0] = "Джора";
	guild = GIL_VLK;
	id = 408;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_alrikssword_mis);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL02,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_408;
};


func void rtn_start_408()
{
	ta_stand_armscrossed(5,15,20,4,"NW_CITY_MERCHANT_PATH_38");
	ta_smalltalk(20,4,0,6,"NW_CITY_BEER_06");
	ta_sleep(0,6,5,15,"NW_CITY_HOTEL_BED_03");
};

