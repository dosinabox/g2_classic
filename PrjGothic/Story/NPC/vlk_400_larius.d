
instance VLK_400_LARIUS(NPC_DEFAULT)
{
	name[0] = "Лариус";
	guild = GIL_VLK;
	id = 400;
	voice = 1;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_WEAK_CIPHER_ALT,BODYTEX_N,itar_larius);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_400;
};


func void rtn_start_400()
{
	ta_sit_throne(8,0,12,0,"NW_CITY_LARIUS");
	ta_read_bookstand(12,0,15,0,"NW_CITY_LARIUS");
	ta_sit_throne(15,0,19,0,"NW_CITY_LARIUS");
	ta_sit_throne(19,0,22,0,"NW_CITYHALL_PRIVATE_THRONE");
	ta_sleep(22,0,8,0,"NW_CITY_LARIUS_BED");
};

