
instance BAU_908_HODGES(NPC_DEFAULT)
{
	name[0] = "Ходжес";
	guild = GIL_BAU;
	id = 908;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	CreateInvItems(self,itmw_1h_bau_axe,1);
	CreateInvItems(self,itmw_1h_vlk_axe,1);
	CreateInvItems(self,itmw_1h_mace_l_04,1);
	CreateInvItems(self,itmw_1h_sld_axe,1);
	CreateInvItems(self,itmw_1h_sld_sword,1);
	CreateInvItems(self,itmw_schwert,1);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_NORMALBART01,BODYTEX_L,itar_bau_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_908;
};


func void rtn_start_908()
{
	ta_smith_sharp(7,0,19,0,"NW_BIGFARM_SMITH_SHARP");
	ta_sleep(19,0,7,0,"NW_BIGFARM_STABLE_SLEEP_02");
};

func void rtn_bennetweg_908()
{
	ta_stand_drinking(7,0,19,0,"NW_BIGFARM_PATH_HODGES");
	ta_stand_drinking(19,0,7,0,"NW_BIGFARM_PATH_HODGES");
};

