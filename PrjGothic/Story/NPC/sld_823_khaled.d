
instance SLD_823_KHALED(NPC_DEFAULT)
{
	name[0] = "Халед";
	guild = GIL_SLD;
	id = 823;
	voice = 11;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_B_THORUS,BODYTEX_B,itar_sld_h);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_823;
};


func void rtn_start_823()
{
	ta_stand_guarding(7,55,21,55,"NW_BIGFARM_HOUSE_12");
	ta_stand_eating(21,55,23,55,"NW_BIGFARM_HOUSE_UP2_06");
	ta_sleep(23,55,7,55,"NW_BIGFARM_HOUSE_UP2_02");
};

