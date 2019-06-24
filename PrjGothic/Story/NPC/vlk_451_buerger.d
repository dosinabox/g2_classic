
instance VLK_451_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 451;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_dagger);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_LEFTY,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_451;
};


func void rtn_start_451()
{
	ta_smalltalk(6,10,13,0,"NW_CITY_MERCHANT_SHOP01_FRONT_03");
	ta_smalltalk(13,0,14,2,"NW_CITY_MAINSTREET_05");
	ta_smalltalk(14,2,17,0,"NW_CITY_MERCHANT_SHOP01_FRONT_03");
	ta_smalltalk(17,0,18,2,"NW_CITY_MAINSTREET_05");
	ta_smalltalk(18,2,20,10,"NW_CITY_MERCHANT_SHOP01_FRONT_03");
	ta_sit_chair(20,10,6,10,"NW_CITY_TAVERN_IN_05");
};

