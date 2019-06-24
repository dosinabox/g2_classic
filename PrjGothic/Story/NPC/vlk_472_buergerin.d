
instance VLK_472_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 472;
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
	daily_routine = rtn_start_472;
};


func void rtn_start_472()
{
	ta_smalltalk(5,0,12,35,"NW_CITY_HABOUR_JACK");
	ta_smalltalk(12,35,18,0,"NW_CITY_HABOUR_POOR_AREA_01");
	ta_sweep_fp(18,0,22,0,"NW_CITY_HABOUR_POOR_AREA_HUT_07_01");
	ta_sleep(22,0,5,0,"NW_CITY_HABOUR_POOR_AREA_HUT_07_BED_01");
};

