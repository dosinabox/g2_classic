
instance PC_MAGE_NW(NPC_DEFAULT)
{
	name[0] = "Милтен";
	guild = GIL_KDF;
	id = 12;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_FRIEND;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_STRONG;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_MILTEN,BODYTEX_N,itar_kdf_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_12;
};


func void rtn_start_12()
{
	ta_stand_guarding(8,0,23,0,"NW_MONASTERY_MILTEN");
	ta_stand_guarding(23,0,8,0,"NW_MONASTERY_MILTEN");
};

func void rtn_waitforship_12()
{
	ta_smalltalk(8,0,23,0,"NW_CITY_WAY_TO_SHIP_19");
	ta_smalltalk(23,0,8,0,"NW_CITY_WAY_TO_SHIP_19");
};

func void rtn_shipoff_12()
{
	ta_stand_guarding(8,0,23,0,"NW_MONASTERY_ENTRY_01");
	ta_stand_guarding(23,0,8,0,"NW_MONASTERY_ENTRY_01");
};

func void rtn_ship_12()
{
	ta_smalltalk(8,0,23,0,"SHIP_CREW_19");
	ta_smalltalk(23,0,8,0,"SHIP_CREW_19");
};

