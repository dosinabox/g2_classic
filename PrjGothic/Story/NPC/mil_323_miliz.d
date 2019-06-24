
instance MIL_323_MILIZ(NPC_DEFAULT)
{
	name[0] = NAME_MILIZ;
	guild = GIL_MIL;
	id = 323;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_BULLIT,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_323;
};


func void rtn_start_323()
{
	ta_stand_guarding(1,0,3,0,"NW_CITY_MERCHANT_PATH_22");
	ta_stand_guarding(3,0,5,0,"NW_CITY_MAINSTREET_07");
	ta_stand_guarding(5,0,7,0,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	ta_stand_guarding(7,0,9,0,"NW_CITY_MERCHANT_PATH_22");
	ta_stand_guarding(9,0,11,0,"NW_CITY_MAINSTREET_07");
	ta_stand_guarding(11,0,13,0,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	ta_stand_guarding(13,0,15,0,"NW_CITY_MERCHANT_PATH_22");
	ta_stand_guarding(15,0,17,0,"NW_CITY_MAINSTREET_07");
	ta_stand_guarding(17,0,19,0,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
	ta_stand_guarding(19,0,21,0,"NW_CITY_MERCHANT_PATH_22");
	ta_stand_guarding(21,0,23,0,"NW_CITY_MAINSTREET_07");
	ta_stand_guarding(23,0,1,0,"NW_CITY_MERCHANT_TEMPLE_PLACE_01");
};

