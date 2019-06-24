
instance BAU_932_BALTHASAR(NPC_DEFAULT)
{
	name[0] = "Бальтазар";
	guild = GIL_OUT;
	id = 932;
	voice = 5;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_P_NORMALBART01,BODYTEX_P,itar_bau_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_932;
};


func void rtn_start_932()
{
	ta_stand_eating(8,0,22,0,"NW_FARM4_BALTHASAR");
	ta_stand_eating(22,0,8,0,"NW_FARM4_BALTHASAR");
};

func void rtn_fleedmt_932()
{
	ta_stand_eating(8,0,22,0,"NW_FLEEDMT_KAP3");
	ta_stand_eating(22,0,8,0,"NW_FLEEDMT_KAP3");
};

func void rtn_bengarsweide_932()
{
	ta_stand_eating(8,0,22,0,"NW_BIGMILL_FARM3_BALTHASAR");
	ta_stand_eating(22,0,8,0,"NW_BIGMILL_FARM3_BALTHASAR");
};

func void rtn_test_932()
{
	ta_stand_eating(8,0,22,0,"FARM3");
	ta_stand_eating(22,0,8,0,"FARM3");
};

