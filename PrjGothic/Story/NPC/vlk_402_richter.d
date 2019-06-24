
instance VLK_402_RICHTER(NPC_DEFAULT)
{
	name[0] = "Судья";
	guild = GIL_VLK;
	id = 402;
	voice = 10;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_NORMAL;
	b_createambientinv(self);
	CreateInvItems(self,itke_richter,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_RICHTER,BODYTEX_N,itar_judge);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_402;
};


func void rtn_start_402()
{
	ta_read_bookstand(8,0,18,45,"NW_CITY_RICHTER_BED");
	ta_sit_throne(18,45,22,0,"NW_CITYHALL_PRIVATE_THRONE");
	ta_sit_throne(22,0,1,0,"NW_CITY_RICHTER");
	ta_sleep(1,0,8,0,"NW_CITY_RICHTER_BED");
};

