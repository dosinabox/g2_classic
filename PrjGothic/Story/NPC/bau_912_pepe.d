
instance BAU_912_PEPE(NPC_DEFAULT)
{
	name[0] = "Пепе";
	guild = GIL_BAU;
	id = 912;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_MARKUS_KARK,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_912;
};


func void rtn_start_912()
{
	ta_stand_eating(8,0,22,0,"NW_BIGFARM_SHEEP2_02");
	ta_stand_eating(22,0,8,0,"NW_BIGFARM_SHEEP2_02");
};

