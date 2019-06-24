
instance NOV_601_IGARAZ(NPC_DEFAULT)
{
	name[0] = "Игарац";
	guild = GIL_NOV;
	id = 601;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	CreateInvItems(self,itke_igarazchest_mis,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_NORMAL_STONE,BODYTEX_N,itar_nov_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_601;
};


func void rtn_start_601()
{
	ta_smalltalk(9,0,22,4,"NW_MONASTERY_GRASS_01");
	ta_sleep(22,4,8,0,"NW_MONASTERY_NOVICE02_05");
	ta_pray_innos_fp(8,0,9,0,"NW_MONASTERY_CHURCH_03");
};

func void rtn_contest_601()
{
	ta_stand_armscrossed(8,0,23,4,"NW_TAVERNE_TROLLAREA_05");
	ta_stand_armscrossed(23,4,8,0,"NW_TAVERNE_TROLLAREA_05");
};

func void rtn_contestwait_601()
{
	ta_stand_armscrossed(8,0,23,4,"NW_TAVERNE_TROLLAREA_66");
	ta_stand_armscrossed(23,4,8,0,"NW_TAVERNE_TROLLAREA_66");
};

