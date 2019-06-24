
instance VLK_403_GERBRANDT(NPC_DEFAULT)
{
	name[0] = "Гербрандт";
	guild = GIL_VLK;
	id = 403;
	voice = 10;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_mace);
	b_createambientinv(self);
	CreateInvItems(self,itse_goldpocket100,1);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_L_TOUGH_SANTINO,BODYTEX_L,itar_vlk_h);
	Mdl_SetModelFatness(self,2);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,50);
	daily_routine = rtn_start_403;
};


func void rtn_start_403()
{
	ta_sleep(22,0,8,0,"NW_CITY_GERBRANDT_BED_01");
	ta_smalltalk(8,0,11,0,"NW_CITY_SMALLTALK_02");
	ta_sit_bench(11,0,15,0,"NW_CITY_UPTOWN_PATH_23_B");
	ta_smalltalk(15,0,18,0,"NW_CITY_SMALLTALK_02");
	ta_sit_bench(18,0,22,0,"NW_CITY_UPTOWN_PATH_23_B");
};

func void rtn_waitfordiego_403()
{
	ta_sleep(22,0,8,0,"NW_CITY_GERBRANDT_BED_01");
	ta_stand_wp(8,0,22,0,"NW_CITY_UPTOWN_PATH_23");
};

func void rtn_newlife_403()
{
	ta_smalltalk(22,0,8,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	ta_smalltalk(8,0,11,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	ta_smalltalk(11,0,15,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	ta_smalltalk(15,0,18,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
	ta_smalltalk(18,0,22,0,"NW_CITY_HABOUR_POOR_AREA_PATH_03");
};

