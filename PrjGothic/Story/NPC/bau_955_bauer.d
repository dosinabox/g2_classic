
instance BAU_955_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_OUT;
	id = 955;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL06,BODYTEX_N,itar_bau_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_955;
};


func void rtn_start_955()
{
	ta_pick_fp(8,10,12,10,"NW_FARM1_FIELD_07");
	ta_pick_fp(12,10,15,10,"NW_FARM1_FIELD_02");
	ta_pick_fp(15,10,18,10,"NW_FARM1_FIELD_07");
	ta_pick_fp(18,10,22,10,"NW_FARM1_FIELD_02");
	ta_sit_campfire(22,10,8,10,"NW_FARM1_MILL_05");
};

func void rtn_bugsthere_955()
{
	ta_sit_campfire(8,10,22,10,"NW_FARM1_MILL_05");
	ta_sit_campfire(22,10,8,10,"NW_FARM1_MILL_05");
};

