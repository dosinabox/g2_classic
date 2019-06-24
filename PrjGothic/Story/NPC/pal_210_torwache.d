
instance PAL_210_TORWACHE(NPC_DEFAULT)
{
	name[0] = NAME_RITTER;
	guild = GIL_PAL;
	id = 210;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_2h_pal_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_ASGHAN,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,55);
	daily_routine = rtn_start_210;
};


func void rtn_start_210()
{
	ta_stand_guarding(8,0,23,0,"NW_CITY_CITYHALL_ENTRY_01");
	ta_stand_guarding(23,0,8,0,"NW_CITY_CITYHALL_ENTRY_01");
};

