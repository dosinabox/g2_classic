
instance MIL_302_TORWACHE(NPC_DEFAULT)
{
	name[0] = NAME_TORWACHE;
	guild = GIL_MIL;
	id = 302;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMAL05,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_302;
};


func void rtn_start_302()
{
	ta_guard_passage(8,0,23,0,"NW_CITY_GUARDOFFICE_GUARD_01");
	ta_guard_passage(23,0,8,0,"NW_CITY_GUARDOFFICE_GUARD_01");
};

