
instance VLK_4200_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 4200;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe",FACEBABE_N_PINKHAIR,BODYTEX_N,itar_vlkbabe_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4200;
};


func void rtn_start_4200()
{
	ta_smalltalk(8,0,22,0,"NW_CITY_MAINSTREET_05_B");
	ta_sleep(22,0,8,0,"NW_CITY_UPTOWN_PATH_08");
};

