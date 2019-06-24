
instance BAU_967_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_OUT;
	id = 967;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_JACKAL,BODYTEX_L,itar_bau_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_967;
};


func void rtn_start_967()
{
	ta_pick_fp(8,0,22,0,"NW_FARM3_FIELD_02");
	ta_sit_campfire(22,0,8,0,"NW_FARM3_STABLE_REST_01");
};

func void rtn_fleefrompass_967()
{
	ta_sit_campfire(8,0,22,0,"NW_BIGMILL_MALAKSVERSTECK_06");
	ta_sit_campfire(22,0,8,0,"NW_BIGMILL_MALAKSVERSTECK_06");
};

