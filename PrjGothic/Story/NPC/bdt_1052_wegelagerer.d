
instance BDT_1052_WEGELAGERER(NPC_DEFAULT)
{
	name[0] = "Ѕрод€га";
	guild = GIL_BDT;
	id = 1052;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_ENEMYOVERRIDE] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL07,BODYTEX_N,itar_bdt_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	start_aistate = zs_smalltalk;
};

