
instance BAU_983_DRAGOMIR(NPC_DEFAULT)
{
	name[0] = "Драгомир";
	guild = GIL_OUT;
	id = 983;
	voice = 12;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	EquipItem(self,itrw_mil_crossbow);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_TOUGH_LEE,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_983;
};


func void rtn_start_983()
{
	ta_sit_bench(8,0,23,0,"NW_TAVERNE_TROLLAREA_MONSTER_02_01");
	ta_sit_bench(23,0,8,0,"NW_TAVERNE_TROLLAREA_MONSTER_02_01");
};

