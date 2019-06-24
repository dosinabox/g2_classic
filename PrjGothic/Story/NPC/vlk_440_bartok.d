
instance VLK_440_BARTOK(NPC_DEFAULT)
{
	name[0] = "Барток";
	guild = GIL_VLK;
	id = 440;
	voice = 4;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itrw_sld_bow);
	EquipItem(self,itmw_1h_sword_l_03);
	b_createambientinv(self);
	CreateInvItems(self,itrw_arrow,40);
	CreateInvItems(self,itpo_health_03,3);
	b_setnpcvisual(self,MALE,"Hum_Head_Fighter",FACE_N_IMPORTANT_ARTO,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Militia.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_440;
};


func void rtn_start_440()
{
	ta_stand_drinking(7,0,9,15,"NW_CITY_MERCHANT_PATH_33");
	ta_stand_eating(9,15,10,45,"NW_CITY_MERCHANT_PATH_30");
	ta_stand_drinking(10,45,15,15,"NW_CITY_MERCHANT_PATH_33");
	ta_stand_eating(15,15,16,45,"NW_CITY_MERCHANT_PATH_30");
	ta_stand_drinking(16,45,20,45,"NW_CITY_MERCHANT_PATH_33");
	ta_sit_bench(20,45,21,45,"NW_CITY_MERCHANT_TAVERN01_FRONT");
	ta_stand_drinking(21,45,0,45,"NW_CITY_MERCHANT_TAVERN01_FRONT");
	ta_sit_chair(0,45,4,45,"TAVERN02_B");
	ta_sit_bench(4,45,7,0,"NW_CITY_MERCHANT_TAVERN01_FRONT");
};

func void rtn_guidemitte_440()
{
	ta_guide_player(8,0,20,0,"NW_FARM1_CITYWALL_FOREST_03");
	ta_guide_player(20,0,8,0,"NW_FARM1_CITYWALL_FOREST_03");
};

func void rtn_guideende_440()
{
	ta_guide_player(8,0,20,0,"NW_FARM1_CITYWALL_FOREST_07");
	ta_guide_player(20,0,8,0,"NW_FARM1_CITYWALL_FOREST_07");
};

