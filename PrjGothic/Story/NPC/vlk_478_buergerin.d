
instance VLK_478_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 478;
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
	b_setfightskills(self,15);
	daily_routine = rtn_start_478;
};


func void rtn_start_478()
{
	ta_pick_fp(5,0,17,0,"NW_CITY_PICK_01");
	ta_stomp_herb(17,0,22,0,"NW_CITY_HABOUR_STOMPER_02");
	ta_sleep(22,0,5,0,"NW_CITY_HABOUR_HUT_05_BED_02");
};

