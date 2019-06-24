
instance KDF_511_DARON(NPC_DEFAULT)
{
	name[0] = "Дарон";
	guild = GIL_VLK;
	id = 511;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_MAGICUSER] = MAGIC_ALWAYS;
	b_setattributestochapter(self,5);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_nov_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Thief",FACE_N_RAVEN,BODYTEX_N,itar_kdf_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Mage.mds");
	b_givenpctalents(self);
	b_setfightskills(self,80);
	daily_routine = rtn_start_511;
};


func void rtn_start_511()
{
	ta_stand_guarding(7,35,11,35,"NW_CITY_MERCHANT_PATH_29_B");
	ta_stand_eating(11,35,12,5,"NW_CITY_MERCHANT_PATH_28_F");
	ta_stand_guarding(12,5,12,35,"MARKT");
	ta_stand_drinking(12,35,13,5,"NW_CITY_MERCHANT_PATH_28_D");
	ta_stand_eating(13,5,13,25,"NW_CITY_MERCHANT_PATH_30");
	ta_stand_guarding(13,25,13,55,"NW_CITY_MERCHANT_PATH_36_B");
	ta_stand_guarding(13,55,18,5,"NW_CITY_MERCHANT_PATH_29_B");
	ta_stand_drinking(18,5,19,5,"NW_CITY_MERCHANT_PATH_28_D");
	ta_stand_guarding(19,5,20,5,"NW_CITY_MERCHANT_PATH_29_B");
	ta_sit_throne(20,5,1,5,"NW_CITY_BED_ZURIS");
	ta_sleep(1,5,7,35,"NW_CITY_BED_DARON");
};

