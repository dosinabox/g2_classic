
instance VLK_460_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 460;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_dagger);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL_OLLI_KAHN,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_460;
};


func void rtn_start_460()
{
	ta_smalltalk(5,35,11,30,"NW_CITY_HABOUR_05");
	ta_stand_drinking(11,30,13,35,"NW_CITY_HABOUR_03");
	ta_smalltalk(13,35,17,30,"NW_CITY_HABOUR_03");
	ta_stand_drinking(17,30,23,30,"NW_CITY_HABOUR_TAVERN01_01");
	ta_sleep(23,30,5,35,"NW_CITY_HABOUR_POOR_AREA_HUT_01_BED_02");
};

