
instance BAU_953_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_OUT;
	id = 953;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART04,BODYTEX_N,itar_bau_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_953;
};


func void rtn_start_953()
{
	ta_pick_fp(8,5,12,5,"NW_FARM1_FIELD_03");
	ta_pick_fp(12,5,15,5,"NW_FARM1_FIELD_06");
	ta_pick_fp(15,5,18,5,"NW_FARM1_FIELD_03");
	ta_pick_fp(18,5,22,5,"NW_FARM1_FIELD_06");
	ta_sit_campfire(22,5,8,5,"NW_FARM1_MILL_05");
};

func void rtn_bugsthere_953()
{
	ta_sit_campfire(8,5,22,5,"NW_FARM1_MILL_05");
	ta_sit_campfire(22,5,8,5,"NW_FARM1_MILL_05");
};

