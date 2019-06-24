
instance VLK_4003_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 4003;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe1",FACEBABE_N_OLDBROWN,BODYTEX_N,itar_vlkbabe_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4003;
};


func void rtn_start_4003()
{
	ta_sleep(22,0,7,45,"NW_CITY_REICH02_BED_02");
	ta_cook_stove(7,45,10,0,"NW_CITY_REICH02_COOK");
	ta_sit_chair(10,0,12,30,"NW_CITY_REICH02_SIT");
	ta_stand_sweeping(12,30,14,0,"NW_CITY_REICH02_SIT");
	ta_cook_stove(14,0,16,0,"NW_CITY_REICH02_COOK");
	ta_sit_chair(16,0,18,0,"NW_CITY_REICH02_SIT");
	ta_stand_sweeping(18,0,19,0,"NW_CITY_REICH02_SIT");
	ta_smalltalk(19,0,22,0,"NW_CITY_SMALLTALK_02");
};

