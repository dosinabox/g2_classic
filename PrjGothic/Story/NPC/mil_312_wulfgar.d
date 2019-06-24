
instance MIL_312_WULFGAR(NPC_DEFAULT)
{
	name[0] = "Âףכüפדאנ";
	guild = GIL_MIL;
	id = 312;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART06,BODYTEX_N,itar_mil_m);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_prestart_312;
};


func void rtn_prestart_312()
{
	ta_stand_armscrossed(6,55,21,0,"NW_CITY_HABOUR_KASERN_CENTRE_01");
	ta_sit_throne(21,0,5,0,"NW_CITY_KASERN_BARRACK02_02");
	ta_practice_sword(5,0,6,55,"NW_CITY_HABOUR_KASERN_CENTRE_01");
};

func void rtn_start_312()
{
	ta_stand_armscrossed(6,55,21,0,"NW_CITY_HABOUR_KASERN_CENTRE_01");
	ta_sit_throne(21,0,0,7,"NW_CITY_KASERN_BARRACK02_02");
	ta_smalltalk(0,7,5,0,"NW_CITY_HABOUR_KASERN_OFFICE");
	ta_practice_sword(5,0,6,55,"NW_CITY_HABOUR_KASERN_CENTRE_01");
};

