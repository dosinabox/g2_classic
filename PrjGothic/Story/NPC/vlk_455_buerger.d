
instance VLK_455_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 455;
	voice = 8;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Pony",FACE_N_NORMALBART06,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_455;
};


func void rtn_start_455()
{
	ta_stand_armscrossed(5,20,20,20,"NW_CITY_MERCHANT_PATH_14_C");
	ta_smalltalk(20,20,5,20,"NW_CITY_MERCHANT_SHOP03_FRONT_03");
};

func void rtn_vatrasaway_455()
{
	ta_sit_bench(7,20,20,20,"NW_CITY_MERCHANT_TAVERN01_FRONT");
	ta_smalltalk(20,20,7,20,"NW_CITY_MERCHANT_SHOP03_FRONT_03");
};

