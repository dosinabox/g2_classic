
instance NOV_612_BABO(NPC_DEFAULT)
{
	name[0] = "Бабо";
	guild = GIL_NOV;
	id = 612;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMAL07,BODYTEX_N,itar_nov_l);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_612;
};


func void rtn_start_612()
{
	ta_stand_sweeping(8,0,14,0,"NW_MONASTERY_CORRIDOR_10");
	ta_pray_innos_fp(14,0,15,0,"NW_MONASTERY_CHURCH_03");
	ta_stand_sweeping(15,0,23,30,"NW_MONASTERY_CORRIDOR_10");
	ta_sleep(23,30,8,0,"NW_MONASTERY_NOVICE04_05");
};

func void rtn_train_612()
{
	ta_sleep(23,30,5,0,"NW_MONASTERY_NOVICE04_05");
	ta_practice_sword(5,0,7,0,"NW_MONASTERY_TRAIN_02");
	ta_stand_sweeping(7,0,14,0,"NW_MONASTERY_CORRIDOR_10");
	ta_pray_innos_fp(14,0,15,0,"NW_MONASTERY_CHURCH_03");
	ta_stand_sweeping(15,0,23,30,"NW_MONASTERY_CORRIDOR_10");
};

func void rtn_fegen_612()
{
	ta_stand_sweeping(8,0,23,30,"NW_MONASTERY_NOVICE04_02");
	ta_stand_sweeping(23,30,8,0,"NW_MONASTERY_NOVICE04_02");
};

func void rtn_favour_612()
{
	ta_rake_fp(8,0,23,30,"NW_MONASTERY_HERB_05");
	ta_sleep(23,30,8,0,"NW_MONASTERY_NOVICE04_05");
};

