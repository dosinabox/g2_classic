
instance PAL_240_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 240;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMAL20,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_240;
};


func void rtn_start_240()
{
	ta_stand_guarding(6,0,7,0,"NW_CITY_PALCAMP_08");
	ta_stand_guarding(7,0,8,0,"NW_CITY_WAY_TO_SHIP_23");
	ta_stand_guarding(8,0,9,0,"NW_CITY_PALCAMP_08");
	ta_stand_guarding(9,0,10,0,"NW_CITY_WAY_TO_SHIP_23");
	ta_stand_guarding(10,0,11,0,"NW_CITY_PALCAMP_08");
	ta_stand_guarding(11,0,12,0,"NW_CITY_WAY_TO_SHIP_23");
	ta_stand_guarding(12,0,13,0,"NW_CITY_PALCAMP_08");
	ta_stand_guarding(13,0,14,0,"NW_CITY_WAY_TO_SHIP_23");
	ta_stand_guarding(14,0,15,0,"NW_CITY_PALCAMP_08");
	ta_stand_guarding(15,0,16,0,"NW_CITY_WAY_TO_SHIP_23");
	ta_stand_guarding(16,0,17,0,"NW_CITY_PALCAMP_08");
	ta_stand_guarding(17,0,18,0,"NW_CITY_WAY_TO_SHIP_23");
	ta_stand_guarding(18,0,19,0,"NW_CITY_PALCAMP_08");
	ta_stand_guarding(19,0,20,0,"NW_CITY_WAY_TO_SHIP_23");
	ta_stand_guarding(20,0,21,0,"NW_CITY_PALCAMP_08");
	ta_stand_guarding(21,0,22,0,"NW_CITY_WAY_TO_SHIP_23");
	ta_stand_guarding(22,0,23,0,"NW_CITY_PALCAMP_08");
	ta_stand_guarding(23,0,0,0,"NW_CITY_WAY_TO_SHIP_23");
	ta_stand_guarding(0,0,1,0,"NW_CITY_PALCAMP_08");
	ta_stand_guarding(1,0,2,0,"NW_CITY_WAY_TO_SHIP_23");
	ta_stand_guarding(2,0,3,0,"NW_CITY_PALCAMP_08");
	ta_stand_guarding(3,0,4,0,"NW_CITY_WAY_TO_SHIP_23");
	ta_stand_guarding(4,0,5,0,"NW_CITY_PALCAMP_08");
	ta_stand_guarding(5,0,6,0,"NW_CITY_WAY_TO_SHIP_23");
};

func void rtn_shipfree_240()
{
	ta_stand_wp(8,0,23,0,"NW_CITY_UPTOWNPARADE_04");
	ta_stand_wp(23,0,8,0,"NW_CITY_UPTOWNPARADE_04");
};

