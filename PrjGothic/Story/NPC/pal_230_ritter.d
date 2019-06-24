
instance PAL_230_RITTER(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 230;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_NORMALBART22,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_230;
};


func void rtn_start_230()
{
	ta_practice_sword(8,0,23,0,"NW_CITY_PALCAMP_14");
	ta_smalltalk(23,0,8,0,"NW_CITY_PALCAMP_14");
};

func void rtn_shipfree_230()
{
	ta_stand_wp(8,0,23,0,"NW_CITY_UPTOWNPARADE_08");
	ta_stand_wp(23,0,8,0,"NW_CITY_UPTOWNPARADE_08");
};

