
instance BAU_918_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_BAU;
	id = 918;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	b_givenpctalents(self);
	b_setfightskills(self,15);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMAL17,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = rtn_start_918;
};


func void rtn_start_918()
{
	ta_smalltalk(8,5,22,5,"NW_BIGFARM_KITCHEN_09");
	ta_smalltalk(22,5,8,5,"NW_BIGFARM_KITCHEN_09");
};

