
instance VLK_456_ABUYIN(NPC_DEFAULT)
{
	name[0] = "¿·ÛËÌ";
	guild = GIL_VLK;
	id = 456;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_NORMAL;
	EquipItem(self,itmw_1h_vlk_dagger);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_B_NORMAL_SHARKY,BODYTEX_B,itar_vlk_m);
	Mdl_SetModelFatness(self,0);
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_456;
};


func void rtn_start_456()
{
	ta_stand_armscrossed(7,20,1,20,"NW_CITY_MERCHANT_BENCH_02");
	ta_sleep(1,20,7,20,"NW_CITY_HOTEL_BED_05");
};

