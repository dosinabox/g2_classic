
instance BAU_915_BAEUERIN(NPC_DEFAULT)
{
	name[0] = NAME_BAEUERIN;
	guild = GIL_BAU;
	id = 915;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe4",FACEBABE_N_VLKBLONDE,BODYTEXBABE_N,itar_baubabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_915;
};


func void rtn_start_915()
{
	ta_pick_fp(6,0,22,0,"NW_BIGFARM_FIELD_01");
	ta_sleep(22,0,6,0,"NW_BIGFARM_STABLE_SLEEP_03");
};

