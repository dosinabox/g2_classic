
instance VLK_4002_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 4002;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe1",FACEBABE_N_ANNE,BODYTEX_N,itar_vlkbabe_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4002;
};


func void rtn_start_4002()
{
	ta_cook_stove(6,0,8,0,"NW_CITY_RICHTER_COOK");
	ta_stand_sweeping(8,0,10,0,"NW_CITY_UPTOWN_JUDGE_02");
	ta_smalltalk(10,0,14,0,"NW_CITY_UPTOWN_PATH_15");
	ta_cook_stove(14,0,16,0,"NW_CITY_RICHTER_COOK");
	ta_sit_chair(16,0,18,0,"NW_CITY_RICHTER");
	ta_stand_sweeping(18,0,20,0,"NW_CITY_UPTOWN_JUDGE_02");
	ta_sit_throne(20,0,23,0,"NW_CITY_UPTOWN_JUDGE_THRONE_01");
	ta_sleep(23,0,6,0,"NW_CITY_RICHTER_BED_WEIB");
};

