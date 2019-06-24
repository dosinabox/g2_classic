
instance PAL_213_SCHIFFSWACHE(NPC_DEFAULT)
{
	name[0] = NAME_SCHIFFSWACHE;
	guild = GIL_PAL;
	id = 213;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_NAILED;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_B_CAVALORN,BODYTEX_B,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,68);
	daily_routine = rtn_start_213;
};


func void rtn_start_213()
{
	ta_guard_passage(8,0,23,0,"NW_CITY_SHIP_GUARD_01");
	ta_guard_passage(23,0,8,0,"NW_CITY_SHIP_GUARD_01");
};

func void rtn_shipfree_213()
{
	ta_smalltalk(8,0,23,0,"NW_CITY_PALCAMP_01");
	ta_smalltalk(23,0,8,0,"NW_CITY_PALCAMP_01");
};

