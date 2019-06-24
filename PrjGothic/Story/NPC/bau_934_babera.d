
instance BAU_934_BABERA(NPC_DEFAULT)
{
	name[0] = "Бабера";
	guild = GIL_OUT;
	id = 934;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_N_BAUBLONDE,BODYTEXBABE_N,itar_baubabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_934;
};


func void rtn_start_934()
{
	ta_pick_fp(8,0,22,0,"NW_FARM4_FIELD_01");
	ta_sit_campfire(22,0,8,0,"NW_FARM4_REST_02");
};

func void rtn_fleedmt_934()
{
	ta_pick_fp(8,0,22,0,"NW_FARM4_FIELD_01");
	ta_pick_fp(22,0,8,0,"NW_FARM4_FIELD_01");
};

