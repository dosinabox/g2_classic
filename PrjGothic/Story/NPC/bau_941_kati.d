
instance BAU_941_KATI(NPC_DEFAULT)
{
	name[0] = "Кати";
	guild = GIL_OUT;
	id = 941;
	voice = 16;
	flags = NPC_FLAG_IMMORTAL;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_axe);
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe8",FACEBABE_N_LILO,BODYTEXBABE_N,itar_baubabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,15);
	daily_routine = rtn_prestart_941;
};


func void rtn_prestart_941()
{
	ta_stand_armscrossed(8,0,22,0,"NW_FARM2_PATH_01");
	ta_stand_armscrossed(22,0,8,0,"NW_FARM2_PATH_01");
};

func void rtn_start_941()
{
	ta_cook_stove(5,0,10,0,"NW_FARM2_HOUSE_IN_04");
	ta_sit_bench(10,0,12,0,"NW_FARM2_BENCH_02");
	ta_cook_stove(12,0,20,55,"NW_FARM2_HOUSE_IN_04");
	ta_roast_scavenger(20,55,23,59,"NW_FARM2_BBQ");
	ta_sleep(23,59,5,0,"NW_FARM2_HOUSE_IN_02");
};

