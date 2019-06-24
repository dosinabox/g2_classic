
instance VLK_414_HANNA(NPC_DEFAULT)
{
	name[0] = "Ханна";
	guild = GIL_VLK;
	id = 414;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe1",FACEBABE_N_WHITECLOTH,BODYTEX_N,itar_vlkbabe_l);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,35);
	daily_routine = rtn_start_414;
};


func void rtn_start_414()
{
	ta_stand_armscrossed(8,0,22,0,"NW_CITY_HANNA");
	ta_stand_armscrossed(22,0,8,0,"NW_CITY_HANNA");
};

