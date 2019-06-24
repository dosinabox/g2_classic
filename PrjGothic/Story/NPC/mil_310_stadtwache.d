
instance MIL_310_STADTWACHE(NPC_DEFAULT)
{
	name[0] = NAME_STADTWACHE;
	guild = GIL_MIL;
	id = 310;
	voice = 7;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,6);
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_mil_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Psionic",FACE_N_RAVEN,BODYTEX_N,itar_mil_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_310;
};


func void rtn_start_310()
{
	ta_guard_passage(8,0,22,0,"NW_CITY_ENTRANCE_GUARD_02");
	ta_guard_passage(22,0,8,0,"NW_CITY_ENTRANCE_GUARD_02");
};

