
instance NOV_611_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	guild = GIL_NOV;
	id = 611;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMAL03,BODYTEX_N,itar_nov_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_611;
};


func void rtn_start_611()
{
	ta_pray_innos_fp(8,0,9,0,"NW_MONASTERY_CHURCH_03");
	ta_smalltalk(9,0,23,5,"NW_MONASTERY_GRASS_01");
	ta_sleep(23,5,8,0,"NW_MONASTERY_NOVICE02_04");
};

func void rtn_fegen_611()
{
	ta_stand_sweeping(8,0,23,5,"NW_MONASTERY_NOVICE01_02");
	ta_stand_sweeping(23,5,8,0,"NW_MONASTERY_NOVICE01_02");
};

