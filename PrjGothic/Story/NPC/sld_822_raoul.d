
instance SLD_822_RAOUL(NPC_DEFAULT)
{
	name[0] = "Рауль";
	guild = GIL_SLD;
	id = 822;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_L_IAN,BODYTEX_L,itar_sld_l);
	Mdl_SetModelFatness(self,1.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_prestart_822;
};


func void rtn_prestart_822()
{
	ta_stand_guarding(8,0,22,0,"NW_BIGFARM_PATH_01");
	ta_stand_guarding(22,0,8,0,"NW_BIGFARM_PATH_01");
};

