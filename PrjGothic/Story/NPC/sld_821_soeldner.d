
instance SLD_821_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	guild = GIL_SLD;
	id = 821;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_GOMEZ,BODYTEX_N,itar_sld_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_821;
};


func void rtn_start_821()
{
	ta_smalltalk(7,30,23,30,"NW_BIGFARM_PATH_04_1");
	ta_sleep(23,30,7,30,"NW_BIGFARM_HOUSE_08");
};

func void rtn_rodweg_821()
{
	ta_smalltalk(7,55,22,55,"NW_BIGFARM_PATH_02");
	ta_sleep(22,55,7,55,"NW_BIGFARM_HOUSE_08");
};

