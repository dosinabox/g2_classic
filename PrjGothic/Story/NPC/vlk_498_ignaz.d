
instance VLK_498_IGNAZ(NPC_DEFAULT)
{
	name[0] = "Игнац";
	guild = GIL_VLK;
	id = 498;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_CORRISTO,BODYTEX_N,itar_smith);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_498;
};


func void rtn_start_498()
{
	ta_potion_alchemy(5,0,10,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	ta_read_bookstand(10,0,13,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	ta_sit_chair(13,0,14,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	ta_potion_alchemy(14,0,19,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	ta_read_bookstand(19,0,23,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	ta_sit_chair(23,0,0,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_WORK");
	ta_sleep(0,0,5,0,"NW_CITY_HABOUR_POOR_AREA_HUT_08_IN_BED");
};

