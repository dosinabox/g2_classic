
instance BAU_907_WASILI(NPC_DEFAULT)
{
	name[0] = "Василий";
	guild = GIL_BAU;
	id = 907;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART02,BODYTEX_N,itar_bau_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_907;
};


func void rtn_start_907()
{
	ta_stand_guarding(8,0,22,0,"NW_BIGFARM_HOUSE_16");
	ta_sit_chair(22,0,8,0,"NW_BIGFARM_HOUSE_16");
};

