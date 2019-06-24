
instance BAU_950_LOBART(NPC_DEFAULT)
{
	name[0] = "Лобарт";
	guild = GIL_OUT;
	id = 950;
	voice = 5;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART_SENYAN,BODYTEX_N,itar_bau_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_950;
};


func void rtn_start_950()
{
	ta_stand_guarding(7,30,23,0,"NW_FARM1_LOBART");
	ta_sleep(23,0,7,30,"NW_FARM1_INHOUSE_BED_01");
};

func void rtn_obesessionritual_950()
{
	ta_stand_guarding(7,30,23,0,"NW_FARM1_OUT_05");
	ta_stand_guarding(23,0,7,30,"NW_FARM1_OUT_05");
};

