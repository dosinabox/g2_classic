
instance NOV_603_AGON(NPC_DEFAULT)
{
	name[0] = "Агон";
	guild = GIL_NOV;
	id = 603;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL01,BODYTEX_N,itar_nov_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_603;
};


func void rtn_start_603()
{
	ta_rake_fp(8,0,9,0,"NW_MONASTERY_HERB_05");
	ta_pray_innos_fp(9,0,10,0,"NW_MONASTERY_CHURCH_03");
	ta_rake_fp(10,0,22,10,"NW_MONASTERY_HERB_05");
	ta_sleep(22,10,8,0,"NW_MONASTERY_NOVICE03_07");
};

func void rtn_golemlives_603()
{
	ta_stand_guarding(8,0,23,10,"NW_TROLLAREA_PATH_02");
	ta_stand_guarding(23,10,8,0,"NW_TROLLAREA_PATH_02");
};

func void rtn_golemdead_603()
{
	ta_stand_guarding(8,0,23,10,"NW_MAGECAVE_RUNE");
	ta_stand_guarding(23,10,8,0,"NW_MAGECAVE_RUNE");
};

func void rtn_stillalive_603()
{
	ta_stand_guarding(8,0,23,10,"TAVERNE");
	ta_stand_guarding(23,10,8,0,"TAVERNE");
};

