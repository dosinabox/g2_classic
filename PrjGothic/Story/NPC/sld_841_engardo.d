
instance SLD_841_ENGARDO(NPC_DEFAULT)
{
	name[0] = "Ёндарго";
	guild = GIL_BDT;
	id = 841;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	EquipItem(self,itmw_2h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_NORMAL_ERPRESSER,BODYTEX_N,itar_sld_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,25);
	daily_routine = rtn_prestart_841;
};


func void rtn_prestart_841()
{
	ta_stand_guarding(8,0,22,0,"NW_FARM2_PATH_02");
	ta_stand_guarding(22,0,8,0,"NW_FARM2_PATH_02");
};

func void rtn_start_841()
{
	ta_smalltalk(8,0,22,0,"NW_FARM2_TO_TAVERN_08");
	ta_smalltalk(22,0,8,0,"NW_FARM2_TO_TAVERN_08");
};

func void rtn_bigfarm_841()
{
	ta_smalltalk(8,0,22,0,"NW_BIGFARM_HOUSE_OUT_05");
	ta_sit_chair(22,0,8,0,"NW_BIGFARM_HOUSE_12");
};

