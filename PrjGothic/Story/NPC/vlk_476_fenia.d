
instance VLK_476_FENIA(NPC_DEFAULT)
{
	name[0] = "Ôåíÿ";
	guild = GIL_VLK;
	id = 476;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe1",FACEBABE_N_GREYCLOTH,BODYTEX_N,itar_vlkbabe_l);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_476;
};


func void rtn_start_476()
{
	ta_stand_guarding(4,55,20,5,"NW_CITY_PATH_HABOUR_03_01");
	ta_stomp_herb(20,5,22,5,"NW_CITY_HABOUR_POOR_AREA_PATH_01");
	ta_sleep(22,5,4,55,"NW_CITY_BED_HALVOR_WEIB");
};

