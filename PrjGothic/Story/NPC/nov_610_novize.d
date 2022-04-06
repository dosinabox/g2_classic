
instance NOV_610_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	guild = GIL_NOV;
	id = 610;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL04,BODYTEX_N,itar_nov_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_610;
};


func void rtn_start_610()
{
	ta_pick_fp(8,0,13,0,"NW_MONASTERY_HERB_03");
	ta_pray_innos_fp(13,0,14,0,"NW_MONASTERY_CHURCH_03");
	ta_pick_fp(14,0,22,50,"NW_MONASTERY_HERB_03");
	ta_sleep(22,50,8,0,"NW_MONASTERY_NOVICE04_06");
};

