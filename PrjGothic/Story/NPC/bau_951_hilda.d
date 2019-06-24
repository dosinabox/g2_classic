
instance BAU_951_HILDA(NPC_DEFAULT)
{
	name[0] = "Хильда";
	guild = GIL_OUT;
	id = 951;
	voice = 17;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,1);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_bau_mace);
	b_createambientinv(self);
	b_setnpcvisual(self,FEMALE,"Hum_Head_Babe8",FACEBABE_N_WHITECLOTH,BODYTEXBABE_N,itar_baubabe_l);
	Mdl_SetModelFatness(self,0);
	Mdl_ApplyOverlayMds(self,"Humans_Babe.mds");
	b_givenpctalents(self);
	b_setfightskills(self,10);
	daily_routine = rtn_start_951;
};


func void rtn_start_951()
{
	ta_cook_stove(8,0,22,0,"NW_FARM1_INHOUSE_02");
	ta_sleep(22,0,8,0,"NW_FARM1_INHOUSE_BED_02");
};

func void rtn_krank_951()
{
	ta_sleep(8,0,22,0,"NW_FARM1_INHOUSE_BED_02");
	ta_sleep(22,0,8,0,"NW_FARM1_INHOUSE_BED_02");
};

