
instance VLK_428_BUERGERIN(NPC_DEFAULT)
{
	name[0] = NAME_BUERGERIN;
	guild = GIL_VLK;
	id = 428;
	voice = 16;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	b_createambientinv(self);
	EquipItem(self,itmw_1h_vlk_dagger);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe4",FACEBABE_N_VLKBLONDE,BODYTEX_N,itar_vlkbabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_428;
};


func void rtn_start_428()
{
	ta_stand_armscrossed(5,10,20,17,"NW_CITY_MERCHANT_PATH_14_C");
	ta_smalltalk(20,17,5,10,"NW_CITY_MERCHANT_PATH_32");
};

func void rtn_vatrasaway_428()
{
	ta_smalltalk(5,10,20,17,"NW_CITY_MERCHANT_PATH_14_A");
	ta_smalltalk(20,17,5,10,"NW_CITY_MERCHANT_PATH_32");
};

