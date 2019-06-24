
instance SLD_827_SOELDNER(NPC_DEFAULT)
{
	name[0] = NAME_SOELDNER;
	guild = GIL_SLD;
	id = 827;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_sld_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_TOUGH_SILAS,BODYTEX_B,itar_sld_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_827;
};


func void rtn_start_827()
{
	ta_smalltalk(7,2,20,58,"NW_BIGFARM_ALLEE_HUT");
	ta_sit_bench(20,58,1,0,"NW_BIGFARM_HUT_BENCH");
	ta_sleep(1,0,7,2,"NW_BIGFARM_HUTINSIDE_BED");
};

