
instance VLK_437_BRAHIM(NPC_DEFAULT)
{
	name[0] = "Ибрагим";
	guild = GIL_VLK;
	id = 437;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_COOLPOCK,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_437;
};


func void rtn_start_437()
{
	ta_sit_bench(8,0,22,0,"NW_CITY_HABOUR_HUT_01_FRONT");
	ta_sleep(22,0,8,0,"NW_CITY_BED_BRAHIM");
};

