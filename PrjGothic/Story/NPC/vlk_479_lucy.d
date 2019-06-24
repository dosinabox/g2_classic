
instance VLK_479_LUCY(NPC_DEFAULT)
{
	name[0] = "Люси";
	guild = GIL_VLK;
	id = 479;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe1",FACEBABE_N_ANNE,BODYTEX_N,itar_baubabe_l);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,35);
	daily_routine = rtn_start_479;
};


func void rtn_start_479()
{
	ta_rake_fp(5,0,19,0,"NW_CITY_PICK_02");
	ta_cook_stove(19,0,22,0,"NW_CITY_HABOUR_HUT_07_IN");
	ta_sleep(22,0,5,0,"NW_CITY_HABOUR_HUT_07_BED_01");
};

