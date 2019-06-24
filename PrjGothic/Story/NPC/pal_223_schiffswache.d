
instance PAL_223_SCHIFFSWACHE(NPC_DEFAULT)
{
	name[0] = NAME_SCHIFFSWACHE;
	guild = GIL_PAL;
	id = 223;
	voice = 4;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMALBART02,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_223;
};


func void rtn_start_223()
{
	ta_stand_guarding(8,0,23,0,"SHIP_DECK_37");
	ta_stand_guarding(23,0,8,0,"SHIP_DECK_37");
};

func void rtn_shipfree_223()
{
	ta_stand_wp(8,0,23,0,"NW_CITY_UPTOWNPARADE_12");
	ta_stand_wp(23,0,8,0,"NW_CITY_UPTOWNPARADE_12");
};

