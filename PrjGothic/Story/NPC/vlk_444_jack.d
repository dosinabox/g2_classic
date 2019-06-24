
instance VLK_444_JACK(NPC_DEFAULT)
{
	name[0] = "Джек";
	guild = GIL_VLK;
	id = 444;
	voice = 14;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_IMPORTANTOLD,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_444;
};


func void rtn_start_444()
{
	ta_sit_bench(4,45,19,45,"NW_CITY_HABOUR_06_C");
	ta_sit_throne(19,45,4,45,"NW_CITY_PUFF_THRONE");
};

func void rtn_lighthouse_444()
{
	ta_sit_throne(8,0,20,0,"NW_LIGHTHOUSE_IN_03");
	ta_sleep(20,0,8,0,"NW_LIGHTHOUSE_IN_03");
};

func void rtn_waitforshipcaptain_444()
{
	ta_sit_bench(8,0,20,0,"NW_WAITFOR_SHIP_CAPTAIN");
	ta_sit_bench(0,0,8,0,"NW_WAITFOR_SHIP_CAPTAIN");
};

func void rtn_allonboard_444()
{
	ta_stand_wp(8,0,23,0,"SHIP_CREW_CAPTAIN");
	ta_sleep(23,0,8,0,"SHIP_IN_06");
};

