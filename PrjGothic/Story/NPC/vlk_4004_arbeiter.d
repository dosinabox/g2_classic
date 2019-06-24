
instance VLK_4004_ARBEITER(NPC_DEFAULT)
{
	name[0] = NAME_ARBEITER;
	guild = GIL_VLK;
	id = 4004;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_CAVALORN,BODYTEX_B,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4004;
};


func void rtn_start_4004()
{
	ta_stand_sweeping(6,35,8,0,"NW_CITY_UPTOWN_PATH_11");
	ta_stand_sweeping(8,0,10,0,"NW_CITY_UPTOWN_PATH_12");
	ta_stand_sweeping(10,0,12,0,"NW_CITY_SMALLTALK_04");
	ta_sit_bench(12,0,15,0,"NW_CITY_UPTOWN_PATH_24");
	ta_stand_sweeping(15,0,17,0,"NW_CITY_UPTOWN_PATH_11");
	ta_stand_sweeping(17,0,19,0,"NW_CITY_UPTOWN_PATH_12");
	ta_stand_sweeping(19,0,21,0,"NW_CITY_SMALLTALK_04");
	ta_sit_bench(21,0,0,5,"NW_CITY_UPTOWN_PATH_24");
	ta_sit_campfire(0,5,6,35,"NW_CITY_UPTOWN_PATH_20_B");
};

