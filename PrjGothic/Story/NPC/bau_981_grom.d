
instance BAU_981_GROM(NPC_DEFAULT)
{
	name[0] = "Гром";
	guild = GIL_OUT;
	id = 981;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_sld_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_P_GILBERT,BODYTEX_P,itar_bau_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_981;
};


func void rtn_start_981()
{
	ta_saw(8,0,23,0,"NW_CASTLEMINE_TROLL_04_C");
	ta_sleep(23,0,8,0,"NW_CASTLEMINE_TROLL_04");
};

