
instance MIL_303_TORWACHE(NPC_DEFAULT)
{
	name[0] = "Стражник у двери";
	guild = GIL_MIL;
	id = 303;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL_SLY,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_303;
};


func void rtn_start_303()
{
	ta_guard_passage(8,0,23,0,"NW_CITY_GUARDOFFICE_GUARD_02");
	ta_guard_passage(23,0,8,0,"NW_CITY_GUARDOFFICE_GUARD_02");
};

