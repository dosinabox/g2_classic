
instance BAU_920_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_BAU;
	id = 920;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	b_givenpctalents(self);
	b_setfightskills(self,15);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART_GRAHAM,BODYTEX_N,itar_bau_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = rtn_start_920;
};


func void rtn_start_920()
{
	ta_smalltalk(7,50,21,50,"NW_BIGFARM_HOUSE_OUT_04");
	ta_smalltalk(21,50,7,50,"NW_BIGFARM_STABLE_01");
};

