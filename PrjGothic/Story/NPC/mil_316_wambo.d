
instance MIL_316_WAMBO(NPC_DEFAULT)
{
	name[0] = "Вамбо";
	guild = GIL_MIL;
	id = 316;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	CreateInvItems(self,itke_city_tower_04,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART16,BODYTEX_N,itar_mil_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_316;
};


func void rtn_start_316()
{
	ta_stand_guarding(12,0,14,0,"NW_CITY_UPTOWN_PATH_05");
	ta_stand_armscrossed(14,0,16,0,"NW_CITY_UPTOWN_PATH_09");
	ta_stand_guarding(16,0,18,0,"NW_CITY_UPTOWN_PATH_13");
	ta_stand_guarding(18,0,20,0,"NW_CITY_UPTOWN_PATH_05");
	ta_stand_armscrossed(20,0,22,0,"NW_CITY_UPTOWN_PATH_09");
	ta_stand_guarding(22,0,23,30,"NW_CITY_UPTOWN_PATH_13");
	ta_stand_guarding(23,30,1,0,"NW_CITY_UPTOWN_PATH_05");
	ta_stand_armscrossed(1,0,2,30,"NW_CITY_UPTOWN_PATH_13");
	ta_stand_guarding(2,30,4,0,"NW_CITY_UPTOWN_PATH_14");
	ta_stand_guarding(4,0,5,30,"NW_CITY_UPTOWN_PATH_09");
	ta_stand_guarding(5,30,8,0,"NW_CITY_UPTOWN_PATH_05");
	ta_stand_armscrossed(8,0,10,0,"NW_CITY_UPTOWN_PATH_09");
	ta_stand_guarding(10,0,12,0,"NW_CITY_UPTOWN_PATH_13");
};

func void rtn_drink_316()
{
	ta_stand_guarding(12,0,14,0,"NW_CITY_UPTOWN_PATH_05");
	ta_stand_armscrossed(14,0,16,0,"NW_CITY_UPTOWN_PATH_09");
	ta_stand_guarding(16,0,18,0,"NW_CITY_UPTOWN_PATH_13");
	ta_stand_guarding(18,0,20,0,"NW_CITY_UPTOWN_PATH_05");
	ta_stand_drinking(20,0,5,30,"NW_CITY_TAVERN_IN_04");
	ta_stand_guarding(5,30,8,0,"NW_CITY_UPTOWN_PATH_05");
	ta_stand_armscrossed(8,0,10,0,"NW_CITY_UPTOWN_PATH_09");
	ta_stand_guarding(10,0,12,0,"NW_CITY_UPTOWN_PATH_13");
};

