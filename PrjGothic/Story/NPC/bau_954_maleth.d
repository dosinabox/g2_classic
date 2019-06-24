
instance BAU_954_MALETH(NPC_DEFAULT)
{
	name[0] = "Малет";
	guild = GIL_OUT;
	id = 954;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART_DEXTER,BODYTEX_N,itar_bau_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,25);
	daily_routine = rtn_start_954;
};


func void rtn_start_954()
{
	ta_stand_guarding(8,0,22,0,"NW_FARM1_PATH_CITY_SHEEP_09");
	ta_sleep(22,0,8,0,"NW_FARM1_INSTABLE_BED");
};

