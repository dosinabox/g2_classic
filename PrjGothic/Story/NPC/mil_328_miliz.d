
instance MIL_328_MILIZ(NPC_DEFAULT)
{
	name[0] = NAME_WACHE;
	guild = GIL_NONE;
	id = 328;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_DROPDEADANDKILL] = TRUE;
	aivar[AIV_TOUGHGUY] = TRUE;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_mil_sword);
	CreateInvItems(self,itke_storage,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART17,BODYTEX_N,itar_leather_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,33);
	daily_routine = rtn_start_328;
};


func void rtn_start_328()
{
	ta_stand_guarding(8,0,23,0,"NW_CITY_HABOUR_HUT_03_IN_05");
	ta_stand_guarding(23,0,8,0,"NW_CITY_HABOUR_HUT_03_IN_05");
};

