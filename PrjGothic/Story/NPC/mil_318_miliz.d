
instance MIL_318_MILIZ(NPC_DEFAULT)
{
	name[0] = NAME_MILIZ;
	guild = GIL_MIL;
	id = 318;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART16,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_318;
};


func void rtn_start_318()
{
	ta_stand_guarding(6,45,21,5,"NW_CITY_HABOUR_KASERN_OFFICE");
	ta_smalltalk(21,5,23,59,"NW_CITY_HABOUR_KASERN_BARRACK02_IN");
	ta_sleep(23,59,6,45,"NW_CITY_BARRACK02_BED_WULFGAR");
};

