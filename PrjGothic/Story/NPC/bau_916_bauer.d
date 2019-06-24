
instance BAU_916_BAUER(NPC_DEFAULT)
{
	name[0] = NAME_BAUER;
	guild = GIL_BAU;
	id = 916;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_P_NORMALBALD,BODYTEX_P,itar_bau_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_start_916;
};


func void rtn_start_916()
{
	ta_smalltalk(8,0,22,0,"NW_BIGFARM_KITCHEN_02");
	ta_smalltalk(22,0,8,0,"NW_BIGFARM_KITCHEN_02");
};

