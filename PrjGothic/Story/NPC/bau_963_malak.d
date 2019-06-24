
instance BAU_963_MALAK(NPC_DEFAULT)
{
	name[0] = "Малак";
	guild = GIL_OUT;
	id = 963;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL_SLY,BODYTEX_N,itar_bau_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,35);
	daily_routine = rtn_start_963;
};


func void rtn_start_963()
{
	ta_stand_eating(8,0,22,0,"NW_FARM3_MALAK");
	ta_stand_eating(22,0,8,0,"NW_FARM3_MALAK");
};

func void rtn_fleefrompass_963()
{
	ta_stand_eating(8,0,22,0,"NW_BIGMILL_MALAKSVERSTECK_MALAK");
	ta_stand_eating(22,0,8,0,"NW_BIGMILL_MALAKSVERSTECK_MALAK");
};

