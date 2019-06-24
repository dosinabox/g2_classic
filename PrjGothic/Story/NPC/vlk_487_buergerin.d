
instance VLK_487_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 487;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe1",FACEBABE_N_ANNE,BODYTEX_N,itar_vlkbabe_l);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_487;
};


func void rtn_start_487()
{
	ta_stomp_herb(5,0,8,0,"NW_CITY_PATH_HABOUR_04_STOMPER");
	ta_smalltalk(8,0,12,0,"NW_CITY_PATH_HABOUR_04_01");
	ta_cook_stove(12,0,12,30,"NW_CITY_PATH_HABOUR_04_01");
	ta_smalltalk(12,30,16,0,"NW_CITY_PATH_HABOUR_04_01");
	ta_stomp_herb(16,0,19,30,"NW_CITY_PATH_HABOUR_04_STOMPER");
	ta_cook_stove(19,30,22,0,"NW_CITY_HABOUR_HUT_04_IN");
	ta_sleep(22,0,5,0,"NW_CITY_HABOUR_HUT_04_BED_01");
};

