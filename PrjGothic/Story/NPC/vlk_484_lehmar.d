
instance VLK_484_LEHMAR(NPC_DEFAULT)
{
	name[0] = "Лемар";
	guild = GIL_VLK;
	id = 484;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	CreateInvItems(self,itwr_schuldenbuch,1);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_WHISTLER,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_484;
};


func void rtn_start_484()
{
	ta_sit_throne(6,30,0,30,"NW_CITY_HABOUR_HUT_08_IN_C");
	ta_sleep(0,30,6,30,"NW_CITY_HABOUR_HUT_08_BED_02");
};

