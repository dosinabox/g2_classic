
instance VLK_473_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 473;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe8",FACEBABE_N_LILO,BODYTEX_N,itar_vlkbabe_l);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,35);
	daily_routine = rtn_start_473;
};


func void rtn_start_473()
{
	ta_smalltalk(5,5,12,30,"NW_CITY_HABOUR_PUFF_02");
	ta_smalltalk(12,30,18,5,"NW_CITY_WAY_TO_SHIP_01");
	ta_stand_sweeping(18,5,22,5,"NW_CITY_HABOUR_POOR_AREA_HUT_01_IN");
	ta_sleep(22,5,5,5,"NW_CITY_HABOUR_POOR_AREA_HUT_01_BED_01");
};

