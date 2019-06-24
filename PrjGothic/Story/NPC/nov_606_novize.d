
instance NOV_606_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	guild = GIL_NOV;
	id = 606;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL08,BODYTEX_N,itar_nov_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_606;
};


func void rtn_start_606()
{
	ta_stomp_herb(8,0,11,0,"NW_MONASTERY_WINEMAKER_04");
	ta_pray_innos_fp(11,0,12,0,"NW_MONASTERY_CHURCH_03");
	ta_stomp_herb(12,0,22,30,"NW_MONASTERY_WINEMAKER_04");
	ta_sleep(22,30,8,0,"NW_MONASTERY_NOVICE03_04");
};

