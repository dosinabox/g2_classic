
instance VLK_430_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 430;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe8",FACEBABE_N_LILO,BODYTEX_N,itar_vlkbabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_430;
};


func void rtn_start_430()
{
	ta_smalltalk(5,7,12,7,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	ta_cook_stove(12,7,16,0,"NW_CITY_HABOUR_POOR_AREA_HUT_04_BED_01");
	ta_smalltalk(16,7,19,7,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	ta_sweep_fp(19,7,22,7,"NW_CITY_HABOUR_POOR_AREA_HUT_04_IN_B");
	ta_smalltalk(22,7,0,7,"NW_CITY_HABOUR_POOR_AREA_PATH_07");
	ta_sleep(0,7,5,7,"NW_CITY_HABOUR_POOR_AREA_HUT_04_BED_01");
};

