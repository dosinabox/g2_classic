
instance BAU_965_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_OUT;
	id = 965;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_NORMALBART_RUFUS,BODYTEX_L,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_965;
};


func void rtn_start_965()
{
	ta_smalltalk(8,0,22,0,"NW_FARM3_STABLE_OUT_03");
	ta_sit_campfire(22,0,8,0,"NW_FARM3_HOUSE_REST_01");
};

func void rtn_fleefrompass_965()
{
	ta_sit_campfire(8,0,22,0,"NW_BIGMILL_MALAKSVERSTECK_05");
	ta_sit_campfire(22,0,8,0,"NW_BIGMILL_MALAKSVERSTECK_05");
};

