
instance BAU_945_EGILL(NPC_DEFAULT)
{
	name[0] = "Ёгилл";
	guild = GIL_NONE;
	id = 945;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	CreateInvItems(self,itpo_health_02,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_P_NORMAL03,BODYTEX_P,itar_bau_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_945;
};


func void rtn_start_945()
{
	ta_pick_fp(5,0,21,0,"NW_FARM2_FIELD_02");
	ta_stand_drinking(21,0,0,2,"NW_FARM2_OUT_10");
	ta_sit_bench(0,2,5,0,"NW_FARM2_OUT_06");
};

