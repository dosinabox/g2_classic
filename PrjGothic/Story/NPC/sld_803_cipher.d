
instance SLD_803_CIPHER(NPC_DEFAULT)
{
	name[0] = "Сифер";
	guild = GIL_SLD;
	id = 803;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	CreateInvItems(self,itrw_arrow,50);
	CreateInvItems(self,itrw_bow_l_02,1);
	CreateInvItems(self,itrw_sld_bow,1);
	CreateInvItems(self,itmw_2h_orcaxe_01,1);
	CreateInvItems(self,itlstorch,8);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART10,BODYTEX_N,itar_sld_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_803;
};


func void rtn_start_803()
{
	ta_smalltalk(7,35,23,35,"NW_BIGFARM_PATH_04_1");
	ta_sleep(23,35,7,35,"NW_BIGFARM_HOUSE_SLD_SLEEP");
};

func void rtn_tot_803()
{
	ta_sleep(8,0,23,0,"TOT");
	ta_sleep(23,0,8,0,"TOT");
};

