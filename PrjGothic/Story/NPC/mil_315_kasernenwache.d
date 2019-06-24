
instance MIL_315_KASERNENWACHE(NPC_DEFAULT)
{
	name[0] = NAME_MILIZ;
	guild = GIL_MIL;
	id = 315;
	voice = 7;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_TOUGH_SKIP,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_315;
};


func void rtn_start_315()
{
	ta_smith_sharp(7,5,20,59,"NW_CITY_KASERN_ARMORY_SHARP");
	ta_sit_campfire(20,59,0,3,"NW_CITY_BARRACK02_SMALLTALK_01");
	ta_sleep(0,3,7,5,"NW_CITY_BARRACK01_BED_RUGA");
};

