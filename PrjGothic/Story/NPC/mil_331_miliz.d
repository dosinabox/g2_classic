
instance MIL_331_MILIZ(NPC_DEFAULT)
{
	name[0] = NAME_MILIZ;
	guild = GIL_MIL;
	id = 331;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL04,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_start_331;
};


func void rtn_start_331()
{
	ta_practice_sword(7,2,21,2,"NW_CITY_HABOUR_KASERN_CENTRE_04");
	ta_read_bookstand(21,2,0,2,"NW_CITY_KASERN_BARRACK02_04");
	ta_sleep(0,2,7,2,"NW_CITY_BARRACK01_BED_01");
};

