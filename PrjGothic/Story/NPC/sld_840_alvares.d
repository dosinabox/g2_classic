
instance SLD_840_ALVARES(NPC_DEFAULT)
{
	name[0] = "Альварес";
	guild = GIL_BDT;
	id = 840;
	voice = 11;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_2h_sld_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_B_TOUGH_SILAS,BODYTEX_B,itar_sld_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,25);
	daily_routine = rtn_prestart_840;
};


func void rtn_prestart_840()
{
	ta_smalltalk(8,0,22,0,"NW_FARM2_PATH_02");
	ta_smalltalk(22,0,8,0,"NW_FARM2_PATH_02");
};

func void rtn_start_840()
{
	ta_smalltalk(8,0,22,0,"NW_FARM2_TO_TAVERN_08");
	ta_smalltalk(22,0,8,0,"NW_FARM2_TO_TAVERN_08");
};

func void rtn_bigfarm_840()
{
	ta_smalltalk(8,0,22,0,"NW_BIGFARM_HOUSE_OUT_05");
	ta_sit_chair(22,0,8,0,"NW_BIGFARM_HOUSE_12");
};

