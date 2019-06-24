
instance VLK_470_SARAH(NPC_DEFAULT)
{
	name[0] = "Сара";
	guild = GIL_VLK;
	id = 470;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_N_BLONDIE,BODYTEXBABE_N,itar_vlkbabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_470;
};


func void rtn_start_470()
{
	ta_stand_armscrossed(5,15,20,15,"NW_CITY_SARAH");
	ta_sleep(20,15,5,15,"NW_CITY_HOTEL_BED_08");
};

func void rtn_knast_470()
{
	ta_stand_armscrossed(8,0,20,0,"NW_CITY_HABOUR_KASERN_RENGARU");
	ta_stand_armscrossed(20,0,8,0,"NW_CITY_HABOUR_KASERN_RENGARU");
};

func void rtn_tot_470()
{
	ta_stand_armscrossed(5,15,20,15,"TOT");
	ta_sleep(20,15,5,15,"TOT");
};

