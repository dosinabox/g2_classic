
instance VLK_419_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 419;
	voice = 1;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald.",FACE_N_NORMALBART_GRAHAM,BODYTEX_N,itar_vlk_h);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,35);
	daily_routine = rtn_start_419;
};


func void rtn_start_419()
{
	ta_sit_bench(7,0,11,0,"NW_CITY_UPTOWN_PATH_23");
	ta_stand_drinking(11,0,12,30,"NW_CITY_UPTOWN_HUT_02_ENTRY");
	ta_stand_eating(12,30,15,0,"NW_CITY_UPTOWN_PATH_17");
	ta_sit_bench(15,0,18,0,"NW_CITY_UPTOWN_PATH_23");
	ta_stand_drinking(18,0,20,0,"NW_CITY_UPTOWN_PATH_17");
	ta_sit_chair(20,0,23,0,"NW_CITY_UPTOWN_HUT_03_IN");
	ta_sleep(23,0,7,0,"NW_CITY_UPTOWN_HUT_03_BED");
};

