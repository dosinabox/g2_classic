
instance SLD_807_BULLCO(NPC_DEFAULT)
{
	name[0] = "Булко";
	guild = GIL_SLD;
	id = 807;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	aivar[AIV_IGNORE_SHEEPKILLER] = TRUE;
	aivar[AIV_IGNORE_THEFT] = TRUE;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_sld_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL_OLLI_KAHN,BODYTEX_N,itar_sld_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_807;
};


func void rtn_start_807()
{
	ta_sit_chair(8,0,22,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	ta_sit_chair(22,0,8,0,"NW_BIGFARM_KITCHEN_SYLVIO");
};

func void rtn_pee_807()
{
	ta_pee(8,0,8,15,"NW_BIGFARM_TREE");
	ta_sit_chair(8,15,10,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	ta_pee(10,0,10,15,"NW_BIGFARM_TREE");
	ta_sit_chair(10,15,12,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	ta_pee(12,0,12,15,"NW_BIGFARM_TREE");
	ta_sit_chair(12,15,14,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	ta_pee(14,0,14,15,"NW_BIGFARM_TREE");
	ta_sit_chair(14,15,16,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	ta_pee(16,0,16,15,"NW_BIGFARM_TREE");
	ta_sit_chair(16,15,18,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	ta_pee(18,0,18,15,"NW_BIGFARM_TREE");
	ta_sit_chair(18,15,20,0,"NW_BIGFARM_KITCHEN_SYLVIO");
	ta_pee(20,0,20,15,"NW_BIGFARM_TREE");
	ta_sit_chair(20,15,8,0,"NW_BIGFARM_KITCHEN_SYLVIO");
};

func void rtn_tot_807()
{
	ta_sleep(8,0,23,0,"TOT");
	ta_sleep(23,0,8,0,"TOT");
};

