
instance BAU_938_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_OUT;
	id = 938;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	b_givenpctalents(self);
	b_setfightskills(self,15);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_ORRY,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = rtn_start_938;
};


func void rtn_start_938()
{
	ta_pick_fp(8,0,22,0,"NW_FARM4_FIELD_02");
	ta_sit_campfire(22,0,8,0,"NW_FARM4_REST_01");
};

func void rtn_fleedmt_938()
{
	ta_rake_fp(8,0,22,0,"NW_FARM4_FIELD_02");
	ta_rake_fp(22,0,8,0,"NW_FARM4_FIELD_02");
};

