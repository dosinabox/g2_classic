
instance SLD_820_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	guild = GIL_SLD;
	id = 820;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_sld_bow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_NORMAL01,BODYTEX_P,itar_sld_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_820;
};


func void rtn_start_820()
{
	ta_stand_guarding(8,0,22,0,"NW_BIGFARM_HOUSE_OUT_03");
	ta_stand_guarding(22,0,8,0,"NW_BIGFARM_HOUSE_OUT_03");
};

