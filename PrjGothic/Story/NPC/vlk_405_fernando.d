
instance VLK_405_FERNANDO(NPC_DEFAULT)
{
	name[0] = "Фернандо";
	guild = GIL_VLK;
	id = 405;
	voice = 14;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_mace);
	b_createambientinv(self);
	CreateInvItems(self,itse_goldpocket100,1);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_CORRISTO,BODYTEX_N,itar_governor);
	Mdl_SetModelFatness(self,3);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_405;
};


func void rtn_start_405()
{
	ta_sleep(22,5,7,59,"NW_CITY_REICH02_BED_01");
	ta_smalltalk(7,59,11,0,"NW_CITY_UPTOWN_PATH_08");
	ta_stand_wp(11,0,14,59,"NW_CITY_UPTOWN_PATH_04");
	ta_smalltalk(14,59,18,0,"NW_CITY_UPTOWN_PATH_08");
	ta_read_bookstand(18,0,20,0,"NW_CITY_REICH02_READ");
	ta_read_bookstand(20,0,22,5,"NW_CITY_REICH02_READ");
};

func void rtn_wait_405()
{
	ta_smalltalk(7,59,11,0,"NW_CITY_UPTOWN_PATH_08");
	ta_stand_wp(11,0,14,59,"NW_CITY_UPTOWN_PATH_04");
	ta_smalltalk(14,59,18,0,"NW_CITY_UPTOWN_PATH_08");
	ta_stand_wp(18,0,7,59,"NW_CITY_UPTOWN_PATH_04");
};

