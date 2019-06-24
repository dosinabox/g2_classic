
instance VLK_2001_SYRA(NPC_DEFAULT)
{
	name[0] = "Сира";
	guild = GIL_VLK;
	id = 2001;
	voice = 16;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	CreateInvItems(self,itpo_health_02,1);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_N_PINKHAIR,BODYTEX_N,NO_ARMOR);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_2001;
};


func void rtn_start_2001()
{
	ta_stand_eating(22,0,6,0,"XXX");
	ta_sleep(6,0,22,0,"XXX");
};

