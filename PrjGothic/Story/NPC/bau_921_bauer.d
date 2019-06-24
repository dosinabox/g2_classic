
instance BAU_921_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_BAU;
	id = 921;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	b_givenpctalents(self);
	b_setfightskills(self,15);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART_DUSTY,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	daily_routine = rtn_start_921;
};


func void rtn_start_921()
{
	ta_smalltalk(7,55,19,55,"NW_BIGFARM_STABLE_OUT_01");
	ta_smalltalk(19,55,21,55,"NW_BIGFARM_PATH_04_1");
	ta_smalltalk(21,55,7,55,"NW_BIGFARM_STABLE_01");
};

