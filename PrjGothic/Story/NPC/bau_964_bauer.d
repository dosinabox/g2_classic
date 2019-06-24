
instance BAU_964_BAUER(NPC_DEFAULT)
{
	name[0] = "Фермер";
	guild = GIL_OUT;
	id = 964;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_NORMALBART11,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_964;
};


func void rtn_start_964()
{
	ta_saw(8,0,21,0,"NW_FARM3_STABLE_OUT_01");
	ta_sit_campfire(21,0,8,0,"NW_FARM3_STABLE_REST_02");
};

func void rtn_fleefrompass_964()
{
	ta_sit_campfire(8,0,22,0,"NW_BIGMILL_MALAKSVERSTECK_05");
	ta_sit_campfire(22,0,8,0,"NW_BIGMILL_MALAKSVERSTECK_05");
};

