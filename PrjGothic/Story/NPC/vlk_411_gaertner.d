
instance VLK_411_GAERTNER(NPC_DEFAULT)
{
	name[0] = "Садовник";
	guild = GIL_VLK;
	id = 411;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_NORMALBART_GRAHAM,BODYTEX_N,itar_bau_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_411;
};


func void rtn_start_411()
{
	ta_rake_fp(6,30,8,30,"NW_CITY_CITYHALL_04");
	ta_rake_fp(8,30,10,30,"NW_CITY_CITYHALL_10");
	ta_rake_fp(10,30,12,30,"NW_CITY_CITYHALL_12");
	ta_rake_fp(12,30,14,30,"NW_CITY_CITYHALL_07");
	ta_rake_fp(14,30,16,30,"NW_CITY_CITYHALL_10");
	ta_rake_fp(16,30,18,30,"NW_CITY_CITYHALL_12");
	ta_rake_fp(18,30,20,30,"NW_CITY_CITYHALL_07");
	ta_rake_fp(20,30,22,0,"NW_CITY_CITYHALL_04");
	ta_sit_campfire(22,0,6,30,"NW_CITY_CITYHALL_04_B");
};

