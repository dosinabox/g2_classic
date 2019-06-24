
instance MIL_305_TORWACHE(NPC_DEFAULT)
{
	name[0] = NAME_TORWACHE;
	guild = GIL_MIL;
	id = 305;
	voice = 3;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_NORMAL01,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,0.5);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,60);
	daily_routine = rtn_start_305;
};


func void rtn_start_305()
{
	ta_guard_passage(8,0,22,0,"NW_CITY_UPTOWN_GUARD_02");
	ta_guard_passage(22,0,8,0,"NW_CITY_UPTOWN_GUARD_02");
};

