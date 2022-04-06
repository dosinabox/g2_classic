
instance NOV_607_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	guild = GIL_NOV;
	id = 607;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_NORMALBART_DEXTER,BODYTEX_N,itar_nov_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_607;
};


func void rtn_start_607()
{
	ta_stomp_herb(8,0,12,0,"NW_MONASTERY_WINEMAKER_05");
	ta_pray_innos_fp(12,0,13,0,"NW_MONASTERY_CHURCH_03");
	ta_stomp_herb(13,0,22,15,"NW_MONASTERY_WINEMAKER_05");
	ta_sleep(22,15,8,0,"NW_MONASTERY_NOVICE03_05");
};

func void rtn_exchange_607()
{
	ta_smalltalk(9,0,22,4,"NW_MONASTERY_GRASS_01");
	ta_sleep(22,4,9,0,"NW_MONASTERY_NOVICE03_05");
};

