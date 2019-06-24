
instance PAL_205_TORWACHE(NPC_DEFAULT)
{
	name[0] = NAME_TORWACHE;
	guild = GIL_PAL;
	id = 205;
	voice = 12;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	aivar[AIV_NEWSOVERRIDE] = TRUE;
	fight_tactic = FAI_HUMAN_MASTER;
	EquipItem(self,itmw_1h_pal_sword);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK05,BODYTEX_N,itar_pal_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,75);
	daily_routine = rtn_start_205;
};


func void rtn_start_205()
{
	ta_guard_passage(8,0,23,0,"NW_CITYHALL_GUARD_02");
	ta_guard_passage(23,0,8,0,"NW_CITYHALL_GUARD_02");
};

