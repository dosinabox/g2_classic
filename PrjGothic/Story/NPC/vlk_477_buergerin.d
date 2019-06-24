
instance VLK_477_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 477;
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
	b_setfightskills(self,35);
	daily_routine = rtn_start_477;
};


func void rtn_start_477()
{
	ta_stand_eating(5,5,11,55,"NW_CITY_PATH_HABOUR_03");
	ta_stand_eating(11,55,14,5,"NW_CITY_WAY_TO_SHIP_01");
	ta_stand_eating(14,5,15,55,"NW_CITY_PATH_HABOUR_03");
	ta_stand_eating(15,55,19,5,"NW_CITY_WAY_TO_SHIP_01");
	ta_cook_stove(19,5,21,5,"NW_CITY_BED_BRAHIM");
	ta_sleep(21,5,5,5,"NW_CITY_BED_BRAHIM");
};

