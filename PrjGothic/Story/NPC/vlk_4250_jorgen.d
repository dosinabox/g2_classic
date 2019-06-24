
instance VLK_4250_JORGEN(NPC_DEFAULT)
{
	name[0] = "Йорген";
	guild = GIL_NONE;
	id = 4250;
	voice = 7;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_TOUGH_SKIP,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,70);
	daily_routine = rtn_start_4250;
};


func void rtn_start_4250()
{
	ta_stand_armscrossed(8,0,20,0,"NW_MONASTERY_BRIDGE_01");
	ta_stand_armscrossed(20,0,8,0,"NW_MONASTERY_BRIDGE_01");
};

func void rtn_kloster_4250()
{
	ta_stand_armscrossed(8,0,20,0,"NW_MONASTERY_PLACE_06");
	ta_sleep(20,0,8,0,"NW_MONASTERY_NOVICE04_06");
};

func void rtn_rausauskloster_4250()
{
	ta_stand_armscrossed(8,0,20,0,"NW_BIGFARM_KITCHEN_OUT_06");
	ta_stand_armscrossed(20,0,8,0,"NW_BIGFARM_KITCHEN_OUT_06");
};

func void rtn_waitforshipcaptain_4250()
{
	ta_sit_bench(8,0,20,0,"NW_WAITFOR_SHIP_CAPTAIN");
	ta_sit_bench(20,0,8,0,"NW_WAITFOR_SHIP_CAPTAIN");
};

func void rtn_allonboard_4250()
{
	ta_stand_wp(8,0,23,0,"SHIP_CREW_CAPTAIN");
	ta_sleep(23,0,8,0,"SHIP_IN_06");
};

