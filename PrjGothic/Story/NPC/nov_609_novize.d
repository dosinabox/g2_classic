
instance NOV_609_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	guild = GIL_NOV;
	id = 609;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL06,BODYTEX_N,itar_nov_l);
	Mdl_SetModelFatness(self,-1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_609;
};


func void rtn_start_609()
{
	ta_pray_innos_fp(8,0,23,0,"NW_MONASTERY_CHURCH_03");
	ta_sleep(23,0,8,0,"NW_MONASTERY_NOVICE02_06");
};

func void rtn_fegen_609()
{
	ta_stand_sweeping(8,0,23,0,"NW_MONASTERY_NOVICE02_02");
	ta_stand_sweeping(23,0,8,0,"NW_MONASTERY_NOVICE02_02");
};

