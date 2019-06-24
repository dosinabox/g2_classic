
instance SLD_818_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	guild = GIL_SLD;
	id = 818;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_axe);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_NORMALBART02,BODYTEX_L,itar_sld_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_818;
};


func void rtn_start_818()
{
	ta_smalltalk(7,50,22,50,"NW_BIGFARM_PATH_02");
	ta_sit_chair(22,50,7,50,"NW_BIGFARM_KITCHEN_09");
};

