
instance BAU_940_AKIL(NPC_DEFAULT)
{
	name[0] = "Акил";
	guild = GIL_OUT;
	id = 940;
	voice = 13;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,2);
	attribute[ATR_HITPOINTS] = 300;
	attribute[ATR_HITPOINTS_MAX] = 300;
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,MALE,"Hum_Head_FatBald",FACE_N_NORMALBART_GRIM,BODYTEX_N,itar_bau_m);
	Mdl_SetModelFatness(self,1);
	Mdl_ApplyOverlayMds(self,"Humans_Relaxed.mds");
	b_givenpctalents(self);
	b_setfightskills(self,40);
	daily_routine = rtn_prestart_940;
};


func void rtn_prestart_940()
{
	ta_smalltalk(8,0,22,0,"NW_FARM2_PATH_02");
	ta_smalltalk(22,0,8,0,"NW_FARM2_PATH_02");
};

func void rtn_start_940()
{
	ta_sit_bench(5,0,10,0,"NW_FARM2_BENCH_02");
	ta_stand_guarding(10,0,12,0,"NW_FARM2_PATH_01_B");
	ta_sit_bench(12,0,14,0,"NW_FARM2_BENCH_02");
	ta_stand_guarding(14,0,16,0,"NW_FARM2_FIELD_01");
	ta_sit_bench(16,0,21,0,"NW_FARM2_BENCH_02");
	ta_sit_bench(21,0,0,0,"NW_FARM2_OUT_06");
	ta_sleep(0,0,5,0,"NW_FARM2_HOUSE_IN_02");
};

