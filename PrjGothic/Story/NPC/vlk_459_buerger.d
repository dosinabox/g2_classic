
instance VLK_459_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 459;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_WEAK_CUTTER,BODYTEX_P,itar_vlk_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_459;
};


func void rtn_start_459()
{
	ta_smalltalk(5,30,11,35,"NW_CITY_HABOUR_06");
	ta_stand_drinking(11,35,13,30,"NW_CITY_HABOUR_TAVERN01_01");
	ta_smalltalk(13,30,17,35,"NW_CITY_HABOUR_04");
	ta_stand_drinking(17,35,19,10,"NW_CITY_HABOUR_TAVERN01_01");
	ta_smalltalk(19,10,0,0,"NW_CITY_HABOUR_TAVERN01_06");
	ta_stand_drinking(0,0,2,0,"NW_CITY_HABOUR_TAVERN01_01");
	ta_sleep(2,0,5,30,"NW_CITY_HABOUR_POOR_AREA_HUT_07_BED_02");
};

