
instance VLK_450_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 450;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_HEREK,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_450;
};


func void rtn_start_450()
{
	ta_stand_armscrossed(5,0,20,0,"NW_CITY_MERCHANT_PATH_15");
	ta_smalltalk(20,0,3,50,"NW_CITY_MERCHANT_STAND_01");
	ta_smalltalk(3,50,5,0,"NW_CITY_TAVERN_IN_06");
};

func void rtn_vatrasaway_450()
{
	ta_smalltalk(5,0,20,0,"NW_CITY_MERCHANT_PATH_14");
	ta_smalltalk(20,0,5,0,"NW_CITY_MERCHANT_STAND_01");
};

