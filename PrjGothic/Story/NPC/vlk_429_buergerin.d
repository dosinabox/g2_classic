
instance VLK_429_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 429;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe4",FACEBABE_N_VLKBLONDE,BODYTEX_N,itar_vlkbabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_429;
};


func void rtn_start_429()
{
	ta_smalltalk(5,5,12,5,"NW_CITY_HABOUR_POOR_AREA_PATH_06");
	ta_stomp_herb(12,5,22,5,"NW_CITY_HABOUR_POOR_AREA_PATH_08_A");
	ta_smalltalk(22,5,0,5,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	ta_sleep(0,5,5,5,"NW_CITY_HABOUR_HUT_03_BED_01");
};

