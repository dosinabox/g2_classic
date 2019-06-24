
instance BAU_905_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_BAU;
	id = 905;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL18,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,20);
	daily_routine = rtn_start_905;
};


func void rtn_start_905()
{
	ta_pick_fp(7,0,22,0,"NW_BIGFARM_FIELD_01");
	ta_sit_chair(22,0,7,0,"NW_BIGFARM_STABLE_06");
};

