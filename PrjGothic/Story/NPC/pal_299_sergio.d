
instance PAL_299_SERGIO(NPC_DEFAULT)
{
	name[0] = "Сержио";
	guild = GIL_PAL;
	id = 299;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	CreateInvItems(self,itke_innos_mis,1);
	CreateInvItems(self,itpo_health_02,4);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMAL_ERPRESSER,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_299;
};


func void rtn_start_299()
{
	ta_pray_innos(8,0,23,0,"NW_MONASTERY_CHAPELL_02");
	ta_pray_innos(23,0,8,0,"NW_MONASTERY_CHAPELL_02");
};

func void rtn_waitforplayer_299()
{
	ta_stand_guarding(8,0,23,0,"NW_MONASTERY_PLACE_09");
	ta_stand_guarding(23,0,8,0,"NW_MONASTERY_PLACE_09");
};

func void rtn_train_299()
{
	ta_pray_innos(7,0,23,0,"NW_MONASTERY_CHAPELL_02");
	ta_pray_innos(23,0,5,0,"NW_MONASTERY_CHAPELL_02");
	ta_practice_sword(5,0,7,0,"NW_MONASTERY_TRAIN_01");
};

func void rtn_wait_299()
{
	ta_stand_guarding(8,0,23,0,"NW_MONASTERY_CHAPELL_03");
	ta_stand_guarding(23,0,8,0,"NW_MONASTERY_CHAPELL_03");
};

func void rtn_guide_299()
{
	ta_guide_player(8,0,23,0,"NW_TO_PASS_01");
	ta_guide_player(23,0,8,0,"NW_TO_PASS_01");
};

