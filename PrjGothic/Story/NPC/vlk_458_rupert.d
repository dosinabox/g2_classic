
instance VLK_458_RUPERT(NPC_DEFAULT)
{
	name[0] = "Руперт";
	guild = GIL_VLK;
	id = 458;
	voice = 3;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_vlk_dagger);
	CreateInvItems(self,itfo_apple,12);
	CreateInvItems(self,itfo_bread,5);
	CreateInvItems(self,itfo_milk,5);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL20,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Tired.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_458;
};


func void rtn_start_458()
{
	ta_stand_sweeping(5,0,6,0,"NW_CITY_MAINSTREET_02");
	ta_stand_wp(6,0,9,30,"NW_CITY_MERCHANT_TRADE_01");
	ta_stand_sweeping(9,30,10,0,"NW_CITY_MAINSTREET_02");
	ta_stand_wp(10,0,12,55,"NW_CITY_MERCHANT_TRADE_01");
	ta_pee(12,55,13,30,"NW_CITY_MERCHANT_TRADE_03");
	ta_stand_wp(14,0,15,30,"NW_CITY_MERCHANT_TRADE_01");
	ta_stand_sweeping(15,30,16,0,"NW_CITY_MAINSTREET_02");
	ta_stand_wp(16,0,16,25,"NW_CITY_MERCHANT_TRADE_01");
	ta_pee(16,25,16,30,"NW_CITY_MERCHANT_TRADE_03");
	ta_stand_wp(16,30,17,30,"NW_CITY_MERCHANT_TRADE_01");
	ta_stand_sweeping(17,30,18,0,"NW_CITY_MAINSTREET_02");
	ta_stand_wp(18,0,20,0,"NW_CITY_MERCHANT_TRADE_01");
	ta_sit_chair(20,0,0,0,"NW_CITY_SHOP02_SIT");
	ta_sleep(0,0,5,0,"NW_CITY_BED_RUPERT");
};

