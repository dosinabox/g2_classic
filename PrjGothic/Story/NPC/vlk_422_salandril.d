
instance VLK_422_SALANDRIL(NPC_DEFAULT)
{
	name[0] = "Саландрил";
	guild = GIL_VLK;
	id = 422;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_dagger);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_WEAK_ASGHAN,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_422;
};


func void rtn_start_422()
{
	ta_stand_armscrossed(8,0,10,0,"NW_CITY_SALANDRIL");
	ta_potion_alchemy(10,0,13,0,"NW_CITY_SALANDRIL");
	ta_read_bookstand(13,0,15,0,"NW_CITY_SHOP_SALANDRIL_03");
	ta_stand_armscrossed(15,0,17,0,"NW_CITY_SALANDRIL");
	ta_potion_alchemy(17,0,19,0,"NW_CITY_SALANDRIL");
	ta_read_bookstand(19,0,22,0,"NW_CITY_SHOP_SALANDRIL_03");
	ta_sleep(22,0,8,0,"NW_CITY_SHOP_SALANDRIL_BED");
};

func void rtn_klosterurteil_422()
{
	ta_stand_armscrossed(8,0,22,0,"ALTAR");
	ta_stand_armscrossed(22,0,8,0,"ALTAR");
};

