
instance BAU_903_BODO(NPC_DEFAULT)
{
	name[0] = "Бодо";
	guild = GIL_BAU;
	id = 903;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL16,BODYTEX_N,itar_bau_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_903;
};


func void rtn_start_903()
{
	ta_smalltalk(7,45,21,45,"NW_BIGFARM_HOUSE_OUT_04");
	ta_sit_bench(21,45,7,45,"NW_BIGFARM_PATH_03");
};

