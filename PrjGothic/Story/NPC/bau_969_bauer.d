
instance BAU_969_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_OUT;
	id = 969;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_GILBERT,BODYTEX_P,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_969;
};


func void rtn_start_969()
{
	ta_pick_fp(8,0,22,0,"NW_FARM3_FIELD_01");
	ta_sit_campfire(22,0,8,0,"NW_FARM3_STABLE_REST_02");
};

func void rtn_fleefrompass_969()
{
	ta_sit_campfire(8,0,22,0,"NW_BIGMILL_MALAKSVERSTECK_06");
	ta_sit_campfire(22,0,8,0,"NW_BIGMILL_MALAKSVERSTECK_06");
};

