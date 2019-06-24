
instance MIL_327_MILIZ(NPC_DEFAULT)
{
	name[0] = NAME_MILIZ;
	guild = GIL_MIL;
	id = 327;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL20,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_327;
};


func void rtn_start_327()
{
	ta_smalltalk(21,0,23,59,"NW_CITY_BARRACK02_SMALLTALK_01");
	ta_sleep(23,59,6,30,"NW_CITY_BARRACK01_BED_02");
	ta_stand_guarding(6,30,7,30,"NW_CITY_HABOUR_KASERN_14");
	ta_stand_guarding(7,30,8,30,"NW_CITY_HABOUR_KASERN_12");
	ta_stand_guarding(8,30,9,30,"NW_CITY_HABOUR_KASERN_10");
	ta_stand_guarding(9,30,10,30,"NW_CITY_HABOUR_KASERN_08");
	ta_stand_guarding(10,30,11,30,"NW_CITY_HABOUR_KASERN_14");
	ta_stand_guarding(11,30,12,30,"NW_CITY_HABOUR_KASERN_12");
	ta_stand_guarding(12,30,13,30,"NW_CITY_HABOUR_KASERN_10");
	ta_stand_guarding(13,30,14,30,"NW_CITY_HABOUR_KASERN_08");
	ta_stand_guarding(14,30,15,30,"NW_CITY_HABOUR_KASERN_14");
	ta_stand_guarding(15,30,16,30,"NW_CITY_HABOUR_KASERN_12");
	ta_stand_guarding(16,30,17,30,"NW_CITY_HABOUR_KASERN_10");
	ta_stand_guarding(17,30,18,30,"NW_CITY_HABOUR_KASERN_08");
	ta_stand_guarding(18,30,19,30,"NW_CITY_HABOUR_KASERN_14");
	ta_stand_guarding(19,30,21,0,"NW_CITY_HABOUR_KASERN_12");
};

