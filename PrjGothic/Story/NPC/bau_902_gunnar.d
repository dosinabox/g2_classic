
instance BAU_902_GUNNAR(NPC_DEFAULT)
{
	name[0] = "Гуннар";
	guild = GIL_BAU;
	id = 902;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART03,BODYTEX_N,itar_bau_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,25);
	daily_routine = rtn_start_902;
};


func void rtn_start_902()
{
	ta_smalltalk(8,0,19,59,"NW_BIGFARM_STABLE_OUT_01");
	ta_sit_chair(19,59,8,0,"NW_BIGFARM_STABLE_06");
};

