
instance VLK_425_REGIS(NPC_DEFAULT)
{
	name[0] = "Регис";
	guild = GIL_VLK;
	id = 425;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_MORDRAG,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_425;
};


func void rtn_start_425()
{
	ta_sit_bench(5,30,20,30,"NW_CITY_REGIS");
	ta_smalltalk(20,30,0,30,"NW_CITY_MERCHANT_PATH_14_A");
	ta_sit_chair(0,30,5,30,"NW_CITY_TAVERN_IN_04");
};

