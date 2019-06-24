
instance VLK_462_THORBEN(NPC_DEFAULT)
{
	name[0] = "Торбен";
	guild = GIL_VLK;
	id = 462;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	CreateInvItems(self,itke_lockpick,12);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL04,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_462;
};


func void rtn_start_462()
{
	ta_saw(6,0,9,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_repair_hut(9,0,13,5,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_smalltalk(13,5,14,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_repair_hut(14,0,16,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_saw(16,0,17,5,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_smalltalk(17,5,18,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_saw(18,0,19,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_repair_hut(19,0,20,0,"NW_CITY_MERCHANT_SHOP01_FRONT_01");
	ta_sit_bench(20,0,0,0,"NW_CITY_MERCHANT_HUT_01_FRONT");
	ta_sleep(0,0,6,0,"NW_CITY_BED_BOSPER");
};

