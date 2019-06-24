
instance BAU_943_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_OUT;
	id = 943;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_NORMAL_ORIK,BODYTEX_B,itar_bau_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_943;
};


func void rtn_start_943()
{
	ta_rake_fp(5,0,12,0,"NW_FARM2_FIELD_05");
	ta_sit_campfire(12,0,14,0,"NW_FARM2_FIELD_04_C");
	ta_rake_fp(14,0,20,52,"NW_FARM2_FIELD_05");
	ta_sit_campfire(20,52,5,0,"NW_FARM2_OUT_09");
};

