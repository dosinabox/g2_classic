
instance VLK_404_LUTERO(NPC_DEFAULT)
{
	name[0] = "Лютеро";
	guild = GIL_VLK;
	id = 404;
	voice = 13;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,4);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_1h_vlk_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_P_NORMAL02,BODYTEX_P,itar_governor);
	Mdl_SetModelFatness(self,3);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_404;
};


func void rtn_start_404()
{
	ta_smalltalk(8,0,12,0,"NW_CITY_LUTERO");
	ta_sit_bench(12,0,15,0,"NW_CITY_UPTOWN_PATH_27");
	ta_smalltalk(15,0,18,0,"NW_CITY_LUTERO");
	ta_sit_bench(18,0,20,0,"NW_CITY_UPTOWN_PATH_27");
	ta_read_bookstand(20,0,22,0,"NW_CITY_LUTERO_READ");
	ta_sit_throne(22,0,0,0,"NW_CITY_UPTOWN_HUT_04_05");
	ta_sleep(0,0,8,0,"NW_CITY_LUTERO_BED");
};

