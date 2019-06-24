
instance BAU_901_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_BAU;
	id = 901;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL03,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_901;
};


func void rtn_start_901()
{
	ta_stand_eating(8,0,20,0,"NW_BIGFARM_HOUSE_11");
	ta_sleep(20,0,8,0,"NW_BIGFARM_STABLE_SLEEP_01");
};

