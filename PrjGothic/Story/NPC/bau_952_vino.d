
instance BAU_952_VINO(NPC_DEFAULT)
{
	name[0] = "Вино";
	guild = GIL_OUT;
	id = 952;
	voice = 5;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fatbald",FACE_N_WEAK_HEREK,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_952;
};


func void rtn_start_952()
{
	ta_rake_fp(8,0,12,0,"NW_FARM1_FIELD_04");
	ta_rake_fp(12,0,15,0,"NW_FARM1_FIELD_05");
	ta_rake_fp(15,0,18,0,"NW_FARM1_FIELD_04");
	ta_rake_fp(18,0,22,0,"NW_FARM1_FIELD_05");
	ta_sleep(22,0,8,0,"NW_FARM1_INSTABLE_BED");
};

func void rtn_bugsthere_952()
{
	ta_stand_drinking(8,0,22,0,"NW_FARM1_ENTRANCE_03");
	ta_sleep(22,0,8,0,"NW_FARM1_INSTABLE_BED");
};

func void rtn_obesessionritual_952()
{
	ta_smoke_joint(7,30,23,0,"NW_LITTLESTONEHENDGE_01");
	ta_smoke_joint(23,0,7,30,"NW_LITTLESTONEHENDGE_01");
};

func void rtn_kloster_952()
{
	ta_stand_drinking(8,0,22,0,"NW_MONASTERY_PLACE_07");
	ta_sleep(22,0,8,0,"NW_MONASTERY_NOVICE04_07");
};

func void rtn_flee_952()
{
	ta_stand_drinking(8,0,22,0,"NW_TAVERNE_CROSS");
	ta_sleep(22,0,8,0,"NW_TAVERNE_CROSS");
};

