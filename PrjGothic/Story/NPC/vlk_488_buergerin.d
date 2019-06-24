
instance VLK_488_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 488;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_BabeHair",FACEBABE_N_HAIRANDCLOTH,BODYTEX_N,itar_baubabe_l);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_488;
};


func void rtn_start_488()
{
	ta_cook_stove(5,0,8,0,"NW_CITY_HABOUR_HUT_08_IN_B");
	ta_smalltalk(8,0,12,0,"NW_CITY_PATH_HABOUR_04");
	ta_stand_eating(12,0,14,0,"NW_CITY_PATH_HABOUR_03");
	ta_sweep_fp(14,0,16,0,"NW_CITY_HABOUR_HUT_08_IN_B");
	ta_stand_eating(16,0,18,0,"NW_CITY_PATH_HABOUR_03");
	ta_cook_stove(18,0,20,0,"NW_CITY_HABOUR_HUT_08_IN_B");
	ta_sweep_fp(20,0,0,0,"NW_CITY_HABOUR_HUT_08_IN_B");
	ta_sleep(0,0,5,0,"NW_CITY_HABOUR_HUT_08_BED_01");
};

