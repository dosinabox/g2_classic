
instance BAU_962_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_OUT;
	id = 962;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_NORMAL05,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_962;
};


func void rtn_start_962()
{
	ta_smalltalk(8,0,22,0,"NW_FARM3_STABLE_OUT_03");
	ta_sit_campfire(22,0,8,0,"NW_FARM3_STABLE_REST_02");
};

func void rtn_fleefrompass_962()
{
	ta_stand_wp(8,0,22,0,"NW_BIGMILL_MALAKSVERSTECK_06");
	ta_stand_wp(22,0,8,0,"NW_BIGMILL_MALAKSVERSTECK_06");
};

