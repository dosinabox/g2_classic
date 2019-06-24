
instance VLK_4000_BUERGER(NPC_DEFAULT)
{
	name[0] = NAME_BUERGER;
	guild = GIL_VLK;
	id = 4000;
	voice = 6;
	flags = 0;
	npctype = NPCTYPE_AMBIENT;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_NORMALBART21,BODYTEX_N,itar_vlk_h);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,30);
	daily_routine = rtn_start_4000;
};


func void rtn_start_4000()
{
	ta_sleep(22,0,8,0,"NW_CITY_UPTOWN_HUT_05_BED_01");
	ta_smalltalk(8,0,12,0,"NW_CITY_UPTOWN_HUT_04_ENTRY");
	ta_sit_bench(12,0,15,0,"NW_CITY_GUARD_01");
	ta_smalltalk(15,0,18,0,"NW_CITY_UPTOWN_HUT_04_ENTRY");
	ta_sit_bench(18,0,20,0,"NW_CITY_GUARD_01");
	ta_sit_bench(20,0,22,0,"NW_CITY_UPTOWN_PATH_27");
};

