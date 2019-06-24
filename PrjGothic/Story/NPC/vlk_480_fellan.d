
instance VLK_480_FELLAN(NPC_DEFAULT)
{
	name[0] = "Феллан";
	guild = GIL_VLK;
	id = 480;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	aivar[AIV_TOUGHGUY] = TRUE;
	aivar[AIV_TOUGHGUYNEWSOVERRIDE] = TRUE;
	b_setattributestochapter(self,0);
	fight_tactic = FAI_HUMAN_STRONG;
	EquipItem(self,itmw_shortsword2);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMAL19,BODYTEX_N,itar_vlk_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_480;
};


func void rtn_start_480()
{
	ta_repair_hut(4,30,8,0,"NW_CITY_PATH_HABOUR_09");
	ta_repair_hut(8,0,12,0,"NW_CITY_HABOUR_REPAIR_04");
	ta_repair_hut(12,0,16,0,"NW_CITY_PATH_HABOUR_09");
	ta_repair_hut(16,0,20,0,"NW_CITY_HABOUR_REPAIR_04");
	ta_repair_hut(20,0,1,30,"NW_CITY_PATH_HABOUR_09");
	ta_sleep(1,30,4,30,"NW_CITY_HABOUR_HUT_05_BED_01");
};

func void rtn_ohnehammer_480()
{
	ta_sit_bench(6,0,23,0,"NW_CITY_HABOUR_REPAIR_03");
	ta_sleep(23,0,6,0,"NW_CITY_HABOUR_HUT_05_BED_01");
};

