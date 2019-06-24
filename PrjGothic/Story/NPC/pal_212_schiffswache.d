
instance PAL_212_SCHIFFSWACHE(NPC_DEFAULT)
{
	name[0] = NAME_SCHIFFSWACHE;
	guild = GIL_PAL;
	id = 212;
	voice = 8;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_NAILED;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_L_SCATTY,BODYTEX_L,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,65);
	daily_routine = rtn_start_212;
};


func void rtn_start_212()
{
	ta_guard_passage(8,0,23,0,"NW_CITY_SHIP_GUARD_02");
	ta_guard_passage(23,0,8,0,"NW_CITY_SHIP_GUARD_02");
};

func void rtn_shipfree_212()
{
	ta_smalltalk(8,0,23,0,"NW_CITY_PALCAMP_01");
	ta_smalltalk(23,0,8,0,"NW_CITY_PALCAMP_01");
};

