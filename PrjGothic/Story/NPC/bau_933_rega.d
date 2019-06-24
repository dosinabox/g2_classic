
instance BAU_933_REGA(NPC_DEFAULT)
{
	name[0] = "ахур";
	guild = GIL_OUT;
	id = 933;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe1",FACEBABE_N_OLDBLONDE,BODYTEXBABE_N,itar_baubabe_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_933;
};


func void rtn_start_933()
{
	ta_pick_fp(8,0,22,0,"NW_FARM4_FIELD_02");
	ta_sit_campfire(22,0,8,0,"NW_FARM4_REST_02");
};

func void rtn_fleedmt_933()
{
	ta_pick_fp(8,0,22,0,"NW_FARM4_FIELD_02");
	ta_pick_fp(22,0,8,0,"NW_FARM4_FIELD_02");
};

