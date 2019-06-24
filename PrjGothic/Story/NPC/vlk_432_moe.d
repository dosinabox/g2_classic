
instance VLK_432_MOE(NPC_DEFAULT)
{
	name[0] = "Мо";
	guild = GIL_NONE;
	id = 432;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_SCAR,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_432;
};


func void rtn_start_432()
{
	ta_stand_guarding(8,0,23,0,"NW_CITY_PATH_HABOUR_02_02");
	ta_stand_guarding(23,0,8,0,"NW_CITY_PATH_HABOUR_02_02");
};

