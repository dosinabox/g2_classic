
instance SLD_802_BUSTER(NPC_DEFAULT)
{
	name[0] = "Бастер";
	guild = GIL_SLD;
	id = 802;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_sld_axe);
	EquipItem(self,itrw_sld_bow);
	CreateInvItems(self,itrw_arrow,10);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_DRAX,BODYTEX_N,itar_sld_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_802;
};


func void rtn_start_802()
{
	ta_smalltalk(7,0,21,0,"NW_BIGFARM_HUT_01");
	ta_sit_bench(21,0,7,0,"NW_BIGFARM_HUT_BENCH_02");
};

