
instance MIL_337_MIKA(NPC_DEFAULT)
{
	name[0] = "Мика";
	guild = GIL_OUT;
	id = 337;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	CreateInvItems(self,itpo_health_01,4);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fatbald",FACE_L_TOUGHBART_QUENTIN,BODYTEX_L,itar_mil_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_337;
};


func void rtn_start_337()
{
	ta_stand_guarding(8,0,22,0,"NW_CITY_TO_FOREST_01");
	ta_stand_guarding(22,0,8,0,"NW_CITY_TO_FOREST_01");
};

func void rtn_akil_337()
{
	ta_runtowp(6,0,18,0,"NW_FARM2_PATH_03");
	ta_runtowp(18,0,6,0,"NW_FARM2_PATH_03");
};

