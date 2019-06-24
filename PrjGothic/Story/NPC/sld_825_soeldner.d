
instance SLD_825_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	guild = GIL_SLD;
	id = 825;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_axe);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_HOMER,BODYTEX_N,itar_sld_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_825;
};


func void rtn_start_825()
{
	ta_smalltalk(8,0,22,0,"NW_BIGFARM_HOUSE_08");
	ta_smalltalk(22,0,8,0,"NW_BIGFARM_HOUSE_08");
};

