
instance VLK_485_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 485;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_BabeHair",FACEBABE_N_HAIRANDCLOTH,BODYTEX_N,itar_vlkbabe_l);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_485;
};


func void rtn_start_485()
{
	ta_sit_bench(5,10,10,10,"NW_CITY_HABOUR_BENCH_02");
	ta_stand_sweeping(10,10,12,10,"NW_CITY_HABOUR_POOR_AREA_HUT_05_IN");
	ta_stomp_herb(12,10,16,5,"NW_CITY_HABOUR_POOR_AREA_PATH_06_B");
	ta_smalltalk(16,5,19,5,"NW_CITY_HABOUR_POOR_AREA_PATH_06");
	ta_sit_bench(19,5,22,55,"NW_CITY_HABOUR_BENCH_02");
	ta_sleep(22,55,5,10,"NW_CITY_HABOUR_POOR_AREA_HUT_05_BED_01");
};

