
instance BDT_1050_LANDSTREICHER(NPC_DEFAULT)
{
	name[0] = "Ѕрод€га";
	guild = GIL_NONE;
	id = 1050;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_NORMAL02,BODYTEX_N,itar_bdt_h);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	start_aistate = zs_stand_armscrossed;
};

