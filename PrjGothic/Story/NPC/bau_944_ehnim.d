
instance BAU_944_EHNIM(NPC_DEFAULT)
{
	name[0] = "Ёним";
	guild = GIL_NONE;
	id = 944;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	CreateInvItems(self,itpo_health_02,1);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_P_NORMAL03,BODYTEX_P,itar_bau_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_944;
};


func void rtn_start_944()
{
	ta_rake_fp(5,0,12,0,"NW_FARM2_FIELD_03");
	ta_sit_campfire(12,0,14,0,"NW_FARM2_FIELD_03_B");
	ta_rake_fp(14,0,21,0,"NW_FARM2_FIELD_03");
	ta_sit_campfire(21,0,5,0,"NW_FARM2_OUT_03");
};

