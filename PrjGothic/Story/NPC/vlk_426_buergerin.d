
instance VLK_426_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 426;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe8",FACEBABE_N_LILO,BODYTEX_N,itar_vlkbabe_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_426;
};


func void rtn_start_426()
{
	ta_stand_armscrossed(5,5,20,5,"NW_CITY_MERCHANT_PATH_15");
	ta_smalltalk(20,5,3,55,"NW_CITY_MERCHANT_TAVERN01_01");
	ta_smalltalk(3,55,5,5,"NW_CITY_TAVERN_IN_05");
};

func void rtn_vatrasaway_426()
{
	ta_smalltalk(5,5,20,0,"NW_CITY_MERCHANT_STAND_01");
	ta_smalltalk(20,0,5,5,"NW_CITY_MERCHANT_TAVERN01_01");
};

