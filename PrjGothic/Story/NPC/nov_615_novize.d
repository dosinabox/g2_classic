
instance NOV_615_NOVIZE(NPC_DEFAULT)
{
	name[0] = NAME_NOVIZE;
	guild = GIL_NOV;
	id = 615;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_NORMALBART_RIORDIAN,BODYTEX_P,itar_nov_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_615;
};


func void rtn_start_615()
{
	ta_stand_sweeping(8,0,15,0,"NW_MONASTERY_CELLAR_08");
	ta_pray_innos_fp(15,0,16,0,"NW_MONASTERY_CHURCH_03");
	ta_stand_sweeping(16,0,22,0,"NW_MONASTERY_CELLAR_08");
	ta_sleep(22,0,8,0,"NW_MONASTERY_NOVICE04_04");
};

func void rtn_fegen_615()
{
	ta_stand_sweeping(8,0,22,0,"NW_MONASTERY_NOVICE03_02");
	ta_stand_sweeping(22,0,8,0,"NW_MONASTERY_NOVICE03_02");
};

