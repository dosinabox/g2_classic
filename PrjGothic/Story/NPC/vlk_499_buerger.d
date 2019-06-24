
instance VLK_499_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 499;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_BAALNETBEK,BODYTEX_N,itar_vlk_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_499;
};


func void rtn_start_499()
{
	ta_stand_eating(6,0,8,0,"NW_CITY_MERCHANT_TRADE_04");
	ta_stand_drinking(8,0,10,0,"NW_CITY_UPTOWN_PATH_27");
	ta_stand_eating(10,0,12,0,"NW_CITY_MERCHANT_TRADE_04");
	ta_sit_bench(12,0,14,0,"NW_CITY_UPTOWN_PATH_03_C");
	ta_stand_eating(14,0,16,0,"NW_CITY_MERCHANT_TRADE_04");
	ta_sit_bench(16,0,18,0,"NW_CITY_GUARD_01");
	ta_stand_eating(18,0,19,55,"NW_CITY_MERCHANT_TRADE_04");
	ta_sit_bench(19,55,22,0,"NW_CITY_GUARD_01");
	ta_sleep(22,0,6,0,"NW_CITY_UPTOWN_HUT_BED_02");
};

