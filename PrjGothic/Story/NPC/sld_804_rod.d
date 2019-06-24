
instance SLD_804_ROD(NPC_DEFAULT)
{
	name[0] = "Род";
	guild = GIL_SLD;
	id = 804;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_rod);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_TOUGHBART01,BODYTEX_N,itar_sld_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_804;
};


func void rtn_start_804()
{
	ta_smalltalk(7,55,22,55,"NW_BIGFARM_PATH_02");
	ta_sleep(22,55,7,55,"NW_BIGFARM_HOUSE_SLD_SLEEP");
};

func void rtn_tot_804()
{
	ta_sleep(8,0,23,0,"TOT");
	ta_sleep(23,0,8,0,"TOT");
};

