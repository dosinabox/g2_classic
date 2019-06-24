
instance SLD_815_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	guild = GIL_SLD;
	id = 815;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_axe);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL05,BODYTEX_N,itar_sld_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_815;
};


func void rtn_start_815()
{
	ta_sit_campfire(8,0,22,0,"NW_BIGFARM_VORPOSTEN1_01");
	ta_sit_campfire(22,0,8,0,"NW_BIGFARM_VORPOSTEN1_01");
};

func void rtn_bengarsfarm_815()
{
	ta_smalltalk(8,0,22,0,"NW_FARM3_PATH_02");
	ta_smalltalk(22,0,8,0,"NW_FARM3_PATH_02");
};

