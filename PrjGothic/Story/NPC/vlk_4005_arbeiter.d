
instance VLK_4005_ARBEITER(NPC_DEFAULT)
{
	name[0] = NAME_ARBEITER;
	guild = GIL_VLK;
	id = 4005;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL_OLLI_KAHN,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4005;
};


func void rtn_start_4005()
{
	ta_stand_sweeping(6,33,8,0,"NW_CITY_UPTOWN_PATH_07");
	ta_stand_sweeping(8,0,10,0,"NW_CITY_UPTOWN_PATH_18");
	ta_stand_sweeping(10,0,12,0,"NW_CITY_UPTOWN_PATH_03_B");
	ta_sit_bench(12,0,15,0,"NW_CITY_UPTOWN_PATH_24_B");
	ta_stand_sweeping(15,0,17,0,"NW_CITY_UPTOWN_PATH_07");
	ta_stand_sweeping(17,0,19,0,"NW_CITY_UPTOWN_PATH_18");
	ta_stand_sweeping(19,0,21,0,"NW_CITY_UPTOWN_PATH_03_B");
	ta_sit_bench(21,0,0,4,"NW_CITY_UPTOWN_PATH_24_B");
	ta_sit_campfire(0,4,6,33,"NW_CITY_SMALLTALK_05");
};

